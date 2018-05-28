Feature: Episode Connect create custom filter

  Scenario Outline: User can create and save custom filter

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
    Then I click on "Patient List" present in the Patients dropdown menu
    Then I should see "Patient" present on the patient list filter page present on the patient list page
    Then I should see "Active" filter tab present on the patients page
    Then I should see "Completed" filter tab present on the patients page
    Then I should see "Canceled" filter tab present on the patients page
    Then I click on care setting dropdown present on the patient page
    And I wait for 8000 milli seconds
    Then I select hospital inpatient option present on the care setting dropdown
    Then I select hospital observation option present on the care setting dropdown
    Then I click on search button present on the patients page
    And I wait for 10000 milli seconds
    Then I click on save as button present on the patient page
    Then I enter <filter> the filter name on the text box present on the new filter modal
    And I wait for 5000 milli seconds
    Then I click on submit button present on the new filter modal
    And I wait for 5000 milli seconds
    When I click on "Patients" in the left navigator present on the episode dashboard page
    And I wait for 3000 milli seconds
    When I click on "Custom Lists" in the left navigator present on the episode dashboard page
    And I wait for 5000 milli seconds
    Then I should see <filter> present on the custom filter list



    Examples:

      | email                | password  | filter           |
      | qa.admin@yopmail.com | Episode1! | testcustomfilter |
  
   