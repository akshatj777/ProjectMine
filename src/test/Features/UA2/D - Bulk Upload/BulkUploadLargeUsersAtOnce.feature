Feature: Bulk upload multiple number of users at a time

Scenario: Scenario to check multiple success test cases at once
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter "50" users data for import
    Then I click on submit button on bulk user upload page
    Then I verify "50 users added" message