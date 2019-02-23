from compare import expect


@then(u'the status code should be "{status_code:d}"')
def step_impl(context, status_code):
    expect(context.response.status_code).to_equal(status_code)

