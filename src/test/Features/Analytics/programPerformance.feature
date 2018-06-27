Feature: Verify Program Performance Report

Scenario: Verify text on program overview report
  Given I am on Analytics Tableau login page
  Then I enter in "Username" field for analytics as "kremexec@yopmail.com" for login
  And I click on "signin" button on the analytics login page
  Then I enter in "Password" field for analytics as "Testing1" for login
  And I click on "signin" button on the analytics login page
  Then I click on "qa" section on the projects page
  Then I click on "Performance Overview" dashboard on workbook page
  Then I click on "Program Performance" dashboard on views page
  And I switch to analytics iframe
  Then I verify "Program Performance" text is appearing inside dashboard
  Then I verify subtitle text "Evaluate program on key performance metrics and identify focus areas" is appearing inside dashboard
  And I verify Episodes count as "124,585" on the dashboard with picture resolution "300X300"
  And I verify program size count as "$2,383,637,236" on the dashboard with picture resolution "300X300"
  And I verify npra count as "$123,088,876" on the dashboard with picture resolution "300X300"
  And I verify Discharge to SNF count as "23.4%Performance" on the dashboard with picture resolution "400X400"
  And I verify SNF Days count as "35.5Performance" on the dashboard with picture resolution "300X300"
  And I verify %Episodes with a Readmission count as "25.9%Performance" on the dashboard with picture resolution "400X400"
  And I verify blue colored text of Savings Rate as "5.2%SavingsRate" on dashboard with picture resolution "1000X1000"
  And I verify blue colored text of SNF Discharge Benchmark variance as "1.7%BelowBenchmark>" on dashboard with picture resolution "1000X1000"
  And I verify blue colored text of Readmissions Benchmark Variance as "6.2%BelowBenchmark>" on dashboard with picture resolution "1000X1000"
  