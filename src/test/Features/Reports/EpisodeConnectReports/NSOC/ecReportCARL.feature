Feature: Verification of CARL EC Report

  Scenario Outline: User should be able to see Level and Measures on Left Side of CARL Report
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
    When I click on show all filters icon button
    Then I verify "Model" filter is preselected under the filter
    Then I should see "Model includes 2" is present under preselected model filter
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    And I wait until refresh button is disappeared
    Then I should see "# Episodes" under "measures" field
    Then I should see "CARL Completion Rate" under "measures" field
    Then I should see "CARL % Followed" under "measures" field
    Then I should see "Home % CARL Proposed" under "measures" field
    Then I should see "Home % Actual NSOC" under "measures" field
    Then I should see "HHA % CARL Proposed" under "measures" field
    Then I should see "HHA % Actual NSOC" under "measures" field
    Then I should see "PAC % CARL Proposed" under "measures" field
    Then I should see "PAC % Actual NSOC" under "measures" field
    Then I should see "Uncategorized % Actual NSOC" under "measures" field
    Then I should see "1st Post Acute CCN" appearing under "level" field
    Then I should see "1st Post Acute Facility" appearing under "level" field
    Then I should see "1st Post Acute Type" appearing under "level" field
    Then I should see "Agrees with CARL Proposal" appearing under "level" field
    Then I should see "Ambulatory Status" appearing under "level" field
    Then I should see "Anchor Facility" appearing under "level" field
    Then I should see "Anchor Facility Type" appearing under "level" field
    Then I should see "AtRisk" appearing under "level" field
    Then I should see "BPID" appearing under "level" field
    Then I should see "Bundle" appearing under "level" field
    Then I should see "Bundle Code" appearing under "level" field
    Then I should see "CARL Status" appearing under "level" field
    Then I should see "CCN" appearing under "level" field
    Then I should see "Capable Caregiver Availability" appearing under "level" field
    Then I should see "Catheter" appearing under "level" field
    Then I should see "Clinical Nursing Oversight" appearing under "level" field
    Then I should see "Cognitive Status" appearing under "level" field
    Then I should see "DOB" appearing under "level" field
    Then I should see "DRG" appearing under "level" field
    Then I should see "DRG Code" appearing under "level" field
    Then I should see "DRG Status" appearing under "level" field
    Then I should see "Disagreement Reasons" appearing under "level" field
    Then I should see "Eligibility" appearing under "level" field
    Then I should see "Episode Initiator" appearing under "level" field
    Then I should see "Episode Status" appearing under "level" field
    Then I should see "Final DRG Status" appearing under "level" field
    Then I should see "First Final Bundle" appearing under "level" field
    Then I should see "First Final DRG" appearing under "level" field
    Then I should see "First Final DRG Date" appearing under "level" field
    Then I should see "First Predicted Bundle" appearing under "level" field
    Then I should see "First Predicted DRG" appearing under "level" field
    Then I should see "First Predicted DRG Date" appearing under "level" field
    Then I should see "First Working Bundle" appearing under "level" field
    Then I should see "First Working DRG" appearing under "level" field
    Then I should see "First Working DRG Date" appearing under "level" field
    Then I should see "Injectable Medications" appearing under "level" field
    Then I should see "Issue" appearing under "level" field
    Then I should see "Last Final Bundle" appearing under "level" field
    Then I should see "Last Final DRG" appearing under "level" field
    Then I should see "Last Final DRG Date" appearing under "level" field
    Then I should see "Last Predicted Bundle" appearing under "level" field
    Then I should see "Last Predicted DRG" appearing under "level" field
    Then I should see "Last Predicted DRG Date" appearing under "level" field
    Then I should see "Last Working Bundle" appearing under "level" field
    Then I should see "Last Working DRG" appearing under "level" field
    Then I should see "Last Working DRG Date" appearing under "level" field
    Then I should see "MDC" appearing under "level" field
    Then I should see "Medicare ID" appearing under "level" field
    Then I should see "Model" appearing under "level" field
    Then I should see "Ostomy Care" appearing under "level" field
    Then I should see "Oxygen or Other Respiratory Support" appearing under "level" field
    Then I should see "Participant" appearing under "level" field
    Then I should see "Participant ID" appearing under "level" field
    Then I should see "Patient" appearing under "level" field
    Then I should see "Readmission Admit Date 1" appearing under "level" field
    Then I should see "Readmission Admit Date 2" appearing under "level" field
    Then I should see "Readmission Admit Date 3" appearing under "level" field
    Then I should see "Readmission Admit Date 4" appearing under "level" field
    Then I should see "Readmission Admit Date 5" appearing under "level" field
    Then I should see "Readmission CCN 1" appearing under "level" field
    Then I should see "Readmission CCN 2" appearing under "level" field
    Then I should see "Readmission CCN 3" appearing under "level" field
    Then I should see "Readmission CCN 4" appearing under "level" field
    Then I should see "Readmission CCN 5" appearing under "level" field
    Then I should see "Readmission DRG 1" appearing under "level" field
    Then I should see "Readmission DRG 2" appearing under "level" field
    Then I should see "Readmission DRG 3" appearing under "level" field
    Then I should see "Readmission DRG 4" appearing under "level" field
    Then I should see "Readmission DRG 5" appearing under "level" field
    Then I should see "Readmission Discharge Date 1" appearing under "level" field
    Then I should see "Readmission Discharge Date 2" appearing under "level" field
    Then I should see "Readmission Discharge Date 3" appearing under "level" field
    Then I should see "Readmission Discharge Date 4" appearing under "level" field
    Then I should see "Readmission Discharge Date 5" appearing under "level" field
    Then I should see "Readmission Facility Name 1" appearing under "level" field
    Then I should see "Readmission Facility Name 2" appearing under "level" field
    Then I should see "Readmission Facility Name 3" appearing under "level" field
    Then I should see "Readmission Facility Name 4" appearing under "level" field
    Then I should see "Readmission Facility Name 5" appearing under "level" field
    Then I should see "Risk Score" appearing under "level" field
    Then I should see "Teaching and Training Activities" appearing under "level" field
    Then I should see "Therapy Needs" appearing under "level" field
    Then I should see "Tracheostomy Care" appearing under "level" field
    Then I should see "Tube Feeding" appearing under "level" field
    Then I should see "Venipuncture/ Blood Testing" appearing under "level" field
    Then I should see "Working DRG Status" appearing under "level" field
    Then I should see "Wound Care" appearing under "level" field
    Then I should see "Anchor Admission Month" appearing under "Time" field
    Then I should see "Anchor Admission Quarter" appearing under "Time" field
    Then I should see "Anchor Admission Week" appearing under "Time" field
    Then I should see "Anchor Admission Year" appearing under "Time" field
    Then I should see "Anchor Discharge Month" appearing under "Time" field
    Then I should see "Anchor Discharge Quarter" appearing under "Time" field
    Then I should see "Anchor Discharge Week" appearing under "Time" field
    Then I should see "Anchor Discharge Year" appearing under "Time" field
    Then I should see "Dashboard Admission Month" appearing under "Time" field

    Examples: 
      | email                          |
      #| Medicare Payer Users          |
      | shutestaug231132a@yopmail.com  |
      #| Multiple Payer Users          |
      #| multipayerachrpfin@yopmail.com |

  Scenario Outline: Verify user should be able to search exact values in the availbale filter fields
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
    And I wait until refresh button is disappeared
    Then I enter "PAC % Actual NSOC" in the search field textbox for filters
    And I verify "PAC % Actual NSOC" is appearing in the fields after searching
    And I click on clear search field element
    Then I enter "CARL Completion Rate" in the search field textbox for filters
    And I verify "CARL Completion Rate" is appearing in the fields after searching
    And I click on clear search field element
    Then I enter "CARL % Followed" in the search field textbox for filters
    And I verify "CARL % Followed" is appearing in the fields after searching
    And I click on clear search field element
    Then I enter "Home % CARL Proposed" in the search field textbox for filters
    And I verify "Home % CARL Proposed" is appearing in the fields after searching
    And I click on clear search field element
    Then I enter "HHA % CARL Proposed" in the search field textbox for filters
    And I verify "HHA % CARL Proposed" is appearing in the fields after searching
    And I click on clear search field element
    Then I enter "PAC % CARL Proposed" in the search field textbox for filters
    And I verify "PAC % CARL Proposed" is appearing in the fields after searching

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |

  Scenario Outline: Verify few fields are not appearing under default measeures in the layout panel
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
    When I click on field-layout-icon button
    And I wait until refresh button is disappeared
    Then I should not see "Home % Followed" is not appearing in the default measures list
    Then I should not see "HHA % Followed" is not appearing in the default measures list
    Then I should not see "PAC % Followed" is not appearing in the default measures list

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |

  Scenario Outline: Verify user is not able to see the fields after searching in the available fields
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
    And I wait until refresh button is disappeared
    Then I enter "Uncategorized % CARL" in the search field textbox for filters
    And I should not see "Uncategorized % CARL" in the searched results under the measures
    And I click on clear search field element
    Then I enter "Uncategorized % Followed" in the search field textbox for filters
    And I should not see "Uncategorized % Followed" in the searched results under the measures

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |

  Scenario Outline: User should not see fracture/non-fracture filters in the available fields in CARL report under next site of care summary
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
    And I wait until refresh button is disappeared
    Then I enter "Fracture/Non-Fracture" in the search field textbox for filters
    And I should not see "Fracture/Non-Fracture" in the searched results under the measures

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      #| shutestaug221130a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      #| shutestaug15240p@yopmail.com       |
      #| shutestaug221145a@yopmail.com      |

  Scenario Outline: User should be able to see onboarding status and patient risk values in available fields in carl report under next site of care summary
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
    And I wait until refresh button is disappeared
    Then I enter "Patient Risk" in the search field textbox for filters
    Then I verify "Patient Risk" is appearing in the level fields after searching
    And I click on clear search field element
    And I wait until refresh button is disappeared
    Then I enter "Onboarding Status" in the search field textbox for filters
    Then I verify "Onboarding Status" is appearing in the level fields after searching

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      #| shutestaug221130a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      #| shutestaug15240p@yopmail.com       |
      #| shutestaug221145a@yopmail.com      |
      
  Scenario Outline: User should be able to verify YYYY-MM-DD format for DOB field column for carl report under nsoc
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

