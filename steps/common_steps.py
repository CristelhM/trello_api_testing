from compare import expect
from utils import context_util, request_util
import json

@then(u'the status code should be "{status_code:d}"')
def status_code_should_be(context, status_code):
    expect(context.response.status_code).to_equal(status_code)


@then(u'the response body should be "{responseBody}"')
def response_body_should_be(context, responseBody):
    expected = context_util.replace_variables(responseBody, context)
    expect(context.response.text).to_equal(expected)


@then(u'the response body should be')
def response_body_should_be(context):
    response = json.loads(context.response.content)
    #print(response)
    for row in context.table:
        if isinstance(response, dict) and row["key"] in response:
            actual = response[row["key"]]
            expected = context_util.replace_variables(row["value"], context)
            expect(actual).to_equal(expected)
        else:
            for index in range(len(response)):
                element = response.pop(index)
                print("ROW:", row)
                actual = element[row["key"]]
                expected = context_util.replace_variables(row["value"], context)
                print("ACTUAL =>", actual)
                print("EXPECTED =>", expected)
                
                expect(actual).to_equal(expected)
                break


@step(u'I send a {method} request to "{endpoint}"')
def send_put_request(context, method, endpoint):
    endpoint = context_util.replace_variables(endpoint, context)
    url = context.base_url + endpoint

    if getattr(context, "table", None):
        for row in context.table:
            context.query_params += ({row["key"]: row["value"]}, )

    switcher = {
        "POST": request_util.post_request(url, context.query_params),
        "GET":  request_util.get_request(url, context.query_params),
        "PUT": request_util.put_request(url, context.query_params), 
        "DELETE": request_util.delete_request(url, context.query_params),
        "PATCH": request_util.patch_request(url, context.query_params)
    }

    context.response = switcher.get(method, "Invalid method.")