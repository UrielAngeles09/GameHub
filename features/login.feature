Feature: GameHub Platform Navigation

  Scenario: User visits the home page
    Given the user is on the GameHub home page
    Then they should see trending games
    And they should see upcoming releases

  Scenario: User clicks on a game
    Given the user is on the GameHub home page
    When they click on "Elden Ring 2"
    Then they should see the game detail view for "Elden Ring 2"

  Scenario: User views their dashboard
    Given the user is on the GameHub home page
    When they click the "Dashboard View" button
    Then they should see their personalized dashboard

  Scenario: User sees their notifications
    Given the user is on the dashboard
    Then they should see a notification about "Elden Ring 2"
