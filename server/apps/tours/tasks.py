from celery import shared_task
from apps.tours.models import TourDatePair


@shared_task
def update_costs():
    for item in TourDatePair.objects.all():
        item.save()
