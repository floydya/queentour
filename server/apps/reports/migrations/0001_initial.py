# Generated by Django 2.1 on 2018-09-01 10:39

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('tours', '0001_initial'),
        ('locations', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Call',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=40)),
                ('phone', models.CharField(max_length=40)),
                ('status', models.BooleanField(choices=[(False, 'Opened'), (True, 'Closed')], default=False)),
                ('from_link', models.URLField()),
                ('datetime', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'verbose_name': 'Call',
                'verbose_name_plural': 'Calls',
            },
        ),
        migrations.CreateModel(
            name='PickingTour',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('duration', models.CharField(max_length=144)),
                ('number_of_persons', models.PositiveSmallIntegerField()),
                ('name', models.CharField(max_length=40)),
                ('phone', models.CharField(max_length=40)),
                ('email', models.EmailField(max_length=254)),
                ('comment', models.TextField()),
                ('from_link', models.URLField()),
                ('datetime', models.DateTimeField(auto_now_add=True)),
                ('status', models.BooleanField(choices=[(False, 'Opened'), (True, 'Closed')], default=False)),
                ('country', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='picking', to='locations.Country')),
            ],
            options={
                'verbose_name': 'Picking tour',
                'verbose_name_plural': 'Picking tours',
            },
        ),
        migrations.CreateModel(
            name='Report',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=40)),
                ('email', models.EmailField(max_length=254)),
                ('message', models.TextField()),
                ('from_link', models.URLField()),
                ('status', models.BooleanField(choices=[(False, 'Opened'), (True, 'Closed')], default=False)),
                ('datetime', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'verbose_name': 'Report',
                'verbose_name_plural': 'Reports',
            },
        ),
        migrations.CreateModel(
            name='Reservation',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('full_name', models.CharField(max_length=144)),
                ('phone', models.CharField(max_length=40)),
                ('email', models.EmailField(max_length=254)),
                ('comment', models.TextField()),
                ('from_link', models.URLField()),
                ('datetime', models.DateTimeField(auto_now_add=True)),
                ('status', models.BooleanField(choices=[(False, 'Opened'), (True, 'Closed')], default=False)),
                ('tour', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reserved', to='tours.Tour')),
                ('tour_date', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reserved', to='tours.TourDatePair')),
            ],
            options={
                'verbose_name': 'Booked tour',
                'verbose_name_plural': 'Booked tours',
            },
        ),
        migrations.CreateModel(
            name='Sertificate',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=40)),
                ('phone', models.CharField(max_length=40)),
                ('from_link', models.URLField()),
                ('datetime', models.DateTimeField(auto_now_add=True)),
                ('status', models.BooleanField(choices=[(False, 'Opened'), (True, 'Closed')], default=False)),
            ],
            options={
                'verbose_name': 'Sertificate Apply',
                'verbose_name_plural': 'Sertificate Applies',
            },
        ),
    ]
