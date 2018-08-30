Feature: Approach for Program Performance Dashboard

  Scenario: Execute JMX file and read Output data for Data Metrics Validation
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\PerformanceDashboard\\TableauTest.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\PerformanceDashboard\\PerformanceDashboardResult.txt"

  Scenario Outline: Data Metric validation for Filters - BPID, CCN
    Given I am on the login page
    When I enter email field Qafivedashtest@yopmail.com for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "Performance Overview" dashboard
    And I switch to analytics iframe
    Then I verify "Program Performance" text is appearing inside dashboard
    Then I set "Start Date" as "<Start_Date>" in Date field on dashboard
    Then I set "End Date" as "<End_Date>" in Date field on dashboard
    Then I select "<BPID>" from "Episode Initiator - BPID" field and click on "Apply"
    Then I select "<CCN>" from "Anchor Facility - CCN" field and click on "Apply"
    And I get the value "Output_Row" from Output file of data metric validation

    Examples: 
      | Output_Row | Start_Date | End_Date    | BPID              | CCN           |
      |          0 | 1/1/2017   | Todays Date | 2070-021,2070-b72 | 390223,220010 |
