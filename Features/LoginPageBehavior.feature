Feature: Login Page Behavior

  Scenario: Active login button and successful login with valid credentials
    Given I am on the login page
    When I enter valid phone number "+7(111)111-11-11" and password "ValidPassword123"
    Then the login button should be active
    And the user should be able to log in

  Scenario: Inactive login button with empty fields
    Given I am on the login page
    When I enter phone number "" and password ""
    Then the login button should be inactive

  Scenario: Inactive login button with one field empty
    Given I am on the login page
    When I enter phone number "+7(111)111-11-11" and password ""
    Then the login button should be inactive

  Scenario: Unregistered phone number shows hint and keeps login button inactive
    Given I am on the login page
    When I enter unregistered phone number "+7(999)999-99-99" and password "SomePassword123"
    Then the login button should be inactive
    And I should see the message "This phone number is not registered"

  Scenario: Unsuccessful login with correct phone number but wrong password
    Given I am on the login page
    When I enter valid phone number "+7(111)111-11-11" and password "IncorrectPassword"
    And I click the login button
    Then I should not be logged in
    And I should see the message "Error: Incorrect phone number or password entered"
