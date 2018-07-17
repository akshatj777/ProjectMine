@sanity
Feature: Clicking on Program Overview report graphs for claims reports

  Scenario Outline: User should be able to click on program overview claims reports graphs under overall program
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Dashboards" under reports tile text
    Then I verify current page "Reports" title
    Then I should see Reports Tile text as <Menu 1>
    When I click on the Reports Tile with text "<Menu 1>"
    Then I should see following Reports text for Dashboards reports
      | Program Overview |
    When I click on "Program Overview" reports text for "Dashboards" report tile
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    Then I wait until loading icon disappears in program overview report
    And I will wait to see "Overall Program" under program overview report in iframe
    Then I select "Claims" radio button under data source filter
    Then I wait until loading icon disappears in program overview report
    And I will wait to see "Overall Program" under program overview report in iframe
    Then I click on "NPRA" claims graph point under overall program of program overview report
    And I switch to new window
    And I will wait to see "Financial Performance" is appearing after clicking graph point
    Then I verify "Financial Performance" in the new window after clicking on the graph point
    And I switch back to old window

    Examples: 
      | email                          | Menu 1     |
      #| Medicare Payer Users|
      | shutestaug231132a@yopmail.com  | Dashboards |
      #| Emblem Payer Users  |
      #| emblemachrpfin@yopmail.com     | Dashboards |
      #| Multiple Payer Users|
      #| multipayerachrpfin@yopmail.com | Dashboards |

  Scenario Outline: User should be able to click on program overview claims reports graphs under post acute utilization
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Dashboards" under reports tile text
    Then I verify current page "Reports" title
    Then I should see Reports Tile text as <Menu 1>
    When I click on the Reports Tile with text "<Menu 1>"
    Then I should see following Reports text for Dashboards reports
      | Program Overview |
    When I click on "Program Overview" reports text for "Dashboards" report tile
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    Then I wait until loading icon disappears in program overview report
    And I will wait to see "Overall Program" under program overview report in iframe
    Then I select "Claims" radio button under data source filter
    Then I wait until loading icon disappears in program overview report
    And I will wait to see "Overall Program" under program overview report in iframe
    And I click on "Overall Program" under program overview reports
    Then I click on skilled nursing "SNF" claims graph point under post acute utilization of program overview report
    And I switch to new window
    And I will wait to see "Performance" is appearing after clicking graph point
    Then I verify "Performance" in the new window after clicking on the graph point
    And I switch back to old window
    And I switch to reports embedded iframe
    And I click on "Zoom In" button under long term acute care graph for post accute utilization report
    And I wait for 3000 milli seconds
    Then I click on long term acute care "LTCH" claims graph point under post acute utilization of program overview report
    And I switch to new window
    And I will wait to see "Performance" is appearing after clicking graph point
    Then I verify "Performance" in the new window after clicking on the graph point
    And I switch back to old window
    And I switch to reports embedded iframe
    Then I click on inpatient rehab "IRF" claims graph point under post acute utilization of program overview report
    And I switch to new window
    And I will wait to see "Performance" is appearing after clicking graph point
    Then I verify "Performance" in the new window after clicking on the graph point
    And I switch back to old window
    And I switch to reports embedded iframe
    Then I click on home health "HHA" claims graph point under post acute utilization of program overview report
    And I switch to new window
    And I will wait to see "Performance" is appearing after clicking graph point
    Then I verify "Performance" in the new window after clicking on the graph point
    And I switch back to old window
    And I switch to reports embedded iframe
    Then I scroll the page to bottom by "100"
    Then I click on "home" claims graph point under post acute utilization of program overview report
    And I switch to new window
    And I will wait to see "Performance" is appearing after clicking graph point
    Then I verify "Performance" in the new window after clicking on the graph point
    And I switch back to old window
    And I switch to reports embedded iframe
    And I click on "Zoom in" button under other graph for post accute utilization report
    And I wait for 3000 milli seconds
    Then I click on "other" graph point of claims under post acute utilization of program overview report
    And I switch to new window
    And I will wait to see "Performance" is appearing after clicking graph point
    Then I verify "Performance" in the new window after clicking on the graph point
    And I switch back to old window

    Examples: 
      | email                          | Menu 1     |
      #| Medicare Payer Users|
      | shutestaug231132a@yopmail.com  | Dashboards |
      #| Emblem Payer Users  |
      #| emblemachrpfin@yopmail.com     | Dashboards |
      #| Multiple Payer Users|
      #| multipayerachrpfin@yopmail.com | Dashboards |

  Scenario Outline: User should be able to click on program overview claims reports graphs under snf length of stay
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Dashboards" under reports tile text
    Then I verify current page "Reports" title
    Then I should see Reports Tile text as <Menu 1>
    When I click on the Reports Tile with text "<Menu 1>"
    Then I should see following Reports text for Dashboards reports
      | Program Overview |
    When I click on "Program Overview" reports text for "Dashboards" report tile
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    Then I wait until loading icon disappears in program overview report
    And I will wait to see "Overall Program" under program overview report in iframe
    Then I select "Claims" radio button under data source filter
    Then I wait until loading icon disappears in program overview report
    And I will wait to see "Overall Program" under program overview report in iframe
    And I click on "Overall Program" under program overview reports
    And I click on "Post Acute Utilization" under program overview reports
    Then I click on initial snf length of stay "initialSNF" claims graph point under snf length of stay of program overview report
    And I switch to new window
    And I will wait to see "SNF Performance" is appearing after clicking graph point
    Then I verify "SNF Performance" in the new window after clicking on the graph point
    And I switch back to old window
    And I switch to reports embedded iframe
    Then I click on snf days "daysSNF" claims graph point under snf length of stay of program overview report
    And I switch to new window
    And I will wait to see "Performance" is appearing after clicking graph point
    Then I verify "Performance" in the new window after clicking on the graph point
    And I switch back to old window

    Examples: 
      | email                          | Menu 1     |
      #| Medicare Payer Users|
      | shutestaug231132a@yopmail.com  | Dashboards |
      #| Emblem Payer Users  |
      #| emblemachrpfin@yopmail.com     | Dashboards |
      #| Multiple Payer Users|
      #| multipayerachrpfin@yopmail.com | Dashboards |

  Scenario Outline: User should be able to click on program overview claims reports graphs under readmissions
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Dashboards" under reports tile text
    Then I verify current page "Reports" title
    Then I should see Reports Tile text as <Menu 1>
    When I click on the Reports Tile with text "<Menu 1>"
    Then I should see following Reports text for Dashboards reports
      | Program Overview |
    When I click on "Program Overview" reports text for "Dashboards" report tile
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    Then I wait until loading icon disappears in program overview report
    And I will wait to see "Overall Program" under program overview report in iframe
    Then I select "Claims" radio button under data source filter
    Then I wait until loading icon disappears in program overview report
    And I will wait to see "Overall Program" under program overview report in iframe
    And I click on "Overall Program" under program overview reports
    And I click on "Post Acute Utilization" under program overview reports
    And I click on "SNF Length of Stay" under program overview reports
    Then I scroll the page to bottom by "100"
    Then I click on episodes w readmit "episodesReadmits" claims graph point under readmissions of program overview report
    And I switch to new window
    And I will wait to see "Readmissions Claims" is appearing after clicking graph point
    Then I verify "Readmissions Claims" in the new window after clicking on the graph point
    And I switch back to old window
    And I switch to reports embedded iframe
    Then I click on readmits per episode "readmitsEpisodes" claims graph point under readmissions of program overview report
    And I switch to new window
    And I will wait to see "Readmissions Claims" is appearing after clicking graph point
    Then I verify "Readmissions Claims" in the new window after clicking on the graph point
    And I switch back to old window

    Examples: 
      | email                          | Menu 1     |
      #| Medicare Payer Users|
      | shutestaug231132a@yopmail.com  | Dashboards |
      #| Emblem Payer Users  |
      #| emblemachrpfin@yopmail.com     | Dashboards |
      #| Multiple Payer Users|
      #| multipayerachrpfin@yopmail.com | Dashboards |
