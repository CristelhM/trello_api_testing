from utils import context_util, request_util
import json

@given(u'I have the label "{labelName}" with id as "{variable}" for the board "{boardId}"')
def get_board_id(context, labelName, variable, boardId):
    url = context.base_url + "/boards/" + boardId + "/labels"
    url = context_util.replace_variables(url, context)
    response = json.loads(request_util.get_request(url, context.query_params).content)
    for label in response:
        if label["name"] == labelName:
            setattr(context, variable, label["id"])
