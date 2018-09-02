from django.contrib import admin
from django.contrib.contenttypes.admin import GenericTabularInline
from solo.admin import SingletonModelAdmin

from .models import utils, core


class ImageInlineAdmin(GenericTabularInline):

    model = utils.Image
    fields = ('image_tag', 'image')
    readonly_fields = ('image_tag', )


@admin.register(utils.Image)
class ImageAdmin(admin.ModelAdmin):
    list_display = ('image', 'content_object')


@admin.register(core.PhoneNumbers)
class PhoneNumbers(admin.ModelAdmin):
    pass


@admin.register(core.IndexSettings)
class IndexSettingsAdmin(SingletonModelAdmin):
    inlines = [ImageInlineAdmin]


@admin.register(core.SertificateSettings)
class SertificateAdmin(SingletonModelAdmin):
    pass


@admin.register(core.Comment)
class CommentAdmin(admin.ModelAdmin):
    pass