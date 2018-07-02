@sanity
Feature: Readmissions readmisisons

  Scenario Outline: Verify that readmissions with readmissions report display data based on provisioning for Medicare payer users
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
    Then I should see Readmissions reports column Tile text as "Participant"
    Then I should see Readmissions reports column Tile text as "Episode Initiator"
    Then I should see Readmissions reports column Tile text as "Anchor Facility"
    When I click on field-panel-icon button
    When I click to "Participant" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Participant" in the header text of filter page
    And I should see "<participant>" in the filter value list
    And I click on "<participant>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<participant>" result in "Participant" field column for "Episode Initiator" filter field
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Episode Initiator" in the header text of filter page
    And I should see "<episodeInitiator1>" in the filter value list
    And I click on "<episodeInitiator1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<episodeInitiator1>" result in "Episode Initiator" field column for "Episode Initiator" filter field
    When I click to "Anchor Hospital Facility" field filter under "Anchor Hospital Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Hospital Facility" in the header text of filter page
    And I should see "<anchorFacility1>" in the filter value list
    And I click on "<anchorFacility1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<anchorFacility1>" result in "Anchor Hospital Facility" field column for "Anchor Hospital Facility" filter field
    When I click to "Anchor Hospital Facility CCN" field filter under "Anchor Hospital Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Hospital Facility CCN" in the header text of filter page
    And I should see "<ccn1>" in the filter value list
    And I click on "<ccn1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<ccn1>" result in "Anchor Hospital Facility CCN" field column for "Anchor Hospital Facility" filter field
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "BPID" in the header text of filter page
    And I should see "<BPID1>" in the filter value list
    And I click on "<BPID1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<BPID1>" result in "BPID" field column for "Episode Initiator" filter field
    When I click to "Anchor Hospital Admission Quarter" field filter under "Anchor Hospital Admit Date" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Hospital Admission Quarter" in the header text of filter page
    When I click on select from list option on the filter page
    And I should see "<anchor admission quarter1>" in the filter value list
    And I click on "<anchor admission quarter1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<anchor admission quarter1>" result in "Anchor Hospital Admission Quarter" field column for "Anchor Hospital Admit Date" filter field
    When I switch to default window from iframe
    When I click on reports tab appearing on reports page
    Then I verify current page "Reports" title

    Examples: 
      | email                              | participant | episodeInitiator1                | anchorFacility1                    | ccn1   | BPID1    | anchor admission quarter1 |
      | shutestaug231132a@yopmail.com      | Penn        | Penn Presbyterian Medical Center | Upenn - Penn Presbyterian Hospital | 390223 | 2070-021 | 2017Q2                    |
      #| shutestaug221130a@yopmail.com      | Penn        | Penn Presbyterian Medical Center | Upenn - Penn Presbyterian Hospital | 390223 | 2070-021 | 2017Q2                    |
      | reptestachmodel2opsfin@yopmail.com | Penn        | Penn Presbyterian Medical Center | Upenn - Penn Presbyterian Hospital | 390223 | 2070-021 | 2017Q2                    |
      #| shutestaug15240p@yopmail.com       | Penn        | Penn Presbyterian Medical Center | Upenn - Penn Presbyterian Hospital | 390223 | 2070-021 | 2017Q2                    |
      #| shutestaug221145a@yopmail.com      | Penn        | Penn Presbyterian Medical Center | Upenn - Penn Presbyterian Hospital | 390223 | 2070-021 | 2017Q2                    |
      #| repopsnofintest@yopmail.com        | Penn        | Penn Presbyterian Medical Center | Upenn - Penn Presbyterian Hospital | 390223 | 2070-021 | 2017Q2                    |
