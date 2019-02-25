Feature: Verify is possible manage members on boards.

@acceptance @nadim
Scenario: Verify that once a user creates a board it becomes an automatic member of it.
Given I send POST request to "/boards"
    |key |value    |
    |name|[NDR]Board Test02 | 
When I send GET request to "/boards/{id}/members"
Then the status code should be "200"
And the members size is "1"

@functional @nadim
Scenario: Verify is not possible to get a list of all the members if the board id is invalid.
Given I send POST request to "/boards"
    |key |value    |
    |name|[NDR]Board Test02 | 
When I send GET request to "/boards/invalid/members"
Then the status code should be "400"

@acceptance @nadim
Scenario: Verify that is possible to add members to a board
Given I send POST request to "/boards"
    |key |value    |
    |name|[NDR]Board Test02 | 
And I add a new member to "/boards/{id}/members"
    |key |value    |
    |fullName|Pepito Perez |
    |email|pepito@gmail.com|
    |type|normal|
When I send GET request to "/boards/{id}/members"
Then the status code should be "200"
And the members size is "2"

@functional @nadim
Scenario: Verify that is not possible to delete a member
Given I send POST request to "/boards"
    |key |value    |
    |name|[NDR]Board Test02 | 
And I add a new member to "/boards/{id}/members"
    |key |value    |
    |fullName|Pepito Perez |
    |email|pepito@gmail.com|
    |type|normal|
When I delete a member using "/boards/{id}/members/{idMember}"
Then the status code should be "401"
And I send GET request to "/boards/{id}/members"
And the members size is "2"