Feature: gfkdmgd

  Scenario Outline: Validating that pagination is not displayed when few locations are added in the data permissions while editing a user
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "test.automatemail+XDyBjDZW@gmail.com" in search box for "<user>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I verify the header "Permissions"
    Then I deselect "<RemovePrograms>" programs
    Then I verify that All Locations checkbox is checked

    Examples: 
      | User        | Role    | Remove HealthSystem | Health System     | RemovePrograms | Locations                   |
      | Super Admin | Manager | Avalon              | Stamford Hospital | BPCI-Model2    | 2070-015--Stamford Hospital |

  Scenario Outline: Validating that "All Locations" checkbox is checked after selecting all the locations under an organization
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I verify the header "Permissions"
    Then I deselect "<RemovePrograms>" programs
    Then I verify that All Locations checkbox is checked

    Examples: 
      | User                            | Role    | RemovePrograms |
      | Partner Technical Administrator | Manager | BPCI-Model2    |
