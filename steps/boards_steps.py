from utils import request_util


@given(u'I send a POST request to "{endpoint}"')
def step_impl(context, endpoint):

    query_params = ({"key": context.key}, {"token": context.token})
    for row in context.table:
        query_params += ({row["key"]: row["value"]}, )

    context.response = request_util.post_request(context.base_url + endpoint, query_params)
