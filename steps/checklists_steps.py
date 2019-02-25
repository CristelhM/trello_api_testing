from compare import expect
from utils import request_util
from utils import ids


@given(u'que el nombre de Board es: {name}')
def step_impl(context, name):
    context.nameBoard = name


@given(u'y el nombre de la List es: {name}')
def step_impl(context, name):
    context.nameList = name


@given(u'y el nombre de la Card es: {name}')
def step_impl(context, name):
    context.nameCard = name


@given(u'y el nombre del Checklist es: {name}')
def step_impl(context, name):
    context.nameChecklist = name


@when(u'se envia un POST al endpoint /checklists')
def step_impl(context):
    url_board = context.base_url + "/boards"
    query_board = context.query_params + (
    {"name": context.nameBoard}, {"prefs_background": "lime"}, {"defaultLists": "false"})
    content_board = (request_util.post_request(url_board, query_board)).json()
    idBoard = content_board["id"]
    f = open("utils\ids.py", "w")
    f.write("idBoard = '" + str(idBoard) + "'")

    url_list = context.base_url + "/lists"
    query_list = context.query_params + ({"name": context.nameList}, {"idBoard": idBoard})
    content_list = (request_util.post_request(url_list, query_list)).json()
    idList = content_list["id"]
    f.write("\nidList = '" + str(idList) + "'")

    url_card = context.base_url + "/cards"
    query_card = context.query_params + ({"idList": idList}, {"name": context.nameCard})
    content_card = (request_util.post_request(url_card, query_card)).json()
    idCard = content_card["id"]
    f.write("\nidCard = '" + str(idCard) + "'")

    url_checklist = context.base_url + "/checklists"
    query_checklists = context.query_params + ({"idCard": idCard}, {"name": context.nameChecklist})
    context.response = request_util.post_request(url_checklist, query_checklists)
    content_checklists = context.response.json()
    idChecklists = content_checklists["id"]
    f.write("\nidChecklists = '" + str(idChecklists) + "'")

    f.closed


@then(u'El status code deberia ser {numero:d}')
def step_impl(context, numero):
    expect(context.response.status_code).to_equal(numero)


# -----------------------------------------------------------------------
@given(u'el nombre de un card es : {name}')
def step_impl(context, name):
    context.namecar = name


@given(u'el nombre del checklist es: {name}')
def step_impl(context, name):
    context.namecheck = name


@given(u'el nombre del check item es: {name}')
def step_impl(context, name):
    context.namecheckitem = name


@given(u"y determinar que check item este tiqueado: {tiqueado:w}")
def step_impl(context, tiqueado):
    context.tiqueado = tiqueado



@when(u'se envia un POST a /checklists/id/checkItems')
def step_impl(context):
    url_card = context.base_url + "/cards"
    query_card = context.query_params + ({"idList": ids.idList}, {"name": context.namecar})
    content_card = (request_util.post_request(url_card, query_card)).json()
    idCard = content_card["id"]

    url_checklist = context.base_url + "/checklists"
    query_checklists = context.query_params + ({"idCard": idCard}, {"name": context.namecheck})
    context.response = request_util.post_request(url_checklist, query_checklists)
    content_checklists = context.response.json()
    idChecklists = content_checklists["id"]

    url_item = context.base_url + "/checklists/" + idChecklists + "/checkItems"
    query_checkitems = context.query_params + ({"name": context.namecheckitem}, {"pos": "top"}, {"checked": context.tiqueado})
    context.responseitem2 = (request_util.post_request(url_item, query_checkitems)).status_code


@then(u'el status code el check item deberia  ser {numero:d}')
def step_impl(context, numero):
    expect(int(context.responseitem2)).to_equal(numero)


# -----------------------------------------------------------------------

@when(u'se envia un GET con un id invalido: {id}')
def step_impl(context, id):
    url = context.base_url + "/checklists/" + id
    context.statuscode = (request_util.get_request(url, context.query_params)).status_code


@then(u'el resultado de status code debe ser {numero:d}')
def step_impl(context, numero):
    expect(int(context.statuscode)).to_equal(numero)


# --------------------------------------------------------------------------

@given(u'que el nombre del check item es: {name}')
def step_impl(context, name):
    context.nameitem = name


@given(u'y la posicion del check item en el checklist es: {pos:w}')
def step_impl(context, pos):
    context.positem = pos


@given(u'y determinar si el check item ya esta tiqueado cuando se crea {checked:w}')
def step_impl(context, checked):
    context.checkeditem = checked


@when(u'se envia un POST al checklist creado en el primer escenario')
def step_impl(context):
    url = context.base_url + "/checklists/" + ids.idChecklists + "/checkItems"
    query_checkitems = context.query_params + (
    {"name": context.nameitem}, {"pos": context.positem}, {"checked": context.checkeditem})
    context.responseitem = (request_util.post_request(url, query_checkitems)).status_code


@then(u'el resultado de status code de un check item debe ser {numero:d}')
def step_impl(context, numero):
    expect(int(context.responseitem)).to_equal(numero)
# -----------------------------------------------------------------------------------
