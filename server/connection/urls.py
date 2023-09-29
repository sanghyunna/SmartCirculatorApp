from os import path
from django.urls import include

from connection import views

urlpatterns = [
    path('', views.home, name='home')
]
