from .base import *   # NOQA

DEBUG = True

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',   # 数据库引擎
        'NAME': 'myblog',         # 你要存储数据的库名，事先要创建之
        'USER': 'root',         # 数据库用户名
        'PASSWORD': '123456',     # 密码
        'HOST': '192.168.14.40',    # 主机
        'PORT': '3306',         # 数据库使用的端口
        # 'TEST': {'NAME': 'testcase_db'}
    }
}


