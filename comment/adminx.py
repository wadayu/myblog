from xadmin.layout import Fieldset, Row
import xadmin

from .models import Comment


class CommentAdmin(object):
    list_display = ('target', 'nickname', 'content', 'created_time', 'status')
    search_fields = ('target__title',)
    model_icon = 'fa fa-comments'

    form_layout = (
        Fieldset(
            '基本信息',
            Row('nickname', 'status')
        ),
        Fieldset(
            '评论文章',
            'target',
            'content'
        )
    )

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

    def get_list_queryset(self):
        from blog.models import Post
        request = self.request
        qs = super().get_list_queryset()
        if str(request.user) == 'admin':
            return qs
        post_ids = Post.objects.filter(owner=request.user).only('id')
        return qs.filter(target_id__in=post_ids)


xadmin.site.register(Comment, CommentAdmin)