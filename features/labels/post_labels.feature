Feature: Create labels
Scenario: Verify a label can be created
  Given I have the board "Test" with id as "myId"
  When I send a POST request to "/labels"
    |key    |value    |
    |name   |test0005 |
    |idBoard|{myId}   |
  Then the status code should be "200"

