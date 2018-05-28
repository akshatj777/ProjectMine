Feature: Patient Medical Records

  Scenario: User can navigate to patient and create a new episode
    Given I am on the login page
    When I enter email field qa.admin@yopmail.com for login
    And I enter password field Episode1! for Login
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
    Then I enter FirstNfbynigj in the patient search box present on the patient page
    Then I click on search button present on the patients page
    And I wait for 20000 milli seconds
    Then I click on the patient name present on the patient list
    And I wait for 3000 milli seconds
    And I click on Agree button present on the Attestation page
    And I wait for 10000 milli seconds

    When I click on "Medical Record" tab on patient page
    And I wait for 3000 milli seconds
    Then I click on "Add Medication" button on medical record
    And I wait for 2000 milli seconds
    And I enter "testDrugName" in the "drugName" on the new medication page
    And I enter "testDrugQuantity" in the "quantity" on the new medication page
    And I enter "testDrugDirection" in the "directions" on the new medication page
    And I press "Add Medication" button on the new medication page
    And I wait for 3000 milli seconds