Feature: User Registration

  Scenario: Navigating to the registration page
    Given I am on the homepage
    When I click the "Create an Account" button
    Then I should be on the registration page

  Scenario: Requesting a verification code
    Given I am on the registration page
    When I enter a valid phone number "+7(111)111-11-11"
    And I click the "Send Code" button
    Then the "Send Code" button should be enabled
    And the verification code input field should become enabled

  Scenario: Entering a correct verification code
    Given I am on the registration page
    And I have received a verification code "123456"
    When I enter the correct verification code
    And I fill out all other fields
    Then the "Create Account" button should become enabled

  Scenario: Filling out all fields and creating an account
    Given I am on the registration page
    And I have received a verification code "123456"
    When I enter a valid name, surname, password, and correct verification code
    Then the "Create Account" button should become enabled

  Scenario: Creating an account with missing information
    Given I am on the registration page
    And I have received a code "123456"
    When I enter a valid verification code
    And I enter missing name, surname, or password
    Then the "Create new account" button should be disabled
