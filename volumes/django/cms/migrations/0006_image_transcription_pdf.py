# Generated by Django 2.0.9 on 2019-03-14 18:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('wagtaildocs', '0008_document_file_size'),
        ('cms', '0005_homepage_subtitle'),
    ]

    operations = [
        migrations.AddField(
            model_name='image',
            name='transcription_pdf',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='+', to='wagtaildocs.Document'),
        ),
    ]