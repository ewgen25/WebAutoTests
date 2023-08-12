Feature: Site Opening

  Scenario: Open the website
    Given I am on the page "https://my.life-pos.ru/auth/login"
    Then I should see the element with XPath "//h2[@class='title']"
