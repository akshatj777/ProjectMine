@sanity
Feature: Verification of Initial SNF Length of Stay Summary EC Report

  Scenario Outline: User should be able to see Level and Measures on Left Side of Initial SNF Length of Stay Summary Report
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
    When I click on show all filters icon button
    Then I should see "Model includes 2" is present under preselected model filter
    Then I should see "Dashboard Admission Month is between (and includes) 2017-01 and 2018-12" is present under preselected anchor month filter
    Then I should see Initial SNF Length of Stay Summary reports column Tile text as "Participant"
    Then I should see Initial SNF Length of Stay Summary reports column Tile text as "Episode Initiator"
    Then I should see Initial SNF Length of Stay Summary reports column Tile text as "Anchor Facility"
    Then I should see Initial SNF Length of Stay Summary reports column Tile text as "1st Post Acute Facility"
    Then I verify Initial SNF Length of Stay Summary reports column text as "Anchor Admission Month"
    Then I verify Initial SNF Length of Stay Summary reports column text as "2018-03"
    Then I verify Initial SNF Length of Stay Summary reports column text as "2017-03"
    Then I verify Initial SNF Length of Stay Summary reports column text as "# Episodes"
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    Then I should see "# Episodes" under "measures" field
    Then I should see "1st Post Acute CCN" for SNF LOS Summary under "level" field
    Then I should see "1st Post Acute Facility" for SNF LOS Summary under "level" field
    Then I should see "1st Post Acute Type" for SNF LOS Summary under "level" field
    Then I should see "Anchor Discharge Care Type" appearing under "level" field
    Then I should see "Anchor Facility" appearing under "level" field
    Then I should see "Anchor Facility Type" appearing under "level" field
    Then I should see "AtRisk" appearing under "level" field
    Then I should see "BPID" appearing under "level" field
    Then I should see "Bundle" appearing under "level" field
    Then I should see "Bundle Code" appearing under "level" field
    Then I should see "CCN" appearing under "level" field
    Then I should see "DOB" appearing under "level" field
    Then I should see "DRG" appearing under "level" field
    Then I should see "DRG Code" appearing under "level" field
    Then I should see "DataQualityFlag" appearing under "level" field
    Then I should see "Eligibility" appearing under "level" field
    Then I should see "Episode Initiator" appearing under "level" field
    Then I should see "MDC" appearing under "level" field
    Then I should see "Medicare ID" appearing under "level" field
    Then I should see "Model" appearing under "level" field
    Then I should see "NPI" appearing under "level" field
    Then I should see "Participant" appearing under "level" field
    Then I should see "Participant ID" appearing under "level" field
    Then I should see "Patient" appearing under "level" field
    Then I should see "Principal Account Practitioner" appearing under "level" field
    Then I should see "Risk Score" appearing under "level" field
    Then I should see "isAnchorAdmission" appearing under "level" field
    Then I should see "isSNFAdmissionReport" appearing under "level" field
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

  Scenario Outline: Verify user can search for network tier under snf los summary report
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
    And I wait until refresh button is disappeared
    Then I enter "Network Tier" in the search field textbox for filters
    And I verify "Network Tier (Anchor Discharge)" is appearing in the available fields under next site of care summary report
    And I verify "Network Tier (Post Acute Admission)" is appearing in the available fields under next site of care summary report
    When I click to "Network Tier (Anchor Discharge)" field filter under "Network Tier (Anchor Discharge)" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Network Tier (Anchor Discharge)" in the header text of filter page
    And I should see "<networktier1>" in the filter value list
    And I should see "<networktier1>" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    When I click to "Network Tier (Post Acute Admission)" field filter under "Network Tier (Post Acute Admission)" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Network Tier (Post Acute Admission)" in the header text of filter page
    And I should see "<networktier1>" in the filter value list
    And I should see "<networktier1>" in the filter value list

    Examples: 
      | email                         | networktier1   | networktier2 |
      | shutestaug231132a@yopmail.com | Not in Network | Tier 1       |

  Scenario Outline: User should not see fracture/non-fracture filters in the available fields in initial snf length of stay summary report under post acute care
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

  Scenario Outline: User should be able to see onboarding status and patient risk values in available fields in snf los summary report under post acute care
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

  Scenario Outline: User should be able to click on drill through column in episode connect report and select the columns and verify in snf los summary report under post acute care
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
    Then I click on a number under episodes column
    Then I switch to new window
    And I wait for the elements to load in new window after clicking one of the episode
    Then I click on "Select Columns" appearing in the new window after clicking on drill through
    Then I switch to new window
    When I switch to reports embedded iframe
    Then I verify "Select Drill-Through Columns" title is appearing on popup after clicking select columns
    And I click on "Anchor Facility Type" checkbox under "Anchor Facility" in the popup of select drill through columns
    And I click on "1st Post Acute Facility" checkbox under "Anchor Discharge Facility" in the popup of select drill through columns
    And I click on "1st Post Acute CCN" checkbox under "Anchor Discharge Facility" in the popup of select drill through columns
    And I click on ok button after selecting drill through column
    Then I switch to new window
    And I wait for the elements to load in new window after clicking one of the episode
    Then I should verify "Anchor Facility Type" is appearing under Episodes table
    Then I should verify "1st Post Acute Facility" is appearing under Episodes table
    Then I should verify "1st Post Acute CCN" is appearing under Episodes table

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |

  Scenario Outline: User should be able to verify YYYY-MM-DD format for DOB field column for snf los summary report under post acute care
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

  Scenario Outline: Verify patient risk values in database for snf los summary under post acute care
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
    When I click to "Patient Risk" field filter under "Patient" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Patient Risk" in the header text of filter page
    And I should see "Calculating Risk" in the filter value list
    And I should see "High" in the filter value list
    And I should see "Low" in the filter value list

    Examples: 
      | email                           | patientrisk1     | patientrisk2 | patientrisk3 |
      | rmexeallonboradvale@yopmail.com | Calculating Risk | Low          | High         |

  Scenario Outline: User should see patient risk and onboarding status fields in the patient drill through in initial snf length of stay summary report under post acute care
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
      | email                         |
      | shutestaug231132a@yopmail.com |

  Scenario Outline: User should be able to see eligibilty field in available fields and check the filter values and apply filter in snf los summary report under post acute care
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
    And I click on "ELIGIBLE" in the filter value list
    And I click on "ELIGIBLE" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I verify "ELIGIBLE" is visible under "Eligibility" column in the report

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |

  Scenario Outline: User should be able to see 1st post acute ccn and network tier(anchor discharge) and filter the values for network tier(anchor discharge)
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
    When I click on show all filters icon button
    Then I remove "Anchor Month" field filter under "Anchor Month" filter field from default filters
    Then I remove "Model" field filter under "Model" filter field from default filters
    Then I remove "DataQualityFlag" field filter under "DataQualityFlag" filter field from default filters
    Then I remove "isSNFAdmissionReport" field filter under "isSNFAdmissionReport" filter field from default filters
    Then I enter "1st Post Acute CCN" in the search field textbox for filters
    And I verify "1st Post Acute CCN" is appearing in the available fields under next site of care summary report
    And I click on clear search field element
    And I wait until refresh button is disappeared
    #Drag and Drop(1st Post Acute CCN)
    When I click to "1st Post Acute CCN" field filter under "Anchor Discharge Facility" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "1st Post Acute CCN" field is appearing in the layout section after selecting add to report
    Then I verify "1st Post Acute CCN" column is added to report after selecting add to report option
    #Filtering(1st Post Acute CCN)
    When I click to "1st Post Acute CCN" field filter under "Anchor Discharge Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "1st Post Acute CCN" in the header text of filter page
    And I should see "<1stpostacuteccn filter>" in the filter value list
    And I click on "<1stpostacuteccn filter>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    #Anchor Discharge Care Setting(SNF and HHA Filtering)
    When I click to "Anchor Discharge Care Setting" field filter under "Dim Anchor Discharge Care Setting" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Discharge Care Setting" in the header text of filter page
    And I should see "HHA" in the filter value list
    And I should see "SNF" in the filter value list
    And I click on "HHA" in the filter value list
    And I click on add selected in the filter model
    And I click on "SNF" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    Then I verify "Anchor Discharge Care Setting includes HHA and SNF" is appearing under selected anchor discharge care setting filter in snf los report
    #Drag and Drop(Anchor Discharge Care Setting for SNF and HHA)
    When I click to "Anchor Discharge Care Setting" field filter under "Dim Anchor Discharge Care Setting" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Anchor Discharge Care Setting" field is appearing in the layout section after selecting add to report
    Then I verify "Anchor Discharge Care Setting" column is added to report after selecting add to report option
    #Network Tier(Anchor Discharge - Tier Unknown)
    When I click to "Network Tier (Anchor Discharge)" field filter under "Network Tier (Anchor Discharge)" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Network Tier (Anchor Discharge)" in the header text of filter page
    And I should see "Tier Unknown" in the filter value list
    And I should not see "Out of Network" in the filter value list
    And I click on "Tier Unknown" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    Then I verify "Network Tier (Anchor Discharge) includes Tier Unknown" is appearing under selected network tier anchor discharge filter under snf los report

    Examples: 
      | email                              | 1stpostacuteccn filter |
      | shutestaug231132a@yopmail.com      | Not Available          |
      | reptestachmodel2opsfin@yopmail.com | Not Available          |

  Scenario Outline: User should be able to filter the values for Tier One,Tier Two and Out Of Network under network tier(anchor discharge) filter field
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
    When I click on show all filters icon button
    Then I remove "Anchor Month" field filter under "Anchor Month" filter field from default filters
    Then I remove "Model" field filter under "Model" filter field from default filters
    Then I remove "DataQualityFlag" field filter under "DataQualityFlag" filter field from default filters
    Then I remove "isSNFAdmissionReport" field filter under "isSNFAdmissionReport" filter field from default filters
    #Drag and Drop(Network Tier - Anchor Discharge)
    When I click to "Network Tier (Anchor Discharge)" field filter under "Network Tier (Anchor Discharge)" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Network Tier (Anchor Discharge)" field is appearing in the layout section after selecting add to report
    Then I verify "Network Tier (Anchor Discharge)" column is added to report after selecting add to report option
    #Filtering(Out Of Network)
    When I click to "Network Tier (Anchor Discharge)" field filter under "Network Tier (Anchor Discharge)" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Network Tier (Anchor Discharge)" in the header text of filter page
    And I click on "<networktier1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    Then I verify "Network Tier (Anchor Discharge) includes Out Of Network" is appearing under selected network tier anchor discharge filter under snf los report
    And I verify "<networktier1>" is visible under "Network Tier (Anchor Discharge)" column in the report
    Then I remove "Network Tier (Anchor Discharge)" field filter under "Network Tier (Anchor Discharge)" filter field from default filters
    #Filtering(Tier 1)
    When I click to "Network Tier (Anchor Discharge)" field filter under "Network Tier (Anchor Discharge)" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Network Tier (Anchor Discharge)" in the header text of filter page
    And I click on "<networktier2>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    Then I verify "Network Tier (Anchor Discharge) includes Tier 1" is appearing under selected network tier anchor discharge filter under snf los report
    And I verify "<networktier2>" is visible under "Network Tier (Anchor Discharge)" column in the report
    Then I remove "Network Tier (Anchor Discharge)" field filter under "Network Tier (Anchor Discharge)" filter field from default filters
    #Filtering(Tier 2)
    When I click to "Network Tier (Anchor Discharge)" field filter under "Network Tier (Anchor Discharge)" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Network Tier (Anchor Discharge)" in the header text of filter page
    And I click on "<networktier3>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    Then I verify "Network Tier (Anchor Discharge) includes Tier 2" is appearing under selected network tier anchor discharge filter under snf los report
    And I verify "<networktier3>" is visible under "Network Tier (Anchor Discharge)" column in the report

    Examples: 
      | email                     | networktier1   | networktier2 | networktier3 |
      | RPFIN2User2@yopmail.com   | Out Of Network | Tier 1       | Tier 2       |
      | OPSFINTier1_2@yopmail.com | Out Of Network | Tier 1       | Tier 2       |

  Scenario Outline: Verify drag and drop functionality for ccn and network tier(post acute admission) to the report
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
    When I click on show all filters icon button
    Then I remove "Anchor Month" field filter under "Anchor Month" filter field from default filters
    Then I remove "Model" field filter under "Model" filter field from default filters
    Then I remove "DataQualityFlag" field filter under "DataQualityFlag" filter field from default filters
    Then I remove "isSNFAdmissionReport" field filter under "isSNFAdmissionReport" filter field from default filters
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #CCN Drag and Drop
    When I click to "CCN" field filter under "Anchor Facility" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "CCN" field is appearing in the layout section after selecting add to report
    Then I verify "CCN" column is added to report after selecting add to report option
    #Drag and Drop(Network Tier Post Acute Admission)
    When I click to "Network Tier (Post Acute Admission)" field filter under "Network Tier (Post Acute Admission)" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Network Tier (Post Acute Admission)" field is appearing in the layout section after selecting add to report
    Then I verify "Network Tier (Post Acute Admission)" column is added to report after selecting add to report option

    Examples: 
      | email                   |
      | RPFIN2User2@yopmail.com |
      | OPSFINTier1@yopmail.com |
      
  Scenario Outline: User should be able to see 1st post acute ccn and network tier(anchor discharge) and filter the values for network tier(anchor discharge) when 1st post acute ccn filter is 0
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
    When I click on show all filters icon button
    Then I remove "Anchor Month" field filter under "Anchor Month" filter field from default filters
    Then I remove "Model" field filter under "Model" filter field from default filters
    Then I remove "DataQualityFlag" field filter under "DataQualityFlag" filter field from default filters
    Then I remove "isSNFAdmissionReport" field filter under "isSNFAdmissionReport" filter field from default filters
    Then I enter "1st Post Acute CCN" in the search field textbox for filters
    And I verify "1st Post Acute CCN" is appearing in the available fields under next site of care summary report
    And I click on clear search field element
    And I wait until refresh button is disappeared
    #Drag and Drop(1st Post Acute CCN)
    When I click to "1st Post Acute CCN" field filter under "Anchor Discharge Facility" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "1st Post Acute CCN" field is appearing in the layout section after selecting add to report
    Then I verify "1st Post Acute CCN" column is added to report after selecting add to report option
    #Filtering(1st Post Acute CCN)
    When I click to "1st Post Acute CCN" field filter under "Anchor Discharge Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "1st Post Acute CCN" in the header text of filter page
    And I should see "<1stpostacuteccn filter>" in the filter value list
    And I click on "<1stpostacuteccn filter>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    #Anchor Discharge Care Setting(SNF and HHA Filtering)
    When I click to "Anchor Discharge Care Setting" field filter under "Dim Anchor Discharge Care Setting" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Discharge Care Setting" in the header text of filter page
    And I should see "HHA" in the filter value list
    And I click on "HHA" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    Then I verify "Anchor Discharge Care Setting includes HHA" is appearing under selected anchor discharge care setting filter in snf los report
    #Drag and Drop(Anchor Discharge Care Setting for SNF and HHA)
    When I click to "Anchor Discharge Care Setting" field filter under "Dim Anchor Discharge Care Setting" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Anchor Discharge Care Setting" field is appearing in the layout section after selecting add to report
    Then I verify "Anchor Discharge Care Setting" column is added to report after selecting add to report option
    #Network Tier(Anchor Discharge - Tier Unknown)
    When I click to "Network Tier (Anchor Discharge)" field filter under "Network Tier (Anchor Discharge)" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Network Tier (Anchor Discharge)" in the header text of filter page
    And I should see "Tier Unknown" in the filter value list
    And I should not see "Tier 1" in the filter value list
    And I should not see "Tier 2" in the filter value list
    And I should not see "Out of Network" in the filter value list
    And I click on "Tier Unknown" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    Then I verify "Network Tier (Anchor Discharge) includes Tier Unknown" is appearing under selected network tier anchor discharge filter under snf los report

    Examples: 
      | email                              | 1stpostacuteccn filter |
      | shutestaug231132a@yopmail.com      | 0                      |
      | reptestachmodel2opsfin@yopmail.com | 0                      |