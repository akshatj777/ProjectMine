Feature: gjdfkj

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
    Then I verify "1 user not added" error message
    Then I verify "1 user added" message
    Then I verify availability of cross button
    Then I verify availability of Download Log button
    Then I verify availability of Try Again button
