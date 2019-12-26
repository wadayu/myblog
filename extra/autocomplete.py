from dal import autocomplete
from blog.models import Tag, Category


class CategoryAutocomplete(autocomplete.Select2QuerySetView):
    """后台在添加博客的时候防止分类过多时加载缓慢，每次需要的时候在去加载"""
    def get_queryset(self):
        # 判断用户是否登录
        # user = self.request.user
        # if not user.is_authenticated():
        #     return Category.objects.none()

        qs = Category.objects.all()

        if self.q:   # q是用户输入的内容
            return qs.filter(name__istartswith=self.q)
        return qs


class TagAutocomplete(autocomplete.Select2QuerySetView):
    def get_queryset(self):
        qs = Tag.objects.filter(status=Tag.STATUS_NORMAL)
        if self.q:
            return qs.filter(name__istartswith=self.q)
        return qs
