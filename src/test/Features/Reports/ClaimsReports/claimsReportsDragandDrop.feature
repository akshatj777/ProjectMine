Feature: Cover the drag and drop functionality through add to report in claims reports

  Scenario Outline: User should be able to drag and drop the fields Dashboard-Anchor CCN,BPID,Bundle Code,Bundle Risk and Episode Initiator through add to report in financial performance claims report under overall program
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Overall Program" under reports tile text
    When I click on the Reports Tile with text "Overall Program"
    Then I click on "Financial Performance (Claims)" report text for Overall Program Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Financial Performance" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Dashboard-Anchor CCN)
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
    #Bundle Code Drag and Drop
    When I click to "Bundle Code" field filter under "Bundle" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Code" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Code" column is added to report after selecting add to report option
    #Bundle Risk Drag and Drop
    When I click to "Bundle Risk" field filter under "Bundle Risk" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Risk" column is added to report after selecting add to report option
    #Episode Initiator Drag and Drop
    When I click on "Episode Initiator" field in the layout section to open the list
    Then I click on remove from report option in the list
    And I verify "Episode Initiator" column is not present in the reports
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Episode Initiator" field is appearing in the layout section after selecting add to report
    Then I verify "Episode Initiator" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      
  Scenario Outline: User should be able to drag and drop the fields Dashboard-Anchor CCN,BPID,Bundle Code,Bundle Risk and Episode Initiator through add to report in performance claims report under overall program
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Overall Program" under reports tile text
    When I click on the Reports Tile with text "Overall Program"
    Then I click on "Performance (Claims)" report text for Overall Program Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Performance" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Dashboard-Anchor CCN)
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
    #Bundle Code Drag and Drop
    When I click to "Bundle Code" field filter under "Bundle" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Code" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Code" column is added to report after selecting add to report option
    #Bundle Risk Drag and Drop
    When I click to "Bundle Risk" field filter under "Bundle Risk" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Risk" column is added to report after selecting add to report option
    #Episode Initiator Drag and Drop
    When I click on "Episode Initiator" field in the layout section to open the list
    Then I click on remove from report option in the list
    And I verify "Episode Initiator" column is not present in the reports
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Episode Initiator" field is appearing in the layout section after selecting add to report
    Then I verify "Episode Initiator" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      
  Scenario Outline: User should be able to drag and drop the fields Dashboard-Anchor CCN,BPID,Bundle Code,Bundle Risk and Episode Initiator through add to report in spending claims report under overall program
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Overall Program" under reports tile text
    When I click on the Reports Tile with text "Overall Program"
    Then I click on "Spending (Claims)" report text for Overall Program Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Spending" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Dashboard-Anchor CCN)
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
    #Bundle Code Drag and Drop
    When I click to "Bundle Code" field filter under "Bundle" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Code" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Code" column is added to report after selecting add to report option
    #Bundle Risk Drag and Drop
    #When I click to "Bundle Risk" field filter under "Bundle Risk" filter field
    #And I choose add to report option from select options of filter field
    #And I wait until refresh button is disappeared
    #And I verify "Bundle Risk" field is appearing in the layout section after selecting add to report
    #Then I verify "Bundle Risk" column is added to report after selecting add to report option
    #Episode Initiator Drag and Drop
    When I click on "Episode Initiator" field in the layout section to open the list
    Then I click on remove from report option in the list
    And I verify "Episode Initiator" column is not present in the reports
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Episode Initiator" field is appearing in the layout section after selecting add to report
    Then I verify "Episode Initiator" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      
  Scenario Outline: User should be able to drag and drop the fields Dashboard-Anchor CCN,BPID,Bundle Code,Bundle Risk and Episode Initiator through add to report in performance claims report under physician
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Physician" under reports tile text
    When I click on the Reports Tile with text "Physician"
    Then I click on "Performance (Claims)" report text for Physician Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Physician Performance" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Dashboard-Anchor CCN)
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
    #Bundle Code Drag and Drop
    When I click to "Bundle Code" field filter under "Bundle" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Code" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Code" column is added to report after selecting add to report option
    #Bundle Risk Drag and Drop
    When I click to "Bundle Risk" field filter under "Bundle Risk" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Risk" column is added to report after selecting add to report option
    #Episode Initiator Drag and Drop
    When I click on "Episode Initiator" field in the layout section to open the list
    Then I click on remove from report option in the list
    And I verify "Episode Initiator" column is not present in the reports
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Episode Initiator" field is appearing in the layout section after selecting add to report
    Then I verify "Episode Initiator" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      
  Scenario Outline: User should be able to drag and drop the fields Dashboard-Anchor CCN,BPID,Bundle Code,Bundle Risk and Episode Initiator through add to report in spending claims report under physician
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Physician" under reports tile text
    When I click on the Reports Tile with text "Physician"
    Then I click on "Spending (Claims)" report text for Physician Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Physician Spending" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Dashboard-Anchor CCN)
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
    #Bundle Code Drag and Drop
    When I click to "Bundle Code" field filter under "Bundle" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Code" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Code" column is added to report after selecting add to report option
    #Bundle Risk Drag and Drop
    #When I click to "Bundle Risk" field filter under "Bundle Risk" filter field
    #And I choose add to report option from select options of filter field
    #And I wait until refresh button is disappeared
    #And I verify "Bundle Risk" field is appearing in the layout section after selecting add to report
    #Then I verify "Bundle Risk" column is added to report after selecting add to report option
    #Episode Initiator Drag and Drop
    When I click on "Episode Initiator" field in the layout section to open the list
    Then I click on remove from report option in the list
    And I verify "Episode Initiator" column is not present in the reports
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Episode Initiator" field is appearing in the layout section after selecting add to report
    Then I verify "Episode Initiator" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      
  Scenario Outline: User should be able to drag and drop the fields Dashboard-Anchor CCN,BPID,Bundle Code,Bundle Risk and Episode Initiator through add to report in volume claims report under physician
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Physician" under reports tile text
    When I click on the Reports Tile with text "Physician"
    Then I click on "Volume (Claims)" report text for Physician Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Physician Volume" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Dashboard-Anchor CCN)
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
    #Bundle Code Drag and Drop
    When I click to "Bundle Code" field filter under "Bundle" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Code" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Code" column is added to report after selecting add to report option
    #Bundle Risk Drag and Drop
    When I click to "Bundle Risk" field filter under "Bundle Risk" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Risk" column is added to report after selecting add to report option
    #Episode Initiator Drag and Drop
    When I click on "Episode Initiator" field in the layout section to open the list
    Then I click on remove from report option in the list
    And I verify "Episode Initiator" column is not present in the reports
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Episode Initiator" field is appearing in the layout section after selecting add to report
    Then I verify "Episode Initiator" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      
  Scenario Outline: User should be able to drag and drop the fields Dashboard-Anchor CCN,BPID,Bundle Code,Bundle Risk and Episode Initiator through add to report in post acute care claims report under post acute care
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Post Acute Care" under reports tile text
    When I click on the Reports Tile with text "Post Acute Care"
    Then I click on "Post Acute Care (Claims)" report text for Post Acute Care Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Post Acute Care" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Dashboard-Anchor CCN)
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
    #Bundle Code Drag and Drop
    When I click to "Bundle Code" field filter under "Bundle" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Code" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Code" column is added to report after selecting add to report option
    #Bundle Risk Drag and Drop
    When I click to "Bundle Risk" field filter under "Bundle Risk" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Risk" column is added to report after selecting add to report option
    #Episode Initiator Drag and Drop
    When I click on "Episode Initiator" field in the layout section to open the list
    Then I click on remove from report option in the list
    And I verify "Episode Initiator" column is not present in the reports
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Episode Initiator" field is appearing in the layout section after selecting add to report
    Then I verify "Episode Initiator" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      
  Scenario Outline: User should be able to drag and drop the fields Dashboard-Anchor CCN,BPID,Bundle Code,Bundle Risk and Episode Initiator through add to report in snf performance claims report under post acute care
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Post Acute Care" under reports tile text
    When I click on the Reports Tile with text "Post Acute Care"
    Then I click on "SNF Performance (Claims)" report text for Post Acute Care Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "SNF Performance" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Dashboard-Anchor CCN)
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
    #Bundle Code Drag and Drop
    When I click to "Bundle Code" field filter under "Bundle" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Code" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Code" column is added to report after selecting add to report option
    #Bundle Risk Drag and Drop
    When I click to "Bundle Risk" field filter under "Bundle Risk" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Risk" column is added to report after selecting add to report option
    #Episode Initiator Drag and Drop
    When I click on "Episode Initiator" field in the layout section to open the list
    Then I click on remove from report option in the list
    And I verify "Episode Initiator" column is not present in the reports
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Episode Initiator" field is appearing in the layout section after selecting add to report
    Then I verify "Episode Initiator" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      
  Scenario Outline: User should be able to drag and drop the fields Dashboard-Anchor CCN,BPID,Bundle Code,Bundle Risk and Episode Initiator through add to report in snf volume claims report under post acute care
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Post Acute Care" under reports tile text
    When I click on the Reports Tile with text "Post Acute Care"
    Then I click on "SNF Volume (Claims)" report text for Post Acute Care Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "SNF Volume" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Dashboard-Anchor CCN)
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
    #Bundle Code Drag and Drop
    When I click to "Bundle Code" field filter under "Bundle" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Code" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Code" column is added to report after selecting add to report option
    #Bundle Risk Drag and Drop
    When I click to "Bundle Risk" field filter under "Bundle Risk" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Risk" column is added to report after selecting add to report option
    #Episode Initiator Drag and Drop
    When I click on "Episode Initiator" field in the layout section to open the list
    Then I click on remove from report option in the list
    And I verify "Episode Initiator" column is not present in the reports
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Episode Initiator" field is appearing in the layout section after selecting add to report
    Then I verify "Episode Initiator" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      
  Scenario Outline: User should be able to drag and drop the fields Dashboard-Anchor CCN,BPID,Bundle Code,Bundle Risk and Episode Initiator through add to report in readmissions claims report under readmissions
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions (Claims)" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions Claims" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Dashboard-Anchor CCN)
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
    #Bundle Code Drag and Drop
    When I click to "Bundle Code" field filter under "Bundle" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Code" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Code" column is added to report after selecting add to report option
    #Bundle Risk Drag and Drop
    When I click to "Bundle Risk" field filter under "Bundle Risk" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Bundle Risk" field is appearing in the layout section after selecting add to report
    Then I verify "Bundle Risk" column is added to report after selecting add to report option
    #Episode Initiator Drag and Drop
    When I click on "Episode Initiator" field in the layout section to open the list
    Then I click on remove from report option in the list
    And I verify "Episode Initiator" column is not present in the reports
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Episode Initiator" field is appearing in the layout section after selecting add to report
    Then I verify "Episode Initiator" column is added to report after selecting add to report option

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |