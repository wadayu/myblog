from dal import autocomplete
from django import forms
# from ckeditor.widgets import CKEditorWidget
from ckeditor_uploader.widgets import CKEditorUploadingWidget

from blog.models import Category, Tag, Post


class PostAdminForm(forms.ModelForm):
    desc = forms.CharField(widget=forms.Textarea, label='摘要', required=True)
    category = forms.ModelChoiceField(
        queryset=Category.objects.all(),
        widget=autocomplete.ModelSelect2(url='category-autocomplete'),
        label='分类'
    )
    # tag = forms.ModelMultipleChoiceField(
    #     queryset=Tag.objects.all(),
    #     widget=autocomplete.ModelSelect2(url='tag-autocomplete'),
    #     label='标签'
    # )

    # content = forms.CharField(widget=CKEditorWidget(), label='正文', required=True)   # 没有上传图片的功能
    content = forms.CharField(widget=CKEditorUploadingWidget(), label='正文', required=True)

    class Meta:
        model = Post
        fields = ('category', 'tag', 'title', 'desc', 'content', 'status')