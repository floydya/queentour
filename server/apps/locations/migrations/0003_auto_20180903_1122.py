# Generated by Django 2.1 on 2018-09-03 11:22

from django.db import migrations, models
import shared.utils.pathrename


class Migration(migrations.Migration):

    dependencies = [
        ('locations', '0002_hotel_address'),
    ]

    operations = [
        migrations.AddField(
            model_name='country',
            name='preview_image',
            field=models.ImageField(default='', upload_to=shared.utils.pathrename.path_and_rename),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='hotel',
            name='preview_image',
            field=models.ImageField(default='', upload_to=shared.utils.pathrename.path_and_rename),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='resort',
            name='preview_image',
            field=models.ImageField(default='', upload_to=shared.utils.pathrename.path_and_rename),
            preserve_default=False,
        ),
    ]