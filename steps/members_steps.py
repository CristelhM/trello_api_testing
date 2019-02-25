from utils import request_util
import json
from compare import expect
import collections

@given(u'I send POST request to "{endpoint}"')
def step_impl(context, endpoint):

    query_params = ({"key": context.key}, {"token": context.token})
    for row in context.table:
        query_params += ({row["key"]: row["value"]}, )

    context.response = request_util.post_request(context.base_url + endpoint, query_params)

    data = context.response.json()
    idRecord = data['id']
    context.boardId = idRecord

@given(u'I add a new member to "{endpoint}"')
def step_impl(context,endpoint):
    query_params = ({"key": context.key}, {"token": context.token})

    #Adding values from context.table to query_params to be sent on the requests.
    for row in context.table:
        query_params += ({row["key"]: row["value"]}, )

    #Getting board id, baords_steps didn't updated because are of general use.
    data = context.response.json()
    idRecord = data['id']
    query_params += ({"id": idRecord}, )

    endpoint = endpoint.replace('{id}',idRecord)
    context.response = request_util.put_request(context.base_url + endpoint, query_params)

    #Save member Id to be used later
    data = context.response.json()
    idRecord = data['id']
    context.recordId = idRecord

@when(u'I send GET request to "{endpoint}"')
@then(u'I send GET request to "{endpoint}"')
def step_impl(context,endpoint):
    query_params = ({"key": context.key}, {"token": context.token})

    endpoint = endpoint.replace('{id}',context.boardId)
    context.getResponse = request_util.get_request(context.base_url + endpoint, query_params)
    context.response = context.getResponse

@when(u'I delete a member using "{endpoint}"')
def step_impl(context,endpoint):
    print(context.recordId)
    
    query_params = ({"key": context.key}, {"token": context.token})

    endpoint = endpoint.replace('{id}',context.boardId)
    endpoint = endpoint.replace('{idMember}',context.recordId)
    
    print('endpoint::',endpoint)
    context.response = request_util.delete_request(context.base_url + endpoint, query_params)
    print('delete::context.response::::', context.response)

@then(u'the members size is "{size:d}"')
def step_impl(context,size):
    array = context.getResponse.content
    listOfElements  = json.loads(array)
    expect(len(listOfElements)).to_equal(size)

@then(u'the membership retrieved has "{role}" role')
def step_impl(context,role):
    array = context.getResponse.content
    
    listOfElements  = json.loads(array)

    memberType = 'none'
    if len(listOfElements) > 0:
        memberType = listOfElements[0]['memberType']

    expect(role).to_equal(memberType)
