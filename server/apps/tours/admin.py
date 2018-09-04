from django.contrib import admin
from apps.tours import models


class TourInclude(admin.TabularInline):
    model = models.TourIncludes
    fk_name = 'tour'
    extra = 1


class TourExclude(admin.TabularInline):
    model = models.TourExcludes
    fk_name = 'tour'
    extra = 1


class AdminTourDatePair(admin.TabularInline):
    model = models.TourDatePair
    readonly_fields = ('uah_cost', )
    fk_name = 'tour'
    extra = 1


@admin.register(models.Tour)
class TourAdmin(admin.ModelAdmin):
    list_display = ('type', 'hotel', 'stars')
    list_filter = ('type', 'stars')
    search_fields = ('type__name', )
    inlines = [TourInclude, TourExclude, AdminTourDatePair]


@admin.register(models.TourType)
class TourTypeAdmin(admin.ModelAdmin):
    search_fields = ('name', )
