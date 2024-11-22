"""
Django settings for henslowe project.

For the full list of settings and their values, see
https://docs.djangoproject.com/en/dev/ref/settings/

For production settings see
https://docs.djangoproject.com/en/dev/howto/deployment/checklist/
"""

import logging
import os

import environ
from django_auth_ldap.config import LDAPGroupQuery
from kdl_ldap.settings import *  # noqa

env = environ.Env()

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))

PROJECT_NAME = "henslowe"
PROJECT_TITLE = "Henslowe-Alleyn"

# -----------------------------------------------------------------------------
# Core Settings
# https://docs.djangoproject.com/en/dev/ref/settings/#id6
# -----------------------------------------------------------------------------

ADMINS = env.list("DJANGO_ADMINS", default=[])
MANAGERS = ADMINS

ALLOWED_HOSTS = env.list("DJANGO_ALLOWED_HOSTS", default=[])

DATABASES = {
    "default": {
        "ENGINE": "django.db.backends.postgresql_psycopg2",
        "NAME": env.str("POSTGRES_DB", default="app_henslowe3_liv"),
        "USER": env.str("POSTGRES_USER", default="app_henslowe3"),
        "PASSWORD": env.str("POSTGRES_PASSWORD", default=""),
        "HOST": env.str("POSTGRES_HOST", default=""),
    },
}

# https://docs.djangoproject.com/en/dev/ref/settings/#caches
# https://docs.djangoproject.com/en/dev/topics/cache/
# http://redis.io/topics/lru-cache
# http://niwibe.github.io/django-redis/
CACHES = {
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": env.str(
            "DJANGO_CACHE_REDIS_LOCATION", default="redis://redis:6379/0"
        ),
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
            "IGNORE_EXCEPTIONS": True,
        },
    }
}


CSRF_COOKIE_SECURE = True

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = env.bool("DEBUG", default=False)

# -----------------------------------------------------------------------------
# EMAIL SETTINGS
# -----------------------------------------------------------------------------

DEFAULT_FROM_EMAIL = env.str("DJANGO_DEFAULT_FROM_EMAIL", default="noreply@kcl.ac.uk")
EMAIL_HOST = env.str("DJANGO_EMAIL_HOST", default="smtp.cch.kcl.ac.uk")
EMAIL_PORT = env.int("DJANGO_EMAIL_PORT", default=25)
EMAIL_HOST_USER = ""
EMAIL_HOST_PASSWORD = ""
EMAIL_SUBJECT_PREFIX = "[Henslowe {}] ".format(PROJECT_NAME)
EMAIL_USE_TLS = False

# Sender of error messages to ADMINS and MANAGERS
SERVER_EMAIL = DEFAULT_FROM_EMAIL

INSTALLED_APPS = [
    "django.contrib.admin",
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    "django_extensions",
    "compressor",
]

INSTALLED_APPS += [  # your project apps here
    "kdl_ldap",
    "rest_framework",
    "wagtail.core",
    "wagtail.admin",
    "wagtail.documents",
    "wagtail.snippets",
    "wagtail.users",
    "wagtail.images",
    "wagtail.embeds",
    "wagtail.contrib.redirects",
    "wagtail.contrib.forms",
    "wagtail.sites",
    "wagtail.contrib.routable_page",
    "wagtail.contrib.table_block",
    "taggit",
    "modelcluster",
    "wagtail.search",
    "cms",
]

INTERNAL_IPS = ["127.0.0.1", "0.0.0.0"]

# https://docs.djangoproject.com/en/dev/topics/i18n/
LANGUAGE_CODE = "en-gb"
TIME_ZONE = "Europe/London"
USE_I18N = True
USE_L10N = False
USE_TZ = True

LOGGING_ROOT = os.path.join(BASE_DIR, "logs")
LOGGING_LEVEL = logging.DEBUG if DEBUG else logging.WARN

if not os.path.exists(LOGGING_ROOT):
    os.makedirs(LOGGING_ROOT)

LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "verbose": {
            "format": (
                "%(levelname)s %(asctime)s %(module)s "
                "%(process)d %(thread)d %(message)s"
            )
        },
        "simple": {"format": "%(levelname)s %(message)s"},
    },
    "handlers": {
        "file": {
            "level": "DEBUG",
            "class": "logging.handlers.TimedRotatingFileHandler",
            "filename": os.path.join(LOGGING_ROOT, "django.log"),
            "formatter": "verbose",
        },
        "console": {
            "level": "DEBUG",
            "class": "logging.StreamHandler",
            "formatter": "simple",
        },
        "mail_admins": {
            "level": "ERROR",
            "class": "django.utils.log.AdminEmailHandler",
        },
    },
    "loggers": {
        "django": {
            "handlers": ["file", "mail_admins"],
            "level": LOGGING_LEVEL,
            "propagate": True,
        },
        "henslowe": {"handlers": ["file"], "level": LOGGING_LEVEL, "propagate": True},
        "elasticsearch": {
            "handlers": ["file"],
            "level": LOGGING_LEVEL,
            "propagate": True,
        },
    },
}

MIDDLEWARE = [
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.security.SecurityMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    "wagtail.core.middleware.SiteMiddleware",
    "wagtail.contrib.redirects.middleware.RedirectMiddleware",
]

