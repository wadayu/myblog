from django.db import models

from blog.models import Post


class Comment(models.Model):
    STATUS_NORMAL = 1
    STATUS_DELETE = 0
    STATUS_ITEMS = (
        (STATUS_NORMAL, '正常'),
        (STATUS_DELETE, '删除'),
    )

    target = models.ForeignKey(Post, verbose_name='评论目标')
    # target = models.CharField(max_length=100, verbose_name='评论目标')
    content = models.CharField(max_length=2000, verbose_name='内容')
    nickname = models.CharField(max_length=50, verbose_name='昵称')
    # website = models.URLField(verbose_name='网址')
    # email = models.EmailField(verbose_name='邮箱')
    status = models.PositiveIntegerField(default=STATUS_NORMAL,
                                         choices=STATUS_ITEMS, verbose_name='状态')
    created_time = models.DateTimeField(auto_now_add=True, verbose_name='创建时间')

    class Meta:
        db_table = 'comment'
        verbose_name = verbose_name_plural = '评论'

    def __str__(self):
        return '{}评论添加成功'.format(self.target.title)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)

        from django.core.cache import cache
        post_id = self.target_id
        comment_key = 'comments_%s' % post_id
        cache.delete(comment_key)

    @classmethod
    def get_latest_comments(cls):
        return cls.objects.filter(status=Comment.STATUS_NORMAL).order_by('-created_time')


