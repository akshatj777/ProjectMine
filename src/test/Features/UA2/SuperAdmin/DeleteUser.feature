Feature: Delete a user from SA

  Scenario Outline: Create User through UA API call
    Given Build JSON for Create User "<FirstName>" and "<LastName>" and "<Email>" and "<Phone>" and "<NPI>" and "<RoleID>" and "<Applications>" and "<Locations>" and "<LearningPathways>"
    When Create User with this data for "<User>"
    Then Verify Actual vs expected results "<expStatusCode>" and "<responseMsg>"
    Given I am on mail login page
    Then I enter username "qaautomation@remedysystems.com" to login mail account
    Then I enter password "9h$00v3T$dF@OPn0" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

    Examples: 
      | User        | FirstName | LastName | Email                          | Phone      | NPI | Role              | RoleID              | Applications                                                                      | LearningPathways                                    | Locations                                     | expStatusCode |
      | Super Admin | FirstName | LastName | qaautomation@remedysystems.com | 9988776655 |     | Advanced Operator | 3-Advanced Operator | episode_connect-Episode Connect Classic,reports-Reporting Classic,lessons-Lessons | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,5HDc3E6aK_E1 | 514029--2070-025--T, 514029--2070-028--310060 |           200 |

  Scenario Outline: Login from SA and delete an existing user and Login with the verified deleted user
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I verify the header "General Information"
    Then I verify availability of link "Delete User"
    Then I click on "Delete User" link on general information tab
    Then I verify text "Are you sure you want to delete"
    Then I verify "Cancel" button on deletion alert
    Then I click on "Cancel" button on deletion alert
    Then I verify the header "General Information"
    Then I click on "Delete User" link on general information tab
    Then I verify availability of "Delete User" button on deletion alert
    Then I click on "Delete User" button to delete user
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I verify No Results Found is displayed
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I should see User is Blocked

    Examples: 
      | User        | Role              |
      | Super Admin | Advanced Operator |

  Scenario Outline: <Description> then delete that user and Login with unverified deleted user
    Given I am on the login page
    When I enter email field <UserName> for login
    And I enter password field <Password> for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I enter Email "<Email>" to Create user
    And I enter Phone field with <Phone>
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I verify Learning Pathway search box is available
    Then I select "<LearningPathwaySearchParameter>" from the results
    #Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    And I search for health system with <Health System1>
    And I select a <Health System1>
    Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations
    Then I click Add Organization button for "<HasHealthSystem2>" flag
    And I search for health system with <Health System2>
    And I select a <Health System2>
    Then I select "<Programs2>" programs
    Then I select "<Locations2>" locations
    Then I click Add Organization button for "<HasHealthSystem3>" flag
    And I search for health system with <Health System3>
    And I select a <Health System3>
    Then I select "<Programs3>" programs
    Then I select "<Locations3>" locations
    Then I click on Submit button for "<User>"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I verify the header "General Information"
    Then I verify availability of link "Delete User"
    Then I click on "Delete User" link on general information tab
    Then I verify text "Are you sure you want to delete"
    Then I verify "Cancel" button on deletion alert
    Then I click on "Cancel" button on deletion alert
    Then I verify the header "General Information"
    Then I click on "Delete User" link on general information tab
    Then I verify availability of "Delete User" button on deletion alert
    Then I click on "Delete User" button to delete user
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I verify No Results Found is displayed
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Given I am on mail login page
    Then I enter username "qaautomation@remedysystems.com" to login mail account
    Then I enter password "9h$00v3T$dF@OPn0" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"
    Then I signout from mail account
    Given I am on the login page
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I should see User is Blocked

    Examples: 
      | Description                                                   | User        | UserName                               | Password | FirstName | LastName | Email                          | Phone | Role    | Applications                                                  | ApplicationsNotVisible                                                         | NPI | LearningPathwaySearchParameter                                                                                                        | Health System1    | Programs1    | Locations1                  | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Manager role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastName | qaautomation@remedysystems.com |       | Manager | Episode Connect Classic, Reporting Classic, Remedy University | Episode Connect for Post-acute Care, Administration, Care Innovation Institute |     | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | Stamford Hospital | BPCI Model 2 | 2070-015--Stamford Hospital | No               |                |           |            | No               |                |           |            |
