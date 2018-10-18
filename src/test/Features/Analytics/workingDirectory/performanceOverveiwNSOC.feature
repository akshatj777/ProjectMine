Feature: NSOC Dashboard

  @RowLevelSecurity @RLS
  Scenario Outline: Front end Data Filter Validation for Claims
    When I open file "\\src\\test\\Jmeter\\PerformanceDashboard\\NSOCRowFilterInput.csv" for writing data at "<Row>" to input file
    Given I am on the login page
    When I enter email field <User> for login
    And I enter password field Testing123 for Login
    Then I click Access button
    And I wait to see "Reporting" tile
    When I click on the "Reporting" tile
    And I click on "Performance Overview" dashboard
    And I switch to analytics iframe
    Then I click on "Click here to go to Next Site of Care Dashboard" tool tip under "% SNF Disch Benchmark Variance" on Performance overview dashboard
	  Then I verify "Next Site of Care" text is appearing inside dashboard
    
    Examples: 
      | User                    | Row | BPID        | CCN         | Bundle      | Remedy Region Market | Partner Region Market | Participant | DRG - Fracture | Physician - NPI | Model       |
      | AllModel123@yopmail.com |   1 | True Random | True Random | True Random | Skip                 | Skip                  | True Random | True Random    | True Random     | True Random |
