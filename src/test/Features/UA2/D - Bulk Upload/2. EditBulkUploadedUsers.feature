Feature: Edit bulk uploaded users

  Scenario Outline: Scenario to <description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I edit "<PreviousRole>" user and enter data
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
      | Description                                              | User        | PreviousRole                    | Role                          | NPI | FirstName           | LastName           | Phone        | ApplicationsEnabled                      | ApplicationsDisabled   | HealthSystem                                  | Programs                                                                             | Locations                                                                                                                                                                                                                                                   | Applications                                       | ApplicationsNotVisible                                             | Roletext       | ReportCategory | ReportName                   | BPID | Facilities                                                                                                       | LearningPathway                                                                                                                                                                                                                                          |
      | Changing Role and Data permissions                       | Super Admin | Executive                       | Remedy Executive              |     | ExecutiveFirstName  | ExecutiveLastName  |              | Episodes, Reports, Lessons               |                        | Branford Hills                                | Branford Hills--BPCI Model 3                                                         | Branford Hills--3056-r29--Branford Hills Healthcare Center                                                                                                                                                                                                  | Episodes, Reports, Lessons, TCI                    | Administration, Physician Connect                                  | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Branford Hills Healthcare Center                                                                                 | i am learning path, Learning Pathway 2, Remedy University                                                                                                                                                                                                |
      | Changing Role and general details                        | Super Admin | Manager                         | Remedy TCS                    |     | FirstNameEdited     | LastNameEdited     |              | Episodes, Reports, Lessons               |                        | Branford Hills                                | Branford Hills--BPCI Model 3                                                         | Branford Hills--3056-r29--Branford Hills Healthcare Center                                                                                                                                                                                                  | Episodes, Reports, Lessons, TCI                    | Administration, Episodes 2.0, Physician Connect                    | ROLE_TCS       | Patient ID     | Episode DRG Issues [Model 3] |      | Branford Hills Healthcare Center                                                                                 | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2                                                                                                                    |
      | Changing the applications and general details            | Super Admin | Case Manager                    | Case Manager                  |     | FirstNameEdited     | LastNameEdited     | 987-980-0978 | Episodes                                 | Reports, Lessons       | Hackensack                                    | Hackensack--BPCI Model 2                                                             | Hackensack--2070-005--Hackensack University Medical Center                                                                                                                                                                                                  | Episodes, TCI                                      | Administration, Episodes 2.0, Physician Connect                    | ROLE_TCS       | Patient ID     | Episode DRG Issues           |      | Hackensack University Medical Center                                                                             | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2                                                                                                                    |
      | Changing the Role                                        | Super Admin | Physicians                      | Manager                       |     | PhysiciansFirstName | PhysiciansLastName |              | Episodes, Physician Connect              |                        | Hospital For Special Surgery                  | Hospital For Special Surgery--BPCI Model 2                                           | Hospital For Special Surgery--2070-046--Hss - Hospital For Special Surgery                                                                                                                                                                                  | Episodes, Reports, Physician Connect, TCI, Lessons | Episodes 2.0, Administration                                       | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues           |      | HSS - Hospital for Special Surgery                                                                               | i am learning path, Physician Acute Care Hospital Model 2, Remedy University                                                                                                                                                                             |
      | Changing data permissions and applications               | Super Admin | Remedy TCS                      | Remedy TCS                    |     | RTCSFirstName       | RTCSLastName       | 546-546-5655 | Episodes, Lessons                        | Reports, Episodes 2.0  | Stamford Hospital                             | Stamford Hospital--BPCI Model 2                                                      | Stamford Hospital--2070-015--Stamford Hospital                                                                                                                                                                                                              | Episodes, TCI, Lessons                             | Episodes 2.0, Reports, Administration, Physician Connect           | ROLE_TCS       | Patient ID     | Episode DRG Issues           |      | Stamford Hospital                                                                                                | Learning Pathway 2, max-test-052417, Clinical Operations Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University                                                                                                           |
      | Changing data permissions                                | Super Admin | Remedy LPN                      | Remedy LPN                    |     | RLPNFirstName       | RLPNLastName       | 989-898-9898 | Episodes 2.0, Reports, Lessons           |                        | Branford Hills                                | Branford Hills--BPCI Model 3                                                         | Branford Hills--3056-r29--Branford Hills Healthcare Center                                                                                                                                                                                                  | Episodes, Episodes 2.0, Reports, TCI, Lessons      | Administration, Physician Connect                                  | ROLE_LPN       | Patient ID     | Episode DRG Issues [Model 3] |      | Branford Hills Healthcare Center                                                                                 |                                                                                                                                                                                                                                                          |
      | Changing general details                                 | Super Admin | Remedy RN                       | Remedy RN                     |     | RRNFirstNameEdited  | RRNLastNameEdited  | 987-890-0000 | Reports, TCI, Lessons                    |                        | Penn                                          | Penn--BPCI Model 2                                                                   | Penn--2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania, Penn--2070-021--Upenn - Penn Presbyterian Hospital,Penn--2070-022--Upenn - Pennsylvania Hospital                                                                                             | Episodes, Episodes 2.0, Reports, TCI, Lessons      | Administration, Physician Connect                                  | ROLE_RN        | Patient ID     | Episode DRG Issues           |      | UPenn - Hospital of the Univ. of Pennsylvania, UPenn - Pennsylvania Hospital, UPenn - Penn Presbyterian Hospital | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University |
      | Changing the Role                                        | Super Admin | Remedy Field RN                 | Remedy Executive              |     | RFRNFirstName       | RFRNLastName       |              | TCI, Lessons                             |                        | Avon Health Center                            | Avon Health Center--BPCI Model 3                                                     | Avon Health Center--3056-r31--Avon Health                                                                                                                                                                                                                   | Episodes, Episodes 2.0, Reports, TCI, Lessons      | Administration, Physician Connect                                  | ROLE_FRN       | Patient ID     | Episode DRG Issues [Model 3] |      | Avon Health                                                                                                      | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2                    |
      | Changing the applications and remove Learning Pathway ID | Super Admin | Remedy PM                       | Remedy PM                     |     | RPMFirstName        | RPMLastName        |              | Episodes 2.0, Reports, Lessons           | Episodes               | Blanchard Valley                              | Blanchard Valley--BPCI Model 3                                                       | Blanchard Valley--3056-k60--Birchaven, Blanchard Valley--3056-k61--Independence House                                                                                                                                                                       | Episodes 2.0, Reports, TCI, Lessons                | Administration, Physician Connect, Episodes                        | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Independence House,Birchaven                                                                                     | Learning Pathway 2, New learning Path, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                                                                                                            |
      | Changing role, general details and data permissions      | Super Admin | Remedy Sales Team               | Remedy Executive              |     | RSTFirstNameEdited  | RSTLastNameEdited  | 898-989-8787 | Episodes, Episodes 2.0, Reports, Lessons |                        | Penn                                          | Penn--BPCI Model 2                                                                   | Penn--2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania, Penn--2070-021--Upenn - Penn Presbyterian Hospital,Penn--2070-022--Upenn - Pennsylvania Hospital                                                                                             | Episodes, Episodes 2.0, Reports, TCI, Lessons      | Administration, Physician Connect                                  | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | UPenn - Hospital of the Univ. of Pennsylvania, UPenn - Pennsylvania Hospital, UPenn - Penn Presbyterian Hospital | i am learning path, Learning Pathway 2, max-test-052417, Clinical Operations Acute Care Hospital Model 2                                                                                                                                                 |
      | Changing role, general details and data permissions      | Super Admin | Remedy Other                    | Manager                       |     | ROFirstNameEdited   | ROLastNameEdited   |              | Episodes, Reports, Lessons               |                        | Penn                                          | Penn--BPCI Model 2                                                                   | Penn--2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania, Penn--2070-021--Upenn - Penn Presbyterian Hospital,Penn--2070-022--Upenn - Pennsylvania Hospital                                                                                             | Episodes, Reports, TCI, Lessons                    | Administration, Physician Connect                                  | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | UPenn - Hospital of the Univ. of Pennsylvania, UPenn - Pennsylvania Hospital, UPenn - Penn Presbyterian Hospital | New learning Path, Physician Acute Care Hospital Model 2                                                                                                                                                                                                 |
      | Change role to DP(only M3) and data permissions          | Super Admin | Remedy Executive                | Downstream Provider           |     | REFirstName         | RELastName         |              | Episodes, Episodes 2.0                   |                        | Altercare                                     | Altercare--BPCI Model 3                                                              | Altercare--3056-m03--Altercare - Alliance                                                                                                                                                                                                                   | Episodes, Episodes 2.0, TCI                        | Administration, Physician Connect, Lessons, Reports                | ROLE_SNF       | Patient ID     | Episode DRG Issues [Model 3] |      | Altercare - Alliance                                                                                             | max-test-052417, New learning Path, Remedy University                                                                                                                                                                                                    |
      | Changing data permissions and general details            | Super Admin | Prospective Partner Executive   | Prospective Partner Executive |     | PPEFirstNameEdited  | PPELastNameEdited  | 767-687-8998 | Lessons                                  |                        | Butler Memorial Hospital                      | Butler Memorial Hospital--BPCI Model 2,Butler Memorial Hospital--BPCI-CJR            | Butler Memorial Hospital--2070-a55--Butler Memorial Hospital, Butler Memorial Hospital--CJR-1--Butler Memorial Hospital                                                                                                                                     | Lessons                                            | Administration, Physician Connect, Episodes, Episodes 2.0, Reports | ROLE_SNF       | Patient ID     | Episode DRG Issues           |      | Butler Memorial Hospital                                                                                         |                                                                                                                                                                                                                                                          |
      | Changing Role and general details                        | Super Admin | Partner Program Administrator   | Case Manager                  |     | PPAFirstNameEdited  | PPALastNameEdited  |              | Episodes, Reports, Lessons               |                        | Butler Memorial Hospital                      | Butler Memorial Hospital--BPCI Model 2,Butler Memorial Hospital--BPCI-CJR            | Butler Memorial Hospital--2070-a55--Butler Memorial Hospital, Butler Memorial Hospital--CJR-1--Butler Memorial Hospital                                                                                                                                     | Episodes, Reports, TCI, Lessons                    | Administration, Physician Connect, Episodes 2.0                    | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | Butler Memorial Hospital                                                                                         | i am learning path, Learning Pathway 2, max-test-052417, Physician Acute Care Hospital Model 2, Remedy University                                                                                                                                        |
      | Changing the applications and general details            | Super Admin | Remedy Program Administrator    | Remedy Program Administrator  |     | RPAFirstNameEdited  | RPALastNameEdited  |              | Reports, Physician Connect, Lessons      | Episodes, Episodes 2.0 | Blanchard Valley,Brookdale                    | Blanchard Valley--BPCI Model 3, Brookdale--BPCI Model 3                              | Blanchard Valley--3056-k60--Birchaven, Blanchard Valley--3056-k61--Independence House,Brookdale--3056-m55--Santa Rosa, Brookdale--3056-m61--Carlsbad, Brookdale--3056-m63--Carmel Valley,Brookdale--3056-m69--Yorba Linda,Brookdale--3056-m74--Palmer Ranch | Reports, Physician Connect, TCI, Lessons           | Administration, Episodes, Episodes 2.0                             | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Palmer Ranch,Independence House,Birchaven,Carlsbad,Carmel Valley,Yorba Linda,Santa Rosa                          | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University                                                                                                 |
      | Changing role and data permissions                       | Super Admin | Partner Technical Administrator | Downstream Provider           |     | PTAFirstName        | PTALastName        |              | Episodes, Episodes 2.0                   |                        | Healthsystem - Downstream Provider, Altercare | Healthsystem - Downstream Provider--Downstream Organization, Altercare--BPCI Model 3 | Healthsystem - Downstream Provider--DOWN-ORG--Stamford Memorial Hospital, Altercare--3056-m03--Altercare - Alliance                                                                                                                                         | Episodes, Episodes 2.0, TCI                        | Administration, Physician Connect, Lessons, Reports                | ROLE_SNF       | Patient ID     | Episode DRG Issues [Model 3] |      | Stamford Memorial Hospital, Altercare                                                                            | Learning Pathway 2, New learning Path, Remedy University                                                                                                                                                                                                 |