ROOT_URLCONF = PROJECT_NAME + ".urls"

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = env.str("DJANGO_SECRET_KEY", default="")

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [os.path.join(BASE_DIR, "templates")],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [
                "django.contrib.auth.context_processors.auth",
                "django.template.context_processors.debug",
                "django.template.context_processors.media",
                "django.template.context_processors.request",
                "django.template.context_processors.static",
                "django.contrib.messages.context_processors.messages",
                "cms.context_processors.django_settings",
            ],
        },
    },
]

WSGI_APPLICATION = PROJECT_NAME + ".wsgi.application"

# -----------------------------------------------------------------------------
# Authentication
# https://docs.djangoproject.com/en/dev/ref/settings/#auth
# -----------------------------------------------------------------------------

if "wagtail.core" in INSTALLED_APPS:
    LOGIN_URL = "/wagtail/login/"
else:
    LOGIN_URL = "/admin/login/"

if env.bool("PRODUCTION", default=False):
    AUTHENTICATION_BACKENDS = (
        "django.contrib.auth.backends.ModelBackend",
        "django_auth_ldap.backend.LDAPBackend",
    )

AUTH_LDAP_REQUIRE_GROUP = LDAPGroupQuery(
    "cn=kdl-staff," + LDAP_BASE_OU
) | LDAPGroupQuery("cn=henslowe," + LDAP_BASE_OU)

# -----------------------------------------------------------------------------
# Sessions
# https://docs.djangoproject.com/en/dev/ref/settings/#sessions
# -----------------------------------------------------------------------------

SESSION_COOKIE_SECURE = True

# SECURITY
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#session-cookie-httponly
SESSION_COOKIE_HTTPONLY = True
# https://docs.djangoproject.com/en/dev/ref/settings/#csrf-cookie-httponly
CSRF_COOKIE_HTTPONLY = True
# https://docs.djangoproject.com/en/dev/ref/settings/#secure-browser-xss-filter
SECURE_BROWSER_XSS_FILTER = True
# https://docs.djangoproject.com/en/dev/ref/settings/#x-frame-options
X_FRAME_OPTIONS = "SAMEORIGIN"

if env.bool("PRODUCTION", default=False):
    # https://docs.djangoproject.com/en/dev/ref/settings/#secure-proxy-ssl-header
    SECURE_PROXY_SSL_HEADER = ("HTTP_X_FORWARDED_PROTO", "https")
    # https://docs.djangoproject.com/en/dev/ref/settings/#session-cookie-secure
    SESSION_COOKIE_SECURE = True
    # https://docs.djangoproject.com/en/dev/ref/settings/#csrf-cookie-secure
    CSRF_COOKIE_SECURE = True
    # https://docs.djangoproject.com/en/dev/topics/security/#ssl-https
    # https://docs.djangoproject.com/en/dev/ref/settings/#secure-hsts-seconds
    SECURE_HSTS_SECONDS = 518400
    # https://docs.djangoproject.com/en/dev/ref/settings/#secure-hsts-include-subdomains
    SECURE_HSTS_INCLUDE_SUBDOMAINS = True
    # https://docs.djangoproject.com/en/dev/ref/settings/#secure-hsts-preload
    SECURE_HSTS_PRELOAD = True
    # https://docs.djangoproject.com/en/dev/ref/middleware/#x-content-type-options-nosniff
    SECURE_CONTENT_TYPE_NOSNIFF = True

# -----------------------------------------------------------------------------
# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/dev/howto/static-files/
# https://docs.djangoproject.com/en/dev/ref/settings/#static-files
# -----------------------------------------------------------------------------

STATIC_URL = "/static/"
STATIC_ROOT = os.path.join(BASE_DIR, STATIC_URL.strip("/"))

if not os.path.exists(STATIC_ROOT):
    os.makedirs(STATIC_ROOT)

STATICFILES_DIRS = (os.path.join(BASE_DIR, "assets"),)

STATICFILES_FINDERS = (
    "django.contrib.staticfiles.finders.FileSystemFinder",
    "django.contrib.staticfiles.finders.AppDirectoriesFinder",
    "compressor.finders.CompressorFinder",
)

MEDIA_URL = "/media/"
MEDIA_ROOT = os.path.join(BASE_DIR, MEDIA_URL.strip("/"))

if not os.path.exists(MEDIA_ROOT):
    os.makedirs(MEDIA_ROOT)

# -----------------------------------------------------------------------------
# Installed Applications Settings
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Django Compressor
# http://django-compressor.readthedocs.org/en/latest/
# -----------------------------------------------------------------------------

COMPRESS_ENABLED = True

COMPRESS_CSS_FILTERS = [
    # CSS minimizer
    "compressor.filters.cssmin.CSSMinFilter"
]

COMPRESS_PRECOMPILERS = (("text/x-scss", "django_libsass.SassCompiler"),)

# -----------------------------------------------------------------------------
# GLOBALS FOR JS
# -----------------------------------------------------------------------------

# Google Analytics ID
GA_ID = "UA-67707155-16"

# -----------------------------------------------------------------------------
# Wagtail Settings
# -----------------------------------------------------------------------------

WAGTAIL_SITE_NAME = PROJECT_TITLE

ITEMS_PER_PAGE = 10

WAGTAILSEARCH_BACKENDS = {
    "default": {
        "BACKEND": "wagtail.search.backends.db",
    }
}
