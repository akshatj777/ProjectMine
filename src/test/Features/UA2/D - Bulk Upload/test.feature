Feature: gjfdfskj

  Scenario: Scenario to check multiple success test cases at once
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter "50" users data for import
    Then I click on submit button on bulk user upload page
    Then I verify "50 users added" message