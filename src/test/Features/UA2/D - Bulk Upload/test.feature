Feature: gjkdfljk

    
   Scenario: Scenario to Create user with with different sets of valid email and general information
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
   Then I enter valid data set for general information
    Then I click on submit button on bulk user upload page
    Then I verify "7 users added" message