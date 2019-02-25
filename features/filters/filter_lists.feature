Feature: Filter Lists


 @functional @jimmy
 Scenario Outline: FILTERS014, FILTERS015, FILTERS016, FILTERS017 - Verify Filter Lists returns 404 for an invalid method
                   FILTERS014 - Verify Filter Lists returns 404 for a POST method
                   FILTERS015 - Verify Filter Lists returns 404 for a PUT method
                   FILTERS016 - Verify Filter Lists returns 404 for a DELETE method
                   FILTERS017 - Verify Filter Lists returns 404 for a PATCH method
    Given I have the board "Test" with id as "boardId"
    When I send a <method> request to "/boards/{boardId}/lists/all"
    Then the status code should be "404"
    And the response body should be "<response>"
    Examples:
       |method |response                                                           |
       |POST   |Cannot POST /1/boards/{boardId}/lists/all?key={key}&token={token}  |
       |PUT    |Cannot PUT /1/boards/{boardId}/lists/all?key={key}&token={token}   |
       |DELETE |Cannot DELETE /1/boards/{boardId}/lists/all?key={key}&token={token}|
       |PATCH  |Cannot PATCH /1/boards/{boardId}/lists/all?key={key}&token={token} |

 @acceptance @jimmy
 Scenario: FILTERS019 - Verify Filter Lists returns 401 for an invalid key
    Given I have the board "Test" with id as "boardId"
    When I send a GET request to "/boards/{boardId}/lists/all"
       |key|value  |
       |key|invalid|
    Then the status code should be "401"
    And the response body should be "invalid key"

 @acceptance @jimmy
 Scenario: FILTERS0020 - Verify Filter Lists returns 401 for an invalid token
    Given I have the board "Test" with id as "boardId"
    When I send a GET request to "/boards/{boardId}/lists/all"
       |key  |value  |
       |token|invalid|
    Then the status code should be "401"
    And the response body should be "invalid token"

 @acceptance @jimmy
 Scenario: FILTERS025 - Verify Filter Lists returns 400 for an invalid board id
    When I send a GET request to "/boards/invalid/lists/all"
    Then the status code should be "400"
    And the response body should be "invalid id"

@acceptance @jimmy
Scenario: FILTERS021 - Verify Filter Lists returns the closed lists using "all" filter
   Given I have the board "Test" with id as "boardId"
   When I send a GET request to "/boards/{boardId}/lists/all"
   Then the status code should be "200"
   And the response body should be
      |key |value      |
      |name|ClosedList1|
      |name|ClosedList2|
      |name|ClosedList3|
      |name|ClosedList4|
      |name|ClosedList5|
      |name|TestList   |
      |name|TestList2  |
      |name|TestList3  |
      |name|TestList4  |
      |name|TestList5  |

@acceptance @jimmy
Scenario: FILTERS022 - Verify Filter Lists returns the closed lists using "closed" filter
   Given I have the board "Test" with id as "boardId"
   When I send a GET request to "/boards/{boardId}/lists/closed"
   Then the status code should be "200"
   And the response body should be
      |key |value      |
      |name|ClosedList1|
      |name|ClosedList2|
      |name|ClosedList3|
      |name|ClosedList4|
      |name|ClosedList5|

@acceptance @jimmy
Scenario: FILTERS024 - Verify Filter Lists returns the open lists using "open" filter
   Given I have the board "Test" with id as "boardId"
   When I send a GET request to "/boards/{boardId}/lists/open"
   Then the status code should be "200"
   And the response body should be
      |key |value    |
      |name|TestList |
      |name|TestList2|
      |name|TestList3|
      |name|TestList4|
      |name|TestList5|