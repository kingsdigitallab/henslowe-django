from .base import *  # noqa

ALLOWED_HOSTS = ['henslowe.kdl.kcl.ac.uk']

INTERNAL_IPS = INTERNAL_IPS + ['']

DATABASES = {
    'default': {
        'ENGINE': db_engine,
        'NAME': 'app_henslowe_liv',
        'USER': 'app_henslowe',
        'PASSWORD': '',
        'HOST': ''
    },
}

SECRET_KEY = ''

WAGTAILSEARCH_BACKENDS = {
    'default': {
        'BACKEND': 'wagtail.search.backends.elasticsearch6',
        'AUTO_UPDATE': True,
        'URLS': ['http://127.0.0.1:9200'],
        'INDEX': 'henslowe_liv',
        'TIMEOUT': 5,
    }
}
