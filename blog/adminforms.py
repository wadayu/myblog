from django import forms


class PostAdminform(forms.ModelForm):
    desc = forms.CharField(widget=forms.Textarea, label='摘要', required=False)