from .base import *   # NOQA

DEBUG = False
ALLOWED_HOSTS = ['*']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',   # 数据库引擎
        'NAME': 'myblog',         # 你要存储数据的库名，事先要创建之
        'USER': 'root',         # 数据库用户名
        'PASSWORD': '123456',     # 密码
        'HOST': '192.168.14.40',    # 主机
        'PORT': '3306',         # 数据库使用的端口
        # 'CONN_MAX_AGE': 5 * 60,
        'OPTIONS': {'charset': 'utf8mb4'}
        # 'TEST': {'NAME': 'testcase_db'}
    }
}


CACHES = {
    'default': {
        'BACKEND': 'django_redis.cache.RedisCache',
        'LOCATION': 'redis://192.168.14.40:6379/0',
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
            "PASSWORD": "lonch@123",
        },
    },
}

REDIS_TIMEOUT = 7*24*60*60
CUBES_REDIS_TIMEOUT = 60*60
NEVER_REDIS_TIMEOUT = 365*24*60*60