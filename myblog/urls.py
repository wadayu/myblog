"""myblog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.conf.urls.static import static
from django.conf import settings
from django.contrib import admin
# from django.views.generic import TemplateView
# from blog.admin import custom_site
import xadmin

from blog.views import IndexView, CategoryView, TagView, PostDetailView, \
    SearchView, AuthorView, TypeView
from extra.autocomplete import TagAutocomplete, CategoryAutocomplete
from config.views import LinkListView
from comment.views import CommentView


urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    url(r'^admin/', xadmin.site.urls),
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^category/(?P<category_id>\d+)/$', CategoryView.as_view(), name='category-list'),
    url(r'^tag/(?P<tag_id>\d+)/$', TagView.as_view(), name='tag-list'),
    url(r'^post/(?P<post_id>\d+).html/$', PostDetailView.as_view(), name='post-detail'),
    url(r'^search/$', SearchView.as_view(), name='search'),
    url(r'^links/$', LinkListView.as_view(), name='links'),
    url(r'^author/(?P<author_id>\d+)/$', AuthorView.as_view(), name='author'),
    url(r'^comment/$', CommentView.as_view(), name='comment'),
    url(r'^type/', TypeView.as_view(), name='type'),
    # 获取Category Tag 后台在添加博客的时候防止分类过多时加载缓慢，每次需要的时候在去加载
    # http://127.0.0.1:8000/category-autocomplete/?q=cate
    url(r'category-autocomplete/$', CategoryAutocomplete.as_view(), name='category-autocomplete'),
    url(r'tag-autocomplete/$', TagAutocomplete.as_view(), name='tag-autocomplete'),
    url(r'^ckeditor/', include('ckeditor_uploader.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# 全局404页面配置
handler404 = 'blog.views.page_notfound'
# 全局500页面配置
handler500 = 'blog.views.page_error'