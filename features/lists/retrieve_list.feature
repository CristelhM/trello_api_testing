Feature: Retrieve List
  As an administrator
  I want to retrieve created Lists
  So that members can see them


@acceptance @cristelh
Scenario: LIST_GET_01 - Verify List can be retrieved with valid list's id
   Given I have the board "UMSS" with id as "myId"
   And I send a POST request to "/lists"
     |key    |value       |
     |name   |ListNameTest|
     |idBoard|[myId]      |
  And the status code should be "200"
  And I save the "id" of response as "listId"
  When And I send a GET request to "/lists/{listId}"


