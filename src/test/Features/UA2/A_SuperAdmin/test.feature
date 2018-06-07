Feature: gfkdmgd

  Scenario Outline: Error should not be shown on creating a user with both apostrophe(') and underscore(_) in email id, having remedy internal role and lessons enabled
    Given I am on the login page
    When I enter email field test.automatemail+WEmxYmlg@gmail.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    Then I enter Email "<Email>" with apostrophe and underscore to Create user
    And I enter Phone field with <Phone>
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    
    Then I click on Select button
    Then I verify Learning Pathway search box is available
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations for PTA user
    Then I click on Submit button
    Then I should see header text "Users"

    Examples: 
      | User                            | FirstName                            | LastName                                 | Email             | Phone | Role       | Applications      | NPI | LearningPathwaySearchParameter | Health System1 | Programs1   | Locations1                             |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastNameLastNameLastNameLastNameLastName | test.automatemail |       | Physicians | Lessons | NPI | Care Coordination External     | Covenant       | BPCI-Model3 | 3056-809--Courtyard Health Care Center |

  Scenario Outline: Error should not be shown on creating a user with both apostrophe(') and underscore(_) in email id, having remedy internal role and lessons enabled
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    Then I enter Email "<Email>" with apostrophe and underscore to Create user
    And I enter Phone field with <Phone>
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I verify Learning Pathway search box is available
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I verify the header "Permissions"
    #Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations for PTA user
    Then I click on Submit button
    Then I should see header text "Users"

    Examples: 
      | User                            | FirstName                            | LastName                                 | Email             | Phone | Role       | Applications      | NPI | LearningPathwaySearchParameter | Health System1 | Programs1   | Locations1                             |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastNameLastNameLastNameLastNameLastName | test.automatemail |       | Physicians | Lessons | NPI | Care Coordination External     | Covenant       | BPCI-Model3 | 3056-809--Courtyard Health Care Center |
