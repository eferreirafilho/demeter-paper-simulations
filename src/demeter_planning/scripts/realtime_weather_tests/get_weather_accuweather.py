import requests

# Set the API endpoint and parameters
api_key = 'r1qC5K9PpYiFQfnaIbT3lnGecGqIGvZS'
# Robin Rigg Wind Farm, UK:
# Latitude: 54 degrees 45' 21.6"  Longitude: -3 degrees 42' 35.9", transformed to decimal degrees:
lat = 54.7560
lon = -3.7099

api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}&appid={API key}

# Get the location key for the specified coordinates
url_location = "http://dataservice.accuweather.com/locations/v1/cities/geoposition/search"
params = {'apikey': api_key, 'q': str(lat) + ',' + str(lon)}
location_key = requests.get(url_location, params=params).json()['Key']

# Get the hourly forecast for the location
url_forecast = "http://dataservice.accuweather.com/forecasts/v1/hourly/12hour/{locationKey}"
params = {'apikey': api_key}
forecast = requests.get(url_forecast.format(locationKey=location_key), params=params).json()

print forecast
print('------------------')
print('Hourly forecast for the next 12 hours:')
for hour in forecast:
    description = hour['IconPhrase']
    print description
