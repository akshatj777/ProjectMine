Feature: HHA Scorecard Dashboard

  @HHAScorecardRLS @tt
  Scenario Outline: Front end Data Filter Validation for EC & Claims data for HHAScoreCard
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
    Then I set "End Date" as "Today" in Date field on dashboard
    ##POST BPID
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard - <POSTCCN>" dashboard
    And I select "<POSTCCN>" checkbox in "CCN" filter on "HHAScoreCard" dashboard
    And I click "Post Acute Facility - CCN" Filter on the "HHAScoreCard - <POSTCCN>" dashboard
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
      | User                       | Row | BPID | CCN  | Bundle | Region - Market | Remedy Region - Market | Participant | POSTCCN  |
      | Qafivedashtest@yopmail.com |   1 | Skip | Skip | Skip   | Skip            | Skip                   | Skip        | Skip |

  @HHAScorecardRLS @tt
  Scenario: Execute JMX file and read Output data for Data Filter Validations
    When I close the file for after writing data to input file
