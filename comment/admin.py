from django.contrib import admin

from .models import Comment


@admin.register(Comment)
class CommnetAdmin(admin.ModelAdmin):
    list_display = ('target', 'nickname', 'content', 'website', 'created_time')

    fieldsets = (
        ('评论', {
            'description': '评论的文章',
            'fields': (
                'target',
                'content',
                'status',
            )
        }),
        ('个人信息', {
            'description': '个人基本信息',
            'fields': (
                ('nickname', 'email')
            )
        }),
        ('文章链接地址', {
            'description': '文章Url',
            'fields': (
                'website',
            )
        })
    )