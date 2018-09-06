Feature: Verify Program Performance Dashboard


Scenario: Verify data filter validations on program overview dashbaord
  #Given I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\PerformanceDashboard\\TableauTest.jmx"
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
  
  #Then I read the row filter values from the text file "\\src\\test\\Jmeter\\PerformanceDashboard\\PerformanceDashboardResult.txt"
  #Then I select "Penn Presbyterian Medical Center - 2070-021" from "Episode Initiator - BPID" field and click on "Apply"
  
  #Then I set the time from starting date as "1/1/2017" to ending date to claimscube date to validate claims episode data
  #And I set the time filter for End date to today date
  Then I set "Start Date" as "1/1/2016 " in Date field on dashboard
  Then I set "End Date" as "3/31/2018" in Date field on dashboard
  
  When I open the file "\\src\\test\\Jmeter\\PerformanceDashboard\\dynamic.csv" for writting data to input file
  
  And I click "Episode Initiator - BPID" Filter on the "program performance" dashboard
  And I get all the "Episode Initiator - BPID" filter value for "Performance overview" dashboard
 	#And I verify Episode Initiator BPID values with database value
  And I click "Episode Initiator - BPID" Filter on the "program performance" dashboard
  #
  And I click "Anchor Facility - CCN" Filter on the "program performance" dashboard
  And I get all the "Anchor Facility - CCN" filter value for "Performance overview" dashboard
  #And I verify Facility name and ccn values with database values
  And I click "Anchor Facility - CCN" Filter on the "program performance" dashboard
  
  #And I close the file for after writting data to input file
  #And I click "Bundle" Filter on the "program performance" dashboard
  #And I verify bundle names at row level security with database values for selected Episode Initiator BPID
  #And I click "Bundle" Filter on the "program performance" dashboard
  #
  #And I click "Remedy Region Market" Filter on the "program performance" dashboard
  #And I verify Remedy Region Market at row level security with database values for selected Episode Initiator BPID
  #And I click "Remedy Region Market" Filter on the "program performance" dashboard
  #
  #And I click "Partner Region Market" Filter on the "program performance" dashboard
  #And I verify Partner Region Market at row level security with database values for selected Episode Initiator BPID
  #And I click "Partner Region Market" Filter on the "program performance" dashboard
  #
  #And I click "Participant" Filter on the "program performance" dashboard
  #And I verify Participant Data Filter values with database values for selected Episode Initiator BPID
  #And I click "Participant" Filter on the "program performance" dashboard
  #
  #And I click "DRG - Fracture" Filter on the "program performance" dashboard
  #And I verify DRG-Fracture Data Filter values with database values for selected Episode Initiator BPID
  #And I click "DRG - Fracture" Filter on the "program performance" dashboard
  #
  #And I click "Physician - NPI" Filter on the "program performance" dashboard
  #And I verify Physician-NPI Data Filter values with database values for selected Episode Initiator BPID
  #And I click "Physician - NPI" Filter on the "program performance" dashboard
  #
  #And I click "Model" Filter on the "program performance" dashboard
  #And I verify Model Data Filter values with database values for selected Episode Initiator BPID
  #And I click "Model" Filter on the "program performance" dashboard
  #
  #And I click "Anchor Facility Detail" Filter on the "program performance" dashboard
  #And I verify Anchor Facility Detail Data Filter values with database values for selected Episode Initiator BPID
  #And I click "Anchor Facility Detail" Filter on the "program performance" dashboard
  And I verify "KPI_Episode" data metric value with database value on the dashboard for "Claims" with picture resolution "500X500"
  And I move to new line for writting new set of data to input 
  
Scenario: Execute JMX file and read Output data for Data Metrics Validation
	When I close the file for after writting data to input file
  Given I clear output data for Data metrics from "\\src\\test\\Jmeter\\PerformanceDashboard\\dynamicPerformanceDashboardResult.txt" Output file
  When I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\PerformanceDashboard\\TableauTestDynamic.jmx"
  Then I read the values from the text file "\\src\\test\\Jmeter\\PerformanceDashboard\\dynamicPerformanceDashboardResult.txt"
	Then I verify "Episode" for DB and FE Metrics value  for "Claims"  
	
Scenario: Verify DB and FE values
#	Then I verify "Episode" for DB and FE Metrics value  for "Cliams"  