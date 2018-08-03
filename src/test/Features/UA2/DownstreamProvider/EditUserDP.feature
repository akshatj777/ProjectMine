Feature: Edit page for Downstream provider

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
    Then I click on existing organisation "<ClickHealthSystem>"
    Then I deselect "<RemoveLocations>" locations
    Then I remove health system "<RemoveHealthSystem>"
    Then I click Add Model3 Organization button for "<DPHasHealthSystem1>" flag for Downstream Provider role
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
      | Description                                                                 | User        | Email                           | NPI | Phone      | PreviousRole        | Role                | ApplicationsUnchecked      | ApplicationsChecked    | EnableApplications         | DisableApplications | Applications               | ApplicationsNotVisible                                        | RemoveLearningPathwaySearchParameter | LearningPathwayID | AddLearningPathwaySearchParameter | LearningPathwaySearchParameter         | Roletext | ReportCategory | ReportName                   | BPID | LearningPathway                                          | FirstName                                 | LastName                                 | Facilities                                                                                                                                                                                                                         | Click DPHealthSystem | RemoveDPLocations                                          | DPLocations                                                                                  | RemoveHealthSystem | RemoveLocations                                                      | ClickHealthSystem | DPHasHealthSystem1 | Health System | Programs    | Locations                                                                        | HealthSystemsValidation                         | ProgramsValidation                                                                     | LocationsValidation                                                                                                                                                                                                                                                                                                                                                                                                                                                        | HasHealthSystem2 | Health System2 | Programs2   | Locations2                                   | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Change Role to DP and Edit details                                          | Super Admin | qaautomation@remedypartners.com |     |            | Remedy TCS          | Downstream Provider |                            | Episodes, Episodes 2.0 | Episodes, Episodes 2.0     |                     | Episodes, Episodes 2.0     | Administration, Physician Connect, Reports, Lessons           | i am learning path                   |                   | HZhmTBQzHtU1                      |                                        | ROLE_SNF | Patient ID     | Episode DRG Issues [Model 3] |      | Learning Pathway 2, Remedy University, New learning Path | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Catered Manor Nursing Center, Downey Care Center, woodruff Community Hospital, Litchford Falls Nursing & Rehabilitation Center, 5 Star Home Care Llc, 3 Angels Home Health, Coosa valley health care, Alaris Health at Jersey City |                      |                                                            | 555469, 345454, 5 Star Home Care Llc, 3 Angels Home Health, Coosa Valley Health Care, 020653 |                    |                                                                      |                   | Yes                | Covenant      |             | 3056-804--COVC0023, 3056-805--Downey Care Center                                 | Healthsystem - Downstream Provider, Covenant    | Covenant--BPCI Model 3, Healthsystem - Downstream Provider--Downstream Organization    | Covenant--3056-804--Catered Manor Nursing Center, Covenant--3056-805--Downey Care Center, Healthsystem - Downstream Provider--DOWN-ORG--555469, Healthsystem - Downstream Provider--DOWN-ORG--345454, Healthsystem - Downstream Provider--DOWN-ORG--5 Star Home Care Llc, Healthsystem - Downstream Provider--DOWN-ORG--3 Angels Home Health, Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653 |                  |                |             |                                              |                  |                |           |            |
      | Edit downstream provider general details, applications and data permissions | Super Admin | qaautomation@remedypartners.com |     | 9963852451 |                     | Downstream Provider |                            | Episodes, Episodes 2.0 | Episodes, Episodes 2.0     | Episodes            | Episodes 2.0               | Administration, Physician Connect, Reports, Lessons, Episodes |                                      |                   |                                   |                                        | ROLE_SNF | Patient ID     | Episode DRG Issues [Model 3] |      | Learning Pathway 2, Remedy University, New learning Path | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Courtyard Health Care Center, Emerald Gardens Nursing Center, Coosa valley health care, Alaris Health at Jersey City                                                                                                               | Downstream Provider  | 555469, 345454, 5 Star Home Care Llc, 3 Angels Home Health |                                                                                              |                    | 3056-804--Catered Manor Nursing Center, 3056-805--Downey Care Center | Covenant          |                    |               |             | 3056-809--Courtyard Health Care Center, 3056-810--Emerald Gardens Nursing Center | Healthsystem - Downstream Provider, Covenant    | Covenant--BPCI Model 3, Healthsystem - Downstream Provider--Downstream Organization    | Covenant--3056-809--Courtyard Health Care Center, Covenant--3056-810--Emerald Gardens Nursing Center, Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653                                                                                                                                                                                                                                         |                  |                |             |                                              |                  |                |           |            |
      | Remove exiting health System and new org                                    | Super Admin | qaautomation@remedypartners.com |     | 9963852451 |                     | Downstream Provider |                            | Episodes 2.0           | Episodes, Episodes 2.0     | Episodes            | Episodes 2.0               | Administration, Physician Connect, Reports, Lessons, Episodes |                                      |                   |                                   |                                        | ROLE_SNF | Patient ID     | Episode DRG Issues [Model 3] |      | Learning Pathway 2, Remedy University, New learning Path | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Apple - Watertown, Coosa valley health care, Alaris Health at Jersey City                                                                                                                                                          |                      |                                                            |                                                                                              | Covenant           |                                                                      |                   | Yes                | Apple Rehab   |             | 3056-i11--Apple - Watertown                                                      | Healthsystem - Downstream Provider, Apple Rehab | Apple Rehab--BPCI Model 3, Healthsystem - Downstream Provider--Downstream Organization | Apple Rehab--3056-i11--Apple - Watertown, Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653                                                                                                                                                                                                                                                                                                     |                  |                |             |                                              |                  |                |           |            |
      | Change role from DP to Executive                                            | Super Admin | qaautomation@remedypartners.com |     | 9963852451 | Downstream Provider | Executive           | Episodes, Reports, Lessons |                        | Episodes, Reports, Lessons |                     | Episodes, Reports, Lessons | Administration, Physician Connect, Episodes 2.0               |                                      |                   |                                   | i am learning path, Learning Pathway 2 | ROLE_PRM | Patient ID     | Episode DRG Issues [Model 3] |      | i am learning path, Learning Pathway 2                   | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Apple - Watertown, Upenn - Penn Presbyterian Hospital                                                                                                                                                                              |                      |                                                            |                                                                                              |                    |                                                                      |                   |                    | Apple Rehab   | BPCI-Model3 | 3056-i11--Apple - Watertown                                                      | Penn,  Apple Rehab                              | Apple Rehab--BPCI Model 3, Penn--BPCI Model 2                                          | Apple Rehab--3056-i11--Apple - Watertown, Penn--2070-021--Upenn - Penn Presbyterian Hospital                                                                                                                                                                                                                                                                                                                                                                               | Yes              | Penn           | BPCI-Model2 | 2070-021--Upenn - Penn Presbyterian Hospital | Yes              |                |           |            |
