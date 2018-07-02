Feature: To verify the options and functionality of Independence section of Carl form

  Scenario: To verify the Independence section of the Carl Form
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
    When I click on Add Patient button present on the ec1 patients page
    Then I verify "Add Patient" text is present on the add patient page
    Then I verify "Patient Information" text is present on the add patient page
    Then I enter random Patient First Name in the first name text box field present on the Add Patient page
    Then I enter random Patient Last Name in the last name text box field present on the Add Patient page
    And I wait for 4000 milli seconds
    And I enter date of birth "01/05/1995" present on the Add Patient Page
    And I wait for 4000 milli seconds
    And I selected "Male" from the gender drop down list present on the Add Patient page
    And I wait for 4000 milli seconds
    And I enter random social security number in the SSN text box field present on the Add Patient page
    And I wait for 4000 milli seconds
    When I click on Admitting Facility present on the Add Patient page
    And I wait for 2000 milli seconds
    And I Select "Stamford Hospital" from the list of admitting facility present on the Add Patient page
    And I wait for 4000 milli seconds
    And I enter "WA784654785" in the Medicare ID present on the Add Patient page
    Then I click on the next button present on the Add Patient page
    Then I click on the next button present on the Add Patient page
    Then I click on the Cancel Button on the New Transition on Add Patient page
    And I wait for 8000 milli seconds
    Then I switch back to old window
    And I wait for 2000 milli seconds
    And I click on the top user account link
    And I wait for 1000 milli seconds
    Then I select Log Out option from the dropdown
    Given I am on the login page
    When I enter email field qa.emblemrn@yopmail.com for login
    And I enter password field Episode1! for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes 2.0
    When I click on the "Episodes 2.0" tile
    And I wait for 4000 milli seconds
    Then I verify current page "Remedy Partners" title
    Then I create a post request
    Then I click on "All" tab in the filter bar on patients page
    Then I wait to the see the visibility of loader to disappear
    Then I verify current page "Remedy Partners" title
    When I click on Filter button present on Patient Page
    And I click on Filters button present on Filter Page
    Then I verify SSN Filter is displayed under List of Filter Options
    When I click on SSN Filter present on Filter Page
    And I wait for 2000 milli seconds
    Then I enter "SSN" value under "ssn" filter to_see_emblem_patient
    Then I click on Done button present on the Filter Page
    Then I wait to the see the visibility of loader to disappear
    Then I wait to see and enable the attestation on the "1" patient on the Patient Card page
    Then I wait to the see the visibility of loader to disappear
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I get the patient last name who have no CARL button in it
    Then I wait to the see the visibility of loader to disappear
    Then I click on the complete CARL on the Patient Summary
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    Then I click on "Independence" section on left navigator
    And I wait for 2000 milli seconds
    And I verify the "Independence" section of the carl form upon clicking on it
    Then I verify that "Independence" section on carl form should be highlighted in left navigator upon clicking
    Then I verify "Cognitive Status" dropdown bar should appear on Independence section
    Then I verify "Activities of Daily Living" dropdown bar should appear on Independence section
    Then I verify "Ambulatory Status" dropdown bar should appear on Independence section
    Then I verify "Does the patient have a history of falls?" question appears on Independence section
    And I wait for 2000 milli seconds
    Then I verify "Yes" option should appear below Does the patient have a history of falls on Independece section
    Then I verify "No" option should appear below Does the patient have a history of falls on Independece section
    Then I verify "Not Sure" option should appear below Does the patient have a history of falls on Independece section
    Then I Verify that Carl form should appear with Save & Go Back link
    Then I Verify that Carl form should appear with Save & Continue link

  Scenario: User should be able select given options present on Independence section of the Carl Form
    Given I am on the login page
    When I enter email field qa.emblemrn@yopmail.com for login
    And I enter password field Episode1! for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes 2.0
    When I click on the "Episodes 2.0" tile
    Then I verify current page "Remedy Partners" title
    Then I click on the Impatient tab on the patient Card Page
    Then I wait to the see the visibility of loader to disappear
    Then I wait to see and enable the attestation on the "1" patient on the Patient Card page
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I get the patient last name who have no CARL button in it
    Then I wait to the see the visibility of loader to disappear
    Then I click on the complete CARL on the Patient Summary
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    Then I click on "Independence" section on left navigator
    And I wait for 2000 milli seconds
    Then I click on "Cognitive Status" dropdown on Independece Section
    Then I verify "Oriented" option present in dropdown for cognitive status on Independece Section
    Then I verify "Forgetful" option present in dropdown for cognitive status on Independece Section
    Then I verify "Disoriented" option present in dropdown for cognitive status on Independece Section
    And I wait for 2000 milli seconds
    Then I select "Forgetful" option in dropdown for cognitive status
    And I wait for 2000 milli seconds
    Then I verify "Forgetful" selected appears in the place holder of "Cognitive Status" dropdown on Independence section
    Then I click on "Activities of Daily Living" dropdown on Independece Section
    Then I verify "No assistance needed" option present in dropdown for cognitive status on Independece Section
    Then I verify "Assistance needed for one or more ADLs" option present in dropdown for cognitive status on Independece Section
    Then I verify "Dependent on caregiver for one or more ADLs" option present in dropdown for cognitive status on Independece Section
    And I wait for 2000 milli seconds
    Then I select "No assistance needed" option in dropdown for cognitive status
    Then I verify "No assistance needed" selected appears in the place holder of "Activities of Daily Living" dropdown on Independence section
    Then I click on "Ambulatory Status" dropdown on Independece Section
    Then I verify "No assistance needed" option present in dropdown for cognitive status on Independece Section
    Then I verify "Assistive device needed" option present in dropdown for cognitive status on Independece Section
    Then I verify "Caregiver needed" option present in dropdown for cognitive status on Independece Section
    And I wait for 2000 milli seconds
    Then I select "Caregiver needed" option in dropdown for cognitive status
    Then I verify "Caregiver needed" selected appears in the place holder of "Ambulatory Status" dropdown on Independence section
    Then I verify "Yes" radio button on Independence section
    Then I verify "No" radio button on Independence section
    Then I verify "Not Sure" radio button on Independence section
    Then I click on "No" radio button on Independence section
    And I wait for 2000 milli seconds
    And I verify "No" radio button is seclected on Independence section
