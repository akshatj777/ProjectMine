Feature: Bulk Upload User from SA

  Scenario: Verification of fields on Bulk Upload Modal + Working of Hide and Cross button + error message for invalid input + previous summary msg
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I verify header text "Import Users"
    Then I verify availability of cross button
    Then I verify availability of Download Log button
    Then I verify availability of Try Again button
    Then I click on Try Again button
    Then I enter invalid user data
    Then I click on submit button on bulk user upload page
    Then I verify "1 user not added" error message
    Then I verify availability of Hide button
    When I click on Hide button
    Then I should see header text "Users"
    Then I click on Import User button
    Then I verify header text "Import Users"
    Then I verify previous result "1 user not added" on summary page
    Then I verify availability of Try Again button
    Then I click on Try Again button
    Then I click on Cross button
    Then I should see header text "Users"

Scenario: Scenario to check validation message when few users are added and few users are not added
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter invalid and valid user data
    Then I click on submit button on bulk user upload page
    Then I verify "1 user not added" error message and "1 user added" success message
    Then I verify availability of cross button
    Then I verify availability of Download Log button
    Then I verify availability of Try Again button

  Scenario: Scenario to check multiple success test cases in one
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data for all application access
    Then I click on submit button on bulk user upload page
    Then I verify "50 users added" message

  Scenario: Scenario to check multiple failure test cases in one
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data for all application access
    Then I click on submit button on bulk user upload page
    Then I verify "50 users added" message
