class JSONGenerator:

    @staticmethod
    def get_json(tuple):
        """ Gets a dictionary representation of given tuple
        :param tuple: set of objects sent as dictionary type
        :return: Dictionary
        """
        payload = {}
        for current in tuple:
            for key in current:
                payload[key] = current[key]
        return payload
