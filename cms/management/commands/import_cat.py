import json
import os

from datetime import datetime as dt
from lxml import etree
from django.core.management.base import BaseCommand
from cms.models import (HomePage, Catalogue, CatalogueEntry,
                        Image)


class Command(BaseCommand):
    args = '<webapp_path webapp_path ...>'
    help = 'Imports XML data into Wagtail'

    xslt = None
    ns = None
    ns_meta = None

    def add_arguments(self, parser):
        parser.add_argument('webapp_path', type=str)
        parser.add_argument('homepage_pk', type=int)

    def handle(self, *args, **options):
        webapp_path = options['webapp_path']
        homepage_pk = options['homepage_pk']

        home_page = HomePage.objects.get(pk=homepage_pk)

        # Setup XSLT
        xslt_path = os.path.join(webapp_path, 'xslt', 'type01')
        xslt_tree = etree.parse(os.path.join(xslt_path, 'proj_type01_DR.xsl'))
        self.ns = {
            'xsl': 'http://www.w3.org/1999/XSL/Transform',
            'saxon': 'http://icl.com/saxon',
            'xhtml': 'http://www.w3.org/1999/xhtml',
        }

        self.ns_meta = {
            'mets': "http://www.loc.gov/METS/",
            'mods': "http://www.loc.gov/mods/v3",
            'xlink': "http://www.w3.org/1999/xlink",
            'xsi': "http://www.w3.org/2001/XMLSchema-instance"
        }

        output = xslt_tree.findall('xsl:output', self.ns)[0]
        output.set('method', 'html')
        self.xslt = xslt_tree

        structure = {
            'content_dir': 'source/xml/content/catalogue/',
            'metadata_dir': 'source/xml/mets/',
            'index': 'catalogue.xml',
            'exclude': ['catalogue_full.xml', 'catalogue_old.xml',
                        'catalogue_right.xml', 'catalogue.xml']
        }

        self._import_cat(webapp_path, structure, home_page)

    def _import_cat_entry(
            self, webapp_path, structure, catalogue_page, xml_file):

        # Populate our XML
        entry_xml = os.path.join(
            webapp_path, structure['content_dir'], xml_file
        )

        meta_xml = os.path.join(
            webapp_path, structure['metadata_dir'], xml_file
        )

        entry_tree = etree.parse(entry_xml)
        meta_tree = etree.parse(meta_xml)
        html = self._transform(entry_tree)

        # Create a catalogue entry

        # Title
        title = entry_tree.getroot().xpath(
            'teiHeader/fileDesc/titleStmt/title')[0].text

        self._log("Importing {}".format(title))

        # Subtitle
        subtitle = None
        subtitle_arr = entry_tree.getroot().xpath(
            "teiHeader/fileDesc/titleStmt/title[@type='sub']")
        if len(subtitle_arr):
            subtitle = subtitle_arr[0].text

        # Body
        body = etree.tostring(html.getroot().xpath(
            "//xhtml:div[@id='mainContent']",
            namespaces=self.ns)[0], encoding="UTF-8").decode('utf-8')

        catalogue_entry = CatalogueEntry()
        catalogue_entry.title = title
        catalogue_entry.subtitle = subtitle
        catalogue_entry.body = json.dumps([
            {'type': 'paragraph', 'value': body},
        ])

        catalogue_page.add_child(instance=catalogue_entry)
        catalogue_entry.save()

        # Check for sub-entries...

        sub_entries = meta_tree.getroot().xpath(
            "mets:dmdSec[@GROUPID='second-lvl']", namespaces=self.ns_meta)
        if len(sub_entries):
            # Create child pages
            for entry in sub_entries:
                title = entry.get('ID')
                self._log("Importing {}".format(title))
                subtitle = entry.xpath(
                    "mets:mdWrap/mets:xmlData/mods:titleInfo/mods:title",
                    namespaces=self.ns_meta)[0].text

                sub_entry = CatalogueEntry()
                sub_entry.title = title.replace('-', ' ')
                sub_entry.subtitle = subtitle

                catalogue_entry.add_child(instance=sub_entry)
                sub_entry.save()

                images = meta_tree.getroot().xpath(
                    "mets:dmdSec[@GROUPID='bottom-lvl'][contains(@ID,'{}')]".format(title), namespaces=self.ns_meta)  # noqa
                for image in images:
                    title = image.xpath(
                        "mets:mdWrap/mets:xmlData/mods:mods/mods:titleInfo/mods:title", namespaces=self.ns_meta)[0].text # noqa
                    self._log(" - adding image {}".format(title))
                    ident = image.xpath(
                        "mets:mdWrap/mets:xmlData/mods:mods/mods:identifier", namespaces=self.ns_meta)[0].text  # noqa

                    if title is None:
                        title = ident.split('-')[-1]

                    image_page = Image()
                    image_page.title = title
                    image_page.reference = ident
                    image_page.filename = '{}.jp2'.format(ident)

                    sub_entry.add_child(instance=image_page)
                    image_page.save()
        else:
            # Single with images
            images = meta_tree.getroot().xpath(
                "mets:dmdSec[@GROUPID='bottom-lvl']", namespaces=self.ns_meta)
            for image in images:
                title = image.xpath(
                    "mets:mdWrap/mets:xmlData/mods:mods/mods:titleInfo/mods:title", namespaces=self.ns_meta)[0].text  # noqa
                self._log(" - adding image {}".format(title))
                ident = image.xpath(
                    "mets:mdWrap/mets:xmlData/mods:mods/mods:identifier",
                    namespaces=self.ns_meta)[0].text

                if title is None:
                    title = ident.split('-')[-1]

                image_page = Image()
                image_page.title = title
                image_page.reference = ident
                image_page.filename = '{}.jp2'.format(ident)

                catalogue_entry.add_child(instance=image_page)
                image_page.save()

    def _import_cat(self, webapp_path, structure, home_page):
        self._log('Importing Catalogue')

        # Populate our catalogue XML
        catalogue_xml = os.path.join(
            webapp_path, structure['content_dir'], structure['index']
        )

        tree = etree.parse(catalogue_xml)
        html = self._transform(tree)

        # Title
        title = tree.getroot().xpath(
            'teiHeader/fileDesc/titleStmt/title')[0].text

        # Subtitle
        subtitle = None
        subtitle_arr = tree.getroot().xpath(
            "teiHeader/fileDesc/titleStmt/title[@type='sub']")
        if len(subtitle_arr):
            subtitle = subtitle_arr[0].text

        # Body
        body = etree.tostring(html.getroot().xpath(
            "//xhtml:div[@id='mainContent']",
            namespaces=self.ns)[0], encoding="UTF-8").decode('utf-8')

        catalogue_page = Catalogue()
        catalogue_page.title = title
        catalogue_page.subtitle = subtitle
        catalogue_page.body = json.dumps([
            {'type': 'paragraph', 'value': body},
        ])

        home_page.add_child(instance=catalogue_page)

        catalogue_page.save()

        # Now let's grab our actual data!

        # Populate list of XML files
        file_list = os.listdir(
            os.fsencode(os.path.join(webapp_path, structure['content_dir'])))
        file_list = [os.fsdecode(f) for f in file_list]

        file_list = [f for f in file_list if f.endswith('.xml')]

        # And filter them down...
        file_list = [f for f in file_list if f not in structure['exclude']]

        self._log("Found these XML files: {}".format(file_list))

        # Do the magic!
        for xml_file in file_list:
            self._import_cat_entry(
                webapp_path, structure, catalogue_page, xml_file)

    def _log(self, msg):
        print('{}: {}'.format(dt.now().strftime("%d/%m/%Y %H:%M"),
                              msg))

    def _transform(self, node):
        transform = etree.XSLT(self.xslt)
        html = transform(node)
        return html
