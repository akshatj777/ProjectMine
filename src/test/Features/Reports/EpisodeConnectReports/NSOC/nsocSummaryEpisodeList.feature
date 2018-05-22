Feature: Episode List verification under next site of care summary report

  Scenario Outline: User should be able to see drill through under next site of care summary Report After clicking on any Episode number link
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
    Then I click on a number under episodes column
    Then I switch to new window
    And I wait for the elements to load in new window after clicking one of the episode
    Then I should verify "Participant" is appearing under Episodes table
    Then I should verify "Episode Initiator" is appearing under Episodes table
    Then I should verify "Bundle DRG Code" is appearing under Episodes table
    Then I should verify "Bundle DRG Status" is appearing under Episodes table
    Then I should verify "Bundle" is appearing under Episodes table
    Then I should verify "Anchor Hospital Admit Date" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Date" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Care Setting" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Care Type" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Care Setting Code (EC)" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Care Type Code (EC)" is appearing under Episodes table
    Then I should verify "Anchor Hospital Discharge Care Type Detail (EC)" is appearing under Episodes table
    Then I should verify "Anchor Month" is appearing under Episodes table

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |