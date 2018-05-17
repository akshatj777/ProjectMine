Feature: Verification of DOB Date format for Claims Reports

  Scenario Outline: User should be able to verify YYYY-MM-DD format for DOB field column for Claims Reports
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Overall Program" under reports tile text
    When I click on the Reports Tile with text "Overall Program"
    Then I click on "Performance (Claims)" report text for Overall Program Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Performance" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on field-panel-icon button
    When I click to "DOB" field filter under "Patient Detail" filter field
    And I choose add to report option from select options of filter field
    And I wait until refresh button is disappeared
    Then I verify the DOB column format is in yyyy-MM-dd for "Patient Detail"
    When I switch to default window from iframe
    When I click on reports tab appearing on reports page
    And I wait to see "Overall Program" under reports tile text
    Then I verify current page "Reports" title

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |
      | reptestachmodel2opsfin@yopmail.com |
