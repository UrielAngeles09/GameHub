Feature: View game details

  Scenario: Viewing a game's detail page
    Given a game exists with title "Elden Ring 2"
    When I visit the home page
    And I click on "Elden Ring 2"
    Then I should see "Elden Ring 2"
    And I should see "Buy This Game"
    And I should see "Easter Eggs"
