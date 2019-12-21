# from django.shortcuts import render, render_to_response
# from django.shortcuts import redirect
# from django.views.generic import TemplateView
from django.http import JsonResponse
from django.views.generic import View

from .forms import CommentForm
from .models import Comment

import mistune


class CommentView(View):
    """ajax提交"""
    def post(self, request):
        post_id = request.POST.get('post_id')
        nickname = request.POST.get('nickname')
        content = request.POST.get('content')
        content = mistune.markdown(content)  # 对评论进行Markdown处理

        if not all([post_id, nickname, content]):
            return JsonResponse({'res': 1, 'message': '参数不能为空'})

        if len(nickname) < 1 or len(nickname) > 10:
            return JsonResponse({'res': 4, 'message': '输入昵称不能少于2个字符且不能大于10字符'})

        if len(content) < 10 or len(content) > 200:
            return JsonResponse({'res': 4, 'message': '输入评论不能少于10个字符且不能大于200字符'})

        try:
            Comment.objects.create(
                nickname=nickname,
                content=content,
                target_id=post_id
            )
            return JsonResponse({'res': 0, 'message': '评论成功'})
        except Exception as err:
            return JsonResponse({'res': 3, 'message': '评论失败'})

# class CommentView(TemplateView):
#     http_method_names = ['post']
#     template_name = 'comment/result.html'
#
#     def post(self, request):
#         comment_form = CommentForm(request.POST)
#         target = request.POST.get('target')
#
#         if comment_form.is_valid():
#             comment_form.save()
#             succeed = True
#             return redirect(target)
#         else:
#             succeed = False
#
#         context = {
#             'succeed': succeed,
#             'form': comment_form,
#             'target': target
#         }
#         return self.render_to_response(context)