Feature: Create User - PTA User

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field <UserName> for login
    And I enter password field <Password> for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
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
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

    Examples: 
      | Description                                                                           | User        | UserName                               | Password | FirstName | LastName                                 | Email                           | Phone | Role                            | Applications                                                                           | ApplicationsNotVisible                                         | NPI | LearningPathwaySearchParameter   | Health System1           | Programs1 | Locations1                                                                                                                                                                                                          | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Partner Technical Administrator role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |       | Partner Technical Administrator | Episode Connect Classic, Reporting Classic, Physician Connect, Administration, Lessons | Episode Connect for Post-acute Care, Care Innovation Institute |     | HZhmTBQzHtU1, Learning Pathway 2 | RWJ Barnabas Health, INC | CJR       | CJR-10-6--Monmouth Medical Center - Southern Campus, CJR-10-1--Rwj University Hospital At New Brunswick, CJR-10-2--Rwj University Hospital At Somerset, CJR-10-3--Robert Wood Johnson University Hospital At Rahway | No               |                |           |            | No               |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
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
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

    Examples: 
      | Description                                                                                 | User                            | FirstName                            | LastName                                 | Email                           | Phone      | Role              | Applications                                        | ApplicationsNotVisible                                                                            | NPI | LearningPathwaySearchParameter                                                                                     | Health System1           | Programs1 | Locations1                                                                                              | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Leader role            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 | Leader            | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration, Physician Connect, Care Innovation Institute |     | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2 | RWJ Barnabas Health, INC | CJR       | CJR-10-6--Monmouth Medical Center - Southern Campus, CJR-10-1--Rwj University Hospital At New Brunswick |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Manager role           | Partner Technical Administrator | FirstName                            | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            | Manager           | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration, Physician Connect, Care Innovation Institute |     | p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81, n9yn5n0Qa581                                                             | RWJ Barnabas Health, INC | CJR       | CJR-10-6--Monmouth Medical Center - Southern Campus, CJR-10-1--Rwj University Hospital At New Brunswick |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Advanced Operator role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastName                                 | qaautomation@remedypartners.com |            | Advanced Operator | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration, Physician Connect, Care Innovation Institute |     | Care Coordination External                                                                                         | RWJ Barnabas Health, INC | CJR       | All Locations                                                                                           |                  |                |           |            |                  |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
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
      | Description                                                                  | User                            | FirstName                            | LastName                                 | Role              | Applications                                                                   | ApplicationsNotVisible                                                 | Roletext | ReportCategory | ReportName         | BPID | LearningPathway                                                                                                                                  | Facilities                                                                                                                                                                  |
      | Login with Leader and verify Product Tiles and their redirections            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastNameLastNameLastNameLastNameLastName | Leader            | Episode Connect Classic, Reporting Classic, Care Innovation Institute, Lessons | Episode Connect for Post-acute Care, Administration, Physician Connect | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                               | Monmouth Medical Center - Southern Campus, RWJ University Hospital at New Brunswick                                                                                         |
      | Login with Manager and verify Product Tiles and their redirections           | Partner Technical Administrator | FirstName                            | LastNameLastNameLastNameLastNameLastName | Manager           | Episode Connect Classic, Reporting Classic, Care Innovation Institute, Lessons | Episode Connect for Post-acute Care, Administration, Physician Connect | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | Monmouth Medical Center - Southern Campus, RWJ University Hospital at New Brunswick                                                                                         |
      | Login with Advanced Operator and verify Product Tiles and their redirections | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastName                                 | Advanced Operator | Episode Connect Classic, Reporting Classic, Care Innovation Institute, Lessons | Episode Connect for Post-acute Care, Administration, Physician Connect | ROLE_TCS | Patient ID     | Episode DRG Issues |      | Care Coordination External                                                                                                                       | Monmouth Medical Center - Southern Campus, RWJ University Hospital at New Brunswick, RWJ University Hospital at Somerset, Robert Wood Johnson University Hospital At Rahway |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field <UserName> for login
    And I enter password field <Password> for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
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
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

    Examples: 
      | Description                                                                           | User        | UserName                               | Password | FirstName | LastName                                 | Email                           | Phone | Role                            | Applications                                                                           | ApplicationsNotVisible                                         | NPI | LearningPathwaySearchParameter   | Health System1 | Programs1                  | Locations1                                                                                                                                                                     | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Partner Technical Administrator role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |       | Partner Technical Administrator | Episode Connect Classic, Reporting Classic, Physician Connect, Administration, Lessons | Episode Connect for Post-acute Care, Care Innovation Institute |     | HZhmTBQzHtU1, Learning Pathway 2 | TeamHealth     | BPCI Model 2, BPCI Model 3 | 3056-q91--Rhea Medical Center, 3056-q91--The Medical Center At Franklin, 2070-g14--Baptist Medical Center  Beaches, 2070-g14--Mercy Hospital, 2070-g14--North Shore Med Center | No               |                |           |            | No               |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
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
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

    Examples: 
      | Description                                                                                 | User                            | FirstName                                 | LastName                                 | Email                           | Phone      | Role              | Applications                                                  | ApplicationsNotVisible                                                                            | NPI | LearningPathwaySearchParameter                                                                                     | Health System1 | Programs1                  | Locations1                                                                                                | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Leader role            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 | Leader            | Episode Connect Classic                                       | Episode Connect for Post-acute Care, Administration, Physician Connect, Care Innovation Institute |     | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2 | TeamHealth     | BPCI Model 2               | 2070-g14--North Shore Med Center                                                                          |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Manager role           | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            | Manager           | Episode Connect Classic, Reporting Classic                    | Episode Connect for Post-acute Care, Administration, Physician Connect, Care Innovation Institute |     | p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81, n9yn5n0Qa581                                                             | TeamHealth     | BPCI Model 2               | All Locations                                                                                             |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Advanced Operator role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | qaautomation@remedypartners.com |            | Advanced Operator | Episode Connect Classic, Lessons                              | Episode Connect for Post-acute Care, Administration, Physician Connect, Care Innovation Institute |     | Care Coordination External                                                                                         | TeamHealth     | BPCI Model 2, BPCI Model 3 | All Locations                                                                                             |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Physicians role        | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 | Physicians        | Episode Connect Classic, Reporting Classic, Physician Connect | Episode Connect for Post-acute Care, Administration, Care Innovation Institute                    | NPI | p11D0Vl2FSg1, Executive Acute Care Hospital Model 2                                                                | TeamHealth     | BPCI Model 2, BPCI Model 3 | 2070-g14--North Shore Med Center, 3056-q91--Rhea Medical Center, 3056-q91--The Medical Center At Franklin |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Operator role          | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedypartners.com | 9988776655 | Operator          | Reporting Classic                                             | Episode Connect for Post-acute Care,Administration, Physician Connect, Care Innovation Institute  |     | 5HDc3E6aK_E1, p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81                                                             | TeamHealth     | BPCI Model 2, BPCI Model 3 | 2070-g14--Baptist Medical Center  Beaches, 2070-g14--Mercy Hospital, 2070-g14--North Shore Med Center     |                  |                |           |            |                  |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
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
      | Description                                                                  | User                            | FirstName                                 | LastName                                 | Role              | Applications                                                          | ApplicationsNotVisible                                                                                   | Roletext       | ReportCategory | ReportName         | BPID | LearningPathway                                                                                                                                           | Facilities                                                                                                                   |
      | Login with Leader and verify Product Tiles and their redirections            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | Leader            | Episode Connect Classic, Care Innovation Institute                    | Episode Connect for Post-acute Care, Reporting Classic, Lessons, Administration, Physician Connect       | ROLE_PRM       | Patient ID     | Episode DRG Issues |      | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                        | North Shore Med Center                                                                                                       |
      | Login with Manager and verify Product Tiles and their redirections           | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | Manager           | Episode Connect Classic, Reporting Classic, Care Innovation Institute | Episode Connect for Post-acute Care, Administration, Physician Connect, Lessons                          | ROLE_PRM       | Patient ID     | Episode DRG Issues |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University          | North Shore Med Center, Mercy Hospital, Baptist Medical Center  Beaches                                                      |
      | Login with Advanced Operator and verify Product Tiles and their redirections | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | Advanced Operator | Episode Connect Classic, Care Innovation Institute                    | Episode Connect for Post-acute Care, Administration, Physician Connect, Reporting Classic                | ROLE_TCS       | Patient ID     | Episode DRG Issues |      | Care Coordination External                                                                                                                                | North Shore Med Center, Mercy Hospital, Baptist Medical Center  Beaches, The Medical Center At Franklin, Rhea Medical Center |
      | Login with Physicians and verify Product Tiles and their redirections        | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | Physicians        | Episode Connect Classic, Reporting Classic, Care Innovation Institute | Episode Connect for Post-acute Care, Administration, Lessons                                             | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                                                    | North Shore Med Center, Rhea Medical Center, The Medical Center At Franklin                                                  |
      | Login with Operator and verify Product Tiles and their redirections          | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | Operator          | Reporting Classic, Care Innovation Institute                          | Episode Connect Classic, Episode Connect for Post-acute Care, Administration, Physician Connect, Lessons | ROLE_TCS       | Patient ID     | Episode DRG Issues |      | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | Baptist Medical Center  Beaches, Mercy Hospital, North Shore Med Center                                                      |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field <UserName> for login
    And I enter password field <Password> for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
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
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

    Examples: 
      | Description                                                                           | User        | UserName                               | Password | FirstName | LastName                                 | Email                           | Phone | Role                            | Applications                                                                           | ApplicationsNotVisible                                         | NPI | LearningPathwaySearchParameter   | Health System1 | Programs1    | Locations1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Partner Technical Administrator role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |       | Partner Technical Administrator | Episode Connect Classic, Reporting Classic, Physician Connect, Administration, Lessons | Episode Connect for Post-acute Care, Care Innovation Institute |     | HZhmTBQzHtU1, Learning Pathway 2 | Covenant       | BPCI Model 3 | 3056-804--Catered Manor Nursing Center, 3056-805--Downey Care Center, 3056-806--Encinitas Nursing And Rehabilitation Center, 3056-808--Arbor Nursing Center, 3056-809--Courtyard Health Care Center, 3056-810--Emerald Gardens Nursing Center, 3056-811--Buena Vista Care Center, 3056-812--Gilroy Healthcare And Rehabilitation Center, 3056-813--Eagle Point Nursing & Rehabilitation Center, 3056-814--Cedar Ridge Health Rehab Center, 3056-815--Ennoble Skilled Nursing And Rehabilitation Center, 3056-816--Friendship Skilled Nursing & Rehabilitation Center, 3056-817--Covington Manor Health And  Rehabilitation Center, 3056-818--Clinton House Health And Rehab Center, 3056-819--Edgewood Manor Nursing Center, 3056-820--Fairview Skilled Nursing And Rehabilitation Center, 3056-i37--Pacific Coast Manor, 3056-i38--Sunrise Skilled Nursing & Rehabilitation Center, 3056-i39--Pyramid Point Post-acute Rehabilitation Center, 3056-i40--Hilltop Skilled Nursing, 3056-i41--Mccormick's Creek, 3056-i42--Palo Alto Sub-acute, 3056-i43--Meadow Manor, 3056-i44--Villa Georgetown, 3056-i45--Highland Health | No               |                |           |            | No               |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
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
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

    Examples: 
      | Description                                                                                 | User                            | FirstName                                 | LastName                                 | Email                           | Phone      | Role              | Applications                                                           | ApplicationsNotVisible                                                                            | NPI | LearningPathwaySearchParameter                                                                                     | Health System1 | Programs1    | Locations1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Partner Technical Administrator User and create user with Leader role            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 | Leader            | Episode Connect Classic, Reporting Classic, Lessons                    | Episode Connect for Post-acute Care, Administration, Physician Connect, Care Innovation Institute |     | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2 | Covenant       | BPCI Model 3 | 3056-804--Catered Manor Nursing Center, 3056-805--Downey Care Center, 3056-806--Encinitas Nursing And Rehabilitation Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Manager role           | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            | Manager           | Episode Connect Classic, Reporting Classic, Lessons                    | Episode Connect for Post-acute Care, Administration, Physician Connect, Care Innovation Institute |     | p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81, n9yn5n0Qa581                                                             | Covenant       | BPCI Model 3 | 3056-808--Arbor Nursing Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Advanced Operator role | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | qaautomation@remedypartners.com |            | Advanced Operator | Episode Connect Classic, Reporting Classic, Lessons                    | Episode Connect for Post-acute Care, Administration, Physician Connect, Care Innovation Institute |     | Care Coordination External                                                                                         | Covenant       | BPCI Model 3 | 3056-809--Courtyard Health Care Center, 3056-810--Emerald Gardens Nursing Center, 3056-811--Buena Vista Care Center, 3056-812--Gilroy Healthcare And Rehabilitation Center, 3056-813--Eagle Point Nursing & Rehabilitation Center, 3056-814--Cedar Ridge Health Rehab Center, 3056-815--Ennoble Skilled Nursing And Rehabilitation Center, 3056-816--Friendship Skilled Nursing & Rehabilitation Center, 3056-817--Covington Manor Health And  Rehabilitation Center, 3056-818--Clinton House Health And Rehab Center, 3056-819--Edgewood Manor Nursing Center, 3056-820--Fairview Skilled Nursing And Rehabilitation Center |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Physicians role        | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 | Physicians        | Episode Connect Classic, Reporting Classic, Physician Connect, Lessons | Episode Connect for Post-acute Care, Administration, Care Innovation Institute                    | NPI | p11D0Vl2FSg1, Executive Acute Care Hospital Model 2                                                                | Covenant       | BPCI Model 3 | 3056-i37--Pacific Coast Manor, 3056-i38--Sunrise Skilled Nursing & Rehabilitation Center, 3056-i39--Pyramid Point Post, 3056-i40--Hilltop Skilled Nursing, 3056-i41--Mccormick                                                                                                                                                                                                                                                                                                                                                                                                                                               |                  |                |           |            |                  |                |           |            |
      | Login with Partner Technical Administrator User and create user with Operator role          | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedypartners.com | 9988776655 | Operator          | Episode Connect Classic, Reporting Classic, Lessons                    | Episode Connect for Post-acute Care, Administration, Physician Connect, Care Innovation Institute |     | 5HDc3E6aK_E1, p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81                                                             | Covenant       | BPCI Model 3 | 3056-i42--Palo Alto Sub, 3056-i43--Meadow Manor, 3056-i44--Villa Georgetown, 3056-i45--Highland Health                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |                  |                |           |            |                  |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
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
      | Description                                                                  | User                            | FirstName                                 | LastName                                 | Role              | Applications                                                                   | ApplicationsNotVisible                                                 | Roletext       | ReportCategory | ReportName                   | BPID | LearningPathway                                                                                                                                           | Facilities                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | Login with Leader and verify Product Tiles and their redirections            | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | Leader            | Episode Connect Classic, Reporting Classic, Care Innovation Institute, Lessons | Episode Connect for Post-acute Care, Administration, Physician Connect | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                        | Catered Manor Nursing Center, Downey Care Center, Encinitas Nursing and Rehabilitation Center                                                                                                                                                                                                                                                                                                                                                                                                       |
      | Login with Manager and verify Product Tiles and their redirections           | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | Manager           | Episode Connect Classic, Reporting Classic, Care Innovation Institute, Lessons | Episode Connect for Post-acute Care, Administration, Physician Connect | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University          | Arbor Nursing Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | Login with Advanced Operator and verify Product Tiles and their redirections | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | Advanced Operator | Episode Connect Classic, Reporting Classic, Care Innovation Institute, Lessons | Episode Connect for Post-acute Care, Administration, Physician Connect | ROLE_TCS       | Patient ID     | Episode DRG Issues [Model 3] |      | Care Coordination External                                                                                                                                | Courtyard Health Care Center, Emerald Gardens Nursing Center, Buena Vista Care Center, Gilroy Healthcare and Rehabilitation Center, Eagle Point Nursing & Rehabilitation Center, Cedar Ridge Health Rehab Center, Ennoble Skilled Nursing and Rehabilitation Center, Friendship Skilled Nursing & Rehabilitation Center, Covington Manor Health and Rehabilitation Center, Clinton House Health and Rehab Center, Edgewood Manor Nursing Center, Fairview Skilled Nursing and Rehabilitation Center |
      | Login with Physicians and verify Product Tiles and their redirections        | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | Physicians        | Episode Connect Classic, Reporting Classic, Care Innovation Institute, Lessons | Episode Connect for Post-acute Care, Administration                    | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues [Model 3] |      | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                                                    | Pacific Coast Manor, Sunrise Skilled Nursing & Rehabilitation Center, Pyramid Point Post-Acute Rehabilitation Center, Hilltop Skilled Nursing, McCormick's Creek                                                                                                                                                                                                                                                                                                                                    |
      | Login with Operator and verify Product Tiles and their redirections          | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | Operator          | Episode Connect Classic, Reporting Classic, Care Innovation Institute, Lessons | Episode Connect for Post-acute Care, Administration, Physician Connect | ROLE_TCS       | Patient ID     | Episode DRG Issues [Model 3] |      | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | Palo Alto Sub-Acute, Meadow Manor, Villa Georgetown, Highland Health                                                                                                                                                                                                                                                                                                                                                                                                                                |

  Scenario: Verify NPI on the EC1 tile
    Given I am on the login page
    When I enter email field qa.admin@yopmail.com for login
    And I enter password field Episode1! for Login
    And I click Access button
    And I click on Episode1 tile for "Partner Technical Administrator-Physicians" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "Partner Technical Administrator-Physicians" user
    And I verify NPI on ECI for "Partner Technical Administrator-Physicians" user
