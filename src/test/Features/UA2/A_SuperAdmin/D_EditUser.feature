Feature: Edit user page for SA

  Scenario Outline: Verifying editable/non-editable fields of general information tab and editing them
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
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
    Then I select "<Applications>" product
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
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget

    Examples: 
      | User        | Role       | FirstName        | LastName        | Email             | Phone        | NPI | RemoveLearningPathwaySearchParameter | LearningPathwayID | Applications       |
      | Super Admin | Physicians | FirstName'Edited | LastName'Edited | test.automatemail | 996-385-2451 | NPI | i am learning path, 18h7phZr1h81     | n9yn5n0Qa581      | Episodes, Episodes |

  Scenario: Verify NPI on the EC1 tile
    Given I am on the login page
    When I enter email field qa.admin@yopmail.com for login
    And I enter password field Episode1! for Login
    And I click Access button
    And I click on Episode1 tile for "Super Admin-Physicians" user
    And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "Super Admin-Physicians" user
    And I verify NPI on ECI for "Super Admin-Physicians" user

  Scenario Outline: Editing user role from <PreviousRole> to <Role>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I enter "<LearningPathwaySearchParameter>" in Learning Pathway search box
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    Then I verify role "<Role>"
    Then I verify enabled "<Applications>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<ApplicationsVisible>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    Then I click on Hamburger menu on top left of homepage
    And I verify "<ApplicationsVisible>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    And I switch to new window
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
    #And I click on Institute tile for "<User>-<Role>" user
    #And I switch to new window
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I switch back to old window
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
      | User        | UserName                               | Password | Email             | NPI | PreviousRole | Role                          | EnableApplications | Applications                                                     | ApplicationsVisible        | ApplicationsNotVisible       | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName                   | BPID | LearningPathway                                                                                                                       | FirstName | LastName | Facilities        |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | test.automatemail |     | Manager      | Partner Program Administrator | Physician Connect  | Episodes, Reports, Physician Connect, Lessons, Physician Connect | Episodes, Reports, Lessons | Administration, Episodes 2.0 |                                | ROLE_PRM | Patient ID     | Episode DRG Issues [Model 3] |      | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | FirstName | LastName | Apple - Watertown |

  Scenario Outline: Changing the products and general details for <Role> and verifying product tile
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Applications" tab
    Then I unselect "<DisableApplications>" product
    Then I select "Permissions" tab
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify role "<Role>"
    Then I verify enabled "<Applications>"
    Then I verify disabled "<DisableApplications>"
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
    Then I click on Hamburger menu on top left of homepage
    And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    And I switch to new window
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
    #And I click on Institute tile for "<User>-<Role>" user
    #And I switch to new window
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I switch back to old window
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
      | User        | Role         | Email             | DisableApplications | Applications               | ApplicationsNotVisible                                   | Roletext | ReportCategory | ReportName                   | BPID | LearningPathway                                                                                                                                                                                                                                          | Facilities                                                                                                                                                          | FirstName | LastName |
      | Super Admin | Case Manager | test.automatemail | Reports             | Episodes, TCI, Lessons     | Episodes 2.0, Administration, Physician Connect, Reports | ROLE_TCS | Patient ID     | Episode DRG Issues           |      | i am learning path, Learning Pathway 2, max-test-052417, Care Coordination External                                                                                                                                                                      | Allentown, Bethlehem, Anderson                                                                                                                                      | FirstName | LastName |
      | Super Admin | Remedy RN    | test.automatemail | Reports, Episodes   | Episodes 2.0, TCI, Lessons | Reports, Episodes, Administration, Physician Connect     | ROLE_RN  | Patient ID     | Episode DRG Issues [Model 3] |      | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | North Shore Med Center, Rhea Medical Center, The Medical Center At Franklin, Evanston Hospital, Jackson North Med Center, Warren Memorial Hospital, Herrin Hospital | FirstName | LastName |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I remove health system "<Remove HealthSystem1>"
    And I click on "Remove" button on permissions tab
    Then I remove health system "<Remove HealthSystem2>"
    And I click on "Remove" button on permissions tab
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
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
    Then I click on Hamburger menu on top left of homepage
    And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    And I switch to new window
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
    #And I click on Institute tile for "<User>-<Role>" user
    #And I switch to new window
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I switch back to old window
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
      | Description                          | User        | Role      | Email             | Applications                    | ApplicationsNotVisible                          | Remove HealthSystem1 | Remove HealthSystem2 | Health System    | Programs    | Locations                                                                               | Facilities                                                          | ProgramsValidation             | LocationsValidation                                                                                                         | LearningPathway                                           | FirstName                                 | LastName                                 | Roletext | ReportCategory | ReportName         |
      | Remove Existing org and add new org1 | Super Admin | Executive | test.automatemail | Reports, Episodes, TCI, Lessons | Episodes 2.0, Administration, Physician Connect | Stamford Hospital    | Penn                 | Sound Physicians | BPCI-Model2 | 6005-080--Winchester Medical Center - Rehab Unit, 6005-063--Fairbanks Memorial Hospital | Winchester Medical Center - Rehab Unit, Fairbanks Memorial Hospital | Sound Physicians--BPCI Model 2 | Sound Physicians--6005-080--Winchester Medical Center - Rehab Unit, Sound Physicians--6005-063--Fairbanks Memorial Hospital | i am learning path, Learning Pathway 2, Remedy University | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | ROLE_PRM | Patient ID     | Episode DRG Issues |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Applications" tab
    Then I unselect "<DisableApplications>" product
    Then I select "Permissions" tab
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
    Then I click on Hamburger menu on top left of homepage
    And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    And I switch to new window
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
    #And I click on Institute tile for "<User>-<Role>" user
    #And I switch to new window
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I switch back to old window
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
      | Description       | User        | Role                            | Email             | Applications                                    | AppliationNotVisible            | DisableApplications | Locations2                       | Programs2   | HasHealthSystem2 | Health System2 | HasHealthSystem3 | Health System3    | Programs3   | Locations3                  | Facilities                                                                                                                                                                                                 | HealthSystemValidation                  | ProgramsValidation                                                                | LocationsValidation                                                                                                                                                                                                                                                                                                                                               | LearningPathway                                          | FirstName | LastName                                 | Roletext | ReportName                   | ReportCategory |
      | Add org2 and org3 | Super Admin | Partner Technical Administrator | test.automatemail | Episodes, Reports, Administration, TCI, Lessons | Physician Connect, Episodes 2.0 | Physician Connect   | 2070-g14--North Shore Med Center | BPCI-Model2 | Yes              | TeamHealth     | Yes              | Stamford Hospital | BPCI-Model2 | 2070-015--Stamford Hospital | Stamford Hospital, North Shore Med Center, Catered Manor Nursing Center, Downey Care Center, Encinitas Nursing and Rehabilitation Center,  Carson Nursing and Rehabilitation Center,  Arbor Nursing Center | Covenant, TeamHealth, Stamford Hospital | Stamford Hospital--BPCI Model 2, TeamHealth--BPCI Model 2, Covenant--BPCI Model 3 | Stamford Hospital--2070-015--Stamford Hospital, TeamHealth--2070-g14--North Shore Med Center, Covenant--3056-804--Catered Manor Nursing Center, Covenant--3056-805--Downey Care Center, Covenant--3056-806--Encinitas Nursing And Rehabilitation Center,  Covenant--3056-807--Carson Nursing And Rehabilitation Center,  Covenant--3056-808--Arbor Nursing Center | Learning Pathway 2, New learning Path, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_PRM | Episode DRG Issues [Model 3] | Patient ID     |

  Scenario Outline: Editing locations -<Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Applications" tab
    Then I unselect "<DisableApplications>" product
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System>"
    Then I deselect "<RemoveLocations>" locations
    Then I select "<Locations>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
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
    Then I click on Hamburger menu on top left of homepage
    And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    And I switch to new window
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
    #And I click on Institute tile for "<User>-<Role>" user
    #And I switch to new window
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I switch back to old window
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
      | Description                                | User        | Role       | Email             | Applications                                  | ApplicationsNotVisible                          | DisableApplications | RemoveLocations | Locations                                                  | Programs    | Health System | Facilities                                                                                                                                              | ProgramsValidation                                       | LocationsValidation                                                                                                                                                                                                                                   | LearningPathway                                                                                                                                | FirstName | LastName                                 | Roletext | ReportCategory | ReportName         |
      | Edit single location to multiple locations | Super Admin | Remedy TCS | test.automatemail | Episodes, Reports, TCI, Lessons               | Episodes 2.0, Administration, Physician Connect | Episodes 2.0        |                 | 3056-m04--Altercare Post, 3056-m05--Altercare - Big Rapids | BPCI-Model3 | Altercare     | Altercare Post-Acute Rehab Center, Altercare - Big Rapids, Stamford Hospital, Altercare - Alliance                                                      | Stamford Hospital--BPCI Model 2, Altercare--BPCI Model 3 | Altercare--3056-m04--Altercare Post, Altercare--3056-m05--Altercare - Big Rapids, Stamford Hospital--2070-015--Stamford Hospital, Altercare--3056-m03--Altercare - Alliance                                                                           | Learning Pathway 2, max-test-052417, Clinical Operations Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastName                                 | ROLE_TCS | Patient ID     | Episode DRG Issues |
      | Edit to All Locations                      | Super Admin | Remedy LPN | test.automatemail | Episodes 2.0, Reports, TCI, Lessons           | Episodes, Administration, Physician Connect     | Episodes            |                 | All Locations                                              | BPCI-Model2 | Penn          | UPenn - Hospital of the Univ. of Pennsylvania, Upenn - Penn Presbyterian Hospital, Upenn - Pennsylvania Hospital, Apple - Rocky Hill, Apple - Watertown | Penn--BPCI Model 2, Apple Rehab--BPCI Model 3            | Penn--2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania, Penn--2070-021--Upenn - Penn Presbyterian Hospital, Penn--2070-022--Upenn - Pennsylvania Hospital, Apple Rehab--3056-i11--Apple - Watertown, Apple Rehab--3056-i12--Apple - Rocky Hill |                                                                                                                                                | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_LPN | Patient ID     | Episode DRG Issues |
      | Edit All locations to single location      | Super Admin | Remedy LPN | test.automatemail | Episodes 2.0, Reports, TCI, Lessons, Episodes | Administration, Physician Connect               | Episodes            | All Locations   | 2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania    | BPCI-Model2 | Penn          | UPenn - Hospital of the Univ. of Pennsylvania, Apple - Rocky Hill, Apple - Watertown                                                                    | Penn--BPCI Model 2, Apple Rehab--BPCI Model 3            | Penn--2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania, Apple Rehab--3056-i11--Apple - Watertown, Apple Rehab--3056-i12--Apple - Rocky Hill                                                                                                    |                                                                                                                                                | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_LPN | Patient ID     | Episode DRG Issues |

  Scenario Outline: Edit programs- <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Applications" tab
    Then I unselect "<DisableApplications>" product
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System>"
    Then I deselect "<RemovePrograms>" programs
    #Then I select "<Programs>" programs for existing organisation
    #Then I select "<Locations>" locations
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
    Then I click on Hamburger menu on top left of homepage
    And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    And I switch to new window
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
    #And I click on Institute tile for "<User>-<Role>" user
    #And I switch to new window
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I switch back to old window
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
      | Description                                                                                         | User        | Role             | Email             | Applications                                  | ApplicationsNotVisible            | DisableApplications | Locations | RemovePrograms | Programs    | Health System                                        | Facilities                                                                                                                                                                                           | LearningPathway                                                                                                                                                                                                                       | FirstName                                 | LastName | Roletext | ReportCategory | ReportName                   | HealthSystemValidation                                                               | ProgramsValidation                                                                                                                                                 | LocationsValidation                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | Search user with multiple model-disable model-2 and model-3 remained enabled then verify locations  | Super Admin | Remedy Field RN  | test.automatemail | Episodes, Episodes 2.0, Reports, TCI, Lessons | Administration, Physician Connect | Episodes, Episodes  |           | BPCI-Model2    | BPCI-Model3 | Cardiovascular Associates of The Delaware Valley,p A | Howard County General Hospital, East Orange General Hospital, United Health Services, Binghamton General-Sandiford Rehabilitation Center, Chenango Memorial Hospital, UHS Twin Tier Home Health Inc. | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | ROLE_FRN | Patient ID     | Episode DRG Issues [Model 3] | United Health Services of New York, Cardiovascular Associates of The Delaware Valley | United Health Services of New York--BPCI Model 2, United Health Services of New York--BPCI Model 3, Cardiovascular Associates of The Delaware Valley--BPCI Model 3 | United Health Services of New York--6005-197--United Health Services, United Health Services of New York--6005-197--Binghamton General, United Health Services of New York--6005-198--Chenango Memorial Hospital, United Health Services of New York--3090-209--Uhs Twin Tier Home Health Inc., Cardiovascular Associates of The Delaware Valley--3056-a08--Howard County General Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--East Orange General Hospital |
      | Search user with multiple model-disable model-3 with model-2 remained enabled and verify locations  | Super Admin | Remedy Executive | test.automatemail | Episodes, Episodes 2.0, Reports, TCI, Lessons | Administration, Physician Connect | Episodes, Episodes  |           | BPCI-Model3    | BPCI-Model2 | Cardiovascular Associates of The Delaware Valley,p A | Butler Memorial Hospital, Carolinas Hospital System - Florence                                                                                                                                       | max-test-052417, New learning Path, Remedy University                                                                                                                                                                                 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | ROLE_PRM | Patient ID     | Episode DRG Issues           | Cardiovascular Associates of The Delaware Valley, Butler Memorial Hospital           | Cardiovascular Associates of The Delaware Valley--BPCI Model 2, Butler Memorial Hospital--BPCI-CJR, Butler Memorial Hospital--BPCI Model 2                         | Butler Memorial Hospital--CJR-1--Butler Memorial Hospital, Butler Memorial Hospital--2070-a55--Butler Memorial Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Carolinas Hospital System - Florence                                                                                                                                                                                                                                                            |
      | Search user with multiple model-disable BPCI-CJR with model-2 remained enabled and verify locations | Super Admin | Remedy Other     | test.automatemail | Episodes, Episodes 2.0, TCI, Lessons          | Administration, Physician Connect | Episodes, Episodes  |           | BPCI-CJR       | BPCI-Model2 | Butler Memorial Hospital                             | Butler Memorial Hospital, Monmouth Medical Center - Southern Campus                                                                                                                                  | New learning Path, Physician Acute Care Hospital Model 2                                                                                                                                                                              | FirstName                                 | LastName | ROLE_PRM | Patient ID     | Episode DRG Issues           | Butler Memorial Hospital, RWJ Barnabas Health                                        | Butler Memorial Hospital--BPCI Model 2, RWJ Barnabas Health--BPCI-CJR                                                                                              | Butler Memorial Hospital--2070-a55--Butler Memorial Hospital, RWJ Barnabas Health--CJR-10-6--Monmouth Medical Center - Southern Campus                                                                                                                                                                                                                                                                                                                                               |

  Scenario Outline: Changing General information, Role from <PreviousRole> to <Role> and Remove existing org and add new org
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
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
    Then I select "<EnableApplications>" product
    #Then I click on Select button
    #Then I enter "<LearningPathwaySearchParameter>" in Learning Pathway search box
    #Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I remove health system "<Remove HealthSystem>"
    And I click on "Remove" button on permissions tab
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select location by facility key "<Locations>"
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify phone "<Phone>"
    Then I verify enabled "<EnableApplications>"
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
    Then I click on Hamburger menu on top left of homepage
    And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    And I switch to new window
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
    #And I click on Institute tile for "<User>-<Role>" user
    #And I switch to new window
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I switch back to old window
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
      | User        | UserName                               | Password | FirstName | LastName       | Email             | Phone        | NPI | PreviousRole | Role    | EnableApplications | Applications               | ApplicationsNotVisible                          | Remove HealthSystem                                                    | Health System                                                          | Programs    | Locations | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName         | BPID | Facilities                              | LearningPathway                                                                     | HealthSystemValidation   | ProgramsValidation                     | LocationsValidation                                              |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameEdited | test.automatemail | 996-385-2451 |     | Case Manager | Manager | Reports            | Episodes, Reports, Lessons | Administration, Physician Connect, Episodes 2.0 | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network | BPCI-Model2 |    390035 |                                | ROLE_PRM | Patient ID     | Episode DRG Issues |      | St. Luke's Hospital Quakertown Hospital | i am learning path, Learning Pathway 2, max-test-052417, Care Coordination External | St. Lukes Health Network | St. Lukes Health Network--BPCI Model 2 | St. Lukes Health Network--2070-026--Hospital Quakertown Hospital |

  Scenario Outline: Changing General information, Role from <PreviousRole> to <Role> and edit Data permissions
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I verify the header "General Information"
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I fill in Phone with <Phone>
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I unselect "<RemoveApplications>" product
    Then I select "<EnableApplications>" product
    Then I click on Next button
    Then I click on existing organisation "<Health System>"
    Then I deselect "<RemovePrograms>" programs
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    Then I verify last name "<LastName>"
    Then I verify phone "<Phone>"
    Then I verify enabled "<EnableApplications>"
    Then I verify disabled "<RemoveApplications>"
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
    Then I click on Hamburger menu on top left of homepage
    And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    And I switch to new window
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
    #And I click on Institute tile for "<User>-<Role>" user
    #And I switch to new window
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I switch back to old window
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
      | User        | UserName                               | Password | FirstName       | LastName       | Email             | Phone        | NPI | PreviousRole              | Role              | EnableApplications | RemoveApplications | Applications | ApplicationsNotVisible                     | Health System                      | RemovePrograms           | Programs    | Locations                                                     | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName         | BPID | Facilities                                | ProgramsValidation                               | LocationsValidation                                                                                                                   | LearningPathway                                                                                                                                                                                                                                          |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 |     | Transitional Case Manager | Remedy Sales Team | TCI                | Reports            | TCI, Lessons | Administration, Physician Connect, Reports | United Health Services of New York | BPCI-Model3, BPCI-Model2 | BPCI-Model2 | 6005-197--United Health Services, 6005-200--Cape Cod Hospital |                                | ROLE_TCS | Patient ID     | Episode DRG Issues |      | United Health Services, Cape Cod Hospital | United Health Services of New York--BPCI Model 2 | United Health Services of New York--6005-197--United Health Services, United Health Services of New York--6005-200--Cape Cod Hospital | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University |

  Scenario Outline: Remove phone, Role from <PreviousRole> to <Role> add new org
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    And I fill in Phone with <Phone>
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I click on Next button
    Then I click Add Organization button for "<HasHealthSystem2>" flag
    And I search for health system with <Health System2>
    And I select a <Health System2>
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    Then I verify phone "<PhoneValidation>"
    Then I verify enabled "<EnableApplications>"
    Then I verify health system "<Health System2>"
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
    Then I click on Hamburger menu on top left of homepage
    And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    And I switch to new window
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
    #And I click on Institute tile for "<User>-<Role>" user
    #And I switch to new window
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I switch back to old window
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
      | User        | FirstName | LastName | PreviousRole      | Role       | Phone      | PhoneValidation | NPI | EnableApplications          | Applications               | ApplicationsNotVisible       | Email             | HasHealthSystem2 | Health System2 | Programs    | Locations                        | Roletext       | ReportCategory | ReportName         | BPID | HealthSystemValidation                         | ProgramsValidation                                                         | LocationsValidation                                                                                                                                                                 | Facilities                                                        | LearningPathway                                                                                          |
      | Super Admin | FirstName | LastName | Remedy Sales Team | Physicians | 9999999999 | 999-999-9999    | NPI | Physician Connect, Episodes | Episodes, Reports, Lessons | Episodes 2.0, Administration | test.automatemail | Yes              | TeamHealth     | BPCI-Model2 | 2070-g14--North Shore Med Center | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues |      | TeamHealth, United Health Services of New York | TeamHealth--BPCI Model 2, United Health Services of New York--BPCI Model 2 | TeamHealth--2070-g14--North Shore Med Center, United Health Services of New York--6005-197--United Health Services, United Health Services of New York--6005-200--Cape Cod Hospital | North Shore Med Center, United Health Services, Cape Cod Hospital | i am learning path, Learning Pathway 2, max-test-052417, Clinical Operations Acute Care Hospital Model 2 |

  Scenario Outline: Edit phone, Role from <PreviousRole> to <Role> and Remove Existing Location and Add new Location
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    And I fill in Phone with <Phone>
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I click on Next button
    Then I click on existing organisation "<Health System>"
    Then I select "<DisableLocations>" locations
    Then I select location by BPID "<EnableLocations>"
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    Then I verify phone "<PhoneValidation>"
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
    Then I click on Hamburger menu on top left of homepage
    And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    And I switch to new window
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
    #And I click on Institute tile for "<User>-<Role>" user
    #And I switch to new window
    #And I verify "<User>-<Role>" user navigated to Institute homepage
    #And I switch back to old window
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
      | User        | FirstName | LastName | PreviousRole | Role                           | Phone      | PhoneValidation | NPI | EnableApplications                | Applications                                                  | Email             | Health System                      | Programs                 | DisableLocations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | EnableLocations                                                            | Roletext   | ReportCategory | ReportName         | BPID | Facilities                                                                                                                                                                                                                                                                       | ProgramsValidation                                                                                                                                                                                                                 | LocationsValidation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | LearningPathway                                                                                                               |
      | Super Admin | FirstName | LastName | Remedy PM    | Remedy Technical Administrator | 9999999999 | 999-999-9999    |     | Physician Connect, Administration | Episodes, Episodes 2.0, Reports, Administration, TCI, Lessons | test.automatemail | United Health Services of New York | BPCI-Model2, BPCI-Model3 | 6005-197--United Health Services, 6005-197--Binghamton General, 6005-198--Chenango Memorial Hospital, 6005-200--Avera Mckennan Hospital & University Health Center, 6005-200--Westchester General Hospital , 6005-200--Cayuga Medical Center At Ithaca, 6005-200--Cape Cod Hospital, 6005-200--St  Vincent, 6005-200--White Plains Hospital Center, 6005-200--North Central Bronx Hospital, 6005-200--Saratoga Hospital, 6005-200--Moses Taylor Hospital, 6005-200--Banner Del E Webb Medical Center, 6005-200--161395906, 6005-200--St. James Mercy Hospital, 6005-200--University Hospital, 6005-200--Cortland Regional Medical Center, 6005-200--Hackettstown Regional Medical Center, 6005-200--St Johns Regional Medical Center, 6005-200--Bayhealth - Kent General Hospital, 6005-200--Howard County General Hospital, 6005-200--Porter Regional Hospital, 6005-200--Arnot Ogden Medical Center, 6005-200--St. Peter's Hospital, 6005-200--Chenango Memorial Hospital, 6005-200--United Health Services, 6005-200--Washington Hospital, 6005-200--Geisinger - Community Medical Center, 6005-200--Scripps Memorial Hospital - Encinitas, 6005-200--Mary Imogene Bassett Hospital, 6005-200--Our Lady Of Lourdes Memorial Hospital, 6005-200--Queens Hospital Center, 6005-200--Tlc Health Network, 6005-200--Menifee Valley Medical Center, 6005-200--Sisters Of Charity Hospital, 6005-200--Albany Medical Center Hospital, 6005-200--Aurelia Osborn Fox Memorial Hospital, 6005-200--Lane Regional Medical Center, 6005-200--Brookhaven Memorial Hospital Medical Center, 6005-200--Banner Boswell Medical Center, 6005-200--Hemet Valley Medical Center, 6005-200--Binghamton General, 6005-200--Albany Memorial Hospital, 6005-200--East Jefferson General Hospital, 3090-209--Uhs Twin Tier Home Health Inc. | 6005-197--United Health Services, 3090-209--Uhs Twin Tier Home Health Inc. | ROLE_ADMIN | Patient ID     | Episode DRG Issues |      | Carolinas Hospital System - Florence, Howard County General Hospital, East Orange General Hospital, Meritus Medical Center, North Shore University Hospital, St. Michael's Medical Center, Saint Barnabas Medical Center, United Health Services, UHS Twin Tier Home Health Inc. | Cardiovascular Associates of The Delaware Valley--BPCI Model 2, Cardiovascular Associates of The Delaware Valley--BPCI Model 3, United Health Services of New York--BPCI Model 2, United Health Services of New York--BPCI Model 3 | United Health Services of New York--3090-209--Uhs Twin Tier Home Health Inc., Cardiovascular Associates of The Delaware Valley--2070-060--Carolinas Hospital System - Florence, Cardiovascular Associates of The Delaware Valley--3056-a08--Howard County General Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--East Orange General Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--Meritus Medical Center, Cardiovascular Associates of The Delaware Valley--3056-a08--North Shore University Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--St. Michael's Medical Center, Cardiovascular Associates of The Delaware Valley--3056-a08--Saint Barnabas Medical Center, United Health Services of New York--6005-197--United Health Services | Learning Pathway 2, New learning Path, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
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
      | Description                                           | User        | FirstName  | LastName   | Email             | Phone      | Role       | NPI        | ValidationMsg                     |
      | Verify validation message for blank First name        | Super Admin |            | Last Name  | test.automatemail | 9874563210 | Executive  |            | First Name is required            |
      | Verify validation message for blank Last name         | Super Admin | First Name |            | test.automatemail | 9874563210 | Executive  |            | Last Name is required             |
      | Verify validation message for blank NPI               | Super Admin | First Name | Last Name  | test.automatemail | 9874563210 | Physicians |            | NPI is required                   |
      | Verify validation message for invalid Phone           | Super Admin | First Name | Last Name  | test.automatemail |     123564 | Physicians | NPI        | Please enter a valid phone number |
      | Verify validation message for NPI less than 10 digits | Super Admin | First Name | Last Name  | test.automatemail | 9874563210 | Physicians |     123564 | Please enter a valid NPI          |
      | Verify validation message for NPI as alphabets        | Super Admin | First Name | Last Name  | test.automatemail | 9874563210 | Physicians | abcdefgihj | Please enter a valid NPI          |
      | Verify validation message for NPI as alphanumeric     | Super Admin | First Name | Last Name  | test.automatemail | 9874563210 | Physicians | abcde12345 | Please enter a valid NPI          |
      | Verify validation message for invalid First Name      | Super Admin | 8473827919 | Last Name  | test.automatemail | 9874563210 | Physicians | NPI        | Please enter a valid name         |
      | Verify validation message for invalid Last name       | Super Admin | First Name | 8473827919 | test.automatemail | 9874563210 | Physicians | NPI        | Please enter a valid name         |

  Scenario Outline: Verify auto selected programs in Organizations
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I verify the header "Permissions"
    Then I select already selected "<Health System>"
    Then I verify default program "BPCI-Model2" associated with organization

    Examples: 
      | User        | Role       | Health System     |
      | Super Admin | Remedy TCS | Stamford Hospital |

  Scenario Outline: Verify the functionality of back/Cancel button
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
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
    Then I click on "Permissions" tab on the left
    Then I verify the header "Permissions"
    Then I click on Back button
    Then I verify the header "Applications"
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I click on "General Information" tab on the left
    Then I verify the header "General Information"
    When I click the Organizational Role Field to edit
    Then I pick a Organizational Manager
    Then I click on "Applications" tab on the left
    Then I verify the header "Applications"
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I click Add Organization button for "<HasHealthSystem2>" flag
    And I search for health system with TeamHealth
    And I select a TeamHealth
    Then I click on Cancel button
    And I verify that I am navigated to user page
    Then I verify role "<Role>"

    Examples: 
      | User        | Role      | HasHealthSystem2 |
      | Super Admin | Executive | Yes              |

  Scenario Outline: Verify applications on changing role
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I verify the header "General Information"
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role1>
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
    Then I verify applications "<ApplicationsUnchecked2>" are unchecked
    Then I verify applications "<ApplicationsChecked2>" are checked

    Examples: 
      | User        | PreviousRole | Role1                          | ApplicationsChecked1       | ApplicationsUnchecked1                               | Role2             | ApplicationsChecked2 | ApplicationsUnchecked2 |
      | Super Admin | Executive    | Remedy Technical Administrator | Reports, Episodes, Lessons | Episodes 2.0, Physician Connect, Administration, TCI | Remedy Sales Team | Lessons, Reports     | TCI                    |

  Scenario Outline: Invalid Health system and invalid location validation
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I click Add Organization button for "<HasHealthSystem2>" flag
    And I search for health system with <InvalidHealthSystem>
    And I verify No results found for invalid health system
    Then I click on Select dropdown
    And I search for health system with <Health System2>
    And I select a <Health System2>
    Then I select "<Programs2>" programs
    Then I select "<invalidLocations>" invalid locations
    And I verify No results found for invalid Location for "second" organisation
    Then I click on existing organisation "<Health System2>"
    Then I verify incomplete status for health system

    Examples: 
      | User        | Role    | HasHealthSystem2 | InvalidHealthSystem | Health System2 | Programs2   | invalidLocations |
      | Super Admin | Manager | Yes              | hdvb                | Avalon         | BPCI-Model3 | hkfj             |

  Scenario Outline: Remove selected locations and then remove the org
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System>"
    Then I select "<DisableLocations>" locations
    Then I remove health system "<Health System>"
    And I click on "Remove" button on permissions tab
    Then I click on Submit button while edit for "<User>-<Role>"

    Examples: 
      | User        | Role      | Health System | DisableLocations                         |
      | Super Admin | Remedy RN | TeamHealth    | 3056-q91--The Medical Center At Franklin |

  Scenario Outline: Verify the search functionality in selected locations and delete a location
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I verify the header "Permissions"
    Then I click on existing organisation "<Health System>"
    And I verify selected Location "<SelectedLocations>" in the selected Locations section
    Then I search the "<Locations>" in the Selected Locations section
    Then I verify facility key "<facilityKey>" is displayed with location name "Fairbanks Memorial Hospital"
    And I click on remove link icon for selected Locations on selected Locations section
    And I verify Selected Locations section after click on remove link icon

    Examples: 
      | User        | UserName                               | Password | Role      | Health System    | SelectedLocations                    | Locations                             | facilityKey |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | Executive | Sound Physicians | Fairbanks Memorial Hospital (020012) | 6005-063--Fairbanks Memorial Hospital |      020012 |

  Scenario Outline: Changing role from physician to Manager then back to Physicians
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
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
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    Then I verify role "<Role>"
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <PreviousRole>
    Then I enter NPI field with "<NPI2>" for role "<PreviousRole>"
    Then I click on Next button
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<PreviousRole>--<Role>"
    Then I verify role "<PreviousRole>"

    Examples: 
      | User        | UserName                               | Password | Email             | NPI1 | NPI2 | PreviousRole | Role    | EnableApplications | Applications                                                     | ApplicationsNotVisible       | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName                   | BPID | LearningPathway                                                                                                                       | FirstName | LastName | Facilities        |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | test.automatemail |      | NPI  | Physicians   | Manager |                    | Episodes, Reports, Physician Connect, Lessons, Physician Connect | Administration, Episodes 2.0 |                                | ROLE_PRM | Patient ID     | Episode DRG Issues [Model 3] |      | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | FirstName | LastName | Apple - Watertown |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System1>"
    Then I deselect "<RemoveLocations1>" locations
    Then I select "<AddLocations1>" locations
    Then I click on existing organisation "<Health System2>"
    Then I deselect "<RemoveLocations2>" locations
    Then I select "<AddLocations2>" locations
    Then I click on existing organisation "<Health System3>"
    Then I deselect "<RemoveLocations3>" locations
    Then I select "<AddLocations3>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify health system "<Health System_Validation>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"

    Examples: 
      | Description                                   | User        | Role                         | Email             | Health System1 | RemoveLocations1              | AddLocations1 | Health System2   | RemoveLocations2            | AddLocations2                      | Health System3                                       | RemoveLocations3                                                                         | AddLocations3 | Health System_Validation                                                       | ProgramsValidation                                                                                                                                                                                                                                 | LocationsValidation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | Editing data permissions for user with 3 orgs | Super Admin | Remedy Program Administrator | test.automatemail | TeamHealth     | 3056-q91--Rhea Medical Center |               | Sound Physicians | 6005-059--Evanston Hospital | 6005-072--Jackson North Med Center | Cardiovascular Associates of The Delaware Valley,p A | 3056-a08--Saint Barnabas Medical Center , 2070-060--Carolinas Hospital System - Florence |               | TeamHealth, Sound Physicians, Cardiovascular Associates of The Delaware Valley | TeamHealth--BPCI Model 2, TeamHealth--BPCI Model 3, Sound Physicians--BPCI Model 2, Sound Physicians--BPCI Model 3, Cardiovascular Associates of The Delaware Valley--BPCI Model 2, Cardiovascular Associates of The Delaware Valley--BPCI Model 3 | TeamHealth--2070-g14--North Shore Med Center, TeamHealth--3056-q91--The Medical Center At Franklin, Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--6005-072--Jackson North Med Center, Sound Physicians--3056-b75--Warren Memorial Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--East Orange General Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--St Lukes Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Community Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Kennedy Univ Hospital - Stratford And Cherry Hills, Cardiovascular Associates of The Delaware Valley--2070-060--Capital Health Medical Center - Hopewell, Cardiovascular Associates of The Delaware Valley--2070-060--Bayshore Community Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Rwj University Hospital At New Brunswick, Cardiovascular Associates of The Delaware Valley--2070-060--Kennedy Memorial Washington Township, Cardiovascular Associates of The Delaware Valley--2070-060--Raritan Bay Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Holmes Regional Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Sebastian River Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Lenox Hill Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Lewistown Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--St. Michael, Cardiovascular Associates of The Delaware Valley--2070-060--Jackson-, Cardiovascular Associates of The Delaware Valley--2070-060--Newark Beth Israel Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Inova Fairfax Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Lourdes Rehab At Camden, Cardiovascular Associates of The Delaware Valley--2070-060--Mercy Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Hackensack University Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Tuomey Healthcare System, Cardiovascular Associates of The Delaware Valley--2070-060--223321233, Cardiovascular Associates of The Delaware Valley--2070-060--Martin Memorial South, Cardiovascular Associates of The Delaware Valley--2070-060--Lourdes Medical Center Of Burlington County, Cardiovascular Associates of The Delaware Valley--2070-060--North Shore University Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Virtua Marlton, Cardiovascular Associates of The Delaware Valley--2070-060--Cooper University Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Virtua Voorhees, Cardiovascular Associates of The Delaware Valley--2070-060--Virtua West Jersey Hospitals Berlin, Cardiovascular Associates of The Delaware Valley--2070-060--Howard County General Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Meritus Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Wuesthoff Medical Center  Rockledge, Cardiovascular Associates of The Delaware Valley--2070-060--Wuesthoff Medical Center - Melbourne, Cardiovascular Associates of The Delaware Valley--2070-060--Saint Peter, Cardiovascular Associates of The Delaware Valley--2070-060--Martin Memorial North, Cardiovascular Associates of The Delaware Valley--2070-060--Jersey Shore University Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Mount Nittany Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Deborah Heart And Lung Center, Cardiovascular Associates of The Delaware Valley--2070-060--Inspira Medical Center Vineland, Cardiovascular Associates of The Delaware Valley--2070-060--Regional Hospital Of Jackson, Cardiovascular Associates of The Delaware Valley--2070-060--Saint Barnabas Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Martin Memorial West, Cardiovascular Associates of The Delaware Valley--2070-060--Riverview Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--310034-REH, Cardiovascular Associates of The Delaware Valley--2070-060--Inspira Medical Center Elmer, Cardiovascular Associates of The Delaware Valley--2070-060--Novant Health Prince William Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Our Lady Of Lourdes Medical Center - Camden, Cardiovascular Associates of The Delaware Valley--2070-060--Jfk Medical Ctr - Anthony M. Yelencsics Community, Cardiovascular Associates of The Delaware Valley--3056-a08--Howard County General Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--East Orange General Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--Meritus Medical Center, Cardiovascular Associates of The Delaware Valley--3056-a08--North Shore University Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--St. Michael |

  Scenario Outline: Validating- all locations should not be displayed as selected when the "All Locations" check box is unchecked while editing the user
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System>"
    Then I select "<AddLocations>" locations
    Then I deselect "<AddLocations>" locations
    And I verify selected Location "<SelectedLocations>" are not shown in selected Locations section

    Examples: 
      | User        | Role      | Health System    | AddLocations  | SelectedLocations                  |
      | Super Admin | Executive | Sound Physicians | All Locations | Advocate Trinity Hospital (140048) |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I remove health system "<Remove HealthSystem>"
    And I click on "Remove" button on permissions tab
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify error message "User does not exist. Please go back to the users list page." is not displayed

    Examples: 
      | Description                                                                                         | User        | Role      | Remove HealthSystem | Health System                                                          | Programs    | Locations     |
      | Error message "User does not exist. Please go back to the users list page." should not be displayed | Super Admin | Executive | Sound Physicians    | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network | BPCI-Model2 | All Locations |
