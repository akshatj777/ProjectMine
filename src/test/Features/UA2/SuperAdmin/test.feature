Feature: fjdkfjd

  Scenario Outline: Create User through UA API call
    Given Build JSON for Create User "<FirstName>" and "<LastName>" and "<Email>" and "<Phone>" and "<NPI>" and "<RoleID>" and "<Applications>" and "<Locations>" and "<LearningPathways>"
    When Create User with this data for "<User>"
    Then Verify Actual vs expected results "<expStatusCode>" and "<responseMsg>"

    Examples: 
      | User        | FirstName                                 | LastName                                 | Email                          | Phone | NPI | RoleID   | Applications                                                                                                       | LearningPathways                       | Locations             | expStatusCode |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       |     | 1-Leader | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting | 3hSOHNAnvjc1,NFdw0Kts2C01,n9yn5n0Qa581 | 514083--2070-015--TSH |           200 |

  Scenario Outline: Selecting healthsystem by participant id and location through faclity key and bpid and verify status of Submit button and check invalid learning pathway
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
    Then I select "Applications" tab
    Then I verify the header "Applications"
    Then I click on learning pathway dropdown
    Then I verify Learning Pathway search box is available
    Then I enter "<InvalidLearningPathwaySearchParameter>" in Learning Pathway search box
    And I verify No results found under Learning Pathway search box
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I remove health system "<RemoveHealthSystem>"
    Then I verify that Submit button is "disabled"
    And I search for health system with <ParticipantId>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select location by BPID "<Locations_BPID>"
    Then I select "<Location_facilitykey>" locations
    Then I verify that Submit button is "enabled"

    Examples: 
      | User        | Role   | ParticipantId | RemoveHealthSystem | Health System  | Programs     | Locations_BPID                   | Location_facilitykey | InvalidLearningPathwaySearchParameter |
      | Super Admin | Leader |        439120 | Stamford Hospital  | Trinity Health | BPCI Model 2 | 2070-c82--Saint Francis Hospital | 2070-c83--HCH        | testitrr89                            |
