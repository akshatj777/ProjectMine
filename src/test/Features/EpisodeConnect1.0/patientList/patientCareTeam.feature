Feature: Patent care team

  Scenario Outline: Login to application and select patient
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes
    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"
    Then I should see "Dashboard" in the left navigator present on the episode dashboard page
    Then I should see "Bookmarks" in the left navigator present on the episode dashboard page
    Then I should see "Patients" in the left navigator present on the episode dashboard page
    Then I should see "Admin Center" in the left navigator present on the episode dashboard page
    When I click on "Patients" in the left navigator present on the episode dashboard page
    Then I click on "Patient List" present in the Patients dropdown menu
    Then I should see "Patient" present on the patient list filter page present on the patient list page
    Then I should see "Active" filter tab present on the patients page
    Then I should see "Completed" filter tab present on the patients page
    Then I should see "Canceled" filter tab present on the patients page
    And I wait for 8000 milli seconds
    Then I enter <Patient Name> in the patient search box present on the patient page
    Then I click on search button present on the patients page
    And I wait for 10000 milli seconds
    Then I should see <Patient Name> patient on the patient list present on the patient page
    When I click on Patient under patient list page
    Then I should see "Patients" details
    And I wait for 2000 milli seconds

    When I click on care team
    And I wait for 3000 milli seconds
    Then I click on join care team
    And I wait for 3000 milli seconds
    Then I click on gear icon under care managers
    Then I click on remove under the gear icon
    And I wait for 2000 milli seconds
    Then I should see "Unassign CareTeam Member" on the remove popup
    Then I should see "Are you sure?" text
    Then I click on ok button
    And I wait for 2000 milli seconds

    Examples:

      | email                | password  | Patient Name   |
      | qa.admin@yopmail.com | Episode1! | Mypat Aaacyysa |
  