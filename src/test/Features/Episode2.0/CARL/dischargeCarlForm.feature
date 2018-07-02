Feature: To verify the options and functionality of Discharge section of Carl form

  Scenario: To verify fields the Discharge section of the Carl Form
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
    Then I wait to the see the visibility of loader to disappear
    Then I get the patient last name who have no CARL button in it
    Then I will wait to see and click on "Patient Details" followed by "span" tag
    Then I wait to the see the visibility of loader to disappear
    Then I switch to PatientTransitions frame
    Then I will fetch the value attribute of "Social Security Number" on patient details
    When I switch to default window from iframe
    Then I will wait to see and click on "Transitions" followed by "span" tag
    Then I switch to PatientTransitions frame
    Then I wait to the see the visibility of loader to disappear
    Then I click on the delete button on the transition to delete all the transitions
    Then I wait for 3000 milli seconds
    Then I wait to the see the visibility of loader to disappear
    Then I click on add a new transition to add a new episode
    Then I wait to the see the visibility of loader to disappear
    Then I will wait to see "Transition Info" followed by "a" tag
    Then I wait for 3000 milli seconds
    Then I fill in "Admit" with logic "minus" with "8" days
    Then I wait to the see the visibility of loader to disappear
    Then I select the care setting value "HHH - Hospital" on add a new transition
    Then I wait to the see the visibility of loader to disappear
    Then I select the care type value "Inpatient" on add a new transition
    Then I select the facility value "Stamford Hospital" on add a new transition
    Then I click on the Diagnosis and DRG tab on add a new transition to select the DRG
    Then I select the "Working" DRG type on the Diagnosis and DRG tab on add a new transition
    Then I select the "61" DRG value on the Diagnosis and DRG tab on add a new transition
    Then I wait for 5000 milli seconds
    Then I click on the Create Transition Button to add a new transition
    Then I wait to the see the visibility of loader to disappear
    When I switch to default window from iframe
    Then I wait for 1000 milli seconds
    Then I close the patient summary Page
    Then I verify current page "Remedy Partners" title
    When I click on Filter button present on Patient Page
    And I wait for 2000 milli seconds
    Then I enter "SSN" value under "ssn" filter
    Then I click on Done button present on the Filter Page
    Then I scroll the page to bottom by "-100"
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I click on the complete CARL on the Patient Summary
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    And I wait for 4000 milli seconds
    Then I click on "Discharge" section on left navigator
    And I wait for 2000 milli seconds
    And I verify the "Discharge" section of the carl form upon clicking on it
    Then I verify that "Discharge" section on carl form should be highlighted in left navigator upon clicking
    Then I verify "Next Site of Care" appears on Discharge section of carl form
    Then I verify "No CARL Recommendation. Please complete the following sections" field under Next Site of Care on Discharge section
    Then I verify "Actual Care Setting" subform field under Recommendation on Discharge section
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    And I wait for 2000 milli seconds
    Then I select "(HHA) Home Health Agency" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I verify "Care Type" subform field under Recommendation on Discharge section
    Then I verify "Discharge Location" subform field under Recommendation on Discharge section
    Then I verify "Discharge Date" subform field under Recommendation on Discharge section
    Then I verify Done button under subform is disabled on Discharge section
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    And I wait for 2000 milli seconds
    Then I select "Skilled Services" in subform dropdown for "Care Type" on Discharge section
    And I wait for 2000 milli seconds
    Then I verify Done button under subform is disabled on Discharge section
    Then I click on "Discharge Location" subform dropdown under Recommendation on Discharge section
    Then I enter "A Helping Hand Hha" and select location in the Discharge Location search box
    Then I verify Done button under subform is disabled on Discharge section
    Then I click on Calendar Icon On Discharge date under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I select todays Date on Calendar Discahrge Date under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I verify Done button under subform is enabled on Discharge section
    Then I verify first question "Have you discussed the proposal with the Interdisciplinary team?" under Discharge section
    And I verify "Yes" radio option for "Have you discussed the proposal with the Interdisciplinary team?" under Discharge section
    And I verify "No" radio option for "Have you discussed the proposal with the Interdisciplinary team?" under Discharge section
    Then I verify Additional Comments section under Discharge on Carl form
    Then I click on "Cancel" button under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    And I wait for 2000 milli seconds
    Then I select "(HOM) Home" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I verify "Discharge Location" subform field is not appearing under Recommendation on Discharge section
    Then I click on "Cancel" button under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    And I wait for 2000 milli seconds
    Then I select "(EXPIRED) Expired" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I verify "Discharge Location" subform field is not appearing under Recommendation on Discharge section
    Then I click on "Cancel" button under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    And I wait for 2000 milli seconds
    Then I select "(UNK) Unknown" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I verify "Discharge Location" subform field is not appearing under Recommendation on Discharge section
    Then I click on "Cancel" button under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I verify second question "Why didn't the patient transfer to the recommended Next Site of Care?" under Discharge section
    Then I verify "Who disagrees?" dropdown for "Why didn't the patient transfer to the recommended Next Site of Care?" under Discharge section
    Then I verify "Reason for Disagreement" dropdown for "Why didn't the patient transfer to the recommended Next Site of Care?" under Discharge section
    Then I verify the legal messages appears with an i icon under Discharge section
    Then I click on Done button under subform on Discharge sections
    Then I verify user should be able to navigate to the read only form and no server error should appear on Discharge section

  Scenario: Verify that updating CARL form - Discharge section information should update the transition table as well
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
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I get the patient last name who have no CARL button in it
    Then I will wait to see and click on "Patient Details" followed by "span" tag
    Then I wait to the see the visibility of loader to disappear
    Then I switch to PatientTransitions frame
    Then I will fetch the value attribute of "Social Security Number" on patient details
    When I switch to default window from iframe
    Then I will wait to see and click on "Transitions" followed by "span" tag
    Then I switch to PatientTransitions frame
    Then I wait to the see the visibility of loader to disappear
    Then I click on the delete button on the transition to delete all the transitions
    Then I wait to the see the visibility of loader to disappear
    Then I click on add a new transition to add a new episode
    Then I will wait to see "Transition Info" followed by "a" tag
    Then I wait for 3000 milli seconds
    Then I fill in "Admit" with logic "minus" with "8" days
    Then I select the care setting value "HHH - Hospital" on add a new transition
    Then I wait to the see the visibility of loader to disappear
    Then I select the care type value "Inpatient" on add a new transition
    Then I select the facility value "Stamford Hospital" on add a new transition
    Then I click on the Diagnosis and DRG tab on add a new transition to select the DRG
    Then I select the "Working" DRG type on the Diagnosis and DRG tab on add a new transition
    Then I select the "61" DRG value on the Diagnosis and DRG tab on add a new transition
    Then I wait for 5000 milli seconds
    Then I click on the Create Transition Button to add a new transition
    Then I wait to the see the visibility of loader to disappear
    When I switch to default window from iframe
    Then I wait for 1000 milli seconds
    Then I close the patient summary Page
    Then I scroll the page to bottom by "-100"
    Then I verify current page "Remedy Partners" title
    When I click on Filter button present on Patient Page
    And I click on Filters button present on Filter Page
    Then I verify SSN Filter is displayed under List of Filter Options
    When I click on SSN Filter present on Filter Page
    And I wait for 2000 milli seconds
    Then I enter "SSN" value under "ssn" filter
    Then I click on Done button present on the Filter Page
    Then I verify CARL button is "not appearing" on the patient card
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I click on the complete CARL on the Patient Summary
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    And I wait for 4000 milli seconds
    Then I click on "Discharge" section on left navigator
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    Then I select "(HHH) Hospital" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    Then I select "Inpatient" in subform dropdown for "Care Type" on Discharge section
    Then I click on "Discharge Location" subform dropdown under Recommendation on Discharge section
    Then I enter "Allentown" and select location in the Discharge Location search box
    And I wait for 1000 milli seconds
    Then I click on Calendar Icon On Discharge date under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I select "Discharge current" with logic "current" "1" days on Calendar Discharge Date under subform on Discharge section
    Then I verify Done button under subform is enabled on Discharge section
    Then I click on Done button under subform on Discharge sections
    Then I verify user should be able to navigate to the read only form and no server error should appear on Discharge section
    Then I verify the correct "CareSetting" "(HHH) Hospital" which user has selected by the time of filling the form should appearing after saving the done form
    Then I verify the correct "Caretype" "Inpatient" which user has selected by the time of filling the form should appearing after saving the done form
    Then I verify the correct "DischargeLocation" "Allentown" which user has selected by the time of filling the form should appearing after saving the done form
    Then I click on edit button to update the values of discharge subform under discharge test in Carl form
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    Then I select "(UNK) Unknown" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I click on Calendar Icon On Discharge date under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I select "Discharge current" with logic "current" "1" days on Calendar Discharge Date under subform on Discharge section
    Then I verify Done button under subform is enabled on Discharge section
    Then I click on Done button under subform on Discharge sections
    Then I verify user should be able to navigate to the read only form and no server error should appear on Discharge section
    Then I verify the correct "CareSetting" "(UNK) Unknown" which user has selected by the time of filling the form should appearing after saving the done form
    Then I verify the correct "DischargeLocation" "No Discharge Facility" which user has selected by the time of filling the form should appearing after saving the done form
    Then I click on edit button to update the values of discharge subform under discharge test in Carl form
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    Then I select "(HOM) Home" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I click on Calendar Icon On Discharge date under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I select "Discharge current" with logic "current" "1" days on Calendar Discharge Date under subform on Discharge section
    Then I verify Done button under subform is enabled on Discharge section
    Then I click on Done button under subform on Discharge sections
    Then I verify user should be able to navigate to the read only form and no server error should appear on Discharge section
    Then I verify the correct "CareSetting" "(HOM) Home" which user has selected by the time of filling the form should appearing after saving the done form
    Then I verify the correct "DischargeLocation" "No Discharge Facility" which user has selected by the time of filling the form should appearing after saving the done form
    Then I click on edit button to update the values of discharge subform under discharge test in Carl form
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    Then I select "(EXPIRED) Expired" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    Then I select "Expired as Inpatient" in subform dropdown for "Care Type" on Discharge section
    Then I click on Calendar Icon On Discharge date under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I select "Discharge current" with logic "current" "1" days on Calendar Discharge Date under subform on Discharge section
    Then I verify Done button under subform is enabled on Discharge section
    Then I click on Done button under subform on Discharge sections
    Then I verify user should be able to navigate to the read only form and no server error should appear on Discharge section
    Then I verify the correct "CareSetting" "(EXPIRED) Expired" which user has selected by the time of filling the form should appearing after saving the done form
    Then I verify the correct "DischargeLocation" "No Discharge Facility" which user has selected by the time of filling the form should appearing after saving the done form
    Then I click on edit button to update the values of discharge subform under discharge test in Carl form
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    Then I select "(HHA) Home Health Agency" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    Then I select "Skilled Services" in subform dropdown for "Care Type" on Discharge section
    Then I click on "Discharge Location" subform dropdown under Recommendation on Discharge section
    Then I enter "A Helping Hand Hha" and select location in the Discharge Location search box
    And I wait for 1000 milli seconds
    Then I click on Calendar Icon On Discharge date under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I select "Discharge past" with logic "minus" "9" days on Calendar Discharge Date under subform on Discharge section
    Then I verify User should not get an error message on adding a past date in the discharge date section
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    Then I select "(HHA) Home Health Agency" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    Then I select "Skilled Services" in subform dropdown for "Care Type" on Discharge section
    Then I click on "Discharge Location" subform dropdown under Recommendation on Discharge section
    Then I enter "A Helping Hand Hha" and select location in the Discharge Location search box
    And I wait for 1000 milli seconds
    Then I click on Calendar Icon On Discharge date under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I verify User should not get an error message on adding a past date in the discharge date section
    Then I click on Calendar Icon On Discharge date under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I select "Discharge current" with logic "minus" "3" days on Calendar Discharge Date under subform on Discharge section
    Then I verify Done button under subform is enabled on Discharge section
    Then I click on Done button under subform on Discharge sections
    Then I verify user should be able to navigate to the read only form and no server error should appear on Discharge section
    Then I verify the correct "CareSetting" "(HHA) Home Health Agency" which user has selected by the time of filling the form should appearing after saving the done form
    Then I verify the correct "Caretype" "Skilled Services" which user has selected by the time of filling the form should appearing after saving the done form
    Then I verify the correct "DischargeLocation" "A Helping Hand Hha" which user has selected by the time of filling the form should appearing after saving the done form
    Then I close the patient summary Page
    Then I scroll the page to bottom by "-100"
    Then I verify current page "Remedy Partners" title
    When I click on Filter button present on Patient Page
    And I wait for 2000 milli seconds
    Then I enter "SSN" value under "ssn" filter
    Then I click on Done button present on the Filter Page
    Then I scroll the page to bottom by "-100"
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I will wait to see "Transitions" followed by "span" tag
    Then I wait to the see the visibility of loader to disappear
    Then I switch to PatientTransitions frame
    Then I will wait to see the "Transitionno" "2" appears on the transition table on the Patient Summary page
    Then I will wait to see column "2" header "Facility" "(HHH) St Luke's - Allentown" appears in transition column "1" on transitions table on Patient Summary Page

  Scenario: Verify SNF ELOS message should appear under the Discharge Date, if the user selects SNF as the Actual Care Setting and either of the following care types (TCU or Skilled Nursing)
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
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I get the patient last name who have no CARL button in it
    Then I will wait to see and click on "Patient Details" followed by "span" tag
    Then I wait to the see the visibility of loader to disappear
    Then I switch to PatientTransitions frame
    Then I will fetch the value attribute of "Social Security Number" on patient details
    When I switch to default window from iframe
    Then I will wait to see and click on "Transitions" followed by "span" tag
    Then I switch to PatientTransitions frame
    Then I wait to the see the visibility of loader to disappear
    Then I click on the delete button on the transition to delete all the transitions
    Then I wait for 3000 milli seconds
    Then I wait to the see the visibility of loader to disappear
    Then I click on add a new transition to add a new episode
    Then I will wait to see "Transition Info" followed by "a" tag
    Then I wait for 3000 milli seconds
    Then I fill in "Admit" with logic "minus" with "8" days
    Then I select the care setting value "HHH - Hospital" on add a new transition
    Then I wait to the see the visibility of loader to disappear
    Then I select the care type value "Inpatient" on add a new transition
    Then I select the facility value "Stamford Hospital" on add a new transition
    Then I click on the Diagnosis and DRG tab on add a new transition to select the DRG
    Then I select the "Working" DRG type on the Diagnosis and DRG tab on add a new transition
    Then I select the "61" DRG value on the Diagnosis and DRG tab on add a new transition
    Then I wait for 5000 milli seconds
    Then I click on the Create Transition Button to add a new transition
    Then I wait to the see the visibility of loader to disappear
    When I switch to default window from iframe
    Then I wait for 1000 milli seconds
    Then I close the patient summary Page
    Then I verify current page "Remedy Partners" title
    When I click on Filter button present on Patient Page
    And I click on Filters button present on Filter Page
    Then I verify SSN Filter is displayed under List of Filter Options
    When I click on SSN Filter present on Filter Page
    And I wait for 2000 milli seconds
    Then I enter "SSN" value under "ssn" filter
    Then I click on Done button present on the Filter Page
    Then I scroll the page to bottom by "-100"
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I click on the complete CARL on the Patient Summary
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    And I wait for 4000 milli seconds
    Then I click on "Discharge" section on left navigator
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    Then I select "(SNF) Skilled Nursing Facility" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    Then I select "Skilled Care" in subform dropdown for "Care Type" on Discharge section
    Then I verify SNF ELOS message should appear under the Discharge Date on Discharge Section
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    Then I select "TCU" in subform dropdown for "Care Type" on Discharge section
    Then I verify SNF ELOS message should appear under the Discharge Date on Discharge Section
    Then I verify SNF ELOS range that should be calculated by DRG that triggers the current active episode

  Scenario: As a user, I would like to search for or view a facility in the Actual Discharge Location field that the patient was discharged to
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
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I get the patient last name who have no CARL button in it
    Then I will wait to see and click on "Patient Details" followed by "span" tag
    Then I wait to the see the visibility of loader to disappear
    Then I switch to PatientTransitions frame
    Then I will fetch the value attribute of "Social Security Number" on patient details
    When I switch to default window from iframe
    Then I will wait to see and click on "Transitions" followed by "span" tag
    Then I switch to PatientTransitions frame
    Then I wait to the see the visibility of loader to disappear
    Then I click on the delete button on the transition to delete all the transitions
    Then I wait to the see the visibility of loader to disappear
    Then I click on add a new transition to add a new episode
    Then I will wait to see "Transition Info" followed by "a" tag
    Then I wait for 3000 milli seconds
    Then I fill in "Admit" with logic "minus" with "8" days
    Then I select the care setting value "HHH - Hospital" on add a new transition
    Then I wait to the see the visibility of loader to disappear
    Then I select the care type value "Inpatient" on add a new transition
    Then I select the facility value "Stamford Hospital" on add a new transition
    Then I click on the Diagnosis and DRG tab on add a new transition to select the DRG
    Then I select the "Working" DRG type on the Diagnosis and DRG tab on add a new transition
    Then I select the "61" DRG value on the Diagnosis and DRG tab on add a new transition
    Then I wait for 5000 milli seconds
    Then I click on the Create Transition Button to add a new transition
    Then I wait to the see the visibility of loader to disappear
    When I switch to default window from iframe
    Then I wait for 1000 milli seconds
    Then I close the patient summary Page
    Then I verify current page "Remedy Partners" title
    When I click on Filter button present on Patient Page
    And I click on Filters button present on Filter Page
    Then I verify SSN Filter is displayed under List of Filter Options
    When I click on SSN Filter present on Filter Page
    And I wait for 2000 milli seconds
    Then I enter "SSN" value under "ssn" filter
    Then I click on Done button present on the Filter Page
    Then I scroll the page to bottom by "-100"
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I click on the complete CARL on the Patient Summary
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    And I wait for 4000 milli seconds
    Then I click on "Discharge" section on left navigator
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    Then I select "(HHA) Home Health Agency" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    Then I select "Skilled Services" in subform dropdown for "Care Type" on Discharge section
    Then I click on "Discharge Location" subform dropdown under Recommendation on Discharge section
    Then I enter "Aaa Home Health Care Inc" Discharge location in the Discharge Location search box
    Then I verify "data" appears in the dropdown to select the Discharge Location under Recommendation on Discharge Section
    Then I verify Actual Discharge Location search should determined by Care Setting
    Then I verify results should be configured with list of facilities after entering characters on the Discharge Location field
    Then I close the Discharge Location dropdown on Discharge Section
    Then I click on Calendar Icon On Discharge date under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I select "Discharge current" with logic "minus" "3" days on Calendar Discharge Date under subform on Discharge section
    Then I verify Done button under subform is disabled on Discharge section
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    Then I select "(HHA) Home Health Agency" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    Then I select "Skilled Services" in subform dropdown for "Care Type" on Discharge section
    Then I click on "Discharge Location" subform dropdown under Recommendation on Discharge section
    Then I select "(HHA) Home Health Agency" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    Then I select "(HHA) Home Health Agency" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I verify Care type and Discharge location field should get refreshed as per new Care setting

  Scenario: Upon selecting the "Review the form" link, user should be able to view the carl form with responses as a singular page
    Given I am on the login page
    When I enter email field qa.emblemrn@yopmail.com for login
    And I enter password field Episode1! for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes 2.0
    When I click on the "Episodes 2.0" tile
    Then I verify current page "Remedy Partners" title
    Then I click on the Impatient tab on the patient Card Page
    Then I wait to see and enable the attestation on the "1" patient on the Patient Card page
    Then I wait to the see the visibility of loader to disappear
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I get the patient last name who have no CARL button in it
    Then I will wait to see and click on "Patient Details" followed by "span" tag
    Then I wait to the see the visibility of loader to disappear
    Then I switch to PatientTransitions frame
    Then I will fetch the value attribute of "Social Security Number" on patient details
    When I switch to default window from iframe
    Then I will wait to see and click on "Transitions" followed by "span" tag
    Then I switch to PatientTransitions frame
    Then I wait to the see the visibility of loader to disappear
    Then I click on the delete button on the transition to delete all the transitions
    Then I wait to the see the visibility of loader to disappear
    Then I click on add a new transition to add a new episode
    Then I will wait to see "Transition Info" followed by "a" tag
    Then I wait for 3000 milli seconds
    Then I fill in "Admit" with logic "minus" with "8" days
    Then I select the care setting value "HHH - Hospital" on add a new transition
    Then I wait to the see the visibility of loader to disappear
    Then I select the care type value "Inpatient" on add a new transition
    Then I select the facility value "Stamford Hospital" on add a new transition
    Then I click on the Diagnosis and DRG tab on add a new transition to select the DRG
    Then I select the "Working" DRG type on the Diagnosis and DRG tab on add a new transition
    Then I select the "61" DRG value on the Diagnosis and DRG tab on add a new transition
    Then I wait to the see the visibility of loader to disappear
    Then I click on the Create Transition Button to add a new transition
    Then I wait to the see the visibility of loader to disappear
    When I switch to default window from iframe
    Then I wait for 1000 milli seconds
    Then I close the patient summary Page
    Then I verify current page "Remedy Partners" title
    When I click on Filter button present on Patient Page
    And I click on Filters button present on Filter Page
    Then I verify SSN Filter is displayed under List of Filter Options
    When I click on SSN Filter present on Filter Page
    And I wait for 2000 milli seconds
    Then I enter "SSN" value under "ssn" filter
    Then I click on Done button present on the Filter Page
    Then I scroll the page to bottom by "-100"
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I click on the complete CARL on the Patient Summary
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    And I wait for 4000 milli seconds
    Then I will wait to see the CARL section "Caregiver" header appears on the CARL form
    Then I click on Yes, 24 hours a day option under Does the patient have a capable caregiver
    And I click on Add Caregiver link under Choose Caregiver
    Then I Enter "FirstNameTest" and "LastNameTest" on Add Caregiver form
    Then I verify create button is enabled
    Then I select "Adoptive Parent" option from "Relationship" dropdown to create Caregiver
    Then I enter "testuser@yopmail.com" in email field
    Then I enter "9874561230" in Primary Phone field
    And I wait for 2000 milli seconds
    And I click on Create button to add Caregiver
    And I wait for 2000 milli seconds
    Then I save and continue the complete CARL form
    And I wait for 2000 milli seconds
    Then I close the patient summary Page
    Then I scroll the page to bottom by "-100"
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I get the patient last name who have no CARL button in it
    Then I click on the complete CARL on the Patient Summary
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    And I wait for 4000 milli seconds
    Then I click on "Independence" section on left navigator
    Then I will wait to see the CARL section "Independence" header appears on the CARL form
    Then I click on "Cognitive Status" dropdown on Independece Section
    Then I select "Forgetful" option in dropdown for cognitive status
    Then I click on "Activities of Daily Living" dropdown on Independece Section
    Then I select "Assistance needed for one or more ADLs" option in dropdown for cognitive status
    Then I click on "Ambulatory Status" dropdown on Independece Section
    Then I select "Caregiver needed" option in dropdown for cognitive status
    Then I click on "Anticipated Discharge Needs" section on left navigator
    And I wait for 2000 milli seconds
    Then I will wait to see the CARL section "Anticipated Discharge Needs" header appears on the CARL form
    Then I click "Physical therapy" checkbox under Therapies Needed on Anticipated Discharge Needs section
    Then I select "Injectable Meds" checkbox for Transition of Care Needs on Anticipated Discharge Needs
    Then I click "Once daily or less often" radio option under "Injectable Meds" for Transition Care Needs
    And I wait for 2000 milli seconds
    Then I click on "Discharge" section on left navigator
    Then I will wait to see the CARL section "Discharge" header appears on the CARL form
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    Then I select "(HHA) Home Health Agency" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    Then I verify that Care Type for the Actual Care Setting should include the following
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    Then I select "Skilled Services" in subform dropdown for "Care Type" on Discharge section
    Then I click on "Discharge Location" subform dropdown under Recommendation on Discharge section
    Then I enter "A Helping Hand Hha" and select location in the Discharge Location search box
    And I wait for 1000 milli seconds
    Then I click on Calendar Icon On Discharge date under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I select "Discharge current" with logic "minus" "3" days on Calendar Discharge Date under subform on Discharge section
    Then I click "Yes" radio option for "Have you discussed the proposal with the Interdisciplinary team?" under Discharge section
    Then I verify discharge form should provide "Who disagrees?" and the "Reason for Disagreement" if the Actual Care Setting does not match the CARL recommendation proposed facility
    Then I verify question should state "Why didn't the patient transfer to the recommended Next Site of Care?" under Recommendation on Discharge section
    Then I verify that User should be able to provide additional comments "Additional" in a free text box
    Then I select the "Family" from the "Who disagrees?" dropdown "2" for "Reason1" under Recommendation on Discharge section
    Then I select the "Not enough caregiver support" from the "Reason for Disagreement" dropdown "4" for "Reason1" under Recommendation on Discharge section
    Then I click on Done button under subform on Discharge sections
    Then I verify user should be able to navigate to the read only form and no server error should appear on Discharge section
    Then I save and continue the complete CARL form
    Then I verify left navigator should be accessible on the review page
    Then I verify there should be a "View" link on each card and clicking the link should bring the user to that specified section of the CARL form
    Then I verify "Caregiver" section should appear with "Does the patient have a capable caregiver?" on label "Yes, 24 hours a day" on the review page
    Then I verify "Caregiver" section should appear with "First Name" on label "FirstNameTest" on the review page
    Then I verify "Caregiver" section should appear with "Last Name" on label "LastNameTest" on the review page
    Then I verify "Caregiver" section should appear with "Email Address" on label "testuser@yopmail.com" on the review page
    Then I verify "Caregiver" section should appear with "Home Phone" on label "9874561230" on the review page
    Then I verify "Caregiver" section should appear with "Relationship" on label "Adoptive Parent" on the review page
    Then I verify "Independence" section should appear with "Cognitive status" on label "Forgetful" on the review page
    Then I verify "Independence" section should appear with "Activities of daily living" on label "Assistance needed for one or more ADLs" on the review page
    Then I verify "Independence" section should appear with "Ambulatory status" on label "Caregiver needed" on the review page
    Then I verify "Independence" section should appear with "Does the patient have a history of falls" on label "No answer" on the review page
    Then I verify "Anticipated Discharge Needs" section should appear with "Physical Therapy" for label "Therapies" for descriptive title "Therapies Needed" on the review page
    Then I verify "Anticipated Discharge Needs" section should appear with "Once daily or less often" for label "Injectable Meds" for descriptive title "Transition of Care Needs" on the review page
    Then I verify "Anticipated Discharge Needs" section should appear with "None" for label "Blood Testing" for descriptive title "Transition of Care Needs" on the review page
    Then I verify "Anticipated Discharge Needs" section should appear with "None" for label "Wound Care" for descriptive title "Transition of Care Needs" on the review page
    Then I verify "Anticipated Discharge Needs" section should appear with "None" for label "Teaching and Training" for descriptive title "Transition of Care Needs" on the review page
    Then I verify "Anticipated Discharge Needs" section should appear with "None" for label "Clinical Oversight" for descriptive title "Transition of Care Needs" on the review page
    Then I verify "Discharge" section should appear with "CARL recommendation" on label "Home with Limited Services (HOM)" on the review page
    Then I verify "Discharge" section should appear with "Actual care setting" on label "HHA" on the review page
    Then I verify "Discharge" section should appear with "Discharge date" on label "August 15, 2017" on the review page
    Then I verify "Discharge" section should appear with "Have you discussed the proposal with the Interdisciplinary Team?" on label "No" on the review page
    Then I verify "Discharge" section should appear with "Additional Comments" on label "None" on the review page
    Then I verify "Discharge" section should appear with "Reason for disagreement?" on label "Not enough caregiver support" on the review page
    Then I verify "Discharge" section should appear with "Additional Comments" on label "Additional" on the review page

  Scenario: As a user I would like to Save my progress in the CARL form and return to a previous page by selecting the "Save & Go Back" link
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
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I get the patient last name who have no CARL button in it
    Then I will wait to see and click on "Patient Details" followed by "span" tag
    Then I wait to the see the visibility of loader to disappear
    Then I switch to PatientTransitions frame
    Then I will fetch the value attribute of "Social Security Number" on patient details
    When I switch to default window from iframe
    Then I will wait to see and click on "Transitions" followed by "span" tag
    Then I switch to PatientTransitions frame
    Then I wait to the see the visibility of loader to disappear
    Then I click on the delete button on the transition to delete all the transitions
    Then I wait for 3000 milli seconds
    Then I wait to the see the visibility of loader to disappear
    Then I click on add a new transition to add a new episode
    Then I wait to the see the visibility of loader to disappear
    Then I will wait to see "Transition Info" followed by "a" tag
    Then I wait for 3000 milli seconds
    Then I fill in "Admit" with logic "minus" with "8" days
    Then I wait to the see the visibility of loader to disappear
    Then I select the care setting value "HHH - Hospital" on add a new transition
    Then I wait to the see the visibility of loader to disappear
    Then I select the care type value "Inpatient" on add a new transition
    Then I select the facility value "Stamford Hospital" on add a new transition
    Then I click on the Diagnosis and DRG tab on add a new transition to select the DRG
    Then I select the "Working" DRG type on the Diagnosis and DRG tab on add a new transition
    Then I select the "61" DRG value on the Diagnosis and DRG tab on add a new transition
    Then I wait for 5000 milli seconds
    Then I click on the Create Transition Button to add a new transition
    Then I wait to the see the visibility of loader to disappear
    When I switch to default window from iframe
    Then I wait for 1000 milli seconds
    Then I close the patient summary Page
    Then I verify current page "Remedy Partners" title
    When I click on Filter button present on Patient Page
    And I click on Filters button present on Filter Page
    Then I verify SSN Filter is displayed under List of Filter Options
    When I click on SSN Filter present on Filter Page
    And I wait for 2000 milli seconds
    Then I enter "SSN" value under "ssn" filter
    Then I click on Done button present on the Filter Page
    Then I scroll the page to bottom by "-100"
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I click on the complete CARL on the Patient Summary
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    And I wait for 2000 milli seconds
    Then I will wait to see the CARL section "Caregiver" header appears on the CARL form
    Then I verify Save and Go Back does not appear on the "Caregiver" section on CARL form
    Then I click on Yes, 24 hours a day option under Does the patient have a capable caregiver
    Then I save and continue the complete CARL form
    Then I click on "Independence" section on left navigator
    Then I will wait to see the CARL section "Independence" header appears on the CARL form
    Then I click on "Cognitive Status" dropdown on Independece Section
    Then I select "Forgetful" option in dropdown for cognitive status
    Then I click on "Activities of Daily Living" dropdown on Independece Section
    Then I select "Assistance needed for one or more ADLs" option in dropdown for cognitive status
    Then I click on "Ambulatory Status" dropdown on Independece Section
    Then I select "Assistive device needed" option in dropdown for cognitive status
    Then I click on the Save and Go Back on the "Independence" section on CARL form
    Then I will wait to see the CARL section "Caregiver" header appears on the CARL form
    Then I verify on Yes, 24 hours a day option is enabled under Does the patient have a capable caregiver
    Then I click on "Independence" section on left navigator
    Then I verify "Forgetful" option appears in dropdown for "Cognitive Status" label on "Independence" on CARL form
    Then I verify "Assistance needed for one or more ADLs" option appears in dropdown for "Activities of Daily Living" label on "Independence" on CARL form
    Then I verify "Assistive device needed" option appears in dropdown for "Ambulatory Status" label on "Independence" on CARL form

  Scenario: As a user, I would like to submit the CARL form upon clicking the “Submit” link on the CARL Review form
    Given I am on the login page
    When I enter email field qa.emblemrn@yopmail.com for login
    And I enter password field Episode1! for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes 2.0
    When I click on the "Episodes 2.0" tile
    Then I verify current page "Remedy Partners" title
    Then I click on the Impatient tab on the patient Card Page
    Then I wait to see and enable the attestation on the "1" patient on the Patient Card page
    Then I wait to the see the visibility of loader to disappear
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I get the patient last name who have no CARL button in it
    Then I will wait to see and click on "Patient Details" followed by "span" tag
    Then I wait to the see the visibility of loader to disappear
    Then I switch to PatientTransitions frame
    Then I will fetch the value attribute of "Social Security Number" on patient details
    When I switch to default window from iframe
    Then I will wait to see and click on "Transitions" followed by "span" tag
    Then I switch to PatientTransitions frame
    Then I wait to the see the visibility of loader to disappear
    Then I click on the delete button on the transition to delete all the transitions
    Then I wait to the see the visibility of loader to disappear
    Then I click on add a new transition to add a new episode
    Then I will wait to see "Transition Info" followed by "a" tag
    Then I wait for 3000 milli seconds
    Then I fill in "Admit" with logic "minus" with "8" days
    Then I select the care setting value "HHH - Hospital" on add a new transition
    Then I wait to the see the visibility of loader to disappear
    Then I select the care type value "Inpatient" on add a new transition
    Then I select the facility value "Stamford Hospital" on add a new transition
    Then I click on the Diagnosis and DRG tab on add a new transition to select the DRG
    Then I select the "Working" DRG type on the Diagnosis and DRG tab on add a new transition
    Then I select the "61" DRG value on the Diagnosis and DRG tab on add a new transition
    Then I wait to the see the visibility of loader to disappear
    Then I click on the Create Transition Button to add a new transition
    Then I wait to the see the visibility of loader to disappear
    When I switch to default window from iframe
    Then I wait for 1000 milli seconds
    Then I close the patient summary Page
    Then I verify current page "Remedy Partners" title
    When I click on Filter button present on Patient Page
    And I click on Filters button present on Filter Page
    Then I verify SSN Filter is displayed under List of Filter Options
    When I click on SSN Filter present on Filter Page
    And I wait for 2000 milli seconds
    Then I enter "SSN" value under "ssn" filter
    Then I click on Done button present on the Filter Page
    Then I scroll the page to bottom by "-100"
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I click on the complete CARL on the Patient Summary
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    And I wait for 4000 milli seconds
    Then I will wait to see the CARL section "Caregiver" header appears on the CARL form
    Then I click on Yes, 24 hours a day option under Does the patient have a capable caregiver
    And I click on Add Caregiver link under Choose Caregiver
    Then I Enter "FirstNameTest" and "LastNameTest" on Add Caregiver form
    Then I verify create button is enabled
    Then I select "Adoptive Parent" option from "Relationship" dropdown to create Caregiver
    Then I enter "testuser@yopmail.com" in email field
    Then I enter "9874561230" in Primary Phone field
    And I wait for 2000 milli seconds
    And I click on Create button to add Caregiver
    And I wait for 2000 milli seconds
    Then I save and continue the complete CARL form
    And I wait for 2000 milli seconds
    Then I close the patient summary Page
    Then I scroll the page to bottom by "-100"
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I get the patient last name who have no CARL button in it
    Then I click on the complete CARL on the Patient Summary
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    And I wait for 4000 milli seconds
    Then I click on "Independence" section on left navigator
    Then I will wait to see the CARL section "Independence" header appears on the CARL form
    Then I click on "Cognitive Status" dropdown on Independece Section
    Then I select "Forgetful" option in dropdown for cognitive status
    Then I click on "Activities of Daily Living" dropdown on Independece Section
    Then I select "Assistance needed for one or more ADLs" option in dropdown for cognitive status
    Then I click on "Ambulatory Status" dropdown on Independece Section
    Then I select "Caregiver needed" option in dropdown for cognitive status
    Then I click on "Anticipated Discharge Needs" section on left navigator
    And I wait for 2000 milli seconds
    Then I will wait to see the CARL section "Anticipated Discharge Needs" header appears on the CARL form
    Then I click "Physical therapy" checkbox under Therapies Needed on Anticipated Discharge Needs section
    Then I select "Injectable Meds" checkbox for Transition of Care Needs on Anticipated Discharge Needs
    Then I click "Once daily or less often" radio option under "Injectable Meds" for Transition Care Needs
    And I wait for 2000 milli seconds
    Then I click on "Discharge" section on left navigator
    And I wait for 2000 milli seconds
    And I click on the top user account link
    And I wait for 1000 milli seconds
    Then I select Log Out option from the dropdown
    Given I am on the login page
    When I enter email field qa.admin@yopmail.com for login
    And I enter password field Episode1! for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes 2.0
    When I click on the "Episodes 2.0" tile
    Then I verify current page "Remedy Partners" title
    Then I will wait to see and click on "Inpatient" followed by "span" tag
    Then I will wait to see and click on "Inpatient Care" followed by "span" tag
    Then I wait to the see the visibility of loader to disappear
    When I click on Filter button present on Patient Page
    And I click on Filters button present on Filter Page
    Then I verify SSN Filter is displayed under List of Filter Options
    When I click on SSN Filter present on Filter Page
    And I wait for 2000 milli seconds
    Then I enter "SSN" value under "ssn" filter
    Then I click on Done button present on the Filter Page
    Then I verify upon saving CARL form Patient should "show" in "Inpatient Care" work list
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
    Then I verify current page "Remedy Partners" title
    Then I click on the Impatient tab on the patient Card Page
    Then I wait to see and enable the attestation on the "1" patient on the Patient Card page
    Then I wait to the see the visibility of loader to disappear
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I get the patient last name who have no CARL button in it
    Then I will wait to see and click on "Patient Details" followed by "span" tag
    Then I wait to the see the visibility of loader to disappear
    Then I switch to PatientTransitions frame
    Then I will fetch the value attribute of "Social Security Number" on patient details
    When I switch to default window from iframe
    Then I will wait to see and click on "Transitions" followed by "span" tag
    Then I close the patient summary Page
    Then I scroll the page to bottom by "-100"
    Then I click on the patient on the patient card page that has no CARL button in it
    Then I get the patient last name who have no CARL button in it
    Then I click on the complete CARL on the Patient Summary
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    And I wait for 4000 milli seconds
    Then I click on "Discharge" section on left navigator
    Then I will wait to see the CARL section "Discharge" header appears on the CARL form
    Then I click on "Actual Care Setting" subform dropdown under Recommendation on Discharge section
    Then I select "(HHA) Home Health Agency" in subform dropdown for "Actual Care Setting" on Discharge section
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    Then I verify that Care Type for the Actual Care Setting should include the following
    Then I click on "Care Type" subform dropdown under Recommendation on Discharge section
    Then I select "Skilled Services" in subform dropdown for "Care Type" on Discharge section
    Then I click on "Discharge Location" subform dropdown under Recommendation on Discharge section
    Then I enter "A Helping Hand Hha" and select location in the Discharge Location search box
    And I wait for 1000 milli seconds
    Then I click on Calendar Icon On Discharge date under subform on Discharge section
    And I wait for 2000 milli seconds
    Then I select "Discharge current" with logic "minus" "3" days on Calendar Discharge Date under subform on Discharge section
    Then I click "Yes" radio option for "Have you discussed the proposal with the Interdisciplinary team?" under Discharge section
    Then I verify discharge form should provide "Who disagrees?" and the "Reason for Disagreement" if the Actual Care Setting does not match the CARL recommendation proposed facility
    Then I verify question should state "Why didn't the patient transfer to the recommended Next Site of Care?" under Recommendation on Discharge section
    Then I verify that User should be able to provide additional comments "Additional" in a free text box
    Then I select the "Family" from the "Who disagrees?" dropdown "2" for "Reason1" under Recommendation on Discharge section
    Then I select the "Not enough caregiver support" from the "Reason for Disagreement" dropdown "4" for "Reason1" under Recommendation on Discharge section
    Then I click on Done button under subform on Discharge sections
    Then I verify user should be able to navigate to the read only form and no server error should appear on Discharge section
    Then I save and continue the complete CARL form
    Then I verify left navigator should be accessible on the review page
    Then I verify there should be a "View" link on each card and clicking the link should bring the user to that specified section of the CARL form
    Then I verify "Caregiver" section should appear with "Does the patient have a capable caregiver?" on label "Yes, 24 hours a day" on the review page
    Then I verify "Caregiver" section should appear with "First Name" on label "FirstNameTest" on the review page
    Then I verify "Caregiver" section should appear with "Last Name" on label "LastNameTest" on the review page
    Then I verify "Caregiver" section should appear with "Email Address" on label "testuser@yopmail.com" on the review page
    Then I verify "Caregiver" section should appear with "Home Phone" on label "9874561230" on the review page
    Then I verify "Caregiver" section should appear with "Relationship" on label "Adoptive Parent" on the review page
    Then I verify "Independence" section should appear with "Cognitive status" on label "Forgetful" on the review page
    Then I verify "Independence" section should appear with "Activities of daily living" on label "Assistance needed for one or more ADLs" on the review page
    Then I verify "Independence" section should appear with "Ambulatory status" on label "Caregiver needed" on the review page
    Then I verify "Independence" section should appear with "Does the patient have a history of falls" on label "No answer" on the review page
    Then I verify "Anticipated Discharge Needs" section should appear with "Physical Therapy" for label "Therapies" for descriptive title "Therapies Needed" on the review page
    Then I verify "Anticipated Discharge Needs" section should appear with "Once daily or less often" for label "Injectable Meds" for descriptive title "Transition of Care Needs" on the review page
    Then I verify "Anticipated Discharge Needs" section should appear with "None" for label "Blood Testing" for descriptive title "Transition of Care Needs" on the review page
    Then I verify "Anticipated Discharge Needs" section should appear with "None" for label "Wound Care" for descriptive title "Transition of Care Needs" on the review page
    Then I verify "Anticipated Discharge Needs" section should appear with "None" for label "Teaching and Training" for descriptive title "Transition of Care Needs" on the review page
    Then I verify "Anticipated Discharge Needs" section should appear with "None" for label "Clinical Oversight" for descriptive title "Transition of Care Needs" on the review page
    Then I verify "Discharge" section should appear with "CARL recommendation" on label "Home with Limited Services (HOM)" on the review page
    Then I verify "Discharge" section should appear with "Actual care setting" on label "HHA" on the review page
    Then I verify "Discharge" section should appear with "Discharge date" on label "August 15, 2017" on the review page
    Then I verify "Discharge" section should appear with "Have you discussed the proposal with the Interdisciplinary Team?" on label "No" on the review page
    Then I verify "Discharge" section should appear with "Additional Comments" on label "None" on the review page
    Then I verify "Discharge" section should appear with "Reason for disagreement?" on label "Not enough caregiver support" on the review page
    Then I verify "Discharge" section should appear with "Additional Comments" on label "Additional" on the review page
    Then I verify user should be able to submit the CARL form upon clicking the Submit link on the CARL Review form
    And I wait for 2000 milli seconds
    And I click on the top user account link
    And I wait for 1000 milli seconds
    Then I select Log Out option from the dropdown
    Given I am on the login page
    When I enter email field qa.admin@yopmail.com for login
    And I enter password field Episode1! for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes 2.0
    When I click on the "Episodes 2.0" tile
    Then I verify current page "Remedy Partners" title
    Then I will wait to see and click on "Inpatient" followed by "span" tag
    Then I will wait to see and click on "Inpatient Care" followed by "span" tag
    Then I wait to the see the visibility of loader to disappear
    When I click on Filter button present on Patient Page
    And I click on Filters button present on Filter Page
    Then I verify SSN Filter is displayed under List of Filter Options
    When I click on SSN Filter present on Filter Page
    And I wait for 2000 milli seconds
    Then I enter "SSN" value under "ssn" filter
    Then I click on Done button present on the Filter Page
    Then I verify upon saving CARL form Patient should "not show" in "Inpatient Care" work list
