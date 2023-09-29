from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def control(request):
    if request.method == 'POST':
        print(request.body)
        return JsonResponse({
            'status': 'ok'
            })
    else:
        return JsonResponse({'status': 'error'})