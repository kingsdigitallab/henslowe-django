from .base import *  # noqa

ALLOWED_HOSTS = ['henslowe-stg.kdl.kcl.ac.uk']

CACHE_REDIS_DATABASE = '1'
CACHES['default']['LOCATION'] = '127.0.0.1:6379:' + CACHE_REDIS_DATABASE

INTERNAL_IPS = INTERNAL_IPS + ['']
ALLOWED_HOSTS = ['']

DATABASES = {
    'default': {
        'ENGINE': db_engine,
        'NAME': 'app_henslowe_stg',
        'USER': 'app_henslowe',
        'PASSWORD': '',
        'HOST': ''
    },
}

SECRET_KEY = ''

WAGTAILSEARCH_BACKENDS = {
    'default': {
        'BACKEND': 'wagtail.search.backends.elasticsearch6',
        'AUTO_UPDATE': False,
        'URLS': ['http://127.0.0.1:9200'],
        'INDEX': 'henslowe_stg',
        'TIMEOUT': 5,
    }
}
