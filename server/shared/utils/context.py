import datetime

from apps.core.models import IndexSettings
from apps.locations.models import Country
from apps.tours.models import TourType


def context_settings(request):
    context = {
        'global_settings': IndexSettings.objects.get(),
        'countries': Country.objects.all(),
        'tourtype': TourType,
        'datetime': datetime
    }
    return context
