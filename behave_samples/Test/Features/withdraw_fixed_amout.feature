# Created by ICSC at 2/19/2019
Feature: Withdraw Fixed amount
  # Enter feature description here
  Scenario: Withdraw Fixed amount of 50
    # Enter steps here
    Given I have $500 in my account
    When I choose to withdraw the fixed amount of $50
    Then I should receive $50 cash
      And the balance of my account should be $450


  Scenario: Withdraw Fixed amount of 50
    # Enter steps here
    Given I have $500 in my account
    When I choose to withdraw the fixed amount of $100
    Then I should receive $100 cash
      And the balance of my account should be $400


  Scenario: Withdraw Fixed amount of 550
    # Enter steps here
    Given I have $500 in my account
    When I choose to withdraw the fixed amount of $200
    Then I should receive $200 cash
      And the balance of my account should be $300