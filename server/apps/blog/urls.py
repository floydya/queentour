from django.urls import path
from . import views


urlpatterns = [
    path('articles/', views.ArticleList.as_view(), name='article-list'),
    path('article/<heading>/<slug>/', views.ArticleDetail.as_view(), name='article-detail'),
]