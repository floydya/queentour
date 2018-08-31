from django.contrib import admin
from .models import Call, Report, Reservation, PickingTour, Sertificate


@admin.register(Call)
class CallAdmin(admin.ModelAdmin):
    list_filter = ('status', 'datetime')
    list_display = ('status', 'name', 'phone', 'datetime')
    list_display_links = ('name', 'phone')

    def has_add_permission(self, request, obj=None):
        return False


@admin.register(Report)
class ReportAdmin(admin.ModelAdmin):
    list_filter = ('status', 'datetime')
    sortable_by = ('status',)
    list_display = ('status', 'name', 'email', 'datetime')
    list_display_links = ('name', 'email')

    def has_add_permission(self, request, obj=None):
        return False


@admin.register(Reservation)
class ReservationAdmin(admin.ModelAdmin):
    list_display = ('tour', 'tour_date', 'full_name', 'phone', 'email', 'datetime', 'status')
    sortable_by = ('status',)
    list_filter = ('status', 'datetime')
    list_display_links = ('full_name', 'phone', 'email')

    def has_add_permission(self, request, obj=None):
        return False


@admin.register(PickingTour)
class PickingTourAdmin(admin.ModelAdmin):
    list_display = ('country', 'duration', 'number_of_persons', 'name', 'phone', 'email', 'datetime', 'status')
    sortable_by = ('status',)
    list_filter = ('status', 'datetime')
    list_display_links = ('name', 'phone', 'email')

    def has_add_permission(self, request, obj=None):
        return False


@admin.register(Sertificate)
class SertificateAdmin(admin.ModelAdmin):
    list_filter = ('status', 'datetime')
    list_display = ('status', 'name', 'phone', 'datetime')
    list_display_links = ('name', 'phone')

    def has_add_permission(self, request, obj=None):
        return False
