Feature: HHA Network Management Dashboard

  @RowLevelSecurity12 @Test1 @RowLevelSecurity
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
    ##TimeECStartDate
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
      | User                       | Row | BPID | CCN  | Bundle | Remedy Region - Market | Region - Market | Participant | Post Acute Facility |
      | Qafivedashtest@yopmail.com |   1 | Skip | Skip | Skip   | Skip                   | Skip            | Skip        | Skip                |
      | Qatwodashtest@yopmail.com  |   2 | Skip | Skip | Skip   | Skip                   | Skip            | Skip        | Skip                |

  @RowLevelSecurity
  Scenario: Execute JMX file and read Output data for Data Filter Validations for EC
    When I close the file for after writing data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\HHANetworkManagement\\ECRowFilterOutput.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\HHANetworkManagement\\ECRowFilter.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\HHANetworkManagement\\ECRowFilterOutput.txt"

  @RowLevelSecurity
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
