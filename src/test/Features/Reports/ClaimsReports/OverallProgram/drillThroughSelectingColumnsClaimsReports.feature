Feature: Selecting columns in drill through for claims reports

  Scenario Outline: User should be able to click on drill through column in claims report and select the columns and verify
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
    Then I click on a number under episodes column
    Then I switch to new window
    And I wait for the elements to load in new window after clicking one of the episode
    Then I click on "Select Columns" appearing in the new window after clicking on drill through
    Then I switch to new window
    When I switch to reports embedded iframe
    Then I verify "Select Drill-Through Columns" title is appearing on popup after clicking select columns
    And I click on "Anchor Facility Type" checkbox under "Anchor Facility" in the popup of select drill through columns
    And I click on ok button after selecting drill through column
    Then I switch to new window
    And I wait for the elements to load in new window after clicking one of the episode
    Then I should verify "Anchor Facility Type" is appearing under Episodes table

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |
      | reptestachmodel2opsfin@yopmail.com |
