from django.http import JsonResponse
from django.views import generic

from apps.reports.models import Call, Report, Reservation, PickingTour, Sertificate


class CallView(generic.CreateView):
    http_method_names = ['post']
    model = Call
    fields = ('name', 'phone', 'from_link')
    success_url = '/'

    def form_invalid(self, form):
        response = super().form_invalid(form)
        if self.request.is_ajax():
            return JsonResponse(form.errors, status=400)

    def form_valid(self, form):
        response = super().form_valid(form)
        if self.request.is_ajax():
            data = {
                'success': True,
            }
            return JsonResponse(data)


class ReportView(generic.CreateView):
    http_method_names = ['post']
    model = Report
    fields = ('name', 'email', 'message', 'from_link')
    success_url = '/'

    def form_invalid(self, form):
        response = super().form_invalid(form)
        if self.request.is_ajax():
            return JsonResponse(form.errors, status=400)

    def form_valid(self, form):
        response = super().form_valid(form)
        if self.request.is_ajax():
            data = {
                'success': True,
            }
            return JsonResponse(data)


class ReservationView(generic.CreateView):
    http_method_names = ['post']
    model = Reservation
    fields = ('tour', 'tour_date', 'full_name', 'phone', 'email', 'comment', 'from_link')
    success_url = '/'

    def form_invalid(self, form):
        response = super().form_invalid(form)
        if self.request.is_ajax():
            return JsonResponse(form.errors, status=400)

    def form_valid(self, form):
        response = super().form_valid(form)
        if self.request.is_ajax():
            data = {
                'success': True,
            }
            return JsonResponse(data)


class PickingTourView(generic.CreateView):
    http_method_names = ['post']
    model = PickingTour
    fields = ('country', 'duration', 'number_of_persons', 'name', 'phone', 'email', 'comment', 'from_link')
    success_url = '/'

    def form_invalid(self, form):
        response = super().form_invalid(form)
        if self.request.is_ajax():
            return JsonResponse(form.errors, status=400)

    def form_valid(self, form):
        response = super().form_valid(form)
        if self.request.is_ajax():
            data = {
                'success': True,
            }
            return JsonResponse(data)


class SertificateView(generic.CreateView):
    http_method_names = ['post']
    model = Sertificate
    fields = ('name', 'phone', 'from_link')
    success_url = '/'

    def form_invalid(self, form):
        response = super().form_invalid(form)
        if self.request.is_ajax():
            return JsonResponse(form.errors, status=400)

    def form_valid(self, form):
        response = super().form_valid(form)
        if self.request.is_ajax():
            data = {
                'success': True,
            }
            return JsonResponse(data)
