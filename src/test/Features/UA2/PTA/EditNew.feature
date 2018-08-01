Feature: Merged Edit user scenarios from PTA

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
      | User                            | FirstName | LastName                                 | Email                           | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                     | LearningPathways                                       | Locations                                                                                                                        | expStatusCode |
      | Super Admin                     | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episodes,reports-Reports,physician_portal-Physician Connect,admin-Administration,lessons-Lessons | HZhmTBQzHtU1,NFdw0Kts2C01                              | 441324--3090-066--140007, 441324--3090-069--200063, 441324--3090-079--420082, 441324--6005-059--140304, 441324--6005-059--050455 |           200 |
      | Partner Technical Administrator | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Manager                         | 2-Manager                          | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                         | p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81, n9yn5n0Qa581 | 441324--6005-059--050455                                                                                                         |           200 |

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
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I edit learning pathway "<AddLearningPathwaySearchParameter>"
    Then I edit learning pathway "<RemoveLearningPathwaySearchParameter>"
    Then I verify that Learning Pathway ID "<LearningPathwayID>" is not displayed for the enabled Learning Pathway
    Then I verify that Next button is "enabled"
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I deselect "<RemovePrograms>" programs
    Then I deselect "<RemoveLocations>" locations for PTA user
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
    Then I verify enabled "<Applications>"
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
      | Description                                                                       | User                            | Email                           | NPI | Phone      | PreviousRole | Role       | ApplicationsUnchecked | ApplicationsChecked        | EnableApplications                            | DisableApplications | Applications               | ApplicationsNotVisible                                   | RemoveLearningPathwaySearchParameter                                                                                          | LearningPathwayID | AddLearningPathwaySearchParameter                                                      | LearningPathwaySearchParameter | Roletext       | ReportCategory | ReportName                   | BPID | LearningPathway                                                                                                                                  | FirstName | LastName                                 | Facilities                                                                                        | RemoveLocations                          | RemovePrograms | AddPrograms | AddLocations                                                                    | HealthSystemsValidation | ProgramsValidation                                             | LocationsValidation                                                                                                                                                                   | RemovedLocationsValidation                                                                                                                                                            | RemoveProgramsValidation       |
      | Single locations to multi locations                                               | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                            | Episodes, Reports, Lessons                    |                     | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect          |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Bolingbrook Hospital, Adventist Health Bakersfield                                      |                                          |                |             | 6005-059--Adventist Bolingbrook Hospital                                        | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--6005-059--Adventist Bolingbrook Hospital                                                                  |                                                                                                                                                                                       |                                |
      | Edit to All locations                                                             | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                            | Episodes, Reports, Lessons                    |                     | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect          |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Bolingbrook Hospital, Adventist Health Bakersfield                                      |                                          |                |             | All Locations                                                                   | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--6005-059--Adventist Bolingbrook Hospital                                                                  |                                                                                                                                                                                       |                                |
      | All locations to Single locations                                                 | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                            | Episodes, Reports, Lessons                    |                     | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect          |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Health Bakersfield                                                                      | 6005-059--Adventist Bolingbrook Hospital |                |             |                                                                                 | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield                                                                                                                              |                                                                                                                                                                                       |                                |
      | Edit single to multiple program                                                   | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                            | Episodes, Reports, Lessons                    |                     | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect          |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Health Bakersfield, Penobscot Bay Medical Center, Aiken Regional Medical Center         |                                          |                | BPCI-Model3 | 3090-069--Penobscot Bay Medical Center, 3090-079--Aiken Regional Medical Center | Sound Physicians        | Sound Physicians--BPCI Model 2, Sound Physicians--BPCI Model 3 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--3090-069--Penobscot Bay Medical Center, Sound Physicians--3090-079--Aiken Regional Medical Center         |                                                                                                                                                                                       |                                |
      | Edit multiple to single program                                                   | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                            | Episodes, Reports, Lessons                    |                     | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect          |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Health Bakersfield                                                                      |                                          | BPCI-Model3    |             |                                                                                 | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield                                                                                                                              | Sound Physicians--3090-069--Penobscot Bay Medical Center, Sound Physicians--3090-079--Aiken Regional Medical Center                                                                   | Sound Physicians--BPCI Model 3 |
      | Remove existing Program(Mod-2) and select another Program and check all locations | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                            | Episodes, Reports, Lessons                    |                     | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect          |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Presence Saint Joseph Medical Center, Penobscot Bay Medical Center, Aiken Regional Medical Center |                                          | BPCI-Model2    | BPCI-Model3 | All Locations                                                                   | Sound Physicians        | Sound Physicians--BPCI Model 3                                 | Sound Physicians--3090-066--Presence Saint Joseph Medical Center, Sound Physicians--3090-069--Penobscot Bay Medical Center, Sound Physicians--3090-079--Aiken Regional Medical Center | Sound Physicians--6005-059--Adventist Health Bakersfield                                                                                                                              | Sound Physicians--BPCI Model 2 |
      | Remove existing Program(Mod-3) and select another Program and check all locations | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                            | Episodes, Reports, Lessons                    |                     | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect          |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Health Bakersfield, Adventist Bolingbrook Hospital                                      |                                          | BPCI-Model3    | BPCI-Model2 | All Locations                                                                   | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--6005-059--Adventist Bolingbrook Hospital                                                                  | Sound Physicians--3090-066--Presence Saint Joseph Medical Center, Sound Physicians--3090-069--Penobscot Bay Medical Center, Sound Physicians--3090-079--Aiken Regional Medical Center | Sound Physicians--BPCI Model 3 |
      | Change general information, role, application and remove learning pathway         | Partner Technical Administrator | qaautomation@remedypartners.com | NPI | 9963852451 | Manager      | Physicians | Physician Connect     | Episodes, Reports, Lessons | Episodes, Reports, Lessons, Physician Connect | Reports             | Episodes, Lessons          | Episodes 2.0, Administration, Physician Connect, Reports | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | n9yn5n0Qa581      |                                                                                        |                                | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues           |      | Remedy University                                                                                                                                | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Health Bakersfield, Adventist Bolingbrook Hospital                                      |                                          |                |             |                                                                                 | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--6005-059--Adventist Bolingbrook Hospital                                                                  |                                                                                                                                                                                       |                                |
      | Change role, permissions and add learning pathway                                 | Partner Technical Administrator | qaautomation@remedypartners.com |     |            | Physicians   | Manager    | Reports               | Episodes, Lessons          | Episodes, Reports, Lessons                    |                     | Episodes, Lessons, Reports | Episodes 2.0, Administration, Physician Connect          |                                                                                                                               |                   | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2 |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Remedy University, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                        | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Health Bakersfield                                                                      | Adventist Bolingbrook Hospital           |                |             |                                                                                 | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield                                                                                                                              | Sound Physicians--6005-059--Adventist Bolingbrook Hospital                                                                                                                            |                                |
