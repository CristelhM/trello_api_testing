import requests 


def get_request(url, params_as_tuple):
	payload = get_payload(params_as_tuple)
	requests.get(url, params=payload)


def post_request(url, params_as_tuple):
	payload = get_payload(params_as_tuple)
	requests.get(url, params=payload)


def put_request(url, params_as_tuple):
	payload = get_payload(params_as_tuple)
	requests.get(url, params=payload)


def delete_request(url, params_as_tuple):
	payload = get_payload(params_as_tuple)
	requests.get(url, params=payload)
