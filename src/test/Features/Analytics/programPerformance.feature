Feature: Verify Program Performance Report

Scenario: Verify text on program overview report
  Given I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\PerformanceDashboard\\TableauTest.jmx"
  Given I am on the login page
  When I enter email field Qafivedashtest@yopmail.com for login
  And I enter password field Testing123 for Login
  Then I click Access button
  And I wait to see "Analytics" tile
  When I click on the "Analytics" tile
  And I click on "Performance Overview" dashboard
  And I switch to analytics iframe
  Then I verify "Program Performance" text is appearing inside dashboard
  Then I verify subtitle text "Evaluate program on key performance metrics and identify focus areas" is appearing inside dashboard
  Then I read the values from the text file "\\src\\test\\Jmeter\\PerformanceDashboard\\PerformanceDashboardResult.txt"
  And I set the time for starting date to claimscube date on dashboard and ending date to today date
  And I verify "EC Episodes" count matched with database value on the dashboard with picture resolution "500X500"
  Then I set the time from starting date as "1/1/2016" to ending date to claimscube date to validate claims episode data
  Then I select "Penn Presbyterian Medical Center - 2070-021" from "Episode Initiator - BPID" field and click on "Apply"
  And I verify "Savings Rate" data is matched with database value on dashboard with picture resolution "500X500"
  And I verify "Claims Episodes" count matched with database value on the dashboard with picture resolution "450X450"
  And I verify "Program Size" count matched with database value on dashboard for program size with picture resolution "300X300"
  And I verify "NPRA" count matched with database value on dashboard for npra with picture resolution "300X300"
  Then I set the time from starting date as "1/1/2017" and ending date to today date
  And I verify "%Discharge to SNF" count matched with database value on dashboard for discharge to snf with picture resolution "500X500"
  
  