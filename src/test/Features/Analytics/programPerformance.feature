Feature: Verify Program Performance Report

Scenario: Verify text on program overview report
  Given I execute the jmeter application and execute jmx file "\\src\\test\\jmeterjmx\\PerformanceDashboard\\TableauTest.jmx"
  Given I am on the login page
  When I enter email field qadashboardtest@yopmail.com for login
  And I enter password field Testing123 for Login
  Then I click Access button
  And I wait to see "Analytics" tile
  When I click on the "Analytics" tile
  And I click on "Performance Overview" dashboard
  And I switch to analytics iframe
  Then I verify "Program Performance" text is appearing inside dashboard
  Then I verify subtitle text "Evaluate program on key performance metrics and identify focus areas" is appearing inside dashboard
  And I set the time for starting date to "1/1/2018" on dashboard
  Then I read the values from the text file "\\src\\test\\jmeterjmx\\PerformanceDashboard\\PerformanceDashboardResult.txt"
  And I verify "EC Episodes" count matched with database value on the dashboard with picture resolution "300X300"
  Then I set the time from starting date as "1/1/2017" to ending date "12/31/2017" to validate claims episode data
  And I verify "Savings Rate" data is matched with database value on dashboard with picture resolution "1000X1000"
  And I verify "Claims Episodes" count matched with database value on the dashboard with picture resolution "450X450"
  