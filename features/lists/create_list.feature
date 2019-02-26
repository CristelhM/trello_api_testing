Feature: Create List
  As an administrator
  I want to create Lists
  So that members can see new Lists created


@acceptance @cristelh
Scenario: LIST_CREATE_01 - Verify List can be created with valid list's name
   Given I have the board "Test" with id as "boardId"
   When I send a POST request to "/lists"
     |key    |value       |
     |name   |ListNameTest|
     |idBoard|{boardId}   |
   Then the status code should be "200"
    And I save the "id" of response as "listId"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |ListNameTest   |
      |idBoard  |{boardId}      |
    And I send a GET request to "/lists/{listId}"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |ListNameTest   |
      |idBoard  |{boardId}      |

@functional @cristelh
Scenario: LIST_CREATE_02 - Verify List can be created with short list's name
   Given I have the board "Test" with id as "boardId"
   When I send a POST request to "/lists"
     |key    |value           |
     |name   |li              |
     |idBoard|{boardId}       |
   Then the status code should be "200"
    And I save the "id" of response as "listId"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |li             |
      |idBoard  |{boardId}      |
    And I send a GET request to "/lists/{listId}"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |li             |
      |idBoard  |{boardId}      |

@functional @cristelh
Scenario: LIST_CREATE_03 - Verify List can be created with duplicated list's name
   Given I have the board "Test" with id as "boardId"
   And I send a POST request to "/lists"
     |key    |value                   |
     |name   |duplicatedName          |
     |idBoard|{boardId}               |
   When I send a POST request to "/lists"
     |key    |value                   |
     |name   |duplicatedName          |
     |idBoard|{boardId}               |
   Then the status code should be "200"
    And I save the "id" of response as "listId"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |duplicatedName |
      |idBoard  |{boardId}      |
    And I send a GET request to "/lists/{listId}"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |duplicatedName |
      |idBoard  |{boardId}      |

@functional @cristelh
Scenario: LIST_CREATE_04 - Verify List can be created with common special characters
   Given I have the board "Test" with id as "boardId"
   When I send a POST request to "/lists"
     |key    |value       |
     |name   |_)(*&^%$#@" |
     |idBoard|{boardId}   |
   Then the status code should be "200"
    And I save the "id" of response as "listId"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |_)(*&^%$#@"    |
      |idBoard  |{boardId}      |
    And I send a GET request to "/lists/{listId}"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |_)(*&^%$#@"    |
      |idBoard  |{boardId}      |

@functional @cristelh
Scenario: LIST_CREATE_05 - Verify List can be created with non-common special characters
   Given I have the board "Test" with id as "boardId"
   When I send a POST request to "/lists"
     |key    |value                                                                    |
     |name   |áàäâãåąæāªèėêęéëēìïíīîįôöòóõøœœºüūùûúčçćñń华☻♥♦♣♠•◘○◙♂♀♪♫☼►◄‼¶§▬↨↑↓" |
     |idBoard|{boardId}                                                                |
   Then the status code should be "200"
   And I save the "id" of response as "listId"
   And the response body should be
      |key      |value                                                                   |
      |id       |{listId}                                                                |
      |name     |áàäâãåąæāªèėêęéëēìïíīîįôöòóõøœœºüūùûúčçćñń华☻♥♦♣♠•◘○◙♂♀♪♫☼►◄‼¶§▬↨↑↓"|
      |idBoard  |{boardId}                                                               |
   And I send a GET request to "/lists/{listId}"
   And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |áàäâãåąæāªèėêęéëēìïíīîįôöòóõøœœºüūùûúčçćñń华☻♥♦♣♠•◘○◙♂♀♪♫☼►◄‼¶§▬↨↑↓" |
      |idBoard  |{boardId}      |

@functional @cristelh
Scenario: LIST_CREATE_06 - Verify List can be created with long name
   Given I have the board "Test" with id as "boardId"
   When I send a POST request to "/lists"
     |key    |value  |
     |name   |Long nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee123444444444444444444444444444444444444444444444444444444444444444|
     |idBoard|{boardId} |
   Then the status code should be "200"
    And I save the "id" of response as "listId"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |Long nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee123444444444444444444444444444444444444444444444444444444444444444    |
      |idBoard  |{boardId}      |
    And I send a GET request to "/lists/{listId}"
    And the response body should be
      |key      |value          |
      |id       |{listId}       |
      |name     |Long nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee123444444444444444444444444444444444444444444444444444444444444444 |
      |idBoard  |{boardId}      |

@functional @cristelh
Scenario: LIST_CREATE_05 - Verify List cannot be created when invalid board id is sent
   When I send a POST request to "/lists"
     |key    |value       |
     |name   |lists123    |
     |idBoard|invalidId   |
   Then the status code should be "400"
    And I send a GET request to "/lists/{invalidId}"
    And the response body should be "invalid id"
