Feature:Password Recovery

  Scenario: Requesting password recovery with a registered phone number
    Given I am on the login page
    When I click on the "Forgot Password?" link
    And I enter a registered phone number "+7(111)111-11-11"
    And I click the "Send Recovery Code" button
    Then the "Send Recovery Code" button should be enabled
    And I should receive a recovery code on my phone

  Scenario: Requesting password recovery with an unregistered phone number
    Given I am on the login page
    When I click on the "Forgot Password?" link
    And I enter an unregistered phone number "+7(999)999-99-99"
    Then the "Send Recovery Code" button should be disabled
    And I should see the message "This phone number is not registered"

  Scenario: Entering an invalid recovery code
    Given I am on the recovery code page
    When I enter an invalid recovery code "123456"
    And I click the "Submit Code" button
    Then I should see the message "Invalid recovery code entered"

  Scenario: Entering a valid recovery code
    Given I am on the recovery code page
    When I enter a valid recovery code received via SMS
    And I click the "Submit Code" button
    Then I should be directed to the password reset page

  Scenario: Resetting password with a strong password
    Given I am on the password reset page
    When I enter a strong new password "NewStrongPassword123"
    And I confirm the new password
    And I click the "Reset Password" button
    Then I should see the message "Password reset successful"
