Feature: Edit user scenarios from PTA

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
      | User                            | FirstName                                 | LastName                                 | Email                          | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                                                                                  | LearningPathways                                       | Locations                                                                                                                                                                                                                                                                                                                                        | expStatusCode |
      | Super Admin                     | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |            |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic, reports-Reporting Classic, admin-Administration, lessons-Remedy University, analytics-Reporting, community_connect-Community Connect | HZhmTBQzHtU1, NFdw0Kts2C01, n9yn5n0Qa581               | 441324--6005-059--140007, 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046 |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com | 9988776655 |     | Leader                          | 1-Leader                           | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting, community_connect-Community Connect                       | n9yn5n0Qa581, 5HDc3E6aK_E1, p11D0Vl2FSg1               | 441324--6005-059--140007                                                                                                                                                                                                                                                                                                                         |           200 |
      | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |            |     | Manager                         | 2-Manager                          | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting, community_connect-Community Connect                       | n9yn5n0Qa581, 5HDc3E6aK_E1, p11D0Vl2FSg1               | 441324--3090-191--290039                                                                                                                                                                                                                                                                                                                         |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | qaautomation@remedysystems.com |            |     | Advanced Operator               | 3-Advanced Operator                | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting, community_connect-Community Connect                       | n9yn5n0Qa581, 5HDc3E6aK_E1, p11D0Vl2FSg1, 18h7phZr1h81 | 441324--6005-059--140007, 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046 |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedysystems.com | 9988776655 |     | Operator                        | 22-Operator                        | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting, community_connect-Community Connect                       | n9yn5n0Qa581, 5HDc3E6aK_E1, p11D0Vl2FSg1               | 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046                           |           200 |

  Scenario Outline: <Description>
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
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
    Then I verify the availability of field NPI for "<Role>"
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<ApplicationsUnchecked>" are unchecked
    Then I verify applications "<ApplicationsChecked>" are checked
    Then I unselect all selected applications
    Then I select "<EnableApplications>" product
    Then I unselect "<DisableApplications>" product
    Then I edit learning pathway "<AddLearningPathwaySearchParameter>"
    Then I edit learning pathway "<RemoveLearningPathwaySearchParameter>"
    Then I verify that Learning Pathway ID "<LearningPathwayID>" is not displayed for the enabled Learning Pathway
    Then I verify "<LearningPathway>" while editing the user
    Then I verify that Next button is "enabled"
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I deselect "<RemovePrograms>" programs
    Then I deselect "<RemoveLocations>" locations for PTA user
    Then I deselect "<Deselect_All Locations>" locations for PTA user
    Then I select "<AddPrograms>" programs for existing organisation
    Then I select "<AddLocations>" locations for PTA user
    And I verify that "<RemovePrograms>" is not reflected as selected in edit user page
    Then I click on Submit button while edit for "<User>-<PreviousRole>-<Role>"
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify email "<Email>" for "<User>-<Role>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystemsValidation>"
    Then I verify Program "<RemoveProgramsValidation>" is not present in view user page
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"
    Then I verify location "<RemovedLocationsValidation>" is not present on view page
    Then I verify disabled "<DisableApplications>"
    Then I verify enabled "<ApplicationsOnViewPage>"
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
      | Description                                                                             | User                            | Email                          | NPI | Phone        | PreviousRole | Role              | ApplicationsUnchecked | ApplicationsChecked                                                                                                  | EnableApplications                                                                                                                      | DisableApplications                        | ApplicationsOnViewPage                                                                                                                  | Applications                                                                                                                            | ApplicationsNotVisible                                                                                                            | RemoveLearningPathwaySearchParameter                | LearningPathwayID | AddLearningPathwaySearchParameter     | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName         | BPID | LearningPathway                                                                                           | FirstName                                  | LastName                                 | Facilities                                                                                                                                                                                                                                                                                                                                      | RemoveLocations | RemovePrograms | AddPrograms  | AddLocations                                             | HealthSystemsValidation | ProgramsValidation                                             | LocationsValidation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | RemovedLocationsValidation                                                 | RemoveProgramsValidation       | Deselect_All Locations |
      | Single locations to multi locations                                                     | Partner Technical Administrator | qaautomation@remedysystems.com |     |              |              | Manager           |                       |                                                                                                                      | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect |                                            | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect for Post-acute Care, Care Connect, Administration, Program Management                                             |                                                     |                   |                                       |                                | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Remedy University, Care Coordination External, Clinical Operations Acute Care Hospital Model 2            | FirstName                                  | LastNameLastNameLastNameLastNameLastName | Mountainview Hospital, Vaughan Regional Medical Center Parkway Campus                                                                                                                                                                                                                                                                           |                 |                |              | 3090-068--Vaughan Regional Medical Center Parkway Campus | Sound Physicians        | Sound Physicians--BPCI Model 3                                 | Sound Physicians--3090-191--Mountainview Hospital, Sound Physicians--3090-068--Vaughan Regional Medical Center Parkway Campus                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |                                                                            |                                |                        |
      | Edit to All locations                                                                   | Partner Technical Administrator | qaautomation@remedysystems.com |     |              |              | Manager           |                       |                                                                                                                      | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect |                                            | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect for Post-acute Care, Care Connect, Administration, Program Management                                             |                                                     |                   |                                       |                                | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Remedy University, Care Coordination External, Clinical Operations Acute Care Hospital Model 2            | FirstName                                  | LastNameLastNameLastNameLastNameLastName | Mountainview Hospital, Vaughan Regional Medical Center Parkway Campus, San Mateo Medical Center, Aroostook Medical Center, Mayo Clinic Health System - Mankato, St Vincent Healthcare, St Rose Dominican Hospitals - Rose De Lima Campus, Desert Springs Hosp MC, Summerlin Hospital Medical Center, St Rose Dominican Hospitals - Siena Campus |                 |                |              | All Locations                                            | Sound Physicians        | Sound Physicians--BPCI Model 3                                 | Sound Physicians--3090-191--Mountainview Hospital, Sound Physicians--3090-068--Vaughan Regional Medical Center Parkway Campus, Sound Physicians--3090-068--San Mateo Medical Center, Sound Physicians--3090-068--Aroostook Medical Center, Sound Physicians--3090-068--Mayo Clinic Health System - Mankato, Sound Physicians--3090-068--St Vincent Healthcare, Sound Physicians--3090-068--St Rose Dominican Hospitals - Rose De Lima Campus, Sound Physicians--3090-068--Valley Hospital Medical Center, Sound Physicians--3090-068--Desert Springs Hosp MC, Sound Physicians--3090-068--Summerlin Hospital Medical Center, Sound Physicians--3090-068--St Rose Dominican Hospitals - Siena Campus, Sound Physicians--3090-068--Spring Valley Hospital Medical Center |                                                                            |                                |                        |
      | All locations to Single locations                                                       | Partner Technical Administrator | qaautomation@remedysystems.com |     | 998-877-6655 |              | Manager           |                       |                                                                                                                      | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect |                                            | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect for Post-acute Care, Care Connect, Administration, Program Management                                             |                                                     |                   |                                       |                                | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Remedy University, Care Coordination External, Clinical Operations Acute Care Hospital Model 2            | FirstName                                  | LastNameLastNameLastNameLastNameLastName | Mountainview Hospital                                                                                                                                                                                                                                                                                                                           | All Locations   |                |              | 3090-191--Mountainview Hospital                          | Sound Physicians        | Sound Physicians--BPCI Model 3                                 | Sound Physicians--3090-191--Mountainview Hospital                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Sound Physicians--3090-068--Vaughan Regional Medical Center Parkway Campus |                                | All Locations          |
      | Edit single to multiple program                                                         | Partner Technical Administrator | qaautomation@remedysystems.com |     |              |              | Manager           |                       |                                                                                                                      | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect |                                            | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect for Post-acute Care, Care Connect, Administration, Program Management                                             |                                                     |                   |                                       |                                | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Remedy University, Care Coordination External, Clinical Operations Acute Care Hospital Model 2            | FirstName                                  | LastNameLastNameLastNameLastNameLastName | Mountainview Hospital, Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                     |                 |                | BPCI Model 2 | 6005-059--Presence Saint Joseph Medical Center           | Sound Physicians        | Sound Physicians--BPCI Model 3, Sound Physicians--BPCI Model 2 | Sound Physicians--3090-191--Mountainview Hospital, Sound Physicians--6005-059--Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |                                                                            |                                |                        |
      | Change application access, remove learning pathway and edit multiple to single program  | Partner Technical Administrator | qaautomation@remedysystems.com |     |              |              | Advanced Operator |                       |                                                                                                                      | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect Classic, Community Connect | Episode Connect, Reporting Classic, Remedy University, Reporting, Care Innovation Institute                                             | Episode Connect, Reporting Classic, Remedy University, Reporting, Care Innovation Institute                                             | Episode Connect Classic, Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management | p11D0Vl2FSg1, Physician Acute Care Hospital Model 2 |                   |                                       |                                | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Remedy University, Care Coordination External                                                             | FirstNameFirstNameFirstNameFirstName       | LastName                                 | Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                            |                 | BPCI Model 3   |              |                                                          | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Sound Physicians--3090-191--Mountainview Hospital                          | Sound Physicians--BPCI Model 3 |                        |
      | Remove existing Program(Mod-2) and select another Program and check all locations       | Partner Technical Administrator | qaautomation@remedysystems.com |     |              |              | Leader            |                       |                                                                                                                      | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect |                                            | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect for Post-acute Care, Care Connect, Administration, Program Management                                             |                                                     |                   |                                       |                                | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Remedy University, Care Coordination External, Clinical Operations Acute Care Hospital Model 2            | FirstNameFirstNameFirstNameFirstName       | LastNameLastNameLastNameLastNameLastName | Mountainview Hospital, Vaughan Regional Medical Center Parkway Campus, San Mateo Medical Center, Aroostook Medical Center, Mayo Clinic Health System - Mankato, St Vincent Healthcare, St Rose Dominican Hospitals - Rose De Lima Campus, Desert Springs Hosp MC, Summerlin Hospital Medical Center, St Rose Dominican Hospitals - Siena Campus |                 | BPCI Model 2   | BPCI Model 3 | 3090-191--Mountainview Hospital, 3090-068--All 3090-068  | Sound Physicians        | Sound Physicians--BPCI Model 3                                 | Sound Physicians--3090-191--Mountainview Hospital, Sound Physicians--3090-068--Vaughan Regional Medical Center Parkway Campus, Sound Physicians--3090-068--San Mateo Medical Center, Sound Physicians--3090-068--Aroostook Medical Center, Sound Physicians--3090-068--Mayo Clinic Health System - Mankato, Sound Physicians--3090-068--St Vincent Healthcare, Sound Physicians--3090-068--St Rose Dominican Hospitals - Rose De Lima Campus, Sound Physicians--3090-068--Valley Hospital Medical Center, Sound Physicians--3090-068--Desert Springs Hosp MC, Sound Physicians--3090-068--Summerlin Hospital Medical Center, Sound Physicians--3090-068--St Rose Dominican Hospitals - Siena Campus, Sound Physicians--3090-068--Spring Valley Hospital Medical Center | Sound Physicians--6005-059--Presence Saint Joseph Medical Center           | Sound Physicians--BPCI Model 2 |                        |
      | Remove existing Program(Mod-3) and select another Program and check all locations       | Partner Technical Administrator | qaautomation@remedysystems.com |     |              |              | Operator          |                       |                                                                                                                      | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect |                                            | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Episode Connect for Post-acute Care, Care Connect, Administration, Program Management                                             |                                                     | p11D0Vl2FSg1      |                                       |                                | ROLE_TCS | Patient ID     | Episode DRG Issues |      | Remedy University, Care Coordination External, Clinical Operations Acute Care Hospital Model 2            | FirstNameFirstNameFirstNameFirstNameFirst  | LastName                                 | Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                            |                 | BPCI Model 3   | BPCI Model 2 | All Locations                                            | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Sound Physicians--3090-191--Mountainview Hospital                          | Sound Physicians--BPCI Model 3 |                        |
      | ' in FN and LN , change role, application access, learning pathway and edit permissions | Partner Technical Administrator | qaautomation@remedysystems.com |     | 998-877-6655 | Operator     | Advanced Operator |                       | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute, Community Connect | Reporting, Reporting Classic               | Episode Connect, Episode Connect Classic, Remedy University, Care Innovation Institute, Community Connect                               | Episode Connect, Episode Connect Classic, Remedy University, Care Innovation Institute, Community Connect                               | Episode Connect for Post-acute Care, Care Connect, Administration, Program Management, Reporting, Reporting Classic               | Care Coordination External                          | qfy2xp8zSFc1      | Executive Acute Care Hospital Model 2 |                                | ROLE_TCS | Patient ID     | Episode DRG Issues |      | Remedy University, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2 | FirstName'FirstNameFirstNameFirstNameFirst | Last'Name                                | Presence Saint Joseph Medical Center, Mountainview Hospital                                                                                                                                                                                                                                                                                     |                 |                | BPCI Model 3 | 3090-191--Mountainview Hospital                          | Sound Physicians        | Sound Physicians--BPCI Model 2, Sound Physicians--BPCI Model 3 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--3090-191--Mountainview Hospital                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |                                                                            |                                |                        |

  Scenario Outline: Validating- all locations should not be displayed as selected when the "All Locations" check box is unchecked while editing the user + Validating that pagination is not displayed when few locations are added in the data permissions while editing a user
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
    Then I select "Permissions" tab
    Then I verify the header "Permissions"
    Then I select "<Locations>" locations for PTA user
    Then I deselect "<Locations>" locations for PTA user
    And I wait for 3000 milli seconds
    And I verify Location "<UnSelectedLocations>" are not shown in selected Locations section
    Then I select "<EnableLocations>" locations for PTA user
    Then I verify that pagination is not displayed for selected locations

    Examples: 
      | User                            | Role    | Locations     | EnableLocations                 | UnSelectedLocations   |
      | Partner Technical Administrator | Manager | All Locations | 3090-191--Mountainview Hospital | Mountainview Hospital |

  Scenario Outline: Verify the functionality of back/Cancel button
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
    And I fill in First Name with "First Name"
    Then I fill in Last Name with LastName
    Then I click on Next button
    Then I verify the header "Applications"
    Then I click on "General Information" tab on the left
    Then I verify the header "General Information"
    Then I click on "Applications" tab on the left
    Then I verify the header "Applications"
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I click on Back button
    Then I verify the header "Applications"
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I click on "General Information" tab on the left
    Then I verify the header "General Information"
    Then I click on "Applications" tab on the left
    Then I verify the header "Applications"
    Then I click on "Permissions" tab on the left
    Then I verify the header "Permissions"
    Then I click on Cancel button
    And I verify that I am navigated to user page

    Examples: 
      | User                            | Role    |
      | Partner Technical Administrator | Manager |

  Scenario Outline: Verify validation message for invalid lesson name and invalid location
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
    Then I click on "Applications" tab on the left
    Then I verify the header "Applications"
    Then I click on learning pathway dropdown
    #Then I verify Learning Pathway search box is available
    Then I enter invalid Learning Pathway "<InvalidLearningPathwayName>"
    And I verify No results found under Learning Pathway search box
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<AddInvalidLocations>" locations for PTA user
    And I verify No results found for invalid Location in selected organisation

    Examples: 
      | User                            | Role   | InvalidLearningPathwayName | AddInvalidLocations |
      | Partner Technical Administrator | Leader | Test123                    | test768             |

  Scenario Outline: Selected locations for Model-2 are not getting displayed as selected after unchecking Model-2 from program drop down while editing the user
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
    Then I select "Permissions" tab
    Then I deselect "<RemovePrograms>" programs
    Then I search the "<Locations>" in the Selected Locations section
    And I verify No results found for invalid Location for "first" in selected organisation for PTA user

    Examples: 
      | User                            | Email                          | Role    | Health System    | RemovePrograms | Locations                                      |
      | Partner Technical Administrator | qaautomation@remedysystems.com | Manager | Sound Physicians | BPCI Model 2   | 6005-059--Presence Saint Joseph Medical Center |

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
    And I click on Edit button
    Then I verify the header "General Information"
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I enter Phone field with <Phone>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    And I switch the focus to Next button
    Then I verify the validation message "<ValidationMsg>" on Create User Page

    Examples: 
      | Description                                      | User                            | FirstName  | LastName   | Email                          | Phone      | Role              | NPI | ValidationMsg                     |  |
      | Verify validation message for blank First name   | Partner Technical Administrator |            | Last Name  | qaautomation@remedysystems.com | 9874563210 | Advanced Operator |     | First Name is required            |  |
      | Verify validation message for blank Last name    | Partner Technical Administrator | First Name |            | qaautomation@remedysystems.com | 9874563210 | Advanced Operator |     | Last Name is required             |  |
      | Verify validation message for invalid Phone      | Partner Technical Administrator | First Name | Last Name  | qaautomation@remedysystems.com |     123564 | Advanced Operator |     | Please enter a valid phone number |  |
      | Verify validation message for invalid First Name | Partner Technical Administrator | 847&827919 | Last Name  | qaautomation@remedysystems.com | 9874563210 | Advanced Operator |     | Please enter a valid name         |  |
      | Verify validation message for invalid Last name  | Partner Technical Administrator | First Name | 847382&919 | qaautomation@remedysystems.com | 9874563210 | Advanced Operator |     | Please enter a valid name         |  |

  Scenario Outline: Verify the search functionality in selected locations and delete a location
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
    Then I select "Permissions" tab
    Then I verify the header "Permissions"
    And I verify selected Location "<SelectedLocations>" in the selected Locations section
    Then I search the "<Locations>" in the Selected Locations section
    Then I verify facility key "<facilityKey>" is not displayed with location name "<SelectedLocations>"
    And I click on remove link icon for selected Locations on selected Locations section
    And I verify Selected Locations section after click on remove link icon

    Examples: 
      | User                            | Role    | Locations                                      | SelectedLocations                    | facilityKey |
      | Partner Technical Administrator | Manager | 6005-059--Presence Saint Joseph Medical Center | Presence Saint Joseph Medical Center |      140007 |
