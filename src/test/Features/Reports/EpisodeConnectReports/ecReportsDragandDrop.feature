Feature: Cover the drag and drop functionality through add to report in ec reports

  Scenario Outline: User should be able to drag and drop the fields in to reports in carl report under nsoc
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Next Site of Care" under reports tile text
    When I click on the Reports Tile with text "Next Site of Care"
    Then I click on "CARL" report text for NSoC Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "CARL" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #CCN Drag and Drop
    When I click to "CCN" field filter under "Anchor Facility" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "CCN" field is appearing in the layout section after selecting add to report
    Then I verify "CCN" column is added to report after selecting add to report option
    #BPID Drag and Drop
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "BPID" field is appearing in the layout section after selecting add to report
    Then I verify "BPID" column is added to report after selecting add to report option
    #Patient Risk Drag and Drop
    When I click to "Patient Risk" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Patient Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Patient Risk" column is added to report after selecting add to report option
    #Onboarding Status Drag and Drop
    When I click to "Onboarding Status" field filter under "Onboarding Status" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Onboarding Status" field is appearing in the layout section after selecting add to report
    Then I verify "Onboarding Status" column is added to report after selecting add to report option
    #Risk Score Drag and Drop
    When I click to "Risk Score" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Risk Score" field is appearing in the layout section after selecting add to report
    Then I verify "Risk Score" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      
  Scenario Outline: User should be able to drag and drop the fields in to reports in nsoc summary report under nsoc
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Next Site of Care" under reports tile text
    When I click on the Reports Tile with text "Next Site of Care"
    Then I click on "Next Site of Care Summary" report text for NSoC Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Next Site Of Care Summary" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #CCN Drag and Drop
    When I click to "Anchor Hospital Facility CCN" field filter under "Anchor Hospital Facility" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Anchor Hospital Facility CCN" field is appearing in the layout section after selecting add to report
    Then I verify "Anchor Hospital Facility CCN" column is added to report after selecting add to report option
    #BPID Drag and Drop
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "BPID" field is appearing in the layout section after selecting add to report
    Then I verify "BPID" column is added to report after selecting add to report option
    #Patient Risk Drag and Drop
    When I click to "Patient Risk" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Patient Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Patient Risk" column is added to report after selecting add to report option
    #Onboarding Status Drag and Drop
    When I click to "Onboarding Status" field filter under "Onboarding Status" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Onboarding Status" field is appearing in the layout section after selecting add to report
    Then I verify "Onboarding Status" column is added to report after selecting add to report option
    #Risk Score Drag and Drop
    When I click to "Risk Score" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Risk Score" field is appearing in the layout section after selecting add to report
    Then I verify "Risk Score" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      
  Scenario Outline: User should be able to drag and drop the fields in to reports in episode drg issues report under patientID
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
    When I click on field-layout-icon button
    #CCN Drag and Drop
    When I click to "Anchor Hospital Facility CCN" field filter under "Anchor Hospital Facility" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Anchor Hospital Facility CCN" field is appearing in the layout section after selecting add to report
    Then I verify "Anchor Hospital Facility CCN" column is added to report after selecting add to report option
    #BPID Drag and Drop
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "BPID" field is appearing in the layout section after selecting add to report
    Then I verify "BPID" column is added to report after selecting add to report option
    #Patient Risk Drag and Drop
    When I click to "Patient Risk" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Patient Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Patient Risk" column is added to report after selecting add to report option
    #Onboarding Status Drag and Drop
    When I click to "Onboarding Status" field filter under "Onboarding Status" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Onboarding Status" field is appearing in the layout section after selecting add to report
    Then I verify "Onboarding Status" column is added to report after selecting add to report option
    #Risk Score Drag and Drop
    When I click to "Risk Score" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Risk Score" field is appearing in the layout section after selecting add to report
    Then I verify "Risk Score" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      
  Scenario Outline: User should be able to drag and drop the fields in to reports in inpatient episode clearing report under patientID
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Patient ID" under reports tile text
    When I click on the Reports Tile with text "Patient ID"
    Then I click on "Inpatient Episode Clearing" report text for Patient ID Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "InPatient Episode Clearing" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on show all filters icon button
    Then I remove "Anchor Hospital Admit Date" field filter under "Anchor Hospital Admit Date" filter field from default filters
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Dashboard Anchor CCN Drag and Drop
    When I click to "Dashboard-Anchor CCN" filter field under available fields
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Dashboard - Anchor CCN" field is appearing in the layout section after selecting add to report
    Then I verify "Dashboard - Anchor CCN" column is added to report after selecting add to report option
    #BPID Drag and Drop
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "BPID" field is appearing in the layout section after selecting add to report
    Then I verify "BPID" column is added to report after selecting add to report option
    #Patient Risk Drag and Drop
    When I click to "Patient Risk" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Patient Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Patient Risk" column is added to report after selecting add to report option
    #Onboarding Status Drag and Drop
    When I click to "Onboarding Status" field filter under "Onboarding Status" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Onboarding Status" field is appearing in the layout section after selecting add to report
    Then I verify "Onboarding Status" column is added to report after selecting add to report option
    #Risk Score Drag and Drop
    When I click to "Risk Score" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Risk Score" field is appearing in the layout section after selecting add to report
    Then I verify "Risk Score" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      
  Scenario Outline: User should be able to drag and drop the fields in to reports in snf los summary report under post acute care
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Post Acute Care" under reports tile text
    When I click on the Reports Tile with text "Post Acute Care"
    Then I click on "Initial SNF Length of Stay Summary" report text for Post Acute Care Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "SNF LOS Summary" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #SNF Discharge Date Drag and Drop
    When I click to "SNF Discharge Date" field filter under "SNF Discharge Date" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "SNF Discharge Date" field is appearing in the layout section after selecting add to report
    Then I verify "SNF Discharge Date" column is added to report after selecting add to report option
    #CCN Drag and Drop
    When I click to "CCN" field filter under "Anchor Facility" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "CCN" field is appearing in the layout section after selecting add to report
    Then I verify "CCN" column is added to report after selecting add to report option
    #BPID Drag and Drop
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "BPID" field is appearing in the layout section after selecting add to report
    Then I verify "BPID" column is added to report after selecting add to report option
    #Patient Risk Drag and Drop
    When I click to "Patient Risk" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Patient Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Patient Risk" column is added to report after selecting add to report option
    #Onboarding Status Drag and Drop
    When I click to "Onboarding Status" field filter under "Onboarding Status" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Onboarding Status" field is appearing in the layout section after selecting add to report
    Then I verify "Onboarding Status" column is added to report after selecting add to report option
    #Risk Score Drag and Drop
    When I click to "Risk Score" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Risk Score" field is appearing in the layout section after selecting add to report
    Then I verify "Risk Score" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      
  Scenario Outline: User should be able to drag and drop the fields in to reports in readmissions report under readmissions
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #CCN Drag and Drop
    When I click to "Anchor Hospital Facility CCN" field filter under "Anchor Hospital Facility" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Anchor Hospital Facility CCN" field is appearing in the layout section after selecting add to report
    Then I verify "Anchor Hospital Facility CCN" column is added to report after selecting add to report option
    #BPID Drag and Drop
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "BPID" field is appearing in the layout section after selecting add to report
    Then I verify "BPID" column is added to report after selecting add to report option
    #Patient Risk Drag and Drop
    When I click to "Patient Risk" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Patient Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Patient Risk" column is added to report after selecting add to report option
    #Onboarding Status Drag and Drop
    When I click to "Onboarding Status" field filter under "Onboarding Status" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Onboarding Status" field is appearing in the layout section after selecting add to report
    Then I verify "Onboarding Status" column is added to report after selecting add to report option
    #Risk Score Drag and Drop
    When I click to "Risk Score" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Risk Score" field is appearing in the layout section after selecting add to report
    Then I verify "Risk Score" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |