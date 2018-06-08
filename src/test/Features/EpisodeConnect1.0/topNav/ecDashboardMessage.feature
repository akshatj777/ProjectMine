Feature: Episode Connect Messages

  Scenario Outline: User can navigate to episode connect messages

    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes

    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"
    Then I should see message icon present on the top-nav bar present on the episode dashboard page
    When I click on message icon present on the top-nav bar present on the episode dashboard page

    Then I should see See all messages button present on the notification drop down menu
    When I click on See all messages button present on the notification drop down menu
    And I wait for 7000 milli seconds
    Then I should see Inbox present on the message overview page
    Then I should see Compose button is present on the message overview page
    Then I should see Inbox button is present on the message overview page
    Then I should see Sent button is present on the message overview page
    Then I should see Archive is present on the message overview page

    Examples:

      | email                | password  |
      | qa.admin@yopmail.com | Episode1! |

  Scenario Outline: User can send a message to archive

    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes

    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"
    When I click on message icon present on the top-nav bar present on the episode dashboard page
    When I click on See all messages button present on the notification drop down menu
    Then I click on gear icon present on the inbox page
    And I click on Move to archive present on the inbox page

    Then I click on the archive message present on the message page
    And I verify the message is present on the archive page

    Examples:

      | email                | password  |
      | qa.admin@yopmail.com | Episode1! |
      