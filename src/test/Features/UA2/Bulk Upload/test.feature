Feature: gjfdfskj

  Scenario: Bulk Upload User
    #Given I am on mail login page
    #Then I enter username "qaautomation@remedypartners.com" to login mail account for bulk delete
    #Then I enter password "1Welcome2" to login mail account
    #Then I click on Mail icon in my account
    #Then I click on Inbox in mail
    #Then I click on delete icon in mail
    #Then I signout from mail account
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data for all application access
    Then I click on submit button on bulk user upload page
    Then I verify "19 users added" message

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
    Then I click on submit button on bulk user upload page
    Then I verify "1 user added" message
    Then I verify availability of Hide button
    When I click on Hide button
    Then I should see header text "Users"
    Then I search for bulk user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify email "<Email>" for "<User>-<PreviousRole>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"

    Examples: 
      | Description                                                                | User        | PreviousRoleText          | PreviousRole              | Role                | NPI | FirstName    | LastName    | Phone | ApplicationsEnabled | ApplicationsDisabled | HealthSystem                       | Programs                                                    | Locations                                                                | Applications  | ApplicationsNotVisible                              | Roletext | ReportCategory | ReportName         | BPID | Facilities                 | LearningPathway |
      | Changing the Role to DP(downstream loc), applications and data permissions | Super Admin | Transitional Case Manager | Transitional Case Manager | Downstream Provider |     | TCMFirstName | TCMLastName |       | Episodes            |                      | Healthsystem - Downstream Provider | Healthsystem - Downstream Provider--Downstream Organization | Healthsystem - Downstream Provider--DOWN-ORG--Stamford Memorial Hospital | Episodes, TCI | Administration, Physician Connect, Lessons, Reports | ROLE_SNF | Patient ID     | Episode DRG Issues |      | Stamford Memorial Hospital |                 |
