from django.contrib import admin
from django.contrib.contenttypes.admin import GenericTabularInline
from solo.admin import SingletonModelAdmin

from .models import locations, utils, core


class ImageInlineAdmin(GenericTabularInline):

    model = utils.Image
    fields = ('image_tag', 'image')
    readonly_fields = ('image_tag', )


@admin.register(locations.Country)
class CountryAdmin(admin.ModelAdmin):
    list_display = ('name',)
    search_fields = ('name',)
    inlines = [ImageInlineAdmin]


@admin.register(locations.Resort)
class ResortAdmin(admin.ModelAdmin):
    list_display = ('name', 'country')
    search_fields = ('name', 'country__name')
    inlines = [ImageInlineAdmin]


@admin.register(locations.Hotel)
class HotelAdmin(admin.ModelAdmin):
    list_display = ('name', 'resort', 'stars', 'type', 'hot')
    inlines = [ImageInlineAdmin]


@admin.register(locations.HotelType)
class HotelTypeAdmin(admin.ModelAdmin):
    search_fields = ('name',)


@admin.register(utils.Image)
class ImageAdmin(admin.ModelAdmin):
    list_display = ('image', 'content_object')


@admin.register(core.PhoneNumbers)
class PhoneNumbers(admin.ModelAdmin):
    pass


@admin.register(core.IndexSettings)
class IndexSettingsAdmin(SingletonModelAdmin):
    inlines = [ImageInlineAdmin]
