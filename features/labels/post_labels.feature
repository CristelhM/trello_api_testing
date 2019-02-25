Feature: Create labels


Scenario: Verify a label can be created
  Given I have the board "Test Design" with id as "myId"
  When I send a POST request to "/labels"
    |key    |value    |
    |name   |label001 |
    |idBoard|{myId}   |
  Then the status code should be "200"
  And the response body should be
    |key    |value    |
    |name   |label001 |
    |idBoard|{myId}   |