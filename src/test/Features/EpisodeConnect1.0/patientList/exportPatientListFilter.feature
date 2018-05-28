Feature: Episode Connect export patient list

  Scenario Outline: User can load a system filter and export patient list

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
    Then I click on Load filter in "Inpatient Episodes" to load the patient list present on the patients dropdown
    And I wait for 20000 milli seconds
    Then I should see "Patient" present on the patient list filter page present on the patient list page
    Then I should see patient list count info present on the patient list page
    Then I verify export button is present on the patient list page
    Then I click on the export button present on the patient list page
    And I wait for 6000 milli seconds
    Then I click on the cancel button present on the export list page

    Examples:

      | email                | password  |
      | qa.admin@yopmail.com | Episode1! |
  
