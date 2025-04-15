Feature: Browse the home page

  Scenario: User sees trending games
    Given I am logged in
    And I am on the home page
    Then I should see the text "Trending Games"
    And I should see at least 1 game card
