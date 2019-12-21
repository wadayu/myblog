from django.contrib import admin

from .models import Comment


@admin.register(Comment)
class CommnetAdmin(admin.ModelAdmin):
    list_display = ('target', 'nickname', 'content', 'created_time', 'status')

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
                ('nickname', )
            )
        }),
    )

    def get_queryset(self, request):
        from blog.models import Post
        qs = super().get_queryset(request)
        if str(request.user) == 'admin':
            return qs
        post_ids = Post.objects.filter(owner=request.user).only('id')
        return qs.filter(target_id__in=post_ids)