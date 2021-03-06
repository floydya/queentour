"""
Django settings for queentour project.

Generated by 'django-admin startproject' using Django.
"""

import jinja2
from pathlib import Path

from django_jinja.builtins import DEFAULT_EXTENSIONS
import environ
from django.utils.translation import gettext_lazy as _

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = Path(__file__)
BASE_ROOT = BASE_DIR.parent.parent

env = environ.Env(DEBUG=(bool, False), )

env_file = str(BASE_ROOT.parent / '.env')
env.read_env(env_file)

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.10/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = env('DJANGO_SECRET_KEY')

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = env('DJANGO_DEBUG')

ALLOWED_HOSTS: list = []

# Application definition

PROJECT_APPS = [
    'markup',
]

INSTALLED_APPS = PROJECT_APPS + [
    'rosetta',
    'django_jinja',
    'ckeditor',
    'des',
    'postie',
    'parler',
    'codemirror2',
    'solo',
    'smart_selects',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.sites',

    'apps.core',
    'apps.blog',
    'apps.tours',
    'apps.locations',
    'apps.reports',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware'
]

ROOT_URLCONF = 'app.urls'

TEMPLATES = [
    {
        'BACKEND': 'django_jinja.backend.Jinja2',
        'NAME': 'jinja2',
        'APP_DIRS': True,
        'DIRS': [],
        'OPTIONS': {
            'environment': 'shared.env.jinja2.environment',
            'match_extension': '.jinja',
            'newstyle_gettext': True,
            'auto_reload': True,
            'undefined': jinja2.Undefined,
            'debug': True,

            'filters': {},

            'globals': {},

            'context_processors': [
                'django.contrib.auth.context_processors.auth',
                'django.template.context_processors.debug',
                'django.template.context_processors.i18n',
                'django.template.context_processors.media',
                'django.template.context_processors.static',
                'django.template.context_processors.tz',
                'django.contrib.messages.context_processors.messages',
                'shared.utils.context.context_settings',
            ],

            'extensions': DEFAULT_EXTENSIONS,

            "bytecode_cache": {
                "name": "default",
                "backend": "django_jinja.cache.BytecodeCache",
                "enabled": True,
            },
        },
    },
    {
        'DIRS': [],
        'APP_DIRS': True,
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.media',
                'django.template.context_processors.static',
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.messages.context_processors.messages',
                'django.contrib.auth.context_processors.auth',
            ],
        },
    },
]

WSGI_APPLICATION = 'app.wsgi.application'

# Database

DATABASES = {
    # Raises ImproperlyConfigured exception if DATABASE_URL not in os.environ
    'default': env.db('DJANGO_DB_URL')
}
DATABASES['default']['CONN_MAX_AGE'] = env.int('CONN_MAX_AGE', default=0)

# Password validation

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# Internationalization

LANGUAGE_CODE = 'ru'
LANGUAGES = (
    ('ru', 'Russian'),
)

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.10/howto/static-files/

STATIC_URL = '/static/'
STATIC_ROOT = BASE_ROOT / 'static'
MEDIA_URL = '/uploads/'
MEDIA_ROOT = BASE_ROOT / 'uploads'

LOCALE_PATHS = (
    BASE_ROOT / 'locale',
)

SITE_ID = 1

CACHES = {
    'default': env.cache_url('DJANGO_CACHE_URL', 'dummycache://127.0.0.1')
}

EMAIL_BACKEND = 'des.backends.ConfiguredEmailBackend'
POSTIE_HTML_ADMIN_WIDGET = {
    'widget': 'CKEditorWidget',
    'widget_module': 'ckeditor.widgets',
    'attrs': {'attrs': {'cols': 80, 'rows': 10}}
}
POSTIE_INSTANT_SEND = True
POSTIE_TEMPLATE_CONTEXTS = {
    'CALL': {
        'name': _('First Name'),
        'phone': _('Phone Number'),
        'from_link': _('Sent From Link'),
        'datetime': _('Date')
    },
    'REPORT': {
        'name': _('First Name'),
        'email': _('Email'),
        'message': _('Message'),
        'from_link': _('Sent From Link'),
        'datetime': _('Date')
    },
    'RESERVATION': {
        'tour': _('Tour Number'),
        'tour_date': _('Tour Date'),
        'fullname': _('Full Name'),
        'phone': _('Phone Number'),
        'email': _('Email'),
        'comment': _('Message'),
        'from_link': _('Sent From Link'),
        'datetime': _('Date')
    },
    'PICKING': {
        'country': _('Country'),
        'duration': _('Tour Duration'),
        'number_of_persons': _('Number of persons'),
        'name': _('First Name'),
        'phone': _('Phone Number'),
        'email': _('Email'),
        'comment': _('Message'),
        'from_link': _('Sent From Link'),
        'datetime': _('Date')
    },
    'SERTIFICATE': {
        'name': _('First Name'),
        'phone': _('Phone Number'),
        'from_link': _('Sent From Link'),
        'datetime': _('Date')
    },
}

CELERY_BROKER_URL = env.str('CELERY_BROKER_URL')

# If you are using HTTPS enable this

# SESSION_COOKIE_SECURE = True
# CSRF_COOKIE_SECURE = True
# SECURE_PROXY_SSL_HEADER = ('HTTP_X_SCHEME', 'https')

handler404 = 'apps.core.views.handler404'
#
