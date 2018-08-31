from apps.core.models import IndexSettings, Country


def context_settings(request):
    context = {
        'global_settings': IndexSettings.objects.get(),
        'countries': Country.objects.all()
    }
    return context