# Generated by Django 2.1 on 2018-09-03 12:01

import ckeditor.fields
from django.db import migrations, models
import shared.utils.pathrename


class Migration(migrations.Migration):

    dependencies = [
        ('locations', '0003_auto_20180903_1122'),
    ]

    operations = [
        migrations.AlterField(
            model_name='country',
            name='about',
            field=ckeditor.fields.RichTextField(verbose_name='Description'),
        ),
        migrations.AlterField(
            model_name='country',
            name='customs',
            field=ckeditor.fields.RichTextField(verbose_name='Customs'),
        ),
        migrations.AlterField(
            model_name='country',
            name='holidays',
            field=ckeditor.fields.RichTextField(verbose_name='Holidays'),
        ),
        migrations.AlterField(
            model_name='country',
            name='preview_image',
            field=models.ImageField(upload_to=shared.utils.pathrename.path_and_rename, verbose_name='Preview Image'),
        ),
        migrations.AlterField(
            model_name='country',
            name='to_visit',
            field=ckeditor.fields.RichTextField(verbose_name='To visit'),
        ),
        migrations.AlterField(
            model_name='hotel',
            name='address',
            field=models.CharField(max_length=144, verbose_name='Address'),
        ),
        migrations.AlterField(
            model_name='hotel',
            name='preview_image',
            field=models.ImageField(upload_to=shared.utils.pathrename.path_and_rename, verbose_name='Preview Image'),
        ),
        migrations.AlterField(
            model_name='resort',
            name='about',
            field=ckeditor.fields.RichTextField(verbose_name='Description'),
        ),
        migrations.AlterField(
            model_name='resort',
            name='preview_image',
            field=models.ImageField(upload_to=shared.utils.pathrename.path_and_rename, verbose_name='Preview Image'),
        ),
        migrations.AlterField(
            model_name='resort',
            name='sights',
            field=ckeditor.fields.RichTextField(verbose_name='Sights'),
        ),
    ]
