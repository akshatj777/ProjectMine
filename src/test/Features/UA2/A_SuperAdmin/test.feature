Feature: gjdkfj

  Scenario Outline: Validating that Error is getting displayed on searching any downstream provider location less than 5 alphabets and clicking on pagination on creating/editing Downstream Provider role
    Given I am on the login page
    When I enter email field <UserName> for login
    And I enter password field <Password> for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I enter Email "<Email>" to Create user
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I search "<Locations>" locations for Downstream Provider role
    Then I click on > to navigate to next page
    Then I should not see any error message on searching any downstream provider location less than 5 alphabets

    Examples: 
      | Description                                                               | User        | UserName                               | Password | FirstName                                 | LastName | Email             | Role                | Applications | ApplicationsNotVisible                                   | NPI | LearningPathwaySearchParameter | Locations |
      | Login with Super Admin User and create user with Downstream Provider role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | test.automatemail | Downstream Provider | Episodes     | Administration, Physician Connect, TCI, Reports, Lessons |     |                                | Bap       |
