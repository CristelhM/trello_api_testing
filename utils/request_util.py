import requests 
from JSONGenerator import get_json

def get_request(url, params_as_tuple):
	payload = get_json(params_as_tuple)
	return requests.get(url, params=payload)


def post_request(url, params_as_tuple):
	payload = get_json(params_as_tuple)
	return requests.post(url, params=payload)


def put_request(url, params_as_tuple):
	payload = get_json(params_as_tuple)
	return requests.put(url, params=payload)


def delete_request(url, params_as_tuple):
	payload = get_json(params_as_tuple)
	return requests.delete(url, params=payload)
