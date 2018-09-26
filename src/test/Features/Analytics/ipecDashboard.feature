Feature: Inpatient Episode Clearing Dashboard

  @RowLevelSecurity
  Scenario Outline: Front end Data Filter Validation for last 30 DAY
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
    When I open file "\\src\\test\\Jmeter\\IPECDashboard\\IPECRowFilterInput.csv" for writing data at "<Row>" to input file
    And I perform test with "<User>" user in Analytics
    ##Time
    And I click "Time" Filter on the "IPEC" dashboard
    And I click "Time" Filter on the "IPEC" dashboard
    And I get the date "30 DAY" for Data fetched for dashboard
    ##BPID
    And I click "Episode Initiator - BPID" Filter on the "IPEC - <BPID>" dashboard
    And I fetch and store "Episode Initiator - BPID" filter values on "IPEC" dashboard
    And I select "<BPID>" checkbox in "BPID" filter on "IPEC" dashboard
    And I click "Episode Initiator - BPID" Filter on the "IPEC - <BPID>" dashboard
    ##CCN
    And I click "Anchor Facility - CCN" Filter on the "IPEC - <CCN>" dashboard
    And I fetch and store "Anchor Facility - CCN" filter values on "IPEC" dashboard
    And I select "<CCN>" checkbox in "CCN" filter on "IPEC" dashboard
    And I click "Anchor Facility - CCN" Filter on the "IPEC - <CCN>" dashboard
    ##Bundle
    And I click "Bundle" Filter on the "IPEC - <Bundle>" dashboard
    And I fetch and store "Bundle" filter values on "IPEC" dashboard
    And I select "<Bundle>" checkbox in "Bundle" filter on "IPEC" dashboard
    And I click "Bundle" Filter on the "IPEC - <Bundle>" dashboard
    ##Region Market
    And I click "Region Market" Filter on the "IPEC - <Region - Market>" dashboard
    And I fetch and store "Region - Market" filter values on "IPEC" dashboard
    And I select "<Region Market>" checkbox in "Region Market" filter on "IPEC" dashboard
    And I click "Region Market" Filter on the "IPEC - <Region Market>" dashboard
    ##Remedy Region Market
    And I click "Remedy Region Market" Filter on the "IPEC - <Remedy Region Market>" dashboard
    And I fetch and store "Remedy Region Market" filter values on "IPEC" dashboard
    And I select "<Remedy Region Market>" checkbox in "Remedy Region Market" filter on "IPEC" dashboard
    And I click "Remedy Region Market" Filter on the "IPEC - <Remedy Region Market>" dashboard
    ##ParticipantName
    And I click "Participant" Filter on the "IPEC - <Participant>" dashboard
    And I fetch and store "Participant" filter values on "IPEC" dashboard
    And I select "<Participant>" checkbox in "Participant" filter on "IPEC" dashboard
    And I click "Participant" Filter on the "IPEC - <Participant>" dashboard
    And I save the values of row filters in "<Row>" index in storage HashMap

    Examples: 
      | User                        | Row | BPID        | CCN         | Bundle      | Region Market | Remedy Region Market | Participant | DRG         | Physician - NPI | Model      | Anchor Facility Detail |
      | Qafivedashtest@yopmail.com  |   1 | True All    | True All    | True All    | Click&Skip      | Click&Skip              | True All    | True All    | True All        | Click&Skip | Click&Skip             |
      | Qatwodashtest@yopmail.com   |   2 | True All    | Click&Skip  | True All    | Click&Skip      | Click&Skip             | True All    | Click&Skip  | True All        | True All   | True All               |
      | Qadashboardtest@yopmail.com |   3 | True All    | True All    | Click&Skip  | Click&Skip      | Click&Skip             | Click&Skip  | True All    | True All        | True All   | True All               |
      | Qafivedashtest@yopmail.com  |   4 | True Random | True All    | True Random | Click&Skip      | Click&Skip             | True All    | True All    | True All        | Click&Skip | Click&Skip             |
      | Qatwodashtest@yopmail.com   |   5 | True Random | Click&Skip  | True All    | Click&Skip      | Click&Skip             | True All    | True Random | True Random     | True All   | True All               |
      | Qadashboardtest@yopmail.com |   6 | True Random | True Random | Click&Skip  | Click&Skip      | Click&Skip             | True Random | True All    | True Random     | True All   | True All               |
      | Qafivedashtest@yopmail.com  |   7 | True Random | True Random | True Random | Click&Skip      | Click&Skip             | True Random | True Random | True Random     | True All   | True All               |

  @RowLevelSecurity
  Scenario: Execute JMX file and read Output data for Data Filter Validations
    When I close the file for after writing data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\IPECDashboard\\IPECRowFilterOutput.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\IPECDashboard\\IPECRowFilter.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\IPECDashboard\\IPECRowFilterOutput.txt"

  @RowLevelSecurity
  Scenario Outline: Verify DB and FE values fetched from Scenarios
    And I get the value "<Index>" from Output file of data filter validation
    Then I verify "Episode Initiator - BPID" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Anchor Facility - CCN" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Bundle" for DB and FE filter values at "<Row>" for "EC"
    #Then I verify "Region Market" for DB and FE filter values at "<Row>" for "EC"
    #Then I verify "Remedy Region Market" for DB and FE filter values at "<Row>" for "EC"
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