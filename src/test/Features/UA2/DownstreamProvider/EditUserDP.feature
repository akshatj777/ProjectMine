Feature: Edit page for Downstream provider

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
      | User        | FirstName                                 | LastName                                 | Email                          | Phone | NPI | Role                              | RoleID                               | Applications                                                                                                       | LearningPathways                       | Locations                                | expStatusCode |  |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       |     | Leader                            | 1-Leader                             | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting | 3hSOHNAnvjc1,NFdw0Kts2C01,n9yn5n0Qa581 | 514083--2070-015--TSH                    |           200 |  |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedysystems.com |       |     | Remedy Sales Commercial Demo 2018 | 28-Remedy Sales Commercial Demo 2018 | episode_connect_2-Episode Connect for Post-acute Care, tci-Care Innovation Institute                               |                                        | 514029--2070-025--T, 514029--2070-023--L |           200 |  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>-<Role>"
    Then I select user with role "<User>-<PreviousRole>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I verify the header "General Information"
    Then I verify the availability of fields "First Name"
    And I fill in First Name with "<FirstName>"
    Then I verify the availability of fields "Last Name"
    Then I fill in Last Name with <LastName>
    Then I verify the availability of fields "Email"
    And I should not be able to edit Email
    Then I verify the availability of fields "Phone"
    And I fill in Phone with <Phone>
    Then I verify the availability of fields "Role"
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    And I wait for 3000 milli seconds
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<ApplicationsUnchecked>" are unchecked
    Then I verify applications "<ApplicationsChecked>" are checked
    Then I unselect all selected applications
    Then I select "<EnableApplications>" product
    Then I unselect "<DisableApplications>" product
    Then I edit learning pathway "<RemoveLearningPathwaySearchParameter>"
    Then I edit learning pathway "<AddLearningPathwaySearchParameter>"
    Then I verify that Learning Pathway ID "<LearningPathwayID>" is not displayed for the enabled Learning Pathway
    Then I verify that Next button is "enabled"
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I verify text "Which location(s) does this user have access to?" is present for "<Role>"
    Then I click on existing organisation "<Click DPHealthSystem>"
    Then I deselect "<RemoveDPLocations>" locations for Downstream Provider role
    Then I select "<DPLocations>" locations for Downstream Provider role
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
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
    Then I click on Submit button while edit for "<User>-<PreviousRole>-<Role>"
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    And I wait for 2000 milli seconds
    Then I verify email "<Email>" for "<User>-<Role>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystemsValidation>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"
    Then I verify disabled "<DisableApplications>"
    Then I verify enabled "<Applications>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
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
      | Description                                                                 | User        | Email                          | NPI | Phone        | PreviousRole                      | Role                | ApplicationsUnchecked                                          | ApplicationsChecked                                                                                                                            | EnableApplications                                                                                                                                                                                             | DisableApplications                                          | Applications                                                                                                                                                                                                   | ApplicationsNotVisible                                                                                                                       | RemoveLearningPathwaySearchParameter | LearningPathwayID | AddLearningPathwaySearchParameter     | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName                    | BPID | LearningPathway                                           | FirstName                                 | LastName                                 | Facilities                                                                                                                          | Click DPHealthSystem | RemoveDPLocations                                       | DPLocations                                      | RemoveHealthSystem | RemoveLocations | ClickHealthSystem | Health System    | Programs     | Locations                       | HealthSystemsValidation             | ProgramsValidation                                              | LocationsValidation                                                                                                                                                                                                                      | HasHealthSystem2 | Health System2    | Programs2    | Locations2                  | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Change Role to DP and Edit details                                          | Super Admin | qaautomation@remedysystems.com |     |              | Leader                            | Downstream Provider | Episode Connect for Post-acute Care, Community Connect         | Episode Connect, Episode Connect Classic, Remedy University, Care Innovation Institute                                                         | Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect, Care Innovation Institute                                                                 |                                                              | Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Care Innovation Institute, Remedy University, Community Connect                                                                 | Administration, Reporting Classic, Reporting, Care Connect, Program Management                                                               |                                      |                   |                                       |                                | ROLE_SNF | Patient ID     | Episode DRG Issues            |      | i am learning path, Learning Pathway 2, Remedy University | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Abbeville General Hospital, Litchford Falls Nursing & Rehabilitation Center, Coosa valley health care, Alaris Health at Jersey City |                      |                                                         | 190034, 345454, Coosa Valley Health Care, 020653 |                    |                 |                   |                  |              |                                 | Healthsystem - Downstream Provider  | Healthsystem - Downstream Provider--Downstream Organization     | Healthsystem - Downstream Provider--DOWN-ORG--190034, Healthsystem - Downstream Provider--DOWN-ORG--345454, Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653 |                  |                   |              |                             |                  |                |           |            |
      | Edit downstream provider general details, applications and data permissions | Super Admin | qaautomation@remedysystems.com |     | 996-385-2451 |                                   | Downstream Provider |                                                                | Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect, Care Innovation Institute | Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect, Care Innovation Institute                                                                 | Episode Connect Classic, Episode Connect for Post-acute Care | Episode Connect, Remedy University, Community Connect, Care Innovation Institute                                                                                                                               | Episode Connect Classic, Episode Connect for Post-acute Care, Administration, Reporting Classic, Reporting, Care Connect, Program Management | i am learning path                   |                   | New learning Path                     |                                | ROLE_SNF | Patient ID     | Episode DRG Issues            |      | Learning Pathway 2, Remedy University, New learning Path  | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Coosa valley health care, Alaris Health at Jersey City                                                                              |                      | 190034, Litchford Falls Nursing & Rehabilitation Center |                                                  |                    |                 |                   |                  |              |                                 | Healthsystem - Downstream Provider  | Healthsystem - Downstream Provider--Downstream Organization     | Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653                                                                                                             |                  |                   |              |                             |                  |                |           |            |
      | Change role from DP to Leader                                               | Super Admin | qaautomation@remedysystems.com |     | 996-385-2451 | Downstream Provider               | Leader              | Reporting Classic, Reporting, Episode Connect Classic          | Episode Connect, Remedy University, Care Innovation Institute                                                                                  | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute                                                                                           |                                                              | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute                                                                                           | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management                                     |                                      |                   |                                       |                                | ROLE_PRM | Patient ID     | Episode DRG Issues  [Model 3] |      | Learning Pathway 2, Remedy University, New learning Path  | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Mountainview Hospital                                                                                                               |                      |                                                         |                                                  |                    |                 |                   | Sound Physicians | BPCI Model 3 | 3090-068--Mountainview Hospital | Sound Physicians                    | Sound Physicians--BPCI Model 3                                  | Sound Physicians--3090-068--Mountainview Hospital                                                                                                                                                                                        |                  |                   |              |                             |                  |                |           |            |
      | Change Role to DP, add learning pathway and Edit details                    | Super Admin | qaautomation@remedysystems.com |     |              | Remedy Sales Commercial Demo 2018 | Downstream Provider | Community Connect, Remedy University, Episode Connect Classic  | Episode Connect, Care Innovation Institute, Episode Connect for Post-acute Care                                                                | Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect, Care Innovation Institute                                                                 |                                                              | Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Care Innovation Institute, Remedy University, Community Connect                                                                 | Administration, Reporting Classic, Reporting, Care Connect, Program Management                                                               |                                      |                   | Physician Acute Care Hospital Model 2 |                                | ROLE_SNF | Patient ID     | Episode DRG Issues            |      | Physician Acute Care Hospital Model 2                     | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Abbeville General Hospital, Litchford Falls Nursing & Rehabilitation Center, Coosa valley health care, Alaris Health at Jersey City |                      |                                                         | 190034, 345454, Coosa Valley Health Care, 020653 |                    |                 |                   |                  |              |                                 | Healthsystem - Downstream Provider  | Healthsystem - Downstream Provider--Downstream Organization     | Healthsystem - Downstream Provider--DOWN-ORG--190034, Healthsystem - Downstream Provider--DOWN-ORG--345454, Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653 |                  |                   |              |                             |                  |                |           |            |
      | Change role from DP to Internal Remedy role                                 | Super Admin | qaautomation@remedysystems.com |     | 996-385-2451 | Downstream Provider               | Remedy Other        | Reporting Classic, Reporting, Care Connect, Program Management | Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect, Care Innovation Institute | Reporting Classic, Reporting, Care Connect, Program Management, Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect, Care Innovation Institute |                                                              | Reporting Classic, Reporting, Care Connect, Program Management, Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect, Care Innovation Institute | Administration                                                                                                                               |                                      |                   |                                       |                                | ROLE_PRM | Patient ID     | Episode DRG Issues            |      | Physician Acute Care Hospital Model 2                     | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Stamford Hospital, Mountainview Hospital                                                                                            |                      |                                                         |                                                  |                    |                 |                   | Sound Physicians | BPCI Model 3 | 3090-068--Mountainview Hospital | Sound Physicians, Stamford Hospital | Sound Physicians--BPCI Model 3, Stamford Hospital--BPCI Model 2 | Stamford Hospital--2070-015--Stamford Hospital, Sound Physicians--3090-068--Mountainview Hospital                                                                                                                                        | Yes              | Stamford Hospital | BPCI Model 2 | 2070-015--Stamford Hospital |                  |                |           |            |
