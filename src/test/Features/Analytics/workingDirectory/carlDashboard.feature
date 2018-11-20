Feature: CARL Dashboard

	@RowLevelSecurity @CARL
  Scenario Outline: Row Filter Validation for EC data for CARL
    When I open file "\\src\\test\\Jmeter\\CARLDashboard\\RowFilterInput.csv" for writing data at "<Row>" to input file
    When I open file "\\src\\test\\Jmeter\\CARLDashboard\\logs\\RowFilterInput.csv" for writing data at "<Row>" to log file
    Given I am on the login page
    When I enter email field <User> for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "CARL" dashboard
    And I switch to analytics iframe
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    And I perform test with "<User>" user in Analytics
    ##Time
    Then I set "Start Date" as "ClaimsStartDate" in Date field on dashboard
    Then I set "End Date" as "Today" in Date field on dashboard
    ##BPID
    And I click "Episode Initiator - BPID" Filter on the "CARL - <BPID>" dashboard
    And I select "<BPID>" checkbox in "BPID" filter on "CARL" dashboard
    And I click "Episode Initiator - BPID" Filter on the "CARL - <BPID>" dashboard
    ##CCN
    And I click "Anchor Facility - CCN" Filter on the "CARL - <CCN>" dashboard
    And I select "<CCN>" checkbox in "CCN" filter on "CARL" dashboard
    And I click "Anchor Facility - CCN" Filter on the "CARL - <CCN>" dashboard
    ##Bundle
    And I click "Bundle" Filter on the "CARL - <Bundle>" dashboard
    And I select "<Bundle>" checkbox in "Bundle" filter on "CARL" dashboard
    And I click "Bundle" Filter on the "CARL - <Bundle>" dashboard
    ##Region-Market
    And I click "Region - Market" Filter on the "CARL - <Region - Market>" dashboard
    And I select "<Region - Market>" checkbox in "Region - Market" filter on "CARL" dashboard
    And I click "Region - Market" Filter on the "CARL - <Region - Market>" dashboard
    ##Remedy Region - Market
    And I click "Remedy Region - Market" Filter on the "CARL - <Remedy Region - Market>" dashboard
    And I select "<Remedy Region - Market>" checkbox in "Remedy Region - Market" filter on "CARL" dashboard
    And I click "Remedy Region - Market" Filter on the "CARL - <Remedy Region - Market>" dashboard
    ##ParticipantName
    And I click "Participant" Filter on the "CARL - <Participant>" dashboard
    And I select "<Participant>" checkbox in "Participant" filter on "CARL" dashboard
    And I click "Participant" Filter on the "CARL - <Participant>" dashboard
    ##DRGCODE
    And I click "DRG" Filter on the "CARL - <DRG>" dashboard
    And I select "<DRG>" checkbox in "DRG" filter on "CARL" dashboard
    And I click "DRG" Filter on the "CARL - <DRG>" dashboard
    ##NPI
    And I click "Physician - NPI" Filter on the "CARL - <Physician - NPI>" dashboard
    And I select "<Physician - NPI>" checkbox in "Physician - NPI" filter on "CARL" dashboard
    And I click "Physician - NPI" Filter on the "CARL - <Physician - NPI>" dashboard
    ##MODEL
    And I click "Model" Filter on the "CARL - <Model>" dashboard
    And I select "<Model>" checkbox in "Model" filter on "CARL" dashboard
    And I click "Model" Filter on the "CARL - <Model>" dashboard
    ##Anchor FAcility
    And I click "Anchor Facility Detail" Filter on the "CARL - <Anchor Facility Detail>" dashboard
    And I select "<Anchor Facility Detail>" checkbox in "Anchor Facility Detail" filter on "CARL" dashboard
    And I click "Anchor Facility Detail" Filter on the "CARL - <Anchor Facility Detail>" dashboard
    ##Extract Region Market
    And I get Region and Market to input file without Participant form Region-Market dropdown
    And I click "Episode Initiator - BPID" Filter on the "CARL" dashboard
    And I fetch and store "Episode Initiator - BPID" filter values on "CARL" dashboard
    And I click "Episode Initiator - BPID" Filter on the "CARL" dashboard
    And I click "Anchor Facility - CCN" Filter on the "CARL" dashboard
    And I fetch and store "Anchor Facility - CCN" filter values on "CARL" dashboard
    And I click "Anchor Facility - CCN" Filter on the "CARL" dashboard
    And I click "Bundle" Filter on the "CARL" dashboard
    And I fetch and store "Bundle" filter values on "CARL" dashboard
    And I click "Bundle" Filter on the "CARL" dashboard
    And I click "Region - Market" Filter on the "CARL" dashboard
    And I fetch and store "Region - Market" filter values on "CARL" dashboard
    And I click "Region - Market" Filter on the "CARL" dashboard
    And I click "Remedy Region - Market" Filter on the "CARL" dashboard
    And I fetch and store "Remedy Region - Market" filter values on "CARL" dashboard
    And I click "Remedy Region - Market" Filter on the "CARL" dashboard
    And I click "Participant" Filter on the "CARL" dashboard
    And I fetch and store "Participant" filter values on "CARL" dashboard
    And I click "Participant" Filter on the "CARL" dashboard
    And I click "DRG" Filter on the "CARL" dashboard
    And I fetch and store "DRG" filter values on "CARL" dashboard
    And I click "DRG" Filter on the "CARL" dashboard
    And I click "Physician - NPI" Filter on the "CARL" dashboard
    And I fetch and store "Physician - NPI" filter values on "CARL" dashboard
    And I click "Physician - NPI" Filter on the "CARL" dashboard
    And I click "Model" Filter on the "CARL" dashboard
    And I fetch and store "Model" filter values on "CARL" dashboard
    And I click "Model" Filter on the "CARL" dashboard
    And I click "Anchor Facility Detail" Filter on the "CARL" dashboard
    And I fetch and store "Anchor Facility Detail" filter values on "CARL" dashboard
    And I click "Anchor Facility Detail" Filter on the "CARL" dashboard
    And I save the values of row filters in "<Row>" index in storage HashMap

    Examples: 
      | User                        | Row | BPID        | CCN         | Bundle      | Remedy Region - Market | Region - Market | Participant | DRG         | Physician - NPI | Model       | Anchor Facility Detail | Episode Length |
      | Qafivedashtest@yopmail.com  |   1 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | True Random | Skip            | Skip        | Skip                   | Skip           |
      | Qatwodashtest@yopmail.com   |   2 | True Random | True Random | True Random | Skip                   | Skip            | Skip        | True Random | Skip            | Skip        | Skip                   | Skip           |
      | Qadashboardtest@yopmail.com |   3 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | True All    | Skip            | Skip        | Skip                   | Skip           |
      #| Qafivedashtest@yopmail.com  |   4 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | True Random | Skip            | Skip        | Skip                   | Skip           |
      #| Qatwodashtest@yopmail.com   |   5 | True Random | True Random | Skip        | Skip                   | Skip            | True Random | Skip        | Skip            | Skip        | Skip                   | Skip           |
      #| Qadashboardtest@yopmail.com |   6 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | Skip        | Skip            | Skip        | Skip                   | Skip           |
      #| Qafivedashtest@yopmail.com  |   7 | True Random | True Random | Skip        | Skip                   | Skip            | Skip        | True Random | True Random     | Skip        | Skip                   | Skip           |
      #| allmodel123@yopmail.com     |   8 | True All    | True All    | Skip        | Skip                   | Skip            | True Random | True All    | True Random     | True All    | Skip                   | Skip           |
      #| allmodel123@yopmail.com     |   9 | True Random | True Random | True Random | Skip                   | Skip            | True Random | True Random | True Random     | True Random | Skip                   | Skip           |
      #| Qafivedashtest@yopmail.com  |  10 | True All    | True All    | Skip        | Skip                   | Skip            | Skip        | Skip        | Skip            | Skip        | Skip                   | Skip           |
      #| Qatwodashtest@yopmail.com   |  11 | True Random | True Random | True Random | Skip                   | Skip            | True Random | Skip        | True Random     | Skip        | Skip                   | Skip           |

  @RowLevelSecurity @CARL
  Scenario: Execute JMX file and read Output data for Data Filter Validations for EC
    When I close the file for after writing data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\CARLDashboard\\RowFilterOutput.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\CARLDashboard\\RowFilter.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\CARLDashboard\\RowFilterOutput.txt"

  @RowLevelSecurity @CARL
  Scenario Outline: Verify DB and FE values fetched from EC Scenarios
    And I get the value "<Index>" from Output file of data filter validation
    Then I verify "Episode Initiator - BPID" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Anchor Facility - CCN" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Bundle" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Region - Market" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Remedy Region - Market" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Participant" for DB and FE filter values at "<Row>" for "EC"
    #Then I verify "DRG" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Physician - NPI" for DB and FE filter values at "<Row>" for "EC"
    Then I verify "Model" for DB and FE filter values at "<Row>" for "EC"

    Examples: 
      | Index | Row |
      |     0 |   1 |
      |     1 |   2 |
      |     2 |   3 |
      #|     3 |   4 |
      #|     4 |   5 |
      #|     5 |   6 |
      #|     6 |   7 |
      #|     7 |   8 |
      #|     8 |   9 |
      #|     9 |  10 |
      #|    10 |  11 |
