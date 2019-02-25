from compare import expect
from utils import context_util, request_util
import json


@step(u'the status code should be "{status_code:d}"')
def status_code_should_be(context, status_code):
    expect(status_code).to_equal(context.response.status_code)


@then(u'the response body should be "{responseBody}"')
def response_body_should_be(context, responseBody):
    responseBody = context_util.replace_variables(responseBody, context)
    expect(responseBody).to_equal(context.response.text)


@step(u'I save the "{field}" of response as "{variable}"')
def step_impl(context, field, variable):
    response = json.loads(context.response.text)
    setattr(context, variable, response[field])


@then(u'the response body should be')
def response_body_should_be(context):
    response = json.loads(context.response.content)
    for row in context.table:
        actual = response[row["key"]]
        expected = context_util.replace_variables(row["value"], context)
        expect(actual).to_equal(expected)


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
