Feature: HHA Scorecard Dashboard

  @HHAScorecardRLS @HHA
  Scenario Outline: Front end Data Filter Validation for Claims data for HHAScoreCard
    When I open file "\\src\\test\\Jmeter\\HHAScoreCard\\ClaimsRowFilterInput.csv" for writing data at "<Row>" to input file
    When I open file "\\src\\test\\Jmeter\\HHAScoreCard\\logs\\ClaimsRowFilterInput.csv" for writing data at "<Row>" to log file
    Given I am on the login page
    When I enter email field <User> for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "HHA Scorecard" dashboard
    And I switch to analytics iframe
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    And I perform test with "<User>" user in Analytics
    ##Time
    Then I set "Start Date" as "ClaimsStartDate" in Date field on dashboard
    Then I set "End Date" as "ClaimsCubeDate" in Date field on dashboard
    ##POST BPID
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard - <POSTCCN>" dashboard
    And I select "<POSTCCN>" checkbox in "CCN" filter on "HHAScoreCard" dashboard
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard - <POSTCCN>" dashboard
    ##Bundle
    And I click "Bundle" Filter on the "HHAScoreCard - <Bundle>" dashboard
    And I select "<Bundle>" checkbox in "Bundle" filter on "HHAScoreCard" dashboard
    And I click "Bundle" Filter on the "HHAScoreCard - <Bundle>" dashboard
    ##Region - Market
    And I click "Region - Market" Filter on the "HHAScoreCard - <Region - Market>" dashboard
    And I select "<Region - Market>" checkbox in "Region - Market" filter on "HHAScoreCard" dashboard
    And I click "Region - Market" Filter on the "HHAScoreCard - <Region - Market>" dashboard
    ##Remedy Region - Market
    And I click "Remedy Region - Market" Filter on the "HHAScoreCard - <Remedy Region - Market>" dashboard
    And I select "<Remedy Region - Market>" checkbox in "Remedy Region - Market" filter on "HHAScoreCard" dashboard
    And I click "Remedy Region - Market" Filter on the "HHAScoreCard - <Remedy Region - Market>" dashboard
    ##ParticipantName
    And I click "Participant" Filter on the "HHAScoreCard - <Participant>" dashboard
    And I select "<Participant>" checkbox in "Participant" filter on "HHAScoreCard" dashboard
    And I click "Participant" Filter on the "HHAScoreCard - <Participant>" dashboard
    #BPID
    And I click "Episode Initiator - BPID" Filter on the "HHAScoreCard - <BPID>" dashboard
    And I select "<BPID>" checkbox in "BPID" filter on "HHAScoreCard" dashboard
    And I click "Episode Initiator - BPID" Filter on the "HHAScoreCard - <BPID>" dashboard
    ##CCN
    And I click "Anchor Facility - CCN" Filter on the "HHAScoreCard - <CCN>" dashboard
    And I select "<CCN>" checkbox in "CCN" filter on "HHAScoreCard" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHAScoreCard - <CCN>" dashboard
    ##Extract Region Market
    And I get Region and Market to input file without Participant form Region-Market dropdown
    ##Store Values in Filter
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Post Acute Facility - CCN" filter values on "HHAScoreCard" dashboard
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard" dashboard
    And I click "Bundle" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Bundle" filter values on "HHAScoreCard" dashboard
    And I click "Bundle" Filter on the "HHAScoreCard" dashboard
    And I click "Region - Market" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Region - Market" filter values on "HHAScoreCard" dashboard
    And I click "Region - Market" Filter on the "HHAScoreCard" dashboard
    And I click "Remedy Region - Market" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Remedy Region - Market" filter values on "HHAScoreCard" dashboard
    And I click "Remedy Region - Market" Filter on the "HHAScoreCard" dashboard
    And I click "Participant" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Participant" filter values on "HHAScoreCard" dashboard
    And I click "Participant" Filter on the "HHAScoreCard" dashboard
    And I save the values of row filters in "<Row>" index in storage HashMap
    And I click "Episode Initiator - BPID" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Episode Initiator - BPID" filter values on "HHAScoreCard" dashboard
    And I click "Episode Initiator - BPID" Filter on the "HHAScoreCard" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Anchor Facility - CCN" filter values on "HHAScoreCard" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHAScoreCard" dashboard

    Examples: 
      | User                        | Row | BPID        | CCN         | Bundle      | Region - Market | Remedy Region - Market | Participant | POSTCCN     |
      | Qafivedashtest@yopmail.com  |   1 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qatwodashtest@yopmail.com   |   2 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qadashboardtest@yopmail.com |   3 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | allmodel123@yopmail.com     |   4 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qafivedashtest@yopmail.com  |   5 | True All    | True All    | True All    | Skip            | Skip                   | True All    | True All    |
      | Qatwodashtest@yopmail.com   |   6 | True Random | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qadashboardtest@yopmail.com |   7 | Skip        | True Random | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qafivedashtest@yopmail.com  |   8 | Skip        | Skip        | True Random | Skip            | Skip                   | Skip        | Skip        |
      | Qatwodashtest@yopmail.com   |   9 | Skip        | Skip        | Skip        | True Random     | Skip                   | Skip        | Skip        |
      | Qadashboardtest@yopmail.com |  10 | Skip        | Skip        | Skip        | Skip            | True Random            | Skip        | Skip        |
      | Qafivedashtest@yopmail.com  |  11 | Skip        | Skip        | Skip        | Skip            | Skip                   | True Random | True Random |
      | allmodel123@yopmail.com     |  12 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | allmodel123@yopmail.com     |  13 | True Random | True Random | True Random | True Random     | True Random            | True Random | True Random |
      | Qafivedashtest@yopmail.com  |  14 | True Random | True Random | True Random | True Random     | True Random            | True Random | True Random |
      | Qatwodashtest@yopmail.com   |  15 | True Random | True All    | True Random | True All        | True Random            | True Random | True All    |

  @HHAScorecardRLS @HHA
  Scenario: Execute JMX file and read Output data for Data Filter Validations
    When I close the file for after writing data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\HHAScoreCard\\ClaimsRowFilterOutput.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\HHAScoreCard\\HHAClaimsRowFilter.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\HHAScoreCard\\ClaimsRowFilterOutput.txt"

  @HHAScorecardRLS @HHA
  Scenario Outline: Verify DB and FE values fetched from Scenarios
    And I get the value "<Index>" from Output file of data filter validation
    Then I verify "POST Acute Facility - CCN" for DB and FE filter values at "<Row>" for "Claims"
    Then I verify "Bundle" for DB and FE filter values at "<Row>" for "Claims"
    Then I verify "Region - Market" for DB and FE filter values at "<Row>" for "Claims"
    Then I verify "Remedy Region - Market" for DB and FE filter values at "<Row>" for "Claims"
    Then I verify "Participant" for DB and FE filter values at "<Row>" for "Claims"
    Then I verify "Episode Initiator - BPID" for DB and FE filter values at "<Row>" for "Claims"
    Then I verify "Anchor Facility - CCN" for DB and FE filter values at "<Row>" for "Claims"

    Examples: 
      | Index | Row |
      |     0 |   1 |
      |     1 |   2 |
      |     2 |   3 |
      |     3 |   4 |
      |     4 |   5 |
      |     5 |   6 |
      |     6 |   7 |
      |     7 |   8 |
      |     8 |   9 |
      |     9 |  10 |
      |    10 |  11 |
      |    11 |  12 |
      |    12 |  13 |
      |    13 |  14 |
      |    14 |  15 |

  @HHAScorecardRLS @HHA
  Scenario Outline: Front end Data Filter Validation for EC data for HHAScoreCard
    When I open file "\\src\\test\\Jmeter\\HHAScoreCard\\ECRowFilterInput.csv" for writing data at "<Row>" to input file
    When I open file "\\src\\test\\Jmeter\\HHAScoreCard\\logs\\ECRowFilterInput.csv" for writing data at "<Row>" to log file
    Given I am on the login page
    When I enter email field <User> for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "HHA Scorecard" dashboard
    And I switch to analytics iframe
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    And I perform test with "<User>" user in Analytics
    ##Time
    Then I set "Start Date" as "ECStartDate" in Date field on dashboard
    Then I set "End Date" as "Today" in Date field on dashboard
    ##POST BPID
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard - <POSTCCN>" dashboard
    And I select "<POSTCCN>" checkbox in "CCN" filter on "HHAScoreCard" dashboard
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard - <POSTCCN>" dashboard
    ##Bundle
    And I click "Bundle" Filter on the "HHAScoreCard - <Bundle>" dashboard
    And I select "<Bundle>" checkbox in "Bundle" filter on "HHAScoreCard" dashboard
    And I click "Bundle" Filter on the "HHAScoreCard - <Bundle>" dashboard
    ##Region - Market
    And I click "Region - Market" Filter on the "HHAScoreCard - <Region - Market>" dashboard
    And I select "<Region - Market>" checkbox in "Region - Market" filter on "HHAScoreCard" dashboard
    And I click "Region - Market" Filter on the "HHAScoreCard - <Region - Market>" dashboard
    ##Remedy Region - Market
    And I click "Remedy Region - Market" Filter on the "HHAScoreCard - <Remedy Region - Market>" dashboard
    And I select "<Remedy Region - Market>" checkbox in "Remedy Region - Market" filter on "HHAScoreCard" dashboard
    And I click "Remedy Region - Market" Filter on the "HHAScoreCard - <Remedy Region - Market>" dashboard
    ##ParticipantName
    And I click "Participant" Filter on the "HHAScoreCard - <Participant>" dashboard
    And I select "<Participant>" checkbox in "Participant" filter on "HHAScoreCard" dashboard
    And I click "Participant" Filter on the "HHAScoreCard - <Participant>" dashboard
    #BPID
    And I click "Episode Initiator - BPID" Filter on the "HHAScoreCard - <BPID>" dashboard
    And I select "<BPID>" checkbox in "BPID" filter on "HHAScoreCard" dashboard
    And I click "Episode Initiator - BPID" Filter on the "HHAScoreCard - <BPID>" dashboard
    ##CCN
    And I click "Anchor Facility - CCN" Filter on the "HHAScoreCard - <CCN>" dashboard
    And I select "<CCN>" checkbox in "CCN" filter on "HHAScoreCard" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHAScoreCard - <CCN>" dashboard
    ##Extract Region Market
    And I get Region and Market to input file without Participant form Region-Market dropdown
    ##Store Values in Filter
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Post Acute Facility - CCN" filter values on "HHAScoreCard" dashboard
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard" dashboard
    And I click "Bundle" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Bundle" filter values on "HHAScoreCard" dashboard
    And I click "Bundle" Filter on the "HHAScoreCard" dashboard
    And I click "Region - Market" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Region - Market" filter values on "HHAScoreCard" dashboard
    And I click "Region - Market" Filter on the "HHAScoreCard" dashboard
    And I click "Remedy Region - Market" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Remedy Region - Market" filter values on "HHAScoreCard" dashboard
    And I click "Remedy Region - Market" Filter on the "HHAScoreCard" dashboard
    And I click "Participant" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Participant" filter values on "HHAScoreCard" dashboard
    And I click "Participant" Filter on the "HHAScoreCard" dashboard
    And I save the values of row filters in "<Row>" index in storage HashMap
    And I click "Episode Initiator - BPID" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Episode Initiator - BPID" filter values on "HHAScoreCard" dashboard
    And I click "Episode Initiator - BPID" Filter on the "HHAScoreCard" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Anchor Facility - CCN" filter values on "HHAScoreCard" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHAScoreCard" dashboard

    Examples: 
      | User                        | Row | BPID        | CCN         | Bundle      | Region - Market | Remedy Region - Market | Participant | POSTCCN     |
      | Qafivedashtest@yopmail.com  |   1 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qatwodashtest@yopmail.com   |   2 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qadashboardtest@yopmail.com |   3 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | allmodel123@yopmail.com     |   4 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qafivedashtest@yopmail.com  |   5 | True All    | True All    | True All    | Skip            | Skip                   | True All    | True All    |
      | Qatwodashtest@yopmail.com   |   6 | True Random | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qadashboardtest@yopmail.com |   7 | Skip        | True Random | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qafivedashtest@yopmail.com  |   8 | Skip        | Skip        | True Random | Skip            | Skip                   | Skip        | Skip        |
      | Qatwodashtest@yopmail.com   |   9 | Skip        | Skip        | Skip        | True Random     | Skip                   | Skip        | Skip        |
      | Qadashboardtest@yopmail.com |  10 | Skip        | Skip        | Skip        | Skip            | True Random            | Skip        | Skip        |
      | Qafivedashtest@yopmail.com  |  11 | Skip        | Skip        | Skip        | Skip            | Skip                   | True Random | True Random |
      | allmodel123@yopmail.com     |  12 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | allmodel123@yopmail.com     |  13 | True Random | True Random | True Random | True Random     | True Random            | True Random | True Random |
      | Qafivedashtest@yopmail.com  |  14 | True Random | True Random | True Random | True Random     | True Random            | True Random | True Random |
      | Qatwodashtest@yopmail.com   |  15 | True Random | True All    | True Random | True All        | True Random            | True Random | True All    |

  @HHAScorecardRLS @HHA
  Scenario: Execute JMX file and read Output data for Data Filter Validations
    When I close the file for after writing data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\HHAScoreCard\\ECRowFilterOutput.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\HHAScoreCard\\HHAClaimsRowFilter.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\HHAScoreCard\\ECRowFilterOutput.txt"

  @HHAScorecardRLS @HHA
  Scenario Outline: Verify DB and FE values fetched from Scenarios
    And I get the value "<Index>" from Output file of data filter validation
    Then I verify "POST Acute Facility - CCN" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Bundle" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Region - Market" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Remedy Region - Market" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Participant" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Episode Initiator - BPID" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Anchor Facility - CCN" for DB and FE filter values at "<Row>" for "EC"

    Examples: 
      | Index | Row |
      |     0 |   1 |
      |     1 |   2 |
      |     2 |   3 |
      |     3 |   4 |
      |     4 |   5 |
      |     5 |   6 |
      |     6 |   7 |
      |     7 |   8 |
      |     8 |   9 |
      |     9 |  10 |
      |    10 |  11 |
      |    11 |  12 |
      |    12 |  13 |
      |    13 |  14 |
      |    14 |  15 |

  @HHAScorecardRLS @HHA
  Scenario Outline: Front end Data Filter Validation for EC & Claims data for HHAScoreCard
    When I open file "\\src\\test\\Jmeter\\HHAScoreCard\\RowFilterInput.csv" for writing data at "<Row>" to input file
    When I open file "\\src\\test\\Jmeter\\HHAScoreCard\\logs\\RowFilterInput.csv" for writing data at "<Row>" to log file
    Given I am on the login page
    When I enter email field <User> for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "HHA Scorecard" dashboard
    And I switch to analytics iframe
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    And I perform test with "<User>" user in Analytics
    ##Time
    Then I set "Start Date" as "ClaimsStartDate" in Date field on dashboard
    Then I set "End Date" as "Today" in Date field on dashboard
    ##POST BPID
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard - <POSTCCN>" dashboard
    And I select "<POSTCCN>" checkbox in "CCN" filter on "HHAScoreCard" dashboard
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard - <POSTCCN>" dashboard
    ##Bundle
    And I click "Bundle" Filter on the "HHAScoreCard - <Bundle>" dashboard
    And I select "<Bundle>" checkbox in "Bundle" filter on "HHAScoreCard" dashboard
    And I click "Bundle" Filter on the "HHAScoreCard - <Bundle>" dashboard
    ##Region - Market
    And I click "Region - Market" Filter on the "HHAScoreCard - <Region - Market>" dashboard
    And I select "<Region - Market>" checkbox in "Region - Market" filter on "HHAScoreCard" dashboard
    And I click "Region - Market" Filter on the "HHAScoreCard - <Region - Market>" dashboard
    ##Remedy Region - Market
    And I click "Remedy Region - Market" Filter on the "HHAScoreCard - <Remedy Region - Market>" dashboard
    And I select "<Remedy Region - Market>" checkbox in "Remedy Region - Market" filter on "HHAScoreCard" dashboard
    And I click "Remedy Region - Market" Filter on the "HHAScoreCard - <Remedy Region - Market>" dashboard
    ##ParticipantName
    And I click "Participant" Filter on the "HHAScoreCard - <Participant>" dashboard
    And I select "<Participant>" checkbox in "Participant" filter on "HHAScoreCard" dashboard
    And I click "Participant" Filter on the "HHAScoreCard - <Participant>" dashboard
    #BPID
    And I click "Episode Initiator - BPID" Filter on the "HHAScoreCard - <BPID>" dashboard
    And I select "<BPID>" checkbox in "BPID" filter on "HHAScoreCard" dashboard
    And I click "Episode Initiator - BPID" Filter on the "HHAScoreCard - <BPID>" dashboard
    ##CCN
    And I click "Anchor Facility - CCN" Filter on the "HHAScoreCard - <CCN>" dashboard
    And I select "<CCN>" checkbox in "CCN" filter on "HHAScoreCard" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHAScoreCard - <CCN>" dashboard
    ##Extract Region Market
    And I get Region and Market to input file without Participant form Region-Market dropdown
    ##Store Values in Filter
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Post Acute Facility - CCN" filter values on "HHAScoreCard" dashboard
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard" dashboard
    And I click "Bundle" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Bundle" filter values on "HHAScoreCard" dashboard
    And I click "Bundle" Filter on the "HHAScoreCard" dashboard
    And I click "Region - Market" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Region - Market" filter values on "HHAScoreCard" dashboard
    And I click "Region - Market" Filter on the "HHAScoreCard" dashboard
    And I click "Remedy Region - Market" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Remedy Region - Market" filter values on "HHAScoreCard" dashboard
    And I click "Remedy Region - Market" Filter on the "HHAScoreCard" dashboard
    And I click "Participant" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Participant" filter values on "HHAScoreCard" dashboard
    And I click "Participant" Filter on the "HHAScoreCard" dashboard
    And I save the values of row filters in "<Row>" index in storage HashMap
    And I click "Episode Initiator - BPID" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Episode Initiator - BPID" filter values on "HHAScoreCard" dashboard
    And I click "Episode Initiator - BPID" Filter on the "HHAScoreCard" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHAScoreCard" dashboard
    And I fetch and store "Anchor Facility - CCN" filter values on "HHAScoreCard" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHAScoreCard" dashboard
    And I save the values of row filters in "<Row>" index in storage HashMap

    Examples: 
      | User                        | Row | BPID        | CCN         | Bundle      | Region - Market | Remedy Region - Market | Participant | POSTCCN     |
      | Qafivedashtest@yopmail.com  |   1 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qatwodashtest@yopmail.com   |   2 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qadashboardtest@yopmail.com |   3 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | allmodel123@yopmail.com     |   4 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qafivedashtest@yopmail.com  |   5 | True All    | True All    | True All    | Skip            | Skip                   | True All    | True All    |
      | Qatwodashtest@yopmail.com   |   6 | True Random | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qadashboardtest@yopmail.com |   7 | Skip        | True Random | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | Qafivedashtest@yopmail.com  |   8 | Skip        | Skip        | True Random | Skip            | Skip                   | Skip        | Skip        |
      | Qatwodashtest@yopmail.com   |   9 | Skip        | Skip        | Skip        | True Random     | Skip                   | Skip        | Skip        |
      | Qadashboardtest@yopmail.com |  10 | Skip        | Skip        | Skip        | Skip            | True Random            | Skip        | Skip        |
      | Qafivedashtest@yopmail.com  |  11 | Skip        | Skip        | Skip        | Skip            | Skip                   | True Random | True Random |
      | allmodel123@yopmail.com     |  12 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | Skip        |
      | allmodel123@yopmail.com     |  13 | True Random | True Random | True Random | True Random     | True Random            | True Random | True Random |
      | Qafivedashtest@yopmail.com  |  14 | True Random | True Random | True Random | True Random     | True Random            | True Random | True Random |
      | Qatwodashtest@yopmail.com   |  15 | True Random | True All    | True Random | True All        | True Random            | True Random | True All    |

  @HHAScorecardRLS @HHA
  Scenario: Execute JMX file and read Output data for Data Filter Validations
    When I close the file for after writing data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\HHAScoreCard\\RowFilterOutput.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\HHAScoreCard\\HHAClaimsRowFilter.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\HHAScoreCard\\RowFilterOutput.txt"

  @HHAScorecardRLS @HHA
  Scenario Outline: Verify DB and FE values fetched from Scenarios
    And I get the value "<Index>" from Output file of data filter validation
    Then I verify "POST Acute Facility - CCN" for DB and FE filter values at "<Row>" for "EC & Claims"
    Then I verify "Bundle" for DB and FE filter values at "<Row>" for "EC & Claims"
    Then I verify "Region - Market" for DB and FE filter values at "<Row>" for "EC & Claims"
    Then I verify "Remedy Region - Market" for DB and FE filter values at "<Row>" for "EC & Claims"
    Then I verify "Participant" for DB and FE filter values at "<Row>" for "EC & Claims"
    Then I verify "Episode Initiator - BPID" for DB and FE filter values at "<Row>" for "EC & Claims"
    Then I verify "Anchor Facility - CCN" for DB and FE filter values at "<Row>" for "EC & Claims"

    Examples: 
      | Index | Row |
      |     0 |   1 |
      |     1 |   2 |
      |     2 |   3 |
      |     3 |   4 |
      |     4 |   5 |
      |     5 |   6 |
      |     6 |   7 |
      |     7 |   8 |
      |     8 |   9 |
      |     9 |  10 |
      |    10 |  11 |
      |    11 |  12 |
      |    12 |  13 |
      |    13 |  14 |
      |    14 |  15 |
