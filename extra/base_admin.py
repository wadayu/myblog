from django.contrib import admin
from django.contrib.messages.constants import WARNING

from blog.models import Category


class BaseOwnerAdmin(admin.ModelAdmin):
    """
    1、用来自动补充文章、分类、标签、侧边栏、友联这些model的onwer字段
    2、用来针对queryset过滤当前用户的数据
    """
    exclude = ('owner', )

    def get_queryset(self, request):
        qs = super(BaseOwnerAdmin, self).get_queryset(request)
        if str(request.user) == 'admin':
            return qs
        return qs.filter(owner=request.user)

    def save_model(self, request, obj, form, change):
        obj.owner = request.user
        return super(BaseOwnerAdmin, self).save_model(request, obj, form, change)


class IsexistAdmin(admin.ModelAdmin):
    def save_model(self, request, obj, form, change):
        if Category.objects.filter(name=obj.name).exists():
            # return self.message_user(request,  '%s Already exist!' % obj.name, level=WARNING)
            return ''
        return super().save_model(request, obj, form, change)
