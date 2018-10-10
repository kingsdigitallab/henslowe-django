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
