import unittest
from django.urls import reverse
from django.test import Client
from .models import Model
from django.contrib.auth.models import User
from django.contrib.auth.models import Group
from django.contrib.contenttypes.models import ContentType


def create_django_contrib_auth_models_user(**kwargs):
    defaults = {}
    defaults["username"] = "username"
    defaults["email"] = "username@tempurl.com"
    defaults.update(**kwargs)
    return User.objects.create(**defaults)


def create_django_contrib_auth_models_group(**kwargs):
    defaults = {}
    defaults["name"] = "group"
    defaults.update(**kwargs)
    return Group.objects.create(**defaults)


def create_django_contrib_contenttypes_models_contenttype(**kwargs):
    defaults = {}
    defaults.update(**kwargs)
    return ContentType.objects.create(**defaults)


def create_model(**kwargs):
    defaults = {}
    defaults["name"] = "name"
    defaults.update(**kwargs)
    return Model.objects.create(**defaults)


class ModelViewTest(unittest.TestCase):
    '''
    Tests for Model
    '''
    def setUp(self):
        self.client = Client()

    def test_list_model(self):
        url = reverse('shadow_model_list')
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)

    def test_create_model(self):
        url = reverse('shadow_model_create')
        data = {
            "name": "name",
        }
        response = self.client.post(url, data=data)
        self.assertEqual(response.status_code, 302)

    def test_detail_model(self):
        model = create_model()
        url = reverse('shadow_model_detail', args=[model.slug,])
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)

    def test_update_model(self):
        model = create_model()
        data = {
            "name": "name",
        }
        url = reverse('shadow_model_update', args=[model.slug,])
        response = self.client.post(url, data)
        self.assertEqual(response.status_code, 302)


