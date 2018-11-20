Feature: Inpatient Episode Clearing Dashboard

  @IPECRLS @RowLevelSecurity 
  Scenario Outline: Front end Data Filter Validation for EC data for IPEC
    When I open file "\\src\\test\\Jmeter\\IPECDashboard\\IPECRowFilterInput.csv" for writing data at "<Row>" to input file
    When I open file "\\src\\test\\Jmeter\\IPECDashboard\\logs\\IPECRowFilterInput.csv" for writing data at "<Row>" to log file
    Given I am on the login page
    When I enter email field <User> for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "Inpatient Episode Clearing" dashboard
    And I switch to analytics iframe
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    And I perform test with "<User>" user in Analytics
    ##Time
    And I click "Time" Filter on the "IPEC" dashboard
    ##And I get the date "" for Data fetched for dashboard
    And I get and fill days between "ClaimsStartDate" till "today" for Time Filter
    And I click "Time" Filter on the "IPEC" dashboard
    ##BPID
    And I click "Episode Initiator - BPID" Filter on the "IPEC - <BPID>" dashboard
    And I select "<BPID>" checkbox in "BPID" filter on "IPEC" dashboard
    And I click "Episode Initiator - BPID" Filter on the "IPEC - <BPID>" dashboard
    ##CCN
    And I click "Anchor Facility - CCN" Filter on the "IPEC - <CCN>" dashboard
    And I select "<CCN>" checkbox in "CCN" filter on "IPEC" dashboard
    And I click "Anchor Facility - CCN" Filter on the "IPEC - <CCN>" dashboard
    ##Bundle
    And I click "Bundle" Filter on the "IPEC - <Bundle>" dashboard
    And I select "<Bundle>" checkbox in "Bundle" filter on "IPEC" dashboard
    And I click "Bundle" Filter on the "IPEC - <Bundle>" dashboard
    ##Region - Market
    And I click "Region - Market" Filter on the "IPEC - <Region - Market>" dashboard
    And I select "<Region - Market>" checkbox in "Region - Market" filter on "IPEC" dashboard
    And I click "Region - Market" Filter on the "IPEC - <Region - Market>" dashboard
    ##Remedy Region - Market
    And I click "Remedy Region - Market" Filter on the "IPEC - <Remedy Region - Market>" dashboard
    And I select "<Remedy Region - Market>" checkbox in "Remedy Region - Market" filter on "IPEC" dashboard
    And I click "Remedy Region - Market" Filter on the "IPEC - <Remedy Region - Market>" dashboard
    ##ParticipantName
    And I click "Participant" Filter on the "IPEC - <Participant>" dashboard
    And I select "<Participant>" checkbox in "Participant" filter on "IPEC" dashboard
    And I click "Participant" Filter on the "IPEC - <Participant>" dashboard
    ##Extract Region Market
    And I get Region and Market to input file without Participant form Region-Market dropdown
    ##Store Values in Filter
    And I click "Episode Initiator - BPID" Filter on the "IPEC" dashboard
    And I fetch and store "Episode Initiator - BPID" filter values on "IPEC" dashboard
    And I click "Episode Initiator - BPID" Filter on the "IPEC" dashboard
    And I click "Anchor Facility - CCN" Filter on the "IPEC" dashboard
    And I fetch and store "Anchor Facility - CCN" filter values on "IPEC" dashboard
    And I click "Anchor Facility - CCN" Filter on the "IPEC" dashboard
    And I click "Bundle" Filter on the "IPEC" dashboard
    And I fetch and store "Bundle" filter values on "IPEC" dashboard
    And I click "Bundle" Filter on the "IPEC" dashboard
    And I click "Region - Market" Filter on the "IPEC" dashboard
    And I fetch and store "Region - Market" filter values on "IPEC" dashboard
    And I click "Region - Market" Filter on the "IPEC" dashboard
    And I click "Remedy Region - Market" Filter on the "IPEC" dashboard
    And I fetch and store "Remedy Region - Market" filter values on "IPEC" dashboard
    And I click "Remedy Region - Market" Filter on the "IPEC" dashboard
    And I click "Participant" Filter on the "IPEC" dashboard
    And I fetch and store "Participant" filter values on "IPEC" dashboard
    And I click "Participant" Filter on the "IPEC" dashboard
    And I save the values of row filters in "<Row>" index in storage HashMap

    Examples: 
      | User                        | Row | BPID        | CCN         | Bundle      | Region - Market | Remedy Region - Market | Participant |
      | Qafivedashtest@yopmail.com  |   1 | True All    | True All    | True All    | Skip            | Skip                   | True All    |
      | Qatwodashtest@yopmail.com   |   2 | True Random | Skip        | Skip        | Skip            | Skip                   | Skip        |
      | Qadashboardtest@yopmail.com |   3 | Skip        | True Random | Skip        | Skip            | Skip                   | Skip        |
      | Qafivedashtest@yopmail.com  |   4 | Skip        | Skip        | True Random | Skip            | Skip                   | Skip        |
      | Qatwodashtest@yopmail.com   |   5 | Skip        | Skip        | Skip        | True Random     | Skip                   | Skip        |
      | Qadashboardtest@yopmail.com |   6 | Skip        | Skip        | Skip        | Skip            | True Random            | Skip        |
      | Qafivedashtest@yopmail.com  |   7 | Skip        | Skip        | Skip        | Skip            | Skip                   | True Random |
      | allmodel123@yopmail.com     |   8 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        |
      | allmodel123@yopmail.com     |   9 | True Random | True Random | True Random | Skip            | Skip                   | True Random |
      | Qafivedashtest@yopmail.com  |  10 | True All    | True All    | Skip        | Skip            | Skip                   | Skip        |
      | Qatwodashtest@yopmail.com   |  11 | True Random | Skip        | True Random | Skip            | True Random            | True Random |

  @IPECRLS @RowLevelSecurity 
  Scenario: Execute JMX file and read Output data for Data Filter Validations
    When I close the file for after writing data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\IPECDashboard\\IPECECRowFilterOutput.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\IPECDashboard\\IPECRowFilter.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\IPECDashboard\\IPECECRowFilterOutput.txt"

  @IPECRLS @RowLevelSecurity 
  Scenario Outline: Verify DB and FE values fetched from Scenarios
    And I get the value "<Index>" from Output file of data filter validation
    Then I verify "Episode Initiator - BPID" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Anchor Facility - CCN" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Bundle" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Region - Market" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Remedy Region - Market" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Participant" for DB and FE filter values at "<Row>" for "EC"

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
