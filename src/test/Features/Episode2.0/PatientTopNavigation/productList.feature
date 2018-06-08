Feature: Episode 2.0 Product List

Scenario Outline: User should be able to redirect to any product in the list from product icon

Given I am on the login page
    When I enter email field qa.admin@yopmail.com for login
    And I enter password field Episode1! for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes 2.0
    
    When I click on the "Episodes 2.0" tile
    And I wait for 25000 milli seconds
    Then I verify current page "Remedy Partners" title
    
    And I should see product list icon is appearing on the top left of the episodes page
    Then I click on product list icon appearing on the top left of the episodes page
    And I wait for 3000 milli seconds
    Then I select <Episode1> option from the dropdown
    #And I switch to new window
    And I wait for 10000 milli seconds
    Then I should see Episode header text "Dashboard"
    
    Examples:
    
    | Episode1 |
    | Episodes |
     
