Feature: Patient Transition Update

  Scenario Outline: Update Patient Transition Details

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
    
    When I click on "Patients" in the left navigator present on the episode dashboard page
    Then I click on "Patient List" present in the Patients dropdown menu
    Then I should see "Patient" present on the patient list filter page present on the patient list page
    And I wait for 8000 milli seconds
    When I click on Patient under patient list page
    Then I agree the attestation if available
    And I wait for 4000 milli seconds
    Then I should verify Actions symbol is appearing under transition table
    And I click on edit present under actions symbol
    And I wait for 8000 milli seconds
    Then I should see "Edit Transition" appearing on the transition page
    Then I click on the calender button present on the new tranition page
    And I select today's date as the admission date
    And I wait for 2000 milli seconds
    Then I select "HHH - Hospital" from the care setting dropdown present on the add transition page
    And I select "Inpatient" from admission care type drop down menu present on Add transition page
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
    And I wait for 3000 milli seconds
    
    Examples:

      | email                | password  |
      | qa.admin@yopmail.com | Episode1! |
    