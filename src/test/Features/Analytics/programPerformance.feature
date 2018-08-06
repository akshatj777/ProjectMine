Feature: Verify Program Performance Dashboard

Scenario: Verify the functional test cases under program overview dashbaord
  Given I am on the login page
  When I enter incorrect "email" for analytics as "Qafivedashtest@yopmail" for login
  And I enter password field Testing123 for Login
  Then I click Access button
  Then I verify "Invalid" text is appearing when tried to login with invalid credentials
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
  And I verify "Episodes" is appearing for BAN section on the dashboard
  And I verify "Program Spend" is appearing for BAN section on the dashboard
  And I verify "NPRA" is appearing for BAN section on the dashboard
  Then I verify "Performing" legend is appearing on the program performance dashboard with picture resolution "300X300"
  Then I verify "Underperforming" legend is appearing on the program performance dashboard with picture resolution "300X300"
  Then I verify "Benchmark" legend is appearing on the program performance dashboard below underperforming with picture resolution "500X500"
  Then I verify "Savings Rate" section is appearing on the dashboard
  Then I verify %Discharge to SNF section is appearing on the dashboard
  Then I verify SNF days section is appearing on the dashbaord
  Then I verify %Episodes with a Readmission section is appearing on the dashboard
  And I verify the "% SNF Disch Benchmark Variance" section appearing on program performance dashboard
  And I verify the "SNF Days Benchmark Variance" section appearing on program performance dashboard
  And I verify the "Readmissions Benchmark Variance" section appearing on program performance dashboard
  Then I verify graph for "Savings Rate" is appearing on the program performance dashboard
  Then I verify graph for "% SNF Disch" is appearing on the program performance dashboard
  Then I verify graph for "SNF Days" is appearing on the program performance dashboard
  Then I verify graph for "Readmissions" is appearing on the program performance dashboard
  And I verify "% Discharge to SNF" title is appearing on the program performance dashboard
  And I verify "SNF Days" title is appearing on the program performance dashboard
  And I verify "% Episodes with a Readmission" title is appearing on the program performance dashboard

Scenario: Verify the mouse hovering text on the program performance dashbaord page
  Given I am on the login page
  When I enter incorrect "email" for analytics as "Qafivedashtest@yopmail" for login
  And I enter password field Testing123 for Login
  Then I click Access button
  Then I verify "Invalid" text is appearing when tried to login with invalid credentials
  Given I am on the login page
  When I enter email field Qafivedashtest@yopmail.com for login
  And I enter password field Testing123 for Login
  Then I click Access button
  And I wait to see "Analytics" tile
  When I click on the "Analytics" tile
  And I click on "Performance Overview" dashboard
  And I switch to analytics iframe
  Then I verify "Program Performance" text is appearing inside dashboard
  Then I validate the text appearing after mouse hovering on savings rate as "The Savings Rate (NPRA/Total Spend) was"
  Then I validate the text appearing after mouse hovering on discharge to SNF as "The Percent Discharge to SNF of was Below Benchmark (Adj Hist) of over total episodes."
  Then I validate the text appearing after mouse hovering on discharge to SNF benchmark value as "The Percent Discharge to SNF of was Below Benchmark (Adj Hist) of over total episodes."
  Then I validate the text appearing after mouse hovering on snf days as "The SNF Days of"
  Then I validate the text appearing after mouse hovering on snf days benchmark value as "The SNF Days of"
  And I verify "Adj Hist" is appearing in the tool tip text on the snf days metric value
  Then I validate the text appearing after mouse hovering on episodes with a readmission as "The Percent Episodes with a Readmission of was Below Benchmark (Adj Hist) of over total episodes."
  #Then I validate the text appearing after mouse hovering on episodes with a readmission benchmark value as "The Percent Episodes with a Readmission of was Below Benchmark (Adj Hist) of over total episodes."
  And I verify "Adj Hist" is appearing in the tool tip text on the episodes with a readmission value

Scenario: Verify the benchmark values are appearing on the dashbaord
  Given I am on the login page
  When I enter email field Qafivedashtest@yopmail.com for login
  And I enter password field Testing123 for Login
  Then I click Access button
  And I wait to see "Analytics" tile
  When I click on the "Analytics" tile
  And I click on "Performance Overview" dashboard
  And I switch to analytics iframe
  Then I verify "Program Performance" text is appearing inside dashboard
  And I verify "Benchmark" text is appearing below %Disch to SNF benchmark metric value with picture resolution "500X500"
  Then I verify ">" symbol is appearing beside benchmark text under %Disch to SNF metric field with picture resolution "700X700"
  And I verify "Benchmark" text is appearing below snf days benchmark metric value with pictur resolution "500X500"
  Then I verify ">" symbol is appearing beside benchmark text under snf days metric field with picture resolution "700X700"
  And I verify "Benchmark" text is appearing below episodes with a readmission metric value with picture resolution "500X500"
  Then I verify ">" symbol is appearing beside benchmark text under episodes with a readmission metric field with picture resolution "700X700"
  
