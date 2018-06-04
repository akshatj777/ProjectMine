Feature: Bulk Upload User from SA

  Scenario: Verification of fields on Bulk Upload Modal + Working of Hide and Cross button
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I verify header text "Import Users"
    Then I verify previous result "19 users added" on summary page
    Then I verify availability of cross button
    Then I verify availability of Download Log button
    Then I verify availability of Try Again button
    Then I verify availability of Hide button
    When I click on Hide button
    Then I should see header text "Users"
    Then I click on Import User button
    Then I verify header text "Import Users"
    Then I verify text box field on import user page
    Then I click on Try Again button
    Then I click on Cross button
    Then I should see header text "Users"

  Scenario: Validating result screen with previous results when one import result exists previously + error message for invalid input
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter single user data
    Then I click on submit button on bulk user upload page
    Then I verify "1 user added" message
    Then I verify availability of Hide button
    When I click on Hide button
    Then I should see header text "Users"
    Then I click on Import User button
    Then I verify header text "Import Users"
    Then I verify previous result "1 user added" on summary page
    Then I click on Try Again button
    Then I enter invalid user data
    Then I click on submit button on bulk user upload page
    Then I verify "1 user not added" error message
