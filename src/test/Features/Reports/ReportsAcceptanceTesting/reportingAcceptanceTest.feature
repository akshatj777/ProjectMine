Feature: Accepatance testing for reports

  Scenario Outline: User should be able to verify the business functionalities in  <Report> EC report and make sure there are NON-Null,Non-zero,Non-N/A in the report page
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "<Module>" under reports tile text
    When I click on the Reports Tile with text "<Module>"
    Then I click on "<Report>" report under <Module> in reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "<ReportToLoad>" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    And I wait until refresh button is disappeared
    Then I verify data is appearing after opening report
    #Participant
    And I verify there is no "Null" value appearing inside report in the column "Participant"
    And I verify there is no "0" value appearing inside report in the column "Participant"
    And I verify there is no "NA" value appearing inside report in the column "Participant"
    When I click to "Participant" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Participant" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Episode Initiator
    And I verify there is no "Null" value appearing inside report in the column "Episode Initiator"
    And I verify there is no "0" value appearing inside report in the column "Episode Initiator"
    And I verify there is no "NA" value appearing inside report in the column "Episode Initiator"
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Episode Initiator" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Anchor Facility
    When I click to "<anchor facility>" field filter under "<facility type>" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "<anchor facility>" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #CCN
    When I click to "CCN" field filter under "<ccn type>" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify there is no "Null" value appearing inside report in the column "CCN"
    And I verify there is no "0" value appearing inside report in the column "CCN"
    And I verify there is no "NA" value appearing inside report in the column "CCN"
    When I click to "CCN" field filter under "<ccn type>" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "<ccn field>" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #BPID
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify there is no "Null" value appearing inside report in the column "BPID"
    And I verify there is no "0" value appearing inside report in the column "BPID"
    And I verify there is no "NA" value appearing inside report in the column "BPID"
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "BPID" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Bundle Code
    When I click to "Bundle Code" field filter under "Bundle" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify there is no "Null" value appearing inside report in the column "BPID"
    And I verify there is no "0" value appearing inside report in the column "BPID"
    And I verify there is no "NA" value appearing inside report in the column "BPID"
    When I click on "Bundle Code" field which is listed under "Bundle" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Bundle Code" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Patient Risk
    When I click to "Patient Risk" field filter under "Patient" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify there is no "Null" value appearing inside report in the column "BPID"
    And I verify there is no "0" value appearing inside report in the column "BPID"
    And I verify there is no "NA" value appearing inside report in the column "BPID"
    When I click on "Patient Risk" field which is listed under "Patient" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Patient Risk" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Onboarding Status
    When I click to "Onboarding Status" field filter under "Onboarding Status" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify there is no "Null" value appearing inside report in the column "BPID"
    And I verify there is no "0" value appearing inside report in the column "BPID"
    And I verify there is no "NA" value appearing inside report in the column "BPID"
    When I click on "Onboarding Status" field which is listed under "Onboarding Status" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Onboarding Status" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Eligibility
    When I click to "Eligibility" field filter under "Eligibility" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify there is no "Null" value appearing inside report in the column "BPID"
    And I verify there is no "0" value appearing inside report in the column "BPID"
    And I verify there is no "NA" value appearing inside report in the column "BPID"
    When I click to "Eligibility" field filter under "Eligibility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Eligibility" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared

    Examples: 
      | email                         | Module            | Report                             | Type Of Report | ReportToLoad               | anchor facility          | facility type            | ccn type                    | ccn field              |
      | shutestaug231132a@yopmail.com | Next Site of Care | CARL                               | EC Model2      | CARL                       | Anchor Facility          | Anchor Facility          | Anchor Facility             | CCN                    |
      | shutestaug231132a@yopmail.com | Next Site of Care | Next Site of Care Summary          | EC Model2      | Next Site Of Care Summary  | Anchor Hospital Facility | Anchor Hospital Facility | Dashboard - Anchor Facility | Dashboard - Anchor CCN |
      | shutestaug231132a@yopmail.com | Patient ID        | Episode DRG Issues                 | EC Model2      | Episode DRG Issues         | Anchor Hospital Facility | Anchor Hospital Facility | Dashboard - Anchor Facility | Dashboard - Anchor CCN |
      | shutestaug231132a@yopmail.com | Patient ID        | InPatient Episode Clearing         | EC Model2      | InPatient Episode Clearing | Anchor Hospital Facility | Anchor Hospital Facility | Dashboard - Anchor Facility | Dashboard - Anchor CCN |
      | shutestaug231132a@yopmail.com | Post Acute Care   | Initial SNF Length of Stay Summary | EC Model2      | SNF LOS Summary            | Anchor Facility          | Anchor Facility          | Anchor Facility             | CCN                    |
      | shutestaug231132a@yopmail.com | Readmissions      | Readmissions                       | EC Model2      | Readmissions EC            | Anchor Hospital Facility | Anchor Hospital Facility | Dashboard - Anchor Facility | Dashboard - Anchor CCN |

  Scenario Outline: User should be able to verify anchor facility field and facility type in the standalone episode drg issues report to make sure there are NON-Null, Non-zero, Non-N/A in the report
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "<Module>" under reports tile text
    When I click on the Reports Tile with text "<Module>"
    Then I click on "<Report>" report under <Module> in reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "<ReportToLoad>" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    And I wait until refresh button is disappeared
    Then I verify data is appearing after opening report
    When I click to "<anchor facility>" field filter under "<facility type>" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    And I verify there is no "Null" value appearing inside report in the column "<anchor facility>"
    And I verify there is no "0" value appearing inside report in the column "<anchor facility>"
    And I verify there is no "NA" value appearing inside report in the column "<anchor facility>"

    Examples: 
      | email                         | Module     | Report             | Type Of Report | ReportToLoad       | anchor facility          | facility type            |
      | shutestaug231132a@yopmail.com | Patient ID | Episode DRG Issues | EC Model2      | Episode DRG Issues | Anchor Hospital Facility | Anchor Hospital Facility |

  Scenario Outline: User should be able to verify the business functionalities in  <Report> EC Model3 report and make sure there are NON-Null,Non-zero,Non-N/A in the report page
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "<Module>" under reports tile text
    When I click on the Reports Tile with text "<Module>"
    Then I click on "<Report>" report under <Module> in reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "<ReportToLoad>" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    And I wait until refresh button is disappeared
    Then I verify data is appearing after opening report
    #Participant
    When I click to "Participant" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Participant" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Episode Initiator
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Episode Initiator" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Anchor Post Acute Provider CCN
    When I click on "Anchor Post Acute Provider CCN" field which is listed under "Anchor Post Acute Provider" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Post Acute Provider CCN" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #BPID
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "BPID" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Bundle Code
    When I click on "Bundle Code" field which is listed under "Bundle" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Bundle Code" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Patient Risk
    When I click on "Patient Risk" field which is listed under "Patient" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Patient Risk" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Onboarding Status
    When I click on "Onboarding Status" field which is listed under "Onboarding Status" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Onboarding Status" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Eligibility
    When I click to "Eligibility" field filter under "Eligibility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Eligibility" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Anchor Post Acute Provider
    When I click on "Anchor Post Acute Provider" field which is listed under "Anchor Post Acute Provider" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Post Acute Provider" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared

    Examples: 
      | email                            | Module            | Report                               | Type Of Report | ReportToLoad                         |
      | RPFINM3HHASNFVisitQA@yopmail.com | Patient ID        | Episode DRG Issues [Model 3]         | EC Model3      | Episode DRG Issues [Model 3]         |
      | RPFINM3HHASNFVisitQA@yopmail.com | Patient ID        | InPatient Episode Clearing [Model 3] | EC Model3      | InPatient Episode Clearing [Model 3] |
      | RPFINM3HHASNFVisitQA@yopmail.com | Next Site of Care | Next Site of Care Summary [Model 3]  | EC Model3      | Next Site of Care Summary [Model 3]  |
      | RPFINM3HHASNFVisitQA@yopmail.com | Readmissions      | Readmissions [Model 3]               | EC Model3      | Readmissions EC [Model 3]            |

  Scenario Outline: User should be able to verify the business functionalities in <Report> Claims report and make sure there are NON-Null,Non-zero,Non-N/A in the report page
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "<Module>" under reports tile text
    When I click on the Reports Tile with text "<Module>"
    Then I click on "<Report>" report under <Module> in reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "<ReportToLoad>" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    And I wait until refresh button is disappeared
    Then I verify data is appearing after opening report
    #Participant
    When I click to "Participant" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Participant" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Episode Initiator
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Episode Initiator" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Anchor Facility
    When I click to "Anchor Facility" field filter under "Anchor Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Facility" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #CCN
    When I click to "CCN" field filter under "Anchor Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "CCN" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #BPID
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "BPID" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Bundle Risk
    When I click to "Bundle Risk" field filter under "Bundle Risk" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Bundle Risk" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Bundle Code
    When I click on "Bundle Code" field which is listed under "Bundle" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Bundle Code" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Attributed Physician
    When I click to "Attributed Physician" field filter under "Physician" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Attributed Physician" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #NPI
    When I click to "Attributed Physician NPI" field filter under "Physician" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Attributed Physician NPI" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #DRG Code
    When I click to "DRG Code" field filter under "DRG" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "DRG Code" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Post Acute facility
    When I click to "Post Acute Facility" field filter under "Post Acute Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Post Acute Facility" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Post Acute CCN
    When I click to "Post Acute CCN" field filter under "Post Acute Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Post Acute CCN" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared

    Examples: 
      | email                         | Module          | Report                         | Type Of Report | ReportToLoad          |
      | shutestaug231132a@yopmail.com | Overall Program | Performance (Claims)           | Claims         | Performance           |
      | shutestaug231132a@yopmail.com | Overall Program | Financial Performance (Claims) | Claims         | Financial Performance |
      | shutestaug231132a@yopmail.com | Physician       | Performance (Claims)           | Claims         | Physician Performance |
      | shutestaug231132a@yopmail.com | Physician       | Volume (Claims)                | Claims         | Physician Volume      |
      | shutestaug231132a@yopmail.com | Post Acute Care | SNF Performance (Claims)       | Claims         | SNF Performance       |
      | shutestaug231132a@yopmail.com | Post Acute Care | SNF Volume (Claims)            | Claims         | SNF Volume            |
      | shutestaug231132a@yopmail.com | Post Acute Care | Post Acute Care (Claims)       | Claims         | Post Acute Care       |
      | shutestaug231132a@yopmail.com | Readmissions    | Readmissions (Claims)          | Claims         | Readmissions Claims   |

  Scenario Outline: User should be able to verify the business functionalities in  Spending reports and make sure there are NON-Null,Non-zero,Non-N/A in the report page
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "<Module>" under reports tile text
    When I click on the Reports Tile with text "<Module>"
    Then I click on "<Report>" report under <Module> in reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "<ReportToLoad>" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    And I wait until refresh button is disappeared
    Then I verify data is appearing after opening report
    #Participant
    When I click to "Participant" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Participant" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Episode Initiator
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Episode Initiator" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Anchor Facility
    When I click to "Anchor Facility" field filter under "Anchor Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Facility" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #CCN
    When I click to "CCN" field filter under "Anchor Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "CCN" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #BPID
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "BPID" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Bundle Code
    When I click on "Bundle Code" field which is listed under "Bundle" filter from available fields
    And I choose "Filter" option from select options of filter field
    And I should see "Bundle Code" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Attributed Physician
    When I click to "Attributed Physician" field filter under "Physician" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Attributed Physician" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #NPI
    When I click to "Attributed Physician NPI" field filter under "Physician" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Attributed Physician NPI" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #DRG Code
    When I click to "DRG Code" field filter under "DRG" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "DRG Code" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Post Acute facility
    When I click to "Post Acute Facility" field filter under "Post Acute Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Post Acute Facility" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared
    #Post Acute CCN
    When I click to "Post Acute CCN" field filter under "Post Acute Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Post Acute CCN" in the header text of filter page
    And I should not see "Null" in the filter value list
    And I should not see "0" in the filter value list
    And I should not see "NA" in the filter value list
    And I click on cancel button from filter
    And I wait until refresh button is disappeared

    Examples: 
      | email                         | Module          | Report            | Type Of Report | ReportToLoad       |
      | shutestaug231132a@yopmail.com | Overall Program | Spending (Claims) | Claims         | Spending           |
      | shutestaug231132a@yopmail.com | Physician       | Spending (Claims) | Claims         | Physician Spending |

  Scenario: User should be able to validate the data is loading in program overview report
    Given I am on the login page
    When I enter email field shutestaug231132a@yopmail.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Dashboards" under reports tile text
    Then I verify current page "Reports" title
    Then I should see Reports Tile text as Dashboards
    When I click on the Reports Tile with text "Dashboards"
    When I click on "Program Overview" reports text for "Dashboards" report tile
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    Then I wait until loading icon disappears in program overview report
    And I will wait to see "Overall Program" under program overview report in iframe
    Then I should see "Overall Program" appearing under program overview reports
    And I should see "EPISODES" under overall program
    Then I verify episodes graph appearing under overall program report
    And I should see "NPRA" under overall program
    Then I verify npra graph appearing under overall program report
    Then I should see "Post Acute Utilization" under program overview reports
    And I should see "SKILLED NURSING" under overall program
    Then I verify skilled nursing graph appearing under overall program report
    And I should see "LONG TERM ACUTE CARE" under overall program
    Then I verify long term acute care graph appearing under overall program report
    And I should see "INPATIENT REHAB" under overall program
    Then I verify inpatient rehab graph appearing under overall program report
    And I should see "HOME HEALTH" under overall program
    Then I verify home health graph appearing under overall program report
    And I should see "HOME" under overall program
    Then I verify home graph appearing under overall program report
    And I should see "OTHER" under overall program
    Then I verify other graph appearing under overall program report
    Then I should see "SNF Length of Stay" under program overview reports
    And I should see "INITIAL SNF LENGTH OF STAY" under overall program
    Then I verify initial snf length of stay graph appearing under overall program report
    And I should see "SNF DAYS" under overall program
    Then I verify snf days graph appearing under overall program report
    Then I should see "Readmissions" under program overview reports
    And I should see "EPISODES w READMIT" under overall program
    Then I verify episodes w readmit graph appearing under overall program report
    And I should see "READMITS PER EPISODE" under overall program
    Then I verify readmits per episode graph appearing under overall program report

  Scenario: User should validate episodes count is matching on performance evaluation and performance score card pages are matching and verify LMJ Link in physician dashboard report
    Given I am on the login page
    When I enter email field shutestaug231132a@yopmail.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Dashboards" under reports tile text
    Then I verify current page "Reports" title
    When I click on the Reports Tile with text "Dashboards"
    When I click on "Physician" reports text for "Dashboards" report tile
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    Then I wait until loading icon disappears in physician dashboard report
    Then I should see "Performance Evaluation by Physician" appearing under physician dashboard reports
    And I fetch the value of episodes present beside first physician
    When I click the first name under attributed physican column
    And I switch to new window
    Then I wait until loading icon disappears in physician dashboard report
    Then I verify current page "Performance Scorecard Dashboard" title
    And I verify fetched episodes data is appearing inside the kpi box of episodes
    Then I verify same episodes data is appearing under overall performance column in quaterly performance table
    And I click on "LMJ Bundle Details" link on the performance scorecard page
    And I switch to new window
    Then I wait until loading icon disappears in physician dashboard report
    Then I verify current page "Performance Scorecard Dashboard" title
    And I verify "Performance Scorecard" is appearing on clicking on lmj link