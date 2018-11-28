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
    And I save the values of row filters in "<Row>" index in storage HashMap

    Examples: 
      | User                        | Row | BPID        | CCN         | Bundle      | Region - Market | Remedy Region - Market | Participant | POSTCCN     |
      | allmodel123@yopmail.com  |   1 | Skip        | Skip        | Skip        | Skip            | Skip                   | Skip        | True Random        |

  @HHAScorecardRLS @HHA
  Scenario: Execute JMX file and read Output data for Data Filter Validations
    When I close the file for after writing data to input file
