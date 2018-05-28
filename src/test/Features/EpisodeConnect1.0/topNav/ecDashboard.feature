Feature: Episode Connect dashboard

  Scenario Outline: User can navigate to episode connect dashboard

    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes

    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"

    Then I should see Alerts present on the top-nav bar present on the episode dashboard page
    Then I should see Messeges present on the top-nav bar present on the episode dashboard page
    Then I should see Notifications present on the top-nav bar present on the episode dashboard page
    Then I should see user profile present on the top-nav bar present on the episode dashboard page

    Then I should see "Dashboard" in the left navigator present on the episode dashboard page
    Then I should see "Bookmarks" in the left navigator present on the episode dashboard page
    Then I should see "Patients" in the left navigator present on the episode dashboard page
    Then I should see "Admin Center" in the left navigator present on the episode dashboard page
    Then I should see refresh button is present on the episode dashboard page

    Then I should see user profile icon on the episode dashboard page
    When I move the mouse to user profile icon
    And I click on return on remedy connect present on the user profile dropdown
    And I wait for 5000 milli seconds
    Then I should see user profile icon on product tile page
    Then I click on the user profile icon present on the product tile page
    And I click on Logout button present on the user profile drop down


    Examples:

      | email                | password  |
      | qa.admin@yopmail.com | Episode1! |
  
  
   
   
   
   
   