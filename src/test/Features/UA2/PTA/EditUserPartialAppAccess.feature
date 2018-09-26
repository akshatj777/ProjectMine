Feature: Edit PTA in case of partial application access

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
      | User                            | FirstName                                 | LastName                                 | Email                          | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                  | LearningPathways                                       | Locations                                                                                                                                                                                                                                                                                                                                        | expStatusCode |
      | Super Admin                     | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |            |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic, admin-Administration, analytics-Reporting, lessons-Remedy University | HZhmTBQzHtU1, NFdw0Kts2C01, n9yn5n0Qa581               | 441324--6005-059--140007, 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046 |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com | 9988776655 |     | Leader                          | 1-Leader                           | episode_connect-Episode Connect Classic                                                                       | n9yn5n0Qa581, 5HDc3E6aK_E1, p11D0Vl2FSg1               | 441324--6005-059--140007                                                                                                                                                                                                                                                                                                                         |           200 |
      | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |            |     | Manager                         | 2-Manager                          | analytics-Reporting                                                                                           | n9yn5n0Qa581, 5HDc3E6aK_E1, p11D0Vl2FSg1               | 441324--3090-191--290039                                                                                                                                                                                                                                                                                                                         |           200 |
    #  | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | qaautomation@remedysystems.com |            |     | Advanced Operator               | 3-Advanced Operator                | lessons-Remedy University                                                                                     | n9yn5n0Qa581, 5HDc3E6aK_E1, p11D0Vl2FSg1, 18h7phZr1h81 | 441324--6005-059--140007, 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046 |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedysystems.com | 9988776655 |     | Operator                        | 22-Operator                        | episode_connect-Episode Connect Classic, lessons-Remedy University, analytics-Reporting                       | n9yn5n0Qa581, 5HDc3E6aK_E1, p11D0Vl2FSg1               | 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046                           |           200 |

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
    Then I verify that Next button is "disabled"
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
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #Then I click on Hamburger menu on top left of homepage
    #And I verify "<Applications>" in product menu dropdown
    #And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    #And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    #And I switch back to old window
    And I redirect to Remedy connect page
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    #When I click on field-panel-icon button for "<User>-<Role>" user
    #When I click to "BPID" field filter under "Episode Initiator" filter field for "<User>-<Role>" user
    #And I choose "Filter" option from select options of filter field for "<User>-<Role>" user
    #And I should see "<BPID>" in the filter value list for "<User>-<Role>" user
    #And I click on cancel button from filter for "<User>-<Role>" user
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I click on RemedyU tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I switch back to old window
    And I redirect to Remedy connect page
    #And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    #And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    #And I click on Institute tile for "<User>-<Role>" user
    #And I switch to new window
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I switch back to old window
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
      | Description                                                                                                 | User                            | Email                          | NPI | Phone        | PreviousRole | Role              | ApplicationsUnchecked | ApplicationsChecked                                                                               | EnableApplications                                                                                | DisableApplications                        | ApplicationsOnViewPage                                                                 | Applications                                                                           | ApplicationsNotVisible                                                                                                                                                  | RemoveLearningPathwaySearchParameter     | LearningPathwayID | AddLearningPathwaySearchParameter     | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName         | BPID | LearningPathway                                                                                                                       | FirstName                                 | LastName | Facilities                                                                                                                                                                                                                                                                                                                                                                            | RemoveLocations | RemovePrograms | AddPrograms  | AddLocations                                             | HealthSystemsValidation | ProgramsValidation                                             | LocationsValidation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | RemovedLocationsValidation                        | RemoveProgramsValidation       | Deselect_All Locations |
      | Change role, application access, edit learning pathway and edit permissions(remove model-3 and add model-2) | Partner Technical Administrator | qaautomation@remedysystems.com |     |              | Operator     | Advanced Operator |                       | Reporting, Remedy University, Episode Connect Classic, Episode Connect, Care Innovation Institute | Remedy University, Episode Connect Classic, Episode Connect, Care Innovation Institute, Reporting | Reporting                                  | Episode Connect, Remedy University, Care Innovation Institute, Episode Connect Classic | Episode Connect, Remedy University, Care Innovation Institute, Episode Connect Classic | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management, Reporting, Reporting Classic                                  | p11D0Vl2FSg1, Care Coordination External | n9yn5n0Qa581      | Executive Acute Care Hospital Model 2 |                                | ROLE_TCS | Patient ID     | Episode DRG Issues |      | Executive Acute Care Hospital Model 2, Remedy University                                                                              | FirstNameFirstNameFirstNameFirstName      | LastName | Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                                                                  |                 | BPCI Model 3   | BPCI Model 2 | 6005-059--Presence Saint Joseph Medical Center           | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         | Sound Physicians--3090-191--Mountainview Hospital | Sound Physicians--BPCI Model 3 |                        |
      | Change application access, learning pathway and edit permissions                                            | Partner Technical Administrator | qaautomation@remedysystems.com |     | 998-877-6655 |              | Manager           |                       |                                                                                                   | Reporting, Episode Connect, Episode Connect Classic, Remedy University, Care Innovation Institute | Reporting                                  | Episode Connect, Episode Connect Classic, Care Innovation Institute, Remedy University | Episode Connect, Episode Connect Classic, Care Innovation Institute, Remedy University | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management, Reporting Classic, Reporting                                  |                                          |                   | Executive Acute Care Hospital Model 2 |                                | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Remedy University, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Care Coordination External | FirstNameFirstNameFirstNameFirstNameFirst | LastName | Mountainview Hospital, Vaughan Regional Medical Center Parkway Campus                                                                                                                                                                                                                                                                                                                 |                 |                |              | 3090-068--Vaughan Regional Medical Center Parkway Campus | Sound Physicians        | Sound Physicians--BPCI Model 3                                 | Sound Physicians--3090-191--Mountainview Hospital, Sound Physicians--3090-068--Vaughan Regional Medical Center Parkway Campus                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |                                                   |                                |                        |
      | Change application access and edit permissions with all locations                                           | Partner Technical Administrator | qaautomation@remedysystems.com |     | 998-877-6655 |              | Leader            |                       |                                                                                                   | Reporting, Episode Connect, Episode Connect Classic, Remedy University, Care Innovation Institute | Remedy University, Episode Connect Classic | Reporting, Episode Connect, Care Innovation Institute                                  | Reporting, Episode Connect, Care Innovation Institute                                  | Episode Connect for Post-acute Care, Community Connect, Care Connect, Administration, Program Management, Reporting Classic, Remedy University, Episode Connect Classic |                                          |                   |                                       |                                | ROLE_PRM | Patient ID     | Episode DRG Issues |      |                                                                                                                                       | FirstNameFirstNameFirstNameFirstNameFirst | LastName | Presence Saint Joseph Medical Center, Mountainview Hospital, Vaughan Regional Medical Center Parkway Campus, San Mateo Medical Center, Aroostook Medical Center, Mayo Clinic Health System - Mankato, St Vincent Healthcare, St Rose Dominican Hospitals - Rose De Lima Campus, Desert Springs Hosp MC, Summerlin Hospital Medical Center, St Rose Dominican Hospitals - Siena Campus |                 |                | BPCI Model 3 | All Locations                                            | Sound Physicians        | Sound Physicians--BPCI Model 3, Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--3090-191--Mountainview Hospital, Sound Physicians--3090-068--Vaughan Regional Medical Center Parkway Campus, Sound Physicians--3090-068--San Mateo Medical Center, Sound Physicians--3090-068--Aroostook Medical Center, Sound Physicians--3090-068--Mayo Clinic Health System - Mankato, Sound Physicians--3090-068--St Vincent Healthcare, Sound Physicians--3090-068--St Rose Dominican Hospitals - Rose De Lima Campus, Sound Physicians--3090-068--Valley Hospital Medical Center, Sound Physicians--3090-068--Desert Springs Hosp MC, Sound Physicians--3090-068--Summerlin Hospital Medical Center, Sound Physicians--3090-068--St Rose Dominican Hospitals - Siena Campus, Sound Physicians--3090-068--Spring Valley Hospital Medical Center |                                                   |                                |                        |
