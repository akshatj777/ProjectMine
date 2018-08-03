Feature: Verify Inpatient Episode Clearing Dashboard

Scenario: Verify the data metric validations in inpatient episode clearing dashboard
  Given I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\IPECDashboard\\IpecDashboard.jmx"
  Given I am on the login page
  When I enter email field Qafivedashtest@yopmail.com for login
  And I enter password field Testing123 for Login
  Then I click Access button
  And I wait to see "Analytics" tile
  When I click on the "Analytics" tile
  And I click on "Inpatient Episode Clearing" dashboard
  And I switch to analytics iframe
  Then I verify "Inpatient Episode Clearing" text is appearing inside dashboard
  Then I read the values from the ipec dashbaord output file "\\src\\test\\Jmeter\\IPECDashboard\\IpecDashboardResults.txt"
  And I verify bpid matched with data appearing under filet field "Episode Initiator - BPID"
  