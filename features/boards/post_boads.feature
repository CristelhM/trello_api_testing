Feature: Test

Scenario: Verify is possible to create a board
  Given I send a POST request to "/boards"
    |key |value    |
    |name|test0005 |
  Then the status code should be "200"

