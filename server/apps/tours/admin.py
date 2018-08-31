from django.contrib import admin
from django.contrib.admin import DateFieldListFilter

from apps.core.admin import ImageInlineAdmin
from apps.core.models import tours


@admin.register(tours.Tour)
class TourAdmin(admin.ModelAdmin):
    list_display = ('type', 'hotel', 'cost', 'stars')
    list_filter = ('type', 'hotel', 'cost', 'stars')
    search_fields = ('type__name', 'hotel__name')


@admin.register(tours.TourXcludes)
class XCludesAdmin(admin.ModelAdmin):
    list_display = ('type', 'name')
    list_display_links = ('name', )
    list_filter = ('type',)
    search_fields = ('name',)


@admin.register(tours.TourDatePair)
class DatePairAdmin(admin.ModelAdmin):
    list_filter = (
        ('start', DateFieldListFilter),
        ('end', DateFieldListFilter)
    )


@admin.register(tours.TourType)
class TourTypeAdmin(admin.ModelAdmin):
    search_fields = ('name', )
    inlines = [ImageInlineAdmin]
