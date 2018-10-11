from .base import *  # noqa

ALLOWED_HOSTS = ['127.0.0.1',
                 'localhost'
                 '[::1]',
                 'henslowe-dev.kdl.kcl.ac.uk']

CACHE_REDIS_DATABASE = '2'
CACHES['default']['LOCATION'] = '127.0.0.1:6379:' + CACHE_REDIS_DATABASE

DEBUG = True

INTERNAL_IPS = INTERNAL_IPS + ['']

DATABASES = {
    'default': {
        'ENGINE': db_engine,
        'NAME': 'app_henslowe_dev',
        'USER': 'app_henslowe',
        'PASSWORD': '',
        'HOST': ''
    },
}

LOGGING_LEVEL = logging.DEBUG

LOGGING['loggers']['henslowe']['level'] = LOGGING_LEVEL

SECRET_KEY = ''

WAGTAILSEARCH_BACKENDS = {
    'default': {
        'BACKEND': 'wagtail.search.backends.elasticsearch6',
        'AUTO_UPDATE': True,
        'URLS': ['http://127.0.0.1:9200'],
        'INDEX': 'henslowe_dev',
        'TIMEOUT': 5,
    }
}

# -----------------------------------------------------------------------------
# Django Debug Toolbar
# http://django-debug-toolbar.readthedocs.org/en/latest/
# -----------------------------------------------------------------------------

try:
    import debug_toolbar  # noqa

    INSTALLED_APPS = INSTALLED_APPS + ['debug_toolbar', ]
    MIDDLEWARE += [
        'debug_toolbar.middleware.DebugToolbarMiddleware']
    DEBUG_TOOLBAR_PATCH_SETTINGS = True
except ImportError:
    pass