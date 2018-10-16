import json
import os

from datetime import datetime as dt
from lxml import etree
from django.core.management.base import BaseCommand
from wagtail.core.models import Page
from cms.models import HomePage, RichTextPage, Catalogue, CatalogueEntry


class Command(BaseCommand):
    args = '<webapp_path webapp_path ...>'
    help = 'Imports XML data into Wagtail'
    xslt = None
    ns = None
    home_page = None

    def add_arguments(self, parser):
        parser.add_argument('webapp_path', type=str)

    def handle(self, *args, **options):
        webapp_path = options['webapp_path']
        xml_path = os.path.join(webapp_path, 'source', 'xml', 'content')
        xslt_path = os.path.join(webapp_path, 'xslt', 'type01')

        # Setup XSLT
        xslt_tree = etree.parse(os.path.join(xslt_path, 'proj_type01_DR.xsl'))
        self.ns = {
            'xsl': 'http://www.w3.org/1999/XSL/Transform',
            'saxon': 'http://icl.com/saxon',
            'xhtml': 'http://www.w3.org/1999/xhtml',
        }

        output = xslt_tree.findall('xsl:output', self.ns)[0]
        output.set('method', 'html')
        self.xslt = xslt_tree

        structure = {
            'cms': [
                {
                    'dir': '',
                    'index': 'index.xml',
                    'exclude': [],
                },
                {
                    'dir': 'about',
                    'index': 'aboutproject.xml',
                    'exclude':
                    [
                        'index.xml',
                        'citation.xml',
                        'new1.xml',
                        'PREVmembers.xm'
                    ],
                },
                {
                    'dir': 'history',
                    'index': 'index.xml',
                    'exclude': [],
                },
                {
                    'dir': 'essays',
                    'index': 'digitalessays.xml',
                    'exclude': ['index.xml'],
                },
            ],
            'db': [
                {
                    'dir': 'catalogue',
                    'index': 'catalogue.xml',
                    'exclude':
                    [
                        'catalogue_full.xml',
                        'catalogue_old.xml',
                        'catalogue_right.xml'
                    ],
                },
            ]
        }

        self._import_cms(xml_path, structure['cms'])
        self._import_db(xml_path, structure['db'])

    def _import_cms(self, xml_path, structure):
        self._log('Importing XML from {}'.format(xml_path))

        root_page = Page.objects.get(path='0001')
        home_page = None
        parent_page = None

        for s in structure:
            directory = s['dir']
            index = s['index']
            exclude = s['exclude']

            self._log('Importing: {}'.format(directory))

            path = os.path.join(xml_path, directory)

            if directory == '':
                # Homepage
                self._log("Importing Homepage: {}".format(index))
                xml_file = os.path.join(path, index)
                parent_page = home_page = self._import_page(
                    root_page, HomePage, xml_file)
                self.home_page = home_page
            else:
                self._log("Importing Index: {}".format(index))
                xml_file = os.path.join(path, index)
                parent_page = self._import_page(
                    home_page, RichTextPage, xml_file)

            for file in os.listdir(path):
                if os.path.isfile(os.path.join(path, file)) and\
                        file.endswith(".xml") and\
                        file != index and\
                        file not in exclude:

                    self._log('Importing: {}/{}'.format(directory, file))
                    xml_file = os.path.join(path, file)
                    self._import_page(parent_page, RichTextPage, xml_file)

    def _import_db(self, xml_path, structure):
        self._log('Importing XML from {}'.format(xml_path))

        parent_page = None

        for s in structure:
            directory = s['dir']
            index = s['index']
            exclude = s['exclude']

            self._log('Importing DB: {}'.format(directory))

            # Catalogue
            path = os.path.join(xml_path, directory)

            self._log("Importing Catalogue: {}".format(index))
            xml_file = os.path.join(path, index)
            parent_page = self._import_page(
                self.home_page, Catalogue, xml_file)

            for file in os.listdir(path):
                if os.path.isfile(os.path.join(path, file)) and\
                        file.endswith(".xml") and\
                        file != index and\
                        file not in exclude:

                    self._log('Importing: {}/{}'.format(directory, file))
                    xml_file = os.path.join(path, file)
                    self._import_page(parent_page, CatalogueEntry, xml_file)

    def _import_page(self, parent, page_type, xml_file):
        tree = etree.parse(xml_file)

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
        html = self._transform(tree)
        body = etree.tostring(html.getroot().xpath(
            "//xhtml:div[@id='mainContent']",
            namespaces=self.ns)[0]).decode('utf-8')

        page = page_type()
        page.title = title
        if subtitle:
            page.subtitle = subtitle

        page.body = json.dumps([
            {'type': 'paragraph', 'value': body},
        ])

        parent.add_child(instance=page)
        page.save()

        return page

    def _log(self, msg):
        print('{}: {}'.format(dt.now().strftime("%d/%m/%Y %H:%M"),
                              msg))

    def _transform(self, node):
        transform = etree.XSLT(self.xslt)
        html = transform(node)
        return html
