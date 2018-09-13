Feature: Program Performance Overview Dashboard

  Scenario Outline: Execute Filter combinations to Validate Data Metrics on Front End - For Claims
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
    Then I set "End Date" as "ClaimsCubeDate" in Date field on dashboard
    When I open file "\\src\\test\\Jmeter\\PerformanceDashboard\\ClaimsMetricsInput.csv" for writting data at "<Row>" to input file
    ##BPID
    And I click "Episode Initiator - BPID" Filter on the "program performance - <BPID>" dashboard
    And I select "<BPID>" checkbox in "BPID" filter on "Program overview" dashboard
    And I click "Episode Initiator - BPID" Filter on the "program performance - <BPID>" dashboard
    ##CCN
    And I click "Anchor Facility - CCN" Filter on the "program performance - <CCN>" dashboard
    And I select "<CCN>" checkbox in "CCN" filter on "Program overview" dashboard
    And I click "Anchor Facility - CCN" Filter on the "program performance - <CCN>" dashboard
    ##Bundle
    And I click "Bundle" Filter on the "program performance - <Bundle>" dashboard
    And I select "<Bundle>" checkbox in "Bundle" filter on "Program overview" dashboard
    And I click "Bundle" Filter on the "program performance - <Bundle>" dashboard
    ##Region-Market
    And I click "Region - Market" Filter on the "program performance - <Region - Market>" dashboard
    And I select "<Region - Market>" checkbox in "Region - Market" filter on "Program overview" dashboard
    And I click "Region - Market" Filter on the "program performance - <Region - Market>" dashboard
    ##Remedy-RegionMarket
    And I click "Remedy Region - Market" Filter on the "program performance - <Remedy Region - Market>" dashboard
    And I select "<Remedy Region - Market>" checkbox in "Remedy Region - Market" filter on "Program overview" dashboard
    And I click "Remedy Region - Market" Filter on the "program performance - <Remedy Region - Market>" dashboard
    ##ParticipantName
    And I click "Participant" Filter on the "program performance - <Participant>" dashboard
    And I select "<Participant>" checkbox in "Participant" filter on "Program overview" dashboard
    And I click "Participant" Filter on the "program performance - <Participant>" dashboard
    ##DRGCODE
    And I click "DRG - Fracture" Filter on the "program performance - <DRG - Fracture>" dashboard
    And I select "<DRG - Fracture>" checkbox in "DRG - Fracture" filter on "Program overview" dashboard
    And I click "DRG - Fracture" Filter on the "program performance - <DRG - Fracture>" dashboard
    ##NPI
    And I click "Physician - NPI" Filter on the "program performance - <Physician - NPI>" dashboard
    And I select "<Physician - NPI>" checkbox in "Physician - NPI" filter on "Program overview" dashboard
    And I click "Physician - NPI" Filter on the "program performance - <Physician - NPI>" dashboard
    ##MODEL
    And I click "Model" Filter on the "program performance - <Model>" dashboard
    And I select "<Model>" checkbox in "Model" filter on "Program overview" dashboard
    And I click "Model" Filter on the "program performance - <Model>" dashboard
    ##DataMetricValues
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    And I Save "KPI_Episode" data metric FE value on the dashboard for "Claims" with picture resolution "600X600"
    And I Save "Savings Rate" data metric FE value on the dashboard for "Claims" with picture resolution "300X300"
    And I Save "KPI_Program_size" data metric FE value on the dashboard for "Claims" with picture resolution "500X500"
    And I Save "KPI_NPRA" data metric FE value on the dashboard for "Claims" with picture resolution "500X500"
    And I Save "% SNF Disch Current" data metric FE value on the dashboard for "Claims" with picture resolution "700X700"
    And I Save "% SNF Disch Benchmark Variance" tooltip for "Claims" on the "Performance Overview" dashboard
    And I Save "SNF Days Current" data metric FE value on the dashboard for "Claims" with picture resolution "800X800"
    And I Save "SNF Days Benchmark Variance" tooltip for "Claims" on the "Performance Overview" dashboard
    And I Save "Readmissions Current" data metric FE value on the dashboard for "Claims" with picture resolution "600X600"
    And I Save "Readmissions Benchmark Variance" tooltip for "Claims" on the "Performance Overview" dashboard
    And I save the values of output images in "<Row>" index in storage HashMap

    Examples: 
      | User                        | Row | BPID        | CCN         | Bundle      | Region - Market | Remedy Region - Market | Participant | DRG - Fracture | Physician - NPI | Model |
      | Qadashboardtest@yopmail.com |   1 | True All    | True Random | True Random | Skip            | Skip                   | Skip        | Skip           | Skip            | Skip  |
      | Qatwodashtest@yopmail.com   |   2 | True All    | True All    | Skip        | Skip            | Skip                   | Skip        | Skip           | Skip            | Skip  |
      | Qatendashtest@yopmail.com   |   3 | True Random | True Random | Skip        | Skip            | Skip                   | Skip        | Skip           | Skip            | Skip  |
      | Qafivedashtest@yopmail.com  |   4 | True Random | True Random | Skip        | Skip            | Skip                   | Skip        | Skip           | Skip            | Skip  |
      | Qatendashtest@yopmail.com   |   5 | True Random | True Random | True Random | True Random     | True Random            | True All    | True All       | True Random     | Skip  |

  Scenario: Execute JMX file and read Output data for Data Metrics Validation for - CLAIMS
    When I close the file for after writting data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\PerformanceDashboard\\ClaimsMetricsOutput.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\PerformanceDashboard\\ClaimsMetricsQuery.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\PerformanceDashboard\\ClaimsMetricsOutput.txt"

  Scenario Outline: Verify DB and FE values feteched from Scenarios(1&2) - Claims (For Metrics Validations & Benchmark Tool Tip)
    And I get the value "<Index>" from Output file of data metric validation
    Then I verify "KPI_Episode" for DB and FE Metrics value at "<Row>" for "Claims"
    Then I verify "Savings Rate" for DB and FE Metrics value at "<Row>" for "Claims"
    Then I verify "KPI_Program_size" for DB and FE Metrics value at "<Row>" for "Claims"
    Then I verify "KPI_NPRA" for DB and FE Metrics value at "<Row>" for "Claims"
    Then I verify "% SNF Disch Current" for DB and FE Metrics value at "<Row>" for "Claims"
    Then I verify "SNF Days Current" for DB and FE Metrics value at "<Row>" for "Claims"
    Then I verify "Readmissions Current" for DB and FE Metrics value at "<Row>" for "Claims"
    Then I verify "% SNF Disch Benchmark Variance" for DB and FE Metrics value at "<Row>" for "Claims"
    Then I verify "SNF Days Benchmark Variance" for DB and FE Metrics value at "<Row>" for "Claims"
    Then I verify "Readmissions Benchmark Variance" for DB and FE Metrics value at "<Row>" for "Claims"

    Examples: 
      | Index | Row |
      |     0 |   1 |
      |     1 |   2 |
      |     2 |   3 |
      |     3 |   4 |
      |     4 |   5 |

  Scenario Outline: Execute Filter combinations to Validate Data Metrics on Front End - For EC
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
    Then I set "Start Date" as "ECStartDate " in Date field on dashboard
    Then I set "End Date" as "Today" in Date field on dashboard
    When I open file "\\src\\test\\Jmeter\\PerformanceDashboard\\ECMetricsInput.csv" for writting data at "<Row>" to input file
    ##BPID
    And I click "Episode Initiator - BPID" Filter on the "program performance - <BPID>" dashboard
    And I select "<BPID>" checkbox in "BPID" filter on "Program overview" dashboard
    And I click "Episode Initiator - BPID" Filter on the "program performance - <BPID>" dashboard
    ##CCN
    And I click "Anchor Facility - CCN" Filter on the "program performance - <CCN>" dashboard
    And I select "<CCN>" checkbox in "CCN" filter on "Program overview" dashboard
    And I click "Anchor Facility - CCN" Filter on the "program performance - <CCN>" dashboard
    ##Bundle
    And I click "Bundle" Filter on the "program performance - <Bundle>" dashboard
    And I select "<Bundle>" checkbox in "Bundle" filter on "Program overview" dashboard
    And I click "Bundle" Filter on the "program performance - <Bundle>" dashboard
    ##Region-Market
    And I click "Region - Market" Filter on the "program performance - <Region - Market>" dashboard
    And I select "<Region - Market>" checkbox in "Region - Market" filter on "Program overview" dashboard
    And I click "Region - Market" Filter on the "program performance - <Region - Market>" dashboard
    ##Remedy-RegionMarket
    And I click "Remedy Region - Market" Filter on the "program performance - <Remedy Region - Market>" dashboard
    And I select "<Remedy Region - Market>" checkbox in "Remedy Region - Market" filter on "Program overview" dashboard
    And I click "Remedy Region - Market" Filter on the "program performance - <Remedy Region - Market>" dashboard
    ##ParticipantName
    And I click "Participant" Filter on the "program performance - <Participant>" dashboard
    And I select "<Participant>" checkbox in "Participant" filter on "Program overview" dashboard
    And I click "Participant" Filter on the "program performance - <Participant>" dashboard
    ##DRGCODE
    And I click "DRG - Fracture" Filter on the "program performance - <DRG - Fracture>" dashboard
    And I select "<DRG - Fracture>" checkbox in "DRG - Fracture" filter on "Program overview" dashboard
    And I click "DRG - Fracture" Filter on the "program performance - <DRG - Fracture>" dashboard
    ##NPI
    And I click "Physician - NPI" Filter on the "program performance - <Physician - NPI>" dashboard
    And I select "<Physician - NPI>" checkbox in "Physician - NPI" filter on "Program overview" dashboard
    And I click "Physician - NPI" Filter on the "program performance - <Physician - NPI>" dashboard
    ##MODEL
    And I click "Model" Filter on the "program performance - <Model>" dashboard
    And I select "<Model>" checkbox in "Model" filter on "Program overview" dashboard
    And I click "Model" Filter on the "program performance - <Model>" dashboard
    ##DataMetricValues
    And I click on Refresh DB data Icon On dashboard
    And I switch to analytics iframe
    And I Save "KPI_Episode" data metric FE value on the dashboard for "EC" with picture resolution "600X600"
    And I Save "Savings Rate" data metric FE value on the dashboard for "EC" with picture resolution "300X300"
    And I Save "KPI_Program_size" data metric FE value on the dashboard for "EC" with picture resolution "500X500"
    And I Save "KPI_NPRA" data metric FE value on the dashboard for "EC" with picture resolution "500X500"
    And I Save "% SNF Disch Current" data metric FE value on the dashboard for "EC" with picture resolution "700X700"
    And I Save "% SNF Disch Benchmark Variance" tooltip for "EC" on the "Performance Overview" dashboard
    And I Save "SNF Days Current" data metric FE value on the dashboard for "EC" with picture resolution "800X800"
    And I Save "SNF Days Benchmark Variance" tooltip for "EC" on the "Performance Overview" dashboard
    And I Save "Readmissions Current" data metric FE value on the dashboard for "EC" with picture resolution "600X600"
    And I Save "Readmissions Benchmark Variance" tooltip for "EC" on the "Performance Overview" dashboard
    And I save the values of output images in "<Row>" index in storage HashMap

    Examples: 
      | User                        | Row | BPID        | CCN         | Bundle      | Region - Market | Remedy Region - Market | Participant | DRG - Fracture | Physician - NPI | Model |
      | Qadashboardtest@yopmail.com |   1 | True All    | True Random | True Random | Skip            | Skip                   | Skip        | Skip           | Skip            | Skip  |
      | Qatwodashtest@yopmail.com   |   2 | True All    | True All    | Skip        | Skip            | Skip                   | Skip        | Skip           | Skip            | Skip  |
      | Qatendashtest@yopmail.com   |   3 | True Random | True Random | Skip        | Skip            | Skip                   | Skip        | Skip           | Skip            | Skip  |
      | Qafivedashtest@yopmail.com  |   4 | True Random | True Random | Skip        | Skip            | Skip                   | Skip        | Skip           | Skip            | Skip  |
      | Qatendashtest@yopmail.com   |   5 | True Random | True Random | True Random | True Random     | True Random            | True All    | True All       | True Random     | Skip  |

  Scenario: Execute JMX file and read Output data for Data Metrics Validation for - EC
    When I close the file for after writting data to input file
    Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\PerformanceDashboard\\ECMetricsOutput.txt" Output file
    When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\PerformanceDashboard\\ECMetricsQuery.jmx"
    Then I read the values from the text file "\\src\\test\\Jmeter\\PerformanceDashboard\\ECMetricsOutput.txt"

  Scenario Outline: Verify DB and FE values feteched from Scenarios(4&5) - EC (For Metrics Validations & Benchmark Tool Tip)
    And I get the value "<Index>" from Output file of data metric validation
    Then I verify "KPI_Episode" for DB and FE Metrics value at "<Row>" for "EC"
    Then I verify "Savings Rate" for DB and FE Metrics value at "<Row>" for "EC"
    Then I verify "KPI_Program_size" for DB and FE Metrics value at "<Row>" for "EC"
    Then I verify "KPI_NPRA" for DB and FE Metrics value at "<Row>" for "EC"
    Then I verify "% SNF Disch Current" for DB and FE Metrics value at "<Row>" for "EC"
    Then I verify "SNF Days Current" for DB and FE Metrics value at "<Row>" for "EC"
    Then I verify "Readmissions Current" for DB and FE Metrics value at "<Row>" for "EC"
    Then I verify "% SNF Disch Benchmark Variance" for DB and FE Metrics value at "<Row>" for "EC"
    Then I verify "SNF Days Benchmark Variance" for DB and FE Metrics value at "<Row>" for "EC"
    Then I verify "Readmissions Benchmark Variance" for DB and FE Metrics value at "<Row>" for "EC"

    Examples: 
      | Index | Row |
      |     0 |   1 |
      |     1 |   2 |
      |     2 |   3 |
      |     3 |   4 |
      |     4 |   5 |