Scenario Outline: Verify last working bundle filter doesnot show duplicates in carl report under nsoc
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

  Scenario Outline: Verify last final bundle filter doesnot show duplicates in carl report under nsoc
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

  Scenario Outline: Verify patient risk filter doesnot show duplicates in carl report under nsoc
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
    When I click to "Patient Risk" field filter under "Patient" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Patient Risk" in the header text of filter page
    And I should see "Calculating Risk" in the filter value list
    And I should see "High" in the filter value list
    And I should see "Low" in the filter value list

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |
      
Scenario Outline: Verify risk score filter doesnot show duplicates in carl report under nsoc
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
    When I click to "Risk Score" field filter under "Patient" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Risk Score" in the header text of filter page
    And I should see "0" in the filter value list
    And I should see "1" in the filter value list
    And I should see "2" in the filter value list

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |
      
  Scenario Outline: Verify onboarding status values in database for carl report under nsoc
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
    When I click to "Onboarding Status" field filter under "Onboarding Status" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Onboarding Status" in the header text of filter page
    And I should see "Needs Onboarding" in the filter value list
    And I should see "Not Onboarded" in the filter value list
    And I should see "Onboarded" in the filter value list
    And I should see "Unknown" in the filter value list

    Examples: 
      | email                           | onboardingstatus1 | onboardingstatus2 | onboardingstatus3 | onboardingstatus4 |
      | rmexeallonboradvale@yopmail.com | Unknown           | Onboarded         | Needs Onboarding  | Not Onboarded     |

  Scenario Outline: Verify patient risk values in database for carl report under nsoc
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
    When I click to "Patient Risk" field filter under "Patient" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Patient Risk" in the header text of filter page
    And I should see "Calculating Risk" in the filter value list
    And I should see "High" in the filter value list
    And I should see "Low" in the filter value list

    Examples: 
      | email                           | patientrisk1     | patientrisk2 | patientrisk3 |
      | rmexeallonboradvale@yopmail.com | Calculating Risk | Low          | High         |

  Scenario Outline: User should see patient risk and onboarding status fields in the patient drill through in carl report under next site of care
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
    Then I click on a number under episodes column
    Then I switch to new window
    And I wait for the elements to load in new window after clicking one of the episode
    Then I click on "Select Columns" appearing in the new window after clicking on drill through
    Then I switch to new window
    When I switch to reports embedded iframe
    Then I verify "Select Drill-Through Columns" title is appearing on popup after clicking select columns
    And I click on "Onboarding Status" checkbox under "Onboarding Status" in the popup of select drill through columns
    And I click on "Patient Risk" checkbox under "Patient" in the popup of select drill through columns
    And I click on ok button after selecting drill through column
    Then I switch to new window
    And I wait for the elements to load in new window after clicking one of the episode
    Then I should verify "Onboarding Status" is appearing under Episodes table
    Then I should verify "Patient Risk" is appearing under Episodes table
    
    Examples: 
      | email                          |
      | shutestaug231132a@yopmail.com  |
      
  Scenario Outline: User should be able to see eligibilty field in available fields and check the filter values and apply filter in carl report under NSOC
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
    When I click to "Eligibility" field filter under "Eligibility" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Eligibility" field is appearing in the layout section after selecting add to report
    Then I verify "Eligibility" column is added to report after selecting add to report option
    When I click to "Eligibility" field filter under "Eligibility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Eligibility" in the header text of filter page
    Then I verify there are no duplicate values in the eligibility filter field list
    And I should see "ELIGIBLE" in the filter value list
    And I should see "ERROR" in the filter value list
    And I should see "EXPIRED" in the filter value list
    And I should see "NOT_ELIGIBLE" in the filter value list
    And I click on "ELIGIBLE" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I verify "ELIGIBLE" is visible under "Eligibility" column in the report
    
    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |