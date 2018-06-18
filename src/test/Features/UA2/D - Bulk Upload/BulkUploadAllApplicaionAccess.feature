Feature: Bulk Upload User from SA

  Scenario Outline: Create DP user with <Description>
    #Given I am on mail login page
    #Then I enter username "qaautomation@remedypartners.com" to login mail account for bulk delete
    #Then I enter password "1Welcome2" to login mail account
    #Then I click on Mail icon in my account
    #Then I click on Inbox in mail
    #Then I click on delete icon in mail
    #Then I signout from mail account
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data with full application access for "<RoleModel>"
    Then I click on submit button on bulk user upload page
    Then I verify "1 user added" message
    Then I verify availability of Hide button
    When I click on Hide button
    Then I should see header text "Users"
    Then I search for bulk user with role "<User>-<Role>"
    Then I verify user "<User>-<Role>" is added to users list
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify email "<Email>" for "<User>-<Role>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Given I am on mail login page
    Then I enter username "qaautomation@remedypartners.com" to login mail account for bulk delete
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify Account Verification in Inbox in my account
    Then I click on Account Verification mail in Inbox
    Then I verify "Confirm My Account!" link in mail content
    Then I click on "Confirm My Account!" link in mail content
    And I switch to new window
    Then I enter email to generate password link
    And I click on send mail button
    Then I switch back to old window
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change My Password" link in mail content
    Then I click on "Change My Password" link in mail content
    And I switch to new window
    And I enter new password "Testing1" to set new password
    And I enter confirm new password "Testing1" to set new password
    And I click on submit button to set new password
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
    #And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
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
      | Description          | User        | Role                | RoleModel                     | NPI | FirstName   | LastName   | Phone | ApplicationsEnabled    | ApplicationsDisabled | HealthSystem                                  | Programs                                                                             | Locations                                                                                                           | Applications                | ApplicationsNotVisible                              | Roletext | ReportCategory | ReportName                   | BPID | Facilities                            | LearningPathway                                                                               |  |
      | Only M3 organisation | Super Admin | Downstream Provider | Downstream Provider M3        |     | DPFirstName | DPLastName |       | Episodes, Episodes 2.0 |                      | Altercare                                     | Altercare--BPCI Model 3                                                              | Altercare--3056-m03--Altercare - Alliance                                                                           | Episodes, Episodes 2.0, TCI | Administration, Physician Connect, Lessons, Reports | ROLE_SNF | Patient ID     | Episode DRG Issues [Model 3] |      | Altercare - Alliance                  | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Remedy University |  |
      | Down org and M3 org  | Super Admin | Downstream Provider | Downstream Provider M3AndDown |     | DPFirstName | DPLastName |       | Episodes, Episodes 2.0 |                      | Healthsystem - Downstream Provider, Altercare | Healthsystem - Downstream Provider--Downstream Organization, Altercare--BPCI Model 3 | Healthsystem - Downstream Provider--DOWN-ORG--Stamford Memorial Hospital, Altercare--3056-m03--Altercare - Alliance | Episodes, Episodes 2.0, TCI | Administration, Physician Connect, Lessons, Reports | ROLE_SNF | Patient ID     | Episode DRG Issues [Model 3] |      | Stamford Memorial Hospital, Altercare | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Remedy University |  |

  Scenario Outline: Scenario to create user through Import with only PID and BPID
    #Given I am on mail login page
    #Then I enter username "qaautomation@remedypartners.com" to login mail account for bulk delete
    #Then I enter password "1Welcome2" to login mail account
    #Then I click on Mail icon in my account
    #Then I click on Inbox in mail
    #Then I click on delete icon in mail
    #Then I signout from mail account
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data with full application access for "<Role>"
    Then I click on submit button on bulk user upload page
    Then I verify "1 user added" message
    Then I verify availability of Hide button
    When I click on Hide button
    Then I should see header text "Users"
    Then I search for bulk user with role "<User>-<Role>"
    Then I verify user "<User>-<Role>" is added to users list
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify email "<Email>" for "<User>-<Role>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Given I am on mail login page
    Then I enter username "qaautomation@remedypartners.com" to login mail account for bulk delete
    Then I enter password "1Welcome2" to login mail account
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
    #And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
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
      | User        | Role      | NPI | FirstName          | LastName          | Phone | ApplicationsEnabled        | ApplicationsDisabled | HealthSystem      | Programs                        | Locations                                      | Applications                    | ApplicationsNotVisible                          | Roletext | ReportCategory | ReportName         | BPID | Facilities        | LearningPathway                                           |
      | Super Admin | Executive |     | ExecutiveFirstName | ExecutiveLastName |       | Episodes, Reports, Lessons |                      | Stamford Hospital | Stamford Hospital--BPCI Model 2 | Stamford Hospital--2070-015--Stamford Hospital | Episodes, Reports, Lessons, TCI | Administration, Episodes 2.0, Physician Connect | ROLE_PRM | Patient ID     | Episode DRG Issues |      | Stamford Hospital | i am learning path, Learning Pathway 2, Remedy University |

  Scenario: Invalid Data Permission- Create user with only PID + Only BPID	+  Only Facility Key + PID and Facility key + Facility Key and BPID + Invalid separation by using comma (,) and semicolon (;)
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter data with invalid data permission values
    Then I click on submit button on bulk user upload page
    Then I verify "6 users not added" error message

  Scenario: Bulk Upload User
    #Given I am on mail login page
    #Then I enter username "qaautomation@remedypartners.com" to login mail account for bulk delete
    #Then I enter password "1Welcome2" to login mail account
    #Then I click on Mail icon in my account
    #Then I click on Inbox in mail
    #Then I click on delete icon in mail
    #Then I signout from mail account
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data for all application access
    Then I click on submit button on bulk user upload page
    Then I verify "19 users added" message

  Scenario Outline: <Description>
    Given I am on mail login page
    Then I enter username "qaautomation@remedypartners.com" to login mail account for bulk delete
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify Account Verification in Inbox in my account
    Then I click on Account Verification mail in Inbox
    Then I verify "Confirm my account!" link in mail content
    Then I click on "Confirm my account!" link in mail content
    And I switch to new window
    Then I enter email "<User>-<Role>" to generate password link for bulk users
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
      | Description                                           | User        | Role                            |
      | Verify email for Executive User                       | Super Admin | Executive                       |
      | Verify email Manager User                             | Super Admin | Manager                         |
      | Verify email for Case Manager User                    | Super Admin | Case Manager                    |
      | Verify eail for Physicians User                       | Super Admin | Physicians                      |
      | Vrify email for Remedy TCS User                       | Super Admin | Remedy TCS                      |
      | Verify email for Remedy LPN User                      | Super Admin | Remedy LPN                      |
      | Verify email for Remedy RN User                       | Super Admin | Remedy RN                       |
      | Verify eail for Remedy Field RN User                  | Super Admin | Remedy Field RN                 |
      | Verify email for Remedy PM User                       | Super Admin | Remedy PM                       |
      | Verify email for Remedy Sales Team User               | Super Admin | Remedy Sales Team               |
      | Verify email for Remedy Executive User                | Super Admin | Remedy Executive                |
      | Verify email for Prospective Partner Executive User   | Super Admin | Prospective Partner Executive   |
      | Verify email for Remedy Other User                    | Super Admin | Remedy Other                    |
      | Verify email for Partner Program Administrator User   | Super Admin | Partner Program Administrator   |
      | Verify email for Remedy Program Administrator User    | Super Admin | Remedy Program Administrator    |
      | Verify email for Partner Technical Administrator User | Super Admin | Partner Technical Administrator |
      | Verify email for Remedy Technical Administrator User  | Super Admin | Remedy Technical Administrator  |
      | Verify email for Transitional Case Manager User       | Super Admin | Transitional Case Manager       |
      | Verify email for Downstream Providers User            | Super Admin | Downstream Provider             |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for bulk user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify All Users button
    Then I click on All Users button
    Then I should see header text "Users"
    Then I search for bulk user with role "<User>-<Role>"
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
    Then I verify bulk email for "<User>-<Role>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify disabled "<ApplicationsDisabled>"
    #Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"

    Examples: 
      | Description                                                             | User        | UserName                               | Password | FirstName            | LastName            | Phone        | Role                            | ApplicationsEnabled                    | ApplicationsDisabled                                 | NPI | LearningPathway                                                                                                                                                                                                                                          | HealthSystem                                                    | Programs                                                                                                  | Locations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | View Executive user created from Super Admin user                       | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | ExecutiveFirstName   | ExecutiveLastName   |              | Executive                       | Episodes, Lessons                      | Reports                                              |     | i am learning path, Learning Pathway 2, Remedy University                                                                                                                                                                                                | Stamford Hospital                                               | Stamford Hospital--BPCI Model 2                                                                           | Stamford Hospital--2070-015--Stamford Hospital                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | View Manager user created from Super Admin user                         | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | ManagerFirstName     | ManagerLastName     | 987-654-5678 | Manager                         | Lessons                                | Episodes, Reports                                    |     | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2                                                                                                                    | Branford Hills                                                  | Branford Hills--BPCI Model 3                                                                              | Branford Hills--3056-r29--Branford Hills Healthcare Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | View Case Manager user created from Super Admin                         | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | CaseManagerFirstName | CaseManagerLastName | 987-980-0980 | Case Manager                    | Reports                                | Episodes, Lessons                                    |     | i am learning path, Learning Pathway 2, max-test-052417, Care Coordination External                                                                                                                                                                      | Hackensack                                                      | Hackensack--BPCI Model 2                                                                                  | Hackensack--2070-005--Hackensack University Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | View Physicians user created from Super Admin user                      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | PhysiciansFirstName  | PhysiciansLastName  |              | Physicians                      | Episodes, Physician Connect            | Reports, Lessons                                     | NPI | i am learning path, Physician Acute Care Hospital Model 2, Remedy University                                                                                                                                                                             | Hospital For Special Surgery                                    | Hospital For Special Surgery--BPCI Model 2                                                                | Hospital For Special Surgery--2070-046--Hss - Hospital For Special Surgery                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | View Remedy TCS user created from Super Admin user                      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | RTCSFirstName        | RTCSLastName        | 546-546-5655 | Remedy TCS                      | Episodes, Episodes 2.0                 | Reports, Lessons, TCI                                |     | Learning Pathway 2, max-test-052417, Clinical Operations Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University                                                                                                           | Mountainside Hospital                                           | Mountainside Hospital--BPCI Model 2                                                                       | Mountainside Hospital--2070-047--Mountainside Hospital                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | View Remedy LPN user created from Super Admin user                      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | RLPNFirstName        | RLPNLastName        | 989-898-9898 | Remedy LPN                      | Episodes 2.0, Reports, Lessons         | Episodes, TCI                                        |     |                                                                                                                                                                                                                                                          | Nebraska Spine Center                                           | Nebraska Spine Center--BPCI Model 3, Nebraska Spine Center--BPCI Model 2                                  | Nebraska Spine Center--2070-a12--Alegent Creighton Health Bergan Mercy Medical Ctr, Nebraska Spine Center--2070-a12--Alegent Creighton Health Immanuel Medical Center, Nebraska Spine Center--2070-a12--Alegent Creighton Health Lakeside Hospital,Nebraska Spine Center--2070-a12--Alegent Creighton Health Midlands Hospital, Nebraska Spine Center--2070-a12--Alegent Health Mercy Hospital, Nebraska Spine Center--2070-a12--Bryan Medical Center, Nebraska Spine Center--2070-a12--Methodist Jennie Edmundson,Nebraska Spine Center--2070-a12--Nebraska Orthopaedic Hospital,Nebraska Spine Center--2070-a12--Nebraska Spine Hospital,Nebraska Spine Center--2070-a12--The Nebraska Medical Center,Nebraska Spine Center--2070-a12--The Nebraska Methodist Hospital,Nebraska Spine Center--3056-a58--Alegent Creighton Health Bergan Mercy Medical Ctr, Nebraska Spine Center--3056-a58--Alegent Creighton Health Immanuel Medical Center, Nebraska Spine Center--3056-a58--Alegent Creighton Health Lakeside Hospital,Nebraska Spine Center--3056-a58--Alegent Creighton Health Midlands Hospital,Nebraska Spine Center--3056-a58--Alegent Health Mercy Hospital,Nebraska Spine Center--3056-a58--Bryan Medical Center, Nebraska Spine Center--3056-a58--Methodist Jennie Edmundson, Nebraska Spine Center--3056-a58--Nebraska Orthopaedic Hospital,Nebraska Spine Center--3056-a58--Nebraska Spine Hospital, Nebraska Spine Center--3056-a58--The Nebraska Medical Center, Nebraska Spine Center--3056-a58--The Nebraska Methodist Hospital |
      | View Remedy RN user created from Super Admin user                       | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | RRNFirstName         | RRNLastName         | 987-890-9878 | Remedy RN                       | Reports, TCI, Lessons                  | Episodes, Episodes 2.0                               |     | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | Penn                                                            | Penn--BPCI Model 2                                                                                        | Penn--2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania, Penn--2070-021--Upenn - Penn Presbyterian Hospital,Penn--2070-022--Upenn - Pennsylvania Hospital                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | View Remedy Field RN user created from Super Admin user                 | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | RFRNFirstName        | RFRNFirstName       |              | Remedy Field RN                 | TCI, Lessons                           | Episodes, Episodes 2.0, Reports                      |     | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2                    | Avon Health Center                                              | Avon Health Center--BPCI Model 3                                                                          | Avon Health Center--3056-r31--Avon Health                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | View Remedy PM user created from Super Admin user                       | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | RPMFirstName         | RPMLastName         |              | Remedy PM                       | Episodes, TCI                          | Episodes 2.0, Reports, Lessons                       |     | Learning Pathway 2, New learning Path, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                                                                                                            | Blanchard Valley                                                | Blanchard Valley--BPCI Model 3                                                                            | Blanchard Valley--3056-k60--Birchaven, Blanchard Valley--3056-k61--Independence House                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | View Remedy Sales Team user created from Super Admin user               | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | RSTFirstName         | RSTLastName         | 898-989-8787 | Remedy Sales Team               | Reports                                | Lessons, TCI                                         |     | i am learning path, Learning Pathway 2, max-test-052417, Clinical Operations Acute Care Hospital Model 2                                                                                                                                                 | Brookdale                                                       | Brookdale--BPCI Model 3                                                                                   | Brookdale--3056-m55--Santa Rosa, Brookdale--3056-m61--Carlsbad, Brookdale--3056-m63--Carmel Valley,Brookdale--3056-m69--Yorba Linda,Brookdale--3056-m74--Palmer Ranch                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | View Remedy Executive user created from Super Admin user                | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | REFirstName          | RELastName          |              | Remedy Executive                | Episodes, Episodes 2.0                 | Reports, Lessons, TCI                                |     | max-test-052417, New learning Path, Remedy University                                                                                                                                                                                                    | Butler Memorial Hospital                                        | Butler Memorial Hospital--BPCI Model 2,Butler Memorial Hospital--BPCI-CJR                                 | Butler Memorial Hospital--2070-a55--Butler Memorial Hospital, Butler Memorial Hospital--CJR-1--Butler Memorial Hospital                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | View Prospective Partner Executive user created from Super Admin user   | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | PPEFirstName         | PPELastName         |              | Prospective Partner Executive   | Lessons                                |                                                      |     |                                                                                                                                                                                                                                                          | Stebbins Five Companies                                         | Stebbins Five Companies--BPCI Model 3                                                                     | Stebbins Five Companies--3056-y03--Highland Pines Nursing Home Ltd,Stebbins Five Companies--3056-y04--Southwest Nursing & Rehabilitation Center, Stebbins Five Companies--3056-y05--West Side Campus Of Care                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | View Remedy Other user created from Super Admin user                    | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | ROFirstName          | ROLastName          | 767-687-8998 | Remedy Other                    | Episodes                               | Episodes 2.0, TCI, Lessons                           |     | New learning Path, Physician Acute Care Hospital Model 2                                                                                                                                                                                                 | Jersey City Medical Center                                      | Jersey City Medical Center--BPCI Model 2                                                                  | Jersey City Medical Center--2070-007--Jersey City Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | View Partner Program Administrator user created from Super Admin user   | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | PPAFirstName         | PPALastName         |              | Partner Program Administrator   | Episodes, Physician Connect            | Episodes 2.0, Reports, Lessons                       |     | i am learning path, Learning Pathway 2, max-test-052417, Physician Acute Care Hospital Model 2, Remedy University                                                                                                                                        | Village Center For Care                                         | Village Center For Care--BPCI Model 3                                                                     | Village Center For Care--3056-r26--Village Care Rehab And Nursing Ctr                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | View Remedy Program Administrator user created from Super Admin user    | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | RPAFirstName         | RPALastName         | 987-776-6666 | Remedy Program Administrator    | Episodes 2.0                           | Episodes, Reports, Lessons, Physician Connect, TCI   |     | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University                                                                                                 | Blanchard Valley,Brookdale                                      | Blanchard Valley--BPCI Model 3, Brookdale--BPCI Model 3                                                   | Blanchard Valley--3056-k60--Birchaven, Blanchard Valley--3056-k61--Independence House,Brookdale--3056-m55--Santa Rosa, Brookdale--3056-m61--Carlsbad, Brookdale--3056-m63--Carmel Valley,Brookdale--3056-m69--Yorba Linda,Brookdale--3056-m74--Palmer Ranch                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
      | View Partner Technical Administrator user created from Super Admin user | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | PTAFirstName         | PTALastName         |              | Partner Technical Administrator | Administration, Lessons                | Episodes, Reports, Physician Connect                 |     | Learning Pathway 2, New learning Path, Remedy University                                                                                                                                                                                                 | Brookview Corporation                                           | Brookview Corporation--BPCI Model 3                                                                       | Brookview Corporation--3056-r30--Brookview                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
      | View Remedy Technical Administrator user created from Super Admin user  | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | RTAFirstName         | RTALastName         | 345-676-5432 | Remedy Technical Administrator  | Physician Connect, Administration, TCI | Episodes, Reports, Lessons, Episodes 2.0             |     | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | Avon Health Center,Brookview Corporation,Day Kimball Healthcare | Avon Health Center--BPCI Model 3,Brookview Corporation--BPCI Model 3,Day Kimball Healthcare--BPCI Model 2 | Avon Health Center--3056-r31--Avon Health,Brookview Corporation--3056-r30--Brookview,Day Kimball Healthcare--2070-a48--Day Kimball Healthcare                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | View Transitional Case Manager user created from Super Admin user       | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | TCMFirstName         | TCMLastName         |              | Transitional Case Manager       | Lessons                                | Episodes 2.0, Administration, Physician Connect, TCI |     | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | St. Lukes Health Network                                        | St. Lukes Health Network--BPCI Model 2                                                                    | St. Lukes Health Network--2070-023--Allentown,St. Lukes Health Network--2070-023--Bethlehem,St. Lukes Health Network--2070-025--Anderson,St. Lukes Health Network--2070-026--St. Luke's Hospital Quakertown Hospital,St. Lukes Health Network--2070-027--St. Luke's Hospital Miners Memorial Hospital,St. Lukes Health Network--2070-028--Warren Hospital                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | View Downstream Provider user created from Super Admin user             | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | DPFirstName          | DPLastName          | 999-888-7770 | Downstream Provider             | Episodes                               | Episodes 2.0                                         |     | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | Healthsystem - Downstream Provider                              | Healthsystem - Downstream Provider--Downstream Organization                                               | Healthsystem - Downstream Provider--DOWN-ORG--Coosa Valley Health Care                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |

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
    #And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
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
      | Description                                                                                | User        | FirstName            | LastName            | Role                            | Applications                                                                     | ApplicationsNotVisible                                             | Roletext       | ReportCategory | ReportName                   | BPID | Facilities                                                                                                                                                                                                                                                                                                                                                                                    | LearningPathway                                                                                                                                                                                                                                          |  |
      | Login with Executive and verify Product Tiles and their redirections                       | Super Admin | ExecutiveFirstName   | ExecutiveLastName   | Executive                       | Episodes, Reports, TCI, Lessons                                                  | Episodes 2.0, Administration, Physician Connect                    | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Stamford Hospital                                                                                                                                                                                                                                                                                                                                                                             | i am learning path, Learning Pathway 2, Remedy University                                                                                                                                                                                                |  |
      | Login with Manager and verify Product Tiles and their redirections                         | Super Admin | ManagerFirstName     | ManagerLastName     | Manager                         | Episodes, Reports, TCI, Lessons                                                  | Episodes 2.0, Administration, Physician Connect                    | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Branford Hills Healthcare Center                                                                                                                                                                                                                                                                                                                                                              | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2                                                                                                                    |  |
      | Login with Case Manager and verify Product Tiles and their redirections                    | Super Admin | CaseManagerFirstName | CaseManagerLastName | Case Manager                    | Episodes, Reports, TCI, Lessons                                                  | Episodes 2.0, Administration, Physician Connect                    | ROLE_TCS       | Patient ID     | Episode DRG Issues           |      | Hackensack University Medical Center                                                                                                                                                                                                                                                                                                                                                          | i am learning path, Learning Pathway 2, max-test-052417, Care Coordination External                                                                                                                                                                      |  |
      | Login with Physicians and verify Product Tiles and their redirections                      | Super Admin | PhysiciansFirstName  | PhysiciansLastName  | Physicians                      | Episodes, Reports, Physician Connect, TCI, Lessons                               | Episodes 2.0, Administration                                       | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues           |      | HSS - Hospital for Special Surgery                                                                                                                                                                                                                                                                                                                                                            | i am learning path, Physician Acute Care Hospital Model 2, Remedy University                                                                                                                                                                             |  |
      | Login with Remedy TCS and verify Product Tiles and their redirections                      | Super Admin | RTCSFirstName        | RTCSLastName        | Remedy TCS                      | Episodes, Episodes 2.0, Reports, TCI, Lessons                                    | Administration, Physician Connect                                  | ROLE_TCS       | Patient ID     | Episode DRG Issues           |      | Mountainside Hospital                                                                                                                                                                                                                                                                                                                                                                         | Learning Pathway 2, max-test-052417, Clinical Operations Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University                                                                                                           |  |
      | Login with Remedy LPN and verify Product Tiles and their redirections                      | Super Admin | RLPNFirstName        | RLPNLastName        | Remedy LPN                      | Episodes, Episodes 2.0, Reports, TCI, Lessons                                    | Administration, Physician Connect                                  | ROLE_LPN       | Patient ID     | Episode DRG Issues           |      | Alegent Health Mercy Hospital,Methodist Jennie Edmundson,Bryan Medical Center,The Nebraska Medical Center,The Nebraska Methodist Hospital,Alegent Creighton Health Bergan Mercy Medical Ctr, Alegent Creighton Health Immanuel Medical Center, Alegent Creighton Health Midlands Hospital, Nebraska Orthopaedic Hospital, Alegent Creighton Health Lakeside Hospital, Nebraska Spine Hospital |                                                                                                                                                                                                                                                          |  |
      | Login with Remedy RN and verify Product Tiles and their redirections                       | Super Admin | RRNFirstName         | RRNLastName         | Remedy RN                       | Episodes, Episodes 2.0, Reports, TCI, Lessons                                    | Administration, Physician Connect                                  | ROLE_RN        | Patient ID     | Episode DRG Issues           |      | UPenn - Hospital of the Univ. of Pennsylvania, UPenn - Pennsylvania Hospital, UPenn - Penn Presbyterian Hospital                                                                                                                                                                                                                                                                              | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University |  |
      | Login with Remedy Field RN and verify Product Tiles and their redirections                 | Super Admin | RFRNFirstName        | RFRNLastName        | Remedy Field RN                 | Episodes, Episodes 2.0, Reports, TCI, Lessons                                    | Administration, Physician Connect                                  | ROLE_FRN       | Patient ID     | Episode DRG Issues [Model 3] |      | Avon Health                                                                                                                                                                                                                                                                                                                                                                                   | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2                    |  |
      | Login with Remedy PM and verify Product Tiles and their redirections                       | Super Admin | RPMFirstName         | RPMLastName         | Remedy PM                       | Episodes, Episodes 2.0, Reports, TCI, Lessons                                    | Administration, Physician Connect                                  | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Independence House,Birchaven                                                                                                                                                                                                                                                                                                                                                                  | Learning Pathway 2, New learning Path, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                                                                                                            |  |
      | Login with Remedy Sales Team and verify Product Tiles and their redirections               | Super Admin | RSTFirstName         | RSTLastName         | Remedy Sales Team               | Reports, TCI, Lessons                                                            | Episodes, Episodes 2.0, Administration, Physician Connect          |                | Patient ID     | Episode DRG Issues [Model 3] |      |                                                                                                                                                                                                                                                                                                                                                                                               | i am learning path, Learning Pathway 2, max-test-052417, Clinical Operations Acute Care Hospital Model 2                                                                                                                                                 |  |
      | Login with Remedy Executive and verify Product Tiles and their redirections                | Super Admin | REFirstName          | RELastName          | Remedy Executive                | Episodes, Episodes 2.0, Reports, TCI, Lessons                                    | Administration, Physician Connect                                  | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Butler Memorial Hospital                                                                                                                                                                                                                                                                                                                                                                      | max-test-052417, New learning Path, Remedy University                                                                                                                                                                                                    |  |
      | Login with Prospective Partner Executive and verify Product Tiles and their redirections   | Super Admin | PPEFirstName         | PPELastName         | Prospective Partner Executive   | Lessons, TCI                                                                     | Administration, Physician Connect, Episodes, Episodes 2.0, Reports |                | Patient ID     | Episode DRG Issues           |      |                                                                                                                                                                                                                                                                                                                                                                                               |                                                                                                                                                                                                                                                          |  |
      | Login with Remedy Other and verify Product Tiles and their redirections                    | Super Admin | ROFirstName          | ROLastName          | Remedy Other                    | Episodes, Episodes 2.0, TCI, Lessons                                             | Administration, Physician Connect, Reports                         | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Jersey City Medical Center                                                                                                                                                                                                                                                                                                                                                                    | New learning Path, Physician Acute Care Hospital Model 2                                                                                                                                                                                                 |  |
      | Login with Partner Program Administrator and verify Product Tiles and their redirections   | Super Admin | PPAFirstName         | PPALastName         | Partner Program Administrator   | Episodes, Reports, Physician Connect, TCI, Lessons                               | Administration                                                     | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Village Care Rehab and Nursing Ctr                                                                                                                                                                                                                                                                                                                                                            | i am learning path, Learning Pathway 2, max-test-052417, Physician Acute Care Hospital Model 2, Remedy University                                                                                                                                        |  |
      | Login with Remedy Program Administrator and verify Product Tiles and their redirections    | Super Admin | RPAFirstName         | RPALastName         | Remedy Program Administrator    | Episodes, Episodes 2.0, Reports, Physician Connect, TCI, Lessons                 | Administration                                                     | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Palmer Ranch,Independence House,Birchaven,Carlsbad,Carmel Valley,Yorba Linda,Santa Rosa                                                                                                                                                                                                                                                                                                       | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University                                                                                                 |  |
      | Login with Partner Technical Administrator and verify Product Tiles and their redirections | Super Admin | PTAFirstName         | PTALastName         | Partner Technical Administrator | Episodes, Reports, Physician Connect, Administration, TCI, Lessons               | Episodes 2.0                                                       | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Brookview                                                                                                                                                                                                                                                                                                                                                                                     | Learning Pathway 2, New learning Path, Remedy University                                                                                                                                                                                                 |  |
      | Login with Remedy Technical Administrator and verify Product Tiles and their redirections  | Super Admin | RTAFirstName         | RTALastName         | Remedy Technical Administrator  | Episodes, Episodes 2.0, Reports, Physician Connect, Administration, TCI, Lessons |                                                                    | ROLE_ADMIN     | Patient ID     | Episode DRG Issues           |      | Day Kimball Healthcare,Avon Health,Brookview                                                                                                                                                                                                                                                                                                                                                  | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University |  |
      | Login with Transitional Case Manager and verify Product Tiles and their redirections       | Super Admin | TCMFirstName         | TCMLastName         | Transitional Case Manager       | Episodes, Reports, TCI, Lessons                                                  | Episodes 2.0, Administration, Physician Connect                    | ROLE_TCS       | Patient ID     | Episode DRG Issues           |      | St. Luke's Hospital Quakertown Hospital, St. Luke's Hospital Miners Memorial Hospital,Allentown,Bethlehem,Warren Hospital,Anderson                                                                                                                                                                                                                                                            | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University |  |
      | Login with DownStream Provider and verify Product Tiles and their redirections             | Super Admin | DPFirstName          | DPLastName          | Downstream Provider             | Episodes, Episodes 2.0, TCI                                                      | Administration, Physician Connect, Lessons, Reports                | ROLE_SNF       | Patient ID     | Episode DRG Issues [Model 3] |      | Coosa valley health care                                                                                                                                                                                                                                                                                                                                                                      | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Remedy University                                                                                                                                                            |  |
