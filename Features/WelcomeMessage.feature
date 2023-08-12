Feature: WelcomeMessage

Testing the welcome message on the home page


Scenario: Verify the welcome message changes based on the time of day
    Given I am on the website "https://my.life-pos.ru/auth/login"
    Then I verify the welcome message changes based on time of day
