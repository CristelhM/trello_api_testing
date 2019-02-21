import yaml

global config_data

config_data = yaml.load(open('../config/config.yml'))


def before_all(context):
    context.base_url = config_data['app']['base_url']
    context.token = config_data['app']['query_auth']['token']
	context.key = config_data['app']['query_auth']['key']
	