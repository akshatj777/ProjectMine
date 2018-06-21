Feature: Bulk Upload User from SA

  Scenario: Verification of fields on Bulk Upload Modal + Working of Hide and Cross button + error message for invalid input + previous summary msg
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I verify header text "Import Users"
    Then I verify availability of cross button
    Then I verify availability of Download Log button
    Then I verify availability of Try Again button
    Then I click on Try Again button
    Then I enter invalid user data
    Then I click on submit button on bulk user upload page
    Then I verify "1 user not added" error message
    Then I verify availability of Hide button
    When I click on Hide button
    Then I should see header text "Users"
    Then I click on Import User button
    Then I verify header text "Import Users"
    Then I verify previous result "1 user not added" on summary page
    Then I verify availability of Try Again button
    Then I click on Try Again button
    Then I click on Cross button
    Then I should see header text "Users"

  Scenario: Scenario to Create user with Invalid Data values
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter data with invalid values
    Then I click on submit button on bulk user upload page
    Then I verify "11 users not added" error message

  Scenario: Scenario to Create user with Invalid email
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter user data with full application access for "Partner Technical Administrator"
    Then I click on submit button on bulk user upload page
    Then I verify error message "Contains invalid characters"

  Scenario: Scenario to check validation message when multiple users with same email is imported
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter users with same email
    Then I click on submit button on bulk user upload page
    Then I verify "3 users not added" error message and "1 user added" success message

  Scenario: Scenario to check multiple success test cases at once
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter "50" users data for import
    Then I click on submit button on bulk user upload page
    Then I verify "49 users added" message

  Scenario: Scenario to check validation message when number of users entered exceed the limit
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter "51" users data for import
    Then I click on submit button on bulk user upload page
    Then I verify error message "You can only import up to 50 users at a time"

  Scenario: Scenario to Create user with with different sets of valid email and general information
    Given I am on the login page
    Then I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I click on Import User button
    Then I click on Try Again button
    Then I enter valid data set for general information
    Then I click on submit button on bulk user upload page
    Then I verify "7 users added" message

  Scenario Outline: <Description>
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for bulk user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify bulk email for "<User>-<Role>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"

    Examples: 
      | Description                                        | User        | UserName                               | Password | FirstName                                          | LastName                                           | Phone        | Role         | NPI |
      | View Executive user created from Super Admin user  | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameeFirstNameeFirstNameeFirstNameeFirstName' | LastNameeeLastNameeeLastNameeeLastNameeeLastNamee' |              | Executive    |     |
      | View Manager user created from Super Admin user    | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | ManagerFirstName                                   | ManagerLastName                                    | 987-654-5678 | Manager      |     |
      | View Case Manager user created from Super Admin    | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | CaseManagerFirstName                               | CaseManagerLastName                                | 987-980-0980 | Case Manager |     |
      | View Physicians user created from Super Admin user | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | PhysiciansFirstName                                | PhysiciansLastName                                 |              | Physicians   | NPI |
      | View Remedy TCS user created from Super Admin user | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | RTCSFirstName                                      | RTCSLastName                                       | 546-546-5655 | Remedy TCS   |     |
      | View Remedy LPN user created from Super Admin user | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | RLPNFirstName                                      | RLPNLastName                                       | 989-898-9898 | Remedy LPN   |     |
      | View Remedy RN user created from Super Admin user  | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | RRNFirstName                                       | RRNLastName                                        | 987-890-9878 | Remedy RN    |     |