Scenario:  Verift the metric value related text in program performance dashboard
  Given I am on the login page
  When I enter email field Qafivedashtest@yopmail.com for login
  And I enter password field Testing123 for Login
  Then I click Access button
  And I wait to see "Analytics" tile
  When I click on the "Analytics" tile
  And I click on "Performance Overview" dashboard
  And I switch to analytics iframe
  Then I verify "Program Performance" text is appearing inside dashboard
  And I verify "%Performance" text is appearing on %Disch to SNF metric field with picture resolution "500X500"
  And I verify "DaysPerformance" text is appearing on SNF Days metric field with picture resolution "500X500"
  And I verify "%Performance" text is appearing on episodes with a readmission metric field with picture resolution "500X500"

Scenario: Validate the filter fields on program overview dashbaord
  Given I am on the login page
  When I enter email field Qafivedashtest@yopmail.com for login
  And I enter password field Testing123 for Login
  Then I click Access button
  And I wait to see "Analytics" tile
  When I click on the "Analytics" tile
  And I click on "Performance Overview" dashboard
  And I switch to analytics iframe
  Then I verify "Program Performance" text is appearing inside dashboard
  And I verify "Episode Initiator - BPID" is appearing on the program performance dashboard
  And I verify "Anchor Facility - CCN" is appearing on the program performance dashboard
  And I verify "Bundle" is appearing on the program performance dashboard
  And I verify "Time" is appearing on the program performance dashboard
  And I verify "Remedy Region Market" is appearing on the program performance dashboard
  And I verify "Partner Region Market" is appearing on the program performance dashboard
  And I verify "Participant" is appearing on the program performance dashboard
  And I verify "DRG - Fracture" is appearing on the program performance dashboard
  And I verify "Physician - NPI" is appearing on the program performance dashboard
  And I verify "Model" is appearing on the program performance dashboard
  And I verify "Episode Length" is appearing on the program performance dashboard
  And I verify "Anchor Facility Detail" is appearing on the program performance dashboard
  Then I select "Penn Presbyterian Medical Center - 2070-021" from "Episode Initiator - BPID" field and click on "Apply"
  And I verify "Penn Presbyterian Medical Center - 390223" is selected in the filter field "Anchor Facility - CCN"

Scenario: Verify data metric validations on program overview dashbaord
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
  Then I read the values from the text file "\\src\\test\\Jmeter\\PerformanceDashboard\\PerformanceDashboardResult.txt"
  And I set the time for starting date to claimscube date on dashboard and ending date to today date
  Then I select "Penn Presbyterian Medical Center - 2070-021" from "Episode Initiator - BPID" field and click on "Apply"
  And I verify "EC Episodes" count matched with database value on the dashboard with picture resolution "500X500"
  Then I set the time from starting date as "1/1/2017" to ending date to claimscube date to validate claims episode data
  #Then I select "Penn Presbyterian Medical Center - 2070-021" from "Episode Initiator - BPID" field and click on "Apply"
  And I verify "Savings Rate" data is matched with database value on dashboard with picture resolution "600X600"
  And I verify "Claims Episodes" count matched with database value on the dashboard with picture resolution "500X500"
  And I verify "Program Size" count matched with database value on dashboard for program size with picture resolution "300X300"
  And I verify "NPRA" count matched with database value on dashboard for npra with picture resolution "300X300"
  #And I verify "SNF Days" count matched with database value on dashboard for snf days with picture resolution "700X700"
  Then I set the time from starting date as "1/1/2017" and ending date to today date
  And I verify "%Discharge to SNF" count matched with database value on dashboard for discharge to snf with picture resolution "700X700"
  And I verify "%Episodes with a Readmission" count matched with database value on dashboard for episodes with readmission with picture resolution "700X700"
  Then I set the time from starting date as "1/1/2017" to ending date to claimscube date to validate claims episode data
  And I verify "SNF Days" count matched with database value on dashboard for snf days with picture resolution "700X700"
