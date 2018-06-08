Feature: Patient Details Verification

  Scenario Outline: Patient Details
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes
    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"
    #Then I should see "Dashboard" in the left navigator present on the episode dashboard page
    #Then I should see "Bookmarks" in the left navigator present on the episode dashboard page
    #Then I should see "Patients" in the left navigator present on the episode dashboard page
    #Then I should see "Admin Center" in the left navigator present on the episode dashboard page
    When I click on "Patients" in the left navigator present on the episode dashboard page
    Then I click on "Patient List" present in the Patients dropdown menu
    #Then I should see "Patient" present on the patient list filter page present on the patient list page
    #Then I should see "Active" filter tab present on the patients page
    #Then I should see "Completed" filter tab present on the patients page
    #Then I should see "Canceled" filter tab present on the patients page
    And I wait for 8000 milli seconds
    When I click on Patient under patient list page
    Then I agree the attestation if available
    And I wait for 2000 milli seconds
    Then I click on patient details button
    Then I see "General" under patient details
    Then I see "First Name" under general
    Then I update with "Auto" for first name under patient details
    And I wait for 2000 milli seconds
    Then I see "Last Name" under general
    Then I update with "Testing" for last name under patient details
    And I wait for 2000 milli seconds
    Then I see "Primary Care Physician" under patient details
    Then I update with "TestPCP" for physicianname under patient details
    And I wait for 1000 milli seconds
    Then I update with "8416159021" under phonenumber
    And I wait for 1000 milli seconds
    #Then I remove the "1" phone numbers under patient details
    And I wait for 3000 milli seconds
    Then I update with "8316159021" under phonenumber
    And I wait for 1000 milli seconds
    #Then I remove the "2" phone numbers under patient details
    And I wait for 1000 milli seconds
    #Then I update with "8216159021" under phonenumber
    And I wait for 1000 milli seconds
    #Then I remove the "3" phone numbers under patient details
    And I wait for 1000 milli seconds
    Then I update with "8116159021" under phonenumber
    And I wait for 1000 milli seconds
    #Then I remove the "4" phone numbers under patient details
    And I wait for 1000 milli seconds
    Then I update with "8016159021" under phonenumber
    And I wait for 1000 milli seconds
    #Then I remove the "5" phone numbers under patient details
    Then I update with "8016159027" under phonenumber
    And I wait for 1000 milli seconds
    Then I update with "8016159028" under phonenumber
    And I wait for 1000 milli seconds
    Then I update with "8016159029" under phonenumber
    And I wait for 2000 milli seconds
    Then I update with "8016159030" under phonenumber
    And I wait for 3000 milli seconds
    Then I update with "8016159031" under phonenumber
    And I verify Add new button is not visible after adding 10 numbers
    And I wait for 2000 milli seconds
    Then I click on Add new under Addresses
    Then I click on "Select Type" under address
    Then I Select "Type" of the address
    And I wait for 1000 milli seconds
    Then I click on "Street" to add street
    Then I update with "286 Madison ave" under street
    And I wait for 1000 milli seconds
    Then I click on "City" to add city
    Then I update with "New York" under city
    And I wait for 1000 milli seconds
    Then I click on "Select State" under address
    Then I select "State" under address
    And I wait for 1000 milli seconds
    Then I click on "Zip" to add zip
    Then I update with "10017" under zip
    And I wait for 2000 milli seconds

    Examples: 
      | email                | password  |
      | qa.admin@yopmail.com | Episode1! |
