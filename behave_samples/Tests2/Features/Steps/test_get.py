import requests

r = requests.get('https://api.github.com/events')

print("Values \n", r.text)
print("CONTENT \n", r.content)
print("CODE \n", r.status_code)
