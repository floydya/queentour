from django.db import models
from solo.models import SingletonModel
from django.utils.translation import gettext_lazy as _


class PhoneNumbers(models.Model):
    phone = models.CharField(max_length=40)

    def __str__(self):
        return self.phone


class IndexSettings(SingletonModel):
    location_x = models.FloatField(default=0.0)
    location_y = models.FloatField(default=0.0)
    phone_numbers = models.ManyToManyField(PhoneNumbers)
    address = models.CharField(max_length=144)
    instagram = models.URLField(default='http://instagram.com/')
    facebook = models.URLField(default='http://facebook.com/')
    vk = models.URLField(default='http://vk.com/')

    class Meta:
        verbose_name = _("Site Configuration")
