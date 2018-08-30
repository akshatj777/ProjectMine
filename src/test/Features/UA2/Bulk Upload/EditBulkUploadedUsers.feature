Feature: Edit bulk uploaded users

  Scenario: Bulk Upload User
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data for all application access
    Then I click on submit button on bulk user upload page
    Then I verify "19 users added" message

  Scenario Outline: <Description>
    Given I am on mail login page
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

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

  Scenario Outline: Scenario to edit user by - <description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I edit "<PreviousRoleText>" user and enter data
    Then I click on submit button on edit bulk user page for role "<User>-<PreviousRole>-<Role>" and applications "<ApplicationsEnabled>"
    Then I verify "1 user added" message
    Then I verify availability of Hide button
    When I click on Hide button
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify email "<Email>" for "<User>-<Role>"
    Then I verify phone "<Phone>"
    Then I verify bulk NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<ApplicationsEnabled>" product on SPOE page
    Then I verify "<ApplicationsDisabled>" product is not visible on SPOE page
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
    #And I click on Institute tile for "<User>-<Role>" user
    #And I switch to new window
    #And I verify "<User>-<Role>" user navigated to Institute homepage
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
      | Description                                                                | User        | PreviousRoleText                | PreviousRole                    | Role                          | NPI | FirstName                                          | LastName                                           | Phone        | ApplicationsEnabled                           | ApplicationsDisabled                            | HealthSystem                                   | Programs                                                                                                                     | Locations                                                                                                                                                                                                                                                                                                       | Applications                                  | ApplicationsNotVisible                     | Roletext       | ReportCategory | ReportName                   | BPID | Facilities                                                                                                                             | LearningPathway                                                                                                                                                                                                                                          |
      | Changing Role and Data permissions                                         | Super Admin | Executive                       | Executive                       | Remedy Executive              |     | ExecutiveFirstName                                 | ExecutiveLastName                                  |              | Episodes, Episodes 2.0, Reports, TCI, Lessons | Administration                                  | Branford Hills                                 | Branford Hills--BPCI Model 3                                                                                                 | Branford Hills--3056-r29--Branford Hills Healthcare Center                                                                                                                                                                                                                                                      | Episodes, Reports, Lessons, TCI               | Administration                             | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Branford Hills Healthcare Center                                                                                                       | i am learning path, Learning Pathway 2, Remedy University                                                                                                                                                                                                |
      | Changing Role and general details                                          | Super Admin | Manager                         | Manager                         | Remedy Sales Team             |     | FirstNameEdited                                    | LastNameEdited                                     |              | Reports, Lessons, TCI                         | Administration                                  | Branford Hills                                 | Branford Hills--BPCI Model 3                                                                                                 | Branford Hills--3056-r29--Branford Hills Healthcare Center                                                                                                                                                                                                                                                      | Reports, Lessons, TCI                         | Administration, Episodes 2.0               | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Branford Hills Healthcare Center                                                                                                       | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2                                                                                                                    |
      | Changing the applications and general details                              | Super Admin | Case Manager                    | Case Manager                    | Case Manager                  |     | FirstNameEdited                                    | LastNameEdited                                     | 987-980-0978 | Episodes                                      | Episodes 2.0, Reports, Lessons, Administration  | Hackensack                                     | Hackensack--BPCI Model 2                                                                                                     | Hackensack--2070-005--Hackensack University Medical Center                                                                                                                                                                                                                                                      | Episodes, TCI                                 | Administration, Episodes 2.0               | ROLE_TCS       | Patient ID     | Episode DRG Issues           |      | Hackensack University Medical Center                                                                                                   |                                                                                                                                                                                                                                                          |
      | Changing the Role                                                          | Super Admin | Physicians                      | Physicians                      | Manager                       |     | PhysiciansFirstName                                | PhysiciansLastName                                 |              | Episodes, Reports, TCI, Lessons               | Episodes 2.0, Administration                    | Hospital For Special Surgery                   | Hospital For Special Surgery--BPCI Model 2                                                                                   | Hospital For Special Surgery--2070-046--Hss - Hospital For Special Surgery                                                                                                                                                                                                                                      | Episodes, Reports, TCI, Lessons               | Episodes 2.0, Administration               | ROLE_PRM       | Patient ID     | Episode DRG Issues           |      | HSS - Hospital for Special Surgery                                                                                                     | i am learning path, Physician Acute Care Hospital Model 2, Remedy University                                                                                                                                                                             |
      | Changing the applications and remove Learning Pathway ID                   | Super Admin | Remedy PM                       | Remedy PM                       | Remedy PM                     |     | RPMFirstName                                       | RPMLastName                                        |              | Episodes 2.0, Reports, Lessons, TCI           | Episodes, Administration                        | Blanchard Valley                               | Blanchard Valley--BPCI Model 3                                                                                               | Blanchard Valley--3056-k60--Birchaven, Blanchard Valley--3056-k61--Independence House                                                                                                                                                                                                                           | Episodes 2.0, Reports, TCI, Lessons           | Administration, Episodes                   | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Independence House,Birchaven                                                                                                           | Learning Pathway 2                                                                                                                                                                                                                                       |
      | Change role to DP(only M3) and data permissions                            | Super Admin | Remedy Other                    | Remedy Other                    | Downstream Provider           |     | ROFirstName                                        | ROLastName                                         | 767-687-8998 | Episodes, Episodes 2.0, TCI                   | Administration, Lessons, Reports                | Altercare                                      | Altercare--BPCI Model 3                                                                                                      | Altercare--3056-m03--Altercare - Alliance                                                                                                                                                                                                                                                                       | Episodes, Episodes 2.0, TCI                   | Administration, Lessons, Reports           | ROLE_SNF       | Patient ID     | Episode DRG Issues [Model 3] |      | Altercare - Alliance                                                                                                                   |                                                                                                                                                                                                                                                          |
      | Changing role and data permissions                                         | Super Admin | Partner Technical Administrator | Partner Technical Administrator | Downstream Provider           |     | PTAFirstName                                       | PTALastName                                        |              | Episodes, Episodes 2.0, TCI                   | Administration, Lessons, Reports                | Healthsystem - Downstream Provider, Altercare  | Healthsystem - Downstream Provider--Downstream Organization, Altercare--BPCI Model 3                                         | Healthsystem - Downstream Provider--DOWN-ORG--Stamford Memorial Hospital, Altercare--3056-m03--Altercare - Alliance                                                                                                                                                                                             | Episodes, Episodes 2.0, TCI                   | Administration, Lessons, Reports           | ROLE_SNF       | Patient ID     | Episode DRG Issues [Model 3] |      | Stamford Memorial Hospital, Altercare                                                                                                  |                                                                                                                                                                                                                                                          |
      | Changing role, general details, applications, data permissions             | Super Admin | Remedy Technical Administrator  | Remedy Technical Administrator  | Physicians                    | NPI | FirstnameeFirstnameeFirstnameeFirstnameeFirstnamee | LastnameeeLastnameeeLastnameeeLastnameeeLastnameee | 345-676-5432 | Reports, TCI                                  | Episodes, Episodes 2.0, Lessons, Administration | Penn                                           | Penn--BPCI Model 2                                                                                                           | Penn--2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania, Penn--2070-021--Upenn - Penn Presbyterian Hospital,Penn--2070-022--Upenn - Pennsylvania Hospital                                                                                                                                                 | TCI                                           | Administration, Episodes, Reports, Lessons | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues           |      | UPenn - Hospital of the Univ. of Pennsylvania, UPenn - Pennsylvania Hospital, UPenn - Penn Presbyterian Hospital                       |                                                                                                                                                                                                                                                          |
      | Changing the Role to DP(downstream loc), applications and data permissions | Super Admin | Transitional Case Manager       | Transitional Case Manager       | Downstream Provider           |     | TCMFirstName                                       | TCMLastName                                        |              | Episodes, TCI                                 | Administration, Lessons, Reports                | Healthsystem - Downstream Provider             | Healthsystem - Downstream Provider--Downstream Organization                                                                  | Healthsystem - Downstream Provider--DOWN-ORG--Stamford Memorial Hospital                                                                                                                                                                                                                                        | Episodes, TCI                                 | Administration, Lessons, Reports           | ROLE_SNF       | Patient ID     | Episode DRG Issues           |      | Stamford Memorial Hospital                                                                                                             |                                                                                                                                                                                                                                                          |
      | Edit Data permissions and learning pathways                                | Super Admin | Remedy TCS                      | Remedy TCS                      | Remedy TCS                    |     | RTCSFirstName                                      | RTCSLastName                                       | 546-546-5655 | Episodes, Episodes 2.0, Reports, Lessons, TCI | Administration                                  | Penn                                           | Penn--BPCI Model 2                                                                                                           | Penn--2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania, Penn--2070-021--Upenn - Penn Presbyterian Hospital,Penn--2070-022--Upenn - Pennsylvania Hospital                                                                                                                                                 | Episodes, Episodes 2.0, Reports, Lessons, TCI | Administration                             | ROLE_TCS       | Patient ID     | Episode DRG Issues           |      | UPenn - Hospital of the Univ. of Pennsylvania, UPenn - Pennsylvania Hospital, UPenn - Penn Presbyterian Hospital                       |                                                                                                                                                                                                                                                          |
      | Edit Data permissions                                                      | Super Admin | Remedy RN                       | Remedy RN                       | Remedy RN                     |     | RRNFirstName                                       | RRNLastName                                        | 987-890-9878 | Episodes, Episodes 2.0, Reports, Lessons,TCI  | Administration                                  | TeamHealth                                     | TeamHealth--BPCI Model 3                                                                                                     | TeamHealth--3056-q91--Rhea Medical Center, TeamHealth--3056-q91--The Medical Center At Franklin                                                                                                                                                                                                                 | Episodes, Episodes 2.0, Reports, TCI, Lessons | Administration                             | ROLE_RN        | Patient ID     | Episode DRG Issues           |      | Rhea Medical Center, The Medical Center At Franklin                                                                                    | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University |
      | Edit Data permissions and learning pathways                                | Super Admin | Remedy LPN                      | Remedy LPN                      | Remedy LPN                    |     | RLPNFirstName                                      | RLPNLastName                                       | 989-898-9898 | Episodes, Episodes 2.0, Reports, Lessons, TCI | Administration                                  | TeamHealth                                     | TeamHealth--BPCI Model 3, TeamHealth--BPCI Model 2                                                                           | TeamHealth--2070-g14--North Broward Medical Center , TeamHealth--3056-q91--The Medical Center At Franklin                                                                                                                                                                                                       | Episodes, Episodes 2.0, Reports, TCI, Lessons | Administration                             | ROLE_LPN       | Patient ID     | Episode DRG Issues [Model 3] |      | North Broward Medical Center, The Medical Center At Franklin                                                                           | i am learning path, Learning Pathway 2                                                                                                                                                                                                                   |
      #| Edit Data permissions                                                      | Super Admin | Prospective Partner Executive   | Prospective Partner Executive   | Prospective Partner Executive |     | PPEFirstName                                       | PPELastName                                        |              | Lessons, TCI                                  | Administration                                  | Penn                                           | Penn--BPCI Model 2                                                                                                           | Penn--2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania, Penn--2070-021--Upenn - Penn Presbyterian Hospital,Penn--2070-022--Upenn - Pennsylvania Hospital                                                                                                                                                 | TCI, Lessons                                       | Administration, Episodes, Episodes 2.0, Reports |                | Patient ID     | Episode DRG Issues           |      | UPenn - Hospital of the Univ. of Pennsylvania, UPenn - Pennsylvania Hospital, UPenn - Penn Presbyterian Hospital                       |                                                                                                                                                                                                                                                          |
      | Edit Data permissions                                                      | Super Admin | Remedy Field RN                 | Remedy Field RN                 | Remedy Field RN               |     | RFRNFirstName                                      | RFRNLastName                                       |              | Episodes, Episodes 2.0, Reports, Lessons, TCI | Administration                                  | Stamford Hospital, TeamHealth                  | Stamford Hospital--BPCI Model 2, TeamHealth--BPCI Model 3                                                                    | Stamford Hospital--2070-015--Stamford Hospital, TeamHealth--3056-q91--The Medical Center At Franklin                                                                                                                                                                                                            | Episodes, Episodes 2.0, Reports, TCI, Lessons | Administration                             | ROLE_FRN       | Patient ID     | Episode DRG Issues [Model 3] |      | Stamford Hospital, The Medical Center At Franklin                                                                                      | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2                    |
      | Edit Data permissions                                                      | Super Admin | Partner Program Administrator   | Partner Program Administrator   | Partner Program Administrator |     | PPAFirstName                                       | PPALastName                                        |              | Episodes 2.0, Episodes, Reports, Lessons, TCI | Administration                                  | United Health Services of New York, TeamHealth | TeamHealth--BPCI Model 3, United Health Services of New York--BPCI Model 3, United Health Services of New York--BPCI Model 2 | United Health Services of New York--3090-209--Uhs Twin Tier Home Health Inc, United Health Services of New York--6005-197--Binghamton General-sandiford Rehabilitation Center, TeamHealth--3056-q91--Rhea Medical Center, TeamHealth--3056-q91--The Medical Center At Franklin, TeamHealth--3056-q99--204595837 | Episodes, Reports, TCI, Lessons               | Administration                             | ROLE_PRM       | Patient ID     | Episode DRG Issues [Model 3] |      | Rhea Medical Center, The Medical Center At Franklin, Uhs Twin Tier Home Health Inc, Binghamton General-sandiford Rehabilitation Center | i am learning path, Learning Pathway 2, max-test-052417, Physician Acute Care Hospital Model 2, Remedy University                                                                                                                                        |
