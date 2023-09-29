import json
from django.http import HttpResponse, JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
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
    