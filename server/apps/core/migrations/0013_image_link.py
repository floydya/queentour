# Generated by Django 2.1 on 2018-09-04 13:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0012_documentssettings'),
    ]

    operations = [
        migrations.AddField(
            model_name='image',
            name='link',
            field=models.URLField(blank=True, null=True),
        ),
    ]
