Feature: Verify Program Performance Dashboard

  Scenario Outline: Verify data filter validations on program overview dashbaord
    Given I am on the login page
    When I enter email field <User> for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "Performance Overview" dashboard
    And I switch to analytics iframe
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    Then I verify "Program Performance" text is appearing inside dashboard
    Then I set "Start Date" as "1/1/2016 " in Date field on dashboard
    Then I set "End Date" as "3/31/2018" in Date field on dashboard
    When I open the file "\\src\\test\\Jmeter\\PerformanceDashboard\\dynamic.csv" for writting data to input file
    And I initialize the storage of Image in HashMap
    And I click "Episode Initiator - BPID" Filter on the "program performance - <BPID>" dashboard
    And I select "<BPID>" checkbox in "BPID" filter on "Program overview" dashboard
    And I click "Episode Initiator - BPID" Filter on the "program performance - <BPID>" dashboard
    And I click "Anchor Facility - CCN" Filter on the "program performance - <CCN>" dashboard
    And I select "<CCN>" checkbox in "CCN" filter on "Program overview" dashboard
    And I click "Anchor Facility - CCN" Filter on the "program performance - <CCN>" dashboard
    And I Save "KPI_Episode" data metric FE value on the dashboard for "Claims" with picture resolution "500X500"
    And I save the values of output images in "<Row>" index in storage HashMap

    Examples: 
      | User                        | Row | BPID        | CCN         |
      | Qadashboardtest@yopmail.com |   1 | True Random | Skip        |
      | Qatwodashtest@yopmail.com   |   2 | Skip        | True All    |
      | Qatendashtest@yopmail.com   |   3 | True All    | True Random |
      | Qafivedashtest@yopmail.com  |   4 | True All    | True All    |

  Scenario: Execute JMX file and read Output data for Data Metrics Validation
    When I close the file for after writting data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\PerformanceDashboard\\dynamicPerformanceDashboardResult.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\PerformanceDashboard\\TableauTestDynamic.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\PerformanceDashboard\\dynamicPerformanceDashboardResult.txt"

  Scenario Outline: Verify DB and FE values
    And I get the value "<Row>" from Output file of data metric validation
    Then I verify "KPI_Episode" for DB and FE Metrics value at "<Row>" for "Claims"

    Examples: 
      | Row |
      |   1 |
      |   2 |
      |   3 |
      |   4 |
