from django.contrib import admin
from .models import Heading, Article


@admin.register(Heading)
class HeadingAdmin(admin.ModelAdmin):
    list_display = ('name',)
    search_fields = ('name',)


@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title', 'heading', 'date')
    list_filter = ('heading', 'date')
