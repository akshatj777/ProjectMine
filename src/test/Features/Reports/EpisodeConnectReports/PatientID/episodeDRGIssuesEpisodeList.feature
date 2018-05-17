Feature: Episode List Verification Under Episode DRG Issues Reports

  Scenario Outline: User should be able to see Episodes List under Episode DRG Issues Report After clicking on any Episode number link
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Patient ID" under reports tile text
    When I click on the Reports Tile with text "Patient ID"
    Then I click on "Episode DRG Issues" report text for Patient ID Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Episode DRG Issues" is appearing inside the iframe
    And I wait until refresh button is disappeared
    Then I click on a number under episodes column
    Then I switch to new window
    And I wait for the elements to load in new window after clicking one of the episode
    Then I should verify "Participant" is appearing under Episodes table
    Then I should verify "BPID" is appearing under Episodes table
    Then I should verify "Episode Initiator" is appearing under Episodes table
    Then I should verify "Anchor Hospital Facility CCN" is appearing under Episodes table
    Then I should verify "Anchor Hospital Facility" is appearing under Episodes table
    Then I should verify "Medicare ID" is appearing under Episodes table
    Then I should verify "Patient" is appearing under Episodes table
    Then I should verify "DOB" is appearing under Episodes table
    Then I should verify "DOD" is appearing under Episodes table
    Then I should verify "Eligibility" is appearing under Episodes table
    Then I should verify "Episode Status" is appearing under Episodes table
    Then I should verify "Bundle" is appearing under Episodes table
    Then I should verify "Bundle DRG Code" is appearing under Episodes table
    Then I should verify "Bundle DRG Status" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Care Setting" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Care Type" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Care Type Code (EC)" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Care Type Detail (EC)" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Care Setting Code (EC)" is appearing under Episodes table
    Then I should verify "Issue" is appearing under Episodes table
    Then I should verify "First Predicted Bundle" is appearing under Episodes table
    Then I should verify "First Predicted DRG" is appearing under Episodes table
    Then I should verify "First Predicted DRG Date" is appearing under Episodes table
    Then I should verify "First Working Bundle" is appearing under Episodes table
    Then I should verify "First Working DRG" is appearing under Episodes table
    Then I should verify "First Working DRG Date" is appearing under Episodes table
    Then I should verify "First Final Bundle" is appearing under Episodes table
    Then I should verify "First Final DRG" is appearing under Episodes table
    Then I should verify "First Final DRG Date" is appearing under Episodes table
    Then I should verify "Last Predicted Bundle" is appearing under Episodes table
    Then I should verify "Last Predicted DRG" is appearing under Episodes table
    Then I should verify "Last Predicted DRG Date" is appearing under Episodes table
    Then I should verify "Last Working Bundle" is appearing under Episodes table
    Then I should verify "Last Working DRG" is appearing under Episodes table
    Then I should verify "Last Working DRG Date" is appearing under Episodes table
    Then I should verify "Last Final Bundle" is appearing under Episodes table
    Then I should verify "Last Final DRG" is appearing under Episodes table
    Then I should verify "Last Final DRG Date" is appearing under Episodes table
    Then I should verify "Anchor Hospital Admit Date" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Date" is appearing under Episodes table

    Examples: 
      | email                          |
      #| Medicare Payer Users          |
      | shutestaug231132a@yopmail.com  |
      #| Multiple Payer Users          |
      #| multipayerachrpfin@yopmail.com |

  Scenario Outline: User should be able to click on drill through column in episode connect report and select the columns and verify in episode drg issues report under patientid
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Patient ID" under reports tile text
    When I click on the Reports Tile with text "Patient ID"
    Then I click on "Episode DRG Issues" report text for Patient ID Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Episode DRG Issues" is appearing inside the iframe
    And I wait until refresh button is disappeared
    Then I click on a number under episodes column
    Then I switch to new window
    And I wait for the elements to load in new window after clicking one of the episode
    Then I click on "Select Columns" appearing in the new window after clicking on drill through
    Then I switch to new window
    When I switch to reports embedded iframe
    Then I verify "Select Drill-Through Columns" title is appearing on popup after clicking select columns
    And I click on "Anchor Hospital Facility Type" checkbox under "Anchor Hospital Facility" in the popup of select drill through columns
    And I click on "Anchor Hospital Discharge Facility" checkbox under "Anchor Hospital Discharge Facility" in the popup of select drill through columns
    And I click on "Anchor Hospital Discharge Facility CCN" checkbox under "Anchor Hospital Discharge Facility" in the popup of select drill through columns
    And I click on ok button after selecting drill through column
    Then I switch to new window
    And I wait for the elements to load in new window after clicking one of the episode
    Then I should verify "Anchor Hospital Facility Type" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Facility" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Facility CCN" is appearing under Episodes table

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |

  Scenario Outline: User should be able to verify YYYY-MM-DD format for DOB field column for Episode DRG issues report under patientid
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Patient ID" under reports tile text
    When I click on the Reports Tile with text "Patient ID"
    Then I click on "Episode DRG Issues" report text for Patient ID Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Episode DRG Issues" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click to "DOB" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    Then I verify the DOB column format is in yyyy-MM-dd for "Patient"
    When I switch to default window from iframe
    When I click on reports tab appearing on reports page
    And I wait to see "Patient ID" under reports tile text
    Then I verify current page "Reports" title

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |

  Scenario Outline: Verify last working bundle filter doesnot show duplicates in episode drg issues report under patientid
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Patient ID" under reports tile text
    When I click on the Reports Tile with text "Patient ID"
    Then I click on "Episode DRG Issues" report text for Patient ID Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Episode DRG Issues" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click to "Last Working Bundle" field filter under "Last Working DRG" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Last Working Bundle" in the header text of filter page
    And I should see "Not Available" in the filter value list
    And I should see "Amputation" in the filter value list
    And I should see "Back & neck except spinal fusion" in the filter value list
    And I should see "Cardiac valve" in the filter value list
    And I should see "Cervical spinal fusion" in the filter value list
    And I should see "Congestive heart failure" in the filter value list
    And I should see "Coronary artery bypass graft" in the filter value list
    And I should see "Double joint replacement, lower extremities" in the filter value list
    And I should see "Fractures of the femur and hip or pelvis" in the filter value list
    And I should see "Hip & femur procedures except major joint" in the filter value list
    And I should see "Lower Major joint replacement" in the filter value list
    And I should see "Medical non-infectious orthopedic" in the filter value list
    And I should see "Other vascular surgery" in the filter value list
    And I should see "Percutaneous coronary intervention" in the filter value list
    And I should see "Revision of the hip or knee" in the filter value list

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |

  Scenario Outline: Verify last final bundle filter doesnot show duplicates in episode drg issues report under patientid
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Patient ID" under reports tile text
    When I click on the Reports Tile with text "Patient ID"
    Then I click on "Episode DRG Issues" report text for Patient ID Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Episode DRG Issues" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click to "Last Final Bundle" field filter under "Last Final DRG" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Last Final Bundle" in the header text of filter page
    And I should see "Not Available" in the filter value list
    And I should see "Acute myocardial infarction" in the filter value list
    And I should see "Amputation" in the filter value list
    And I should see "Cardiac valve" in the filter value list
    And I should see "Cervical spinal fusion" in the filter value list
    And I should see "Congestive heart failure" in the filter value list
    And I should see "Coronary artery bypass graft" in the filter value list
    And I should see "Fractures of the femur and hip or pelvis" in the filter value list
    And I should see "Hip & femur procedures except major joint" in the filter value list
    And I should see "Lower Major joint replacement" in the filter value list
    And I should see "Medical non-infectious orthopedic" in the filter value list
    And I should see "Other vascular surgery" in the filter value list
    And I should see "Percutaneous coronary intervention" in the filter value list
    And I should see "Revision of the hip or knee" in the filter value list

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |

  Scenario Outline: Verify patient risk filter doesnot show duplicates in episode drg issues report under patientid
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Patient ID" under reports tile text
    When I click on the Reports Tile with text "Patient ID"
    Then I click on "Episode DRG Issues" report text for Patient ID Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Episode DRG Issues" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click to "Patient Risk" field filter under "Patient" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Patient Risk" in the header text of filter page
    And I should see "Calculating Risk" in the filter value list
    And I should see "High" in the filter value list
    And I should see "Low" in the filter value list

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |

  Scenario Outline: Verify risk score filter doesnot show duplicates in episode drg issues report under patientid
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Patient ID" under reports tile text
    When I click on the Reports Tile with text "Patient ID"
    Then I click on "Episode DRG Issues" report text for Patient ID Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Episode DRG Issues" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click to "Risk Score" field filter under "Patient" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Risk Score" in the header text of filter page
    And I should see "0" in the filter value list
    And I should see "1" in the filter value list
    And I should see "2" in the filter value list

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |
