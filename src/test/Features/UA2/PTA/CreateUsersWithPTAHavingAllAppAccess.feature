Feature: Create User - PTA User

  Scenario Outline: Create PTA through API call and then verify the user
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
      | User        | FirstName | LastName                                 | Email                          | Phone | NPI | Role                            | RoleID                             | Applications                                                                                                                             | LearningPathways                         | Locations                                                                                                                                                                                                                                                                                                                                        | expStatusCode |
      | Super Admin | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic, reports-Reporting Classic, admin-Administration, lessons-Remedy University, analytics-Reporting | HZhmTBQzHtU1, NFdw0Kts2C01, n9yn5n0Qa581 | 441324--6005-059--140007, 441324--3090-068--290039, 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046 |           200 |

  Scenario Outline: <Description>
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
    Then I verify role description "<RoleDescription>" for Role "<Role>"
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<ApplicationsUnchecked>" are unchecked
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I verify Learning Pathway search box is available
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations for PTA user
    Then I click on Submit button for "<User>"
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

    Examples: 
      | Description                                                                                 | User                            | FirstName                                 | LastName                                 | Email                          | Phone      | Role              | RoleDescription                                       | ApplicationsUnchecked                                                    | Applications                                                                           | ApplicationsNotVisible                                                                                   | NPI | LearningPathwaySearchParameter                                                       | Health System1   | Programs1                  | Locations1                                     | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Leader role            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com | 9988776655 | Leader            | All Program, Financials and Physician-Level Reporting | Episode Connect Classic, Reporting Classic, Reporting, Remedy University | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute         | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                                                                                      | Sound Physicians | BPCI Model 2               | 6005-059--Presence Saint Joseph Medical Center |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Manager role           | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |            | Manager           | Program Reporting Only                                | Episode Connect Classic, Reporting Classic, Reporting, Remedy University | Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                                                                                      | Sound Physicians | BPCI Model 2               | All Locations                                  |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Advanced Operator role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | qaautomation@remedysystems.com |            | Advanced Operator | All Workflow and Operational Performance Reporting    | Episode Connect Classic, Reporting Classic, Reporting, Remedy University | Episode Connect, Episode Connect Classic, Remedy University, Care Innovation Institute | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     | Remedy University, Care Coordination External, Physician Acute Care Hospital Model 2 | Sound Physicians | BPCI Model 2, BPCI Model 3 | All Locations                                  |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Operator role          | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedysystems.com | 9988776655 | Operator          | Workflow Reporting Only                               | Episode Connect Classic, Reporting Classic, Reporting, Remedy University | Episode Connect, Care Innovation Institute                                             | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                                                                                      | Sound Physicians | BPCI Model 3               | All Locations                                  |                  |                |           |            |                  |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #######Episode Connect Classic Provisioning################
    And I click on Episode1 tile for "<User>-<Role>" user
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    And I redirect to Remedy connect page
    ###########Reporting Classic Provisioning##############
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    And I redirect to Remedy connect page
    ###########Episode Connect Post Acute Care Provisioning##############
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I redirect to Remedy connect page
    ############Remedy University Provisioning###############
    And I click on RemedyU tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I redirect to Remedy connect page
    ############User Admin Provisioning###################################
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    #############TCI Provisioning####################################
    #And I click on Institute tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I redirect to Remedy connect page
    #################Program Management Tile Provisioning####################
    And I click on Program Management tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Program Management homepage
    And I redirect to Remedy connect page
    #################Care Connect Tile Provisioning####################
    And I click on Care Connect tile for  "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Care Connect homepage
    And I redirect to Remedy connect page
    #################Community Connect Tile Provisioning####################
    And I click on Community Connect tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Community Connect homepage
    And I redirect to Remedy connect page
    ###############Reporting Provisioning###################################
    And I click on Reporting tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reporting homepage
    And I redirect to Remedy connect page
    #################General Verification################################
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | Description                                                                  | User                            | FirstName                                 | LastName                                 | Role              | Applications                                                                           | ApplicationsNotVisible                                                                                                                                                             | Roletext | ReportCategory | ReportName         | BPID | LearningPathway                                                                      | Facilities                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | Login with Leader and verify Product Tiles and their redirections            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | Leader            | Episode Connect, Episode Connect Classic, Care Innovation Institute, Reporting         | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management, Reporting Classic, Remedy University                                     | ROLE_PRM | Patient ID     | Episode DRG Issues |      |                                                                                      | Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                                                                                                         |
      | Login with Manager and verify Product Tiles and their redirections           | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | Manager           | Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management, Reporting, Remedy University                                             | ROLE_PRM | Patient ID     | Episode DRG Issues |      |                                                                                      | Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                                                                                                         |
      | Login with Advanced Operator and verify Product Tiles and their redirections | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | Advanced Operator | Episode Connect, Episode Connect Classic, Remedy University, Care Innovation Institute | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management, Reporting Classic, Reporting                                             | ROLE_TCS | Patient ID     | Episode DRG Issues |      | Remedy University, Care Coordination External, Physician Acute Care Hospital Model 2 | Presence Saint Joseph Medical Center, Mountainview Hospital, Vaughan Regional Medical Center Parkway Campus, San Mateo Medical Center, Aroostook Medical Center, Mayo Clinic Health System - Mankato, St Vincent Healthcare, St Rose Dominican Hospitals - Rose De Lima Campus, Desert Springs Hosp MC, Summerlin Hospital Medical Center, St Rose Dominican Hospitals - Siena Campus, Spring Valley Hospital Medical Center |
      | Login with Operator and verify Product Tiles and their redirections          | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | Operator          | Episode Connect, Care Innovation Institute                                             | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management, Episode Connect Classic, Remedy University, Reporting, Reporting Classic | ROLE_TCS | Patient ID     | Episode DRG Issues |      |                                                                                      | Mountainview Hospital, Vaughan Regional Medical Center Parkway Campus, San Mateo Medical Center, Aroostook Medical Center, Mayo Clinic Health System - Mankato, St Vincent Healthcare, St Rose Dominican Hospitals - Rose De Lima Campus, Desert Springs Hosp MC, Summerlin Hospital Medical Center, St Rose Dominican Hospitals - Siena Campus, Spring Valley Hospital Medical Center                                       |

  Scenario Outline: <Description>
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
    Then I verify All Users button
    Then I click on All Users button
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify Edit Icon
    Then I click on Edit Icon
    Then I verify Delete User button
    Then I click on cross button on Edit User Page
    Then I verify Lock/Unlock Icon
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify email "<Email>" for "<User>-<Role>"
    Then I verify last login date for "<Role>"
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
      | Description                                          | User                            | UserName                               | Password | FirstName                                 | LastName                                 | Phone        | Role              | ApplicationsEnabled                                                                    | ApplicationsDisabled                                                     | ApplicationsNotVisible                                                                                   | NPI | LearningPathway                                                                      | HealthSystem     | Programs                                                       | Locations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | View Leader user created from Super Admin user       | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | 998-877-6655 | Leader            | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute         | Reporting Classic, Remedy University                                     | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                                                                                      | Sound Physicians | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | View Manager user created from Super Admin user      | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName                                 | LastNameLastNameLastNameLastNameLastName |              | Manager           | Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute | Remedy University, Reporting                                             | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                                                                                      | Sound Physicians | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | View Advanced Operator user created from Super Admin | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastName                                 |              | Advanced Operator | Episode Connect, Episode Connect Classic, Remedy University, Care Innovation Institute | Reporting Classic, Reporting                                             | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     | Remedy University, Care Coordination External, Physician Acute Care Hospital Model 2 | Sound Physicians | Sound Physicians--BPCI Model 3, Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--3090-191--Mountainview Hospital, Sound Physicians--3090-068--Mountainview Hospital, Sound Physicians--3090-068--Vaughan Regional Medical Center Parkway Campus, Sound Physicians--3090-068--San Mateo Medical Center, Sound Physicians--3090-068--Aroostook Medical Center, Sound Physicians--3090-068--Mayo Clinic Health System - Mankato, Sound Physicians--3090-068--St Vincent Healthcare, Sound Physicians--3090-068--St Rose Dominican Hospitals - Rose De Lima Campus, Sound Physicians--3090-068--Desert Springs Hosp MC, Sound Physicians--3090-068--Summerlin Hospital Medical Center, Sound Physicians--3090-068--St Rose Dominican Hospitals - Siena Campus, Sound Physicians--3090-068--Spring Valley Hospital Medical Center |
      | View Operator user created from Super Admin user     | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | 998-877-6655 | Operator          | Episode Connect, Care Innovation Institute                                             | Episode Connect Classic, Reporting Classic, Remedy University, Reporting | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                                                                                      | Sound Physicians | Sound Physicians--BPCI Model 3                                 | Sound Physicians--3090-191--Mountainview Hospital, Sound Physicians--3090-068--Mountainview Hospital, Sound Physicians--3090-068--Vaughan Regional Medical Center Parkway Campus, Sound Physicians--3090-068--San Mateo Medical Center, Sound Physicians--3090-068--Aroostook Medical Center, Sound Physicians--3090-068--Mayo Clinic Health System - Mankato, Sound Physicians--3090-068--St Vincent Healthcare, Sound Physicians--3090-068--St Rose Dominican Hospitals - Rose De Lima Campus, Sound Physicians--3090-068--Desert Springs Hosp MC, Sound Physicians--3090-068--Summerlin Hospital Medical Center, Sound Physicians--3090-068--St Rose Dominican Hospitals - Siena Campus, Sound Physicians--3090-068--Spring Valley Hospital Medical Center                                                                   |

  Scenario Outline: <Description>
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
    Then I verify role description "<RoleDescription>" for Role "<Role>"
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<ApplicationsUnchecked>" are unchecked
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I verify Learning Pathway search box is available
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations for PTA user
    Then I click on Submit button for "<User>"
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

    Examples: 
      | Description                                                                                 | User                            | FirstName                                 | LastName                                 | Email                          | Phone      | Role              | RoleDescription                                       | ApplicationsUnchecked                                                    | Applications                                                                                                         | ApplicationsNotVisible                                                                                   | NPI | LearningPathwaySearchParameter                                                                                                                                               | Health System1   | Programs1                  | Locations1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Leader role            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com | 9988776655 | Leader            | All Program, Financials and Physician-Level Reporting | Episode Connect Classic, Reporting Classic, Remedy University, Reporting | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     | Remedy University, Care Coordination External, Physician Acute Care Hospital Model 2                                                                                         | Sound Physicians | BPCI Model 3               | 3090-068--St Vincent Healthcare, 3090-068--Aroostook Medical Center, 3090-068--San Mateo Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Manager role           | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |            | Manager           | Program Reporting Only                                | Episode Connect Classic, Reporting Classic, Remedy University, Reporting | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     | Remedy University                                                                                                                                                            | Sound Physicians | BPCI Model 2, BPCI Model 3 | 6005-059--Presence Saint Joseph Medical Center, 3090-068--St Vincent Healthcare, 3090-068--Aroostook Medical Center, 3090-068--San Mateo Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                               |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Advanced Operator role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | qaautomation@remedysystems.com |            | Advanced Operator | All Workflow and Operational Performance Reporting    | Episode Connect Classic, Reporting Classic, Remedy University, Reporting | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     | Remedy University, Care Coordination External, Physician Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Clinical Operations Acute Care Hospital Model 2 | Sound Physicians | BPCI Model 2, BPCI Model 3 | 6005-059--Presence Saint Joseph Medical Center, 3090-068--St Vincent Healthcare                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Operator role          | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedysystems.com | 9988776655 | Operator          | Workflow Reporting Only                               | Episode Connect Classic, Reporting Classic, Remedy University, Reporting | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     | Remedy University                                                                                                                                                            | Sound Physicians | BPCI Model 2, BPCI Model 3 | 6005-059--Presence Saint Joseph Medical Center, 3090-191--Mountainview Hospital, 3090-068--Mountainview Hospital, 3090-068--Vaughan Regional Medical Center Parkway Campus, 3090-068--San Mateo Medical Center, 3090-068--Aroostook Medical Center, 3090-068--Mayo Clinic Health System - Mankato, 3090-068--St Vincent Healthcare, 3090-068--St Rose Dominican Hospitals - Rose De Lima Campus, 3090-068--Desert Springs Hosp MC, 3090-068--Summerlin Hospital Medical Center, 3090-068--St Rose Dominican Hospitals - Siena Campus, 3090-068--Spring Valley Hospital Medical Center |                  |                |           |            |                  |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #######Episode Connect Classic Provisioning################
    And I click on Episode1 tile for "<User>-<Role>" user
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    And I redirect to Remedy connect page
    ###########Reporting Classic Provisioning##############
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    And I redirect to Remedy connect page
    ###########Episode Connect Post Acute Care Provisioning##############
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I redirect to Remedy connect page
    ############Remedy University Provisioning###############
    And I click on RemedyU tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I redirect to Remedy connect page
    ############User Admin Provisioning###################################
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    #############TCI Provisioning####################################
    #And I click on Institute tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I redirect to Remedy connect page
    #################Program Management Tile Provisioning####################
    And I click on Program Management tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Program Management homepage
    And I redirect to Remedy connect page
    #################Care Connect Tile Provisioning####################
    And I click on Care Connect tile for  "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Care Connect homepage
    And I redirect to Remedy connect page
    #################Community Connect Tile Provisioning####################
    And I click on Community Connect tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Community Connect homepage
    And I redirect to Remedy connect page
    ###############Reporting Provisioning###################################
    And I click on Reporting tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reporting homepage
    And I redirect to Remedy connect page
    #################General Verification################################
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | Description                                                                  | User                            | FirstName                                 | LastName                                 | Role              | Applications                                                                                                         | ApplicationsNotVisible                                                                                   | Roletext | ReportCategory | ReportName         | BPID | LearningPathway                                                                                                                                                              | Facilities                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | Login with Leader and verify Product Tiles and their redirections            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | Leader            | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Remedy University, Care Coordination External, Physician Acute Care Hospital Model 2                                                                                         | San Mateo Medical Center, Aroostook Medical Center, St Vincent Healthcare                                                                                                                                                                                                                                                                                                                                                    |
      | Login with Manager and verify Product Tiles and their redirections           | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | Manager           | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Remedy University                                                                                                                                                            | Presence Saint Joseph Medical Center, San Mateo Medical Center, Aroostook Medical Center, St Vincent Healthcare                                                                                                                                                                                                                                                                                                              |
      | Login with Advanced Operator and verify Product Tiles and their redirections | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | Advanced Operator | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management | ROLE_TCS | Patient ID     | Episode DRG Issues |      | Remedy University, Care Coordination External, Physician Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Clinical Operations Acute Care Hospital Model 2 | Presence Saint Joseph Medical Center, St Vincent Healthcare                                                                                                                                                                                                                                                                                                                                                                  |
      | Login with Operator and verify Product Tiles and their redirections          | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | Operator          | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management | ROLE_TCS | Patient ID     | Episode DRG Issues |      | Remedy University                                                                                                                                                            | Presence Saint Joseph Medical Center, Mountainview Hospital, Vaughan Regional Medical Center Parkway Campus, San Mateo Medical Center, Aroostook Medical Center, Mayo Clinic Health System - Mankato, St Vincent Healthcare, St Rose Dominican Hospitals - Rose De Lima Campus, Desert Springs Hosp MC, Summerlin Hospital Medical Center, St Rose Dominican Hospitals - Siena Campus, Spring Valley Hospital Medical Center |

  Scenario Outline: <Description>
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
    Then I verify All Users button
    Then I click on All Users button
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify Edit Icon
    Then I click on Edit Icon
    Then I verify Delete User button
    Then I click on cross button on Edit User Page
    Then I verify Lock/Unlock Icon
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify email "<Email>" for "<User>-<Role>"
    Then I verify last login date for "<Role>"
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
      | Description                                          | User                            | UserName                               | Password | FirstName                                 | LastName                                 | Phone        | Role              | ApplicationsEnabled                                                                                                  | ApplicationsDisabled | ApplicationsNotVisible                                                                                   | NPI | LearningPathway                                                                                                                                                              | HealthSystem     | Programs                                                       | Locations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | View Leader user created from Super Admin user       | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | 998-877-6655 | Leader            | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute |                      | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     | Remedy University, Care Coordination External, Physician Acute Care Hospital Model 2                                                                                         | Sound Physicians | Sound Physicians--BPCI Model 3                                 | Sound Physicians--3090-068--St Vincent Healthcare, Sound Physicians--3090-068--Aroostook Medical Center, Sound Physicians--3090-068--San Mateo Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | View Manager user created from Super Admin user      | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName                                 | LastNameLastNameLastNameLastNameLastName |              | Manager           | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute |                      | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     | Remedy University                                                                                                                                                            | Sound Physicians | Sound Physicians--BPCI Model 3, Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--3090-068--St Vincent Healthcare, Sound Physicians--3090-068--Aroostook Medical Center, Sound Physicians--3090-068--San Mateo Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | View Advanced Operator user created from Super Admin | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastName                                 |              | Advanced Operator | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute |                      | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     | Remedy University, Care Coordination External, Physician Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Clinical Operations Acute Care Hospital Model 2 | Sound Physicians | Sound Physicians--BPCI Model 3, Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--3090-068--St Vincent Healthcare                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | View Operator user created from Super Admin user     | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | 998-877-6655 | Operator          | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute |                      | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     | Remedy University                                                                                                                                                            | Sound Physicians | Sound Physicians--BPCI Model 3, Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--3090-191--Mountainview Hospital, Sound Physicians--3090-068--Mountainview Hospital, Sound Physicians--3090-068--Vaughan Regional Medical Center Parkway Campus, Sound Physicians--3090-068--San Mateo Medical Center, Sound Physicians--3090-068--Aroostook Medical Center, Sound Physicians--3090-068--Mayo Clinic Health System - Mankato, Sound Physicians--3090-068--St Vincent Healthcare, Sound Physicians--3090-068--St Rose Dominican Hospitals - Rose De Lima Campus, Sound Physicians--3090-068--Desert Springs Hosp MC, Sound Physicians--3090-068--Summerlin Hospital Medical Center, Sound Physicians--3090-068--St Rose Dominican Hospitals - Siena Campus, Sound Physicians--3090-068--Spring Valley Hospital Medical Center |
