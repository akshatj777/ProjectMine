Feature: fjdkfjd

   Scenario Outline: Selecting healthsystem by participant id and location through faclity key and bpid
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
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I verify default program "BPCI Model 2" associated with organization

    Examples: 
      | User        | Role   |ParticipantId| Health System |
      | Super Admin | Leader | 439120      |Trinity Health |
     
    
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
      | FirstName  | LastName  | Email                          | Role       | NPI | Applications      |ParticipantId| Health System1    | Programs1    | Locations_BPID              | Locations_facility key |
      | First'Name | Last'Name | qaautomation@remedysystems.com | Physicians | NPI | Reporting Classic |514083			 | Stamford Hospital | BPCI Model 2 | 2070-015--Stamford Hospital | TSH                    |
      