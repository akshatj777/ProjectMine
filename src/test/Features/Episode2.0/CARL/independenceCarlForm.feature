Feature: To verify the options and functionality of Independence section of Carl form

Scenario Outline: To verify the Independence section of the Carl Form
    Given I am on the login page
    When I enter email field qa.emblemrn@yopmail.com for login
    And I enter password field Episode1! for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    Then I should see Tile text Episodes 2.0
    When I click on the "Episodes 2.0" tile
    And I wait for 4000 milli seconds
    Then I verify current page "Remedy Partners" title
    Then I click on the ALL Tab on Patient page
    And I wait for 10000 milli seconds
    Then I should see search box appearing on the patients page
    Then I enter "<Last name>" in the search box on the patients page
    And I wait for 20000 milli seconds
    Then I click on the "<Last name>" searched patient which has the CARL text in it
    And I wait for 20000 milli seconds
    Then I verify CARL buttons appears on the patient summary
    Then I click on the complete CARL on the Patient Summary
    And I wait for 10000 milli seconds
    Then I Verify that Clicking on Complete CARL button Carl form should appear as a takeover page
    And I wait for 4000 milli seconds
    Then I click on "Independence" section on left navigator
    And I wait for 2000 milli seconds
    And I verify the "Independence" section of the carl form upon clicking on it
    Then I verify that "Independence" section on carl form should be highlighted in left navigator upon clicking
    Then I verify "Cognitive Status" dropdown bar should appear on Independence section
    Then I verify "Activities of Daily Living" dropdown bar should appear on Independence section
    Then I verify "Ambulatory Status" dropdown bar should appear on Independence section
    Then I verify "Does the patient have a history of falls?" question appears on Independence section
    And I wait for 2000 milli seconds
    Then I verify "Yes" option should appear below Does the patient have a history of falls on Independece section
    Then I verify "No" option should appear below Does the patient have a history of falls on Independece section
    Then I verify "Not Sure" option should appear below Does the patient have a history of falls on Independece section 
    Then I Verify that Carl form should appear with Save & Go Back link
    Then I Verify that Carl form should appear with Save & Continue link
    
    Examples: 
      | First name | Last name  |
      | AUTOMATION | DO_NOT_USE |
    