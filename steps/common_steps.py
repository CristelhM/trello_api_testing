from compare import expect
from utils import context_util, request_util
import json


@step(u'the status code should be "{status_code:d}"')
def status_code_should_be(context, status_code):
    expect(status_code).to_equal(context.response.status_code)


@then(u'the response body should be "{response_body}"')
def response_body_should_be(context, response_body):
    response_body = context_util.replace_variables(response_body, context)
    expect(response_body).to_equal(context.response.text)


@step(u'I save the "{field}" of response as "{variable}"')
def step_impl(context, field, variable):
    response = json.loads(context.response.text)
    setattr(context, variable, response[field])


@then(u'the response body should be')
def response_body_should_be(context):
    response = json.loads(context.response.content)
    print(response)
    for key, value in context.table:
        if isinstance(response, dict) and key in response:
            actual = response[key]
            expected = context_util.replace_variables(value, context)
            expect(expected).to_equal(actual)
        else:
            exist = exist_value_in_json_array(response, key, value)
            expect(exist).to_be_truthy()


@step(u'I send a {method} request to "{endpoint}"')
def send_put_request(context, method, endpoint):
    endpoint = context_util.replace_variables(endpoint, context)
    url = context.base_url + endpoint

    if getattr(context, "table", None):
        for key, value in context.table:
            value = context_util.replace_variables(value, context)
            context.query_params += ({key: value}, )

    switcher = {
        "POST": request_util.post_request(url, context.query_params),
        "GET":  request_util.get_request(url, context.query_params),
        "PUT": request_util.put_request(url, context.query_params), 
        "DELETE": request_util.delete_request(url, context.query_params),
        "PATCH": request_util.patch_request(url, context.query_params)
    }

    context.response = switcher.get(method, "Invalid method.")


def exist_value_in_json_array(array, key, value):
    for item in array:
        if item[key] == value:
            return True
    return False
