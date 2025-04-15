# features/watch_list_and_notifications.feature

Feature: Managing Watch List and Notifications
 Background:
    Given a user exists with email "test@example.com" and password "password"
    And the user is logged in
    And the user is on the dashboard page

  Scenario: User sees an empty watch list
    Given the user has no games in their watch list
    Then they should see "You haven't added any games to your watch list yet."

  Scenario: User sees games in their watch list
    Given the user has a game titled "Elden Ring" with release date "2025-06-30" in their watch list
    Then they should see "Elden Ring – Releases on June 30, 2025"

  Scenario: User removes a game from their watch list
    Given the user has a game titled "Starfield" in their watch list
    When the user clicks "Remove" for "Starfield"
    Then they should not see "Starfield"

  Scenario: User sees notifications
    Given the user has a notification titled "Silksong Trailer Released"
    Then they should see "Silksong Trailer Released"

  Scenario: User sees notification with link
    Given the user has a notification titled "New Zelda Game" with body "Nintendo announces a new Zelda game" and link "https://zelda.com"
    Then they should see a link to "https://zelda.com"

  Scenario: User sees a truncated notification body
    Given the user has a notification with body longer than 150 characters
    Then they should see a shortened version of the notification body


  Scenario: User adds a game to their watch list and receives a notification
    Given I am logged in as a user
    And I am on the watch list page
    When I add a game to my watch list
    Then I should see the game in my watch list
    And I should receive a notification about the game

  Scenario: User reads a notification
    Given I am logged in as a user
    And I have a new notification
    When I visit my notifications page
    And I click on a notification link
    Then I should see the full notification details