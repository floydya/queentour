from django.contrib import admin

from apps.core.admin import ImageInlineAdmin
from apps.locations import models


@admin.register(models.Country)
class CountryAdmin(admin.ModelAdmin):
    list_display = ('name',)
    search_fields = ('name',)
    inlines = [ImageInlineAdmin]


@admin.register(models.Resort)
class ResortAdmin(admin.ModelAdmin):
    list_display = ('name', 'country')
    search_fields = ('name',)
    autocomplete_fields = ('country', )
    inlines = [ImageInlineAdmin]


@admin.register(models.Hotel)
class HotelAdmin(admin.ModelAdmin):
    list_display = ('name', 'resort', 'stars', 'type', 'hot')
    search_fields = ('name',)
    autocomplete_fields = ('type', 'resort')
    inlines = [ImageInlineAdmin]


@admin.register(models.HotelType)
class HotelTypeAdmin(admin.ModelAdmin):
    search_fields = ('name',)
