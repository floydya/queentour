from django.urls import path
from . import views


urlpatterns = [
    path('tours/', views.TourList.as_view(), name='tour-list'),
    path('tour/<pk>/', views.TourDetail.as_view(), name='tour-detail'),
    path('utils/get-4-pages/', views.GetFourTours.as_view(), name='get-tours-list-four'),
    path('utils/get-cost/<pk>/', views.GetDateCost.as_view(), name='get-cost')
]