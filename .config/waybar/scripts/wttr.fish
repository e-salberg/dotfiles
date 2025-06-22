#!/usr/bin/fish

set -l weather_data (curl -s wttr.in?format=j1)

set -l temp (echo $weather_data | jq -r '.current_condition[0].temp_F')
set -l weather_code (echo $weather_data | jq -r '.current_condition[0].weatherCode')
set -l weather_desc desc #(echo $weather_data | jq -r '.current_condition[0].weatherDesc')
#set -l feels_like (echo $weather_data | jq -r '.current_condition[0].FeelsLikeF')
#set -l wind_direction (echo $weather_data | jq -r '.current_condition[0].winddir16Point')
#set -l wind_speed (echo $weather_data | jq -r '.current_condition[0].windspeedmiles')
#set -l humidity (echo $weather_data | jq -r '.current_condition[0].humidity')
#set -l uv (echo $weather_data | jq -r '.current_condition[0].uvIndex')
#set -l pressure (echo $weather_data | jq -r '.current_condition[0].pressureInches')
#set -l visibility (echo $weather_data | jq -r '.current_condition[0].visibilityMiles')
#set -l sunrise (echo $weather_data | jq -r '.current_condition[0].weather[0].astronomy[0].sunrise')
#set -l sunset (echo $weather_data | jq -r '.current_condition[0].weather[0].astronomy[0].sunset')
#set -l moon_phase (echo $weather_data | jq -r '.current_condition[0].weather[0].astronomy[0].moon_phase')
#set -l moonrise (echo $weather_data | jq -r '.current_condition[0].weather[0].astronomy[0].moonrise')
#set -l moonset (echo $weather_data | jq -r '.current_condition[0].weather[0].astronomy[0].moonset')

switch $weather_code
    case 113
        set -l icon '☀️ '
    case 116
        set -l icon '⛅️ '
    case 119
        set -l icon '☁️ '
    case 122
        set -l icon '☁️ '
    case 143
        set -l icon '🌫 '
    case 176
        set -l icon '🌦 '
    case 179
        set -l icon '🌧 '
    case 182
        set -l icon '🌧 '
    case 185
        set -l icon '🌧 '
    case 200
        set -l icon '⛈ '
    case 227
        set -l icon '🌨 '
    case 230
        set -l icon '❄️ '
    case 248
        set -l icon '🌫 '
    case 260
        set -l icon '🌫 '
    case 263
        set -l icon '🌦 '
    case 266
        set -l icon '🌦 '
    case 281
        set -l icon '🌧 '
    case 284
        set -l icon '🌧 '
    case 293
        set -l icon '🌦 '
    case 296
        set -l icon '🌦 '
    case 299
        set -l icon '🌧 '
    case 302
        set -l icon '🌧 '
    case 305
        set -l icon '🌧 '
    case 308
        set -l icon '🌧 '
    case 311
        set -l icon '🌧 '
    case 314
        set -l icon '🌧 '
    case 317
        set -l icon '🌧 '
    case 320
        set -l icon '🌨 '
    case 323
        set -l icon '🌨 '
    case 326
        set -l icon '🌨 '
    case 329
        set -l icon '❄️ '
    case 332
        set -l icon '❄️ '
    case 335
        set -l icon '❄️ '
    case 338
        set -l icon '❄️ '
    case 350
        set -l icon '🌧 '
    case 353
        set -l icon '🌦 '
    case 356
        set -l icon '🌧 '
    case 359
        set -l icon '🌧 '
    case 362
        set -l icon '🌧 '
    case 365
        set -l icon '🌧 '
    case 368
        set -l icon '🌨 '
    case 371
        set -l icon '❄️ '
    case 374
        set -l icon '🌧 '
    case 377
        set -l icon '🌧 '
    case 386
        set -l icon '⛈ '
    case 389
        set -l icon '🌩 '
    case 392
        set -l icon '⛈ '
    case 395
        set -l icon '❄️ '
end

set -l weather_text "$icon$temp°F"

set -l json_output (printf '{"text": "%s", "tooltip" : "<b>%s %s°F</b>\\\n"}' "$weather_text" "$weather_desc" "$temp" | jq '.')
echo $json_output
