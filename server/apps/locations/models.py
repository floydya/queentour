from ckeditor.fields import RichTextField
from django.contrib.contenttypes.fields import GenericRelation
from django.db import models
from django.db.models import Min
from apps.tours.models import Tour
from apps.core.models import Image
from shared.utils.slugger import slugger
from django.utils.translation import gettext_lazy as _


class Country(models.Model):

    slug = models.SlugField(db_index=True, editable=False)
    name = models.CharField(max_length=50, unique=True, verbose_name=_("Name"))

    about = RichTextField()
    holidays = RichTextField()
    to_visit = RichTextField()
    customs = RichTextField()

    images = GenericRelation(Image)

    class Meta:
        verbose_name = _("Country")
        verbose_name_plural = _("Countries")

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugger(self.name)
        super().save(*args, **kwargs)

    @property
    def tours(self):
        return Tour.objects.filter(hotel__resort__country=self)

    def low_cost(self):
        cost = self.tours.annotate(Min('cost')).order_by('cost')
        return cost[0].cost if cost else 0


class Resort(models.Model):

    slug = models.SlugField(db_index=True, editable=False)
    name = models.CharField(max_length=50, unique=True, verbose_name=_("Name"))
    country = models.ForeignKey(Country, on_delete=models.CASCADE,
                                related_name='resorts', verbose_name=_("Resort's Country"))

    about = RichTextField()
    sights = RichTextField()

    images = GenericRelation(Image)

    class Meta:
        verbose_name = _("Resort")
        verbose_name_plural = _("Resorts")

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugger(self.name)
        super().save(*args, **kwargs)

    @property
    def tours(self):
        return Tour.objects.filter(hotel__resort=self)

    def low_cost(self):
        cost = self.tours.annotate(Min('cost')).order_by('cost')
        return cost[0].cost if cost else 0


class HotelType(models.Model):

    slug = models.SlugField(db_index=True, editable=False)
    name = models.CharField(max_length=50, unique=True, verbose_name=_("Name"))

    class Meta:
        verbose_name = _("Hotel Type")
        verbose_name_plural = _("Hotel Types")

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugger(self.name)
        super().save(*args, **kwargs)


class Hotel(models.Model):

    slug = models.SlugField(db_index=True, editable=False)
    name = models.CharField(max_length=100, unique=True, verbose_name=_("Name"))
    resort = models.ForeignKey(Resort, on_delete=models.CASCADE, related_name='hotels', verbose_name=_("Hotel's Resort"))
    stars = models.PositiveSmallIntegerField(choices=((1, 1), (2, 2), (3, 3), (4, 4), (5, 5)), verbose_name=_("Stars"))
    type = models.ForeignKey(HotelType, on_delete=models.CASCADE, related_name='hotels', verbose_name=_("Hotel's Type"))

    hot = models.BooleanField(choices=((True, _("Hot")), (False, _("Standard"))), verbose_name=_("Hot"))

    website = models.URLField(null=True, blank=True, verbose_name=_("Website"))
    description = RichTextField(default='', verbose_name=_("Description"))
    breakfasts = RichTextField(default='', verbose_name=_("Breakfasts"))

    images = GenericRelation(Image)

    address = models.CharField(max_length=144, default='')

    class Meta:
        verbose_name = _("Hotel")
        verbose_name_plural = _("Hotels")

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.slug = slugger(self.name)
        super().save(*args, **kwargs)
