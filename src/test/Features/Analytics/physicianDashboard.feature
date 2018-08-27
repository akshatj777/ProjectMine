Feature: Verify Physician Dashboard

  Scenario: Verify the functional test cases under Physician dashbaord
    Given I am on the login page
    When I enter incorrect "email" for analytics as "Qafivedashtest@yopmail" for login
    And I enter password field Testing123 for Login
    Then I click Access button
    Then I verify "Invalid" text is appearing when tried to login with invalid credentials
    Given I am on the login page
    When I enter email field Qafivedashtest@yopmail.com for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "Physician" dashboard
    And I switch to analytics iframe
    Then I verify "Physician Comparison" text is appearing inside dashboard
    Then I verify subtitle text "Analyze physician performance and identify key focus areas" is appearing inside dashboard
    And I verify "Episodes" is appearing for BAN section on the dashboard
    And I verify "Spend Per Episode" is appearing for BAN section on the dashboard
    And I verify "NPRA Per Episode" is appearing for BAN section on the dashboard
    Then I verify "Performing" legend is appearing on the "Physician" dashboard with picture resolution "300X300"
    Then I verify "Underperforming" legend is appearing on the "Physician" dashboard with picture resolution "300X300"
    Then I verify graph for "Physician Comparison by Volume" is appearing on the "Physician" dashboard

  Scenario: Verify the mouse hovering text on the Physician dashbaord page
    Given I am on the login page
    When I enter incorrect "email" for analytics as "Qafivedashtest@yopmail" for login
    And I enter password field Testing123 for Login
    Then I click Access button
    Then I verify "Invalid" text is appearing when tried to login with invalid credentials
    Given I am on the login page
    When I enter email field Qafivedashtest@yopmail.com for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "Physician" dashboard
    And I switch to analytics iframe
    Then I verify "Physician Comparison" text is appearing inside dashboard
    And I verify "Physician Comparison by Volume" Title is appearing on the "Physician" Dashboard
    And I verify "Episode Initiator - BPID: " Tool tip is appearing for Bar grapth on "Physician" Dashboard
    And I verify "Episodes: " Tool tip is appearing for Bar grapth on "Physician" Dashboard
    And I verify "Spend Per Episode: " Tool tip is appearing for Bar grapth on "Physician" Dashboard
    And I verify "NPRA Per Episode: " Tool tip is appearing for Bar grapth on "Physician" Dashboard
    And I verify "Click here to go to Physician Scorecard" Tool tip is appearing for Bar grapth on "Physician" Dashboard

  Scenario: Validate the filter fields on Physician dashbaord -Done
    Given I am on the login page
    When I enter email field Qafivedashtest@yopmail.com for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "Physician" dashboard
    And I switch to analytics iframe
    Then I verify "Physician Comparison" text is appearing inside dashboard
    And I verify "Physician - NPI" is appearing on the "Physician" dashboard
    And I verify "Episode Initiator - BPID" is appearing on the "Physician" dashboard
    And I verify "Anchor Facility - CCN" is appearing on the "Physician" dashboard
    And I verify "Bundle" is appearing on the "Physician" dashboard
    And I verify "Time" is appearing on the "Physician" dashboard
    And I verify "Remedy Region - Market" is appearing on the "Physician" dashboard
    And I verify "Partner Region - Market" is appearing on the "Physician" dashboard
    And I verify "Participant" is appearing on the "Physician" dashboard
    And I verify "DRG - Fracture" is appearing on the "Physician" dashboard
    Then I select "Penn Presbyterian Medical Center - 2070-021" from "Episode Initiator - BPID" field and click on "Apply"
    And I verify "Penn Presbyterian Medical Center - 390223" is selected in the filter field "Anchor Facility - CCN"

  Scenario: Verify data filter validations on Physician dashbaord
    Given I execute the jmeter application and execute jmx file "\\src\\test\\Jmeter\\PerformanceDashboard\\TableauTest.jmx"
    Given I am on the login page
    When I enter email field Qafivedashtest@yopmail.com for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "Physician" dashboard
    And I switch to analytics iframe
    And I click on Refresh DB data Icon On dashboard
    Then I verify "Physician Comparison" text is appearing inside dashboard
    Then I read the row filter values from the text file "\\src\\test\\Jmeter\\PerformanceDashboard\\PerformanceDashboardResult.txt"
    Then I set "Start Date" as "1/1/2017" in Date field on dashboard
    Then I set "End Date" as "Todays Date" in Date field on dashboard
    And I click "Episode Initiator - BPID" Filter on the "Physician" dashboard
    And I verify Episode Initiator BPID values with database value
    And I click "Episode Initiator - BPID" Filter on the "Physician" dashboard
    Then I select "Penn Presbyterian Medical Center - 2070-021" from "Episode Initiator - BPID" field and click on "Apply"
    And I click "Physician - NPI" Filter on the "Physician" dashboard
    And I verify Physician-NPI Data Filter values with database values for selected Episode Initiator BPID
    And I click "Physician - NPI" Filter on the "Physician" dashboard
    And I click "Episode Initiator - BPID" Filter on the "Physician" dashboard
    And I verify Episode Initiator BPID values with database value
    And I click "Episode Initiator - BPID" Filter on the "Physician" dashboard
    And I click "Anchor Facility - CCN" Filter on the "Physician" dashboard
    And I verify Facility name and ccn values with database values
    And I click "Anchor Facility - CCN" Filter on the "Physician" dashboard
    And I click "Bundle" Filter on the "Physician" dashboard
    And I verify bundle names at row level security with database values for selected Episode Initiator BPID
    And I click "Bundle" Filter on the "Physician" dashboard
    And I click "Remedy Region - Market" Filter on the "Physician" dashboard
    And I verify Remedy Region Market at row level security with database values for selected Episode Initiator BPID
    And I click "Remedy Region - Market" Filter on the "Physician" dashboard
    And I click "Partner Region - Market" Filter on the "Physician" dashboard
    And I verify Partner Region Market at row level security with database values for selected Episode Initiator BPID
    And I click "Partner Region - Market" Filter on the "Physician" dashboard
    And I click "Participant" Filter on the "Physician" dashboard
    And I verify Participant Data Filter values with database values for selected Episode Initiator BPID
    And I click "Participant" Filter on the "Physician" dashboard
    And I click "DRG - Fracture" Filter on the "Physician" dashboard
    And I verify DRG-Fracture Data Filter values with database values for selected Episode Initiator BPID
    And I click "DRG - Fracture" Filter on the "Physician" dashboard
