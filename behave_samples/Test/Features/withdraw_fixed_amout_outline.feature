# Created by ICSC at 2/19/2019
Feature: Withdraw Fixed amount
  # Enter feature description here

  Scenario Outline: Withdraw Fixed amount of 50
    # Enter steps here
    Given I have <Balance> in my account
    When I choose to withdraw the fixed amount of <Withdraw>
    Then I should receive <Received> cash
      And the balance of my account should be <Remaining>
    Examples:
  |Balance|Withdraw|Received|Remaining|
  |$500   |$50     |$50     |$450     |
  |$500   |$100    |$100    |$400     |
  |$500   |$200    |$200    |$300     |
