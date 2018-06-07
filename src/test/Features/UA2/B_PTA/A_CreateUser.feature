Feature: Create User - PTA User

  Scenario Outline: <Description>
    Given I am on mail login page
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I click on delete icon in mail
    Then I signout from mail account
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
    Then I enter password "Intel@01" to login mail account
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
    And I enter new password "Testing1" to set new password
    And I enter confirm new password "Testing1" to set new password
    And I click on submit button to set new password

    Examples: 
      | Description                                                                           | User        | UserName                               | Password | FirstName | LastName                                 | Email             | Phone | Role                            | Applications                                                  | ApplicationsNotVisible | NPI | LearningPathwaySearchParameter   | Health System1           | Programs1 | Locations1                                                                                                                                                                                                          | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Partner Technical Administrator role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameLastNameLastNameLastNameLastName | test.automatemail |       | Partner Technical Administrator | Episodes, Reports, Physician Connect, Administration, Lessons | Episodes 2.0, TCI      |     | HZhmTBQzHtU1, Learning Pathway 2 | RWJ Barnabas Health, INC | BPCI-CJR  | CJR-10-6--Monmouth Medical Center - Southern Campus, CJR-10-1--Rwj University Hospital At New Brunswick, CJR-10-2--Rwj University Hospital At Somerset, CJR-10-3--Robert Wood Johnson University Hospital At Rahway | No               |                |           |            | No               |                |           |            |

  Scenario Outline: <Description>
    Given I am on mail login page
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I click on delete icon in mail
    Then I signout from mail account
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
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
    Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations for PTA user
    Then I click on Submit button for "<User>"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Given I am on the login page
    Then I click on "Log Out" button again
    Given I am on mail login page
    Then I enter password "Intel@01" to login mail account
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
    And I enter new password "Testing1" to set new password
    And I enter confirm new password "Testing1" to set new password
    And I click on submit button to set new password

    Examples: 
      | Description                                                                            | User                            | FirstName                            | LastName                                 | Email             | Phone      | Role         | Applications               | ApplicationsNotVisible                               | NPI | LearningPathwaySearchParameter                                                                                     | Health System1           | Programs1 | Locations1                                                                                              | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Executive role    | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastNameLastNameLastNameLastNameLastName | test.automatemail | 9988776655 | Executive    | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect, TCI |     | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2 | RWJ Barnabas Health, INC | BPCI-CJR  | CJR-10-6--Monmouth Medical Center - Southern Campus, CJR-10-1--Rwj University Hospital At New Brunswick |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Manager role      | Partner Technical Administrator | FirstName                            | LastNameLastNameLastNameLastNameLastName | test.automatemail |            | Manager      | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect, TCI |     | p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81, n9yn5n0Qa581                                                             | RWJ Barnabas Health, INC | BPCI-CJR  | CJR-10-6--Monmouth Medical Center - Southern Campus, CJR-10-1--Rwj University Hospital At New Brunswick |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Case Manager role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastName                                 | test.automatemail |            | Case Manager | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect, TCI |     | Care Coordination External                                                                                         | RWJ Barnabas Health, INC | BPCI-CJR  | All Locations                                                                                           |                  |                |           |            |                  |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
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
      | Description                                                             | User                            | FirstName                            | LastName                                 | Role         | Applications                    | ApplicationsNotVisible                          | Roletext | ReportCategory | ReportName         | BPID | LearningPathway                                                                                                                                  | Facilities                                                                                                                                                                  |
      | Login with Executive and verify Product Tiles and their redirections    | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastNameLastNameLastNameLastNameLastName | Executive    | Episodes, Reports, TCI, Lessons | Episodes 2.0, Administration, Physician Connect | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                               | Monmouth Medical Center - Southern Campus, RWJ University Hospital at New Brunswick                                                                                         |
      | Login with Manager and verify Product Tiles and their redirections      | Partner Technical Administrator | FirstName                            | LastNameLastNameLastNameLastNameLastName | Manager      | Episodes, Reports, TCI, Lessons | Episodes 2.0, Administration, Physician Connect | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | Monmouth Medical Center - Southern Campus, RWJ University Hospital at New Brunswick                                                                                         |
      | Login with Case Manager and verify Product Tiles and their redirections | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastName                                 | Case Manager | Episodes, Reports, TCI, Lessons | Episodes 2.0, Administration, Physician Connect | ROLE_TCS | Patient ID     | Episode DRG Issues |      | Care Coordination External                                                                                                                       | Monmouth Medical Center - Southern Campus, RWJ University Hospital at New Brunswick, RWJ University Hospital at Somerset, Robert Wood Johnson University Hospital At Rahway |

  Scenario Outline: <Description>
    Given I am on mail login page
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I click on delete icon in mail
    Then I signout from mail account
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
    Then I enter password "Intel@01" to login mail account
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
    And I enter new password "Testing1" to set new password
    And I enter confirm new password "Testing1" to set new password
    And I click on submit button to set new password

    Examples: 
      | Description                                                                           | User        | UserName                               | Password | FirstName | LastName                                 | Email             | Phone | Role                            | Applications                                                  | ApplicationsNotVisible | NPI | LearningPathwaySearchParameter   | Health System1 | Programs1                | Locations1                                                                                                                                                                     | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Partner Technical Administrator role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameLastNameLastNameLastNameLastName | test.automatemail |       | Partner Technical Administrator | Episodes, Reports, Physician Connect, Administration, Lessons | Episodes 2.0, TCI      |     | HZhmTBQzHtU1, Learning Pathway 2 | TeamHealth     | BPCI-Model2, BPCI-Model3 | 3056-q91--Rhea Medical Center, 3056-q91--The Medical Center At Franklin, 2070-g14--Baptist Medical Center  Beaches, 2070-g14--Mercy Hospital, 2070-g14--North Shore Med Center | No               |                |           |            | No               |                |           |            |

  Scenario Outline: <Description>
    Given I am on mail login page
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I click on delete icon in mail
    Then I signout from mail account
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
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
    Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations for PTA user
    Then I click on Submit button for "<User>"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Given I am on the login page
    Then I click on "Log Out" button again
    Given I am on mail login page
    Then I enter password "Intel@01" to login mail account
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
    And I enter new password "Testing1" to set new password
    And I enter confirm new password "Testing1" to set new password
    And I click on submit button to set new password

    Examples: 
      | Description                                                                                         | User                            | FirstName                                 | LastName                                 | Email             | Phone      | Role                      | Applications                         | ApplicationsNotVisible                               | NPI | LearningPathwaySearchParameter                                                                                     | Health System1 | Programs1                | Locations1                                                                                                | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Executive role                 | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | test.automatemail | 9988776655 | Executive                 | Episodes                             | Episodes 2.0, Administration, Physician Connect, TCI |     | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2 | TeamHealth     | BPCI-Model2              | 2070-g14--North Shore Med Center                                                                          |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Manager role                   | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | test.automatemail |            | Manager                   | Episodes, Reports                    | Episodes 2.0, Administration, Physician Connect, TCI |     | p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81, n9yn5n0Qa581                                                             | TeamHealth     | BPCI-Model2              | All Locations                                                                                             |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Case Manager role              | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | test.automatemail |            | Case Manager              | Episodes, Lessons                    | Episodes 2.0, Administration, Physician Connect, TCI |     | Care Coordination External                                                                                         | TeamHealth     | BPCI-Model2, BPCI-Model3 | All Locations                                                                                             |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Physicians role                | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | test.automatemail | 9988776655 | Physicians                | Episodes, Reports, Physician Connect | Episodes 2.0, Administration, TCI                    | NPI | p11D0Vl2FSg1, Executive Acute Care Hospital Model 2                                                                | TeamHealth     | BPCI-Model2, BPCI-Model3 | 2070-g14--North Shore Med Center, 3056-q91--Rhea Medical Center, 3056-q91--The Medical Center At Franklin |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Transitional Case Manager role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | test.automatemail | 9988776655 | Transitional Case Manager | Reports                              | Episodes 2.0,Administration, Physician Connect, TCI  |     | 5HDc3E6aK_E1, p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81                                                             | TeamHealth     | BPCI-Model2, BPCI-Model3 | 2070-g14--Baptist Medical Center  Beaches, 2070-g14--Mercy Hospital, 2070-g14--North Shore Med Center     |                  |                |           |            |                  |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
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
      | Description                                                                          | User                            | FirstName                                 | LastName                                 | Role                      | Applications           | ApplicationsNotVisible                                             | Roletext       | ReportCategory | ReportName         | BPID | LearningPathway                                                                                                                                           | Facilities                                                                                                                   |
      | Login with Executive and verify Product Tiles and their redirections                 | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | Executive                 | Episodes, TCI          | Episodes 2.0, Reports, Lessons, Administration, Physician Connect  | ROLE_PRM       | Patient ID     | Episode DRG Issues |      | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                        | North Shore Med Center                                                                                                       |
      | Login with Manager and verify Product Tiles and their redirections                   | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | Manager                   | Episodes, Reports, TCI | Episodes 2.0, Administration, Physician Connect, Lessons           | ROLE_PRM       | Patient ID     | Episode DRG Issues |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University          | North Shore Med Center, Mercy Hospital, Baptist Medical Center  Beaches                                                      |
      | Login with Case Manager and verify Product Tiles and their redirections              | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | Case Manager              | Episodes, TCI          | Episodes 2.0, Administration, Physician Connect, Reports           | ROLE_TCS       | Patient ID     | Episode DRG Issues |      | Care Coordination External                                                                                                                                | North Shore Med Center, Mercy Hospital, Baptist Medical Center  Beaches, The Medical Center At Franklin, Rhea Medical Center |
      | Login with Physicians and verify Product Tiles and their redirections                | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | Physicians                | Episodes, Reports, TCI | Episodes 2.0, Administration, Lessons                              | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                                                    | North Shore Med Center, Rhea Medical Center, The Medical Center At Franklin                                                  |
      | Login with Transitional Case Manager and verify Product Tiles and their redirections | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | Transitional Case Manager | Reports, TCI           | Episodes, Episodes 2.0, Administration, Physician Connect, Lessons | ROLE_TCS       | Patient ID     | Episode DRG Issues |      | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | Baptist Medical Center  Beaches, Mercy Hospital, North Shore Med Center                                                      |

  Scenario Outline: Validating that Locations for the unselected Model are removed on view and edit user page
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
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
    Then I deselect "<RemovePrograms>" programs
    And I verify that "<RemovePrograms>" is not reflected as selected in edit user page
    Then I search the "<Locations>" in the Selected Locations section
    Then I verify No results found for invalid Location for "first" organisation
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify location "<LocationsValidation>" is not present on view page

    Examples: 
      | User                            | Role       | Health System | RemovePrograms | Locations                        | LocationsValidation                          |
      | Partner Technical Administrator | Physicians | TeamHealth    | BPCI-Model2    | 2070-g14--North Shore Med Center | TeamHealth--2070-g14--North Shore Med Center |

  Scenario Outline: <Description>
    Given I am on mail login page
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I click on delete icon in mail
    Then I signout from mail account
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
    Then I enter password "Intel@01" to login mail account
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
    And I enter new password "Testing1" to set new password
    And I enter confirm new password "Testing1" to set new password
    And I click on submit button to set new password

    Examples: 
      | Description                                                                           | User        | UserName                               | Password | FirstName | LastName                                 | Email             | Phone | Role                            | Applications                                                  | ApplicationsNotVisible | NPI | LearningPathwaySearchParameter   | Health System1 | Programs1   | Locations1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Partner Technical Administrator role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameLastNameLastNameLastNameLastName | test.automatemail |       | Partner Technical Administrator | Episodes, Reports, Physician Connect, Administration, Lessons | Episodes 2.0, TCI      |     | HZhmTBQzHtU1, Learning Pathway 2 | Covenant       | BPCI-Model3 | 3056-804--Catered Manor Nursing Center, 3056-805--Downey Care Center, 3056-806--Encinitas Nursing And Rehabilitation Center, 3056-808--Arbor Nursing Center, 3056-809--Courtyard Health Care Center, 3056-810--Emerald Gardens Nursing Center, 3056-811--Buena Vista Care Center, 3056-812--Gilroy Healthcare And Rehabilitation Center, 3056-813--Eagle Point Nursing & Rehabilitation Center, 3056-814--Cedar Ridge Health Rehab Center, 3056-815--Ennoble Skilled Nursing And Rehabilitation Center, 3056-816--Friendship Skilled Nursing & Rehabilitation Center, 3056-817--Covington Manor Health And  Rehabilitation Center, 3056-818--Clinton House Health And Rehab Center, 3056-819--Edgewood Manor Nursing Center, 3056-820--Fairview Skilled Nursing And Rehabilitation Center, 3056-i37--Pacific Coast Manor, 3056-i38--Sunrise Skilled Nursing & Rehabilitation Center, 3056-i39--Pyramid Point Post-acute Rehabilitation Center, 3056-i40--Hilltop Skilled Nursing, 3056-i41--Mccormick's Creek, 3056-i42--Palo Alto Sub-acute, 3056-i43--Meadow Manor, 3056-i44--Villa Georgetown, 3056-i45--Highland Health | No               |                |           |            | No               |                |           |            |

  Scenario Outline: Error should not be shown on creating a user with both apostrophe(') and underscore(_) in email id, having lessons enabled
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    Then I enter Email "<Email>" with apostrophe and underscore to Create user
    And I enter Phone field with <Phone>
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I verify Learning Pathway search box is available
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I verify the header "Permissions"
    #Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations for PTA user
    Then I click on Submit button
    Then I should see header text "Users"

    Examples: 
      | User                            | FirstName                            | LastName                                 | Email             | Phone | Role       | Applications | NPI | LearningPathwaySearchParameter | Health System1 | Programs1   | Locations1                             |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastNameLastNameLastNameLastNameLastName | test.automatemail |       | Physicians | Lessons      | NPI | Care Coordination External     | Covenant       | BPCI-Model3 | 3056-809--Courtyard Health Care Center |

  Scenario Outline: <Description>
    Given I am on mail login page
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I click on delete icon in mail
    Then I signout from mail account
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
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
    Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations for PTA user
    Then I click on Submit button for "<User>"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Given I am on the login page
    Then I click on "Log Out" button again
    Given I am on mail login page
    Then I enter password "Intel@01" to login mail account
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
    And I enter new password "Testing1" to set new password
    And I enter confirm new password "Testing1" to set new password
    And I click on submit button to set new password

    Examples: 
      | Description                                                                                         | User                            | FirstName                                 | LastName                                 | Email             | Phone      | Role                      | Applications                                  | ApplicationsNotVisible                               | NPI | LearningPathwaySearchParameter                                                                                     | Health System1 | Programs1   | Locations1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Executive role                 | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | test.automatemail | 9988776655 | Executive                 | Episodes, Reports, Lessons                    | Episodes 2.0, Administration, Physician Connect, TCI |     | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2 | Covenant       | BPCI-Model3 | 3056-804--Catered Manor Nursing Center, 3056-805--Downey Care Center, 3056-806--Encinitas Nursing And Rehabilitation Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Manager role                   | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | test.automatemail |            | Manager                   | Episodes, Reports, Lessons                    | Episodes 2.0, Administration, Physician Connect, TCI |     | p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81, n9yn5n0Qa581                                                             | Covenant       | BPCI-Model3 | 3056-808--Arbor Nursing Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Case Manager role              | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | test.automatemail |            | Case Manager              | Episodes, Reports, Lessons                    | Episodes 2.0, Administration, Physician Connect, TCI |     | Care Coordination External                                                                                         | Covenant       | BPCI-Model3 | 3056-809--Courtyard Health Care Center, 3056-810--Emerald Gardens Nursing Center, 3056-811--Buena Vista Care Center, 3056-812--Gilroy Healthcare And Rehabilitation Center, 3056-813--Eagle Point Nursing & Rehabilitation Center, 3056-814--Cedar Ridge Health Rehab Center, 3056-815--Ennoble Skilled Nursing And Rehabilitation Center, 3056-816--Friendship Skilled Nursing & Rehabilitation Center, 3056-817--Covington Manor Health And  Rehabilitation Center, 3056-818--Clinton House Health And Rehab Center, 3056-819--Edgewood Manor Nursing Center, 3056-820--Fairview Skilled Nursing And Rehabilitation Center |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Physicians role                | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | test.automatemail | 9988776655 | Physicians                | Episodes, Reports, Physician Connect, Lessons | Episodes 2.0, Administration, TCI                    | NPI | p11D0Vl2FSg1, Executive Acute Care Hospital Model 2                                                                | Covenant       | BPCI-Model3 | 3056-i37--Pacific Coast Manor, 3056-i38--Sunrise Skilled Nursing & Rehabilitation Center, 3056-i39--Pyramid Point Post, 3056-i40--Hilltop Skilled Nursing, 3056-i41--Mccormick                                                                                                                                                                                                                                                                                                                                                                                                                                               |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Transitional Case Manager role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | test.automatemail | 9988776655 | Transitional Case Manager | Episodes, Reports, Lessons                    | Episodes 2.0, Administration, Physician Connect, TCI |     | 5HDc3E6aK_E1, p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81                                                             | Covenant       | BPCI-Model3 | 3056-i42--Palo Alto Sub, 3056-i43--Meadow Manor, 3056-i44--Villa Georgetown, 3056-i45--Highland Health                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |                  |                |           |            |                  |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
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
      | Description                                                                          | User                            | FirstName                                 | LastName                                 | Role                      | Applications                    | ApplicationsNotVisible                          | Roletext       | ReportCategory | ReportName                   | BPID | LearningPathway                                                                                                                                           | Facilities                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
      | Login with Executive and verify Product Tiles and their redirections                 | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | Executive                 | Episodes, Reports, TCI, Lessons | Episodes 2.0, Administration, Physician Connect | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                        | Catered Manor Nursing Center, Downey Care Center, Encinitas Nursing and Rehabilitation Center                                                                                                                                                                                                                                                                                                                                                                                                        |
      | Login with Manager and verify Product Tiles and their redirections                   | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | Manager                   | Episodes, Reports, TCI, Lessons | Episodes 2.0, Administration, Physician Connect | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University          | Arbor Nursing Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
      | Login with Case Manager and verify Product Tiles and their redirections              | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | Case Manager              | Episodes, Reports, TCI, Lessons | Episodes 2.0, Administration, Physician Connect | ROLE_TCS       | Patient ID     | Episode DRG Issues [Model 3] |      | Care Coordination External                                                                                                                                | Courtyard Health Care Center, Emerald Gardens Nursing Center, Buena Vista Care Center, Gilroy Healthcare and Rehabilitation Center, Eagle Point Nursing & Rehabilitation Center, Cedar Ridge Health Rehab Center, Ennoble Skilled Nursing and Rehabilitation Center, Friendship Skilled Nursing & Rehabilitation Center, Covington Manor Health and  Rehabilitation Center, Clinton House Health and Rehab Center, Edgewood Manor Nursing Center, Fairview Skilled Nursing and Rehabilitation Center |
      | Login with Physicians and verify Product Tiles and their redirections                | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | Physicians                | Episodes, Reports, TCI, Lessons | Episodes 2.0, Administration                    | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues [Model 3] |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                                                    | Pacific Coast Manor, Sunrise Skilled Nursing & Rehabilitation Center, Pyramid Point Post-Acute Rehabilitation Center, Hilltop Skilled Nursing, McCormick's Creek                                                                                                                                                                                                                                                                                                                                     |
      | Login with Transitional Case Manager and verify Product Tiles and their redirections | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | Transitional Case Manager | Episodes, Reports, TCI, Lessons | Episodes 2.0, Administration, Physician Connect | ROLE_TCS       | Patient ID     | Episode DRG Issues [Model 3] |      | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | Palo Alto Sub-Acute, Meadow Manor, Villa Georgetown, Highland Health                                                                                                                                                                                                                                                                                                                                                                                                                                 |

  Scenario: Verify NPI on the EC1 tile
    Given I am on the login page
    When I enter email field qa.admin@yopmail.com for login
    And I enter password field Episode1! for Login
    And I click Access button
    And I click on Episode1 tile for "Partner Technical Administrator-Physicians" user
    And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "Partner Technical Administrator-Physicians" user
    And I verify NPI on ECI for "Partner Technical Administrator-Physicians" user

  Scenario Outline: <Description>
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
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
    And I switch the focus to Next button
    Then I verify the validation message "<ValidationMsg>" on Create User Page

    Examples: 
      | Description                                           | FirstName   | LastName    | Email             | Phone      | Role       | NPI        | ValidationMsg                     |
      | Verify validation message for blank First name        |             | Last Name   | test.automatemail | 9874563210 | Executive  |            | First Name is required            |
      | Verify validation message for blank Last name         | First Name  |             | test.automatemail | 9874563210 | Executive  |            | Last Name is required             |
      | Verify validation message for blank Email             | First Name  | Last Name   |                   | 9874563210 | Executive  |            | Email is required                 |
      | Verify validation message for blank NPI               | First Name  | Last Name   | test.automatemail | 9874563210 | Physicians |            | NPI is required                   |
      | Verify validation message for invalid Email           | First Name  | Last Name   | abc               | 9874563210 | Physicians | NPI        | Please enter a valid email        |
      | Verify validation message for invalid Phone           | First Name  | Last Name   | test.automatemail |     123564 | Physicians | NPI        | Please enter a valid phone number |
      | Verify validation message for NPI less than 10 digits | First Name  | Last Name   | test.automatemail | 9874563210 | Physicians |     123564 | Please enter a valid NPI          |
      | Verify validation message for NPI as alphabets        | First Name  | Last Name   | test.automatemail | 9874563210 | Physicians | abcdefgihj | Please enter a valid NPI          |
      | Verify validation message for NPI as alphanumeric     | First Name  | Last Name   | test.automatemail | 9874563210 | Physicians | abcde12345 | Please enter a valid NPI          |
      | Verify validation message for invalid First Name      | 84738&27919 | Last Name   | test.automatemail | 9874563210 | Physicians | NPI        | Please enter a valid name         |
      | Verify validation message for invalid Last name       | First Name  | 847&3827919 | test.automatemail | 9874563210 | Physicians | NPI        | Please enter a valid name         |
      | Verify validation message for NPI as .                | First Name  | Last Name   | test.automatemail | 9874563210 | Physicians | .........1 | Please enter a valid NPI          |

  Scenario Outline: Verify validation message for invalid lesson name in search box
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "First Name"
    Then I fill in Last Name with Last Name
    And I enter Email "test.automatemail" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I click on Select button
    Then I verify Learning Pathway search box is available
    Then I enter "<LearningPathwayName>" in Learning Pathway search box
    And I verify No results found under Learning Pathway search box

    Examples: 
      | Role      | Applications               | LearningPathwayName |
      | Executive | Episodes, Reports, Lessons | Test123             |

  Scenario Outline: Verify auto selected programs in Organizations
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "FirstName"
    Then I fill in Last Name with LastName
    And I enter Email "test.automatemail" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I select "<Applications>" product
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I verify default program "BPCI-Model3" associated with organization

    Examples: 
      | Role      | Applications               | Health System |
      | Executive | Episodes, Reports, Lessons | Covenant      |

  Scenario: Verify the functionality of back/Cancel button and tabs on the left on create user page
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "First Name"
    Then I fill in Last Name with LastName
    And I enter Email "test.automatemail" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational Executive
    Then I click on Next button
    Then I verify the header "Applications"
    Then I click on "General Information" tab on the left
    Then I verify the header "General Information"
    Then I click on "Applications" tab on the left
    Then I verify the header "Applications"
    Then I select "Episodes, Reports" product
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
    Then I click on Select All Locations button
    Then I click on Cancel button
    Then I should see header text "Users"

  Scenario: Verify the functionality of Cross button on Permissions Tab on Create User page
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    And I fill in First Name with "First Name"
    Then I fill in Last Name with LastName
    And I enter Email "test.automatemail" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational Executive
    Then I click on Next button
    Then I verify the header "Applications"
    Then I select "Episodes, Reports" product
    Then I click on Next button
    Then I click on Cross button
    Then I should see header text "Users"

  Scenario Outline: Verify removal of role and changing of the role to see the impact in the available applications
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "FirstName"
    Then I fill in Last Name with LastName
    And I enter Email "test.automatemail" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational <Role1>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications1>" are unchecked
    Then I click on "General Information" tab on the left
    Then I verify the header "General Information"
    When I click the already selected Organizational Role Field
    Then I pick a Organizational <Role2>
    Then I enter NPI field with "<NPI>" for role "<Role2>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications2>" are unchecked

    Examples: 
      | Role1     | Applications1              | Role2      | Applications2                                 | NPI |
      | Executive | Episodes, Reports, Lessons | Physicians | Episodes, Reports, Physician Connect, Lessons | NPI |

  Scenario Outline: <Description>
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
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
    Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations for PTA user
    And I verify selected Location "<SelectedLocations>" in the selected Locations section
    Then I search the "<LocationsInvalid>" in the Selected Locations section
    And I verify No results found for invalid Location for "first" organisation
    Then I search the "<Locations1>" in the Selected Locations section
    And I click on remove link icon for selected Locations on selected Locations section
    And I verify Selected Locations section after click on remove link icon

    Examples: 
      | Description                                           | User                            | UserName                               | Password | FirstName                                          | LastName                                           | Email             | Phone | Role      | Applications               | ApplicationsNotVisible                               | NPI | LearningPathwaySearchParameter                                              | Health System1 | Programs1   | LocationsInvalid | Locations1                     | SelectedLocations    | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Verify the search functionality in selected locations | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastNameLastNameLN | test.automatemail |       | Executive | Episodes, Reports, Lessons | Episodes 2.0, Administration, Physician Connect, TCI |     | Care Coordination External, Clinical Operations Acute Care Hospital Model 2 | Covenant       | BPCI-Model3 | hjfd             | 3056-808--Arbor Nursing Center | Arbor Nursing Center | No               |                |           |            | No               |                |           |            |

  Scenario Outline: Verify that Next button and left side menu is enabled only when mandatory fields are selected
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    Then I verify that Next button is "disabled"
    Then I verify that "Applications" menu is "disabled"
    Then I verify that "Permissions" menu is "disabled"
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I enter Email "<Email>" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I verify that Next button is "enabled"
    Then I verify that "Applications" menu is "disabled"
    Then I verify that "Permissions" menu is "disabled"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify that "General Information" menu is "enabled"
    Then I verify that "Permissions" menu is "disabled"
    Then I verify that Next button is "disabled"
    Then I select "<Applications>" product
    Then I verify that Next button is "enabled"
    Then I click on Next button
    Then I verify that "General Information" menu is "enabled"
    Then I verify that "Permissions" menu is "enabled"
    Then I verify that Submit button is "disabled"
    Then I select location by BPID "<Locations_BPID>" for PTA
    Then I verify that Submit button is "enabled"

    Examples: 
      | FirstName  | LastName  | Email             | Role       | NPI | Applications | Locations_BPID                         |
      | First'Name | Last'Name | test.automatemail | Physicians | NPI | Reports      | 3056-804--Catered Manor Nursing Center |

  Scenario Outline: Enter invalid location and verify error message
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
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
    Then I select "<Applications>" product
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<invalidLocations>" invalid locations for PTA
    And I verify No results found for invalid Location for "first" organisation

    Examples: 
      | FirstName | LastName | Email             | Phone      | Role         | Applications | NPI | invalidLocations |
      | FirstName | LastName | test.automatemail | 9988776655 | Case Manager | Reports      |     | hkfj             |

  Scenario Outline: Creating user with existing NPI and validating error message
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
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
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I enter NPI field with existing NPI for "<User>-<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations for PTA user
    Then I click on Submit button to check for error message
    Then I should see error message for duplicate value "Account with this NPI already exists"

    Examples: 
      | User                            | FirstName | LastName | Email             | Role       | Applications | NPI | Programs    | Health System | Locations                      |
      | Partner Technical Administrator | FirstName | LastName | test.automatemail | Physicians | Reports      |     | BPCI-Model3 | Covenant      | 3056-808--Arbor Nursing Center |

  Scenario Outline: Creating user with existing Email and validating error message
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I enter existing Email to Create user for "<User>-<Role>"
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations for PTA user
    Then I click on Submit button to check for error message
    Then I should see error message for duplicate value "Account with this email already exists"

    Examples: 
      | User                            | FirstName | LastName | Email             | Role       | Applications | NPI | Programs    | Locations                      |
      | Partner Technical Administrator | FirstName | LastName | test.automatemail | Physicians | Reports      | NPI | BPCI-Model3 | 3056-808--Arbor Nursing Center |

  Scenario Outline: Verify that Only name is displayed for Learning Pathway ID's
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Applications" tab
    Then I verify the header "Applications"
    Then I verify that Learning Pathway ID "<LearningPathwayID>" is not displayed for the enabled Learning Pathway

    Examples: 
      | User                            | Role         | LearningPathwayID |
      | Partner Technical Administrator | Case Manager | 5HDc3E6aK_E1      |

  Scenario Outline: Validate character limit for all fields in the general information tab
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
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

    Examples: 
      | User                            | FirstName                                          | LastName                                           | Email                                                                        | Phone      | Role       | NPI        |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirstNameFirst | FirstNameFirstNameFirstNameFirstNameFirstNameFirst | TestmailTestmailTestmailTestmailTestmailTestmailTestmailTestmailAA@gmail.com | 9876759231 | Physicians | 1234567890 |

  Scenario: Validating correct Role for PTA user on general information section
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    When I click the Organizational Role Field
    Then I verify that roles are reflected as per the "Super Admin"
    Then I click on Cross button
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    When I click the Organizational Role Field
    Then I verify that roles are reflected as per the "PTA"

  Scenario Outline: validating Learning Pathway on edit role
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
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
    When I click the Organizational Role Field
    Then I pick a Organizational <Role1>
    Then I enter NPI field with "<NPI>" for role "<Role1>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I verify Learning Pathway search box is available
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Back button
    Then I verify the header "General Information"
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role2>
    Then I enter NPI field with "<NPI>" for role "<Role2>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify Learning Pathway search box is not available

    Examples: 
      | User                            | UserName                               | Password | FirstName | LastName | Email             | Role1      | Applications     | NPI | LearningPathwaySearchParameter                         | Role2     |
      | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastName | test.automatemail | Physicians | Reports, Lessons | NPI | p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81, n9yn5n0Qa581 | Executive |
