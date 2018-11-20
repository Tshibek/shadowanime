from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm, PasswordChangeForm
from django.core.files.images import get_image_dimensions
from sorl.thumbnail import ImageField
from .models import Profile, FavoriteAnime


class SignUpForm(UserCreationForm):
    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')



class ChangePasswordForm(PasswordChangeForm):
    class Meta:
        model = User
        fields = ('old_password', 'new_password1', 'new_password2')
        help_texts = None

    def __init__(self, *args, **kwargs):
        super(PasswordChangeForm, self).__init__(*args, **kwargs)




class FavoriteAnimeForm(forms.ModelForm):
    class Meta:
        model = FavoriteAnime
        fields = [
            'user',
            'anime',
        ]





class AvatarUpload(forms.ModelForm):
    class Meta:
        model = Profile
        fields = [
            'avatar',
        ]

    def clean_avatar(self):
        avatar = self.cleaned_data['avatar']

        try:
            w, h = get_image_dimensions(avatar)

            # validate dimensions
            max_width = max_height = 1000
            if w > max_width or h > max_height:
                raise forms.ValidationError(
                    u'Please use an image that is '
                    '%s x %s pixels or smaller.' % (max_width, max_height))

            # validate content type
            main, sub = avatar.content_type.split('/')
            if not (main == 'image' and sub in ['jpeg', 'jpg', 'gif', 'png']):
                raise forms.ValidationError(u'Please use a JPEG, '
                                            'PNG image.')

            # validate file size
            if len(avatar) > (20 * 1024 * 1024):
                raise forms.ValidationError(
                    u'Avatar file size may not exceed 20k.')

        except AttributeError:
            """
            Handles case when we are updating the user profile
            and do not supply a new avatar
            """
            pass

        return avatar


class EditUserPersonal(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ('language', )


class SignatureUserForm(forms.ModelForm):
    class Meta:
        model = Profile
        fields = ('signature',)
