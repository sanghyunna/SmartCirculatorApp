from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
from service import *

@csrf_exempt
def control(request):
    if request.method == 'POST':
        print(request.body)
        res = request.body.message
        if res == "Up":
            control_up()
        elif res == "Down":
            control_down()
        elif res == "Left":
            control_left()
        elif res == "Right":
            control_right()
        elif res == "Speed Up":
            control_speed_up()
        elif res == "Speed Down":
            control_speed_down()
        else:
            return JsonResponse({
                'status': 'error',
                'message': 'unknown message'
                }, status = 404)
            
    else:
        return JsonResponse({
            'status': 'error',
            'message': 'only POST requests are allowed'
            }, status = 403)