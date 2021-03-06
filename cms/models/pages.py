from __future__ import unicode_literals

import logging

from django.conf import settings
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from wagtail.admin.edit_handlers import FieldPanel, StreamFieldPanel, InlinePanel, PageChooserPanel
from wagtail.documents.edit_handlers import DocumentChooserPanel
from wagtail.core.models import Page
from wagtail.search import index

from django.shortcuts import redirect

from .behaviours import WithStreamField, WithTranscription, WithMultipleTranscriptions

from django.db import models
from modelcluster.fields import ParentalKey

logger = logging.getLogger(__name__)


def _paginate(request, items):
    # Pagination
    page = request.GET.get('page', 1)
    paginator = Paginator(items, settings.ITEMS_PER_PAGE)

    try:
        items = paginator.page(page)
    except EmptyPage:
        items = paginator.page(paginator.num_pages)
    except PageNotAnInteger:
        items = paginator.page(1)

    return items


class HomePage(Page, WithStreamField):
    subtitle = models.TextField(
        blank=True, null=True, help_text='Leave blank for none.')
    search_fields = Page.search_fields + [
        index.SearchField('body'),
    ]

    subpage_types = [
        'Catalogue',
        'RichTextPage',
        'SingleColumnPage'
    ]

HomePage.content_panels = [
    FieldPanel('title', classname='full title'),
    FieldPanel('subtitle', classname='full'),
    StreamFieldPanel('body'),
]

HomePage.promote_panels = Page.promote_panels


class Catalogue(Page, WithStreamField):
    subtitle = models.TextField(
        blank=True, null=True, help_text='Leave blank for none.')

    search_fields = Page.search_fields + [
        index.SearchField('subtitle'),
        index.SearchField('body'),
    ]

    subpage_types = [
        'CatalogueEntry',
    ]

    #redirect to the first child page
    def serve(self, request):
        child = self.get_children().live().public().first()
        if child:
            return redirect(child.url)

Catalogue.content_panels = [
    FieldPanel('title', classname='full title'),
    FieldPanel('subtitle', classname='full'),
    StreamFieldPanel('body'),
]

Catalogue.promote_panels = Page.promote_panels


class CatalogueEntry(Page, WithStreamField):
    subtitle = models.TextField(
        blank=True, null=True, help_text='Leave blank for none.')
    essay = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )

    search_fields = Page.search_fields + [
        index.SearchField('subtitle'),
        index.SearchField('body'),
    ]

    subpage_types = [
        'CatalogueEntry', 'Image',
    ]

CatalogueEntry.content_panels = [
    FieldPanel('title', classname='full title'),
    FieldPanel('subtitle', classname='full'),
    StreamFieldPanel('body'),
    PageChooserPanel('essay'),
]

CatalogueEntry.promote_panels = Page.promote_panels

class Image(Page, WithStreamField, WithTranscription):
    subtitle = models.TextField(
        blank=True, null=True, help_text='Leave blank for none.')
    reference = models.TextField(
        blank=True, null=True, help_text='E.g. MSS 8, 004 recto')
    filename = models.TextField(
        blank=True, null=True, help_text='Filename of JP2 image.\
        Leave blank if image is not available.')
    essay = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )

    search_fields = Page.search_fields + [
        index.SearchField('subtitle'),
        index.SearchField('reference'),
        index.SearchField('filename'),
        index.SearchField('body'),
        index.SearchField('transcription'),
    ]

    subpage_types = [
    ]


Image.content_panels = [
    FieldPanel('title', classname='full title'),
    FieldPanel('subtitle', classname='full'),
    FieldPanel('reference', classname='full'),
    FieldPanel('filename', classname='full'),
    # StreamFieldPanel('body'),
    FieldPanel('transcription'),
    DocumentChooserPanel('transcription_pdf', classname='full'),
    PageChooserPanel('essay'),


]

Image.promote_panels = Page.promote_panels


class RichTextPage(Page, WithStreamField):
    subtitle = models.TextField(
        blank=True, null=True, help_text='Leave blank for none.')

    search_fields = Page.search_fields + [
        index.SearchField('subtitle'),
        index.SearchField('body'),
    ]

    subpage_types = [
        'RichTextPage',
        'TranscriptionPage'
    ]

    #redirect to the first child page
    def serve(self, request):
        if self.depth == 3:
            child = self.get_children().live().public().first()
            return redirect(child.url)
        return super().serve(request)


RichTextPage.content_panels = [
    FieldPanel('title', classname='full title'),
    FieldPanel('subtitle', classname='full'),
    StreamFieldPanel('body'),
]

RichTextPage.promote_panels = Page.promote_panels

class TranscriptionPage(Page,  WithStreamField, WithMultipleTranscriptions):
    page_field = models.ForeignKey(
        'wagtailcore.Page',
        null=True,
        blank=True,
        on_delete=models.SET_NULL,
        related_name='+',
    )

TranscriptionPage.content_panels = [
    FieldPanel('title', classname='full title'),
    StreamFieldPanel('body'),
    StreamFieldPanel('transcript'),
    PageChooserPanel('page_field'),
]

TranscriptionPage.promote_panels = Page.promote_panels

class SingleColumnPage(Page, WithStreamField):
    subtitle = models.TextField(
        blank=True, null=True, help_text='Leave blank for none.')

    search_fields = Page.search_fields + [
        index.SearchField('subtitle'),
        index.SearchField('body'),
    ]

SingleColumnPage.content_panels = [
    FieldPanel('title', classname='full title'),
    FieldPanel('subtitle', classname='full'),
    StreamFieldPanel('body'),
]

SingleColumnPage.promote_panels = Page.promote_panels