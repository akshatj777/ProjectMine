Feature: Episode Connect Alerts

  Scenario Outline: User can navigate to episode connect Alerts

    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes

    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"
    Then I should see alerts icon present on the top-nav bar present on the episode dashboard page
    When I click on alerts icon present on the top-nav bar present on the episode dashboard page
    Then I should see See all alerts button present on the notification drop down menu
    Then I should see dismiss all button present on the notification drop down menu

    Examples:

      | email                | password  |
      | qa.admin@yopmail.com | Episode1! |


  Scenario Outline: User can dismiss all Alerts

    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes

    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"
    When I click on alerts icon present on the top-nav bar present on the episode dashboard page
    Then I click on dismiss all button present on the notification drop down menu

    Examples:

      | email                | password  |
      | qa.admin@yopmail.com | Episode1! |
   
   