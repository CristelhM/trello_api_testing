from utils import context_util, request_util
import json


@given(u'I have the list "{listName}" with id as "{variable}" for the board "{boardId}"')
def save_list_id(context, listName, variable, boardId):
    url = context.base_url + "/boards/" + boardId + "/lists"
    url = context_util.replace_variables(url, context)
    
    response = json.loads(request_util.get_request(url, context.query_params).content)
    for element in response:
        if element["name"] == listName:
            setattr(context, variable, element["id"])