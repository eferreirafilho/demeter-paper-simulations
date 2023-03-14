import arrow
import requests
import json


print(json_data)

# json_data is a dictionary or a list
with open('data.json', 'w') as outfile:
    json.dump(json_data, outfile)
