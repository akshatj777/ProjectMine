Feature: Verify Program Performance Report

Scenario: Verify the mouse over text on program overview report
  Given I am on Analytics Tableau login page
  And I wait till the visibility of "Username" field on login page
  Then I enter incorrect "Username" for analytics as "kprgmadm@yopmail" for login
  And I click on "signin" button on the analytics login page
  Then I verify "User account not found." "For help, contact your Tableau Server administrator." when i enter incorrect credentials
  Then I enter in "Username" field for analytics as "kremexec@yopmail.com" for login
  And I click on "signin" button on the analytics login page
  And I wait till the visibility of "Password" field on login page
  Then I enter in "Password" field for analytics as "Testing1" for login
  And I click on "signin" button on the analytics login page
  And I wait till the visibility of sections on the projects page
  Then I click on "qa" section on the projects page
  And I wait to see the visibility of workbooks on the workbooks page
  Then I click on "Performance Overview" dashboard on workbook page
  And I wait to see the visibility of dashboards on views page
  Then I click on "Program Performance" dashboard on views page
  And I switch to analytics iframe
  And I wait till the invisibility of loading spinner after clicking dashboard
  Then I verify "Program Performance" text is appearing inside dashboard
  Then I verify subtitle text "Evaluate program on key performance metrics and identify focus areas" is appearing inside dashboard
  And I verify "Episodes" is appearing for BAN section on the dashboard
  Then I verify "Episode" count section is appearing on the dashboard below "Episodes"
  And I verify Episodes count as "124,585" on the dashboard with picture resolution "300X300"
  And I verify "Program Size" is appearing for BAN section on the dashboard
  Then I verify "Program_size" count section is appearing on the dashboard below "Program Size"
  And I verify program size count as "$2,383,637,236" on the dashboard with picture resolution "300X300"
  And I verify "NPRA" is appearing for BAN section on the dashboard
  Then I verify "NPRA" count section is appearing on the dashboard below "NPRA"
  And I verify npra count as "$123,088,876" on the dashboard with picture resolution "300X300"
  Then I verify "% SNF Disch Current" section is appearing on the dashboard
  #And I verify Discharge to SNF count as "23.4%Performance" on the dashboard
  And I verify Discharge to SNF count as "23.4%Performance" on the dashboard with picture resolution "400X400"
  Then I verify "SNF Days Current" section is appearing on the dashboard
  And I verify SNF Days count as "35.5Performance" on the dashboard with picture resolution "300X300"
  Then I verify %Episodes with a Readmission section is appearing on the dashboard
  And I verify %Episodes with a Readmission count as "25.9%Performance" on the dashboard with picture resolution "400X400"
  And I verify blue colored text of Savings Rate as "5.2%SavingsRate" on dashboard with picture resolution "475X475"
  #And I verify legend "Performing" is appearing on the dashboard
  #Then I verify legend color of "Performing" as "Blue" with color code "#1D93BF"
  