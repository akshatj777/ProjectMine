Feature: Verify Program Performance Report

Scenario: Verify the mouse over text on program overview report
  Given I am on Analytics Tableau login page
  Then I verify "Episode" count section is appearing on the dashboard below "Episodes"
  And I wait till the visibility of "Username" field on login page
  Then I enter incorrect "Username" for analytics as "kprgmadm@yopmail" for login
  And I click on "signin" button on the analytics login page
  Then I verify "User account not found." "For help, contact your Tableau Server administrator." when i enter incorrect credentials
  Then I enter in "Username" field for analytics as "kprgmadm@yopmail.com" for login
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
  #And I verify "Program Size" is appearing for BAN section on the dashboard
  #Then I verify "Program_size" count section is appearing on the dashboard below "Program Size"
  #And I verify "NPRA" is appearing for BAN section on the dashboard
  #Then I verify "NPRA" count section is appearing on the dashboard below "NPRA"
  #And I verify legend "Performing" is appearing on the dashboard
  #Then I verify legend color of "Performing" as "Blue" with color code "#1D93BF"
  