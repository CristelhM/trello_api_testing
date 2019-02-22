# Created by ICSC at 2/20/2019
Feature: API
  # Enter feature description here

  Scenario: # Enter scenario name here
    # Enter steps here
    Given I have connection to "https://api.trello.com/1/"
    When I GET
    Then I receive status code 200