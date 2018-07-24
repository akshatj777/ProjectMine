Feature: Negetive cases from bulk upload

  Scenario: Bulk Upload User
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data for all application access
    Then I click on submit button on bulk user upload page
    And I wait for 3000 milli seconds
    Then I verify "19 users added" message

  Scenario Outline: Scenario to Create user with Invalid data and validate error message-<Description>
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
    Then I verify error message "<Validation Message>"
    Then I verify error message "<ErrorMessage>" in the log file

    Examples: 
      | Description                                        | User        | Role                            | Validation Message                           | ErrorMessage                                                          |
      | Invalid Email                                      | Super Admin | Partner Technical Administrator | Contains invalid characters                  |                                                                       |
      | Data Permissions separation by using semicolon (;) | Super Admin | Remedy RN                       | Contains invalid characters                  |                                                                       |
      | create a user with existing NPI                    | Super Admin | Physicians                      | 1 user not added                             | Account with this NPI already exists. Please provide a different NPI. |
      | When more than 50 users are imported               | Super Admin | Executive                       | You can only import up to 50 users at a time |                                                                       |

  Scenario Outline: Scenario to create a user with existing email (deleted user email)
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
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
    Then I verify error message "<ErrorMessage>" in the log file

    Examples: 
      | User        | Role                      | ErrorMessage    |
      | Super Admin | Transitional Case Manager | Duplicate entry |

  Scenario Outline: Scenario to validate error message when user is edited with - 1. only PID 2. only BPID 3. only Facility Key 4. PID and Facility key, blank BPID 5. blank data permissions 6. blank first name/last name 7. blank role 8. Blank NPI for Physicians 9. invalid BPID 10. invalid Facilities 11. Invalid phone number 12. Multiple phone numbers 13. multiple learning pathways having one valid and other invalid learning pathway ID 14. multiple data permissions having one valid and other invalid data permissions
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
    Then I verify error message "<ErrorMessage>" in the log file

    Examples: 
      | ErrorMessage                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | bpid:facility field., bpid:facility field., bpid:facility field., NPI is invalid, bpid:facility is required field., bpid:facility field., First Name is required field. It should be valid string., Last Name is required field. It should be valid string., valid organizationRoles are, hkjhk : TSH was not found., 2070-015 : klk was not found., Phone number is invalid, Phone number is invalid, bpid:facility field., hkjhk : TSH was not found. |
