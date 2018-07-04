Feature: gfjdklj

  
    Scenario: Scenario to create multiple users with valid and invalid details
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter invalid and valid user data
    Then I click on submit button on bulk user upload page
    Then I verify "20 users not added" error message and "1 user added" success message
    Then I verify availability of cross button
    Then I verify availability of Download Log button
    Then I verify availability of Try Again button
  
  
  
  
  
  
  Scenario Outline: Scenario to Create user with Invalid data and validate error message-
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
  
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data with full application access for "<Role>"
    Then I click on submit button on bulk user upload page
    Then I verify error message "Contains invalid characters"

    Examples: 
      | Description                                        | User        | Role                            |
      | Invalid Email                                      | Super Admin | Partner Technical Administrator |
      | Data Permissions separation by using semicolon (;) | Super Admin | Remedy Field RN                 |
