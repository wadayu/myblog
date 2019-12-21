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
from django.conf.urls import url
from django.contrib import admin
# from django.views.generic import TemplateView
# from blog.admin import custom_site

from blog.views import IndexView, CategoryView, TagView, PostDetailView, \
    SearchView, AuthorView
from config.views import LinkListView
from comment.views import CommentView

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    # url(r'^admin/', custom_site.urls),
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^category/(?P<category_id>\d+)/$', CategoryView.as_view(), name='category-list'),
    url(r'^tag/(?P<tag_id>\d+)/$', TagView.as_view(), name='tag-list'),
    url(r'^post/(?P<post_id>\d+).html/$', PostDetailView.as_view(), name='post-detail'),
    url(r'^search/$', SearchView.as_view(), name='search'),
    url(r'^links/$', LinkListView.as_view(), name='links'),
    url(r'^author/(?P<author_id>\d+)/$', AuthorView.as_view(), name='author'),
    url(r'^comment/$', CommentView.as_view(), name='comment')
]
