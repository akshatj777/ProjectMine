Feature: Episode connect 1 edit Episode

  Scenario Outline: User can navigate to patient overview page and edit an episode
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field <password> for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes
    And I click on the "Episodes" tile
    #And I switch to new window
    Then I should see Episode header text "Dashboard"

    When I click on "Patients" in the left navigator present on the episode dashboard page
    When I click on "Patient List" in the Patients dropdown menu
    And I wait for 10000 milli seconds
    Then I click on "custom" filter tab present on the patients page
    And I wait for 3000 milli seconds
    Then I enter <Patient Name> in the patient search box present on the patient page
    Then I click on search button present on the patients page
    And I wait for 20000 milli seconds
    Then I click on the patient name present on the patient list
    And I wait for 10000 milli seconds
    Then I click on edit button present on the patient overview page
    And I wait for 5000 milli seconds
    Then I should see "Edit Episode Initiator" button is present on the Edit Episode Initiator modal
    Then I should see "Cancel Episode" button is present on the Edit Episode Initiator modal
    Then I should see "Cancel" button is present on the Edit Episode Initiator modal
    When I click on the Episode Initiator dropdown present on the Edit Episode Initiator modal
    Then I should see "Unassigned" option is present on the Edit Episode Initiator modal
    Then I should see "Stamford - Stamford Hospital" option is present on the Edit Episode Initiator modal
    Then I should see "Non-Remedy Convener" option is present on the Edit Episode Initiator modal
    Then I click on the "Cancel" button present on the Edit Episode Initiator modal



    Examples:

      | email                | password  | Patient Name  |
      | qa.admin@yopmail.com | Episode1! | FirstNfbynigj |
    
    