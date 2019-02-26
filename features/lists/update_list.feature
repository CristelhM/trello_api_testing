@update_list
Feature: Update List
  As an administrator
  I want to update created Lists
  So that members can see them updated


@acceptance @cristelh
Scenario: LIST_PUT_01 - Verify List name can be updated
   Given I have the board "Test" with id as "boardId"
   And I send a POST request to "/lists"
     |key    |value           |
     |name   |ListNameTest    |
     |idBoard|{boardId}       |
   And the status code should be "200"
   And I save the "id" of response as "listId"
   When I send a PUT request to "/lists/{listId}"
      |key  |value       |
      |id   |{listId}    |
      |name |Updated     |
   Then the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |Updated        |
      |idBoard  |{boardId}      |
    And I send a GET request to "/lists/{listId}"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |Updated        |
      |idBoard  |{boardId}      |

@acceptance @cristelh
Scenario: LIST_PUT_02 - Verify List name can be updated and one query param is sent
   Given I have the board "Test" with id as "boardId"
   And I send a POST request to "/lists"
     |key    |value           |
     |name   |ListNameTest    |
     |idBoard|{boardId}       |
   And the status code should be "200"
   And I save the "id" of response as "listId"
   When I send a PUT request to "/lists/{listId}"
      |key  |value       |
      |id   |{listId}    |
      |name |Updated     |
      |idBoard|{boardId} |
   Then the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |Updated        |
      |idBoard  |{boardId}      |
    And I send a GET request to "/lists/{listId}"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |Updated        |
      |idBoard  |{boardId}      |

@functional @cristelh
Scenario: LIST_PUT_03 - Verify List can not be updated with invalid list's id
   Given I have the board "Test" with id as "boardId"
   When I send a PUT request to "/lists/invalidID"
   Then the status code should be "400"
    And I send a GET request to "/lists/invalidID"
    And the response body should be "invalid id"

@functional @cristelh
Scenario: LIST_PUT_04 - Verify List can be updated to be archived
   Given I have the board "Test" with id as "boardId"
   And I send a POST request to "/lists"
     |key    |value           |
     |name   |ListNameTest    |
     |idBoard|{boardId}       |
   And the status code should be "200"
   And I save the "id" of response as "listId"
   When I send a PUT request to "/lists/{listId}"
      |key  |value       |
      |id   |{listId}    |
      |name |Updated     |
      |closed|true       |
   Then the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |Updated        |
      |idBoard  |{boardId}      |
    And I send a GET request to "/lists/{listId}"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |Updated        |
      |idBoard  |{boardId}      |

@functional @cristelh
Scenario: LIST_PUT_05 - Verify Archived List can be updated when it is archived
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
   When I send a PUT request to "/lists/{listId}"
      |key  |value       |
      |id   |{listId}    |
      |name |UpdatedName |
   Then the status code should be "200"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |UpdatedName    |
    And I send a GET request to "/lists/{listId}"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |UpdatedName        |
      |idBoard  |{boardId}      |