from compare import expect

@given(u'I have connection to "{host}"')
def step_impl(context, host):
    expect(context.host).to_equal(host)


@when(u'I {method}')
def step_impl(context, method):
    expect(context.method).to_equal(method)


@then(u'I receive status code {code}')
def step_impl(context, code):
    expect(context.code).to_equal(code)
