# Generated by Django 2.1 on 2018-09-02 14:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0006_auto_20180902_0735'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='youtube',
            field=models.URLField(blank=True, help_text='Use embed link', null=True, verbose_name='YouTube Video URL'),
        ),
    ]