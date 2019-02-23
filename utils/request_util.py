import requests
from utils.json_generator import JSONGenerator


def get_request(url, params_as_tuple):
	payload = JSONGenerator.get_json(params_as_tuple)
	return requests.get(url, params=payload)


def post_request(url, params_as_tuple):
	payload = JSONGenerator.get_json(params_as_tuple)
	return requests.post(url, params=payload)


def put_request(url, params_as_tuple):
	payload = JSONGenerator.get_json(params_as_tuple)
	return requests.put(url, params=payload)


def delete_request(url, params_as_tuple):
	payload = JSONGenerator.get_json(params_as_tuple)
	return requests.delete(url, params=payload)


# SAMPLES
# def test():
#
#	GET BOARD TEST
# 	#url = "https://api.trello.com/1/boards/{id}"
#
# 	#key = "f288cdaa8e51a96b9626961dbe5cef52"
# 	#token = "c0504935f3b990ca536ec2b615b29f6ce4d07f48f685dae831006ee7445c6a90"
#
# 	#query_auth = ({"key": key}, {"token": token})
#
# 	#response = get_request(url, query_auth)
# 	#print(response)
#
#	CREATE BOARD TEST
# 	url = "https://api.trello.com/1/boards"
#
# 	key = "f288cdaa8e51a96b9626961dbe5cef52"
# 	token = "c0504935f3b990ca536ec2b615b29f6ce4d07f48f685dae831006ee7445c6a90"
#
# 	query_auth = ({"key": key}, {"token": token}, {"name": "test0001"})
#
# 	response = post_request(url, query_auth)
# 	print(response)
#
#
# test()




