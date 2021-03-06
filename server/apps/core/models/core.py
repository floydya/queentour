from ckeditor.fields import RichTextField
from django.contrib.contenttypes.fields import GenericRelation
from django.db import models
from solo.models import SingletonModel
from django.utils.translation import gettext_lazy as _

from apps.core.models import Image
from apps.locations.models import Hotel
from shared.utils.pathrename import path_and_rename


class PhoneNumbers(models.Model):
    phone = models.CharField(max_length=40, verbose_name=_("Phone Number"))

    def __str__(self):
        return self.phone

    class Meta:
        verbose_name = _("Phone Number")
        verbose_name_plural = _("Phone Numbers")


class IndexSettings(SingletonModel):
    phone_numbers = models.ManyToManyField(PhoneNumbers, verbose_name=_("Phone Numbers"))
    address = models.CharField(max_length=144, verbose_name=_("Address"))
    instagram = models.URLField(default='http://instagram.com/', verbose_name=_("Instagram.com"))
    facebook = models.URLField(default='http://facebook.com/', verbose_name=_("Facebook.com"))
    vk = models.URLField(default='http://vk.com/', verbose_name=_("vk.com"))

    images = GenericRelation(Image)

    class Meta:
        verbose_name = _("Site Configuration")


class SertificateSettings(SingletonModel):
    image = models.ImageField(upload_to=path_and_rename, verbose_name=_("Image"))
    title = models.CharField(max_length=144, verbose_name=_("Title"))
    column_1 = RichTextField(verbose_name=_("Column 1"))
    column_2 = RichTextField(verbose_name=_("Column 2"))

    class Meta:
        verbose_name = _("Certificate Configuration")


class AboutSettings(SingletonModel):
    image = models.ImageField(upload_to=path_and_rename, verbose_name=_("Image"))
    title = models.CharField(max_length=144, verbose_name=_("Title"))

    column1_image = models.ImageField(upload_to=path_and_rename)
    column1_title = models.CharField(max_length=40)
    column1_body = RichTextField()

    column2_image = models.ImageField(upload_to=path_and_rename)
    column2_title = models.CharField(max_length=40)
    column2_body = RichTextField()

    column3_image = models.ImageField(upload_to=path_and_rename)
    column3_title = models.CharField(max_length=40)
    column3_body = RichTextField()

    column4_image = models.ImageField(upload_to=path_and_rename)
    column4_title = models.CharField(max_length=40)
    column4_body = RichTextField()

    body = RichTextField()

    certificates = GenericRelation(Image)


class Comment(models.Model):

    name = models.CharField(max_length=144, verbose_name=_("Full Name"))
    age = models.PositiveSmallIntegerField(verbose_name=_("Age"))
    description = models.CharField(max_length=144, verbose_name=_("Description"))
    datetime = models.DateField(verbose_name=_("Date"))
    hotel = models.ForeignKey(Hotel, on_delete=models.CASCADE, related_name='comments', verbose_name=_("Hotel"))

    type = models.PositiveSmallIntegerField(choices=((1, "Text"), (2, "Image"), (3, "Video")), default=1)

    comment = RichTextField(blank=True, null=True, verbose_name=_("Comment"),
                            help_text="При добавлении текста - отзыв будет помещен в раздел `Текстовые отзывы` ")
    youtube = models.URLField(verbose_name=_("YouTube Video URL"), blank=True, null=True,
                              help_text=_("Use embed link"))
    image = models.ImageField(upload_to=path_and_rename, blank=True, null=True)

    class Meta:
        verbose_name_plural = _('Comments')
        verbose_name = _('Comment')


class EmailDispatch(models.Model):
    email = models.EmailField()


class DocumentsSettings(SingletonModel):
    passport = RichTextField()
    visa = RichTextField()

