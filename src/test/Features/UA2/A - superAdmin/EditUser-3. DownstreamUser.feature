Feature: Edit page for Downstream provider

  Scenario Outline: Changing Role from <PreviousRole> to <Role> and verify permissions tab
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "<Email>" in search box for "<user>-<PreviousRole>"
    Then I select user with email "<Email>"
    And I verify that I am navigated to user page
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I click on Next button
    Then I verify unavailability of organization drop down
    Then I verify text "Which location(s) does this user have access to?" is "Present" in Permission tab
    Then I select "<Locations>" locations
    Then I click on Submit button
    And I wait for 3000 milli seconds
    And I verify that I am navigated to user page
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget

    Examples: 
      | user        | Email             | PreviousRole    | Role                | EnableApplications | Applications           | Locations                        |
      | Super Admin | test.automatemail | Remedy Field RN | Downstream Provider |                    | Episodes, Episodes 2.0 | Baptist Hospital Of Roane County |

  Scenario Outline: Changing Role from <PreviousRole> to <Role>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "Downstream Provider" in search box for "<user>-<PreviousRole>"
    Then I select user with email "test.automatemail"
    And I verify that I am navigated to user page
    And I click on Edit button
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I fill in Phone with <Phone>
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I click on Select button
    Then I enter "<LearningPathwaySearchParameter>" in Learning Pathway search box
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I verify text "Which location(s) does this user have access to?" is "Not Present" in Permission tab
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
    #And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    And I switch back to old window
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "Overall Program" for "<User>-<Role>" user
    Then I click on "Performance (Claims)" report text for Overall Program Reports for "<User>-<Role>" user
    When I click on field-panel-icon button for "<User>-<Role>" user
    When I click to "BPID" field filter under "Episode Initiator" filter field for "<User>-<Role>" user
    And I choose "Filter" option from select options of filter field for "<User>-<Role>" user
    And I should see "<BPID>" in the filter value list for "<User>-<Role>" user
    And I click on cancel button from filter for "<User>-<Role>" user
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I click on RemedyU tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "FirstName LastName" for "<User>-<Role>" user on RemedyU dashboard
    #And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I redirect to Remedy connect page
    And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | User        | UserName                               | Password | FirstName       | LastName       | Email             | Phone        | NPI | PreviousRole        | Role    | EnableApplications | Applications                             | ApplicationsNotVisible            | Roletext | Health System     | LearningPathwaySearchParameter | Facilities |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | test.automatemail | 996-385-2451 |     | Downstream Provider | Manager | Reports, Lessons   | Episodes, Episodes 2.0, Reports, Lessons | Administration, Physician Connect |          | Stamford Hospital | Learning Pathway 2             |            |
