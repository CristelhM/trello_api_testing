Feature: Delete Labels

@maria @acceptance
Scenario: Verify it is possible to delete a label
Given I have the board "Test Design" with id as "boardId"
  And I send a POST request to "/labels"
    |key    |value        |
    |name   |labelToDelete|
    |idBoard|{boardId}    |
  And I have the label "labelToDelete" with id as "labelId" for the board "{boardId}"
When I send a DELETE request to "/labels/{labelId}"
Then the status code should be "200"
When  I send a GET request to "/labels/{labelId}"
Then the status code should be "404"