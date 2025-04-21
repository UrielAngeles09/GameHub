Feature: User Login

 

  Background:

    Given the user "ua@test.com" with password "123456" exists

 

  Scenario: Successful login with valid credentials

    Given I am on the login page

    When I fill in login "email_address" with "ua@test.com"

    And I fill in "password" with "123456"

    And I click on login "Sign In"

    Then I should be redirected to the home page

 

 

  Scenario: Login with incorrect password

    Given I am on the login page

    When I fill in login "email_address" with "ua@test.com"

    And I fill in "password" with "wrongpassword"

    And I click on login "Sign In"

    Then I should see "Try another email address or password."

 

  Scenario: Login with non-existing email

    Given I am on the login page

    When I fill in login "email_address" with "doesnotexist@example.com"

    And I fill in "password" with "123456"

    And I click on login "Sign In"

    Then I should see "Try another email address or password."

 

  Scenario: Attempt to login with blank credentials

    Given I am on the login page

    When I click on login "Sign In"

    Then I should see "Try another email address or password."

    And I should see "Try another email address or password."