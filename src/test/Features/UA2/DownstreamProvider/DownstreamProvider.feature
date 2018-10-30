Feature: Create Downstream Provider user from Super Admin and Validate the user profile page

  Scenario Outline: <Description>
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
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<ApplicationsUnchecked>" are unchecked
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Locations>" locations for Downstream Provider role
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
      | Description                                                               | User        | UserName                               | Password | FirstName                                 | LastName | Email                          | Phone      | Role                | ApplicationsUnchecked | Applications                                                  | ApplicationsNotVisible                                                         | NPI | LearningPathwaySearchParameter              | Locations                                                                                  |
      | Login with Super Admin User and create user with Downstream Provider role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedysystems.com | 9988776655 | Downstream Provider | Remedy University     | Episode Connect, Remedy University, Care Innovation Institute | Administration, Reporting Classic, Reporting, Care Connect, Program Management |     | HZhmTBQzHtU1, NFdw0Kts2C01, max-test-052417 | 345454, Coosa valley health care, Alaris Health at Jersey City, Abbeville General Hospital |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
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
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify disabled "<ApplicationsDisabled>"
    Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"

    Examples: 
      | Description                                                 | User        | UserName                               | Password | FirstName                                 | LastName | Phone        | Role                | ApplicationsEnabled                                           | ApplicationsDisabled                                                            | ApplicationsNotVisible | NPI | LearningPathway                                        | HealthSystem                       | Programs                                                    | Locations                                                                                                                                                                                                                                                                                                                   |
      | View Downstream Provider user created from Super Admin user | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | 998-877-6655 | Downstream Provider | Episode Connect, Remedy University, Care Innovation Institute | Episode Connect Classic, Episode Connect for Post-acute Care, Community Connect |                        |     | New learning Path, Learning Pathway 2, max-test-052417 | Healthsystem - Downstream Provider | Healthsystem - Downstream Provider--Downstream Organization | Healthsystem - Downstream Provider--DOWN-ORG--Abbeville General Hospital, Healthsystem - Downstream Provider--DOWN-ORG--Litchford Falls Nursing & Rehabilitation Center, Healthsystem - Downstream Provider--DOWN-ORG--Coosa valley health care, Healthsystem - Downstream Provider--DOWN-ORG--Alaris Health at Jersey City |

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
      | Description                                                                    | User        | FirstName                                 | LastName | Role                | Applications                                                  | ApplicationsNotVisible                                                                                                                                          | Roletext | ReportCategory | ReportName         | BPID | LearningPathway                                        | Facilities                                                                                                                          |
      | Login with DownStream Provider and verify Product Tiles and their redirections | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName | Downstream Provider | Episode Connect, Remedy University, Care Innovation Institute | Administration, Reporting Classic, Reporting, Care Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Community Connect, Program Management | ROLE_SNF | Patient ID     | Episode DRG Issues |      | New learning Path, Learning Pathway 2, max-test-052417 | Abbeville General Hospital, Litchford Falls Nursing & Rehabilitation Center, Coosa valley health care, Alaris Health at Jersey City |

  Scenario Outline: <Description>
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
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<ApplicationsUnchecked>" are unchecked
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Locations>" locations for Downstream Provider role
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
      | Description                                                               | User        | UserName                               | Password | FirstName                                 | LastName | Email                          | Phone      | Role                | ApplicationsUnchecked   | Applications                                                        | ApplicationsNotVisible                                                         | NPI | LearningPathwaySearchParameter                                          | Locations                                                                                  |
      | Login with Super Admin User and create user with Downstream Provider role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedysystems.com | 9988776655 | Downstream Provider | Episode Connect Classic | Episode Connect, Episode Connect Classic, Care Innovation Institute | Administration, Reporting Classic, Reporting, Care Connect, Program Management |     | HZhmTBQzHtU1, NFdw0Kts2C01, 3hSOHNAnvjc1, max-test-052417, n9yn5n0Qa581 | 345454, Coosa valley health care, Alaris Health at Jersey City, Abbeville General Hospital |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
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
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify disabled "<ApplicationsDisabled>"
    Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"

    Examples: 
      | Description                                                 | User        | UserName                               | Password | FirstName                                 | LastName | Phone        | Role                | ApplicationsEnabled                                                 | ApplicationsDisabled                                                      | ApplicationsNotVisible | NPI | LearningPathway | HealthSystem                       | Programs                                                    | Locations                                                                                                                                                                                                                                                                                                                   |
      | View Downstream Provider user created from Super Admin user | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | 998-877-6655 | Downstream Provider | Episode Connect, Episode Connect Classic, Care Innovation Institute | Episode Connect for Post-acute Care, Remedy University, Community Connect |                        |     |                 | Healthsystem - Downstream Provider | Healthsystem - Downstream Provider--Downstream Organization | Healthsystem - Downstream Provider--DOWN-ORG--Abbeville General Hospital, Healthsystem - Downstream Provider--DOWN-ORG--Litchford Falls Nursing & Rehabilitation Center, Healthsystem - Downstream Provider--DOWN-ORG--Coosa valley health care, Healthsystem - Downstream Provider--DOWN-ORG--Alaris Health at Jersey City |

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
      | Description                                                                    | User        | FirstName                                 | LastName | Role                | Applications                                                        | ApplicationsNotVisible                                                                                                                                    | Roletext | ReportCategory | ReportName         | BPID | LearningPathway                                                                               | Facilities                                                                                                                          |
      | Login with DownStream Provider and verify Product Tiles and their redirections | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName | Downstream Provider | Episode Connect, Episode Connect Classic, Care Innovation Institute | Administration, Reporting Classic, Reporting, Care Connect, Episode Connect for Post-acute Care, Remedy University, Community Connect, Program Management | ROLE_SNF | Patient ID     | Episode DRG Issues |      | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Remedy University | Abbeville General Hospital, Litchford Falls Nursing & Rehabilitation Center, Coosa valley health care, Alaris Health at Jersey City |

  Scenario Outline: <Description>
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
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<ApplicationsUnchecked>" are unchecked
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Locations>" locations for Downstream Provider role
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
      | Description                                                               | User        | UserName                               | Password | FirstName                                 | LastName | Email                          | Phone      | Role                | ApplicationsUnchecked                                  | Applications                                                                                       | ApplicationsNotVisible                                                         | NPI | LearningPathwaySearchParameter                                          | Locations                                                                                  |
      | Login with Super Admin User and create user with Downstream Provider role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedysystems.com | 9988776655 | Downstream Provider | Episode Connect for Post-acute Care, Community Connect | Episode Connect, Episode Connect for Post-acute Care, Community Connect, Care Innovation Institute | Administration, Reporting Classic, Reporting, Care Connect, Program Management |     | HZhmTBQzHtU1, NFdw0Kts2C01, 3hSOHNAnvjc1, max-test-052417, n9yn5n0Qa581 | 345454, Coosa valley health care, Alaris Health at Jersey City, Abbeville General Hospital |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
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
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify disabled "<ApplicationsDisabled>"
    Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"

    Examples: 
      | Description                                                 | User        | UserName                               | Password | FirstName                                 | LastName | Phone        | Role                | ApplicationsEnabled                                                                                | ApplicationsDisabled                       | ApplicationsNotVisible | NPI | LearningPathway | HealthSystem                       | Programs                                                    | Locations                                                                                                                                                                                                                                                                                                                   |
      | View Downstream Provider user created from Super Admin user | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | 998-877-6655 | Downstream Provider | Episode Connect, Episode Connect for Post-acute Care, Community Connect, Care Innovation Institute | Episode Connect Classic, Remedy University |                        |     |                 | Healthsystem - Downstream Provider | Healthsystem - Downstream Provider--Downstream Organization | Healthsystem - Downstream Provider--DOWN-ORG--Abbeville General Hospital, Healthsystem - Downstream Provider--DOWN-ORG--Litchford Falls Nursing & Rehabilitation Center, Healthsystem - Downstream Provider--DOWN-ORG--Coosa valley health care, Healthsystem - Downstream Provider--DOWN-ORG--Alaris Health at Jersey City |

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
      | Description                                                                    | User        | FirstName                                 | LastName | Role                | Applications                                                                                       | ApplicationsNotVisible                                                                                                     | Roletext | ReportCategory | ReportName         | BPID | LearningPathway                                                                               | Facilities                                                                                                                          |
      | Login with DownStream Provider and verify Product Tiles and their redirections | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName | Downstream Provider | Episode Connect, Episode Connect for Post-acute Care, Care Innovation Institute, Community Connect | Administration, Reporting Classic, Reporting, Care Connect, Episode Connect Classic, Remedy University, Program Management | ROLE_SNF | Patient ID     | Episode DRG Issues |      | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Remedy University | Abbeville General Hospital, Litchford Falls Nursing & Rehabilitation Center, Coosa valley health care, Alaris Health at Jersey City |

  Scenario Outline: <Description>
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
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<ApplicationsUnchecked>" are unchecked
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Locations>" locations for Downstream Provider role
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
      | Description                                                               | User        | UserName                               | Password | FirstName                                 | LastName | Email                          | Phone      | Role                | ApplicationsUnchecked                                                                              | Applications                                                                                                                                   | ApplicationsNotVisible                                                         | NPI | LearningPathwaySearchParameter                         | Locations                                                                                  | HasHealthSystem1 | Health System1 | Programs1 | Locations1 | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Downstream Provider role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedysystems.com | 9988776655 | Downstream Provider | Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect | Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect, Care Innovation Institute | Administration, Reporting Classic, Reporting, Care Connect, Program Management |     | New learning Path, Learning Pathway 2, max-test-052417 | 345454, Coosa valley health care, Alaris Health at Jersey City, Abbeville General Hospital | No               |                |           |            | No               |                |           |            | No               |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
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
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify disabled "<ApplicationsDisabled>"
    Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"

    Examples: 
      | Description                                                 | User        | UserName                               | Password | FirstName                                 | LastName | Phone        | Role                | ApplicationsEnabled                                                                                                                            | ApplicationsDisabled | ApplicationsNotVisible                                       | NPI | LearningPathway                                        | HealthSystem                       | Programs                                                    | Locations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | View Downstream Provider user created from Super Admin user | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | 998-877-6655 | Downstream Provider | Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect, Care Innovation Institute |                      | Administration, Care Innovation Institute, Reporting Classic |     | New learning Path, Learning Pathway 2, max-test-052417 | Healthsystem - Downstream Provider | Healthsystem - Downstream Provider--Downstream Organization | Healthsystem - Downstream Provider--DOWN-ORG--345454, Healthsystem - Downstream Provider--DOWN-ORG--Coosa valley health care, Healthsystem - Downstream Provider--DOWN-ORG--Alaris Health at Jersey City, Healthsystem - Downstream Provider--DOWN-ORG--Abbeville General Hospital, Healthsystem - Downstream Provider--DOWN-ORG--Abbeville General Hospital, Healthsystem - Downstream Provider--DOWN-ORG--Litchford Falls Nursing & Rehabilitation Center, Healthsystem - Downstream Provider--DOWN-ORG--Coosa valley health care, Healthsystem - Downstream Provider--DOWN-ORG--Alaris Health at Jersey City |

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
      | Description                                                                    | User        | FirstName                                 | LastName | Role                | Applications                                                                                                                                   | ApplicationsNotVisible                                                         | Roletext | ReportCategory | ReportName         | BPID | LearningPathway                                        | Facilities                                                                                                                          |
      | Login with DownStream Provider and verify Product Tiles and their redirections | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName | Downstream Provider | Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Care Innovation Institute, Remedy University, Community Connect | Administration, Reporting Classic, Reporting, Care Connect, Program Management | ROLE_SNF | Patient ID     | Episode DRG Issues |      | New learning Path, Learning Pathway 2, max-test-052417 | Abbeville General Hospital, Litchford Falls Nursing & Rehabilitation Center, Coosa valley health care, Alaris Health at Jersey City |

  Scenario Outline: Validating that Error is getting displayed on searching any downstream provider location less than 5 alphabets and clicking on pagination on creating and editing Downstream Provider role
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
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I search "<Loc>" locations for Downstream Provider role
    Then I click on > to navigate to next page while "creating" the user
    Then I should not see any error message on searching any downstream provider location less than 5 alphabets
    Then I select "<Locations>" locations for Downstream Provider role
    Then I click on Submit button for "<User>"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify Edit Icon
    Then I click on Edit Icon
    Then I select "Permissions" tab
    Then I search "<Loc>" locations for Downstream Provider role
    Then I click on > to navigate to next page while "editing" the user
    Then I should not see any error message on searching any downstream provider location less than 5 alphabets

    Examples: 
      | User        | UserName                               | Password | FirstName                                 | LastName | Email                          | Role                | Applications      | ApplicationsNotVisible            | NPI | LearningPathwaySearchParameter | Loc | Locations                    |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedysystems.com | Downstream Provider | Community Connect | Administration, Reporting Classic |     |                                | Bap | Alaris Health at Jersey City |

  Scenario Outline: Validating Cross(X) icon for Downstream Provider role
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
    Then I click on Next button
    Then I verify the header "Applications"
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Locations>" locations for Downstream Provider role
    Then I click on Cross button
    Then I should see header text "Users"

    Examples: 
      | User        | UserName                               | Password | FirstName                                 | LastName | Email                          | Phone      | Role                | Applications                        | NPI | Locations                |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedysystems.com | 9988776655 | Downstream Provider | Episode Connect for Post-acute Care |     | Coosa Valley Health Care |
