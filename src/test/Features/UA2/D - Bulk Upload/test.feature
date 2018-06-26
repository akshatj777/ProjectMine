Feature: gfjdklj

  Scenario Outline: Scenario to edit Role from <PreviousRole> to <Role>
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

    Examples: 
      | Description       | User        | PreviousRole    | Role             | NPI | FirstName     | LastName     | Phone | ApplicationsEnabled | ApplicationsDisabled | HealthSystem       | Programs                         | Locations                                 | Applications                                  | ApplicationsNotVisible            | Roletext | ReportCategory | ReportName                   | BPID | Facilities  | LearningPathway                                                                                                                                                                                                                       |
      | Changing the Role | Super Admin | Remedy Field RN | Remedy Executive |     | RFRNFirstName | RFRNLastName |       | TCI, Lessons        |                      | Avon Health Center | Avon Health Center--BPCI Model 3 | Avon Health Center--3056-r31--Avon Health | Episodes, Episodes 2.0, Reports, TCI, Lessons | Administration, Physician Connect | ROLE_FRN | Patient ID     | Episode DRG Issues [Model 3] |      | Avon Health | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 |
