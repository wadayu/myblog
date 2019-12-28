# from django.contrib import admin
# from django.urls import reverse
# from django.utils.html import format_html
# from django.contrib.admin import AdminSite
from django.contrib.auth.models import User
from xadmin.layout import Row, Fieldset, Container
from xadmin.filters import manager, RelatedFieldListFilter
from xadmin import views
import xadmin

from .models import Post, Category, Tag
from .adminforms import PostAdminForm
from extra.base_admin import BaseOwnerAdmin


# 设置显示主题
class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


# 设置title和页脚
class GlobalSetting(object):
    site_title = '博客后台管理系统'
    site_footer = '我的博客'
    # 设置叠加菜单
    # menu_style = 'accordion'
    # apps_icons = {"blog": "fa fa-file-text", 'comment': "fa fa-comment-o", 'config': "fa fa-cog"}


class PostInline:
    form_layout = (
        Container(
            Row('title', 'desc')
        )
    )
    extra = 1
    model = Post


class CategoryAdmin:
    list_display = ('name', 'status', 'is_nav', 'created_time', 'post_count')
    list_editable = ('name', 'status', 'is_nav')
    search_fields = ('name',)
    fields = ('name', 'status', 'is_nav')
    # inlines = [PostInline]
    model_icon = 'fa fa-cogs'

    # form_layout = (
    #     Fieldset(
    #         '基本信息',
    #         Row('name', 'status'),
    #         'is_nav'
    #     )
    # )

    def post_count(self, obj):
        return obj.post_set.all().count()

    post_count.short_description = '文章数量'

    def save_models(self):
        obj = self.new_obj
        if Category.objects.filter(name=obj.name).exists():
            return ''
        return super().save_models()


class TagAdmin:
    list_display = ('name', 'status', 'created_time')
    search_fields = ('name',)
    list_editable = ('name', 'status')
    model_icon = "fa fa-tags"

    form_layout = (
        Fieldset(
            '基本信息',
            Row('name', 'status')
        )
    )
    fields = ('name', 'status')

    def save_models(self):
        if Tag.objects.filter(name=self.new_obj.name).exists():
            return ''
        return super().save_models()


class CategoryOwnerFilter(RelatedFieldListFilter):
    """自定义过滤器只展示当前用户分类"""
    @classmethod
    def test(cls, field, request, params, model, admin_view, field_path):
        return field.name == 'category'

    def __init__(self, field, request, params, model, admin_view, field_path):
        super().__init__(field, request, params, model, admin_view, field_path)
        # 重新获取lookup_choices. 根据owner过滤
        self.lookup_choices = Category.objects.filter(owner=request.user).\
            values_list('id', 'name')


class PostAdmin(BaseOwnerAdmin):
    form = PostAdminForm
    list_display = ('title', 'category', 'status', 'created_time', 'owner', 'uv', 'pv')
    readonly_fields = ['uv','pv']
    # list_editable = ['title', 'category', 'status']
    list_display_links = []
    # list_filter = ['category']  # 注意这里不是定义的filter类，而是字段名
    search_fields = ['title', 'category__name', 'owner']
    model_icon = "fa fa-file"

    # fields = (
    #     ('category', 'title'),
    #     'desc',
    #     'status',
    #     'content',
    #     'tag',
    # )

    form_layout = (
        Fieldset(
          '基础信息',
          Row('title', 'category'),
          'status',
          'tag',
        ),
        Fieldset(
            '内容信息',
            'desc',
            'content'
        )
    )

    def delete_models(self, *args, **kwargs):
        """删除之前缓存数据"""
        for obj in args:
            obj.delete()
        from django.core.cache import cache
        cache.delete('hot_posts')
        cache.delete('latest_posts')


xadmin.site.register(Post, PostAdmin)
xadmin.site.register(Category, CategoryAdmin)
xadmin.site.register(Tag, TagAdmin)

xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSetting)