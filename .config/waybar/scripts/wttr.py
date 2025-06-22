#!/usr/bin/env python

#TODO - rewrite this in bash or fish script... python is super slow

import json
import requests
from datetime import datetime

WEATHER_CODES = {
    '113': '☀️',
    '116': '⛅️',
    '119': '☁️',
    '122': '☁️',
    '143': '🌫',
    '176': '🌦',
    '179': '🌧',
    '182': '🌧',
    '185': '🌧',
    '200': '⛈',
    '227': '🌨',
    '230': '❄️',
    '248': '🌫',
    '260': '🌫',
    '263': '🌦',
    '266': '🌦',
    '281': '🌧',
    '284': '🌧',
    '293': '🌦',
    '296': '🌦',
    '299': '🌧',
    '302': '🌧',
    '305': '🌧',
    '308': '🌧',
    '311': '🌧',
    '314': '🌧',
    '317': '🌧',
    '320': '🌨',
    '323': '🌨',
    '326': '🌨',
    '329': '❄️',
    '332': '❄️',
    '335': '❄️',
    '338': '❄️',
    '350': '🌧',
    '353': '🌦',
    '356': '🌧',
    '359': '🌧',
    '362': '🌧',
    '365': '🌧',
    '368': '🌨',
    '371': '❄️',
    '374': '🌧',
    '377': '🌧',
    '386': '⛈',
    '389': '🌩',
    '392': '⛈',
    '395': '❄️'
}

data = {}
weather = requests.get(f"https://wttr.in/?format=j1").json()
current_condition = weather['current_condition'][0]
astronomy = weather['weather'][0]['astronomy'][0]

data['text'] = WEATHER_CODES[current_condition['weatherCode']] + \
    " "+current_condition['temp_F']+"°F"

data['tooltip'] = f"<b>{current_condition['weatherDesc'][0]['value']} {current_condition['temp_F']}°F</b>\n"
data['tooltip'] += f"Feels like: {current_condition['FeelsLikeF']}°F\n"
data['tooltip'] += f"Wind: {current_condition['winddir16Point']} {current_condition['windspeedMiles']} mph\n"
data['tooltip'] += f"Humidity: {current_condition['humidity']}%\n"
data['tooltip'] += f"UV index: {current_condition['uvIndex']}\n"
data['tooltip'] += f"Pressure: {current_condition['pressureInches']} in\n"
data['tooltip'] += f"Visibility: {current_condition['visibilityMiles']} mi\n"
data['tooltip'] += f"Sunrise: {astronomy['sunrise']}\n"
data['tooltip'] += f"Sunset: {astronomy['sunset']}\n"
data['tooltip'] += f"Moon Phase: {astronomy['moon_phase']}\n"
data['tooltip'] += f"Moonrise: {astronomy['moonrise']}\n"
data['tooltip'] += f"Moonset: {astronomy['moonset']}"

print(json.dumps(data))
