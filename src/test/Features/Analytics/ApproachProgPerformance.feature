Feature: Approach for Program Performance Dashboard

  Scenario: Execute JMX file and read Output data for Data Metrics Validation
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\PerformanceDashboard\\PerformanceDashboardResult.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\PerformanceDashboard\\TableauTest.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\PerformanceDashboard\\PerformanceDashboardResult.txt"

  Scenario Outline: Data Metric validation for Filters - BPID, CCN
    Given I get the value "<Output_Row>" from Output file of data metric validation
    Given I am on the login page
    When I enter email field Qafivedashtest@yopmail.com for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "Performance Overview" dashboard
    And I switch to analytics iframe
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    Then I verify "Program Performance" text is appearing inside dashboard
    ##**EC**
    Then I set "End Date" as "<End_Date>" in Date field on dashboard
    Then I set "Start Date" as "<Start_Date>" in Date field on dashboard
    Then I select "<BPID>" from "Episode Initiator - BPID" field and click on "Apply"
    Then I select "<CCN>" from "Anchor Facility - CCN" field and click on "Apply"
    And I verify "Savings Rate" data metric value with database value on the dashboard for "EC" with picture resolution "600X600"
    And I verify "KPI_Program_size" data metric value with database value on the dashboard for "EC" with picture resolution "600X600"
    And I verify "KPI_NPRA" data metric value with database value on the dashboard for "EC" with picture resolution "600X600"
    And I verify "KPI_Episode" data metric value with database value on the dashboard for "EC" with picture resolution "500X500"
    And I verify "% SNF Disch Current" data metric value with database value on the dashboard for "EC" with picture resolution "700X700"
    And I verify "% SNF Disch Benchmark Variance" tooltip for "EC" is having the same value fetched from database
    And I verify "SNF Days Current" data metric value with database value on the dashboard for "EC" with picture resolution "700X700"
    And I verify "SNF Days Benchmark Variance" tooltip for "EC" is having the same value fetched from database
    And I verify "Readmissions Current" data metric value with database value on the dashboard for "EC" with picture resolution "700X700"
    And I verify "Readmissions Benchmark Variance" tooltip for "EC" is having the same value fetched from database
    ##**Cliams**
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    Then I set "Start Date" as "<ClaimsStart_Date>" in Date field on dashboard
    Then I set "End Date" as "<ClaimsEnd_Date>" in Date field on dashboard
    Then I select "<BPID>" from "Episode Initiator - BPID" field and click on "Apply"
    Then I select "<CCN>" from "Anchor Facility - CCN" field and click on "Apply"
    And I verify "Savings Rate" data metric value with database value on the dashboard for "Claims" with picture resolution "600X600"
    And I verify "KPI_Program_size" data metric value with database value on the dashboard for "Claims" with picture resolution "600X600"
    And I verify "KPI_NPRA" data metric value with database value on the dashboard for "Claims" with picture resolution "600X600"
    And I verify "KPI_Episode" data metric value with database value on the dashboard for "Claims" with picture resolution "500X500"
    And I verify "% SNF Disch Current" data metric value with database value on the dashboard for "Claims" with picture resolution "700X700"
    And I verify "% SNF Disch Benchmark Variance" tooltip for "Claims" is having the same value fetched from database
    And I verify "SNF Days Current" data metric value with database value on the dashboard for "Claims" with picture resolution "700X700"
    And I verify "SNF Days Benchmark Variance" tooltip for "Claims" is having the same value fetched from database
    And I verify "Readmissions Current" data metric value with database value on the dashboard for "Claims" with picture resolution "700X700"
    And I verify "Readmissions Benchmark Variance" tooltip for "Claims" is having the same value fetched from database

    Examples: 
      | Output_Row | Start_Date  | End_Date    | ClaimsStart_Date | ClaimsEnd_Date | BPID              | CCN           |
      |          0 | ECStartDate | Todays Date | 1/1/2017         | ClaimsCubeDate | 2070-021          |        390223 |
      |          1 | ECStartDate | Todays Date | 1/1/2017         | ClaimsCubeDate |                   | 390223,220010 |
      |          2 | ECStartDate | Todays Date | 1/1/2017         | ClaimsCubeDate | 2070-b72          |        220010 |
      |          3 | ECStartDate | Todays Date | 1/1/2017         | ClaimsCubeDate | 2070-021,2070-b72 | 390223,220010 |
