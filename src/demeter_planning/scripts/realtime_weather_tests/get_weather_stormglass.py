import arrow
import requests
import json

start = arrow.now().floor('day')
end = arrow.now().shift(days=1).floor('day')

response = requests.get(
  'https://api.stormglass.io/v2/tide/extremes/point',
  params={
    'lat': 54.7560,
    'lng': -3.7099,
    # 'start': start.to('UTC').timestamp(),  # Convert to UTC timestamp
    # 'end': end.to('UTC').timestamp(),  # Convert to UTC timestam
    # 'start': arrow.now().floor('day').timestamp(),
    # 'end': arrow.now().shift(days=1).floor('day').timestamp(),
  },
  headers={
    'Authorization': 'a1fa6f16-98e2-11ed-a654-0242ac130002-a1fa6f7a-98e2-11ed-a654-0242ac130002'
  }
)

# Do something with response data.
json_data = response.json()

print(json_data)

# json_data is a dictionary or a list
with open('data.json', 'w') as outfile:
    json.dump(json_data, outfile)
