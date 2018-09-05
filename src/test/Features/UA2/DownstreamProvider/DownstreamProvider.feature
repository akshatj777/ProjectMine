Feature: Create Downstream Provider user from Super Admin and Validate the user profile page

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
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Locations>" locations for Downstream Provider role
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
      | Description                                                               | User        | UserName                               | Password | FirstName                                 | LastName | Email                           | Phone      | Role                | Applications            | ApplicationsNotVisible                                                | NPI | LearningPathwaySearchParameter                                          | Locations                                                                                   | HasHealthSystem1 | Health System1 | Programs1 | Locations1 | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Downstream Provider role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedypartners.com | 9988776655 | Downstream Provider | Episode Connect Classic | Administration, Care Innovation Institute, Reporting Classic, Lessons |     | HZhmTBQzHtU1, NFdw0Kts2C01, 3hSOHNAnvjc1, max-test-052417, n9yn5n0Qa581 | 345454, Coosa valley health care, Alaris Health at Jersey City, Abbeville General Hospital  | No               |                |           |            | No               |                |           |            | No               |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify All Users button
    Then I click on All Users button
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify Edit Icon
    Then I click on Edit Icon
    Then I verify Delete User button
    Then I click on cross button on Edit User Page
    Then I verify Lock/Unlock Icon
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify email "<Email>" for "<User>-<Role>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"

    Examples: 
      | Description                                                 | User        | UserName                               | Password | FirstName                                 | LastName | Phone        | Role                | ApplicationsEnabled     | ApplicationsNotVisible                                                | NPI | LearningPathway | HealthSystem                       | Programs                                                    | Locations                                                                                                                                                                                                                                                                                                                                                                        |
      | View Downstream Provider user created from Super Admin user | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | 998-877-6655 | Downstream Provider | Episode Connect Classic | Administration, Care Innovation Institute, Reporting Classic, Lessons |     |                 | Healthsystem - Downstream Provider | Healthsystem - Downstream Provider--Downstream Organization | Healthsystem - Downstream Provider--DOWN-ORG--555469, Healthsystem - Downstream Provider--DOWN-ORG--345454, Healthsystem - Downstream Provider--DOWN-ORG--5 Star Home Care Llc, Healthsystem - Downstream Provider--DOWN-ORG--3 Angels Home Health, Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653 |

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
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
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
      | Description                                                                    | User        | FirstName                                 | LastName | Role                | Applications                                       | ApplicationsNotVisible                                                          | Roletext | ReportCategory | ReportName                   | BPID | LearningPathway                                                                               | Facilities                                                                                                                                                                       |
      | Login with DownStream Provider and verify Product Tiles and their redirections | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName | Downstream Provider | Episode Connect Classic, Care Innovation Institute | Episode Connect for Post-acute Care, Administration, Lessons, Reporting Classic | ROLE_SNF | Patient ID     | Episode DRG Issues [Model 3] |      | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Remedy University | woodruff Community Hospital, Litchford Falls Nursing & Rehabilitation Center, 5 Star Home Care Llc, 3 Angels Home Health, Coosa valley health care, Alaris Health at Jersey City |

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
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Locations>" locations for Downstream Provider role
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
      | Description                                                               | User        | UserName                               | Password | FirstName                                 | LastName | Email                           | Phone      | Role                | Applications                        | ApplicationsNotVisible                                                | NPI | LearningPathwaySearchParameter                                          | Locations                                                                                    | HasHealthSystem1 | Health System1 | Programs1 | Locations1 | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Downstream Provider role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedypartners.com | 9988776655 | Downstream Provider | Episode Connect for Post-acute Care | Administration, Care Innovation Institute, Reporting Classic, Lessons |     | HZhmTBQzHtU1, NFdw0Kts2C01, 3hSOHNAnvjc1, max-test-052417, n9yn5n0Qa581 | 555469, 345454, 5 Star Home Care Llc, 3 Angels Home Health, Coosa Valley Health Care, 020653 | No               |                |           |            | No               |                |           |            | No               |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify All Users button
    Then I click on All Users button
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify Edit Icon
    Then I click on Edit Icon
    Then I verify Delete User button
    Then I click on cross button on Edit User Page
    Then I verify Lock/Unlock Icon
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify email "<Email>" for "<User>-<Role>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"

    Examples: 
      | Description                                                 | User        | UserName                               | Password | FirstName                                 | LastName | Phone        | Role                | ApplicationsEnabled                 | ApplicationsNotVisible                                                | NPI | LearningPathway | HealthSystem                       | Programs                                                    | Locations                                                                                                                                                                                                                                                                                                                                                                        |
      | View Downstream Provider user created from Super Admin user | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | 998-877-6655 | Downstream Provider | Episode Connect for Post-acute Care | Administration, Care Innovation Institute, Reporting Classic, Lessons |     |                 | Healthsystem - Downstream Provider | Healthsystem - Downstream Provider--Downstream Organization | Healthsystem - Downstream Provider--DOWN-ORG--555469, Healthsystem - Downstream Provider--DOWN-ORG--345454, Healthsystem - Downstream Provider--DOWN-ORG--5 Star Home Care Llc, Healthsystem - Downstream Provider--DOWN-ORG--3 Angels Home Health, Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653 |

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
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
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
      | Description                                                                    | User        | FirstName                                 | LastName | Role                | Applications                                                   | ApplicationsNotVisible                                              | Roletext | ReportCategory | ReportName                   | BPID | LearningPathway                                                                               | Facilities                                                                                                                                                                       |
      | Login with DownStream Provider and verify Product Tiles and their redirections | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName | Downstream Provider | Episode Connect for Post-acute Care, Care Innovation Institute | Episode Connect Classic, Administration, Lessons, Reporting Classic | ROLE_SNF | Patient ID     | Episode DRG Issues [Model 3] |      | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Remedy University | woodruff Community Hospital, Litchford Falls Nursing & Rehabilitation Center, 5 Star Home Care Llc, 3 Angels Home Health, Coosa valley health care, Alaris Health at Jersey City |

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
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Locations>" locations for Downstream Provider role
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
      | Description                                                               | User        | UserName                               | Password | FirstName                                 | LastName | Email                           | Phone      | Role                | Applications                                                 | ApplicationsNotVisible                                                | NPI | LearningPathwaySearchParameter                                          | Locations                                                                                    | HasHealthSystem1 | Health System1 | Programs1 | Locations1 | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Downstream Provider role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedypartners.com | 9988776655 | Downstream Provider | Episode Connect Classic, Episode Connect for Post-acute Care | Administration, Care Innovation Institute, Reporting Classic, Lessons |     | HZhmTBQzHtU1, NFdw0Kts2C01, 3hSOHNAnvjc1, max-test-052417, n9yn5n0Qa581 | 555469, 345454, 5 Star Home Care Llc, 3 Angels Home Health, Coosa Valley Health Care, 020653 | No               |                |           |            | No               |                |           |            | No               |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify All Users button
    Then I click on All Users button
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify Edit Icon
    Then I click on Edit Icon
    Then I verify Delete User button
    Then I click on cross button on Edit User Page
    Then I verify Lock/Unlock Icon
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify email "<Email>" for "<User>-<Role>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"

    Examples: 
      | Description                                                 | User        | UserName                               | Password | FirstName                                 | LastName | Phone        | Role                | ApplicationsEnabled                                          | ApplicationsNotVisible                                                | NPI | LearningPathway | HealthSystem                       | Programs                                                    | Locations                                                                                                                                                                                                                                                                                                                                                                        |
      | View Downstream Provider user created from Super Admin user | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | 998-877-6655 | Downstream Provider | Episode Connect Classic, Episode Connect for Post-acute Care | Administration, Care Innovation Institute, Reporting Classic, Lessons |     |                 | Healthsystem - Downstream Provider | Healthsystem - Downstream Provider--Downstream Organization | Healthsystem - Downstream Provider--DOWN-ORG--555469, Healthsystem - Downstream Provider--DOWN-ORG--345454, Healthsystem - Downstream Provider--DOWN-ORG--5 Star Home Care Llc, Healthsystem - Downstream Provider--DOWN-ORG--3 Angels Home Health, Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care, Healthsystem - Downstream Provider--DOWN-ORG--020653 |

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
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
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
      | Description                                                                    | User        | FirstName                                 | LastName | Role                | Applications                                                                            | ApplicationsNotVisible                     | Roletext | ReportCategory | ReportName                   | BPID | LearningPathway                                                                               | Facilities                                                                                                                                                                       |
      | Login with DownStream Provider and verify Product Tiles and their redirections | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName | Downstream Provider | Episode Connect Classic, Episode Connect for Post-acute Care, Care Innovation Institute | Administration, Lessons, Reporting Classic | ROLE_SNF | Patient ID     | Episode DRG Issues [Model 3] |      | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Remedy University | woodruff Community Hospital, Litchford Falls Nursing & Rehabilitation Center, 5 Star Home Care Llc, 3 Angels Home Health, Coosa valley health care, Alaris Health at Jersey City |

  Scenario Outline: Validating that Error is getting displayed on searching any downstream provider location less than 5 alphabets and clicking on pagination on creating and editing Downstream Provider role
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
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I search "<Loc>" locations for Downstream Provider role
    Then I click on > to navigate to next page while "creating" the user
    Then I should not see any error message on searching any downstream provider location less than 5 alphabets
    Then I select "<Locations>" locations for Downstream Provider role
    Then I click on Submit button for "<User>"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify Edit Icon
    Then I click on Edit Icon
    Then I select "Permissions" tab
    Then I search "<Loc>" locations for Downstream Provider role
    Then I click on > to navigate to next page while "editing" the user
    Then I should not see any error message on searching any downstream provider location less than 5 alphabets

    Examples: 
      | Description                                                               | User        | UserName                               | Password | FirstName                                 | LastName | Email                           | Role                | Applications            | ApplicationsNotVisible                                                | NPI | LearningPathwaySearchParameter | Loc | Locations            |
      | Login with Super Admin User and create user with Downstream Provider role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedypartners.com | Downstream Provider | Episode Connect Classic | Administration, Care Innovation Institute, Reporting Classic, Lessons |     |                                | Bap | 5 Star Home Care Llc |

  Scenario Outline: Validating Cross(X) icon for Downstream Provider role
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
    Then I click on Next button
    Then I verify the header "Applications"
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Locations>" locations for Downstream Provider role
    Then I click on Cross button
    Then I should see header text "Users"

    Examples: 
      | User        | UserName                               | Password | FirstName                                 | LastName | Email                           | Phone      | Role                | Applications            | NPI | Locations                                      |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | qaautomation@remedypartners.com | 9988776655 | Downstream Provider | Episode Connect Classic |     | 3 Angels Home Health, Coosa Valley Health Care |
