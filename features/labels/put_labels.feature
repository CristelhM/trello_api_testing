Feature: Update labels

@maria @acceptance
Scenario: Verify a label name can be updated
  Given I have the board "Test Design" with id as "boardId"
  And I send a POST request to "/labels"
    |key      |value         |
    |name     |labelToUpdate |
    |idBoard  |{boardId}     |
  And I have the label "labelToUpdate" with id as "labelId" for the board "{boardId}"
  When I send a PUT request to "/labels/{labelId}"
    |key      |value         |
    |name     |newLabelName  |
  Then the status code should be "200"
  And the response body should be
    |key      |value         |
    |name     |newLabelName  |


@maria @functional
Scenario: Verify a label color can be updated
  Given I have the board "Test Design" with id as "boardId"
  And I send a POST request to "/labels"
    |key      |value         |
    |name     |labelToUpdate |
    |idBoard  |{boardId}     |
  And I have the label "labelToUpdate" with id as "labelId" for the board "{boardId}"
  When I send a PUT request to "/labels/{labelId}"
    |key      |value         |
    |color    |green         |
  Then the status code should be "200"
  And the response body should be
    |key      |value         |
    |color    |green         |


@maria @functional
Scenario: Verify a label color can be updated
  Given I have the board "Test Design" with id as "boardId"
  And I send a POST request to "/labels"
    |key      |value         |
    |name     |labelToUpdate |
    |idBoard  |{boardId}     |
    |color    |red           |
  And I have the label "labelToUpdate" with id as "labelId" for the board "{boardId}"
  When I send a PUT request to "/labels/{labelId}"
    |key      |value         |
    |color    |blue          |
  Then the status code should be "200"
  And the response body should be
    |key      |value         |
    |color    |blue          |