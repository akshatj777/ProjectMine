Feature: EC Reports Verification

  Scenario Outline: User should see Model2 and Model3 filter under any report
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Patient ID" under reports tile text
    And I should see Reports Tile text as <Menu 1>
    When I click on the Reports Tile with text "<Menu 1>"
    Then I should see following Reports text for Patient ID reports
      | Episode DRG Issues |
    When I click on "Episode DRG Issues" reports text for "Patient ID" report tile
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Episode DRG Issues" is appearing inside the iframe
    And I wait until refresh button is disappeared
    Then I should see "Episode DRG Issues" in the Patient ID report page header
    When I click on field-panel-icon button
    When I click on show all filters icon button
    When I click to "Model" field filter under "Model" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Model" in the header text of filter page
    And I should see "2" in the filter value list
    And I click on "2" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    Then I verify "Model" filter is preselected under the filter
    Then I should see "Model includes 2" is present under preselected model filter

    Examples: 
      | email                          | Menu 1     |
      #| Medicare Payer Users|
      | shutestaug231132a@yopmail.com  | Patient ID |
      #| Multiple Payer Users|
      #| multipayerachrpfin@yopmail.com | Patient ID |
