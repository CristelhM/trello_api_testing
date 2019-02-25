Feature: Verify is possible delete members from board.

@acceptance @nadim
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

@functional @nadim
Scenario: Verify that is not possible to delete a member with invalid board id
Given I send POST request to "/boards"
    |key |value    |
    |name|[NDR]Board Test02 | 
And I add a new member to "/boards/{id}/members"
    |key |value    |
    |fullName|Pepito Perez |
    |email|pepito@gmail.com|
    |type|normal|
When I delete a member using "/boards/invalid/members/{idMember}"
Then the status code should be "400"
And I send GET request to "/boards/{id}/members"
And the members size is "2"
