from django.conf import settings
from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.staticfiles.urls import static
from des import urls as des_urls
from django.urls import path

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^django-des/', include(des_urls)),
    url(r'^forms/', include('apps.reports.urls')),
    path('', include('apps.core.urls')),
    path('', include('apps.blog.urls')),
    path('', include('apps.locations.urls')),
]

if 'rosetta' in settings.INSTALLED_APPS:
    urlpatterns += [url(r'^rosetta/', include('rosetta.urls'))]

if settings.DEBUG:
    urlpatterns += [url(r'^', include('markup.urls'))]
    urlpatterns += (
        static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT) +
        static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
    )

    if 'debug_toolbar' in settings.INSTALLED_APPS:
        import debug_toolbar
        urlpatterns += [
            url(r'^__debug__/', include(debug_toolbar.urls)),
        ]
