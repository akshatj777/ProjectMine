Feature: Patient list


  Scenario Outline: Create new patient for the user
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    Then I should see Tile text <Episode1>
    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"
    And I expand the Patients panel on Dashboard
    And I click on patientlist link
    Then I should see "Patients" on the patient list page
    And I click on the Add Patient Button
    Then I should see "Patient Information" on Add Patient window
    And I enter <FirstName> for Patient first Name
    And I enter <LastName> for Patient Last Name
    Then I enter <DateofBirth> for patient date of Birth
    Then I select "Male" for Gender
    And I search for <FicilitySearch> Admiting Facility
    And I Select the first facility
    And I enter "234567893A" for Medicare ID
    And I click on Submit Button
    Then I should see "No Patient Found" on next window
    And I click on Submit Button
    #Then I select an Admit Date

    Examples:
      | email                         | password | Episode1 | FirstName | LastName | DateofBirth | FicilitySearch | Admission Date |
      | shutestaug231132a@yopmail.com | Testing1 | Episodes | Patients  | Testing  | 12/01/1960  | upenn          | 05/16/2016     |