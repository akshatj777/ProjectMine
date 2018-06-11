Feature: Episode Connect Tasks

  Scenario Outline: User can navigate to episode connect Tasks

    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes

    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"
    Then I should see Notifications present on the top-nav bar present on the episode dashboard page
    When I click on Notification button present on the top-nav bar present on the episode dashboard page
    Then I should see all task button present on the notification drop down menu
    When I click on see all task button present on the notification drop down menu
    And I wait for 7000 milli seconds
    Then I should see Tasks present on the task overview page
    Then I should see Create a New Task button is present on the task overview page
    Then I should see My Tasks button is present on the task overview page
    Then I should see "pending" is present on the task overview page
    Then I should see "today" is present on the task overview page
    Then I should see "overdue" is present on the task overview page
    Then I should see "completed" is present on the task overview page

    Examples:

      | email                | password  |
      | qa.admin@yopmail.com | Episode1! |


  Scenario Outline: User can create a new task from the task overview page

    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes

    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"
    Then I should see Notifications present on the top-nav bar present on the episode dashboard page
    When I click on Notification button present on the top-nav bar present on the episode dashboard page
    When I click on see all task button present on the notification drop down menu
    And I wait for 7000 milli seconds
    Then I should see Tasks present on the task overview page
    When I click on Create a New Task button present on the task overview page
    Then I should see New Task present on the create new task task page
    Then I should see Create & Continue button present on the create new task task page
    Then I should see Cancel button present on the create new task task page

    And I wait for 2000 milli seconds
    When I click on calender icon present on the create new task task page
    And I select date from the calender present on the create new task task page
    Then I type "test description" as the task description present on the create new task task page
    When I click on Task Type present on the create new task task page
    And I select "Home with No Services" from the task type drop down list
    When I click on Priority present on the create new task task page
    And I select "High" from the Priority drop down list
    Then I click on the Patient Name present on the create new task task page
    And I Type "one" in the patient search box
    And I wait for 30000 milli seconds
    Then I select patient from the search list present on the create new task task page
    Then I click on the checkbox to assign the care team
    Then I click on the Create & Continue button present on the create new task task page
    And I wait for 5000 milli seconds

    Then I should see user profile icon on the episode dashboard page
    When I move the mouse to user profile icon
    And I wait for 3000 milli seconds
    And I click on return on remedy connect present on the user profile dropdown
    And I wait for 5000 milli seconds
    Then I should see user profile icon on product tile page
    Then I click on the user profile icon present on the product tile page
    And I click on Logout button present on the user profile drop down


    Examples:

      | email                | password  |
      | qa.admin@yopmail.com | Episode1! |