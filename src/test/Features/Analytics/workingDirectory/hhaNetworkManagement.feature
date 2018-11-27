Feature: HHA Network Management Dashboard

  @RowLevelSecurity12 @HHA
  Scenario Outline: Front end Data Filter Validation for Claims
    When I open file "\\src\\test\\Jmeter\\HHANetworkManagement\\ClaimsRowFilterInput.csv" for writing data at "<Row>" to input file
    When I open file "\\src\\test\\Jmeter\\HHANetworkManagement\\logs\\ClaimsRowFilterInput.csv" for writing data at "<Row>" to log file
    Given I am on the login page
    When I enter email field <User> for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "HHA Network Management" dashboard
    And I switch to analytics iframe
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    And I perform test with "<User>" user in Analytics
    ##Time
    Then I set "Start Date" as "ClaimsStartDate" in Date field on dashboard
    Then I set "End Date" as "ClaimsCubeDate" in Date field on dashboard
    ##BPID
    And I click "Episode Initiator - BPID" Filter on the "HHA Network Management - <BPID>" dashboard
    And I select "<BPID>" checkbox in "BPID" filter on "HHA Network Management" dashboard
    And I click "Episode Initiator - BPID" Filter on the "HHA Network Management - <BPID>" dashboard
    ##CCN
    And I click "Anchor Facility - CCN" Filter on the "HHA Network Management - <CCN>" dashboard
    And I select "<CCN>" checkbox in "CCN" filter on "HHA Network Management" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHA Network Management - <CCN>" dashboard
    ##Bundle
    And I click "Bundle" Filter on the "HHA Network Management - <Bundle>" dashboard
    And I select "<Bundle>" checkbox in "Bundle" filter on "HHA Network Management" dashboard
    And I click "Bundle" Filter on the "HHA Network Management - <Bundle>" dashboard
    ##Region-Market
    And I click "Region - Market" Filter on the "HHA Network Management - <Region - Market>" dashboard
    And I select "<Region - Market>" checkbox in "Region - Market" filter on "HHA Network Management" dashboard
    And I click "Region - Market" Filter on the "HHA Network Management - <Region - Market>" dashboard
    ##Remedy Region - Market
    And I click "Remedy Region - Market" Filter on the "HHA Network Management - <Remedy Region - Market>" dashboard
    And I select "<Remedy Region - Market>" checkbox in "Remedy Region - Market" filter on "Program overview" dashboard
    And I click "Remedy Region - Market" Filter on the "HHA Network Management - <Remedy Region - Market>" dashboard
    ##ParticipantName
    And I click "Participant" Filter on the "HHA Network Management - <Participant>" dashboard
    And I select "<Participant>" checkbox in "Participant" filter on "HHA Network Management" dashboard
    And I click "Participant" Filter on the "HHA Network Management - <Participant>" dashboard
    ##Anchor Facility
    And I click "Post Acute Facility" Filter on the "HHA Network Management - <Post Acute Facility>" dashboard
    And I select "<Post Acute Facility>" checkbox in "Anchor Facility Detail" filter on "HHA Network Management" dashboard
    And I click "Post Acute Facility" Filter on the "HHA Network Management - <Post Acute Facility>" dashboard
    ##Extract Region Market
    And I get Region and Market to input file without Participant form Region-Market dropdown
    And I click "Episode Initiator - BPID" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Episode Initiator - BPID" filter values on "HHA Network Management" dashboard
    And I click "Episode Initiator - BPID" Filter on the "HHA Network Management" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Anchor Facility - CCN" filter values on "HHA Network Management" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHA Network Management" dashboard
    And I click "Bundle" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Bundle" filter values on "HHA Network Management" dashboard
    And I click "Bundle" Filter on the "HHA Network Management" dashboard
    And I click "Region - Market" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Region - Market" filter values on "HHA Network Management" dashboard
    And I click "Region - Market" Filter on the "HHA Network Management" dashboard
    And I click "Remedy Region - Market" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Remedy Region - Market" filter values on "HHA Network Management" dashboard
    And I click "Remedy Region - Market" Filter on the "HHA Network Management" dashboard
    And I click "Participant" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Participant" filter values on "HHA Network Management" dashboard
    And I click "Participant" Filter on the "HHA Network Management" dashboard
    And I click "Post Acute Facility" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Post Acute Facility" filter values on "HHA Network Management" dashboard
    And I click "Post Acute Facility" Filter on the "HHA Network Management" dashboard
    And I save the values of row filters in "<Row>" index in storage HashMap

    Examples: 
      | User                        | Row | BPID        | CCN         | Bundle      | Remedy Region - Market | Region - Market | Participant | Post Acute Facility |
      | Qafivedashtest@yopmail.com  |   1 | Skip        | Skip        | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | Qatwodashtest@yopmail.com   |   2 | Skip        | Skip        | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | Qadashboardtest@yopmail.com |   3 | Skip        | Skip        | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | allmodel123@yopmail.com     |   4 | Skip        | Skip        | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | allmodel123@yopmail.com     |   5 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | True All            |
      | Qatwodashtest@yopmail.com   |   6 | True Random | True Random | True Random | Skip                   | Skip            | Skip        | Skip                |
      | Qadashboardtest@yopmail.com |   7 | True Random | True Random | Skip        | True Random            | Skip            | Skip        | Skip                |
      | allmodel123@yopmail.com     |   8 | True Random | True Random | Skip        | Skip                   | True Random     | Skip        | Skip                |
      | Qatwodashtest@yopmail.com   |   9 | True Random | True Random | Skip        | Skip                   | Skip            | True Random | Skip                |
      | Qadashboardtest@yopmail.com |  10 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | Qafivedashtest@yopmail.com  |  11 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | True All            |
      | allmodel123@yopmail.com     |  12 | True All    | True All    | Skip        | Skip                   | Skip            | True Random | True All            |
      | allmodel123@yopmail.com     |  13 | True Random | True Random | True Random | True Random            | True Random     | True Random | True Random         |
      | allmodel123@yopmail.com     |  14 | True All    | True All    | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | Qatwodashtest@yopmail.com   |  15 | True Random | True Random | True Random | True Random            | True Random     | True Random | True Random         |

  @RowLevelSecurity @HHA
  Scenario: Execute JMX file and read Output data for Data Filter Validations for Claims
    When I close the file for after writing data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\HHANetworkManagement\\ClaimsRowFilterOutput.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\HHANetworkManagement\\ClaimsRowFilter.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\HHANetworkManagement\\ClaimsRowFilterOutput.txt"

  @RowLevelSecurity @HHA
  Scenario Outline: Verify DB and FE values fetched from Claims Scenarios
    And I get the value "<Index>" from Output file of data filter validation
    Then I verify "Episode Initiator - BPID" for DB and FE filter values at "<Row>" for "Claims"
    Then I verify "Anchor Facility - CCN" for DB and FE filter values at "<Row>" for "Claims"
    Then I verify "Bundle" for DB and FE filter values at "<Row>" for "Claims"
    Then I verify "Region - Market" for DB and FE filter values at "<Row>" for "Claims"
    Then I verify "Remedy Region - Market" for DB and FE filter values at "<Row>" for "Claims"
    Then I verify "Post Acute Facility" for DB and FE filter values at "<Row>" for "Claims"

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

  @RowLevelSecurity @HHA
  Scenario Outline: Front end Data Filter Validation for EC
    When I open file "\\src\\test\\Jmeter\\HHANetworkManagement\\ECRowFilterInput.csv" for writing data at "<Row>" to input file
    When I open file "\\src\\test\\Jmeter\\HHANetworkManagement\\logs\\ECRowFilterInput.csv" for writing data at "<Row>" to log file
    Given I am on the login page
    When I enter email field <User> for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "HHA Network Management" dashboard
    And I switch to analytics iframe
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    And I perform test with "<User>" user in Analytics
    ##Time
    Then I set "Start Date" as "ECStartDate" in Date field on dashboard
    Then I set "End Date" as "Today" in Date field on dashboard
    ##BPID
    And I click "Episode Initiator - BPID" Filter on the "HHA Network Management - <BPID>" dashboard
    And I select "<BPID>" checkbox in "BPID" filter on "HHA Network Management" dashboard
    And I click "Episode Initiator - BPID" Filter on the "HHA Network Management - <BPID>" dashboard
    ##CCN
    And I click "Anchor Facility - CCN" Filter on the "HHA Network Management - <CCN>" dashboard
    And I select "<CCN>" checkbox in "CCN" filter on "HHA Network Management" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHA Network Management - <CCN>" dashboard
    ##Bundle
    And I click "Bundle" Filter on the "HHA Network Management - <Bundle>" dashboard
    And I select "<Bundle>" checkbox in "Bundle" filter on "HHA Network Management" dashboard
    And I click "Bundle" Filter on the "HHA Network Management - <Bundle>" dashboard
    ##Region-Market
    And I click "Region - Market" Filter on the "HHA Network Management - <Region - Market>" dashboard
    And I select "<Region - Market>" checkbox in "Region - Market" filter on "HHA Network Management" dashboard
    And I click "Region - Market" Filter on the "HHA Network Management - <Region - Market>" dashboard
    ##Remedy Region - Market
    And I click "Remedy Region - Market" Filter on the "HHA Network Management - <Remedy Region - Market>" dashboard
    And I select "<Remedy Region - Market>" checkbox in "Remedy Region - Market" filter on "Program overview" dashboard
    And I click "Remedy Region - Market" Filter on the "HHA Network Management - <Remedy Region - Market>" dashboard
    ##ParticipantName
    And I click "Participant" Filter on the "HHA Network Management - <Participant>" dashboard
    And I select "<Participant>" checkbox in "Participant" filter on "HHA Network Management" dashboard
    And I click "Participant" Filter on the "HHA Network Management - <Participant>" dashboard
    ##Anchor FAcility
    And I click "Post Acute Facility" Filter on the "HHA Network Management - <Post Acute Facility>" dashboard
    And I select "<Post Acute Facility>" checkbox in "Anchor Facility Detail" filter on "HHA Network Management" dashboard
    And I click "Post Acute Facility" Filter on the "HHA Network Management - <Post Acute Facility>" dashboard
    ##Extract Region Market
    And I get Region and Market to input file without Participant form Region-Market dropdown
    And I click "Episode Initiator - BPID" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Episode Initiator - BPID" filter values on "HHA Network Management" dashboard
    And I click "Episode Initiator - BPID" Filter on the "HHA Network Management" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Anchor Facility - CCN" filter values on "HHA Network Management" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHA Network Management" dashboard
    And I click "Bundle" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Bundle" filter values on "HHA Network Management" dashboard
    And I click "Bundle" Filter on the "HHA Network Management" dashboard
    And I click "Region - Market" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Region - Market" filter values on "HHA Network Management" dashboard
    And I click "Region - Market" Filter on the "HHA Network Management" dashboard
    And I click "Remedy Region - Market" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Remedy Region - Market" filter values on "HHA Network Management" dashboard
    And I click "Remedy Region - Market" Filter on the "HHA Network Management" dashboard
    And I click "Participant" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Participant" filter values on "HHA Network Management" dashboard
    And I click "Participant" Filter on the "HHA Network Management" dashboard
    And I click "Post Acute Facility" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Post Acute Facility" filter values on "HHA Network Management" dashboard
    And I click "Post Acute Facility" Filter on the "HHA Network Management" dashboard
    And I save the values of row filters in "<Row>" index in storage HashMap

    Examples: 
      | User                        | Row | BPID        | CCN         | Bundle      | Remedy Region - Market | Region - Market | Participant | Post Acute Facility |
      | Qafivedashtest@yopmail.com  |   1 | Skip        | Skip        | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | Qatwodashtest@yopmail.com   |   2 | Skip        | Skip        | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | Qadashboardtest@yopmail.com |   3 | Skip        | Skip        | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | allmodel123@yopmail.com     |   4 | Skip        | Skip        | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | allmodel123@yopmail.com     |   5 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | True All            |
      | Qatwodashtest@yopmail.com   |   6 | True Random | True Random | True Random | Skip                   | Skip            | Skip        | Skip                |
      | Qadashboardtest@yopmail.com |   7 | True Random | True Random | Skip        | True Random            | Skip            | Skip        | Skip                |
      | allmodel123@yopmail.com     |   8 | True Random | True Random | Skip        | Skip                   | True Random     | Skip        | Skip                |
      | Qatwodashtest@yopmail.com   |   9 | True Random | True Random | Skip        | Skip                   | Skip            | True Random | Skip                |
      | Qadashboardtest@yopmail.com |  10 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | Qafivedashtest@yopmail.com  |  11 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | True All            |
      | allmodel123@yopmail.com     |  12 | True All    | True All    | Skip        | Skip                   | Skip            | True Random | True All            |
      | allmodel123@yopmail.com     |  13 | True Random | True Random | True Random | True Random            | True Random     | True Random | True Random         |
      | allmodel123@yopmail.com     |  14 | True All    | True All    | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | Qatwodashtest@yopmail.com   |  15 | True Random | True Random | True Random | True Random            | True Random     | True Random | True Random         |

  @RowLevelSecurity @HHA
  Scenario: Execute JMX file and read Output data for Data Filter Validations for EC
    When I close the file for after writing data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\HHANetworkManagement\\ECRowFilterOutput.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\HHANetworkManagement\\ECRowFilter.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\HHANetworkManagement\\ECRowFilterOutput.txt"

  @RowLevelSecurity @HHA
  Scenario Outline: Verify DB and FE values fetched from Claims&EC Scenarios
    And I get the value "<Index>" from Output file of data filter validation
    Then I verify "Episode Initiator - BPID" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Anchor Facility - CCN" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Bundle" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Region - Market" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Remedy Region - Market" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Participant" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "DRG" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Physician - NPI" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Model" for DB and FE filter values at "<Row>" for "EC"

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

  @RowLevelSecurity @HHA
  Scenario Outline: Front end Data Filter Validation for Claims&EC
    When I open file "\\src\\test\\Jmeter\\HHANetworkManagement\\RowFilterInput.csv" for writing data at "<Row>" to input file
    When I open file "\\src\\test\\Jmeter\\HHANetworkManagement\\logs\\RowFilterInput.csv" for writing data at "<Row>" to log file
    Given I am on the login page
    When I enter email field <User> for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "HHA Network Management" dashboard
    And I switch to analytics iframe
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    And I perform test with "<User>" user in Analytics
    ##Time
    Then I set "Start Date" as "ClaimsStartDate" in Date field on dashboard
    Then I set "End Date" as "Today" in Date field on dashboard
    ##BPID
    And I click "Episode Initiator - BPID" Filter on the "HHA Network Management - <BPID>" dashboard
    And I select "<BPID>" checkbox in "BPID" filter on "HHA Network Management" dashboard
    And I click "Episode Initiator - BPID" Filter on the "HHA Network Management - <BPID>" dashboard
    ##CCN
    And I click "Anchor Facility - CCN" Filter on the "HHA Network Management - <CCN>" dashboard
    And I select "<CCN>" checkbox in "CCN" filter on "HHA Network Management" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHA Network Management - <CCN>" dashboard
    ##Bundle
    And I click "Bundle" Filter on the "HHA Network Management - <Bundle>" dashboard
    And I select "<Bundle>" checkbox in "Bundle" filter on "HHA Network Management" dashboard
    And I click "Bundle" Filter on the "HHA Network Management - <Bundle>" dashboard
    ##Region-Market
    And I click "Region - Market" Filter on the "HHA Network Management - <Region - Market>" dashboard
    And I select "<Region - Market>" checkbox in "Region - Market" filter on "HHA Network Management" dashboard
    And I click "Region - Market" Filter on the "HHA Network Management - <Region - Market>" dashboard
    ##Remedy Region - Market
    And I click "Remedy Region - Market" Filter on the "HHA Network Management - <Remedy Region - Market>" dashboard
    And I select "<Remedy Region - Market>" checkbox in "Remedy Region - Market" filter on "Program overview" dashboard
    And I click "Remedy Region - Market" Filter on the "HHA Network Management - <Remedy Region - Market>" dashboard
    ##ParticipantName
    And I click "Participant" Filter on the "HHA Network Management - <Participant>" dashboard
    And I select "<Participant>" checkbox in "Participant" filter on "HHA Network Management" dashboard
    And I click "Participant" Filter on the "HHA Network Management - <Participant>" dashboard
    ##Anchor FAcility
    And I click "Post Acute Facility" Filter on the "HHA Network Management - <Post Acute Facility>" dashboard
    And I select "<Post Acute Facility>" checkbox in "Anchor Facility Detail" filter on "HHA Network Management" dashboard
    And I click "Post Acute Facility" Filter on the "HHA Network Management - <Post Acute Facility>" dashboard
    ##Extract Region Market
    And I get Region and Market to input file without Participant form Region-Market dropdown
    And I click "Episode Initiator - BPID" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Episode Initiator - BPID" filter values on "HHA Network Management" dashboard
    And I click "Episode Initiator - BPID" Filter on the "HHA Network Management" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Anchor Facility - CCN" filter values on "HHA Network Management" dashboard
    And I click "Anchor Facility - CCN" Filter on the "HHA Network Management" dashboard
    And I click "Bundle" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Bundle" filter values on "HHA Network Management" dashboard
    And I click "Bundle" Filter on the "HHA Network Management" dashboard
    And I click "Region - Market" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Region - Market" filter values on "HHA Network Management" dashboard
    And I click "Region - Market" Filter on the "HHA Network Management" dashboard
    And I click "Remedy Region - Market" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Remedy Region - Market" filter values on "HHA Network Management" dashboard
    And I click "Remedy Region - Market" Filter on the "HHA Network Management" dashboard
    And I click "Participant" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Participant" filter values on "HHA Network Management" dashboard
    And I click "Participant" Filter on the "HHA Network Management" dashboard
    And I click "Post Acute Facility" Filter on the "HHA Network Management" dashboard
    And I fetch and store "Post Acute Facility" filter values on "HHA Network Management" dashboard
    And I click "Post Acute Facility" Filter on the "HHA Network Management" dashboard
    And I save the values of row filters in "<Row>" index in storage HashMap

    Examples: 
      | User                        | Row | BPID        | CCN         | Bundle      | Remedy Region - Market | Region - Market | Participant | Post Acute Facility |
      | Qafivedashtest@yopmail.com  |   1 | Skip        | Skip        | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | Qatwodashtest@yopmail.com   |   2 | Skip        | Skip        | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | Qadashboardtest@yopmail.com |   3 | Skip        | Skip        | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | allmodel123@yopmail.com     |   4 | Skip        | Skip        | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | allmodel123@yopmail.com     |   5 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | True All            |
      | Qatwodashtest@yopmail.com   |   6 | True Random | True Random | True Random | Skip                   | Skip            | Skip        | Skip                |
      | Qadashboardtest@yopmail.com |   7 | True Random | True Random | Skip        | True Random            | Skip            | Skip        | Skip                |
      | allmodel123@yopmail.com     |   8 | True Random | True Random | Skip        | Skip                   | True Random     | Skip        | Skip                |
      | Qatwodashtest@yopmail.com   |   9 | True Random | True Random | Skip        | Skip                   | Skip            | True Random | Skip                |
      | Qadashboardtest@yopmail.com |  10 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | Qafivedashtest@yopmail.com  |  11 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | True All            |
      | allmodel123@yopmail.com     |  12 | True All    | True All    | Skip        | Skip                   | Skip            | True Random | True All            |
      | allmodel123@yopmail.com     |  13 | True Random | True Random | True Random | True Random            | True Random     | True Random | True Random         |
      | allmodel123@yopmail.com     |  14 | True All    | True All    | Skip        | Skip                   | Skip            | Skip        | Skip                |
      | Qatwodashtest@yopmail.com   |  15 | True Random | True Random | True Random | True Random            | True Random     | True Random | True Random         |

  @RowLevelSecurity @HHA
  Scenario: Execute JMX file and read Output data for Data Filter Validations for Claims&EC
    When I close the file for after writing data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\HHANetworkManagement\\RowFilterOutput.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\HHANetworkManagement\\TableauRowFilter.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\HHANetworkManagement\\RowFilterOutput.txt"

  @RowLevelSecurity @HHA
  Scenario Outline: Verify DB and FE values fetched from Claims&EC Scenarios
    And I get the value "<Index>" from Output file of data filter validation
    Then I verify "Episode Initiator - BPID" for DB and FE filter values at "<Row>" for "Claims&EC"
    Then I verify "Anchor Facility - CCN" for DB and FE filter values at "<Row>" for "Claims&EC"
    Then I verify "Bundle" for DB and FE filter values at "<Row>" for "Claims&EC"
    Then I verify "Region - Market" for DB and FE filter values at "<Row>" for "Claims&EC"
    Then I verify "Remedy Region - Market" for DB and FE filter values at "<Row>" for "Claims&EC"
    Then I verify "Participant" for DB and FE filter values at "<Row>" for "Claims&EC"
    Then I verify "DRG" for DB and FE filter values at "<Row>" for "Claims&EC"
    Then I verify "Physician - NPI" for DB and FE filter values at "<Row>" for "Claims&EC"
    Then I verify "Model" for DB and FE filter values at "<Row>" for "Claims&EC"

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
