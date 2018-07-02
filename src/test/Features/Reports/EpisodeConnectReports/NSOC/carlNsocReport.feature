@sanity
Feature: Next site of care Carl

  Scenario Outline: Verify that Next site of care report display data based on provisioning for Medicare payer users
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
    Then I should see Next site of care reports column Tile text as "Participant"
    Then I should see Next site of care reports column Tile text as "Episode Initiator"
    Then I should see Next site of care reports column Tile text as "Anchor Facility"
    Then I should see Next site of care reports column Tile text as "Anchor Admission Quarter"
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
    When I click to "Anchor Facility" field filter under "Anchor Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Facility" in the header text of filter page
    And I should see "<anchorFacility1>" in the filter value list
    And I should see "<anchorFacility2>" in the filter value list
    And I click on "<anchorFacility1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<anchorFacility1>" result in "Anchor Facility" field column for "Anchor Facility" filter field
    When I click to "CCN" field filter under "Anchor Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "CCN" in the header text of filter page
    And I should see "<ccn1>" in the filter value list
    And I click on "<ccn1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<ccn1>" result in "CCN" field column for "Anchor Facility" filter field
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "BPID" in the header text of filter page
    And I should see "<BPID1>" in the filter value list
    And I click on "<BPID1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<BPID1>" result in "BPID" field column for "Episode Initiator" filter field
    When I click to "Anchor Admission Quarter" field filter under "Anchor Begin Date" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Admission Quarter" in the header text of filter page
    When I click on select from list option on the filter page
    And I should see "<anchor admission quarter1>" in the filter value list
    And I click on "<anchor admission quarter1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<anchor admission quarter1>" result in "Anchor Admission Quarter" field column for "Anchor Begin Date" filter field
    When I switch to default window from iframe
    When I click on reports tab appearing on reports page
    Then I verify current page "Reports" title

    Examples: 
      | email                              | participant      | anchorFacility1                        | anchorFacility2               | episodeInitiator1                   | Time              | Range               | Month | ccn1   | BPID1    | anchor admission quarter1 |
      | shutestaug231132a@yopmail.com      | Penn             | Upenn - Penn Presbyterian Hospital     | Upenn - Pennsylvania Hospital | Penn Presbyterian Medical Center    | Anchor Begin Date | Between (and incl.) | Jan   | 390223 | 2070-021 | 2017Q2                    |
      #| shutestaug221130a@yopmail.com      | Penn             | Upenn - Penn Presbyterian Hospital     | Upenn - Pennsylvania Hospital | Penn Presbyterian Medical Center    | Anchor Begin Date | Between (and incl.) | Jan   | 390223 | 2070-021 | 2017Q2                    |
      #| shutestaug15252p@yopmail.com       | Sound Physicians | Hackensack University Medical Center   |                               | Cogent Healthcare Of New Jersey, Pc | Anchor Begin Date | Between (and incl.) | Jan   | 310001 | 6005-169 | 2017Q2                    |
      #| shutestaug15220p@yopmail.com       | Sound Physicians | Hackensack University Medical Center   |                               | Cogent Healthcare Of New Jersey, Pc | Anchor Begin Date | Between (and incl.) | Jan   | 310001 | 6005-169 | 2017Q2                    |
      | reptestachmodel2opsfin@yopmail.com | Penn             | Upenn - Penn Presbyterian Hospital     | Upenn - Pennsylvania Hospital | Penn Presbyterian Medical Center    | Anchor Begin Date | Between (and incl.) | Jan   | 390223 | 2070-021 | 2017Q2                    |
      #| shutestaug26212p@yopmail.com       | Sound Physicians | Saint Alphonsus Medical Center - Nampa |                               | Sound Physicians Of Idaho, Pllc     | Anchor Begin Date | Between (and incl.) | Jan   | 130013 | 6005-063 | 2017Q2                    |
      #| shutestaug15240p@yopmail.com       | Penn             | Upenn - Penn Presbyterian Hospital     | Upenn - Pennsylvania Hospital | Penn Presbyterian Medical Center    | Anchor Begin Date | Between (and incl.) | Jan   | 390223 | 2070-021 | 2017Q2                    |
      #| shutestjul26420p@yopmail.com       | Sound Physicians | Hackensack University Medical Center   |                               | Cogent Healthcare Of New Jersey, Pc | Anchor Begin Date | Between (and incl.) | Jan   | 310001 | 6005-169 | 2017Q2                    |
      #| shutestjul26415@yopmail.com        | Sound Physicians | Hackensack University Medical Center   |                               | Cogent Healthcare Of New Jersey, Pc | Anchor Begin Date | Between (and incl.) | Jan   | 310001 | 6005-169 | 2017Q2                    |
      #| repopsnofintest@yopmail.com        | Penn             | Upenn - Penn Presbyterian Hospital     | Upenn - Pennsylvania Hospital | Penn Presbyterian Medical Center    | Anchor Begin Date | Between (and incl.) | Jan   | 390223 | 2070-021 | 2017Q2                    |
      #| shutestaug221150a@yopmail.com      | Sound Physicians | Wyoming Medical Center                 |                               | Sound Physicians Of Wyoming, Llc    | Anchor Begin Date | Between (and incl.) | Jan   | 530012 | 6005-062 | 2017Q2                    |

  Scenario Outline: Verify CARL report is appearing for the users with Acitve M2 for both ACH and PGP Facility Users
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
    Then I should see "CARL" in the CARL NSOC report page header

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | shutestaug15252p@yopmail.com       |
      | shutestaug221130a@yopmail.com      |
      | shutestaug15220p@yopmail.com       |
      | reptestachmodel2opsfin@yopmail.com |
      | shutestaug26212p@yopmail.com       |
      | shutestaug15240p@yopmail.com       |
      | shutestjul26420p@yopmail.com       |
      | shutestjul26415@yopmail.com        |
      | repopsnofintest@yopmail.com        |
      | shutestaug221150a@yopmail.com      |

  Scenario Outline: Verify CARL report is not appearing for the users with M3 episodes for both ACH and PGP Facility Users
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Next Site of Care" under reports tile text
    When I click on the Reports Tile with text "Next Site of Care"
    Then I should not see "CARL" report after clicking on next site of care

    Examples: 
      | email                         |
      | shutestauf171115a@yopmail.com |
      | shutestjul24430@yopmail.com   |
      | shutestagu22945am@yopmail.com |
      | shutestjul24340p@yopmail.com  |
