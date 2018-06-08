Feature: To verify the options and functionality of Caregiver section of Carl form

  Scenario Outline: Hover icon should be present on the Carl form and display the message on hovering
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
    Then I Verify that Carl form should appear with Save your progress link
    Then I Verify that Carl form should appear with review the form link
    Then I Verify that Carl form should appear Left navigator displaying four sections
    Then I hover on i icon present on Caregiver on TakeOver page
    Then I Verify the text hovering i icon on caregiver
    And I wait for 2000 milli seconds
    Then I verify that Does the patient have a capable caregiver? should appear on takeover page
    And I verfiy that Yes, 24 hours a day option is present under Does the patient have a capable caregiver
    And I verfiy that Yes, has caregiver support less than 24 hours a day option is present under Does the patient have a capable caregiver
    And I verfiy that No caregiver available option is present under Does the patient have a capable caregiver
    And I verfiy that No caregiver needed option is present under Does the patient have a capable caregiver
    Then I click on Yes, 24 hours a day option under Does the patient have a capable caregiver
    Then I verify that Add Caregiver link should appear under Choose Caregiver section in Caregiver on takeover page
    And I wait for 2000 milli seconds
    Then I click on Yes, has caregiver support less than 24 hours a day option under Does the patient have a capable caregiver
    Then I verify that Add Caregiver link should appear under Choose Caregiver section in Caregiver on takeover page
    And I wait for 2000 milli seconds
    Then I click on No caregiver available option under Does the patient have a capable caregiver
    Then I verify that Add Caregiver link should not appear under Choose Caregiver
    Then I click on No caregiver needed option under Does the patient have a capable caregiver
    Then I verify that Add Caregiver link should not appear under Choose Caregiver
    And I wait for 2000 milli seconds
    Then I click on Yes, 24 hours a day option under Does the patient have a capable caregiver
    And I click on Add Caregiver link under Choose Caregiver
    Then I Enter "<F_Name>" and "<L_Name>" on Add Caregiver form
    And I click on Create button to add Caregiver
    And I wait for 5000 milli seconds
    Then I click on close button in dropdown under Choose Caregiver
    And I wait for 3000 milli seconds
    Then I verify that Care Network Member drop down should appear under Choose Caregiver section in Caregiver on takeover page
    Then I verify that Add Caregiver link should appear under Choose Caregiver section in Caregiver on takeover page
    And I wait for 2000 milli seconds
    Then I click on No caregiver needed option under Does the patient have a capable caregiver
    Then I verify that Care Network Member drop down should not appear under Choose Caregiver
    Then I verify that Add Caregiver link should not appear under Choose Caregiver
    Then I click on No caregiver available option under Does the patient have a capable caregiver
    Then I verify that Care Network Member drop down should not appear under Choose Caregiver
    Then I verify that Add Caregiver link should not appear under Choose Caregiver
    And I wait for 2000 milli seconds
    Then I click on Yes, has caregiver support less than 24 hours a day option under Does the patient have a capable caregiver
    And I wait for 2000 milli seconds
    Then I verify that Care Network Member drop down should appear under Choose Caregiver section in Caregiver on takeover page
    Then I verify that Add Caregiver link should appear under Choose Caregiver section in Caregiver on takeover page
    And I wait for 2000 milli seconds
    Then I Verify that Carl form should appear with Save & Continue link
    And I wait for 2000 milli seconds
    Then I click on Anticipated Discharge Needs on side menu option
    Then I Click on Physical therapy on Anticipated Discharge Needs page
    And I wait for 2000 milli seconds
    Then I hover on i icon present on Restoration on TakeOver page
    Then I Verify the text hovering i icon on Patients Restoration Potential
    Then I close the patient summary Page
    And I wait for 2000 milli seconds
    Then I click on the searched name on the patient card
    And I wait for 10000 milli seconds
    Then I click on Care Team on navigation bar on patient summary page
    And I wait for 10000 milli seconds
    Then I switch to Patient Care Team frame
    And I click on setting icon to remove the patient under Care Team
    And I wait for 2000 milli seconds
    And I click On Remove to delete the patient
    And I wait for 5000 milli seconds
    And I click on OK button to delete the patient
    And I wait for 10000 milli seconds
    When I switch to default window from iframe
    Then I close the patient summary Page

    Examples: 
      | F_Name        | L_Name       |
      | FirstNameTest | LastNameTest |

  Scenario Outline: To verify upon selecting the +Add Caregiver link in the Caregiver page, the user should be able to complete the information on the Caregiver form.
    To add a caregiver by selecting a member from a list of all Care Network Members associated with a patient

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
    Then I click on Yes, 24 hours a day option under Does the patient have a capable caregiver
    And I click on Add Caregiver link under Choose Caregiver
    Then I verify first name is mandatory field to a create Caregiver
    Then I verify last name is mandatory field to a create Caregiver
    Then I verify create button is disabled
    Then I Enter "<F_Name>" and "<L_Name>" on Add Caregiver form
    Then I verify create button is enabled
    Then I verify Relationship field to create Caregiver
    Then I verify the label dropdown under Relationship field
    And I wait for 10000 milli seconds
    Then I verify Email field to create Caregiver
    Then I enter "<Email_Id>" in email field
    And I wait for 2000 milli seconds
    Then I verify Primary Phone field to create Caregiver
    Then I verify Home option in primary phone dropdown
    Then I verify Mobile option in primary phone dropdown
    Then I verify Work option in primary phone dropdown
    Then I verify Other option in primary phone dropdown
    Then I verify Home should be as default option
    And I wait for 5000 milli seconds
    Then I enter "9874561230" in Primary Phone field
    And I wait for 2000 milli seconds
    Then I click on Add Phone button for Additional phone number to Create Caredriver
    And I wait for 2000 milli seconds
    Then I verify Addtional Phone field to create Caregiver
    And I click on Create button to add Caregiver
    And I wait for 5000 milli seconds
    Then I click on close button in dropdown under Choose Caregiver
    Then I verify that Care Network Member drop down should appear under Choose Caregiver section in Caregiver on takeover page
    And I verify Select should appear in Care Network Member dropdwon placeholder
    Then I click on Care Network Members dropdown under Choose Caregiver
    And I wait for 5000 milli seconds
    Then I select "LASTNAMETEST, FIRSTNAMETEST" associated Caregiver from the dropdown
    And I wait for 2000 milli seconds
    Then I verify the "LASTNAMETEST, FIRSTNAMETEST" is populated in Care Network Member dropdown
    And I wait for 2000 milli seconds
    Then I verify the "LASTNAMETEST, FIRSTNAMETEST" on caregiver information card
    Then I verify "<Email_Id>" on caregiver information card
    Then I verify "<Phone>" number on caregiver information card
    And I wait for 2000 milli seconds

    Examples: 
      | F_Name        | L_Name       | Email_Id             | Phone        |
      | FirstNameTest | LastNameTest | testuser@yopmail.com | 987-456-1230 |

  Scenario Outline: To verify deleting of the caregiver created
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
    Then I click on Care Team on navigation bar on patient summary page
    Then I switch to Patient Care Team frame
    And I click on setting icon to remove the patient under Care Team
    And I wait for 2000 milli seconds
    And I click On Remove to delete the patient
    And I wait for 5000 milli seconds
    And I click on OK button to delete the patient
    When I switch to default window from iframe
    Then I close the patient summary Page

    Examples: 
      | F_Name        | L_Name       |
      | FirstNameTest | LastNameTest |
