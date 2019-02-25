import unittest
from utils import context_util


class ContextSample:
    """A simple class"""
    values = {}

    def __init__(self):
        self.values['testAsID'] = 1234

    def __contains__(self, key):
        return key in self.values


class MyTestCase(unittest.TestCase):
    def test_is_valid_context_variable_valid(self):
        string = "[testAsID]"
        context = ContextSample()

        expected = True
        actual = context_util.is_valid_context_variable(context, string)

        self.assertEqual(expected, actual)

    def test_is_valid_context_variable_invalid(self):
        string = "testAsID"
        context = ContextSample()

        expected = False
        actual = context_util.is_valid_context_variable(context, string)

        self.assertEqual(expected, actual)


if __name__ == '__main__':
    unittest.main()
