# Generated by Django 2.1 on 2018-09-01 10:39

import ckeditor.fields
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('slug', models.SlugField(editable=False)),
                ('name', models.CharField(max_length=50, unique=True, verbose_name='Name')),
                ('about', ckeditor.fields.RichTextField()),
                ('holidays', ckeditor.fields.RichTextField()),
                ('to_visit', ckeditor.fields.RichTextField()),
                ('customs', ckeditor.fields.RichTextField()),
            ],
            options={
                'verbose_name': 'Country',
                'verbose_name_plural': 'Countries',
            },
        ),
        migrations.CreateModel(
            name='Hotel',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('slug', models.SlugField(editable=False)),
                ('name', models.CharField(max_length=100, unique=True, verbose_name='Name')),
                ('stars', models.PositiveSmallIntegerField(choices=[(1, 1), (2, 2), (3, 3), (4, 4), (5, 5)], verbose_name='Stars')),
                ('hot', models.BooleanField(choices=[(True, 'Hot'), (False, 'Standard')], verbose_name='Hot')),
                ('website', models.URLField(blank=True, null=True, verbose_name='Website')),
                ('description', ckeditor.fields.RichTextField(default='', verbose_name='Description')),
                ('breakfasts', ckeditor.fields.RichTextField(default='', verbose_name='Breakfasts')),
            ],
            options={
                'verbose_name': 'Hotel',
                'verbose_name_plural': 'Hotels',
            },
        ),
        migrations.CreateModel(
            name='HotelType',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('slug', models.SlugField(editable=False)),
                ('name', models.CharField(max_length=50, unique=True, verbose_name='Name')),
            ],
            options={
                'verbose_name': 'Hotel Type',
                'verbose_name_plural': 'Hotel Types',
            },
        ),
        migrations.CreateModel(
            name='Resort',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('slug', models.SlugField(editable=False)),
                ('name', models.CharField(max_length=50, unique=True, verbose_name='Name')),
                ('about', ckeditor.fields.RichTextField()),
                ('sights', ckeditor.fields.RichTextField()),
                ('country', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='resorts', to='locations.Country', verbose_name="Resort's Country")),
            ],
            options={
                'verbose_name': 'Resort',
                'verbose_name_plural': 'Resorts',
            },
        ),
        migrations.AddField(
            model_name='hotel',
            name='resort',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='hotels', to='locations.Resort', verbose_name="Hotel's Resort"),
        ),
        migrations.AddField(
            model_name='hotel',
            name='type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='hotels', to='locations.HotelType', verbose_name="Hotel's Type"),
        ),
    ]
