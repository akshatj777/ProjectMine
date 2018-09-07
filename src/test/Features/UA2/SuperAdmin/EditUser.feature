Feature: Edit user page for SA

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
      | User        | FirstName                                 | LastName                                 | Email                           | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                                                                                                                                                                                       | LearningPathways                                                                                                     | Locations                                                                                                                                                                                                                                                                                                                                                                  | expStatusCode |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Leader                          | 1-Leader                           | episode_connect-Episode Connect Classic, reports-Reporting Classic, Remedy University-Remedy University, analytics-Reporting                                                                                                                                                       | 3hSOHNAnvjc1,NFdw0Kts2C01,n9yn5n0Qa581                                                                               | 514083--2070-015--TSH                                                                                                                                                                                                                                                                                                                                                      |           200 |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedypartners.com |            |     | Manager                         | 2-Manager                          | episode_connect-Episode Connect Classic, reports-Reporting Classic, Remedy University-Remedy University, analytics-Reporting                                                                                                                                                       | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,qfy2xp8zSFc1,18h7phZr1h81                                                     | 441324--6005-059--140007, 441324--6005-059--140010, 441324--3090-068--290039                                                                                                                                                                                                                                                                                               |           200 |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedypartners.com | 9988776655 |     | Advanced Operator               | 3-Advanced Operator                | episode_connect-Episode Connect Classic, reports-Reporting Classic, Remedy University-Remedy University, analytics-Reporting                                                                                                                                                       | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,5HDc3E6aK_E1                                                                  | 514029--2070-025--T, 514029--2070-028--310060                                                                                                                                                                                                                                                                                                                              |           200 |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            | NPI | Physicians                      | 4-Physicians                       | episode_connect-Episode Connect Classic, reports-Reporting Classic, Remedy University-Remedy University, analytics-Reporting                                                                                                                                                       | 3hSOHNAnvjc1,18h7phZr1h81,n9yn5n0Qa581                                                                               | 439120--2070-c82--FWD, 439120--2070-c83--HCH                                                                                                                                                                                                                                                                                                                               |           200 |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedypartners.com | 9988776655 |     | Remedy Executive                | 14-Remedy Executive                | episode_connect-Episode Connect Classic, episode_connect_2-Episode Connect for Post-acute Care, reports-Reporting Classic, tci-Care Innovation Institute, Remedy University-Remedy University, community_connect-Community Connect, analytics-Reporting                            | jusUV22erpk1,HZhmTBQzHtU1,n9yn5n0Qa581                                                                               | 441324--3090-068--290039, 514083--2070-015--TSH                                                                                                                                                                                                                                                                                                                            |           200 |
      | Super Admin | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Prospective Partner Executive   | 15-Prospective Partner Executive   | Remedy University-Remedy University                                                                                                                                                                                                                                                |                                                                                                                      | 441324--6005-059--140007, 441324--6005-059--140010                                                                                                                                                                                                                                                                                                                         |           200 |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedypartners.com |            |     | Remedy Other                    | 17-Remedy Other                    | episode_connect-Episode Connect Classic, episode_connect_2-Episode Connect for Post-acute Care, tci-Care Innovation Institute, Remedy University-Remedy University, reports-Reporting Classic, community_connect-Community Connect, care_connect-Care Connect, analytics-Reporting | HZhmTBQzHtU1,18h7phZr1h81                                                                                            | 514083--2070-015--TSH                                                                                                                                                                                                                                                                                                                                                      |           200 |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedypartners.com |            |     | Partner Program Administrator   | 18-Partner Program Administrator   | episode_connect-Episode Connect Classic, reports-Reporting Classic, Remedy University-Remedy University, episode_connect_2-Episode Connect for Post-acute Care                                                                                                                     | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,18h7phZr1h81,n9yn5n0Qa581                                                     | 514083--2070-015--TSH                                                                                                                                                                                                                                                                                                                                                      |           200 |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedypartners.com | 9988776655 |     | Remedy Program Administrator    | 19-Remedy Program Administrator    | episode_connect-Episode Connect Classic, episode_connect_2-Episode Connect for Post-acute Care, reports-Reporting Classic, tci-Care Innovation Institute, Remedy University-Remedy University, analytics-Reporting                                                                 | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581                                        | 439120--2070-c83--HCH, 439120--2070-c83--100073-REH, 439120--2070-c85--220066-IRF, 439120--2070-c85--MMC, 514083--2070-015--TSH, 514029--2070-025--T, 514029--2070-028--310060                                                                                                                                                                                             |           200 |
      | Super Admin | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic, reports-Reporting Classic, admin-Administration, Remedy University-Remedy University, analytics-Reporting                                                                                                                                 | NFdw0Kts2C01,HZhmTBQzHtU1,n9yn5n0Qa581                                                                               | 441324--6005-059--140007, 441324--3090-068--290039, 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046 |           200 |
      | Super Admin | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Operator                        | 22-Operator                        | episode_connect-Episode Connect Classic, reports-Reporting Classic, Remedy University-Remedy University, analytics-Reporting                                                                                                                                                       | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,HZhmTBQzHtU1,5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 | 514029--2070-028--310060, 514029--2070-025--T, 514029--2070-025--390326, 514029--2070-028--SLW                                                                                                                                                                                                                                                                             |           200 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
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
      | Description                                           | User        | FirstName  | LastName   | Email                            | Phone      | Role       | NPI        | ValidationMsg                     |
      | Verify validation message for blank First name        | Super Admin |            | Last Name  | qaautomation@remedypartners.com2 | 9874563210 | Leader     |            | First Name is required            |
      | Verify validation message for blank Last name         | Super Admin | First Name |            | qaautomation@remedypartners.com2 | 9874563210 | Leader     |            | Last Name is required             |
      | Verify validation message for blank NPI               | Super Admin | First Name | Last Name  | qaautomation@remedypartners.com2 | 9874563210 | Physicians |            | NPI is required                   |
      | Verify validation message for invalid Phone           | Super Admin | First Name | Last Name  | qaautomation@remedypartners.com2 |     123564 | Physicians | NPI        | Please enter a valid phone number |
      | Verify validation message for NPI less than 10 digits | Super Admin | First Name | Last Name  | qaautomation@remedypartners.com2 | 9874563210 | Physicians |     123564 | Please enter a valid NPI          |
      | Verify validation message for NPI as alphabets        | Super Admin | First Name | Last Name  | qaautomation@remedypartners.com2 | 9874563210 | Physicians | abcdefgihj | Please enter a valid NPI          |
      | Verify validation message for NPI as alphanumeric     | Super Admin | First Name | Last Name  | qaautomation@remedypartners.com2 | 9874563210 | Physicians | abcde12345 | Please enter a valid NPI          |
      | Verify validation message for invalid First Name      | Super Admin | 8473827919 | Last Name  | qaautomation@remedypartners.com2 | 9874563210 | Physicians | NPI        | Please enter a valid name         |
      | Verify validation message for invalid Last name       | Super Admin | First Name | 8473827919 | qaautomation@remedypartners.com2 | 9874563210 | Physicians | NPI        | Please enter a valid name         |

  Scenario Outline: Verify auto selected programs in Organizations
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
    And I click on Edit button
    Then I select "Permissions" tab
    Then I verify the header "Permissions"
    Then I select already selected "<Health System>"
    Then I verify default program "BPCI Model 2" associated with organization

    Examples: 
      | User        | Role   | Health System     |
      | Super Admin | Leader | Stamford Hospital |

  Scenario Outline: Verify the functionality of back/Cancel button
    Given I am on the login page
    When I log in as super user
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
      | User        | Role   | HasHealthSystem2 |
      | Super Admin | Leader | Yes              |

  Scenario Outline: Invalid Health system and invalid location validation
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
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
    And I verify No results found for invalid Location in selected organisation
    Then I click on existing organisation "<Health System2>"
    Then I verify incomplete status for health system

    Examples: 
      | User        | Role    | HasHealthSystem2 | InvalidHealthSystem | Health System2    | Programs2    | invalidLocations |
      | Super Admin | Manager | Yes              | hdvb                | Stamford Hospital | BPCI Model 2 | hkfj             |

  Scenario Outline: Verify the search functionality in selected locations and delete a location
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
    And I click on Edit button
    Then I select "Permissions" tab
    Then I verify the header "Permissions"
    Then I click on existing organisation "<Health System>"
    And I verify selected Location "<SelectedLocations>" in the selected Locations section
    Then I search the "<Locations>" in the Selected Locations section
    Then I verify facility key "<facilityKey>" is displayed with location name "Presence Saint Joseph Medical Center"
    And I click on remove link icon for selected Locations on selected Locations section
    And I verify Selected Locations section after click on remove link icon

    Examples: 
      | User        | UserName                               | Password | Role    | Health System    | SelectedLocations                             | Locations                                      | facilityKey |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | Manager | Sound Physicians | Presence Saint Joseph Medical Center (140007) | 6005-059--Presence Saint Joseph Medical Center |      140007 |

  Scenario Outline: Changing role from physician to Manager then back to Physicians
    Given I am on the login page
    When I log in as super user
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
      | User        | UserName                               | Password | Email                            | NPI1 | NPI2 | PreviousRole | Role    |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com2 |      | NPI  | Physicians   | Manager |

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
    Then I click on existing organisation "<ClickHealthSystem>"
    Then I deselect "<RemovePrograms>" programs
    Then I deselect "<RemoveLocations>" locations
    Then I click on existing organisation "<ClickHealthSystem2>"
    Then I deselect "<RemovePrograms2>" programs
    Then I deselect "<RemoveLocations2>" locations
    Then I click on existing organisation "<ClickHealthSystem3>"
    Then I deselect "<RemovePrograms3>" programs
    Then I deselect "<RemoveLocations3>" locations
    Then I remove health system "<RemoveHealthSystem>"
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
    Then I verify enabled "<EnableApplications>"
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
      | Description                                                                 | User        | UserName                               | Password | Email                           | NPI | Phone        | PreviousRole                  | Role                            | ApplicationsUnchecked                                                                                                                                  | ApplicationsChecked                                           | EnableApplications                                                                                                                                                        | DisableApplications                                                                                         | Applications                                                                                                                                      | ApplicationsNotVisible                                                                                                      | RemoveLearningPathwaySearchParameter | LearningPathwayID | AddLearningPathwaySearchParameter | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName                   | BPID | LearningPathway                                                                                                                                          | FirstName                                 | LastName                                 | Facilities                                                                                                                                 | RemoveHealthSystem                                            | RemoveLocations | RemovePrograms | ClickHealthSystem                                                      | Health System    | Programs                   | Locations                                                                                                    | HealthSystemsValidation                                       | ProgramsValidation                                                                                      | LocationsValidation                                                                                                                                                                                                                                                                        | HasHealthSystem2 | Health System2   | Programs2    | Locations2                                                                  | HasHealthSystem3 | Health System3                                                         | Programs3    | Locations3                        | RemoveLocations2                                                                                                         | RemovePrograms2 | ClickHealthSystem2 | RemoveLocations3                    | RemovePrograms3 | ClickHealthSystem3                                                     |  |
      | Change user role and then provision the user                                | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com |     |              | Leader                        | Partner Program Administrator   | Episode Connect for Post-acute Care                                                                                                                    | Episode Connect Classic, Reporting Classic, Remedy University | Episode Connect Classic, Reporting Classic, Remedy University, Episode Connect for Post-acute Care                                                                        |                                                                                                             | Episodes Classic, Reporting Classic, Remedy University, Episodes Post Acute, Care Innovation Institute                                            | Administration, Reporting                                                                                                              |                                      |                   |                                   |                                | ROLE_PRM | Patient ID     | Episode DRG Issues           |      | i am learning path, Learning Pathway 2, Remedy University                                                                                                | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Stamford Hospital                                                                                                                          |                                                               |                 |                |                                                                        |                  |                            |                                                                                                              |                                                               |                                                                                                         |                                                                                                                                                                                                                                                                                            |                  |                  |              |                                                                             |                  |                                                                        |              |                                   |                                                                                                                          |                 |                    |                                     |                 |                                                                        |  |
      | Change the General Details, Application access and then provision the user  | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com |     | 998-877-6655 |                               | Advanced Operator               |                                                                                                                                                        |                                                               | Episode Connect Classic, Remedy University, Reporting Classic, Reporting                                                                                                  | Reporting Classic                                                                                           | Episodes Classic, Care Innovation Institute, Remedy University, Reporting                                                                         | Episodes Post Acute, Administration, Reporting Classic                                                                      |                                      |                   |                                   |                                | ROLE_TCS | Patient ID     | Episode DRG Issues           |      | i am learning path, Learning Pathway 2, max-test-052417, Care Coordination External                                                                      | FirstName                                 | LastName                                 | River Parishes Hospital, ST LUKE'S WARREN HOSPITAL                                                                                         |                                                               |                 |                |                                                                        |                  |                            |                                                                                                              |                                                               |                                                                                                         |                                                                                                                                                                                                                                                                                            |                  |                  |              |                                                                             |                  |                                                                        |              |                                   |                                                                                                                          |                 |                    |                                     |                 |                                                                        |  |
      | Remove existing organisation, add a new org and then provision the user     | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com |     |              |                               | Partner Program Administrator   |                                                                                                                                                        |                                                               | Reporting Classic, Episode Connect Classic, Remedy University                                                                                                             |                                                                                                             | Reporting Classic, Episodes Classic, Care Innovation Institute, Remedy University                                                                 | Administration, Episodes Post Acute, Reporting                                                                                         |                                      |                   |                                   |                                | ROLE_PRM | Patient ID     | Episode DRG Issues           |      | i am learning path, Learning Pathway 2, Remedy University                                                                                                | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Presence Saint Joseph Medical Center, Evanston Hospital                                                                                    | Stamford Hospital                                             |                 |                |                                                                        | Sound Physicians | BPCI Model 2               | 6005-059--Presence Saint Joseph Medical Center, 6005-059--Evanston Hospital                                  | Sound Physicians                                              | Sound Physicians--BPCI Model 2                                                                          | Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--6005-059--Evanston Hospital                                                                                                                                                                            |                  |                  |              |                                                                             |                  |                                                                        |              |                                   |                                                                                                                          |                 |                    |                                     |                 |                                                                        |  |
      | Add two orgs to existing data and then provision the user                   | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com |     |              |                               | Remedy Other                    |                                                                                                                                                        |                                                               | Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Care Innovation Institute, Reporting | Remedy University, Reporting Classic, Community Connect, Care Connect, Care Innovation Institute, Reporting | Episodes Classic, Episodes Post Acute                                                                                                             | Administration, Remedy University, Reporting Classic, Community Connect, Care Connect, Care Innovation Institute, Reporting |                                      |                   |                                   |                                | ROLE_PRM | Patient ID     | Episode DRG Issues           |      |                                                                                                                                                          | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | Presence Saint Joseph Medical Center, Evanston Hospital, Stamford Hospital, River Parishes Hospital                                        |                                                               |                 |                |                                                                        |                  |                            |                                                                                                              | Stamford Hospital, Sound Physicians, St. Lukes Health Network | Stamford Hospital--BPCI Model 2, Sound Physicians--BPCI Model 2, St. Lukes Health Network--BPCI Model 2 | Stamford Hospital--2070-015--Stamford Hospital, Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--6005-059--Evanston Hospital, St. Lukes Health Network--2070-025--River Parishes Hospital                                                               | Yes              | Sound Physicians | BPCI Model 2 | 6005-059--Presence Saint Joseph Medical Center, 6005-059--Evanston Hospital | Yes              | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network | BPCI Model 2 | 2070-025--River Parishes Hospital |                                                                                                                          |                 |                    |                                     |                 |                                                                        |  |
      | Edit single location to multiple locations and then provision the user      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com |     |              |                               | Remedy Executive                |                                                                                                                                                        |                                                               | Episode Connect Classic, Episode Connect for Post-acute Care, Reporting Classic, Remedy University, Community Connect, Care Innovation Institute, Reporting               |                                                                                                             | Episodes Classic, Episodes Post Acute, Reporting Classic, Care Innovation Institute, Remedy University, Community Connect, Reporting              | Administration                                                                                                              |                                      |                   |                                   |                                | ROLE_PRM | Patient ID     | Episode DRG Issues [Model 3] |      | max-test-052417, New learning Path, Remedy University                                                                                                    | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | Mountainview Hospital, Stamford Hospital, Vaughan Regional Medical Center Parkway Campus                                                   |                                                               |                 |                | Sound Physicians                                                       |                  |                            | 3090-068--Vaughan Regional Medical Center Parkway Campus                                                     | Stamford Hospital, Sound Physicians                           | Stamford Hospital--BPCI Model 2, Sound Physicians--BPCI Model 3                                         | Stamford Hospital--2070-015--Stamford Hospital, Sound Physicians--3090-068--Vaughan Regional Medical Center Parkway Campus, Sound Physicians--3090-068--Mountainview Hospital                                                                                                              |                  |                  |              |                                                                             |                  |                                                                        |              |                                   |                                                                                                                          |                 |                    |                                     |                 |                                                                        |  |
      | Edit to all locations and then provision the user                           | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com |     |              |                               | Advanced Operator               |                                                                                                                                                        |                                                               | Episode Connect Classic, Remedy University, Reporting Classic, Reporting                                                                                                  |                                                                                                             | Episodes Classic, Care Innovation Institute, Remedy University, Reporting Classic, Reporting                                                      | Episodes Post Acute, Administration                                                                                         |                                      |                   |                                   |                                | ROLE_TCS | Patient ID     | Episode DRG Issues           |      | i am learning path, Learning Pathway 2, max-test-052417, Care Coordination External                                                                      | FirstName                                 | LastName                                 | ST LUKE'S WARREN HOSPITAL, River Parishes Hospital, ST LUKE'S HOSPITAL - ANDERSON CAMPUS, Holy Cross Hospital A Div Of Taos Health Systems |                                                               |                 |                | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network |                  |                            | All Locations                                                                                                | St. Lukes Health Network                                      | St. Lukes Health Network--BPCI Model 2                                                                  | St. Lukes Health Network--2070-028--ST LUKE'S WARREN HOSPITAL, St. Lukes Health Network--2070-025--River Parishes Hospital, St. Lukes Health Network--2070-025--ST LUKE'S HOSPITAL - ANDERSON CAMPUS, St. Lukes Health Network--2070-028--Holy Cross Hospital A Div Of Taos Health Systems |                  |                  |              |                                                                             |                  |                                                                        |              |                                   |                                                                                                                          |                 |                    |                                     |                 |                                                                        |  |
      | Edit all locations to single location and then provision the user           | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com |     |              |                               | Advanced Operator               |                                                                                                                                                        |                                                               | Episode Connect Classic, Remedy University, Reporting Classic, Reporting                                                                                                  |                                                                                                             | Episodes Classic, Care Innovation Institute, Remedy University, Reporting Classic, Reporting                                                      | Episodes Post Acute, Administration                                                                                         |                                      |                   |                                   |                                | ROLE_TCS | Patient ID     | Episode DRG Issues           |      | i am learning path, Learning Pathway 2, max-test-052417, Care Coordination External                                                                      | FirstName                                 | LastName                                 | ST LUKE'S WARREN HOSPITAL                                                                                                                  |                                                               | All Locations   |                | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network |                  |                            | 2070-028--ST LUKE'S WARREN HOSPITAL                                                                          | St. Lukes Health Network                                      | St. Lukes Health Network--BPCI Model 2                                                                  | St. Lukes Health Network--2070-028--ST LUKE'S WARREN HOSPITAL                                                                                                                                                                                                                              |                  |                  |              |                                                                             |                  |                                                                        |              |                                   |                                                                                                                          |                 |                    |                                     |                 |                                                                        |  |
      | Edit and disable M2 program and then provision the user                     | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com |     |              |                               | Manager                         |                                                                                                                                                        |                                                               | Episode Connect Classic, Reporting Classic, Remedy University, Reporting                                                                                                  |                                                                                                             | Episodes Classic, Reporting Classic, Care Innovation Institute, Remedy University, Reporting                                                      | Administration                                                                                                              |                                      |                   |                                   |                                | ROLE_PRM | Patient ID     | Episode DRG Issues [Model 3] |      | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2                    | FirstName                                 | LastName                                 | Mountainview Hospital                                                                                                                      |                                                               |                 | BPCI Model 2   | Sound Physicians                                                       |                  |                            |                                                                                                              | Sound Physicians                                              | Sound Physicians--BPCI Model 3                                                                          | Sound Physicians--3090-068--Mountainview Hospital                                                                                                                                                                                                                                          |                  |                  |              |                                                                             |                  |                                                                        |              |                                   |                                                                                                                          |                 |                    |                                     |                 |                                                                        |  |
      | Edit and disable M3 program and then provision the user                     | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com |     |              |                               | Partner Technical Administrator |                                                                                                                                                        |                                                               | Episode Connect Classic, Reporting Classic, Remedy University, Administration, Reporting                                                                                  |                                                                                                             | Episodes Classic, Reporting Classic, Care Innovation Institute, Remedy University, Administration, Reporting                                      | Episodes Post Acute                                                                                                         |                                      |                   |                                   |                                | ROLE_PRM | Patient ID     | Episode DRG Issues           |      | Learning Pathway 2, New learning Path, Remedy University                                                                                                 | FirstName                                 | LastNameLastNameLastNameLastNameLastName | Presence Saint Joseph Medical Center                                                                                                       |                                                               |                 | BPCI Model 3   | Sound Physicians                                                       |                  |                            |                                                                                                              | Sound Physicians                                              | Sound Physicians--BPCI Model 2                                                                          | Sound Physicians--6005-059--Presence Saint Joseph Medical Center                                                                                                                                                                                                                           |                  |                  |              |                                                                             |                  |                                                                        |              |                                   |                                                                                                                          |                 |                    |                                     |                 |                                                                        |  |
      | Edit general information, edit role and remove existing org and add new org | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com |     | 998-877-6655 | Remedy Other                  | Leader                          | Remedy University, Reporting Classic, Reporting                                                                                                        | Episode Connect Classic                                       | Episode Connect Classic, Reporting Classic, Remedy University, Reporting                                                                                                  |                                                                                                             | Episodes Classic, Reporting Classic, Remedy University, Reporting                                                                                 | Administration, Episodes Post Acute                                                                                         |                                      |                   |                                   |                                | ROLE_PRM | Patient ID     | Episode DRG Issues           |      | New learning Path, Physician Acute Care Hospital Model 2                                                                                                 | FirstName                                 | LastName                                 | Presence Saint Joseph Medical Center, Evanston Hospital, Mountainview Hospital                                                             | Stamford Hospital, Sound Physicians, St. Lukes Health Network |                 |                |                                                                        | Sound Physicians | BPCI Model 2, BPCI Model 3 | 6005-059--Presence Saint Joseph Medical Center, 6005-059--Evanston Hospital, 3090-068--Mountainview Hospital | Sound Physicians                                              | Sound Physicians--BPCI Model 2, Sound Physicians--BPCI Model 3                                          | Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--6005-059--Evanston Hospital, Sound Physicians--3090-068--Mountainview Hospital                                                                                                                         |                  |                  |              |                                                                             |                  |                                                                        |              |                                   |                                                                                                                          |                 |                    |                                     |                 |                                                                        |  |
      | Edit role and add new org                                                   | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com |     |              | Prospective Partner Executive | Remedy Other                    | Episode Connect Classic, Episode Connect for Post-acute Care, Reporting Classic, Community Connect, Care Connect, Care Innovation Institute, Reporting | Remedy University                                             | Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Reporting Classic, Community Connect, Care Connect, Care Innovation Institute, Reporting |                                                                                                             | Episode Classic, Reporting Classic, Remedy University, Episodes Post Acute, Care Innovation Institute, Community Connect, Care Connect, Reporting | Administration                                                                                                              |                                      |                   |                                   |                                | ROLE_PRM | Patient ID     | Episode DRG Issues           |      |                                                                                                                                                          | FirstName                                 | LastNameLastNameLastNameLastNameLastName | Presence Saint Joseph Medical Center, Evanston Hospital, Stamford Hospital, Saint Francis Hospital                                         |                                                               |                 |                |                                                                        |                  |                            |                                                                                                              | Sound Physicians, Stamford Hospital, Trinity Health           | Sound Physicians--BPCI Model 2, Stamford Hospital--BPCI Model 2, Trinity Health--BPCI Model 2           | Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--6005-059--Evanston Hospital, Stamford Hospital--2070-015--Stamford Hospital, Trinity Health--2070-c82--Saint Francis Hospital                                                                          | Yes              | Trinity Health   | BPCI Model 2 | 2070-c82--Saint Francis Hospital                                            | Yes              | Stamford Hospital                                                      | BPCI Model 2 | 2070-015--Stamford Hospital       |                                                                                                                          |                 |                    |                                     |                 |                                                                        |  |
      | Edit data permissions for user with 3 orgs                                  | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com |     |              |                               | Remedy Program Administrator    |                                                                                                                                                        |                                                               | Episode Connect Classic, Reporting Classic, Remedy University, Episode Connect for Post-acute Care, Care Innovation Institute, Reporting                                  |                                                                                                             | Reporting, Episodes Classic, Reporting Classic, Remedy University, Episodes Post Acute, Care Innovation Institute                                 | Administration                                                                                                              |                                      |                   |                                   |                                | ROLE_PRM | Patient ID     | Episode DRG Issues           |      | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName                                 | LastName                                 | River Parishes Hospital, Mercy Medical Center - Springfield                                                                                | Stamford Hospital                                             |                 |                |                                                                        |                  |                            |                                                                                                              | Trinity Health, St. Lukes Health Network                      | Trinity Health--BPCI Model 2, St. Lukes Health Network--BPCI Model 2                                    | Trinity Health--2070-c85--Mercy Medical Center - Springfield, St. Lukes Health Network--2070-025--River Parishes Hospital                                                                                                                                                                  |                  |                  |              |                                                                             |                  |                                                                        |              |                                   | 2070-c85--Indianspring Of Oakley, 2070-c83--Holy Cross Hospital - Fort Lauderdale, 2070-c83--Kindred At Home - Vancouver |                 | Trinity Health     | 2070-028--ST LUKE'S WARREN HOSPITAL |                 | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network |  |

  Scenario: Verify NPI on the EC1 tile
    Given I am on the login page
    When I enter email field qa.admin@yopmail.com for login
    And I enter password field Episode1! for Login
    And I click Access button
    And I click on Episode1 tile for "Super Admin-Physicians" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "Super Admin-Physicians" user
    And I verify NPI on ECI for "Super Admin-Physicians" user

  Scenario Outline: Remove selected locations and then remove the org
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System>"
    Then I select "<DisableLocations>" locations
    Then I remove health system "<Health System>"
    Then I click on Submit button while edit for "<User>-<Role>"

    Examples: 
      | User        | Role                         | Health System                                                          | DisableLocations                  |
      | Super Admin | Remedy Program Administrator | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network | 2070-025--River Parishes Hospital |

  Scenario Outline: Validating- all locations should not be displayed as selected when the "All Locations" check box is unchecked while editing the user
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System>"
    Then I select "<AddLocations>" locations
    Then I deselect "<AddLocations>" locations
    And I verify Location "<SelectedLocations>" are not shown in selected Locations section

    Examples: 
      | User        | Role       | Health System  | AddLocations  | SelectedLocations                         |
      | Super Admin | Physicians | Trinity Health | All Locations | Saint Francis Hospital - Wilmington (FWD) |

  Scenario Outline: Validating pagination for locations and Error message "User does not exist. Please go back to the users list page." should not be displayed
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I verify the header "Permissions"
    Then I click on existing organisation "<Remove HealthSystem1>"
    Then I verify that pagination is not displayed for selected locations
    Then I remove health system "<Remove HealthSystem1>"
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify error message "User does not exist. Please go back to the users list page." is not displayed

    Examples: 
      | User        | Role     | Remove HealthSystem1                                                   | Health System                                                          | Programs     | Locations     |
      | Super Admin | Operator | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network | BPCI Model 2 | All Locations |
