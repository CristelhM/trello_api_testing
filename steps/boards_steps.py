from utils import request_util
import json


@given(u'I have the board "{boardName}" with id as "{variable}"')
def get_board_id(context, boardName, variable):
    url = context.base_url + "/members/me/boards"
    response = json.loads(request_util.get_request(url, context.query_params).content)
    for board in response:
        if board["name"] == boardName:
            setattr(context, variable, board["id"])

