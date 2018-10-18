Feature: Readmission Dashboard

  @RowLevelSecurity @RLS
  Scenario Outline: Front end Data Filter Validation for Claims
    When I open file "\\src\\test\\Jmeter\\PerformanceDashboard\\ReadmissionRowFilterInput.csv" for writing data at "<Row>" to input file
    Given I am on the login page
    When I enter email field <User> for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "Performance Overview" dashboard
    And I switch to analytics iframe