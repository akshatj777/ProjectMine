Feature: Delete a user from PTA

  Scenario Outline: Create User through UA API call
    Given Build JSON for Create User "<FirstName>" and "<LastName>" and "<Email>" and "<Phone>" and "<NPI>" and "<RoleID>" and "<Applications>" and "<Locations>" and "<LearningPathways>"
    When Create User with this data for "<User>"
    Then Verify Actual vs expected results "<expStatusCode>" and "<responseMsg>"
    Given I am on mail login page
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

    Examples: 
      | User                            | FirstName | LastName                                 | Email                           | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                     | LearningPathways                                    | Locations                         | expStatusCode |
      | Super Admin                     | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,admin-Administration,lessons-Lessons | 5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1              | 441355--ALL_BPIDS--ALL_FACILITIES |           200 |
      | Partner Technical Administrator | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Manager                         | 2-Manager                          | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,lessons-Lessons                      | p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 | 441355--3056-808--555164          |           200 |

  Scenario Outline: Login from PTA and delete an existing user and Login with the verified deleted user
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
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
    Then I verify availability of "Delete" button on deletion alert
    Then I click on "Delete" button to delete user
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
      | User                            | Role    |
      | Partner Technical Administrator | Manager |

  Scenario Outline: <Description> then delete that user and Login with unverified deleted user
    #Given I am on mail login page
    #Then I enter username "qaautomation@remedypartners.com" to login mail account
    #Then I enter password "1Welcome2" to login mail account
    #Then I click on Mail icon in my account
    #Then I click on Inbox in mail
    #Then I click on delete icon in mail
    #Then I signout from mail account
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
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
    Then I verify applications "<Applications>" are unchecked
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I verify Learning Pathway search box is available
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Programs1>" programs
    #Then I select "<Programs1>" programs for existing organisation
    Then I select "<Locations1>" locations for PTA user
    Then I click on Submit button for "<User>"
    And I wait for 3000 milli seconds
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
    Then I verify availability of "Delete" button on deletion alert
    Then I click on "Delete" button to delete user
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I verify No Results Found is displayed
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Given I am on the login page
    Then I click on "Log Out" button again
    Given I am on mail login page
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"
    #Then I verify Account Verification in Inbox in my account
    #Then I click on Account Verification mail in Inbox
    #Then I verify "Confirm My Account!" link in mail content
    #Then I click on "Confirm My Account!" link in mail content
    #And I switch to new window
    #Then I enter email to generate password link
    #And I click on send mail button
    #Then I switch back to old window
    #Then I click on Inbox in mail
    #Then I verify the unread mail in inbox in my account
    #Then I verify Change Password mail in Inbox in my account
    #Then I click on Change Password mail in Inbox
    #Then I verify "Change My Password" link in mail content
    #Then I click on "Change My Password" link in mail content
    #And I switch to new window
    #And I enter new password "Testing1@" to set new password
    #And I enter confirm new password "Testing1@" to set new password
    #And I click on submit button to set new password
    Then I signout from mail account
    Given I am on the login page
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I should see User is Blocked

    Examples: 
      | Description                                                                        | User                            | FirstName                                 | LastName | Email                           | Phone      | Role     | Applications      | ApplicationsNotVisible                                                        | NPI | LearningPathwaySearchParameter  | Programs1    | Locations1                     | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Operator role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedypartners.com | 9988776655 | Operator | Reporting Classic | Episode Connect for Post-acute Care,Administration, Care Innovation Institute |     | 5HDc3E6aK_E1, Remedy University | BPCI Model 3 | 3056-808--Arbor Nursing Center |                  |                |           |            |                  |                |           |            |
