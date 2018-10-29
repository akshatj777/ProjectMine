Feature: UI Scenarios - Super Admin User

  Scenario Outline: Login page validation- <Description>
    Given I am on the login page
    And I should see Log in widget
    Then I should see email textbox field
    Then I should verify watermark text appearing under email textbox field
    Then I should see password textbox field
    Then I should verify watermark text appearing under password textbox field
    Then I should see forgot password link
    Then I should see Log In button
    Then I refresh the page
    When I enter email field <Email> for login
    And I enter password field <Password> for Login
    Then I click Access button
    Then I verify the validation message "<ValidationMsg>"

    Examples: 
      | Description                   | Email                                  | Password | ValidationMsg            |
      | correct username and password | lbarinstein+qaadmin@remedypartners.com | Testing1 | Remedy Connect           |
      | blank password                | lbarinstein+qaadmin@remedypartners.com |          | Can't be blank           |
      | Wrong credentials             | lbarinstein+qaadmin@remedypartners.com | Testing8 | WRONG EMAIL OR PASSWORD. |
      | Blank email and password      |                                        |          | Can't be blank           |

  Scenario Outline: Create Physician through API call and then verify the user
    Given Build JSON for Create User "<FirstName>" and "<LastName>" and "<Email>" and "<Phone>" and "<NPI>" and "<RoleID>" and "<Applications>" and "<Locations>" and "<LearningPathways>"
    When Create User with this data for "<User>"
    Then Verify Actual vs expected results "<expStatusCode>" and "<responseMsg>"
    Given I am on mail login page
    Then I enter username "qaautomation@remedysystems.com" to login mail account
    Then I enter password "9h$00v3T$dF@OPn0" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

    Examples: 
      | User        | FirstName                                 | LastName                                 | Email                          | Phone | NPI | Role       | RoleID       | Applications                                                                                | LearningPathways                       | Locations             | expStatusCode |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       | NPI | Physicians | 4-Physicians | episode_connect-Episode Connect Classic,reports-Reporting Classic,lessons-Remedy University | 3hSOHNAnvjc1,18h7phZr1h81,n9yn5n0Qa581 | 514083--2070-015--TSH |           200 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
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
    And I switch the focus to Next button
    Then I verify the validation message "<ValidationMsg>" on Create User Page

    Examples: 
      | Description                                           | FirstName   | LastName    | Email                          | Phone      | Role       | NPI        | ValidationMsg                     |
      | Verify validation message for blank First name        |             | Last Name   | qaautomation@remedysystems.com | 9874563210 | Leader     |            | First Name is required            |
      | Verify validation message for blank Last name         | First Name  |             | qaautomation@remedysystems.com | 9874563210 | Leader     |            | Last Name is required             |
      | Verify validation message for blank Email             | First Name  | Last Name   |                                | 9874563210 | Leader     |            | Email is required                 |
      | Verify validation message for blank NPI               | First Name  | Last Name   | qaautomation@remedysystems.com | 9874563210 | Physicians |            | NPI is required                   |
      | Verify validation message for invalid Email           | First Name  | Last Name   | abc                            | 9874563210 | Physicians | NPI        | Please enter a valid email        |
      | Verify validation message for invalid Phone           | First Name  | Last Name   | qaautomation@remedysystems.com |     123564 | Physicians | NPI        | Please enter a valid phone number |
      | Verify validation message for NPI less than 10 digits | First Name  | Last Name   | qaautomation@remedysystems.com | 9874563210 | Physicians |     123564 | Please enter a valid NPI          |
      | Verify validation message for NPI as alphabets        | First Name  | Last Name   | qaautomation@remedysystems.com | 9874563210 | Physicians | abcdefgihj | Please enter a valid NPI          |
      | Verify validation message for NPI as alphanumeric     | First Name  | Last Name   | qaautomation@remedysystems.com | 9874563210 | Physicians | abcde12345 | Please enter a valid NPI          |
      | Verify validation message for invalid First Name      | 84738&27919 | Last Name   | qaautomation@remedysystems.com | 9874563210 | Physicians | NPI        | Please enter a valid name         |
      | Verify validation message for invalid Last name       | First Name  | 84738&27919 | qaautomation@remedysystems.com | 9874563210 | Physicians | NPI        | Please enter a valid name         |
      | Verify validation message for NPI as .                | First Name  | Last Name   | qaautomation@remedysystems.com | 9874563210 | Physicians | .........1 | Please enter a valid NPI          |

  Scenario Outline: Verify validation message for invalid lesson name in search box
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "First Name"
    Then I fill in Last Name with Last Name
    And I enter Email "qaautomation@remedysystems.com" to Create user
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
      | Role   | Applications                                                  | LearningPathwayName |
      | Leader | Episode Connect Classic, Reporting Classic, Remedy University | Test123             |

  Scenario Outline: Verify auto selected programs in Organizations
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "FirstName"
    Then I fill in Last Name with LastName
    And I enter Email "qaautomation@remedysystems.com" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I select "<Applications>" product
    Then I click on Next button
    Then I verify the header "Permissions"
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I verify default program "BPCI Model 2" associated with organization

    Examples: 
      | Role   | Applications                                                  | Health System             |
      | Leader | Episode Connect Classic, Reporting Classic, Remedy University | Lawrence General Hospital |

  Scenario: Verify the functionality of back/Cancel button and tabs on the left on create user page
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "First Name"
    Then I fill in Last Name with LastName
    And I enter Email "qaautomation@remedysystems.com" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational Leader
    Then I click on Next button
    Then I verify the header "Applications"
    Then I click on "General Information" tab on the left
    Then I verify the header "General Information"
    Then I click on "Applications" tab on the left
    Then I verify the header "Applications"
    Then I select "Episode Connect Classic, Reporting Classic" product
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
    And I search for health system with Stamford Hospital
    And I select a Stamford Hospital
    Then I select "BPCI Model 2" programs
    Then I click on Select All Locations button
    Then I click on Cancel button
    Then I should see header text "Users"

  Scenario: Verify the functionality of Cross button on Permissions Tab on Create User page
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    And I fill in First Name with "First Name"
    Then I fill in Last Name with LastName
    And I enter Email "qaautomation@remedysystems.com" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational Leader
    Then I click on Next button
    Then I verify the header "Applications"
    Then I select "Episode Connect Classic, Reporting Classic" product
    Then I click on Next button
    And I search for health system with Stamford Hospital
    And I select a Stamford Hospital
    Then I click on Cross button
    Then I should see header text "Users"

  Scenario Outline: Verify removal of role and changing of the role to see the impact in the available applications
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "FirstName"
    Then I fill in Last Name with LastName
    And I enter Email "qaautomation@remedysystems.com" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational <Role1>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications1>" are unchecked
    Then I click on "General Information" tab on the left
    Then I verify the header "General Information"
    When I click the already selected Organizational Role Field
    Then I pick a Organizational <Role2>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications2>" are unchecked

    Examples: 
      | Role1                           | Applications1                                                                 | Role2                         | Applications2     |
      | Partner Technical Administrator | Episode Connect Classic, Reporting Classic, Remedy University, Administration | Prospective Partner Executive | Remedy University |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
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
    And I verify selected Location "<SelectedLocations>" in the selected Locations section
    Then I search the "<LocationsInvalid>" in the Selected Locations section
    And I verify No results found for invalid Location in selected organisation
    Then I search the "<SelectedLocations>" in the Selected Locations section
    And I click on remove link icon for selected Locations on selected Locations section
    And I verify Selected Locations section after click on remove link icon

    Examples: 
      | Description                                           | User        | UserName                               | Password | FirstName                                          | LastName                                           | Email                          | Phone | Role   | Applications                                                  | ApplicationsNotVisible                              | NPI | LearningPathwaySearchParameter         | Health System1   | Programs1                  | Locations1                                                                                                   | SelectedLocations                    | LocationsInvalid | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Verify the search functionality in selected locations | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastNameLastNameLN | qaautomation@remedysystems.com |       | Leader | Episode Connect Classic, Reporting Classic, Remedy University | Episode Connect for Post-acute Care, Administration |     | i am learning path, Learning Pathway 2 | Sound Physicians | BPCI Model 2, BPCI Model 3 | 6005-059--Presence Saint Joseph Medical Center, 6005-059--Evanston Hospital, 3090-068--Mountainview Hospital | Presence Saint Joseph Medical Center | fhdjfs           | No               |                |           |            | No               |                |           |            |

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
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
    And I click on remove link icon for selected Health system
    And I verify text on pop up window after click on remove link icon
    And I click on "Remove" button on permissions tab
    Then I verify the header "Permissions"

    Examples: 
      | Description                                         | User        | UserName                               | Password | FirstName | LastName | Email                          | Phone      | Role              | Applications                                                  | ApplicationsNotVisible                              | NPI | LearningPathwaySearchParameter         | Health System1   | Programs1    | Locations1                                                                  | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Verify successful removal of selected health system | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastName | qaautomation@remedysystems.com | 9988776655 | Advanced Operator | Episode Connect Classic, Reporting Classic, Remedy University | Episode Connect for Post-acute Care, Administration |     | i am learning path, Learning Pathway 2 | Sound Physicians | BPCI Model 2 | 6005-059--Presence Saint Joseph Medical Center, 6005-059--Evanston Hospital | No               |                |           |            | No               |                |           |            |

  Scenario Outline: Verify that Next button and left side menu is enabled only when mandatory fields are selected + Searching healthsystem with participantId, location by facility key and bpid
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
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
    Then I select "<Applications>" product
    Then I verify that Next button is "enabled"
    Then I click on Next button
    Then I verify that "General Information" menu is "enabled"
    Then I verify that "Permissions" menu is "enabled"
    Then I verify that Submit button is "disabled"
    And I search for health system with <ParticipantId>
    And I select a <Health System1>
    Then I select "<Programs1>" programs
    Then I select location by BPID "<Locations_BPID>"
    Then I select location by facility key "<Locations_facility key>"
    Then I verify that Submit button is "disabled"
    Then I select location by facility key "<Locations_facility key>"
    Then I verify that Submit button is "enabled"

    Examples: 
      | FirstName  | LastName  | Email                          | Role       | NPI | Applications      | ParticipantId | Health System1    | Programs1    | Locations_BPID              | Locations_facility key |
      | First'Name | Last'Name | qaautomation@remedysystems.com | Physicians | NPI | Reporting Classic |        514083 | Stamford Hospital | BPCI Model 2 | 2070-015--Stamford Hospital | TSH                    |

  Scenario Outline: Enter invalid health system and location and verify error message
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
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
    Then I select "<Applications>" product
    Then I click on Next button
    Then I verify the header "Permissions"
    And I search for health system with <Health System_invalid>
    And I verify No results found for invalid health system
    Then I click on Select dropdown
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select "<invalidLocations>" invalid locations
    And I verify No results found for invalid Location in selected organisation
    Then I click on existing organisation "<Health System>"
    Then I verify incomplete status for health system

    Examples: 
      | User        | UserName                               | Password | FirstName | LastName | Email                          | Phone      | Role              | Applications      | NPI | Health System_invalid | Health System     | Programs     | invalidLocations |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastName | qaautomation@remedysystems.com | 9988776655 | Advanced Operator | Reporting Classic |     | hkfj                  | Stamford Hospital | BPCI Model 2 | hkfj             |

  Scenario Outline: Creating user with existing NPI and validating error message
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
    Then I enter NPI field with existing NPI for "<User>-<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Next button
    Then I verify the header "Permissions"
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
    Then I click on Submit button to check for error message
    Then I should see error message for duplicate value "Account with this NPI already exists"

    Examples: 
      | User        | UserName                               | Password | FirstName | LastName | Email                          | Role       | Applications      | NPI | Health System     | Programs     | Locations                   |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastName | qaautomation@remedysystems.com | Physicians | Reporting Classic |     | Stamford Hospital | BPCI Model 2 | 2070-015--Stamford Hospital |

  Scenario Outline: Creating user with existing Email and validating error message
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
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
    Then I click on Submit button to check for error message
    Then I should see error message for duplicate value "Account with this email already exists"

    Examples: 
      | User        | UserName                               | Password | FirstName | LastName | Email                          | Role       | Applications      | NPI | Health System     | Programs     | Locations                   |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastName | qaautomation@remedysystems.com | Physicians | Reporting Classic | NPI | Stamford Hospital | BPCI Model 2 | 2070-015--Stamford Hospital |

  Scenario Outline: Validating that BPID with one location does not have All locations under BPID
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
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Next button
    Then I verify the header "Permissions"
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I verify that "<Locations>" is not present under the bpid

    Examples: 
      | User        | UserName                               | Password | FirstName | LastName | Email                          | Role       | Applications      | NPI | Health System     | Programs     | Locations    |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastName | qaautomation@remedysystems.com | Physicians | Reporting Classic | NPI | Stamford Hospital | BPCI Model 2 | All 2070-015 |

  Scenario Outline: Validating that on removing the organization and selecting it again, "incomplete" error message is not displayed
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
    Then I remove health system "<Remove HealthSystem>"
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
    Then I click on existing organisation "<Health System>"
    Then I verify incomplete status is not shown for health system

    Examples: 
      | User        | Role       | Remove HealthSystem | Health System     | Programs     | Locations                   |
      | Super Admin | Physicians | Stamford Hospital   | Stamford Hospital | BPCI Model 2 | 2070-015--Stamford Hospital |

  Scenario Outline: validating Learning Pathway on edit role
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
      | User        | UserName                               | Password | FirstName | LastName | Email                          | Role1      | Applications                         | NPI | LearningPathwaySearchParameter                      | Role2  |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastName | qaautomation@remedysystems.com | Physicians | Reporting Classic, Remedy University | NPI | Learning Pathway 2, jusUV22erpk1, Remedy University | Leader |

  Scenario Outline: Validate character limit for all fields in the general information tab
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
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

    Examples: 
      | User        | FirstName                                          | LastName                                           | Email                                                                        | Phone          | Role       | NPI |
      | Super Admin | FirstNameeFirstNameeFirstNameeFirstNameeFirstNamee | FirstNameeFirstNameeFirstNameeFirstNameeFirstNamee | TestmailTestmailTestmailTestmailTestmailTestmailTestmailTestmailAA@gmail.com | 98767592312314 | Physicians | NPI |
