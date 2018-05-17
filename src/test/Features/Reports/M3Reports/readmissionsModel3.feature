Feature: Readmission Model3 report verification

  Scenario Outline: <role> role user with <facility> facility should see only model3 reports not other reports.
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Next Site of Care" under reports tile text
    Then I should see Reports Tile text as Patient ID
    Then I should see Reports Tile text as Next Site of Care
    Then I should see Reports Tile text as Readmissions
    And I should not see Reports Tile text as "Dashboards"
    And I should not see Reports Tile text as "Overall Program"
    And I should not see Reports Tile text as "Physician"
    And I should not see Reports Tile text as "Post Acute Care"
    When I click on the Reports Tile with text "Patient ID"
    Then I should not see "Episode DRG Issues" report after clicking on patient id
    Then I should not see "InPatient Episode Clearing" report after clicking on patient id
    When I click on the Reports Tile with text "Next Site of Care"
    Then I should not see "CARL" report after clicking on next site of care
    Then I should not see "Next Site of Care Summary" report after clicking on next site of care
    When I click on the Reports Tile with text "Readmissions"
    Then I should see following Reports text for Readmissions reports
      | Readmissions [Model 3] |
    Then I should not see "Readmissions" report after clicking on readmissions
    Then I should not see "Readmissions (Claims)" report after clicking on readmissions
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe

    Examples: 
      | email                                 | role     | facility    |
      | RPFINM3SNFSaberHealth@yopmail.com     | RPFIN    | SNF         |
      | RPFINM3HHAVisitingQA@yopmail.com      | RPFIN    | HHA         |
      | OPSFINM3SNFSaberHealth@yopmail.com    | OPSFIN   | SNF         |
      | OPSFINM3HHAVisiting@yopmail.com       | OPSFIN   | HHA         |
      | RPNOFINM3SNFSaberHealth@yopmail.com   | RPNOFIN  | SNF         |
      | RPNOFINM3HHAVisitingQA@yopmail.com    | RPNOFIN  | HHA         |
      | OPSNOFINM3SNFSabHe@yopmail.com        | OPSNOFIN | SNF         |
      | OPSNOFINM3HHAVisitingQA@yopmail.com   | OPSNOFIN | HHA         |
      | OPSSPENDM3SNFSaberHealth@yopmail.com  | OPSSPEND | SNF         |
      | OPSPENDM3HHAVisitingQA@yopmail.com    | OPSPEND  | HHA         |
      | ECREPORTSM3SNFSaberHealth@yopmail.com | ECREPORT | SNF         |
      | ECREPORTSM3HHAVisitingQA@yopmail.com  | ECREPORT | HHA         |
      | RPFINM3HHASNFVisitQA@yopmail.com      | RPFIN    | SNF and HHA |

  Scenario Outline: <role> role user with <facility> facility should have the default filters appearing under readmissions model3 report
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on show all filters icon button
    Then I verify anchor post acute admission year "Anchor Post Acute Admission Year includes previous Anchor Post Acute Admission Year and current Anchor Post Acute Admission Year" is preselected under nsoc model3 report

    Examples: 
      | email                              | role   | facility    |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA |

  Scenario Outline: <role> role user with <facility> facility should see default measures and dimensions as per the requirement under readmissions model3 report
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-layout-icon button
    Then I should see "# Episodes" under "measures" field
    Then I should see "% Eps w Readmit" under "measures" field
    Then I should see "Readmits per Eps" under "measures" field
    Then I should see "% Eps w Readmit w/in 7 days" under "measures" field
    Then I should see "% Eps w Readmit w/in 15 days" under "measures" field
    Then I should see "% Eps w Readmit w/in 30 days" under "measures" field
    Then I should see "% Eps w Readmit w/in 60 days" under "measures" field
    Then I should see "% Eps w Readmit w/in 90 days" under "measures" field
    Then I should see "Participant" under "dimensions" field
    Then I should see "Episode Initiator" under "dimensions" field
    Then I should see "Anchor Post Acute Admission Month" under "dimensions" field

    Examples: 
      | email                              | role   | facility    |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA |

  Scenario Outline: Verify that the Model field in Readmissions [Model 3] report is draggable and should not see model2 and filter the values for model3 for user with <role> role for <facility> facility
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    And I wait until refresh button is disappeared
    When I click on field-layout-icon button
    #Drag and Drop Verify
    When I click on "Model" field which is listed under "Model" filter from available fields
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I should see "Model" is added in layout section after clicking on add to report
    Then I verify "Model" field is appearing in the report table after clicking on add to report
    #Fitering Part for Model filter to see only model3 and not model2
    When I click on "Model" field which is listed under "Model" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Model" in the header text of filter page
    And I should see "3" in the filter value list
    And I should not see "2" in the filter value list
    And I click on "3" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "3" result in "Model" field column for "Model" filter field

    Examples: 
      | email                              | role   | facility    |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA |

  Scenario Outline: User with <model> and having <facility> facility should not see Readmissions Model3 report under nsoc
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Patient ID" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I should not see "Readmissions [Model 3]" report after clicking on readmissions

    Examples: 
      | email                         | facility | model  |
      | shutestauf171115a@yopmail.com | PGP      | Model3 |

  Scenario Outline: User with <model> and having <facility> facility should not see Readmissions Model3 report under nsoc
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    And I should not see Report with text as "Readmissions [Model 3]"

    Examples: 
      | email                         | facility | model  |
      | shutestaug231132a@yopmail.com | ACH      | Model2 |
      | shutestaug15252p@yopmail.com  | PGP      | Model2 |

  Scenario Outline: Validate that the changes made to the Global Filters are reflected and applied to the Readmission [Model 3] report for user with <role> role for <facility> facility
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I switch to default window from iframe
    Then I verify "Readmissions [Model 3]" in the reports header page
    When I see "0" filters applied under global filters applied count
    Then I click on Show Summary button to unhide the available global filters
    Then I verify "Payer" filter is appearing under global filters
    Then I verify "Participant" filter is appearing under global filters
    Then I verify "Episode Initiator" filter is appearing under global filters
    Then I verify "Anchor Facility" filter is appearing under global filters
    Then I click on <payer1> checkbox under payer for global filters
    Then I click on <participant1> checkbox under participant for global filters
    Then I click on <episode initiator1> checkbox under episode initiator for global filters
    Then I click on <anchor facility1> checkbox under anchor facility for global filters
    And I verify <payer1> is appearing under applied payer on global filters
    And I verify <participant1> is appearing under applied participant on global filters
    And I verify <episode initiator1> is appearing under applied episode initiator on global filters
    And I verify <anchor facility1> is appearing under applied anchor facility on global filters
    And I click on Apply filters button for global filters
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on show all filters icon button
    Then I verify participant filter is selected with <participantid1> under selected filters
    Then I verify episode initiator filter is selected with <bpid1> under selected filters
    Then I verify dashboard anchor ccn filter is selected with <ccn1> under selected filters
    Then I verify payer filter is selected with <payer1> under selected filters

    Examples: 
      | email                              | role   | facility    | participant1                                 | episode initiator1                           | anchor facility1                     | participantid1 | bpid1    | ccn1   | payer1   |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         | Saber Health                                 | Amberwood Manor                              | Amberwood Manor                      |         442527 | 3056-y63 | 366253 | Medicare |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         | Visiting Nurse Service of New York Home Care | Visiting Nurse Service of New York Home Care | Vns Of Ny Home Care Chha (manhattan) |         789001 | 3056-003 | 337008 | Medicare |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         | Saber Health                                 | Amberwood Manor                              | Amberwood Manor                      |         442527 | 3056-y63 | 366253 | Medicare |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         | Visiting Nurse Service of New York Home Care | Visiting Nurse Service of New York Home Care | Vns Of Ny Home Care Chha (manhattan) |         789001 | 3056-003 | 337008 | Medicare |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA | Saber Health                                 | Amberwood Manor                              | Amberwood Manor                      |         442527 | 3056-y63 | 366253 | Medicare |

  Scenario Outline: Validate the On-boarding status field values on the Readmissions [Model 3] report and filters for user with <role> role for <facility> facility
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Add to Report)
    When I click on "Onboarding Status" field which is listed under "Patient Details" filter from available fields
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I should see "Onboarding Status" is added in layout section after clicking on add to report
    Then I verify "Onboarding Status" field is appearing in the report table after clicking on add to report
    #Filtering
    When I click on "Onboarding Status" field which is listed under "Patient Details" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Onboarding Status" in the header text of filter page
    And I should see "<onboardingstatus1>" in the filter value list
    And I should see "<onboardingstatus2>" in the filter value list
    And I should see "<onboardingstatus3>" in the filter value list
    And I should see "<onboardingstatus4>" in the filter value list
    And I click on "<onboardingstatus1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<onboardingstatus1>" result in "Onboarding Status" field column for "Onboarding Status" filter field

    Examples: 
      | email                               | role   | facility    | onboardingstatus1 | onboardingstatus2 | onboardingstatus3 | onboardingstatus4 |
      | M3RPFINOnboardingStatus@yopmail.com | RPFIN  | SNF         | Needs Onboarding  | Onboarded         | Unknown           | Not Onboarded     |
      #| RPFINM3HHAVisitingQA@yopmail.com    | RPFIN  | HHA         | Unknown           |                   |                   |                   |
      | OPSFINM3SNFSaberHealth@yopmail.com  | OPSFIN | SNF         | Needs Onboarding  | Onboarded         | Unknown           |                   |
      #| OPSFINM3HHAVisiting@yopmail.com     | OPSFIN | HHA         | Unknown           |                   |                   |                   |
      #| RPFINM3HHASNFVisitQA@yopmail.com    | RPFIN  | SNF and HHA | Needs Onboarding  | Onboarded         | Unknown           |                   |

  Scenario Outline: User with <role> role and having <facillity> facility should be able to validate participant field value for readmissions Model3 report
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on "Participant" field which is listed under "Episode Initiator" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Participant" in the header text of filter page
    And I should see "<participant1>" in the filter value list
    And I should see "<participant2>" in the filter value list
    And I click on "<participant1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<participant1>" result in "Participant" field column for "Episode Initiator" filter field

    Examples: 
      | email                              | role   | facility    | participant1                           | participant2                           |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         | Saber Health                           |                                        |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         | Visiting Nurse Service of NY Home Care |                                        |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         | Saber Health                           |                                        |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         | Visiting Nurse Service of NY Home Care |                                        |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA | Saber Health                           | Visiting Nurse Service of NY Home Care |

  Scenario Outline: User with <role> role and having <facillity> facility should be able to validate bpid field value for Readmissions Model3 report
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Add to Report)
    When I click on "BPID" field which is listed under "Episode Initiator" filter from available fields
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I should see "BPID" is added in layout section after clicking on add to report
    Then I verify "BPID" field is appearing in the report table after clicking on add to report
    #Filtering
    When I click on "BPID" field which is listed under "Episode Initiator" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "BPID" in the header text of filter page
    And I should see "<BPID1>" in the filter value list
    And I should see "<BPID2>" in the filter value list
    And I should see "<BPID3>" in the filter value list
    And I should see "<BPID4>" in the filter value list
    And I should see "<BPID5>" in the filter value list
    And I should see "<BPID6>" in the filter value list
    And I should see "<BPID7>" in the filter value list
    And I click on "<BPID1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<BPID1>" result in "BPID" field column for "Episode Initiator" filter field

    Examples: 
      | email                              | role   | facility    | BPID1    | BPID2    | BPID3    | BPID4    | BPID5    | BPID6    | BPID7    |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         | 3056-y63 | 3056-y67 | 3056-y68 | 3056-y85 | 3056-y95 | 3056-y98 | 3056-z13 |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         | 3056-003 |          |          |          |          |          |          |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         | 3056-y63 | 3056-y67 | 3056-y95 | 3056-z13 |          |          |          |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         | 3056-003 |          |          |          |          |          |          |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA | 3056-003 | 3056-y63 | 3056-y67 | 3056-y95 | 3056-z13 |          |          |

  Scenario Outline: User with <role> role and having <facillity> facility should be able to validate anchor post acute provider ccn field value for Readmissions Model3 report
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Add to Report)
    When I click on "Anchor Post Acute Provider CCN" field which is listed under "Anchor Post Acute Provider" filter from available fields
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I should see "Anchor Post Acute Provider CCN" is added in layout section after clicking on add to report
    Then I verify "Anchor Post Acute Provider CCN" field is appearing in the report table after clicking on add to report
    #Filtering
    When I click on "Anchor Post Acute Provider CCN" field which is listed under "Anchor Post Acute Provider" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Post Acute Provider CCN" in the header text of filter page
    And I should see "<anchorpostacuteproviderccn1>" in the filter value list
    And I should see "<anchorpostacuteproviderccn2>" in the filter value list
    And I should see "<anchorpostacuteproviderccn3>" in the filter value list
    And I should see "<anchorpostacuteproviderccn4>" in the filter value list
    And I should see "<anchorpostacuteproviderccn5>" in the filter value list
    And I should see "<anchorpostacuteproviderccn6>" in the filter value list
    And I should see "<anchorpostacuteproviderccn7>" in the filter value list
    And I click on "<anchorpostacuteproviderccn1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<anchorpostacuteproviderccn1>" result in "Anchor Post Acute Provider CCN" field column for "Anchor Post Acute Provider" filter field

    Examples: 
      | email                              | role   | facility    | anchorpostacuteproviderccn1 | anchorpostacuteproviderccn2 | anchorpostacuteproviderccn3 | anchorpostacuteproviderccn4 | anchorpostacuteproviderccn5 | anchorpostacuteproviderccn6 | anchorpostacuteproviderccn7 |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         |                      345557 |                      366253 |                      366395 |                      366403 |                      495401 |                      495407 |                      495411 |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         |                      337008 |                             |                             |                             |                             |                             |                             |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         |                      345557 |                      366253 |                      495401 |                      495411 |                             |                             |                             |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         |                      337008 |                             |                             |                             |                             |                             |                             |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA |                      337008 |                      345557 |                      366253 |                      495401 |                      495411 |                             |                             |

  Scenario Outline: User with <role> role and having <facillity> facility should be able to validate episode initiator field value for NSOC Model3 report in frontend and database
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on "Episode Initiator" field which is listed under "Episode Initiator" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Episode Initiator" in the header text of filter page
    And I should see "<episodeInitiators>" in the value list after selecting filter
    And I click on "<episodeInitiator>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<episodeInitiator>" result in "Episode Initiator" field column for "Episode Initiator" filter field

    Examples: 
      | email                              | role   | facility    | episodeInitiators                                                                                                                        | episodeInitiator                             |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         | Amberwood Manor,Azalea Health,Bath Creek Health,Falls Run Nursing,Liberty Ridge Health,Brecksville Health,Tyler's Retreat At Iron Bridge | Amberwood Manor                              |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         | Visiting Nurse Service Of New York Home Care                                                                                             | Visiting Nurse Service Of New York Home Care |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         | Amberwood Manor,Azalea Health,Liberty Ridge Health,Tyler's Retreat At Iron Bridge                                                        | Amberwood Manor                              |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         | Visiting Nurse Service Of New York Home Care                                                                                             | Visiting Nurse Service Of New York Home Care |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA | Visiting Nurse Service Of New York Home Care,Amberwood Manor,Azalea Health,Liberty Ridge Health,Tyler's Retreat At Iron Bridge           | Amberwood Manor                              |

  Scenario Outline: Validate bundle list values field for Readmissions [Model 3] report and filters for user with <role> role for <facility> facility
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on "Bundle" field which is listed under "Bundle" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Bundle" in the header text of filter page
    And I should see "<bundle1>" in the filter value list
    And I should see "<bundle2>" in the filter value list
    And I should see "<bundle3>" in the filter value list
    And I should see "<bundle4>" in the filter value list
    And I should see "<bundle5>" in the filter value list
    And I should see "<bundle6>" in the filter value list
    And I should see "<bundle7>" in the filter value list
    And I should see "<bundle8>" in the filter value list
    And I should see "<bundle9>" in the filter value list
    And I should see "<bundle10>" in the filter value list
    And I should see "<bundle11>" in the filter value list
    And I should see "<bundle12>" in the filter value list
    And I should see "<bundle13>" in the filter value list
    And I should see "<bundle14>" in the filter value list
    And I should see "<bundle15>" in the filter value list
    And I should see "<bundle16>" in the filter value list
    And I should see "<bundle17>" in the filter value list
    And I should see "<bundle18>" in the filter value list
    And I should see "<bundle19>" in the filter value list
    And I should see "<bundle20>" in the filter value list
    And I should see "<bundle21>" in the filter value list
    And I should see "<bundle22>" in the filter value list
    And I should see "<bundle23>" in the filter value list
    And I should see "<bundle24>" in the filter value list
    And I should see "<bundle25>" in the filter value list
    And I should see "<bundle26>" in the filter value list
    And I should see "<bundle27>" in the filter value list
    And I should see "<bundle28>" in the filter value list
    And I should see "<bundle29>" in the filter value list
    And I click on "<bundle1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<bundle1>" result in "Bundle" field column for "Bundle" filter field

    Examples: 
      | email                              | role   | facility    | bundle1                          | bundle2                          | bundle3                  | bundle4                | bundle5                  | bundle6    | bundle7                                     | bundle8                                  | bundle9                                     | bundle10                                  | bundle11                      | bundle12                                      | bundle13                                  | bundle14                            | bundle15                                      | bundle16              | bundle17                          | bundle18                            | bundle19                                    | bundle20                     | bundle21                    | bundle22           | bundle23                                    | bundle24                      | bundle25                | bundle26           | bundle27           | bundle28                      | bundle29                |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         | Acute myocardial infarction      | Back & neck except spinal fusion | COPD, bronchitis, asthma | Cellulitis             | Cervical spinal fusion   | Chest pain | Congestive heart failure                    | Diabetes                                 | Double joint replacement, lower extremities | Fractures of the femur and hip or pelvis  | Gastrointestinal hemorrhage   | Gastrointestinal obstruction                  | Hip & femur procedures except major joint | Lower Major joint replacement       | Lower extrem, humerus except hip, foot, femur | Major bowel procedure | Medical non-infectious orthopedic | Nutritional and metabolic disorders | Other knee procedures                       | Other respiratory            | Revision of the hip or knee | Sepsis             | Simple pneumonia and respiratory infections | Spinal fusion (non-cervical)  | Stroke                  | Syncope & collapse | Transient ischemia | Upper Major joint replacement | Urinary tract infection |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         | Congestive heart failure         |                                  |                          |                        |                          |            |                                             |                                          |                                             |                                           |                               |                                               |                                           |                                     |                                               |                       |                                   |                                     |                                             |                              |                             |                    |                                             |                               |                         |                    |                    |                               |                         |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         | Back & neck except spinal fusion | COPD, bronchitis, asthma         | Cellulitis               | Cervical spinal fusion | Congestive heart failure | Diabetes   | Double joint replacement, lower extremities | Fractures of the femur and hip or pelvis | Gastrointestinal hemorrhage                 | Hip & femur procedures except major joint | Lower Major joint replacement | Lower extrem, humerus except hip, foot, femur | Medical non-infectious orthopedic         | Nutritional and metabolic disorders | Other knee procedures                         | Other respiratory     | Revision of the hip or knee       | Sepsis                              | Simple pneumonia and respiratory infections | Spinal fusion (non-cervical) | Stroke                      | Syncope & collapse | Transient ischemia                          | Upper Major joint replacement | Urinary tract infection |                    |                    |                               |                         |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         | Congestive heart failure         |                                  |                          |                        |                          |            |                                             |                                          |                                             |                                           |                               |                                               |                                           |                                     |                                               |                       |                                   |                                     |                                             |                              |                             |                    |                                             |                               |                         |                    |                    |                               |                         |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA | Back & neck except spinal fusion | COPD, bronchitis, asthma         | Cellulitis               | Cervical spinal fusion | Congestive heart failure | Diabetes   | Double joint replacement, lower extremities | Fractures of the femur and hip or pelvis | Gastrointestinal hemorrhage                 | Hip & femur procedures except major joint | Lower Major joint replacement | Lower extrem, humerus except hip, foot, femur | Medical non-infectious orthopedic         | Nutritional and metabolic disorders | Other knee procedures                         | Other respiratory     | Revision of the hip or knee       | Sepsis                              | Simple pneumonia and respiratory infections | Spinal fusion (non-cervical) | Stroke                      | Syncope & collapse | Transient ischemia                          | Upper Major joint replacement | Urinary tract infection |                    |                    |                               |                         |

  Scenario Outline: Validate Anchor Post Acute Discharge Month drag and drop and filtering in Readmissions Model 3 report for user with <role> role for <facility> facility
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    When I click on show all filters icon button
    Then I remove "Anchor Post Acute Admission Year" field filter under "Anchor Post Acute Admit Date" filter field from default filters
    #Drag and Drop
    When I click on "Anchor Post Acute Discharge Month" field which is listed under "Anchor Post Acute Discharge Date" filter from available fields
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I should see "Anchor Post Acute Discharge Month" is added in layout section after clicking on add to report
    Then I verify "Anchor Post Acute Discharge Month" field is appearing in the report table after clicking on add to report
    #Filtering
    When I click on "Anchor Post Acute Discharge Month" field which is listed under "Anchor Post Acute Discharge Date" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Post Acute Discharge Month" in the header text of filter page
    When I click on select from list option on the filter page
    And I should see "<postacutedischargemonth1>" in the filter value list
    And I should see "<postacutedischargemonth2>" in the filter value list
    And I should see "<postacutedischargemonth3>" in the filter value list
    And I should see "<postacutedischargemonth4>" in the filter value list
    And I should see "<postacutedischargemonth5>" in the filter value list
    And I should see "<postacutedischargemonth6>" in the filter value list
    And I click on "<postacutedischargemonth1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<postacutedischargemonth1>" result in "Anchor Post Acute Discharge Month" field column for "Anchor Post Acute Discharge Date" filter field
    Then I verify anchor post acute discharge month is in yyyy-MM format

    Examples: 
      | email                              | role   | facility    | postacutedischargemonth1 | postacutedischargemonth2 | postacutedischargemonth3 | postacutedischargemonth4 | postacutedischargemonth5 | postacutedischargemonth6 |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         | 2017-05                  | 2017-06                  | 2017-07                  | 2017-08                  | 2017-09                  | 2017-10                  |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         | 2016-01                  | 2016-02                  | 2016-03                  |                          |                          |                          |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         | 2017-05                  | 2017-06                  | 2017-07                  | 2017-08                  | 2017-09                  | 2017-10                  |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         | 2016-01                  | 2016-02                  | 2016-03                  |                          |                          |                          |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA | 2017-05                  | 2017-06                  | 2017-07                  | 2017-08                  | 2017-09                  | 2017-10                  |

  Scenario Outline: Validate Payer is draggable and apply filter in Readmissions Model 3 report for user with <role> role for <facility> facility
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Add to report)
    When I click on "Payer" field which is listed under "Episode Initiator" filter from available fields
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I should see "Payer" is added in layout section after clicking on add to report
    Then I verify "Payer" field is appearing in the report table after clicking on add to report
    #Filtering
    When I click on "Payer" field which is listed under "Episode Initiator" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Payer" in the header text of filter page
    And I should see "<payer1>" in the filter value list
    And I click on "<payer1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<payer1>" result in "Payer" field column for "Episode Initiator" filter field

    Examples: 
      | email                              | role   | facility    | payer1   |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         | Medicare |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         | Medicare |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         | Medicare |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         | Medicare |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA | Medicare |

  Scenario Outline: Validate DOB field is draggable for Readmissions Model 3 report user with <role> role for <facility> facility
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    When I click on "DOB" field which is listed under "Patient Details" filter from available fields
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I should see "DOB" is added in layout section after clicking on add to report
    Then I verify "DOB" field is appearing in the report table after clicking on add to report

    Examples: 
      | email                              | role   | facility    |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA |

  Scenario Outline: Validate the Patient Risk field values on the Readmissions M3 report and filters for user with <role> role for <facility> facility
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    #Drag and Drop(Add to Report)
    When I click on "Patient Risk" field which is listed under "Patient Details" filter from available fields
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I should see "Patient Risk" is added in layout section after clicking on add to report
    Then I verify "Patient Risk" field is appearing in the report table after clicking on add to report
    #Filtering
    When I click on "Patient Risk" field which is listed under "Patient Details" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Patient Risk" in the header text of filter page
    And I should see "<patientrisk1>" in the filter value list
    And I should see "<patientrisk2>" in the filter value list
    And I should see "<patientrisk3>" in the filter value list
    And I click on "<patientrisk1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<patientrisk1>" result in "Patient Risk" field column for "Patient" filter field

    Examples: 
      | email                              | role   | facility    | patientrisk1     | patientrisk2 | patientrisk3 |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         | Calculating Risk | High         | Low          |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         | Calculating Risk |              |              |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         | Calculating Risk | Low          | High         |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         | Calculating Risk |              |              |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA | Calculating Risk | High         | Low          |

  Scenario Outline: Validate that the no. of Episodes on the drill through page with no. of episodes count on readmissions model3 report page for user with <role> role for <facility> facility
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    Then I verify the episodes count matches with dill through

    Examples: 
      | email                              | role   | facility    |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA |

  Scenario Outline: <role> role user with <facility> facility should see all columns as per the requirement should be there in drill through under readmissions model3 report
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    Then I click on a number under episodes column
    Then I switch to new window
    And I wait for the elements to load in new window after clicking one of the episode
    Then I should verify "Participant" is appearing under Episodes table
    Then I should verify "BPID" is appearing under Episodes table
    Then I should verify "Anchor Post Acute Provider" is appearing under Episodes table
    Then I should verify "Anchor Post Acute Provider CCN" is appearing under Episodes table
    Then I should verify "Medicare ID" is appearing under Episodes table
    Then I should verify "Patient" is appearing under Episodes table
    Then I should verify "DOB" is appearing under Episodes table
    Then I should verify "DOD" is appearing under Episodes table
    Then I should verify "Eligibility" is appearing under Episodes table
    Then I should verify "Episode Status" is appearing under Episodes table
    Then I should verify "Bundle" is appearing under Episodes table
    Then I should verify "Bundle DRG Code" is appearing under Episodes table
    Then I should verify "Bundle DRG Status" is appearing under Episodes table
    Then I should verify "Anchor Post Acute Discharge Care Setting" is appearing under Episodes table
    Then I should verify "Anchor Post Acute Discharge Care Type" is appearing under Episodes table
    Then I should verify "Readmission CCN 1" is appearing under Episodes table
    Then I should verify "Readmission Facility Name 1" is appearing under Episodes table
    Then I should verify "Readmission DRG 1" is appearing under Episodes table
    Then I should verify "Readmission Admit Date 1" is appearing under Episodes table
    Then I should verify "Readmission Discharge Date 1" is appearing under Episodes table
    Then I should verify "Readmission CCN 2" is appearing under Episodes table
    Then I should verify "Readmission Facility Name 2" is appearing under Episodes table
    Then I should verify "Readmission DRG 2" is appearing under Episodes table
    Then I should verify "Readmission Admit Date 2" is appearing under Episodes table
    Then I should verify "Readmission Discharge Date 2" is appearing under Episodes table
    Then I should verify "Readmission CCN 3" is appearing under Episodes table
    Then I should verify "Readmission Facility Name 3" is appearing under Episodes table
    Then I should verify "Readmission DRG 3" is appearing under Episodes table
    Then I should verify "Readmission Admit Date 3" is appearing under Episodes table
    Then I should verify "Readmission Discharge Date 3" is appearing under Episodes table
    Then I should verify "Readmission CCN 4" is appearing under Episodes table
    Then I should verify "Readmission Facility Name 4" is appearing under Episodes table
    Then I should verify "Readmission DRG 4" is appearing under Episodes table
    Then I should verify "Readmission Admit Date 4" is appearing under Episodes table
    Then I should verify "Readmission Discharge Date 4" is appearing under Episodes table
    Then I should verify "Readmission CCN 5" is appearing under Episodes table
    Then I should verify "Readmission Facility Name 5" is appearing under Episodes table
    Then I should verify "Readmission DRG 5" is appearing under Episodes table
    Then I should verify "Readmission Admit Date 5" is appearing under Episodes table
    Then I should verify "Readmission Discharge Date 5" is appearing under Episodes table
    Then I should verify "Anchor Post Acute Admit Date" is appearing under Episodes table
    Then I should verify "Anchor Post Acute Discharge Date" is appearing under Episodes table
    Then I should verify "Readmit - 7 Days" is appearing under Episodes table
    Then I should verify "Readmit - 15 Days" is appearing under Episodes table
    Then I should verify "Readmit - 30 Days" is appearing under Episodes table
    Then I should verify "Readmit - 60 Days" is appearing under Episodes table
    Then I should verify "Readmit - 90 Days" is appearing under Episodes table
    Then I should verify "Total Readmits" is appearing under Episodes table

    Examples: 
      | email                              | role   | facility    |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA |

  Scenario Outline: User should be able to see eligibilty field in available fields and check the filter values and apply filter in readmissions model3 report under readmissions
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Readmissions" under reports tile text
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions [Model 3]" report text for Readmissions Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Readmissions EC [Model 3]" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click on field-layout-icon button
    When I click on show all filters icon button
    Then I remove "Anchor Post Acute Admission Year" field filter under "Anchor Post Acute Admit Date" filter field from default filters
    When I click to "Eligibility" field filter under "Eligibility" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify "Eligibility" field is appearing in the layout section after selecting add to report
    Then I verify "Eligibility" column is added to report after selecting add to report option
    When I click to "Eligibility" field filter under "Eligibility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Eligibility" in the header text of filter page
    Then I verify there are no duplicate values in the eligibility filter field list
    And I should see "<eligibility1>" in the filter value list
    And I should see "<eligibility2>" in the filter value list
    And I should see "<eligibility3>" in the filter value list
    And I should see "<eligibility4>" in the filter value list
    And I click on "ELIGIBLE" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I verify "ELIGIBLE" is visible under "Eligibility" column in the report

    Examples: 
      | email                              | role   | facility    | eligibility1 | eligilibilty2 | eligilibilty3 | eligilibilty4 |
      | RPFINM3SNFSaberHealth@yopmail.com  | RPFIN  | SNF         | ELIGIBLE     | ERROR         | EXPIRED       | NOT_ELIGIBLE  |
      #| RPFINM3HHAVisitingQA@yopmail.com   | RPFIN  | HHA         | ELIGIBLE     | ERROR         | EXPIRED       |               |
      | OPSFINM3SNFSaberHealth@yopmail.com | OPSFIN | SNF         | ELIGIBLE     | ERROR         | EXPIRED       | NOT_ELIGIBLE  |
      #| OPSFINM3HHAVisiting@yopmail.com    | OPSFIN | HHA         | ELIGIBLE     | ERROR         | EXPIRED       |               |
      #| RPFINM3HHASNFVisitQA@yopmail.com   | RPFIN  | SNF and HHA | ELIGIBLE     | ERROR         | EXPIRED       | NOT_ELIGIBLE  |
