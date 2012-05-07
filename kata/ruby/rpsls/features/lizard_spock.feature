Feature: Start a new game

  Scenario: Receive a welcome message
    Given I am on the home page
    Then I should see "Welcome to Lizard Spock"

  Scenario: Select 3 rounds
    Given I am on the home page
    When I select "3 rounds" from "rounds"
    And I press "Go!" 
    Then I should see "round 1/3"
    
  Scenario: Select 5 rounds
    Given I am on the home page
    When I select "5 rounds" from "rounds"
    And I press "Go!" 
    Then I should see "round 1/5"

