Feature: Edit user page for PTA

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
      | User                            | FirstName                                 | LastName                                 | Email                           | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                     | LearningPathways                                    | Locations                                                                                                                                                                                                                                                                                                              | expStatusCode |
      | Super Admin                     | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episodes,reports-Reports,physician_portal-Physician Connect,admin-Administration,lessons-Lessons | 5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1              | 441355--ALL_BPIDS--ALL_FACILITIES                                                                                                                                                                                                                                                                                      |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 |     | Executive                       | 1-Executive                        | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                         | 5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1              | 441355--3056-804--COVC0023, 441355--3056-805--055519, 441355--3056-806--055761                                                                                                                                                                                                                                         |           200 |
      | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Manager                         | 2-Manager                          | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                         | p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 | 441355--3056-808--555164                                                                                                                                                                                                                                                                                               |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | qaautomation@remedypartners.com |            |     | Case Manager                    | 3-Case Manager                     | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                         | 5HDc3E6aK_E1                                        | 441355--3056-809--055922, 441355--3056-810--555442, 441355--3056-811--555394, 441355--3056-812--055797, 441355--3056-813--165218, 441355--3056-814--145571, 441355--3056-815--165559, 441355--3056-816--145769, 441355--3056-817--155446, 441355--3056-818--155295, 441355--3056-819--365489, 441355--3056-820--365488 |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 | NPI | Physicians                      | 4-Physicians                       | episode_connect-Episodes,reports-Reports,lessons-Lessons,physician_portal-Physician Connect                      | p11D0Vl2FSg1,qfy2xp8zSFc1                           | 441355--3056-i37--056048, 441355--3056-i38--145783, 441355--3056-i39--155298, 441355--3056-i40--145862, 441355--3056-i41--155649                                                                                                                                                                                       |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedypartners.com | 9988776655 |     | Transitional Case Manager       | 22-Transitional Case Manager       | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                         | 5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81 | 441355--3056-i42--055646, 441355--3056-i43--146048, 441355--3056-i44--365786, 441355--3056-i45--145508                                                                                                                                                                                                                 |           200 |

  Scenario Outline: Change General information and edit apps
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
    Then I verify the availability of fields "First Name"
    And I fill in First Name with "<FirstName>"
    Then I verify the availability of fields "Last Name"
    Then I fill in Last Name with <LastName>
    Then I verify the availability of fields "Email"
    And I should not be able to edit Email
    Then I verify the availability of fields "Phone"
    And I fill in Phone with <Phone>
    Then I verify the availability of fields "Role"
    Then I verify the availability of field NPI for "<Role>"
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I unselect "<RemoveApplications>" product
    Then I click on learning pathway dropdown
    Then I enter "<RemoveLearningPathwaySearchParameter>" in Learning Pathway search box
    Then I remove "<RemoveLearningPathwaySearchParameter>" from the results
    Then I verify that Learning Pathway ID "<LearningPathwayID>" is not displayed for the enabled Learning Pathway
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify disabled "<RemoveApplications>"
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
      | User                            | FirstName        | LastName        | Email                           | Phone        | NPI | Role       | RemoveApplications | Applications      | ApplicationsNotVisible                | LearningPathwayID | RemoveLearningPathwaySearchParameter  | Roletext       | ReportCategory | ReportName                   | BPID | Facilities                                                                                                                                                       | LearningPathway                                 |
      | Partner Technical Administrator | FirstName'Edited | LastName'Edited | qaautomation@remedypartners.com | 996-385-2451 | NPI | Physicians | Reports            | Episodes, Lessons | Reports, Episodes 2.0, Administration | p11D0Vl2FSg1      | Executive Acute Care Hospital Model 2 | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues [Model 3] |      | Pacific Coast Manor, Sunrise Skilled Nursing & Rehabilitation Center, Pyramid Point Post-Acute Rehabilitation Center, Hilltop Skilled Nursing, McCormick's Creek | Clinical Operations Acute Care Hospital Model 2 |

  Scenario: Verify NPI on the EC1 tile
    Given I am on the login page
    When I enter email field qa.admin@yopmail.com for login
    And I enter password field Episode1! for Login
    And I click Access button
    And I click on Episode1 tile for "Partner Technical Administrator-Physicians" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "Partner Technical Administrator-Physicians" user
    And I verify NPI on ECI for "Partner Technical Administrator-Physicians" user

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
      | User                            | Role      |
      | Partner Technical Administrator | Executive |

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
    Then I click on learning pathway dropdown
    Then I verify Learning Pathway search box is available
    Then I enter "<LearningPathwayName>" in Learning Pathway search box
    And I verify No results found under Learning Pathway search box

    Examples: 
      | User                            | Role      | LearningPathwayName |
      | Partner Technical Administrator | Executive | Test123             |

  Scenario Outline: Verify applications on changing role
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
    Then I verify the header "General Information"
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role1>
    Then I enter NPI field with "<NPI>" for role "<Role1>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<ApplicationsUnchecked1>" are unchecked
    Then I verify applications "<ApplicationsChecked1>" are checked
    Then I click on "General Information" tab on the left
    Then I verify the header "General Information"
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role2>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<ApplicationsChecked2>" are checked

    Examples: 
      | User                            | PreviousRole | Role1      | NPI | ApplicationsChecked1       | ApplicationsUnchecked1 | Role2   | ApplicationsChecked2       | ApplicationsUnchecked2 |
      | Partner Technical Administrator | Executive    | Physicians | NPI | Reports, Episodes, Lessons | Physician Connect      | Manager | Reports, Episodes, Lessons |                        |

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

  Scenario Outline: Edit locations -<Description>
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
    Then I select "<EnableApplications>" product
    Then I select "Permissions" tab
    When I deselect "<RemoveLocations>" locations for PTA user
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
      | Description                            | User                            | FirstName                                 | LastName                                 | Email                           | Phone | NPI | Role                      | EnableApplications | Applications               | ApplicationsNotVisible                          | Health System | Programs    | RemoveLocations                                                             | AddLocations                                                                     | Locations                                                                                                        | Roletext | ReportCategory | ReportName                   | BPID | Facilities                                                                         | HealthSystemValidation | ProgramsValidation     | LocationsValidation                                                                                                                            | LearningPathway                                                                                                                                           |
      | Multiple locations to single locations | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedypartners.com |       |     | Transitional Case Manager | Episodes, Episodes | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician connect | Covenant      | BPCI-Model3 | 3056-i42--Palo Alto Sub, 3056-i43--Meadow Manor, 3056-i44--Villa Georgetown |                                                                                  | 3056-i45--Highland Health                                                                                        | ROLE_TCS | Patient ID     | Episode DRG Issues [Model 3] |      | Highland Health                                                                    | Covenant               | Covenant--BPCI Model 3 | Covenant--3056-i45--Highland Health                                                                                                            | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 |
      | Single locations to multi locations    | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |       |     | Manager                   | Episodes, Episodes | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician connect | Covenant      | BPCI-Model3 |                                                                             | 3056-809--Courtyard Health Care Center, 3056-810--Emerald Gardens Nursing Center | 3056-809--Courtyard Health Care Center, 3056-810--Emerald Gardens Nursing Center, 3056-808--Arbor Nursing Center | ROLE_PRM | Patient ID     | Episode DRG Issues [Model 3] |      | Arbor Nursing Center, Courtyard Health Care Center, Emerald Gardens Nursing Center | Covenant               | Covenant--BPCI Model 3 | Covenant--3056-809--Courtyard Health Care Center, Covenant--3056-810--Emerald Gardens Nursing Center, Covenant--3056-808--Arbor Nursing Center | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University          |

  Scenario Outline: Changing General information, Role from <PreviousRole> to <Role> and Edit apps and permissions
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
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I fill in Phone with <Phone>
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I unselect all selected applications
    Then I verify that Next button is "disabled"
    Then I select "<EnableApplications>" product
    Then I verify "<LearningPathway>" while editing the user
    Then I verify that Next button is "enabled"
    Then I click on Next button
    Then I select "<invalidLocations>" invalid locations for PTA
    And I verify No results found for invalid Location for "first" in selected organisation
    When I deselect "<RemoveLocations>" locations for PTA user
    Then I select location by BPID "<AddLocations>" for PTA
    Then I click on Submit button while edit for "<User>-<PreviousRole>-<Role>"
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<EnableApplications>"
    Then I verify health system "<Health System>"
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
      | User                            | FirstName       | LastName       | Email                           | Phone        | NPI | PreviousRole | Role       | EnableApplications                            | Applications                                  | ApplicationsNotVisible       | Health System | Programs    | invalidLocations | RemoveLocations                                                                                                             | AddLocations                   | LearningPathwaySearchParameter | Roletext       | ReportCategory | ReportName                   | BPID | Facilities           | ProgramsValidation     | LocationsValidation                      | LearningPathway                                                                                                    |
      | Partner Technical Administrator | FirstNameEdited | LastNameEdited | qaautomation@remedypartners.com | 996-385-2451 | NPI | Executive    | Physicians | Episodes, Reports, Lessons, Physician Connect | Episodes, Reports, Lessons, Physician Connect | Episodes 2.0, Administration | Covenant      | BPCI-Model3 | hkfj             | 3056-804--Catered Manor Nursing Center, 3056-805--Downey Care Center, 3056-806--Encinitas Nursing And Rehabilitation Center | 3056-808--Arbor Nursing Center |                                | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues [Model 3] |      | Arbor Nursing Center | Covenant--BPCI Model 3 | Covenant--3056-808--Arbor Nursing Center | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2 |

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
    Then I verify facility key "<facilityKey>" is not displayed with location name "Courtyard Health Care Center"
    And I click on remove link icon for selected Locations on selected Locations section
    And I verify Selected Locations section after click on remove link icon

    Examples: 
      | User                            | Role         | Locations                              | SelectedLocations            | facilityKey |
      | Partner Technical Administrator | Case Manager | 3056-809--Courtyard Health Care Center | Courtyard Health Care Center |      055922 |

  Scenario Outline: Validating Learning Pathway ID on edit role and reload the page again
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
    Then I verify learning pathway "<LearningPathway>"
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify "<LearningPathway>" while editing the user
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    And I verify that I am navigated to user page
    Then I verify learning pathway "<LearningPathway>"
    Then I refresh the page
    And I verify that I am navigated to user page
    Then I verify learning pathway "<LearningPathway>"
    Then I refresh the page
    And I verify that I am navigated to user page
    Then I verify learning pathway "<LearningPathway>"

    Examples: 
      | User                            | PreviousRole | Role                      | NPI | LearningPathway            |
      | Partner Technical Administrator | Case Manager | Transitional Case Manager |     | Care Coordination External |

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
    Then I click on Submit button while edit for "<User>-<Role2>--<PreviousRole>"
    Then I verify role "<Role2>"

    Examples: 
      | User                            | UserName                               | Password | Email                           | NPI | PreviousRole              | Role       | Role2        |
      | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com | NPI | Transitional Case Manager | Physicians | Case Manager |

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
    Then I enter NPI field with "<NPI1>" for role "<Role>"
    Then I click on Next button
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<PreviousRole>-<Role>"
    Then I verify role "<Role>"
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <PreviousRole>
    Then I enter NPI field with "<NPI2>" for role "<PreviousRole>"
    Then I click on Next button
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<PreviousRole>-<Role>"
    Then I verify role "<PreviousRole>"

    Examples: 
      | User                            | Email                           | NPI1 | NPI2 | PreviousRole | Role    | EnableApplications | Applications                                                     | ApplicationsNotVisible       | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName                   | BPID | LearningPathway                                                                                                                       | FirstName | LastName | Facilities        |
      | Partner Technical Administrator | qaautomation@remedypartners.com |      | NPI  | Physicians   | Manager |                    | Episodes, Reports, Physician Connect, Lessons, Physician Connect | Administration, Episodes 2.0 |                                | ROLE_PRM | Patient ID     | Episode DRG Issues [Model 3] |      | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | FirstName | LastName | Apple - Watertown |

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

  Scenario Outline: Edit locations -<Description>
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
    Then I select "<EnableApplications>" product
    Then I select "Permissions" tab
    When I deselect "<RemoveLocations>" locations for PTA user
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
      | Description                         | User                            | FirstName | LastName                                 | Email                           | Phone | NPI | Role    | EnableApplications | Applications               | ApplicationsNotVisible                          | Health System    | Programs    | RemoveLocations                          | AddLocations                             | Roletext | ReportCategory | ReportName         | BPID | Facilities                                                   | HealthSystemValidation | ProgramsValidation             | LocationsValidation                                                                                                  | LearningPathway                                                                                                                                  |
      | Single locations to multi locations | Partner Technical Administrator | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |       |     | Manager | Episodes, Episodes | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician connect | Sound Physicians | BPCI-Model2 |                                          | 6005-059--Adventist Bolingbrook Hospital | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Adventist Bolingbrook Hospital, Adventist Health Bakersfield | Sound Physicians       | Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--6005-059--Adventist Bolingbrook Hospital | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University |
      | Edit to All locations               | Partner Technical Administrator | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |       |     | Manager | Episodes, Episodes | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician connect | Sound Physicians | BPCI-Model2 |                                          | All Locations                            | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Adventist Bolingbrook Hospital, Adventist Health Bakersfield | Sound Physicians       | Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--6005-059--Adventist Bolingbrook Hospital | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University |
      | All locations to Single locations   | Partner Technical Administrator | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |       |     | Manager | Episodes, Episodes | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician connect | Sound Physicians | BPCI-Model2 | 6005-059--Adventist Bolingbrook Hospital |                                          | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Adventist Health Bakersfield                                 | Sound Physicians       | Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Adventist Health Bakersfield                                                             | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University |

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
      | Description                     | User                            | Role    | Email                           | Applications               | ApplicationsNotVisible                          | RemoveApplications | RemovePrograms | AddPrograms | RemoveLocations | AddLocations                                                                    | Facilities                                                                                | LearningPathway                                                                                                                                  | FirstName | LastName                                 | Roletext | ReportCategory | ReportName         | HealthSystemValidation | ProgramsValidation                                             | LocationsValidation                                                                                                                                                           |
      | Edit single to multiple program | Partner Technical Administrator | Manager | qaautomation@remedypartners.com | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect | Episodes,Episodes  |                | BPCI-Model3 |                 | 3090-069--Penobscot Bay Medical Center, 3090-079--Aiken Regional Medical Center | Adventist Health Bakersfield, Penobscot Bay Medical Center, Aiken Regional Medical Center | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_PRM | Patient ID     | Episode DRG Issues | Sound Physicians       | Sound Physicians--BPCI Model 3, Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--3090-069--Penobscot Bay Medical Center, Sound Physicians--3090-079--Aiken Regional Medical Center |

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
    Then I verify No results found for invalid Location for "first" organisation

    Examples: 
      | User                            | Email                           | Role    | Health System    | RemovePrograms | Locations                              |
      | Partner Technical Administrator | qaautomation@remedypartners.com | Manager | Sound Physicians | BPCI-Model2    | 6005-059--Adventist Health Bakersfield |

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
    And I verify that "<RemovePrograms>" is not reflected as selected in edit user page
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify health system "<HealthSystemValidation>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify Program "<RemoveProgramsValidation>" is not present in view user page
    Then I verify location "<RemovedLocationsValidation>" is not present on view page
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
    And I switch back to old window
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
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
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I redirect to Remedy connect page
    #And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    #And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
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
      | Description                                                                       | User                            | Role    | Email                           | Applications               | ApplicationsNotVisible                          | RemoveApplications | RemovePrograms | AddPrograms | RemoveLocations | AddLocations  | Facilities                                                                                        | LearningPathway                                                                                                                                  | FirstName | LastName                                 | Roletext | ReportCategory | ReportName                   | HealthSystemValidation | ProgramsValidation             | RemoveProgramsValidation       | LocationsValidation                                                                                                                                                                   | RemovedLocationsValidation                                                                                          |
      | Edit multiple to single program                                                   | Partner Technical Administrator | Manager | qaautomation@remedypartners.com | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect | Episodes,Episodes  | BPCI-Model3    |             |                 |               | Adventist Health Bakersfield                                                                      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_PRM | Patient ID     | Episode DRG Issues           | Sound Physicians       | Sound Physicians--BPCI Model 2 | Sound Physicians--BPCI Model 3 | Sound Physicians--6005-059--Adventist Health Bakersfield                                                                                                                              | Sound Physicians--3090-069--Penobscot Bay Medical Center, Sound Physicians--3090-079--Aiken Regional Medical Center |
      | Remove existing Program(Mod-2) and select another Program and check all locations | Partner Technical Administrator | Manager | qaautomation@remedypartners.com | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect | Episodes,Episodes  | BPCI-Model2    | BPCI-Model3 |                 | All Locations | Presence Saint Joseph Medical Center, Penobscot Bay Medical Center, Aiken Regional Medical Center | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_PRM | Patient ID     | Episode DRG Issues [Model 3] | Sound Physicians       | Sound Physicians--BPCI Model 3 |                                | Sound Physicians--3090-066--Presence Saint Joseph Medical Center, Sound Physicians--3090-069--Penobscot Bay Medical Center, Sound Physicians--3090-079--Aiken Regional Medical Center |                                                                                                                     |
      | Remove existing Program(Mod-3) and select another Program and check all locations | Partner Technical Administrator | Manager | qaautomation@remedypartners.com | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect | Episodes,Episodes  | BPCI-Model3    | BPCI-Model2 |                 | All Locations | Adventist Health Bakersfield, Adventist Bolingbrook Hospital                                      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_PRM | Patient ID     | Episode DRG Issues           | Sound Physicians       | Sound Physicians--BPCI Model 2 |                                | Sound Physicians--6005-059--Adventist Health Bakersfield, Sound Physicians--6005-059--Adventist Bolingbrook Hospital                                                                  |                                                                                                                     |

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
    Then I deselect "<Locations>" locations for PTA user
    And I verify selected Location "<SelectedLocations>" are not shown in selected Locations section
    Then I select "<EnableLocations>" locations for PTA user
    Then I verify that pagination is not displayed for selected locations

    Examples: 
      | User                            | Role    | Locations     | SelectedLocations              | EnableLocations                        |
      | Partner Technical Administrator | Manager | All Locations | Adventist Bolingbrook Hospital | 6005-059--Adventist Health Bakersfield |

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
      | Super Admin                     | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episodes,reports-Reports,physician_portal-Physician Connect,admin-Administration,lessons-Lessons | HZhmTBQzHtU1,NFdw0Kts2C01                              | 439108--2070-a55--390168, 439108--CJR-1--390168 |           200 |
      | Partner Technical Administrator | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Manager                         | 2-Manager                          | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                         | p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81, n9yn5n0Qa581 | 439108--2070-a55--390168, 439108--CJR-1--390168 |           200 |

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
      | Partner Technical Administrator | Manager | BPCI-Model2    |

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
      | Description                     | User                            | Role    | Email                           | Applications               | ApplicationsNotVisible                          | RemoveApplications | RemovePrograms | AddPrograms | RemoveLocations | AddLocations  | Facilities               | LearningPathway                                                                                                                                  | FirstName | LastName                                 | Roletext | ReportCategory | ReportName         | HealthSystemValidation   | ProgramsValidation                                                         | LocationsValidation                                                                                                     |
      | Edit single to multiple program | Partner Technical Administrator | Manager | qaautomation@remedypartners.com | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect | Episodes,Episodes  |                |             |                 | All Locations | Butler Memorial Hospital | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_PRM | Patient ID     | Episode DRG Issues | Butler Memorial Hospital | Butler Memorial Hospital--BPCI Model 2, Butler Memorial Hospital--BPCI-CJR | Butler Memorial Hospital--2070-a55--Butler Memorial Hospital, Butler Memorial Hospital--CJR-1--Butler Memorial Hospital |
      | Edit multiple to single program | Partner Technical Administrator | Manager | qaautomation@remedypartners.com | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect | Episodes,Episodes  | BPCI-Model2    |             |                 |               | Butler Memorial Hospital | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_PRM | Patient ID     | Episode DRG Issues | Butler Memorial Hospital | Butler Memorial Hospital--BPCI-CJR                                         | Butler Memorial Hospital--CJR-1--Butler Memorial Hospital                                                               |
