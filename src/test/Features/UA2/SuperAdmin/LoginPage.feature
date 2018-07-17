Feature: User admin Login Logout test

  Scenario: UI verification of Login page
    Given I am on the login page
    And I should see Log in widget
    Then I should see email textbox field
    Then I should verify watermark text appearing under email textbox field
    Then I should see password textbox field
    Then I should verify watermark text appearing under password textbox field
    Then I should see forgot password link
    Then I should see Log In button

  Scenario Outline: Login with valid credentials
    Given I am on the login page
    And I should see Log in widget
    When I enter email field <Email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    Then I click on "Log Out" button again

    Examples: 
      | Email                                  |
      | lbarinstein+qaadmin@remedypartners.com |

  Scenario: Login with blank email and password and verify the validation message
    Given I am on the login page
    And I should see Log in widget
    Then I click Access button
    Then I verify the validation message "Can't be blank"

  Scenario: Login with blank email or password and verify the validation message
    Given I am on the login page
    And I should see Log in widget
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I verify the validation message "Can't be blank"
    Then I refresh the page
    Then I enter email "lbarinstein+qaadmin@remedypartners.com " for Login
    Then I click Access button
    Then I verify the validation message "Can't be blank"

  Scenario: Login with valid email and invalid password and verify the error message
    Given I am on the login page
    And I should see Log in widget
    Then I enter email "lbarinstein+qaadmin@remedypartners.com " for Login
    And I enter password field Testing8 for Login
    Then I click Access button
    Then I verify the error message "WRONG EMAIL OR PASSWORD."
