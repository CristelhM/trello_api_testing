Feature: Filter Cards


# @funcional @jimmy
# Scenario Outline: FILTERS001, FILTERS002, FILTERS003, FILTERS004 - Verify Filter Cards returns 404 for an invalid method
#                   FILTERS001 - Verify Filter Cards returns 404 for a POST method
#                   FILTERS002 - Verify Filter Cards returns 404 for a PUT method
#                   FILTERS003 - Verify Filter Cards returns 404 for a DELETE method
#                   FILTERS003 - Verify Filter Cards returns 404 for a PATCH method
#    Given I have the board "Test" with id as "myId"
#    When I send a <method> request to "/boards/{myId}/cards/all"
#    Then the status code should be "404"
#    And the response body should be "<response>"
#    Examples:
#       |method |response                                                        |
#       |POST   |Cannot POST /1/boards/{myId}/cards/all?key={key}&token={token}  |
#       |PUT    |Cannot PUT /1/boards/{myId}/cards/all?key={key}&token={token}   |
#       |DELETE |Cannot DELETE /1/boards/{myId}/cards/all?key={key}&token={token}|
#       |PATCH  |Cannot PATCH /1/boards/{myId}/cards/all?key={key}&token={token} |

# @functional @jimmy
# Scenario: FILTERS005 - Verify Filter Cards returns 400 for an invalid filter
#    Given I have the board "Test" with id as "myId"
#    When I send a GET request to "/boards/{myId}/cards/invalid"
#    Then the status code should be "400"
#    And the response body should be "invalid id"

# @acceptance @jimmy
# Scenario: FILTERS006 - Verify Filter Cards returns 401 for an invalid key
#    Given I have the board "Test" with id as "myId"
#    When I send a GET request to "/boards/{myId}/cards/all"
#       |key|value  |
#       |key|invalid|
#    Then the status code should be "401"
#    And the response body should be "invalid key"

# @acceptance @jimmy
# Scenario: FILTERS007 - Verify Filter Cards returns 401 for an invalid token
#    Given I have the board "Test" with id as "myId"
#    When I send a GET request to "/boards/{myId}/cards/all"
#       |key  |value  |
#       |token|invalid|
#    Then the status code should be "401"
#    And the response body should be "invalid token"

# @acceptance @jimmy
# Scenario: FILTERS013 - Verify Filter Cards returns 400 for an invalid board id
#    When I send a GET request to "/boards/invalid/cards/all"
#    Then the status code should be "400"
#    And the response body should be "invalid id"

@acceptance @jimmy
Scenario: FILTERS008 - Verify Filter Cards returns all the cards using "all" filter
   Given I have the board "Test" with id as "myId"
   When I send a GET request to "/boards/{myId}/cards/all"
   Then the status code should be "200"
   And the response body should be
      |key |value|
      |name|open1|
      |name|open2|
      |name|open3|
      |name|open5|
      |name|open4|