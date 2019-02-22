import unittest

from utils.json_generator import JSONGenerator


class TestJSONGenerator(unittest.TestCase):

    def test_tojsonfromtuple(self):
        tuple = ({"key1": "value1"}, {"key2": "value2"})
        expected = {'key1': 'value1', 'key2': 'value2'}
        actual = JSONGenerator.get_json(tuple)
        self.assertEqual(expected, actual)


if __name__ == '__main__':
    unittest.main()
