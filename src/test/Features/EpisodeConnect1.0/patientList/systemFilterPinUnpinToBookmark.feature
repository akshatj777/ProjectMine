Feature: Episode Connect patient list

  Scenario Outline: User can navigate to episode connect dashboard and pin/unpin system filters to bookmarks

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
    Then I should see "Patient List" in the Patients dropdown menu
    Then I should see "Inpatient Episodes" in the Patients dropdown menu
    Then I should see "Post Acute Episodes" in the Patients dropdown menu
    Then I should see "Readmissions" in the Patients dropdown menu
    Then I should see "Non-BPCI inpatients" in the Patients dropdown menu
    Then I should see "Inpatients with no DRG" in the Patients dropdown menu
    Then I should see "Anchor discharges" in the Patients dropdown menu
    Then I should see "Discharges from readmission" in the Patients dropdown menu
    Then I should see "Canceled episodes" in the Patients dropdown menu
    Then I should see "Discharges with no DRG" in the Patients dropdown menu

    When I click on "Inpatient Episodes" in the Patients dropdown menu
    And I wait for 5000 milli seconds
    Then I click on Pin to bookmarks in "Inpatient Episodes" to pin the filter to dashboard
    And I wait for 7000 milli seconds
    Then I click on Unpin from bookmarks in "Inpatient Episodes" to unpin the filter from dashboard


    Examples:

      | email                | password  |
      | qa.admin@yopmail.com | Episode1! |
  
  
   