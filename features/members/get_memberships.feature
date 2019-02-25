Feature: Verify is possible manage memberships on boards.

@functional @nadim
Scenario: Verify that once a user creates a board it becomes an automatic member of it with the role admin.
Given I send a POST request to "/boards"
    |key |value    |
    |name|[NDR]Board Test03 | 
When I send a GET request to "/boards/{id}/memberships"
Then the status code should be "200"
And the members size is "1"
And the membership retrieved has "admin" role

@functional @nadim
Scenario: Verify is not possible to get memberships with an invalid id of board.
Given I send a POST request to "/boards"
    |key |value    |
    |name|[NDR]Board Test03 | 
When I send a GET request to "/boards/invalid/memberships"
Then the status code should be "400"

@acceptance @nadim
Scenario: Verify that once a member is created a membership is created automatically with the board.
Given I send a POST request to "/boards"
    |key |value    |
    |name|[NDR]Board Test02 | 
And I add a new member to "/boards/{id}/members"
    |key |value    |
    |fullName|Pepito Perez |
    |email|pepito@gmail.com|
    |type|normal|
When I send a GET request to "/boards/{id}/memberships"
Then the status code should be "200"
And the members size is "2"
