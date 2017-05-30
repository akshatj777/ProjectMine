@sanity
Feature: Clicking on Program Overview report graphs for EPisode Connect reports

Scenario Outline: User should be able to click on program overview episode connect reports graphs under post acute utilization

    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    
    When I click on the "Reports" tile
    And I wait for 1000 milli seconds
    Then I verify current page "Reports" title
    And I wait for 2000 milli seconds
    
    Then I should see Reports Tile text as <Menu 1>
    When I click on the Reports Tile with text "<Menu 1>"
    Then I should see following Reports text for Dashboards reports
      | Program Overview |
      
    When I click on "Program Overview" reports text for "Dashboards" report tile
    And I wait for 60000 milli seconds
    And I switch to reports embedded iframe
    
    Then I select "Episode Connect" radio button under data source filter
    And I wait for 5000 milli seconds
    Then I select "Claims" radio button under data source filter
    And I wait for 5000 milli seconds
    And I click on "Overall Program" under program overview reports
    Then I click on skilled nursing "SNF" claims graph point under post acute utilization of program overview report
    And I switch to new window
    And I wait for 30000 milli seconds
    Then I verify "Next Site of Care Summary" in the new window after clicking on the graph point
    And I switch back to old window
    And I wait for 2000 milli seconds
    
    And I switch to reports embedded iframe
    Then I click on long term acute care "LTCH" claims graph point under post acute utilization of program overview report
    And I switch to new window
    And I wait for 60000 milli seconds
    Then I verify "Next Site of Care Summary" in the new window after clicking on the graph point
    And I switch back to old window
    And I wait for 2000 milli seconds
    
    And I switch to reports embedded iframe
    Then I click on inpatient rehab "IRF" claims graph point under post acute utilization of program overview report
    And I switch to new window
    And I wait for 30000 milli seconds
    Then I verify "Next Site of Care Summary" in the new window after clicking on the graph point
    And I switch back to old window
    And I wait for 2000 milli seconds
    
    And I switch to reports embedded iframe
    Then I click on home health "HHA" claims graph point under post acute utilization of program overview report
    And I switch to new window
    And I wait for 30000 milli seconds
    Then I verify "Next Site of Care Summary" in the new window after clicking on the graph point
    And I switch back to old window
    And I wait for 2000 milli seconds
    
    And I switch to reports embedded iframe
    Then I scroll the page to bottom by "100"
    Then I click on "home" claims graph point under post acute utilization of program overview report
    And I switch to new window
    And I wait for 30000 milli seconds
    Then I verify "Next Site of Care Summary" in the new window after clicking on the graph point
    And I switch back to old window
    And I wait for 2000 milli seconds
    
    And I switch to reports embedded iframe
    Then I click on "other" graph point of claims under post acute utilization of program overview report
    And I switch to new window
    And I wait for 30000 milli seconds
    Then I verify "Next Site of Care Summary" in the new window after clicking on the graph point
    And I switch back to old window
    And I wait for 2000 milli seconds
    
    
    Examples:
    
      | email                              | Menu 1     |
      | shutestaug231132a@yopmail.com      | Dashboards |
      | reptestachmodel2opsfin@yopmail.com | Dashboards |
      
 Scenario Outline: User should be able to click on program overview episode connect reports graphs under snf length of stay
 
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    
    When I click on the "Reports" tile
    And I wait for 1000 milli seconds
    Then I verify current page "Reports" title
    And I wait for 2000 milli seconds
    
    Then I should see Reports Tile text as <Menu 1>
    When I click on the Reports Tile with text "<Menu 1>"
    Then I should see following Reports text for Dashboards reports
      | Program Overview |
      
    When I click on "Program Overview" reports text for "Dashboards" report tile
    And I wait for 60000 milli seconds
    And I switch to reports embedded iframe
    
    Then I select "Episode Connect" radio button under data source filter
    And I wait for 5000 milli seconds
    Then I select "Claims" radio button under data source filter
    And I wait for 5000 milli seconds
    And I click on "Overall Program" under program overview reports
    And I click on "Post Acute Utilization" under program overview reports
    
    Then I click on initial snf length of stay "initialSNF" claims graph point under snf length of stay of program overview report
    And I switch to new window
    And I wait for 30000 milli seconds
    Then I verify "SNF LOS Summary" in the new window after clicking on the graph point
    And I switch back to old window
    And I wait for 2000 milli seconds
    
    Examples:
    
      | email                              | Menu 1     |
      | shutestaug231132a@yopmail.com      | Dashboards |
      | reptestachmodel2opsfin@yopmail.com | Dashboards |
      
Scenario Outline: User should be able to click on program overview episode connect reports graphs under readmissions
 
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    
    When I click on the "Reports" tile
    And I wait for 1000 milli seconds
    Then I verify current page "Reports" title
    And I wait for 2000 milli seconds
    
    Then I should see Reports Tile text as <Menu 1>
    When I click on the Reports Tile with text "<Menu 1>"
    Then I should see following Reports text for Dashboards reports
      | Program Overview |
      
    When I click on "Program Overview" reports text for "Dashboards" report tile
    And I wait for 60000 milli seconds
    And I switch to reports embedded iframe
    
    Then I select "Episode Connect" radio button under data source filter
    And I wait for 8000 milli seconds
    Then I select "Claims" radio button under data source filter
    And I wait for 5000 milli seconds
    And I click on "Overall Program" under program overview reports
    And I click on "Post Acute Utilization" under program overview reports
    And I click on "SNF Length of Stay" under program overview reports
    Then I scroll the page to bottom by "100"
    
    Then I click on episodes w readmit "episodesReadmits" claims graph point under readmissions of program overview report
    And I switch to new window
    And I wait for 30000 milli seconds
    Then I verify "Readmissions EC" in the new window after clicking on the graph point
    And I switch back to old window
    And I wait for 2000 milli seconds
    
    And I switch to reports embedded iframe
    Then I click on readmits per episode "readmitsEpisodes" claims graph point under readmissions of program overview report
    And I switch to new window
    And I wait for 30000 milli seconds
    Then I verify "Readmissions EC" in the new window after clicking on the graph point
    And I switch back to old window
    And I wait for 2000 milli seconds
    
    Examples:
    
      | email                              | Menu 1     |
      | shutestaug231132a@yopmail.com      | Dashboards |
      | reptestachmodel2opsfin@yopmail.com | Dashboards |