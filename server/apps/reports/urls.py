from django.urls import path

from . import views

urlpatterns = [
    path('call/', views.CallView.as_view(), name='call-view'),
    path('report/', views.ReportView.as_view(), name='report-view'),
    path('reservation/', views.ReservationView.as_view(), name='reservation-view'),
    path('picking/', views.PickingTourView.as_view(), name='picking-view'),
    path('sertificate/', views.SertificateView.as_view(), name='sertificate-view'),
]
