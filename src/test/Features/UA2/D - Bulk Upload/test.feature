Feature: gfjdklj
 
 Scenario Outline: Scenario to create a user with existing email (deleted user email)
   Given I am on the login page
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data
    Then I click on submit button on bulk user upload page
    Then I verify "19 users added" message
    
 Scenario Outline: Scenario to create a user with existing NPI
    Given I am on the login page
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data with full application access for "<Role>"
    Then I click on submit button on bulk user upload page
    Then I verify "1 user not added" error message

    Examples: 
      | User        | Role       |
      | Super Admin | Physicians |