Feature: gjkdfj

  Scenario Outline: Delete location from selected locations section and then remove the org
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I enter "qaautomation+xEDIPRlK@remedypartners.com" in search box for "<user>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System>"
    And I wait for 3000 milli seconds
    And I verify selected Location "<SelectedLocations>" in the selected Locations section
    Then I search the "<Locations>" in the Selected Locations section
    Then I verify facility key "<facilityKey>" is displayed with location name "The Medical Center At Franklin"
    And I click on remove link icon for selected Locations on selected Locations section
    #And I verify Selected Locations section after click on remove link icon
    And I wait for 3000 milli seconds
    Then I remove health system "<Health System>"
    Then I click on Submit button

    Examples: 
      | User        | Role      | Health System | Locations                                | SelectedLocations                       | facilityKey |
      | Super Admin | Remedy RN | TeamHealth    | 3056-q91--The Medical Center At Franklin | The Medical Center At Franklin (181318) |      181318 |
