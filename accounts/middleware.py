from django.utils.deprecation import MiddlewareMixin

from .models import Profile


class OnlineNowMiddleware(MiddlewareMixin):
    """Updates the OnlineUserActivity database whenever an authenticated user makes an HTTP request."""

    @staticmethod
    def process_request(request):
        user = request.user
        if not user.is_authenticated:
            return

        Profile.update_user_activity(user)