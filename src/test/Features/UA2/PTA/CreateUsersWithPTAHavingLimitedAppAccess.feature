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
      | User        | FirstName | LastName                                 | Email                          | Phone | NPI | Role                            | RoleID                             | Applications                                                                       | LearningPathways | Locations                                                                                                                                                                                                                                                               | expStatusCode |
      | Super Admin | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic, admin-Administration, analytics-Reporting |                  | 809046--5772-0002--310009, 809046--5774-0002--310041, 809046--5805-0002--310074, 809046--5838-0002--310075, 809046--5839-0002--310084, 809046--CJR-10-1--310038, 809046--CJR-10-2--310048, 809046--CJR-10-3--310024, 809046--CJR-10-4--310009, 809046--CJR-10-5--310041 |           200 |

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
      | Description                                                                                 | User                            | FirstName                                 | LastName                                 | Email                          | Phone      | Role              | RoleDescription                                       | ApplicationsUnchecked              | Applications                                                        | ApplicationsNotVisible                                                                                                                         | NPI | LearningPathwaySearchParameter | Health System1      | Programs1   | Locations1                                                                                                                       | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Leader role            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com | 9988776655 | Leader            | All Program, Financials and Physician-Level Reporting | Episode Connect Classic, Reporting | Episode Connect, Episode Connect Classic, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration |     |                                | RWJ Barnabas Health | bpci_a      | 5772-0002--Clara Maass Medical Center, 5774-0002--Community Medical Center, 5839-0002--Monmouth Medical Center - Southern Campus |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Manager role           | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |            | Manager           | Program Reporting Only                                | Episode Connect Classic, Reporting | Episode Connect, Reporting, Care Innovation Institute               | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration |     |                                | RWJ Barnabas Health | CJR         | All Locations                                                                                                                    |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Advanced Operator role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | qaautomation@remedysystems.com |            | Advanced Operator | All Workflow and Operational Performance Reporting    | Episode Connect Classic, Reporting | Episode Connect, Episode Connect Classic, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration |     |                                | RWJ Barnabas Health | bpci_a, CJR | All Locations                                                                                                                    |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Operator role          | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedysystems.com | 9988776655 | Operator          | Workflow Reporting Only                               | Episode Connect Classic, Reporting | Episode Connect, Care Innovation Institute                          | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration |     |                                | RWJ Barnabas Health | bpci_a      | All Locations                                                                                                                    |                  |                |           |            |                  |                |           |            |

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
      | Description                                                                  | User                            | FirstName                                 | LastName                                 | Role              | Applications                                                        | ApplicationsNotVisible                                                                                                                                                             | Roletext | ReportCategory | ReportName         | BPID | LearningPathway | Facilities                                                                                                                                                                                                                                                 |
      | Login with Leader and verify Product Tiles and their redirections            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | Leader            | Episode Connect, Episode Connect Classic, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration, Reporting                          | ROLE_PRM | Patient ID     | Episode DRG Issues |      |                 | Clara Maass Medical Center, Monmouth Medical Center - Southern Campus, Community Medical Center                                                                                                                                                            |
      | Login with Manager and verify Product Tiles and their redirections           | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | Manager           | Episode Connect, Reporting, Care Innovation Institute               | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration, Episode Connect Classic            | ROLE_PRM | Patient ID     | Episode DRG Issues |      |                 | RWJ University Hospital at New Brunswick, RWJ University Hospital at Somerset, Robert Wood Johnson University Hospital At Rahway, Clara Maass Medical Center, Community Medical Center                                                                     |
      | Login with Advanced Operator and verify Product Tiles and their redirections | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | Advanced Operator | Episode Connect, Episode Connect Classic, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration, Reporting                          | ROLE_TCS | Patient ID     | Episode DRG Issues |      |                 | RWJ University Hospital at New Brunswick, RWJ University Hospital at Somerset, Robert Wood Johnson University Hospital At Rahway, Clara Maass Medical Center, Community Medical Center, Monmouth Medical Center, Monmouth Medical Center - Southern Campus |
      | Login with Operator and verify Product Tiles and their redirections          | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | Operator          | Episode Connect, Care Innovation Institute                          | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration, Episode Connect Classic, Reporting | ROLE_TCS | Patient ID     | Episode DRG Issues |      |                 | Clara Maass Medical Center, Community Medical Center, Monmouth Medical Center, Monmouth Medical Center - Southern Campus                                                                                                                                   |

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
      | Description                                          | User                            | UserName                               | Password | FirstName                                 | LastName                                 | Phone        | Role              | ApplicationsEnabled                                                 | ApplicationsDisabled               | ApplicationsNotVisible                                                                                                                         | NPI | LearningPathway | HealthSystem        | Programs                                              | Locations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | View Leader user created from Super Admin user       | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | 998-877-6655 | Leader            | Episode Connect, Episode Connect Classic, Care Innovation Institute | Reporting                          | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management, Reporting Classic, Remedy University |     |                 | RWJ Barnabas Health | RWJ Barnabas Health--bpci_a                           | RWJ Barnabas Health--5772-0002--Clara Maass Medical Center, RWJ Barnabas Health--5774-0002--Community Medical Center, RWJ Barnabas Health--5839-0002--Monmouth Medical Center - Southern Campus                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | View Manager user created from Super Admin user      | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName                                 | LastNameLastNameLastNameLastNameLastName |              | Manager           | Episode Connect, Reporting, Care Innovation Institute               | Episode Connect Classic            | Reporting Classic, Remedy University, Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                 | RWJ Barnabas Health | RWJ Barnabas Health--CJR                              | RWJ Barnabas Health--CJR-10-1--Rwj University Hospital At New Brunswick, RWJ Barnabas Health--CJR-10-2--Rwj University Hospital At Somerset, RWJ Barnabas Health--CJR-10-3--Robert Wood Johnson University Hospital At Rahway, RWJ Barnabas Health--CJR-10-4--Clara Maass Medical Center , RWJ Barnabas Health--CJR-10-5--Community Medical Center - Tom's River                                                                                                                                                                                                                                                                                                                                     |
      | View Advanced Operator user created from Super Admin | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastName                                 |              | Advanced Operator | Episode Connect, Episode Connect Classic, Care Innovation Institute | Reporting                          | Reporting Classic, Remedy University, Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                 | RWJ Barnabas Health | RWJ Barnabas Health--CJR, RWJ Barnabas Health--bpci_a | RWJ Barnabas Health--CJR-10-1--Rwj University Hospital At New Brunswick, RWJ Barnabas Health--CJR-10-2--Rwj University Hospital At Somerset, RWJ Barnabas Health--CJR-10-3--Robert Wood Johnson University Hospital At Rahway, RWJ Barnabas Health--CJR-10-4--Clara Maass Medical Center , RWJ Barnabas Health--CJR-10-5--Community Medical Center - Tom's River, RWJ Barnabas Health--5772-0002--Clara Maass Medical Center, RWJ Barnabas Health--5774-0002--Community Medical Center - Tom's River, RWJ Barnabas Health--5838-0002--Monmouth Medical Center, RWJ Barnabas Health--5805-0002--JERSEY CITY MEDICAL CENTER, RWJ Barnabas Health--5839-0002--Monmouth Medical Center - Southern Campus |
      | View Operator user created from Super Admin user     | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | 998-877-6655 | Operator          | Episode Connect, Care Innovation Institute                          | Episode Connect Classic, Reporting | Reporting Classic, Remedy University, Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                 | RWJ Barnabas Health | RWJ Barnabas Health--bpci_a                           | RWJ Barnabas Health--5772-0002--Clara Maass Medical Center, RWJ Barnabas Health--5774-0002--Community Medical Center - Tom's River, RWJ Barnabas Health--5838-0002--Monmouth Medical Center, RWJ Barnabas Health--5805-0002--JERSEY CITY MEDICAL CENTER, RWJ Barnabas Health--5839-0002--Monmouth Medical Center - Southern Campus                                                                                                                                                                                                                                                                                                                                                                   |

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
      | Description                                                                                 | User                            | FirstName                                 | LastName                                 | Email                          | Phone      | Role              | RoleDescription                                       | ApplicationsUnchecked              | Applications                                                                   | ApplicationsNotVisible                                                                                                                         | NPI | LearningPathwaySearchParameter | Health System1      | Programs1   | Locations1                                                                                                                                                                                                                                                                                                                                                                             | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Leader role            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com | 9988776655 | Leader            | All Program, Financials and Physician-Level Reporting | Episode Connect Classic, Reporting | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration |     |                                | RWJ Barnabas Health | CJR         | CJR-10-1--Rwj University Hospital At New Brunswick, CJR-10-2--Rwj University Hospital At Somerset, CJR-10-3--Robert Wood Johnson University Hospital At Rahway                                                                                                                                                                                                                         |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Manager role           | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |            | Manager           | Program Reporting Only                                | Episode Connect Classic, Reporting | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration |     |                                | RWJ Barnabas Health | bpci_a, CJR | CJR-10-1--Rwj University Hospital At New Brunswick, CJR-10-2--Rwj University Hospital At Somerset, CJR-10-3--Robert Wood Johnson University Hospital At Rahway, 5772-0002--Clara Maass Medical Center, 5774-0002--Community Medical Center - Tom's River, 5838-0002--Monmouth Medical Center                                                                                           |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Advanced Operator role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | qaautomation@remedysystems.com |            | Advanced Operator | All Workflow and Operational Performance Reporting    | Episode Connect Classic, Reporting | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration |     |                                | RWJ Barnabas Health | bpci_a, CJR | CJR-10-1--Rwj University Hospital At New Brunswick, CJR-10-2--Rwj University Hospital At Somerset, CJR-10-3--Robert Wood Johnson University Hospital At Rahway, CJR-10-4--Clara Maass Medical Center , CJR-10-5--Community Medical Center - Tom's River  ,5772-0002--Clara Maass Medical Center, 5774-0002--Community Medical Center - Tom's River, 5838-0002--Monmouth Medical Center |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Operator role          | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedysystems.com | 9988776655 | Operator          | Workflow Reporting Only                               | Episode Connect Classic, Reporting | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration |     |                                | RWJ Barnabas Health | bpci_a, CJR | CJR-10-3--Robert Wood Johnson University Hospital At Rahway, CJR-10-4--Clara Maass Medical Center, CJR-10-5--Community Medical Center - Tom's River, 5772-0002--Clara Maass Medical Center, 5774-0002--Community Medical Center - Tom's River, 5838-0002--Monmouth Medical Center, 5805-0002--JERSEY CITY MEDICAL CENTER, 5839-0002--Monmouth Medical Center - Southern Campus         |                  |                |           |            |                  |                |           |            |

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
      | Description                                                                  | User                            | FirstName                                 | LastName                                 | Role              | Applications                                                                   | ApplicationsNotVisible                                                                                                                         | Roletext | ReportCategory | ReportName         | BPID | LearningPathway | Facilities                                                                                                                                                                                                                    |
      | Login with Leader and verify Product Tiles and their redirections            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | Leader            | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration | ROLE_PRM | Patient ID     | Episode DRG Issues |      |                 | Robert Wood Johnson University Hospital At Rahway, RWJ University Hospital at New Brunswick, RWJ University Hospital at Somerset                                                                                              |
      | Login with Manager and verify Product Tiles and their redirections           | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | Manager           | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration | ROLE_PRM | Patient ID     | Episode DRG Issues |      |                 | Robert Wood Johnson University Hospital At Rahway, RWJ University Hospital at New Brunswick, RWJ University Hospital at Somerset, Clara Maass Medical Center, Community Medical Center - Tom's River, Monmouth Medical Center |
      | Login with Advanced Operator and verify Product Tiles and their redirections | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | Advanced Operator | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration | ROLE_TCS | Patient ID     | Episode DRG Issues |      |                 | Robert Wood Johnson University Hospital At Rahway, RWJ University Hospital at New Brunswick, RWJ University Hospital at Somerset, Clara Maass Medical Center, Community Medical Center - Tom's River, Monmouth Medical Center |
      | Login with Operator and verify Product Tiles and their redirections          | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | Operator          | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Program Management, Administration | ROLE_TCS | Patient ID     | Episode DRG Issues |      |                 | Robert Wood Johnson University Hospital At Rahway, Clara Maass Medical Center, Community Medical Center - Tom's River, Monmouth Medical Center, Monmouth Medical Center - Southern Campus                                     |

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
      | Description                                          | User                            | UserName                               | Password | FirstName                                 | LastName                                 | Phone        | Role              | ApplicationsEnabled                                                            | ApplicationsDisabled | ApplicationsNotVisible                                                                                                                         | NPI | LearningPathway | HealthSystem        | Programs                                              | Locations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | View Leader user created from Super Admin user       | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | 998-877-6655 | Leader            | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute |                      | Reporting Classic, Remedy University, Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                 | RWJ Barnabas Health | RWJ Barnabas Health--CJR                              | RWJ Barnabas Health--CJR-10-1--Rwj University Hospital At New Brunswick, RWJ Barnabas Health--CJR-10-2--Rwj University Hospital At Somerset, RWJ Barnabas Health--CJR-10-3--Robert Wood Johnson University Hospital At Rahway                                                                                                                                                                                                                                                                                                                                 |
      | View Manager user created from Super Admin user      | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName                                 | LastNameLastNameLastNameLastNameLastName |              | Manager           | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute |                      | Reporting Classic, Remedy University, Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                 | RWJ Barnabas Health | RWJ Barnabas Health--CJR, RWJ Barnabas Health--bpci_a | RWJ Barnabas Health--CJR-10-1--Rwj University Hospital At New Brunswick, RWJ Barnabas Health--CJR-10-2--Rwj University Hospital At Somerset, RWJ Barnabas Health--CJR-10-3--Robert Wood Johnson University Hospital At Rahway, RWJ Barnabas Health--5772-0002--Clara Maass Medical Center, RWJ Barnabas Health--5774-0002--Community Medical Center - Tom's River, RWJ Barnabas Health--5838-0002--Monmouth Medical Center                                                                                                                                    |
      | View Advanced Operator user created from Super Admin | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastName                                 |              | Advanced Operator | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute |                      | Reporting Classic, Remedy University, Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                 | RWJ Barnabas Health | RWJ Barnabas Health--CJR, RWJ Barnabas Health--bpci_a | RWJ Barnabas Health--CJR-10-1--Rwj University Hospital At New Brunswick, RWJ Barnabas Health--CJR-10-2--Rwj University Hospital At Somerset, RWJ Barnabas Health--CJR-10-3--Robert Wood Johnson University Hospital At Rahway, RWJ Barnabas Health--CJR-10-4--Clara Maass Medical Center , RWJ Barnabas Health--CJR-10-5--Community Medical Center - Tom's River, RWJ Barnabas Health--5772-0002--Clara Maass Medical Center, RWJ Barnabas Health--5774-0002--Community Medical Center - Tom's River, RWJ Barnabas Health--5838-0002--Monmouth Medical Center |
      | View Operator user created from Super Admin user     | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | 998-877-6655 | Operator          | Episode Connect, Episode Connect Classic, Reporting, Care Innovation Institute |                      | Reporting Classic, Remedy University, Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management |     |                 | RWJ Barnabas Health | RWJ Barnabas Health--CJR, RWJ Barnabas Health--bpci_a | RWJ Barnabas Health--CJR-10-3--Robert Wood Johnson University Hospital At Rahway, RWJ Barnabas Health--CJR-10-4--Clara Maass Medical Center , RWJ Barnabas Health--CJR-10-5--Community Medical Center - Tom's River, RWJ Barnabas Health--5772-0002--Clara Maass Medical Center, RWJ Barnabas Health--5774-0002--Community Medical Center - Tom's River, RWJ Barnabas Health--5838-0002--Monmouth Medical Center, RWJ Barnabas Health--5805-0002--JERSEY CITY MEDICAL CENTER, RWJ Barnabas Health--5839-0002--Monmouth Medical Center - Southern Campus       |
