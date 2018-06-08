Feature: Episode Connect add and reset filter

  Scenario Outline: User can search a patient by adding a filter and reset the filter

    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes

    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"

    Then I should see Alerts present on the top-nav bar present on the episode dashboard page
    Then I should see Messeges present on the top-nav bar present on the episode dashboard page
    Then I should see Notifications present on the top-nav bar present on the episode dashboard page
    Then I should see user profile present on the top-nav bar present on the episode dashboard page

    Then I should see "Dashboard" in the left navigator present on the episode dashboard page
    Then I should see "Bookmarks" in the left navigator present on the episode dashboard page
    Then I should see "Patients" in the left navigator present on the episode dashboard page
    Then I should see "Admin Center" in the left navigator present on the episode dashboard page

    When I click on "Patients" in the left navigator present on the episode dashboard page
    And I wait for 4000 milli seconds
    Then I click on "Patient List" present in the Patients dropdown menu
    Then I should see "Patient" present on the patient list filter page present on the patient list page
    Then I enter <Patient Name> in the patient search box present on the patient page
    Then I click on search button present on the patients page
    And I wait for 10000 milli seconds
    Then I should see <Patient Name> patient on the patient list present on the patient page
    Then I should see clear filter button present on the patient page
    Then I click on the clear filter button present on the patient page

    Examples:

      | email                | password  | filter           | Patient Name |
      | qa.admin@yopmail.com | Episode1! | testcustomfilter | AB1RTRUU     |
  