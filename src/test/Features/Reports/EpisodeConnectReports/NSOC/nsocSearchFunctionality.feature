Feature: Verification of anchor facility filter in next site of care summary report

  Scenario Outline: User should be able to able to see Mt. Carmel anchor facility after selecting particular admission month to sound participant user
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Next Site of Care" under reports tile text
    When I click on the Reports Tile with text "Next Site of Care"
    Then I click on "Next Site of Care Summary" report text for NSoC Reports
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    And I will wait to see "Next Site Of Care Summary" is appearing inside the iframe
    And I wait until refresh button is disappeared
    When I click on show all filters icon button
    Then I remove "Anchor Month" field filter under "Anchor Month" filter field from default filters
    Then I remove "anchor Discharge Date Key" field filter under "anchor Discharge Date Key" filter field from default filters
    And I wait until refresh button is disappeared
    When I click on show all filters icon button
    When I click on field-panel-icon button
    When I click to "Anchor Hospital Admission Month" field filter under "Anchor Hospital Admit Date" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Hospital Admission Month" in the header text of filter page
    When I click on select from list option on the filter page
    And I should see "<admission month1>" in the filter value list
    And I click on "<admission month1>" in the filter value list
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<admission month1>" result in "Anchor Hospital Admission Month" field column for "Anchor Hospital Admit Date" filter field
    When I click to "Anchor Hospital Facility" field filter under "Anchor Hospital Facility" filter field
    And I choose "Filter" option from select options of filter field
    And I should see "Anchor Hospital Facility" in the header text of filter page
    And I should see "<anchorFacility1>" in the filter value list
    And I click on "<anchorFacility1>" in the filter value list for anchor hospital facility
    And I click on add selected in the filter model
    And I click on ok button from filter
    And I wait until refresh button is disappeared
    And I should see "<anchorFacility1>" result in "Anchor Hospital Facility" field column for "Anchor Hospital Facility" filter field
    When I switch to default window from iframe
    When I click on reports tab appearing on reports page
    And I wait to see "Next Site of Care" under reports tile text
    Then I verify current page "Reports" title

    Examples: 
      | email                | admission month1 | anchorFacility1        |
      | exe20jun@Yopmail.com | 2018-03          | Mt. Carmel - St. Ann's |
