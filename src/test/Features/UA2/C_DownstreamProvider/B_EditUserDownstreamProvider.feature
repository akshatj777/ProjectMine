Feature: Edit page for Downstream provider

  Scenario Outline: <Description>
    #Given I am on mail login page
    #Then I enter username "test.automatemail" to login mail account
    #Then I enter password "KuchBhi@001" to login mail account
    #Then I click on Mail icon in my account
    #Then I click on Inbox in mail
    #Then I click on delete icon in mail
    #Then I signout from mail account
    Given I am on the login page
    When I enter email field <UserName> for login
    And I enter password field <Password> for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
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
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I verify Learning Pathway search box is available
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    And I search for health system with <Health System1>
    And I select a <Health System1>
    Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations
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
    Then I click on Submit button for "<User>"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Given I am on the login page
    Then I click on "Log Out" button again
    Given I am on mail login page
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "KuchBhi@001" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify Account Verification in Inbox in my account
    Then I click on Account Verification mail in Inbox
    Then I verify "Confirm my account!" link in mail content
    Then I click on "Confirm my account!" link in mail content
    And I switch to new window
    Then I enter email to generate password link
    And I click on send mail button
    Then I switch back to old window
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change my password" link in mail content
    Then I click on "Change my password" link in mail content
    And I switch to new window
    And I enter new password "Testing1@" to set new password
    And I enter confirm new password "Testing1@" to set new password
    And I click on submit button to set new password

    Examples: 
      | Description                                                      | User        | UserName                               | Password | FirstName | LastName | Email             | Phone | Role       | Applications                                  | ApplicationsNotVisible            | NPI | LearningPathwaySearchParameter                                                                                | Health System1    | Programs1   | Locations1                  | HasHealthSystem2 | Health System2 | Programs2   | Locations2                     | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Remedy TCS role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastName | test.automatemail |       | Remedy TCS | Episodes, Episodes 2.0, Reports, TCI, Lessons | Administration, Physician Connect |     | Learning Pathway 2, jusUV22erpk1, Clinical Operations Acute Care Hospital Model 2, n9yn5n0Qa581, 18h7phZr1h81 | Stamford Hospital | BPCI-Model2 | 2070-015--Stamford Hospital | Yes              | Altercare      | BPCI-Model3 | 3056-m03--Altercare - Alliance | No               |                |           |            |

  Scenario Outline: Change Role from <PreviousRole> to <Role> and Edit details
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
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I verify unavailability of organization drop down
    Then I verify text "Which location(s) does this user have access to?" is "Present" in Permission tab
    Then I select "<Locations>" locations for Downstream Provider role
    Then I click Add Model3 Organization button for "<HasHealthSystem1>" flag for Downstream Provider role
    And I search for health system with <Health System1>
    And I select a <Health System1>
    Then I select "<Locations1>" locations
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    And I verify that I am navigated to user page
    Then I verify role "<Role>"
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
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
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
      | User        | Email             | FirstName                                 | LastName                                 | PreviousRole | Role                | EnableApplications         | Applications           | ApplicationsNotVisible                              | Locations                                                                                    | HasHealthSystem1 | Health System1 | Locations1                                       | HealthSystemValidation                       | ProgramsValidation                                                                  | LocationsValidation                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Roletext | ReportCategory | ReportName                   | LearningPathway                                           | BPID | Facilities                                                                                                                                                                                                                         |
      | Super Admin | test.automatemail | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Remedy TCS   | Downstream Provider | Episodes 2.0, Episodes 2.0 | Episodes, Episodes 2.0 | Administration, Physician Connect, Reports, Lessons | 555469, 345454, 5 Star Home Care Llc, 3 Angels Home Health, Coosa Valley Health Care, 020653 | Yes              | Covenant       | 3056-804--COVC0023, 3056-805--Downey Care Center | Healthsystem - Downstream Provider, Covenant | Covenant--BPCI Model 3, Healthsystem - Downstream Provider--Downstream Organization | Covenant--3056-804--Catered Manor Nursing Center, Covenant--3056-805--Downey Care Center, Healthsystem - Downstream Provider--DOWN-ORG--555469, Healthsystem - Downstream Provider--DOWN-ORG--345454, Healthsystem - Downstream Provider--DOWN-ORG--5 Star Home Care Llc, Healthsystem - Downstream Provider--DOWN-ORG--3 Angels Home Health, Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653 | ROLE_SNF | Patient ID     | Episode DRG Issues [Model 3] | i am learning path, Learning Pathway 2, Remedy University |      | Catered Manor Nursing Center, Downey Care Center, woodruff Community Hospital, Litchford Falls Nursing & Rehabilitation Center, 5 Star Home Care Llc, 3 Angels Home Health, Coosa valley health care, Alaris Health at Jersey City |

  Scenario Outline: Edit downstream provider general details, applications and data permissions
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
    Then I click on Next button
    Then I unselect "<DisableApplications>" product
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I click on existing organisation "<Health System>"
    Then I deselect "<DeselectLocations>" locations for Downstream Provider role
    #Then I select "<Locations>" locations for Downstream Provider role
    Then I click on existing organisation "<Health System1>"
    Then I deselect "<DisableLocations1>" locations
    Then I select "<EnableLocations1>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify enabled "<Applications>"
    Then I verify disabled "<DisableApplications>"
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
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
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
      | User        | Email             | Role                | FirstName       | LastName       | Phone        | DisableApplications | Applications | ApplicationsNotVisible                                        | DeselectLocations                                          | Locations                                          | Health System       | Health System1 | DisableLocations1                                                    | EnableLocations1                                                                 | HealthSystemValidation                       | ProgramsValidation                                                                  | LocationsValidation                                                                                                                                                                                                                | Roletext | ReportCategory | ReportName                   | LearningPathway                                           | BPID | Facilities                                                                                                           |
      | Super Admin | test.automatemail | Downstream Provider | FirstNameEdited | LastNameEdited | 996-385-2451 | Episodes            | Episodes 2.0 | Episodes, Administration, Physician Connect, Reports, Lessons | 555469, 345454, 5 Star Home Care Llc, 3 Angels Home Health | 345454, 5 Star Home Care Llc, 3 Angels Home Health | Downstream Provider | Covenant       | 3056-804--Catered Manor Nursing Center, 3056-805--Downey Care Center | 3056-809--Courtyard Health Care Center, 3056-810--Emerald Gardens Nursing Center | Healthsystem - Downstream Provider, Covenant | Covenant--BPCI Model 3, Healthsystem - Downstream Provider--Downstream Organization | Covenant--3056-809--Courtyard Health Care Center, Covenant--3056-810--Emerald Gardens Nursing Center, Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653 | ROLE_SNF | Patient ID     | Episode DRG Issues [Model 3] | i am learning path, Learning Pathway 2, Remedy University |      | Courtyard Health Care Center, Emerald Gardens Nursing Center, Coosa valley health care, Alaris Health at Jersey City |

  Scenario Outline: Remove exiting health System and new org
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
    And I fill in Phone with <Phone>
    Then I click on Next button
    Then I unselect "<EnableApplication>" product
    Then I click on Next button
    Then I remove health system "<Remove HealthSystem>"
    And I click on "Remove" button on permissions tab
    Then I click Add Model3 Organization button for "<HasHealthSystem1>" flag for Downstream Provider role
    And I search for health system with <Health System1>
    And I select a <Health System1>
    Then I select "<Locations1>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify enabled "<Applications>"
    Then I verify disabled "<DisableApplications>"
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
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
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
      | User        | Email             | Role                | FirstName       | LastName       | Phone        | EnableApplication | Applications           | ApplicationsNotVisible                              | Remove HealthSystem | HasHealthSystem1 | Health System1 | Locations1                  | HealthSystemValidation                          | ProgramsValidation                                                                     | LocationsValidation                                                                                                                                                    | Roletext | ReportCategory | ReportName                   | LearningPathway                                           | BPID | Facilities                                                                |
      | Super Admin | test.automatemail | Downstream Provider | FirstNameEdited | LastNameEdited | 996-385-2451 | Episodes          | Episodes, Episodes 2.0 | Administration, Physician Connect, Reports, Lessons | Covenant            | Yes              | Apple Rehab    | 3056-i11--Apple - Watertown | Healthsystem - Downstream Provider, Apple Rehab | Apple Rehab--BPCI Model 3, Healthsystem - Downstream Provider--Downstream Organization | Apple Rehab--3056-i11--Apple - Watertown, Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653 | ROLE_SNF | Patient ID     | Episode DRG Issues [Model 3] | i am learning path, Learning Pathway 2, Remedy University |      | Apple - Watertown, Coosa valley health care, Alaris Health at Jersey City |

  Scenario Outline: Change Role from <PreviousRole> to <Role>
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
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I unselect "<DisableApplications>" product
    Then I click on Select button
    Then I verify Learning Pathway search box is available
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I verify text "Which location(s) does this user have access to?" is "Not Present" in Permission tab
    And I search for health system with <Health System1>
    And I select a <Health System1>
    Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations
    Then I click Add Organization button for "<HasHealthSystem2>" flag
    And I search for health system with <Health System2>
    And I select a <Health System2>
    Then I select "<Programs2>" programs
    Then I select "<Locations2>" locations
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    And I verify that I am navigated to user page
    Then I verify role "<Role>"
    Then I verify enabled "<ApplicationsEnabled>"
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
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I switch back to old window
    And I redirect to Remedy connect page
    And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    And I redirect to Remedy connect page
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
      | User        | UserName                               | Password | FirstName       | LastName       | Email             | NPI | PreviousRole        | Role      | DisableApplications | EnableApplications | Applications     | ApplicationsNotVisible                          | LearningPathwayName | LearningPathwaySearchParameter         | Roletext | Health System1 | Programs1   | Locations1                  | HasHealthSystem2 | Health System2 | Programs2   | Locations2                                   | ReportCategory | ReportName                   | BPID | Facilities                                            | LearningPathway                        | HealthSystemValidation | ProgramsValidation                            | LocationsValidation                                                                          |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail |     | Downstream Provider | Executive | Episodes            | Reports, Lessons   | Reports, Lessons | Administration, Physician Connect, Episodes 2.0 | Test123             | i am learning path, Learning Pathway 2 | ROLE_PRM | Apple Rehab    | BPCI-Model3 | 3056-i11--Apple - Watertown | Yes              | Penn           | BPCI-Model2 | 2070-021--Upenn - Penn Presbyterian Hospital | Patient ID     | Episode DRG Issues [Model 3] |      | Apple - Watertown, Upenn - Penn Presbyterian Hospital | i am learning path, Learning Pathway 2 | Penn,  Apple Rehab     | Apple Rehab--BPCI Model 3, Penn--BPCI Model 2 | Apple Rehab--3056-i11--Apple - Watertown, Penn--2070-021--Upenn - Penn Presbyterian Hospital |
