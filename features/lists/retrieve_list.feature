Feature: Retrieve List
  As an administrator
  I want to retrieve created Lists
  So that members can see all their attributes correctly


@acceptance @cristelh
Scenario: LIST_GET_01 - Verify List can be retrieved with valid list's id
   Given I have the board "Test" with id as "boardId"
   And I send a POST request to "/lists"
     |key    |value           |
     |name   |ListNameTest    |
     |idBoard|{boardId}       |
   And the status code should be "200"
   And I save the "id" of response as "listId"
   When I send a GET request to "/lists/{listId}"
   Then the response body should be
    |key      |value          |
    |id       |{listId}       |
    |name     |ListNameTest   |
    |idBoard  |{boardId}      |

@functional @cristelh
Scenario: LIST_GET_02 - Verify List can not be retrieved with invalid list's id
   Given I have the board "Test" with id as "boardId"
   When I send a GET request to "/lists/invalidID"
   Then the status code should be "400"

@functional @cristelh
Scenario: LIST_GET_03 - Verify List can be retrieved with valid list's id and sending one query params
   Given I have the board "Test" with id as "boardId"
   And I send a POST request to "/lists"
     |key    |value           |
     |name   |ListNameTest    |
     |idBoard|{boardId}       |
   And the status code should be "200"
   And I save the "id" of response as "listId"
   When I send a GET request to "/lists/{listId}"
      |key    |value     |
      |fields   |name    |
   Then the response body should be
    |key      |value          |
    |id       |{listId}       |
    |name     |ListNameTest   |

@functional @cristelh
Scenario: LIST_GET_04 - Verify archived List can be retrieved with valid list's id
   Given I have the board "Test" with id as "boardId"
   And I send a POST request to "/lists"
     |key    |value           |
     |name   |ListNameTest    |
     |idBoard|{boardId}       |
   And the status code should be "200"
   And I save the "id" of response as "listId"
   And I send a PUT request to "/lists/{listId}"
      |key  |value       |
      |id   |{listId}    |
      |closed|true       |
   When I send a GET request to "/lists/{listId}"
      |key    |value     |
      |fields   |name    |
   Then the response body should be
    |key      |value          |
    |id       |{listId}       |
    |name     |ListNameTest   |