Feature: Verify Program Performance Dashboard


Scenario: Verify data filter validations on program overview dashbaord
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
  Then I set "Start Date" as "1/1/2016 " in Date field on dashboard
  Then I set "End Date" as "3/31/2018" in Date field on dashboard
  
  When I open the file "\\src\\test\\Jmeter\\PerformanceDashboard\\dynamic.csv" for writting data to input file
  
  And I click "Episode Initiator - BPID" Filter on the "program performance" dashboard
  And I get all the "Episode Initiator - BPID" filter value for "Performance overview" dashboard
  And I click "Episode Initiator - BPID" Filter on the "program performance" dashboard
  And I click "Anchor Facility - CCN" Filter on the "program performance" dashboard
  And I get all the "Anchor Facility - CCN" filter value for "Performance overview" dashboard
  And I click "Anchor Facility - CCN" Filter on the "program performance" dashboard
  
  And I verify "KPI_Episode" data metric value with database value on the dashboard for "Claims" with picture resolution "500X500"
  And I move to new line for writting new set of data to input 
  
Scenario: Execute JMX file and read Output data for Data Metrics Validation
	When I close the file for after writting data to input file
  Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\PerformanceDashboard\\dynamicPerformanceDashboardResult.txt" Output file
  When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\PerformanceDashboard\\TableauTestDynamic.jmx"
  Then I read the values from the text file "\\src\\test\\Jmeter\\PerformanceDashboard\\dynamicPerformanceDashboardResult.txt"
	And I get the value "0" from Output file of data metric validation
	Then I verify "Episode" for DB and FE Metrics value  for "Claims"  
	
Scenario: Verify DB and FE values
#	Then I verify "Episode" for DB and FE Metrics value  for "Cliams"  