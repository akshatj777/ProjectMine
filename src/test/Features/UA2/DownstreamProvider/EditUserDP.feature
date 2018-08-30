Feature: Edit page for Downstream provider

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
      | User        | FirstName | LastName | Email                           | Phone | NPI | Role       | RoleID       | Applications                                                                                                                                                                                          | LearningPathways                                                 | Locations                                       | expStatusCode |
      | Super Admin | FirstName | LastName | qaautomation@remedypartners.com |       |     | Remedy TCS | 5-Remedy TCS | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,lessons-Lessons,episode_connect_2-Episode Connect for Post-acute Care,Care Innovation Institute-Care Innovation Institute | NFdw0Kts2C01,jusUV22erpk1,p11D0Vl2FSg1,18h7phZr1h81,n9yn5n0Qa581 | 514083--2070-015--TSH, 441369--3056-m03--365402 |           200 |

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
    Then I verify text "Which location(s) does this user have access to?" is present for "<Role>"
    Then I click on existing organisation "<Click DPHealthSystem>"
    Then I deselect "<RemoveDPLocations>" locations for Downstream Provider role
    Then I select "<DPLocations>" locations for Downstream Provider role
    Then I click on Submit button while edit for "<User>-<PreviousRole>-<Role>"
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
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
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #Then I click on Hamburger menu on top left of homepage
    #And I verify "<ApplicationsVisible>" in product menu dropdown
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
    And I click on the top user account link
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We've just sent you an email to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | Description                                                                 | User        | Email                           | NPI | Phone      | PreviousRole        | Role                | ApplicationsUnchecked                               | ApplicationsChecked                                          | EnableApplications                                           | DisableApplications     | Applications                                                 | ApplicationsNotVisible                                              | RemoveLearningPathwaySearchParameter | LearningPathwayID | AddLearningPathwaySearchParameter | LearningPathwaySearchParameter         | Roletext | ReportCategory | ReportName         | BPID | LearningPathway                        | FirstName                                 | LastName                                 | Facilities                                                                                                                          | Click DPHealthSystem | RemoveDPLocations                                       | DPLocations                                      | RemoveHealthSystem | RemoveLocations | ClickHealthSystem | Health System | Programs    | Locations                   | HealthSystemsValidation            | ProgramsValidation                                          | LocationsValidation                                                                                                                                                                                                                      | HasHealthSystem2 | Health System2 | Programs2   | Locations2                                 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Change Role to DP and Edit details                                          | Super Admin | qaautomation@remedypartners.com |     |            | Remedy TCS          | Downstream Provider |                                                     | Episode Connect Classic, Episode Connect for Post-acute Care | Episode Connect Classic, Episode Connect for Post-acute Care |                         | Episode Connect Classic, Episode Connect for Post-acute Care | Administration, Reporting Classic, Lessons                          |                                      |                   |                                   |                                        | ROLE_SNF | Patient ID     | Episode DRG Issues |      |                                        | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Abbeville General Hospital, Litchford Falls Nursing & Rehabilitation Center, Coosa valley health care, Alaris Health at Jersey City |                      |                                                         | 190034, 345454, Coosa Valley Health Care, 020653 |                    |                 |                   |               |             |                             | Healthsystem - Downstream Provider | Healthsystem - Downstream Provider--Downstream Organization | Healthsystem - Downstream Provider--DOWN-ORG--190034, Healthsystem - Downstream Provider--DOWN-ORG--345454, Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653 |                  |                |             |                                            |                  |                |           |            |
      | Edit downstream provider general details, applications and data permissions | Super Admin | qaautomation@remedypartners.com |     | 9963852451 |                     | Downstream Provider |                                                     | Episode Connect Classic, Episode Connect for Post-acute Care | Episode Connect Classic, Episode Connect for Post-acute Care | Episode Connect Classic | Episode Connect for Post-acute Care                          | Administration, Reporting Classic, Lessons, Episode Connect Classic |                                      |                   |                                   |                                        | ROLE_SNF | Patient ID     | Episode DRG Issues |      |                                        | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Coosa valley health care, Alaris Health at Jersey City                                                                              |                      | 190034, Litchford Falls Nursing & Rehabilitation Center |                                                  |                    |                 |                   |               |             |                             | Healthsystem - Downstream Provider | Healthsystem - Downstream Provider--Downstream Organization | Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653                                                                                                             |                  |                |             |                                            |                  |                |           |            |
      | Change role from DP to Executive                                            | Super Admin | qaautomation@remedypartners.com |     | 9963852451 | Downstream Provider | Leader              | Episode Connect Classic, Reporting Classic, Lessons |                                                              | Episode Connect Classic, Reporting Classic, Lessons          |                         | Episode Connect Classic, Reporting Classic, Lessons          | Administration, Episode Post Acute                                  |                                      |                   |                                   | i am learning path, Learning Pathway 2 | ROLE_PRM | Patient ID     | Episode DRG Issues |      | i am learning path, Learning Pathway 2 | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Apple - Watertown, PENN PRESBYTERIAN MEDICAL CENTER                                                                                 |                      |                                                         |                                                  |                    |                 |                   | Apple Rehab   | BPCI-Model3 | 3056-i11--Apple - Watertown | Penn,  Apple Rehab                 | Apple Rehab--BPCI Model 3, Penn--BPCI Model 2               | Apple Rehab--3056-i11--Apple - Watertown, Penn--2070-021--PENN PRESBYTERIAN MEDICAL CENTER                                                                                                                                               | Yes              | Penn           | BPCI-Model2 | 2070-021--PENN PRESBYTERIAN MEDICAL CENTER |                  |                |           |            |
