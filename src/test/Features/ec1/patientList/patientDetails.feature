Feature: Patient Details Verification 
  
  Scenario Outline: Patient Details
  
  	Given I am on the login page
  	When I enter email field <email> for login
  	And I enter password field <password> for Login
  	Then I click Access button
		And I wait for 2000 milli seconds
  	Then I should see Tile text Episodes 
  	And I click on the "Episodes" tile
  	And I switch to new window
  	Then I should see Episode header text "Dashboard"
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
  	And I wait for 8000 milli seconds
  	When I click on Patient under patient list page
  	Then I click on patient details button
  	Then I see "General" under patient details
  	Then I see "First Name" under general
  	Then I click on firstname
  	Then I update with "Auto" under first name
  	Then I click on submit button
  	And I wait for 2000 milli seconds
  	Then I see "Last Name" under general
  	Then I click on lastname
  	Then I update with "Testing" under last name
  	And I wait for 2000 milli seconds
  	Then I click on submit button
  	Then I see "Primary Care Physician" under patient details
  	Then I click on physician name
  	Then I update with "TestPCP" under physicianname
  	Then I click on submit button
  	And I wait for 1000 milli seconds
  	Then I click on Add new under phones
  	Then I click on empty phone field
  	Then I update with "8416159021" under phonenumber
  	Then I click on submit button
  	And I wait for 1000 milli seconds
  	Then I click on Add new under phones
  	Then I click on empty phone field
  	Then I update with "8316159021" under phonenumber
  	Then I click on submit button
  	And I wait for 1000 milli seconds
  	Then I click on Add new under phones
  	Then I click on empty phone field
  	Then I update with "8216159021" under phonenumber
  	Then I click on submit button
  	And I wait for 1000 milli seconds
  	Then I click on Add new under phones
  	Then I click on empty phone field
  	Then I update with "8116159021" under phonenumber
  	Then I click on submit button
  	And I wait for 1000 milli seconds
  	Then I click on Add new under phones
  	Then I click on empty phone field
  	Then I update with "8016159021" under phonenumber
  	Then I click on submit button
  	And I wait for 4000 milli seconds
  	Then I click on Add new under Addresses
  	Then I click on "Select Type" under address
  	Then I select the address type
  	Then I click on submit button
  	And I wait for 1000 milli seconds
  	Then I click on "Street" to add street
  	Then I update with "286 Madison ave" under street
  	Then I click on submit button
  	And I wait for 1000 milli seconds
  	Then I click on "City" to add city
  	Then I update with "New York" under city
  	Then I click on submit button
  	And I wait for 1000 milli seconds
  	Then I click on "Select State" under address
  	Then I select the state under address
  	Then I click on submit button
  	And I wait for 1000 milli seconds
  	Then I click on "Zip" to add zip
  	Then I update with "10017" under zip
  	Then I click on submit button
  	And I wait for 2000 milli seconds
  	 	
  	 Examples:

      |          email         |   password  |
      |  qa.admin@yopmail.com  |   Episode1! |