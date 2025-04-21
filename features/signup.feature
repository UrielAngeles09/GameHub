Feature: User Signup

 

  Background:

    Given I am on the signup page

 

  Scenario: Successful signup

    When I fill in signup "email_address" with "gamer@example.com"

    And I fill in "password" with "securepass"

    And I fill in "password_confirmation" with "securepass"

    And I press "Create Account"

    Then I should be on the home page

    And I should see "Welcome to GameHub"

 

  Scenario: Missing email address

    When I fill in "password" with "securepass"

    And I fill in "password_confirmation" with "securepass"

    And I press "Create Account"

    Then I should see "Email address can't be blank"

 

  Scenario: Missing password

    When I fill in signup "email_address" with "gamer@example.com"

    And I fill in "password_confirmation" with "securepass"

    And I press "Create Account"

    Then I should see "Password can't be blank"

 

  Scenario: Passwords do not match

    When I fill in signup "email_address" with "gamer@example.com"

    And I fill in "password" with "securepass"

    And I fill in "password_confirmation" with "notthesame"

    And I press "Create Account"

    Then I should see "Password confirmation doesn't match Password"

 

  Scenario: Duplicate email

    Given a user already exists with email "gamer@example.com"

    When I fill in signup "email_address" with "gamer@example.com"

    And I fill in "password" with "securepass"

    And I fill in "password_confirmation" with "securepass"

    And I press "Create Account"

    Then I should see "Email address has already been taken"