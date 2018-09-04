from django.urls import path

from apps.core import views

urlpatterns = [
    path('pages/certificate/', views.SertificateView.as_view(), name='sertificate'),
    path('pages/documents/', views.DocumentsView.as_view(), name='documents'),
    path('pages/comments/', views.CommentView.as_view(), name='comments'),
    path('pages/search-tour/', views.SearchTourView.as_view(), name='search-tour'),
    path('pages/search-avia/', views.SearchAviaView.as_view(), name='search-avia'),
    path('pages/about/', views.AboutView.as_view(), name='about'),
    path('pages/contact/', views.ContactView.as_view(), name='contact'),
    path('', views.IndexView.as_view(), name='index')
]
