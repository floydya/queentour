import datetime
import re
from urllib.parse import unquote

from ckeditor.fields import RichTextField
from django.db import models
from django.urls import reverse
from smart_selects.db_fields import ChainedForeignKey

from shared.utils.pathrename import path_and_rename
from shared.utils.slugger import slugger
from django.utils.translation import gettext_lazy as _


class TourType(models.Model):

    slug = models.SlugField(db_index=True, editable=False)
    name = models.CharField(max_length=50, unique=True, verbose_name=_('Type Name'))

    preview_image = models.ImageField(upload_to=path_and_rename, verbose_name=_("Preview Image"))

    class Meta:
        verbose_name = _('Tour Type')
        verbose_name_plural = _('Tour Types')

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugger(self.name)
        super().save(*args, **kwargs)


class TourDatePair(models.Model):
    tour = models.ForeignKey('Tour', on_delete=models.CASCADE, related_name='dates')
    start = models.DateField(verbose_name=_("Start Date"))
    end = models.DateField(verbose_name=_("End Date"))
    cost = models.PositiveIntegerField()
    currency = models.CharField(max_length=5, choices=(('d', '$'), ('e', '€'), ('u', '₴')), default='d')
    uah_cost = models.PositiveIntegerField()

    hot = models.BooleanField(default=False, choices=((False, 'Standart'), (True, 'Hot')))

    class Meta:
        verbose_name = _("Tour Datepair")
        verbose_name_plural = _("Tour Datepairs")
        ordering = ['uah_cost']

    def __str__(self):
        return f'{self.start} — {self.end}'

    def save(self, *args, **kwargs):
        if self.currency == 'd':
            import requests
            r = requests.get(url="https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json")
            course = [i for i in r.json() if i['r030'] == 840][0].get('rate')
            self.uah_cost = self.cost * course
        elif self.currency == 'e':
            import requests
            r = requests.get(url="https://bank.gov.ua/NBUStatService/v1/statdirectory/exchange?json")
            course = [i for i in r.json() if i['r030'] == 978][0].get('rate')
            self.uah_cost = self.cost * course
        else:
            self.uah_cost = self.cost
        super().save(*args, **kwargs)


class TourIncludes(models.Model):

    name = models.CharField(max_length=50, verbose_name=_("Name"))
    description = RichTextField(blank=True)
    tour = models.ForeignKey('Tour', on_delete=models.CASCADE, related_name='includes')

    class Meta:
        verbose_name = _("Tour Includes")
        verbose_name_plural = _("Tour Includes")


class TourExcludes(models.Model):
    name = models.CharField(max_length=50, verbose_name=_("Name"))
    description = RichTextField(blank=True)
    tour = models.ForeignKey('Tour', on_delete=models.CASCADE, related_name='excludes')

    class Meta:
        verbose_name = _("Tour Excludes")
        verbose_name_plural = _("Tour Excludes")


class Tour(models.Model):

    type = models.ForeignKey(TourType, on_delete=models.CASCADE, related_name='tours', verbose_name=_("Tour's Type"))
    country = models.ForeignKey('locations.Country', on_delete=models.CASCADE,
                                related_name='tours', verbose_name=_("Tour's Country"))
    resort = ChainedForeignKey('locations.Resort', chained_field='country',
                               chained_model_field='country', show_all=False,
                               auto_choose=True, sort=True)
    hotel = ChainedForeignKey('locations.Hotel', chained_field='resort',
                              chained_model_field='resort', show_all=False,
                              auto_choose=True, sort=True)
    sending_from = models.CharField(max_length=50, verbose_name=_("Sending from"))
    duration_days = models.PositiveSmallIntegerField(verbose_name=_("Days duration"))
    duration_nights = models.PositiveSmallIntegerField(verbose_name=_("Night duration"))
    stars = models.PositiveSmallIntegerField(choices=((1, 1), (2, 2), (3, 3), (4, 4), (5, 5)), verbose_name=_("Stars"))

    class Meta:
        verbose_name = _("Tour")
        verbose_name_plural = _("Tours")

    def get_absolute_url(self):
        return reverse('tour-detail', args=[self.pk])

    def low_cost(self, date=None, from_=None, to_=None):
        qs = self.dates.filter(start__gte=datetime.date.today()).distinct()
        if from_:
            qs = qs.filter(uah_cost__gte=from_).distinct()
        if to_:
            qs = qs.filter(uah_cost__lte=to_).distinct()
        if date:
            matching = re.findall(r'(\d{2,})', unquote(date))
            if matching:
                matching = [int(match) for match in matching]
                start_date = datetime.date(year=matching[2], day=matching[0], month=matching[1])
                end_date = datetime.date(year=matching[5], month=matching[4], day=matching[3])
                qs = qs.filter(start__gte=start_date, end__lte=end_date).distinct()
        return qs.order_by('uah_cost').first().uah_cost if qs else 0
