Feature: Create List
  As an administrator
  I want to create Lists
  So that members can see new Lists created


@acceptance @cristelh
Scenario: LIST_CREATE_01 - Verify List can be created with valid list's name
   Given I have the board "UMSS" with id as "myId"
   When I send a POST request to "/lists"
     |key    |value       |
     |name   |ListNameTest|
     |idBoard|[myId]      |
   Then the status code should be "200"

@functional @cristelh
Scenario: LIST_CREATE_02 - Verify List can be created with short list's name
   Given I have the board "UMSS" with id as "myId"
   When I send a POST request to "/lists"
     |key    |value       |
     |name   |li          |
     |idBoard|[myId]      |
   Then the status code should be "200"

@functional @cristelh
Scenario: LIST_CREATE_03 - Verify List can be created with short list's name
   Given I have the board "UMSS" with id as "myId"
   And I send a POST request to "/lists"
     |key    |value                   |
     |name   |duplicatedName          |
     |idBoard|[myId]                  |
   When I send a POST request to "/lists"
     |key    |value                   |
     |name   |duplicatedName          |
     |idBoard|[myId]                  |
   Then the status code should be "200"

@functional @cristelh
Scenario: LIST_CREATE_04 - Verify List can be created with common special characters
   Given I have the board "UMSS" with id as "myId"
   When I send a POST request to "/lists"
     |key    |value       |
     |name   |_)(*&^%$#@" |
     |idBoard|[myId]      |
   Then the status code should be "200"

@functional @cristelh
Scenario: LIST_CREATE_05 - Verify List can be created with non-common special characters
   Given I have the board "UMSS" with id as "myId"
   When I send a POST request to "/lists"
     |key    |value                                                                    |
     |name   |áàäâãåąæāªèėêęéëēìïíīîįôöòóõøœœºüūùûúčçćñń华☻♥♦♣♠•◘○◙♂♀♪♫☼►◄‼¶§▬↨↑↓" |
     |idBoard|[myId]                                                                   |
   Then the status code should be "200"

@functional @cristelh
Scenario: LIST_CREATE_06 - Verify List can be created with long name
   Given I have the board "UMSS" with id as "myId"
   When I send a POST request to "/lists"
     |key    |value  |
     |name   |Long nameeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee|
     |idBoard|[myId] |
   Then the status code should be "200"