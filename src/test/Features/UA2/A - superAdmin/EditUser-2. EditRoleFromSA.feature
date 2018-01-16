Feature: Edit General information/Role/Permissions and validate

  Scenario Outline: Changing the applications and Data permissions for <Role> and verifying product tile
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "<Role>" in search box for "<user>-<Role>"
    Then I select user with email "<Email>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Applications" tab
    Then I unselect "<DisableApplications>" product
    Then I select "Permissions" tab
    Then I click on delete organisation icon
    Then I should see an alert with text "Are you sure you want to remove"
    And I should see "Cancel" button
    And I click on "Remove" button
   
    And I search for health system with <Health System>
    And I wait for 3000 milli seconds
    And I select a <Health System>
    Then I click on Select All Locations button
    And I wait for 3000 milli seconds
    Then I click on Submit button
    And I wait for 3000 milli seconds
    Then I verify "<Health System>" under Data Permissions
    And I verify that "<Applications>" are "Enabled"
    And I verify that "<DisableApplications>" are "Disabled"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    Then I click on Hamburger menu on top left of homepage 
    And I verify "<Applications>" in product menu dropdown
    And I verify "<DisableApplications>" is not present in product menu dropdown
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget

    Examples: 
      | User        | Role       | Email             | DisableApplications | Applications                | Health System     |
      | Super Admin | Remedy TCS | test.automatemail | Reports, Lessons    | Episodes 2.0, Episodes, TCI | Stamford Hospital |

  Scenario Outline: Changing Data permissions and add another organisation <Health System2> for <Role>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "<Role>" in search box for "<user>-<Role>"
    Then I select user with email "<Email>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I click on "Add Another Organization" button
    #Then I click on Select button
    And I search for health system with <Health System2>
    And I wait for 3000 milli seconds
    And I select a <Health System2>
    #Then I click on Select button
    Then I select "<Programs>" programs
    Then I click on Select All Locations button for "Second" Organisation
    And I wait for 3000 milli seconds
    Then I click on Submit button
    And I wait for 3000 milli seconds
    Then I verify "<Health System1>, <Health System2>" under Data Permissions

    Examples: 
      | user        | Role       | Email             | Health System1    | Health System2   | Programs    |
      | Super Admin | Remedy TCS | test.automatemail | Stamford Hospital | Sound Physicians | BPCI-Model2 |

  Scenario Outline: Changing the products and general details for <Role> and verifying product tile
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "<Role>" in search box for "<user>-<Role>"
    Then I select user with email "<Email>"
    And I verify that I am navigated to user page
    And I click on Edit button
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I fill in Phone with <Phone>
    Then I select "Applications" tab
    Then I unselect "<DisableApplications>" product
    Then I select "Permissions" tab
    Then I click on Submit button
    And I wait for 3000 milli seconds
    And I verify First Name <FirstName> in user page
    And I verify Last Name <LastName> in user page
    And I verify Phone <Phone> in user page
    And I verify Role <Role> in user page
    And I verify that "<DisableApplications>" are "Disabled"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    Then I click on Hamburger menu on top left of homepage
    And I verify "<Applications>" in product menu dropdown
    And I verify "<DisableApplications>" is not present in product menu dropdown

    Examples: 
      | User        | Role                         | FirstName       | LastName       | Email             | Phone        | DisableApplications   | Applications                                  |
      | Super Admin | Case Manager                 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 | Episodes 2.0, Lessons | Episodes, Reports                             |
      | Super Admin | Remedy RN                    | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 |                       | Episodes, Episodes 2.0, Reports, Lessons, TCI |
      | Super Admin | Remedy PM                    | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 | Lessons               | Episodes, Episodes 2.0, Reports, TCI          |
      | Super Admin | Remedy Program Administrator | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 | Lessons, Episodes 2.0 | Episodes, Reports, Physician Connect, TCI     |

  Scenario Outline: Changing applications for <Role> and verifying product tile
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "<Role>" in search box for "<user>-<Role>"
    Then I select user with email "<Email>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Applications" tab
    Then I unselect "<DisableApplications>" product
    Then I remove LearningPathwaySearchParameter
    Then I select "Permissions" tab
    Then I click on Submit button
    And I wait for 3000 milli seconds
    And I verify that "<DisableApplications>" are "Disabled"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    Then I click on Hamburger menu on top left of homepage
    And I verify "<Applications>" in product menu dropdown
    And I verify "<DisableApplications>" is not present in product menu dropdown

    Examples: 
      | User        | Role             | Email             | DisableApplications | Applications                    |
      | Super Admin | Remedy Executive | test.automatemail | Episodes 2.0        | Episodes, Reports, Lessons, TCI |

  Scenario Outline: Changing the permissions and general details for <Role> and verifying product tile
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "<Role>" in search box for "<user>-<Role>"
    Then I select user with email "<Email>"
    And I verify that I am navigated to user page
    And I click on Edit button
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I fill in Phone with <Phone>
    Then I select "Permissions" tab
    Then I click on delete organisation icon
    And I click on "Remove" button
    #Then I click on Select button
    And I search for health system with <Health System>
    And I wait for 3000 milli seconds
    And I select a <Health System>
    Then I click on Select All Locations button
    And I wait for 3000 milli seconds
    Then I click on Submit button
    And I wait for 3000 milli seconds
    And I verify First Name <FirstName> in user page
    And I verify Last Name <LastName> in user page
    And I verify Phone <Phone> in user page
    And I verify Role <Role> in user page
    Then I verify "<Health System>" under Data Permissions

    Examples: 
      | User        | Role                          | FirstName       | LastName       | Email             | Phone        | Applications | Health System     |
      | Super Admin | Prospective Partner Executive | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 | Lessons      | Stamford Hospital |

  Scenario Outline: Changing General details and Role from <PreviousRole> to <Role>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "<PreviousRole>" in search box for "<user>-<PreviousRole>"
    Then I select user with email "<Email>"
    And I verify that I am navigated to user page
    And I click on Edit button
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I fill in Phone with <Phone>
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I click on Select button
    Then I enter "<LearningPathwaySearchParameter>" in Learning Pathway search box
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I click on Submit button
    And I wait for 3000 milli seconds
    And I verify First Name <FirstName> in user page
    And I verify Last Name <LastName> in user page
    And I verify Phone <Phone> in user page
    And I verify Role <Role> in user page
    And I verify that "<Applications>" are "Enabled"
    And I verify that "<ApplicationsNotVisible>" are "Disabled"
    And I verify that "<LearningPathwaySearchParameter>" are "Enabled"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Then I enter newuser email for "<user>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
     Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    Then I click on Hamburger menu on top left of homepage
   And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | User        | UserName                               | Password | FirstName       | LastName       | Email             | Phone        | NPI | PreviousRole                  | Role         | EnableApplications | Applications                                  | ApplicationsNotVisible             | Health System     | LearningPathwaySearchParameter         |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 |     | Manager                       | Remedy TCS   | TCI                | Episodes, Episodes 2.0, Reports, Lessons, TCI | Administration, Physician Connect  | Stamford Hospital | Learning Pathway 2, i am learning path |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 |     | Partner Program Administrator | Case Manager |                    | Episodes, Episodes 2.0, Reports, Lessons      | Administration, Physician Connect  | Stamford Hospital | Learning Pathway 2                     |

  Scenario Outline: Changing Role from <PreviousRole> to <Role> and Data permissions
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "<PreviousRole>" in search box for "<user>-<PreviousRole>"
    Then I select user with email "<Email>"
    And I verify that I am navigated to user page
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I click on Select button
    Then I enter "<LearningPathwaySearchParameter>" in Learning Pathway search box
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I click on delete organisation icon
    And I click on "Remove" button
    #Then I click on Select button
    And I search for health system with <Health System>
    And I wait for 3000 milli seconds
    And I select a <Health System>
    Then I click on Select All Locations button
    And I wait for 3000 milli seconds
    Then I click on Submit button
    And I wait for 3000 milli seconds
    And I verify that "<Applications>" are "Enabled"
    And I verify that "<ApplicationsNotVisible>" are "Disabled"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Then I enter newuser email for "<user>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
     Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    Then I click on Hamburger menu on top left of homepage
   And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | User        | UserName                               | Password | FirstName       | LastName       | Email             | Phone        | NPI | PreviousRole | Role             | EnableApplications | Applications                                  | ApplicationsNotVisible             | Health System     | LearningPathwaySearchParameter |  
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 |     | Executive    | Remedy Executive | TCI                | Episodes, Episodes 2.0, Reports, Lessons, TCI | Administration, Physician Connect  | Stamford Hospital | Learning Pathway 2             |  
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 |     | Remedy Other | Manager          | Reports            | Episodes, Episodes 2.0, Reports, Lessons      | Administration, Physician Connect  | Stamford Hospital | Learning Pathway 2             |  
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 |     | Remedy LPN   | Remedy Field RN  |                    | Episodes, Episodes 2.0, Reports, Lessons, TCI | Administration, Physician Connect  | Stamford Hospital | Learning Pathway 2             |  

  Scenario Outline: Changing Role from <PreviousRole> to <Role>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "<PreviousRole>" in search box for "<user>-<PreviousRole>"
    Then I select user with email "<Email>"
    And I verify that I am navigated to user page
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI1>" for role "<Role>"
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I click on Select button
    Then I enter "<LearningPathwaySearchParameter>" in Learning Pathway search box
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I click on Submit button
    And I wait for 3000 milli seconds
    And I verify Role <Role> in user page
    And I verify that "<Applications>" are "Enabled"
    And I verify that "<ApplicationsNotVisible>" are "Disabled"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Then I enter newuser email for "<user>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
     Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    Then I click on Hamburger menu on top left of homepage
    And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | User        | UserName                               | Password | FirstName       | LastName       | Email             | Phone        | NPI | PreviousRole     | Role         | EnableApplications | Applications                             | ApplicationsNotVisible            | Health System     | LearningPathwaySearchParameter |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 |     | Case Manager     | Executive    |                    | Episodes, Episodes 2.0, Reports, Lessons | Administration, Physician Connect | Stamford Hospital | Learning Pathway 2             |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 |     | Remedy Executive | Remedy Other |                    | Episodes, Episodes 2.0, Lessons, TCI     | Administration, Physician Connect | Stamford Hospital | Learning Pathway 2             |

  Scenario Outline: Changing General information, Role from <PreviousRole> to <Role> and Data permissions
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "<PreviousRole>" in search box for "<user>-<PreviousRole>"
    Then I select user with email "<Email>"
    And I verify that I am navigated to user page
    And I click on Edit button
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I fill in Phone with <Phone>
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I click on Select button
    Then I enter "<LearningPathwaySearchParameter>" in Learning Pathway search box
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I click on delete organisation icon
    And I click on "Remove" button
    #Then I click on Select button
    And I search for health system with <Health System>
    And I wait for 3000 milli seconds
    And I select a <Health System>
    Then I click on Select All Locations button
    And I wait for 3000 milli seconds
    Then I click on Submit button
    And I wait for 3000 milli seconds
    And I verify that "<Applications>" are "Enabled"
    And I verify that "<ApplicationsNotVisible>" are "Disabled"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Then I enter newuser email for "<user>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    Then I click on Hamburger menu on top left of homepage
   And I verify "<Applications>" in product menu dropdown
    And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | User        | UserName                               | Password | FirstName       | LastName       | Email             | Phone        | NPI | PreviousRole                   | Role             | EnableApplications              | Applications                                                | ApplicationsNotVisible            | Health System     | LearningPathwaySearchParameter |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 |     | Remedy Sales Team              | Remedy Executive | Episodes, Episodes 2.0          | Episodes, Episodes 2.0, Reports, Lessons, TCI               | Administration, Physician Connect | Stamford Hospital | Learning Pathway 2             |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 |     | Remedy Executive               | Executive        |                                 | Episodes, Episodes 2.0, Reports, Lessons                    | Administration, Physician Connect | Stamford Hospital | Learning Pathway 2             |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 | NPI | Remedy Technical Administrator | Physicians       |                                 | Episodes, Episodes 2.0, Reports, Lessons, Physician Connect | Administration                    | Stamford Hospital | Learning Pathway 2             |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 | NPI | Transitional Case Manager      | Physicians       | Physician Connect, Episodes 2.0 | Episodes, Episodes 2.0, Reports, Lessons, Physician Connect | Administration                    | Stamford Hospital | Learning Pathway 2             |
