Feature: PTA UI Scenarios

  Scenario Outline: Create PTA through API call and then verify the user
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
      | User                            | FirstName                            | LastName                                 | Email                           | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                                                        | LearningPathways                       | Locations                                                                                                                                                                                                                                                                                                              | expStatusCode |
      | Super Admin                     | FirstName                            | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,physician_portal-Physician Connect,admin-Administration,lessons-Lessons | 5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1 | 441355--ALL_BPIDS--ALL_FACILITIES                                                                                                                                                                                                                                                                                      |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastName                                 | qaautomation@remedypartners.com |            |     | Advanced Operator               | 3-Advanced Operator                | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,lessons-Lessons                                                         | 5HDc3E6aK_E1                           | 441355--3056-809--055922, 441355--3056-810--555442, 441355--3056-811--555394, 441355--3056-812--055797, 441355--3056-813--165218, 441355--3056-814--145571, 441355--3056-815--165559, 441355--3056-816--145769, 441355--3056-817--155446, 441355--3056-818--155295, 441355--3056-819--365489, 441355--3056-820--365488 |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 | NPI | Physicians                      | 4-Physicians                       | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,lessons-Lessons,physician_portal-Physician Connect                      | p11D0Vl2FSg1,qfy2xp8zSFc1              | 441355--3056-i37--056048, 441355--3056-i38--145783, 441355--3056-i39--155298, 441355--3056-i40--145862, 441355--3056-i41--155649                                                                                                                                                                                       |           200 |

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
    And I switch the focus to Next button
    Then I verify the validation message "<ValidationMsg>" on Create User Page

    Examples: 
      | Description                                           | FirstName   | LastName    | Email                           | Phone      | Role       | NPI        | ValidationMsg                     |
      | Verify validation message for blank First name        |             | Last Name   | qaautomation@remedypartners.com | 9874563210 | Leader     |            | First Name is required            |
      | Verify validation message for blank Last name         | First Name  |             | qaautomation@remedypartners.com | 9874563210 | Leader     |            | Last Name is required             |
      | Verify validation message for blank Email             | First Name  | Last Name   |                                 | 9874563210 | Leader     |            | Email is required                 |
      | Verify validation message for blank NPI               | First Name  | Last Name   | qaautomation@remedypartners.com | 9874563210 | Physicians |            | NPI is required                   |
      | Verify validation message for invalid Email           | First Name  | Last Name   | abc                             | 9874563210 | Physicians | NPI        | Please enter a valid email        |
      | Verify validation message for invalid Phone           | First Name  | Last Name   | qaautomation@remedypartners.com |     123564 | Physicians | NPI        | Please enter a valid phone number |
      | Verify validation message for NPI less than 10 digits | First Name  | Last Name   | qaautomation@remedypartners.com | 9874563210 | Physicians |     123564 | Please enter a valid NPI          |
      | Verify validation message for NPI as alphabets        | First Name  | Last Name   | qaautomation@remedypartners.com | 9874563210 | Physicians | abcdefgihj | Please enter a valid NPI          |
      | Verify validation message for NPI as alphanumeric     | First Name  | Last Name   | qaautomation@remedypartners.com | 9874563210 | Physicians | abcde12345 | Please enter a valid NPI          |
      | Verify validation message for invalid First Name      | 84738&27919 | Last Name   | qaautomation@remedypartners.com | 9874563210 | Physicians | NPI        | Please enter a valid name         |
      | Verify validation message for invalid Last name       | First Name  | 847&3827919 | qaautomation@remedypartners.com | 9874563210 | Physicians | NPI        | Please enter a valid name         |
      | Verify validation message for NPI as .                | First Name  | Last Name   | qaautomation@remedypartners.com | 9874563210 | Physicians | .........1 | Please enter a valid NPI          |

  Scenario Outline: Verify validation message for invalid lesson name in search box
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
    And I fill in First Name with "First Name"
    Then I fill in Last Name with Last Name
    And I enter Email "qaautomation@remedypartners.com" to Create user
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
      | Role   | Applications                                        | LearningPathwayName |
      | Leader | Episode Connect Classic, Reporting Classic, Lessons | Test123             |

  Scenario Outline: Verify auto selected programs in Organizations
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
    And I fill in First Name with "FirstName"
    Then I fill in Last Name with LastName
    And I enter Email "qaautomation@remedypartners.com" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I select "<Applications>" product
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I verify default program "BPCI Model 3" associated with organization

    Examples: 
      | Role   | Applications                                        | Health System |
      | Leader | Episode Connect Classic, Reporting Classic, Lessons | Covenant      |

  Scenario: Verify the functionality of back/Cancel button and tabs on the left on create user page
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
    And I fill in First Name with "First Name"
    Then I fill in Last Name with LastName
    And I enter Email "qaautomation@remedypartners.com" to Create user
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
    Then I click on Select All Locations button
    Then I click on Cancel button
    Then I should see header text "Users"

  Scenario: Verify the functionality of Cross button on Permissions Tab on Create User page
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    And I fill in First Name with "First Name"
    Then I fill in Last Name with LastName
    And I enter Email "qaautomation@remedypartners.com" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational Leader
    Then I click on Next button
    Then I verify the header "Applications"
    Then I select "Episode Connect Classic, Reporting Classic" product
    Then I click on Next button
    Then I click on Cross button
    Then I should see header text "Users"

  Scenario Outline: Verify removal of role and changing of the role to see the impact in the available applications
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
    And I fill in First Name with "FirstName"
    Then I fill in Last Name with LastName
    And I enter Email "qaautomation@remedypartners.com" to Create user
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
      | Role1  | Applications1                                       | Role2      | Applications2                                                          | NPI |
      | Leader | Episode Connect Classic, Reporting Classic, Lessons | Physicians | Episode Connect Classic, Reporting Classic, Physician Connect, Lessons | NPI |

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
    And I verify selected Location "<SelectedLocations>" in the selected Locations section
    Then I search the "<LocationsInvalid>" in the Selected Locations section
    And I verify No results found for invalid Location for "first" in selected organisation for PTA user
    Then I search the "<Locations1>" in the Selected Locations section
    And I click on remove link icon for selected Locations on selected Locations section
    And I verify Selected Locations section after click on remove link icon

    Examples: 
      | Description                                           | User                            | UserName                               | Password | FirstName                                          | LastName                                           | Email                           | Phone | Role   | Applications                                        | ApplicationsNotVisible                                                                            | NPI | LearningPathwaySearchParameter                                              | Health System1 | Programs1   | LocationsInvalid | Locations1                     | SelectedLocations    | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Verify the search functionality in selected locations | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastNameLastNameLN | qaautomation@remedypartners.com |       | Leader | Episode Connect Classic, Reporting Classic, Lessons | Episode Connect for Post-acute Care, Administration, Physician Connect, Care Innovation Institute |     | Care Coordination External, Clinical Operations Acute Care Hospital Model 2 | Covenant       | BPCI Model 3 | hjfd             | 3056-808--Arbor Nursing Center | Arbor Nursing Center | No               |                |           |            | No               |                |           |            |

  Scenario Outline: Verify that Next button and left side menu is enabled only when mandatory fields are selected
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
      | FirstName  | LastName  | Email                           | Role       | NPI | Applications      | Locations_BPID                         |
      | First'Name | Last'Name | qaautomation@remedypartners.com | Physicians | NPI | Reporting Classic | 3056-804--Catered Manor Nursing Center |

  Scenario Outline: Enter invalid location and verify error message
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
    Then I select "<Applications>" product
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<invalidLocations>" invalid locations for PTA
    And I verify No results found for invalid Location for "first" in selected organisation for PTA user

    Examples: 
      | FirstName | LastName | Email                           | Phone      | Role              | Applications      | NPI | invalidLocations |
      | FirstName | LastName | qaautomation@remedypartners.com | 9988776655 | Advanced Operator | Reporting Classic |     | hkfj             |

  Scenario Outline: Creating user with existing NPI and validating error message
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
      | User                            | FirstName | LastName | Email                           | Role       | Applications      | NPI | Programs    | Health System | Locations                      |
      | Partner Technical Administrator | FirstName | LastName | qaautomation@remedypartners.com | Physicians | Reporting Classic |     | BPCI Model 3 | Covenant      | 3056-808--Arbor Nursing Center |

  Scenario Outline: Creating user with existing Email and validating error message
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
      | User                            | FirstName | LastName | Email                           | Role       | Applications      | NPI | Programs    | Locations                      |
      | Partner Technical Administrator | FirstName | LastName | qaautomation@remedypartners.com | Physicians | Reporting Classic | NPI | BPCI Model 3 | 3056-808--Arbor Nursing Center |

  Scenario Outline: Verify that Only name is displayed for Learning Pathway ID's
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Applications" tab
    Then I verify the header "Applications"
    Then I verify that Learning Pathway ID "<LearningPathwayID>" is not displayed for the enabled Learning Pathway

    Examples: 
      | User                            | Role              | LearningPathwayID |
      | Partner Technical Administrator | Advanced Operator | 5HDc3E6aK_E1      |

  Scenario Outline: Validate character limit for all fields in the general information tab
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

    Examples: 
      | User                            | FirstName                                          | LastName                                           | Email                                                                        | Phone      | Role       | NPI        |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirstNameFirst | FirstNameFirstNameFirstNameFirstNameFirstNameFirst | TestmailTestmailTestmailTestmailTestmailTestmailTestmailTestmailAA@gmail.com | 9876759231 | Physicians | 1234567890 |

  Scenario: Validating correct Role for PTA user on general information section
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
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
    Then I should see Tile text Users
    And I click on the "Users" tile
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
      | User                            | UserName                               | Password | FirstName | LastName | Email                           | Role1      | Applications               | NPI | LearningPathwaySearchParameter                         | Role2  |
      | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastName | qaautomation@remedypartners.com | Physicians | Reporting Classic, Lessons | NPI | p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81, n9yn5n0Qa581 | Leader |
