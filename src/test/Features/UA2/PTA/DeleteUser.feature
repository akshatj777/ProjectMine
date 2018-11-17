Feature: Delete a user from PTA

  Scenario Outline: Create User through UA API call and verify the user
    Given Build JSON for Create User "<FirstName>" and "<LastName>" and "<Email>" and "<Phone>" and "<NPI>" and "<RoleID>" and "<Applications>" and "<Locations>" and "<LearningPathways>"
    When Create User with this data for "<User>"
    Then Verify Actual vs expected results "<expStatusCode>" and "<responseMsg>"
    Given I am on mail login page
    Then I enter username "qaautomation@remedysystems.com" to login mail account
    Then I enter password "9h$00v3T$dF@OPn0" to login mail account
    Then I click on Mail icon in my account
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

    Examples: 
      | User                            | FirstName       | LastName                                 | Email                          | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                                             | LearningPathways                                    | Locations                                                                                                                                                                                                                                                                                                                                                                  | expStatusCode |
      | Super Admin                     | FirstName       | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com | 9988776655 |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic, reports-Reporting Classic, admin-Administration, lessons-Remedy University, analytics-Reporting | 5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1              | 441324--6005-059--140007, 441324--3090-068--290039, 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046 |           200 |
      | Partner Technical Administrator | FirstNamePTAPTA | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |            |     | Manager                         | 2-Manager                          | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting                       | p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 | 441324--6005-059--140007, 441324--3090-068--290039                                                                                                                                                                                                                                                                                                                         |           200 |

  Scenario Outline: Create User through UA API call
    Given Build JSON for Create User "<FirstName>" and "<LastName>" and "<Email>" and "<Phone>" and "<NPI>" and "<RoleID>" and "<Applications>" and "<Locations>" and "<LearningPathways>"
    When Create User with this data for "<User>"
    Then Verify Actual vs expected results "<expStatusCode>" and "<responseMsg>"

    Examples: 
      | User                            | FirstName | LastName                                 | Email                          | Phone | NPI | Role     | RoleID      | Applications                                                                                                       | LearningPathways                                    | Locations                                          | expStatusCode |
      | Partner Technical Administrator | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       |     | Leader   | 1-Leader    | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting | p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 | 441324--6005-059--140007, 441324--3090-068--290039 |           200 |
      | Partner Technical Administrator | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       |     | Operator | 22-Operator | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting | p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 | 441324--6005-059--140007, 441324--3090-068--290039 |           200 |

  Scenario Outline: Login from PTA - Delete verified User - Login with the deleted User
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
      | User                            | Role    |
      | Partner Technical Administrator | Manager |

  Scenario Outline: Login from PTA - Delete unverified User - Verify deleted User - Login with the deleted User
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
    Then I click on "Log Out" button again
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I should see User is Blocked

    Examples: 
      | Description                                                                        | User                            | FirstName                                 | LastName | Email                          | Phone      | Role   | Applications      | ApplicationsNotVisible                                                                    | NPI | LearningPathwaySearchParameter  | Programs1    | Locations1                      | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Operator role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedysystems.com | 9988776655 | Leader | Reporting Classic | Episode Connect for Post-acute Care, Administration, Care Innovation Institute, Reporting |     | 5HDc3E6aK_E1, Remedy University | BPCI Model 3 | 3090-068--Mountainview Hospital |                  |                |           |            |                  |                |           |            |

  Scenario Outline: Login from PTA - Delete unverified User - Login with the deleted User
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
    Given I am on the login page
    Then I click on "Log Out" button again
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I should see Wrong Email or Password

    Examples: 
      | Description                                                                        | User                            | FirstName                                 | LastName | Email                          | Phone      | Role     | Applications      | ApplicationsNotVisible                                                                    | NPI | LearningPathwaySearchParameter  | Programs1    | Locations1                      | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Operator role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedysystems.com | 9988776655 | Operator | Reporting Classic | Episode Connect for Post-acute Care, Administration, Care Innovation Institute, Reporting |     | 5HDc3E6aK_E1, Remedy University | BPCI Model 3 | 3090-068--Mountainview Hospital |                  |                |           |            |                  |                |           |            |
