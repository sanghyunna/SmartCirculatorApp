import json
from django.http import HttpResponse, JsonResponse

def welcome(request):
    if request.method == 'GET':
        return JsonResponse({
            'status': 'ok',
            'message': 'Method was GET'
            })
    if request.method == 'POST':
        return JsonResponse({
            'status': 'ok',
            'message': 'Method was POST'
            })
    