from django.urls import path

from apps.locations import views

urlpatterns = [
    path('countries/', views.CountriesView.as_view(), name='country-list'),
    path('country/<slug>/', views.CountryDetail.as_view(), name='country-detail'),
    path('resort/<slug>/', views.ResortView.as_view(), name='resort-detail'),
    path('hotels/', views.HotelList.as_view(), name='hotel-list'),
]
