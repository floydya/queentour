from django.db import models

from . import Hotel
from shared.utils.slugger import slugger
from django.utils.translation import gettext_lazy as _


class TourType(models.Model):

    slug = models.SlugField(db_index=True, editable=False)
    name = models.CharField(max_length=50, unique=True, verbose_name=_('Type Name'))

    class Meta:
        verbose_name = _('Tour Type')
        verbose_name_plural = _('Tour Types')

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugger(self.name)
        super().save(*args, **kwargs)


class TourDatePair(models.Model):

    start = models.DateField()
    end = models.DateField()

    class Meta:
        verbose_name = _("Tour Datepair")
        verbose_name_plural = _("Tour Datepairs")

    def __str__(self):
        return f'{self.start} — {self.end}'


class TourXcludes(models.Model):

    name = models.CharField(max_length=50, unique=True)
    description = models.TextField(blank=True, null=True)
    type = models.BooleanField(choices=((True, _("Includes")), (False, _("Excludes"))), verbose_name=_("Include/Exclude"))

    class Meta:
        verbose_name = _("Tour Xclude")
        verbose_name_plural = _("Tour Xcludes")

    def __str__(self):
        return f'{self.get_type_display()} {self.name}'


class Tour(models.Model):

    type = models.ForeignKey(TourType, on_delete=models.CASCADE, related_name='tours', verbose_name=_("Tour's Type"))
    hotel = models.ForeignKey(Hotel, on_delete=models.CASCADE, related_name='tours', verbose_name=_("Tour's Hotel"))
    sending_from = models.CharField(max_length=50, verbose_name=_("Sending from"))
    duration_days = models.PositiveSmallIntegerField(verbose_name=_("Days duration"))
    duration_nights = models.PositiveSmallIntegerField(verbose_name=_("Night duration"))
    dates = models.ManyToManyField(TourDatePair, related_name='tours', verbose_name=_("Tour's Date"))
    cost = models.PositiveIntegerField(verbose_name=_("Tour's Cost"))

    xcludes = models.ManyToManyField(TourXcludes, related_name='tours', verbose_name=_("Tour Includes/Excludes"))

    stars = models.PositiveSmallIntegerField(choices=((1, 1), (2, 2), (3, 3), (4, 4), (5, 5)))

    class Meta:
        verbose_name = _("Tour")
        verbose_name_plural = _("Tours")
