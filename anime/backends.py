import re
import sys
import json
import requests

from django.http import QueryDict
from django.template.loader import render_to_string
from django.utils.functional import cached_property
from django.utils.safestring import mark_safe
from embed_video.backends import VideoBackend

class OpenloadBackend(VideoBackend):
    re_detect = re.compile(
        r'^((http(s)?:)?//)?(www\.)?openload\.co/.*', re.I
    )
    re_code = re.compile(r'''openload.co/(.*/)?(?P<code>[\w\-]{11})''', re.I)
    pattern_url = '{protocol}://openload.co/embed/{code}'
