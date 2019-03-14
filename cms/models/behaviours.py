from __future__ import unicode_literals

from django.db import models
from wagtail.core.fields import StreamField

from .streamfield import CMSStreamBlock


class WithFeedImage(models.Model):
    feed_image = models.ForeignKey(
        'wagtailimages.Image', null=True, blank=True,
        on_delete=models.SET_NULL, related_name='+'
    )

    class Meta:
        abstract = True


class WithStreamField(models.Model):
    body = StreamField(CMSStreamBlock(required=False), blank=True)

    class Meta:
        abstract = True


class WithTranscription(models.Model):
    transcription = models.TextField(blank=True, null=True)
    transcription_pdf = models.ForeignKey(
        'wagtaildocs.Document', null=True, blank=True,
        on_delete=models.SET_NULL, related_name='+'
    )

    class Meta:
        abstract = True
