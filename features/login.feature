Feature: User Authentication
  Scenario: User signs up and logs in
    Given I visit the sign-up page
    When I fill in "Email" with "test@example.com"
    And I fill in "Password" with "password123"
    And I fill in "Password confirmation" with "password123"
    And I press "Sign up"
    Then I should see "Welcome"

  Scenario: User logs out
    Given I am logged in
    When I click "Logout"
    Then I should see "Login"
