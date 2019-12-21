from django.shortcuts import render
from django.shortcuts import get_object_or_404
from django.views.generic import DetailView, ListView
from django.db.models import Q, F
from django_redis import get_redis_connection

from comment.forms import CommentForm
from comment.models import Comment
from .models import Tag, Post, Category
from config.models import SideBar

from datetime import date


class CommonViewMixin:
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update(
            {'sidebars': SideBar.get_all()}
        )
        context.update(Category.get_navs())
        return context


class IndexView(CommonViewMixin, ListView):
    queryset = Post.objects.filter(status=Post.STATUS_NORMAL).order_by('-created_time')
    paginate_by = 6  # 分页
    context_object_name = 'post_list'
    template_name = 'blog/list.html'


class CategoryView(IndexView):
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        category_id = self.kwargs.get('category_id')
        category = get_object_or_404(Category, pk=category_id)
        context.update(
            {'category': category}
        )
        return context

    def get_queryset(self):
        """重写queryset，根据分类过滤"""
        queryset = super().get_queryset()
        category_id = self.kwargs.get('category_id')
        return queryset.filter(category_id=category_id)


class TagView(IndexView):
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        tag_id = self.kwargs.get('tag_id')
        tag = get_object_or_404(Tag, pk=tag_id)
        context.update(
            {'tag': tag}
        )
        return context

    def get_queryset(self):
        """重写queryset，根据标签过滤"""
        queryset = super().get_queryset()
        tag_id = self.kwargs.get('tag_id')
        return queryset.filter(tag__id=tag_id)


class PostDetailView(CommonViewMixin, DetailView):
    # model = Post  # 与queryset二选一
    queryset = Post.objects.filter(status=Post.STATUS_NORMAL)
    template_name = 'blog/detail.html'
    context_object_name = 'post'
    pk_url_kwarg = 'post_id'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            'comment_form': CommentForm,
        })
        return context

    def get(self, request, *args, **kwargs):
        response = super().get(request, *args, **kwargs)
        self.handler_visited()
        return response

    def handler_visited(self):
        """增加pv uv统计"""
        increase_pv = False
        increase_uv = False
        uid = self.request.uid
        pv_key = 'pv:%s:%s' % (uid, self.object.id)
        uv_key = 'uv:%s:%s:%s' % (uid, str(date.today()), self.object.id)

        redis_conn = get_redis_connection('default')
        if not redis_conn.get(pv_key):
            increase_pv = True
            redis_conn.set(pv_key, 1, 1*60)

        if not redis_conn.get(uv_key):
            increase_uv = True
            redis_conn.set(uv_key, 1, 24*60*60)

        if increase_pv and increase_uv:
            Post.objects.filter(id=self.object.id).update(uv=F('uv') + 1, pv=F('pv') + 1)
        elif increase_pv:
            Post.objects.filter(id=self.object.id).update(pv=F('pv') + 1)
        elif increase_uv:
            Post.objects.filter(id=self.object.id).update(uv=F('uv') + 1)


class SearchView(IndexView):
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        keyword = self.request.GET.get('keyword', '')
        context.update({
            'keyword': keyword
        })
        return context

    def get_queryset(self):
        queryset = super().get_queryset()
        keyword = self.request.GET.get('keyword', '')
        if not keyword:
            return queryset
        return queryset.filter(Q(desc__icontains=keyword) | Q(title__icontains=keyword))


class AuthorView(IndexView):
    def get_queryset(self):
        queryset = super().get_queryset()
        author_id = self.kwargs.get('author_id')
        return queryset.filter(owner_id=author_id)




