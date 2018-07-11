Feature: Negetive cases from bulk upload

  Scenario: Bulk Upload User
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data for all application access
    Then I click on submit button on bulk user upload page
    Then I verify "19 users added" message

  Scenario Outline: Scenario to Create user with Invalid data and validate error message for -
    Given I am on the login page
    Then I log in as super user
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
      | Data Permissions separation by using semicolon (;) | Super Admin | Remedy RN                       |

  Scenario: Scenario to check validation message when multiple users with same email is imported
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter users with same email
    Then I click on submit button on bulk user upload page
    Then I verify "3 users not added" error message and "1 user added" success message

  Scenario: Scenario to check validation message when number of users entered exceed the limit
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter "51" users data for import
    Then I click on submit button on bulk user upload page
    Then I verify error message "You can only import up to 50 users at a time"

  Scenario Outline: Scenario to create a user with existing email (deleted user email)
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for bulk user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify Edit Icon
    Then I click on Edit Icon
    Then I verify availability of link "Delete User"
    Then I click on "Delete User" link on general information tab
    Then I verify text "Are you sure you want to delete"
    Then I verify "Cancel" button on deletion alert
    Then I verify availability of "Delete" button on deletion alert
    Then I click on "Delete" button to delete user
    Then I should see header text "Users"
    Then I search for bulk user with role "<User>-<Role>"
    Then I verify No Results Found is displayed
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data with full application access for "<Role>"
    Then I click on submit button on bulk user upload page
    Then I verify "1 user not added" error message

    Examples: 
      | User        | Role                      |
      | Super Admin | Transitional Case Manager |

  Scenario Outline: Scenario to create a user with existing NPI
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data with full application access for "<Role>"
    Then I click on submit button on bulk user upload page
    Then I verify "1 user not added" error message

    Examples: 
      | User        | Role       |
      | Super Admin | Physicians |

  Scenario: Scenario to validate error message when user is edited with - 1. only PID 2. only BPID 3. only Facility Key 4. PID and Facility key, blank BPID 5. blank data permissions 6. blank first name/last name 7. blank role 8. Blank NPI for Physicians 9. invalid BPID 10. invalid Facilities 11. Invalid phone number 12. Multiple phone numbers 13. multiple learning pathways having one valid and other invalid learning pathway ID 14. multiple data permissions having one valid and other invalid data permissions
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I edit user with invalid data
    Then I click on submit button on bulk user upload page
    Then I verify "15 users not added" error message
