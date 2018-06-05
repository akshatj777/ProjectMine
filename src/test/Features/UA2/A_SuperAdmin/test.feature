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
    Then I click on existing organisation "<Health System>"
    Then I select "<EnableLocations1>" locations
    Then I verify that pagination is not displayed for selected locations

    Examples: 
      | User        | Role                | Health System | EnableLocations1                       |
      | Super Admin | Downstream Provider | Covenant      | 3056-804--Catered Manor Nursing Center |

  Scenario Outline: Validating that pagination is not displayed when few locations are added in the data permissions while editing a user
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I verify the header "Permissions"
    Then I click on existing organisation "<Health System>"
    Then I select "<EnableLocations1>" locations
    Then I verify that pagination is not displayed for selected locations

    Examples: 
      | User        | Role                | Health System | EnableLocations1                       |
      | Super Admin | Downstream Provider | Covenant      | 3056-804--Catered Manor Nursing Center |
