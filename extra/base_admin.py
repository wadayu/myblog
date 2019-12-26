from django.contrib import admin
from django.contrib.messages.constants import WARNING

from blog.models import Category


class BaseOwnerAdmin(object):
    """
    1、用来自动补充文章、分类、标签、侧边栏、友联这些model的onwer字段
    2、用来针对queryset过滤当前用户的数据
    """
    exclude = ('owner', )

    def get_list_queryset(self):
        request = self.request
        qs = super().get_list_queryset()
        if str(request.user) == 'admin':
            return qs
        return qs.filter(owner=request.user)

    def save_models(self):
        self.new_obj.owner = self.request.user
        return super().save_models()
