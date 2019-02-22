import yaml

global generic_data
generic_data = yaml.load(open('configuration/config.yml'))

def before_all(context):
    context.host = generic_data['host']
    context.method = generic_data['method']
    context.code = generic_data['code']
