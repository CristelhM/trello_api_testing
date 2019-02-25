Feature: Create labels

@maria @acceptance
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


@maria @functional
Scenario: Verify a label can't be created with a color not allowed by the app
  Given I have the board "Test Design" with id as "myId"
  When I send a POST request to "/labels"
    |key    |value    |
    |name   |label001 |
    |idBoard|{myId}   |
    |color  |brown    |
  Then the status code should be "400"
  And the response body should be "invalid value for color"


@maria @functional
Scenario: Verify a label can't be created for an inexistent board
  When I send a POST request to "/labels"
    |key    |value    |
    |name   |label001 |
    |idBoard|err0r1d  |
    |color  |blue     |
  Then the status code should be "400"
  And the response body should be "Invalid id"
