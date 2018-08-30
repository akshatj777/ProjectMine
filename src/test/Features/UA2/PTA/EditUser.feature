Feature: Edit user scenarios from PTA

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
      | User                            | FirstName                            | LastName                                 | Email                           | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                     | LearningPathways                                       | Locations                                                                                                                        | expStatusCode |
      | Super Admin                     | FirstName                            | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,admin-Administration,lessons-Lessons | HZhmTBQzHtU1,NFdw0Kts2C01                              | 441324--3090-066--140007, 441324--3090-069--200063, 441324--3090-079--420082, 441324--6005-059--140304, 441324--6005-059--050455 |           200 |
      | Partner Technical Administrator | FirstName                            | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Manager                         | 2-Manager                          | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,lessons-Lessons                      | p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81, n9yn5n0Qa581 | 441324--6005-059--050455                                                                                                         |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 | NPI | Physicians                      | 4-Physicians                       | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,lessons-Lessons                      | p11D0Vl2FSg1,qfy2xp8zSFc1                              | 441324--3090-066--140007, 441324--3090-069--200063, 441324--3090-079--420082, 441324--6005-059--050455, 441324--6005-059--140304 |           200 |

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
    Then I verify "<LearningPathway>" while editing the user
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
      | Description                                                                       | User                            | Email                           | NPI | Phone      | PreviousRole | Role       | ApplicationsUnchecked | ApplicationsChecked                                 | EnableApplications                                  | DisableApplications | Applications                                        | ApplicationsNotVisible                                                 | RemoveLearningPathwaySearchParameter                                                                                          | LearningPathwayID | AddLearningPathwaySearchParameter                                                      | LearningPathwaySearchParameter | Roletext       | ReportCategory | ReportName                   | BPID | LearningPathway                                                                                                                                  | FirstName | LastName                                 | Facilities                                                                                        | RemoveLocations                          | RemovePrograms | AddPrograms  | AddLocations                                                                    | HealthSystemsValidation | ProgramsValidation                                             | LocationsValidation                                                                                                                                                                   | RemovedLocationsValidation                                                                                                                                                            | RemoveProgramsValidation       |
      | Single locations to multi locations                                               | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                                                     | Episode Connect Classic, Reporting Classic, Lessons |                     | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration                    |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Bolingbrook Hospital, Adventist Health Bakersfield                                      |                                          |                |              | 6005-059--Adventist Bolingbrook Hospital                                        | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--6005-059--Adventist Bolingbrook Hospital                                                                  |                                                                                                                                                                                       |                                |
      | Edit to All locations                                                             | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                                                     | Episode Connect Classic, Reporting Classic, Lessons |                     | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration                    |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Bolingbrook Hospital, Adventist Health Bakersfield                                      |                                          |                |              | All Locations                                                                   | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--6005-059--Adventist Bolingbrook Hospital                                                                  |                                                                                                                                                                                       |                                |
      | All locations to Single locations                                                 | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                                                     | Episode Connect Classic, Reporting Classic, Lessons |                     | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration                    |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Health Bakersfield                                                                      | 6005-059--Adventist Bolingbrook Hospital |                |              |                                                                                 | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield                                                                                                                              |                                                                                                                                                                                       |                                |
      | Edit single to multiple program                                                   | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                                                     | Episode Connect Classic, Reporting Classic, Lessons |                     | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration                    |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Health Bakersfield, Penobscot Bay Medical Center, Aiken Regional Medical Center         |                                          |                | BPCI Model 3 | 3090-069--Penobscot Bay Medical Center, 3090-079--Aiken Regional Medical Center | Sound Physicians        | Sound Physicians--BPCI Model 2, Sound Physicians--BPCI Model 3 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--3090-069--Penobscot Bay Medical Center, Sound Physicians--3090-079--Aiken Regional Medical Center         |                                                                                                                                                                                       |                                |
      | Edit multiple to single program                                                   | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                                                     | Episode Connect Classic, Reporting Classic, Lessons |                     | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration                    |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Health Bakersfield                                                                      |                                          | BPCI Model 3   |              |                                                                                 | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield                                                                                                                              | Sound Physicians--3090-069--Penobscot Bay Medical Center, Sound Physicians--3090-079--Aiken Regional Medical Center                                                                   | Sound Physicians--BPCI Model 3 |
      | Remove existing Program(Mod-2) and select another Program and check all locations | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                                                     | Episode Connect Classic, Reporting Classic, Lessons |                     | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration                    |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Presence Saint Joseph Medical Center, Penobscot Bay Medical Center, Aiken Regional Medical Center |                                          | BPCI Model 2   | BPCI Model 3 | All Locations                                                                   | Sound Physicians        | Sound Physicians--BPCI Model 3                                 | Sound Physicians--3090-066--Presence Saint Joseph Medical Center, Sound Physicians--3090-069--Penobscot Bay Medical Center, Sound Physicians--3090-079--Aiken Regional Medical Center | Sound Physicians--6005-059--Adventist Health Bakersfield                                                                                                                              | Sound Physicians--BPCI Model 2 |
      | Remove existing Program(Mod-3) and select another Program and check all locations | Partner Technical Administrator | qaautomation@remedypartners.com |     |            |              | Manager    |                       |                                                     | Episode Connect Classic, Reporting Classic, Lessons |                     | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration                    |                                                                                                                               |                   |                                                                                        |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Health Bakersfield, Adventist Bolingbrook Hospital                                      |                                          | BPCI Model 3   | BPCI Model 2 | All Locations                                                                   | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--6005-059--Adventist Bolingbrook Hospital                                                                  | Sound Physicians--3090-066--Presence Saint Joseph Medical Center, Sound Physicians--3090-069--Penobscot Bay Medical Center, Sound Physicians--3090-079--Aiken Regional Medical Center | Sound Physicians--BPCI Model 3 |
      | Change general information, role, application and remove learning pathway         | Partner Technical Administrator | qaautomation@remedypartners.com | NPI | 9963852451 | Manager      | Physicians |                       | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect Classic, Reporting Classic, Lessons | Reporting Classic   | Episode Connect Classic, Lessons                    | Episode Connect for Post-acute Care, Administration, Reporting Classic | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | n9yn5n0Qa581      |                                                                                        |                                | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues           |      | Remedy University                                                                                                                                | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Health Bakersfield, Adventist Bolingbrook Hospital                                      |                                          |                |              |                                                                                 | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--6005-059--Adventist Bolingbrook Hospital                                                                  |                                                                                                                                                                                       |                                |
      | Change role, permissions and add learning pathway                                 | Partner Technical Administrator | qaautomation@remedypartners.com |     |            | Physicians   | Manager    | Reporting Classic     | Episode Connect Classic, Lessons                    | Episode Connect Classic, Reporting Classic, Lessons |                     | Episode Connect Classic, Lessons, Reporting Classic | Episode Connect for Post-acute Care, Administration                    |                                                                                                                               |                   | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2 |                                | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Remedy University, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                        | FirstName | LastNameLastNameLastNameLastNameLastName | Adventist Health Bakersfield                                                                      | Adventist Bolingbrook Hospital           |                |              |                                                                                 | Sound Physicians        | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Adventist Health Bakersfield                                                                                                                              | Sound Physicians--6005-059--Adventist Bolingbrook Hospital                                                                                                                            |                                |

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
    And I verify Location "<UnSelectedLocations>" are not shown in selected Locations section
    Then I select "<EnableLocations>" locations for PTA user
    Then I verify that pagination is not displayed for selected locations

    Examples: 
      | User                            | Role    | Locations     | EnableLocations                        | UnSelectedLocations          |
      | Partner Technical Administrator | Manager | All Locations | 6005-059--Adventist Health Bakersfield | Adventist Health Bakersfield |

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

  Scenario Outline: Verify validation message for invalid lesson name in search box
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
    #Then I click on learning pathway dropdown
    #Then I verify Learning Pathway search box is available
    Then I edit learning pathway "<InvalidLearningPathwayName>"
    And I verify No results found under Learning Pathway search box

    Examples: 
      | User                            | Role   | InvalidLearningPathwayName |
      | Partner Technical Administrator | Leader | Test123                    |

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
      | User                            | Email                           | Role       | Health System    | RemovePrograms | Locations                              |
      | Partner Technical Administrator | qaautomation@remedypartners.com | Physicians | Sound Physicians | BPCI Model 2   | 6005-059--Adventist Health Bakersfield |

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
      | Description                                           | User                            | FirstName  | LastName   | Email                           | Phone      | Role       | NPI        | ValidationMsg                     |  |
      | Verify validation message for blank First name        | Partner Technical Administrator |            | Last Name  | qaautomation@remedypartners.com | 9874563210 | Physicians |            | First Name is required            |  |
      | Verify validation message for blank Last name         | Partner Technical Administrator | First Name |            | qaautomation@remedypartners.com | 9874563210 | Physicians |            | Last Name is required             |  |
      | Verify validation message for blank NPI               | Partner Technical Administrator | First Name | Last Name  | qaautomation@remedypartners.com | 9874563210 | Physicians |            | NPI is required                   |  |
      | Verify validation message for invalid Phone           | Partner Technical Administrator | First Name | Last Name  | qaautomation@remedypartners.com |     123564 | Physicians | NPI        | Please enter a valid phone number |  |
      | Verify validation message for NPI less than 10 digits | Partner Technical Administrator | First Name | Last Name  | qaautomation@remedypartners.com | 9874563210 | Physicians |     123564 | Please enter a valid NPI          |  |
      | Verify validation message for NPI as alphabets        | Partner Technical Administrator | First Name | Last Name  | qaautomation@remedypartners.com | 9874563210 | Physicians | abcdefgihj | Please enter a valid NPI          |  |
      | Verify validation message for NPI as alphanumeric     | Partner Technical Administrator | First Name | Last Name  | qaautomation@remedypartners.com | 9874563210 | Physicians | abcde12345 | Please enter a valid NPI          |  |
      | Verify validation message for invalid First Name      | Partner Technical Administrator | 847&827919 | Last Name  | qaautomation@remedypartners.com | 9874563210 | Physicians | NPI        | Please enter a valid name         |  |
      | Verify validation message for invalid Last name       | Partner Technical Administrator | First Name | 847382&919 | qaautomation@remedypartners.com | 9874563210 | Physicians | NPI        | Please enter a valid name         |  |
      | Verify validation message for NPI as .                | Partner Technical Administrator | First Name | Last Name  | qaautomation@remedypartners.com | 9874563210 | Physicians | .........1 | Please enter a valid NPI          |  |

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
      | User                            | Role       | Locations                              | SelectedLocations            | facilityKey |
      | Partner Technical Administrator | Physicians | 3090-069--Penobscot Bay Medical Center | Penobscot Bay Medical Center |      200063 |

  Scenario Outline: Editing any role to Physicians (without saving) and back to same role/other role
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I click on Back button
    Then I verify the header "General Information"
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role2>
    Then I enter NPI field with "<NPI>" for role "<Role2>"
    Then I click on Next button
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<PreviousRole>-<Role2>"
    Then I verify role "<Role2>"

    Examples: 
      | User                            | UserName                               | Password | Email                           | NPI | PreviousRole | Role       | Role2             |
      | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com | NPI | Manager      | Physicians | Advanced Operator |

  Scenario Outline: Changing role from physician to Manager then back to Physicians
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<PreviousRole>-<Role>"
    Then I verify role "<Role>"
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <PreviousRole>
    Then I enter NPI field with "<NPI>" for role "<PreviousRole>"
    Then I click on Next button
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<PreviousRole>-<Role>"
    Then I verify role "<PreviousRole>"

    Examples: 
      | User                            | Email                           | NPI | PreviousRole | Role    |
      | Partner Technical Administrator | qaautomation@remedypartners.com | NPI | Physicians   | Manager |

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
      | User                            | FirstName | LastName                                 | Email                           | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                     | LearningPathways                                       | Locations                                       | expStatusCode |
      | Super Admin                     | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,admin-Administration,lessons-Lessons | HZhmTBQzHtU1,NFdw0Kts2C01                              | 439108--2070-a55--390168, 439108--CJR-1--390168 |           200 |
      | Partner Technical Administrator | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Manager                         | 2-Manager                          | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,lessons-Lessons                      | p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81, n9yn5n0Qa581 | 439108--2070-a55--390168, 439108--CJR-1--390168 |           200 |

  Scenario Outline: Validating that "All Locations" checkbox is checked after selecting all the locations under an organization
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
    Then I deselect "<RemovePrograms>" programs
    Then I verify that All Locations checkbox is checked

    Examples: 
      | User                            | Role    | RemovePrograms |
      | Partner Technical Administrator | Manager | BPCI Model 2   |

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
    Then I select "Applications" tab
    Then I verify the header "Applications"
    Then I unselect "<RemoveApplications>" product
    Then I select "Permissions" tab
    Then I deselect "<RemovePrograms>" programs
    Then I select "<AddPrograms>" programs for existing organisation
    Then I deselect "<RemoveLocations>" locations for PTA user
    Then I select "<AddLocations>" locations for PTA user
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify health system "<HealthSystemValidation>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"
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
      | Description                     | User                            | Role    | Email                           | Applications                                        | ApplicationsNotVisible                              | RemoveApplications                              | RemovePrograms | AddPrograms | RemoveLocations | AddLocations  | Facilities               | LearningPathway                                                                                                                                  | FirstName | LastName                                 | Roletext | ReportCategory | ReportName         | HealthSystemValidation   | ProgramsValidation                                                    | LocationsValidation                                                                                                     |
      | Edit single to multiple program | Partner Technical Administrator | Manager | qaautomation@remedypartners.com | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration | Episode Connect Classic,Episode Connect Classic |                |             |                 | All Locations | Butler Memorial Hospital | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_PRM | Patient ID     | Episode DRG Issues | Butler Memorial Hospital | Butler Memorial Hospital--BPCI Model 2, Butler Memorial Hospital--CJR | Butler Memorial Hospital--2070-a55--Butler Memorial Hospital, Butler Memorial Hospital--CJR-1--Butler Memorial Hospital |
      | Edit multiple to single program | Partner Technical Administrator | Manager | qaautomation@remedypartners.com | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration | Episode Connect Classic,Episode Connect Classic | BPCI Model 2   |             |                 |               | Butler Memorial Hospital | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_PRM | Patient ID     | Episode DRG Issues | Butler Memorial Hospital | Butler Memorial Hospital--CJR                                         | Butler Memorial Hospital--CJR-1--Butler Memorial Hospital                                                               |
