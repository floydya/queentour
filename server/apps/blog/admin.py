from django.contrib import admin
from django.contrib.contenttypes.admin import GenericTabularInline

from apps.core.models import Image
from .models import Heading, Article


class ImageArticleInline(GenericTabularInline):
    model = Image
    fields = ('image_tag', 'image')
    readonly_fields = ('image_tag', )
    min_num = 1
    extra = 1
    max_num = 1
    can_delete = False


@admin.register(Heading)
class HeadingAdmin(admin.ModelAdmin):
    list_display = ('name',)
    search_fields = ('name',)


@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title', 'heading', 'date')
    list_filter = ('heading', 'date')
    inlines = [ImageArticleInline]
