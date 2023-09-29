from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
import json

def control(request):
    if request.method == 'POST':
        print(request.body)
        return JsonResponse({
            'status': 'ok'
            })
    else:
        return JsonResponse({'status': 'error'})