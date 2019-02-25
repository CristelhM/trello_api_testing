def replace_variables(text, context):

    for attribute in context._origin:
        str_to_replace = "{" + attribute + "}"
        value_to_replace = str(getattr(context, attribute, None))
        text = text.replace(str_to_replace, value_to_replace)

    return text


def is_valid_context_variable(context, param):
    return len(param) > 2 and all([param.startswith('['), param.endswith(']'), param[1: len(param) - 1] in context])
