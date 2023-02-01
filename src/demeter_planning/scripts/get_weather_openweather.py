import requests
from datetime import datetime, timedelta

# Replace with your own API key
api_key = '0d184368a1cb9a87cb2981eec1567185'

# Coordinates of the location you want to get the forecast for
latitude = 54.7560
longitude = -3.7099

# Make the API request
url = 'http://api.openweathermap.org/data/2.5/forecast?lat={}&lon={}&appid={}'.format(latitude, longitude, api_key)
response = requests.get(url)

# Check the status code of the response
if response.status_code != 200:
    print('Error: Failed to get the forecast')
    exit()

# Get the data from the response
data = response.json()
print(data)
print('------------------')
print(type(data))
X

# Get the current time
now = datetime.now()

# Get the forecast for the next 12 hours
forecast = None
for f in data['list']:
    forecast_time = datetime.fromtimestamp(f['dt'])
    if forecast_time >= now and forecast_time <= now + timedelta(hours=12):
        forecast = f
        break

if forecast:
    # Get the wind speed and direction
    wind = forecast['wind']
    speed = wind['speed']
    direction = wind['deg']

    # Get the overall weather condition
    weather = forecast['weather'][0]
    condition = weather['main']

    # Print the forecast
    print('Wind Speed:', speed, 'm/s')
    print('Wind Direction:', direction, 'degrees')
    print('Weather Condition:', condition)
else:
    print("No forecast available for the next 12 hours")
