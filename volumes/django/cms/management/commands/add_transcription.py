from django.core.management.base import BaseCommand
from django.core.files import File
from cms.models import (CatalogueEntry, Image, RichTextPage,
                        TranscriptionPage)
from wagtail.documents.models import Document
from PyPDF2 import PdfFileWriter, PdfFileReader
import os
import random
import re
import string


class Command(BaseCommand):
    help = 'Imports Transcriptions E.g. add_transcription "MSS 9" file.pdf'

    # Set this to ONLY import the text without processing/uploading files
    textonly = False
    temp_dir = "/tmp"
    file_path = None
    reference = None

    input_file = None
    catalogue_entry = None

    def add_arguments(self, parser):
        parser.add_argument('reference', type=str)
        parser.add_argument('file_path', type=str)

    def handle(self, *args, **options):
        self.reference = options['reference']
        self.file_path = options['file_path']

        self.input_file = PdfFileReader(open(self.file_path, "rb"))
        self.catalogue_entry = CatalogueEntry.objects.get(title=self.reference)
        
        
        transcription_page = RichTextPage.objects.get(
            slug='transcriptions')

        trans_page = TranscriptionPage()
        trans_page.title = self.reference
        trans_page.page = self.catalogue_entry

        with open(self.file_path, 'rb') as f:
            document = Document()
            document.title = 'Transcript: {}'.format(self.reference)
            document.file.save('Transcript {}.pdf'.format(
                self.reference), File(f), save=True)
            document.save()

            trans_page.transcription_pdf = document
        transcription_page.add_child(instance=trans_page)
        trans_page.save()

        num_of_pages = self.input_file.getNumPages()

        res_page_no = None
        res_outfile = None
        res_text = None

        for p in range(num_of_pages):
            page = self.input_file.getPage(p)
            page_text = page.extractText()

            m = re.findall(r"\[f\.\s?([0-9]+)([r,v]+)\]", page_text)

            if m:
                if res_page_no is not None:
                    self._process(res_page_no, res_outfile, res_text)

                res_page_no = "{}{}".format(m[0][0].zfill(3), m[0][1])
                res_outfile = PdfFileWriter()
                res_outfile.addPage(page)
                res_text = page_text

            else:
                # Add Page
                res_outfile.addPage(page)
                res_text = '{} {}'.format(res_text, page_text)

            if p == num_of_pages and res_page_no is not None:
                self._process(res_page_no, res_outfile, res_text)

    def _process(self, page_no, outfile, text):
        print('Processing: {} {}'.format(self.reference, page_no))

        image = Image.objects.descendant_of(
            self.catalogue_entry).get(
                reference__endswith=page_no)

        if not self.textonly:
            temp_filename = self._temp_filename()

            with open(temp_filename, 'wb') as out:
                outfile.write(out)

            # Create a Document
            with open(temp_filename, 'rb') as f:
                document = Document()
                document.title = 'Transcript: {}'.format(image.reference)
                document.file.save('Transcript {}.pdf'.format(
                    image.reference), File(f), save=True)
                document.save()

                image.transcription = text
                image.transcription_pdf = document
                image.save()

            # Delete the temporary file!
            os.remove(temp_filename)
        else:
            image.transcription = text
            image.save()

    def _temp_filename(self):
        return os.path.join(self.temp_dir,''.join(random.choice(string.ascii_uppercase + string.digits) for _ in range(20)))  # noqa
