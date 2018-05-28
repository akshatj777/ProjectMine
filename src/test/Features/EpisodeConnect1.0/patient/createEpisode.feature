Feature: Episode connect 1 Create Episode

  Scenario Outline: User can navigate to patient and create a new episode
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes
    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"

    When I click on "Patients" in the left navigator present on the episode dashboard page
    When I click on "Patient List" in the Patients dropdown menu
    And I wait for 10000 milli seconds
    Then I click on "custom" filter tab present on the patients page
    And I wait for 3000 milli seconds
    Then I enter <Patient Name> in the patient search box present on the patient page
    Then I click on search button present on the patients page
    And I wait for 20000 milli seconds
    Then I click on the patient name present on the patient list
    And I wait for 3000 milli seconds
    And I click on Agree button present on the Attestation page
    And I wait for 10000 milli seconds
    Then I click on new transition button present on the patient overview page
    And I wait for 5000 milli seconds
    Then I click on the calender button present on the new tranition page
    And I select today's date as the admission date
    And I wait for 2000 milli seconds
    Then I select "HHH - Hospital" from the care setting dropdown present on the add transition page
    And I select "Inpatient" from admission care type drop down menu present on Add transition page
    And I wait for 4000 milli seconds
    When I click on Admitting Facility present on the Add transition page
    And I wait for 2000 milli seconds
    And I Select "Stamford Hospital" from the list of admitting facility present on the Add transition page
    And I wait for 4000 milli seconds

    When I click on Diagnosis and DRG tab present on the patient overview page
    Then I verify ICD is present in the Diagnosis and DRG tab
    And I verify Predict DRG is present in the Diagnosis and DRG tab
    And I verify Add a New DRG is present in the Diagnosis and DRG tab

    When I click on DRG Type to Add a New DRG present on the patient overview page
    Then I select Possible from the DRG type dropdown present on the patient overview page
    Then I Click on DRG dropdown menu present on the patient overview page
    And I wait for 4000 milli seconds
    Then I Search DRG 177 on the search box on the DRG present on the patient overview page
    And I wait for 4000 milli seconds
    Then I select RESPIRATORY INFECTIONS & INFLAMATIONS from the DRG list present on the patient overview page
    And I wait for 4000 milli seconds
    Then I click on Update Transition button present on the patient overview page

    Examples:

      | email                | password  | Patient Name  |
      | qa.admin@yopmail.com | Episode1! | FirstNfbynigj |
    
    