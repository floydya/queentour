from ckeditor.fields import RichTextField
from django.db import models
from solo.models import SingletonModel
from django.utils.translation import gettext_lazy as _

from apps.locations.models import Hotel
from shared.utils.pathrename import path_and_rename


class PhoneNumbers(models.Model):
    phone = models.CharField(max_length=40, verbose_name=_("Phone Number"))

    def __str__(self):
        return self.phone


class IndexSettings(SingletonModel):
    location_x = models.FloatField(default=0.0, verbose_name=_("Location Z"))
    location_y = models.FloatField(default=0.0, verbose_name=_("Location Y"))
    phone_numbers = models.ManyToManyField(PhoneNumbers, verbose_name=_("Phone Numbers"))
    address = models.CharField(max_length=144, verbose_name=_("Address"))
    instagram = models.URLField(default='http://instagram.com/', verbose_name=_("Instagram.com"))
    facebook = models.URLField(default='http://facebook.com/', verbose_name=_("Facebook.com"))
    vk = models.URLField(default='http://vk.com/', verbose_name=_("vk.com"))

    class Meta:
        verbose_name = _("Site Configuration")


class SertificateSettings(SingletonModel):
    image = models.ImageField(upload_to=path_and_rename, verbose_name=_("Image"))
    title = models.CharField(max_length=144, verbose_name=_("Title"))
    column_1 = RichTextField(verbose_name=_("Column 1"))
    column_2 = RichTextField(verbose_name=_("Column 2"))

    class Meta:
        verbose_name = _("Certificate Configuration")


class Comment(models.Model):

    name = models.CharField(max_length=144, verbose_name=_("Full Name"))
    age = models.PositiveSmallIntegerField(verbose_name=_("Age"))
    description = models.CharField(max_length=144, verbose_name=_("Description"))
    datetime = models.DateField(verbose_name=_("Date"))
    hotel = models.ForeignKey(Hotel, on_delete=models.CASCADE, related_name='comments', verbose_name=_("Hotel"))

    comment = RichTextField(blank=True, null=True)
    youtube = models.URLField(verbose_name=_("YouTube Video URL"), blank=True, null=True)
