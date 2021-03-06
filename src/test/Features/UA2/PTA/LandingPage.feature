Feature: Verification of Landing Page for PTA User

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
      | User                            | FirstName | LastName                                 | Email                          | Phone | NPI | Role                            | RoleID                             | Applications                                                                                                                             | LearningPathways                                    | Locations                                                                                                                                                                                                                                                                                                                                                                  | expStatusCode |
      | Super Admin                     | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic, reports-Reporting Classic, admin-Administration, lessons-Remedy University, analytics-Reporting | NFdw0Kts2C01,HZhmTBQzHtU1,n9yn5n0Qa581              | 441324--6005-059--140007, 441324--3090-068--290039, 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046 |           200 |
      | Partner Technical Administrator | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       |     | Leader                          | 1-Leader                           | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting                       | p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 | 441324--6005-059--140007, 441324--3090-068--290039                                                                                                                                                                                                                                                                                                                         |           200 |

  Scenario: Verification of availability of fields on PTA User Landing page
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    And I should not see text "Unable to Load users" on Users page
    And I verify "SearchBox" on landing page
    And I verify "UsersTabOnLeftPane" on landing page
    And I verify "LoggedInUserNamePTA" on landing page
    And I verify "LoggedInUserOptionsPTA" on landing page
    And I verify "UsersApplicationsDropdownPTA" on landing page
    And I verify "User table" on landing page
    And I verify "Lock status Column" on landing page
    And I verify "User Name Column" on landing page
    And I verify "User Role Column" on landing page
    And I verify "User Email Column" on landing page
    And I verify "Date Created Column" on landing page
    And I verify "User Admin Footer" on landing page
    And I verify "Next Page Icon" on landing page
    And I verify "Last Page Icon" on landing page
    And I click on Last Page Icon on landing page
    And I verify "Previous Page Icon" on landing page
    And I verify "First Page Icon" on landing page
    And I click on First Page Icon on landing page
    And I verify "Users Count" on landing page
    And I should see "Add User" Button in landing page
    Then I click on "Add User" Button
    Then I am navigated to user creation page
    Then I should see "Add New User" on the user creation page
    Then I click on close icon from user creation page
    Then I verify "1" text on landing page
    And I click on "icon chevron right" on landing page
    Then I verify "2" text on landing page
    Then I click on "Add User" Button
    Then I am navigated to user creation page
    Then I should see "Add New User" on the user creation page
    Then I click on close icon from user creation page
    Then I verify "2" text on landing page
    And I click on "icon chevron left" on landing page
    Then I verify "1" text on landing page
    Then I select any user
    And I verify that I am navigated to view user page
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget

  Scenario Outline: <Description>
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    And I verify "SearchBox" on landing page
    And I verify ghost text "Search" in search box
    Then I enter "<InvalidSearchParameter>" in search box for "<user>-<Role>"
    Then I should see cross icon to exit search
    Then I verify No Results Found is displayed
    Then I click on cross icon
    Then I enter "<SearchParameter>" in search box for "<user>-<Role>"
    Then I verify availability of "<SearchParameter>" for "<user>-<Role>"

    Examples: 
      | Description                    | user                            | Role   | Email                          | InvalidSearchParameter | SearchParameter                          |
      | Search a user using First Name | Partner Technical Administrator | Leader | qaautomation@remedysystems.com |                1768789 | Firstnamefirstnamefirstnamefirstname     |
      | Search a user using Last Name  | Partner Technical Administrator | Leader | qaautomation@remedysystems.com |                1768789 | Lastnamelastnamelastnamelastnamelastname |
      | Search a user using Email      | Partner Technical Administrator | Leader | qaautomation@remedysystems.com |                1768789 | FetchFromHM                              |

  Scenario Outline: Verify ability of PTA user to lock a user and cancel unlock
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    And I verify "SearchBox" on landing page
    Then I enter "<SearchParameter>" in search box for "<user>-<Role>"
    Then I verify availability of "<SearchParameter>" for "<user>-<Role>"
    Then I "lock" user
    Then I verify user is "Locked"
    And I click on the top user link
    Then I select "Log Out" option from the dropdown list
    And I should see Log in widget
    Then I enter newuser email for "<user>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    And I should see Log in widget

    Examples: 
      | user                            | Role   | Email                          | SearchParameter |
      | Partner Technical Administrator | Leader | qaautomation@remedysystems.com | FetchFromHM     |

  Scenario Outline: Verify ability of PTA user to unlock a locked user
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I enter "<SearchParameter>" in search box for "<user>-<Role>"
    Then I verify availability of "<SearchParameter>" for "<user>-<Role>"
    Then I "unlock" user
    Then I should see an alert with "Are you sure you want to unlock"
    Then I click on "Unlock" button from the unlock alert
    Then I verify user is "Unlocked"
    And I click on the top user link
    Then I select "Log Out" option from the dropdown list
    And I should see Log in widget
    Given I am on the login page
    Then I click on "Log Out" button again
    Then I enter newuser email for "<user>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page

    Examples: 
      | user                            | Role   | Email                          | SearchParameter | Applications     |
      | Partner Technical Administrator | Leader | qaautomation@remedysystems.com | FetchFromHM     | Episodes Classic |

  ######Multiple Scenarios catering UA-1502####################
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
      | User        | FirstName | LastName                                 | Email                          | Phone | NPI | Role                             | RoleID                              | Applications                                                                                                                             | LearningPathways                       | Locations                                                                                                                                                                                                                                                                                                                                                                  | expStatusCode |
      | Super Admin | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       |     | Partner Technical Administrator1 | 20-Partner Technical Administrator1 | episode_connect-Episode Connect Classic, reports-Reporting Classic, admin-Administration, lessons-Remedy University, analytics-Reporting | NFdw0Kts2C01,HZhmTBQzHtU1,n9yn5n0Qa581 | 441324--6005-059--140007, 441324--3090-068--290039, 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046 |           200 |
      | Super Admin | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       |     | Partner Technical Administrator2 | 20-Partner Technical Administrator2 | episode_connect-Episode Connect Classic, reports-Reporting Classic, admin-Administration                                                 | NFdw0Kts2C01,HZhmTBQzHtU1,n9yn5n0Qa581 | 441324--6005-059--140007, 441324--3090-070--010085                                                                                                                                                                                                                                                                                                                         |           200 |
      | Super Admin | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       |     | Partner Technical Administrator3 | 20-Partner Technical Administrator3 | admin-Administration, lessons-Remedy University, analytics-Reporting                                                                     | NFdw0Kts2C01,HZhmTBQzHtU1,n9yn5n0Qa581 | 441324--3184-0000--320022                                                                                                                                                                                                                                                                                                                                                  |           200 |

  Scenario Outline: <Description>
    Given I am on the login page
    Then I enter newuser email for "Super Admin-<User1>" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify All Users button
    Then I click on All Users button
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    #Then I verify Lock/Unlock Icon
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "Partner Technical Administrator"
    Then I verify email "<Email>" for "<User>-<Role>"
    #Then I verify last login date
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify disabled "<ApplicationsDisabled>"
    Then I verify "<ApplicationsNotVisible>" not visible on view user page
    Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"
    Then I refresh the view user page
    And I verify that I am navigated to user page

    Examples: 
      | Description                                      | User        | User1                            | UserName                               | Password | FirstName | LastName                                 | Phone | Role                             | ApplicationsEnabled                                                                                    | ApplicationsDisabled         | ApplicationsNotVisible                                                                                                 | NPI | LearningPathway | HealthSystem     | Programs                       | Locations                                                        |
      | View PTA2 from PTA1 having same data permissions | Super Admin | Partner Technical Administrator1 | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameLastNameLastNameLastNameLastName |       | Partner Technical Administrator2 | Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute, Administration | Reporting, Remedy University | Episode Connect for Post-acute Care, Community Connect, Care Connect, Program Management                               |     |                 | Sound Physicians | Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center |
      | View PTA1 from PTA2 having same data permissions | Super Admin | Partner Technical Administrator2 | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameLastNameLastNameLastNameLastName |       | Partner Technical Administrator1 | Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute, Administration |                              | Episode Connect for Post-acute Care, Community Connect, Care Connect, Program Management, Remedy University, Reporting |     |                 | Sound Physicians | Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center |

  Scenario Outline: <Description>
    Given I am on the login page
    Then I enter newuser email for "Super Admin-<User1>" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I verify No Results Found is displayed

    Examples: 
      | Description                                      | User        | User1                            | UserName                               | Password | FirstName | LastName                                 | Phone | Role                             | ApplicationsEnabled                                                                    | ApplicationsDisabled                 | ApplicationsNotVisible                                                                                   | NPI | LearningPathway | HealthSystem     | Programs                       | Locations                                                        |
      | View PTA3 from PTA1 having same data permissions | Super Admin | Partner Technical Administrator1 | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameLastNameLastNameLastNameLastName |       | Partner Technical Administrator3 | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute         | Reporting Classic, Remedy University | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                 | Sound Physicians | Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center |
      | View PTA3 from PTA2 having same data permissions | Super Admin | Partner Technical Administrator2 | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameLastNameLastNameLastNameLastName |       | Partner Technical Administrator3 | Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute | Remedy University, Reporting         | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                 | Sound Physicians | Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center |
      | View PTA1 from PTA3 having same data permissions | Super Admin | Partner Technical Administrator3 | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameLastNameLastNameLastNameLastName |       | Partner Technical Administrator1 | Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute | Remedy University, Reporting         | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                 | Sound Physicians | Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center |
      | View PTA2 from PTA3 having same data permissions | Super Admin | Partner Technical Administrator3 | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameLastNameLastNameLastNameLastName |       | Partner Technical Administrator2 | Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute | Remedy University, Reporting         | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                 | Sound Physicians | Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center |
