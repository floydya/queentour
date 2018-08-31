from django.contrib.auth.models import User
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.utils.translation import ugettext_lazy as _
from postie.shortcuts import send_mail

from apps.core.models import Country
from apps.core.models.tours import TourDatePair, Tour


class Call(models.Model):

    name = models.CharField(max_length=40)
    phone = models.CharField(max_length=40)
    status = models.BooleanField(choices=((False, _('Opened')), (True, _('Closed'))), default=False)
    from_link = models.URLField()
    datetime = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = _('Call')
        verbose_name_plural = _('Calls')


@receiver(post_save, sender=Call)
def call_send_admin_mail(sender, instance, created, **kwargs):
    if created:
        send_mail(
            event='CALL',
            recipients=[admin.email for admin in User.objects.filter(is_staff=True)],
            context={
                'name': instance.name,
                'phone': instance.phone,
                'from_link': instance.from_link,
                'datetime': instance.datetime
            },
            from_email='floydya@ukr.net'
        )


class Report(models.Model):

    name = models.CharField(max_length=40)
    email = models.EmailField()
    message = models.TextField()
    from_link = models.URLField()
    status = models.BooleanField(choices=((False, _('Opened')), (True, _('Closed'))), default=False)
    datetime = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = _('Report')
        verbose_name_plural = _('Reports')


@receiver(post_save, sender=Report)
def report_send_admin_mail(sender, instance, created, **kwargs):
    if created:
        send_mail(
            event='REPORT',
            recipients=[admin.email for admin in User.objects.filter(is_staff=True)],
            context={
                'name': instance.name,
                'email': instance.email,
                'message': instance.message,
                'from_link': instance.from_link,
                'datetime': instance.datetime
            },
            from_email='floydya@ukr.net'
        )


class Reservation(models.Model):
    tour = models.ForeignKey(Tour, on_delete=models.CASCADE, related_name='reserved')
    tour_date = models.ForeignKey(TourDatePair, on_delete=models.CASCADE, related_name='reserved')
    full_name = models.CharField(max_length=144)
    phone = models.CharField(max_length=40)
    email = models.EmailField()
    comment = models.TextField()
    from_link = models.URLField()
    datetime = models.DateTimeField(auto_now_add=True)
    status = models.BooleanField(choices=((False, _('Opened')), (True, _('Closed'))), default=False)

    class Meta:
        verbose_name = _("Booked tour")
        verbose_name_plural = _("Booked tours")


@receiver(post_save, sender=Reservation)
def reservation_send_admin_mail(sender, instance, created, **kwargs):
    if created:
        send_mail(
            event='RESERVATION',
            recipients=[admin.email for admin in User.objects.filter(is_staff=True)],
            context={
                'tour': instance.tour.id,
                'tour_date': instance.tour_date,
                'fullname': instance.full_name,
                'phone': instance.phone,
                'email': instance.email,
                'comment': instance.comment,
                'from_link': instance.from_link,
                'datetime': instance.datetime
            },
            from_email='floydya@ukr.net'
        )


class PickingTour(models.Model):
    country = models.ForeignKey(Country, on_delete=models.CASCADE, related_name='picking')
    duration = models.CharField(max_length=144)
    number_of_persons = models.PositiveSmallIntegerField()
    name = models.CharField(max_length=40)
    phone = models.CharField(max_length=40)
    email = models.EmailField()
    comment = models.TextField()
    from_link = models.URLField()
    datetime = models.DateTimeField(auto_now_add=True)
    status = models.BooleanField(choices=((False, _('Opened')), (True, _('Closed'))), default=False)

    class Meta:
        verbose_name = _("Picking tour")
        verbose_name_plural = _("Picking tours")


@receiver(post_save, sender=PickingTour)
def picking_send_admin_mail(sender, instance, created, **kwargs):
    if created:
        send_mail(
            event='PICKING',
            recipients=[admin.email for admin in User.objects.filter(is_staff=True)],
            context={
                'country': instance.country,
                'duration': instance.duration,
                'number_of_persons': instance.number_of_persons,
                'name': instance.name,
                'phone': instance.phone,
                'email': instance.email,
                'comment': instance.comment,
                'from_link': instance.from_link,
                'datetime': instance.datetime
            },
            from_email='floydya@ukr.net'
        )


class Sertificate(models.Model):
    name = models.CharField(max_length=40)
    phone = models.CharField(max_length=40)
    from_link = models.URLField()
    datetime = models.DateTimeField(auto_now_add=True)
    status = models.BooleanField(choices=((False, _('Opened')), (True, _('Closed'))), default=False)

    class Meta:
        verbose_name = _("Sertificate Apply")
        verbose_name_plural = _("Sertificate Applies")


@receiver(post_save, sender=Sertificate)
def sertificate_send_admin_mail(sender, instance, created, **kwargs):
    if created:
        send_mail(
            event='SERTIFICATE',
            recipients=[admin.email for admin in User.objects.filter(is_staff=True)],
            context={
                'name': instance.name,
                'phone': instance.phone,
                'from_link': instance.from_link,
                'datetime': instance.datetime
            },
            from_email='floydya@ukr.net'
        )
