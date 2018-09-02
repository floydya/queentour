from django.contrib import admin
from django.contrib.admin import DateFieldListFilter

from apps.core.admin import ImageInlineAdmin
from apps.tours import models


@admin.register(models.Tour)
class TourAdmin(admin.ModelAdmin):
    list_display = ('type', 'hotel', 'cost', 'stars')
    list_filter = ('type', 'hotel', 'cost', 'stars')
    search_fields = ('type__name', 'hotel__name')


@admin.register(models.TourXcludes)
class XCludesAdmin(admin.ModelAdmin):
    list_display = ('type', 'name')
    list_display_links = ('name', )
    list_filter = ('type',)
    search_fields = ('name',)


@admin.register(models.TourDatePair)
class DatePairAdmin(admin.ModelAdmin):
    list_filter = (
        ('start', DateFieldListFilter),
        ('end', DateFieldListFilter)
    )


@admin.register(models.TourType)
class TourTypeAdmin(admin.ModelAdmin):
    search_fields = ('name', )
    inlines = [ImageInlineAdmin]
