Feature: Verification of Next Site of Care Detail EC Report

Scenario Outline: User should be able to select Participant and BPID of NSoc Detail Report
    
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    When I click on the "Reports" tile
    And I wait for 2000 milli seconds
    When I click on the Reports Tile with text "Next Site of Care"
    Then I click on "Next Site of Care Detail" report text for NSoC Reports 
    And I wait for 30000 milli seconds
    #Then I should see "Report" in the reports header page
    When I switch to reports embedded iframe
    
    When I click on filters toggle button
    And I wait for 2000 milli seconds
    
    Then I should see "Participant Exactly matches value of Prompt participant" is appearing under preselected filter
    Then I should see "IsAnchorAdmission = 1" is appearing under preselected filter
    Then I should see "AnchorDischargeDateKey Greater Than 0" is appearing under preselected filter
    Then I should see "Model Exactly matches 2" is appearing under preselected filter
    Then I should see "Anchor Admit Date On or after 2015-01-01" is appearing under preselected filter
    
    Then I should see Next Site of Care Detail reports column Tile text as "Participant"
    Then I should see Next Site of Care Detail reports column Tile text as "BPID"
    Then I should see Next Site of Care Detail reports column Tile text as "Episode Initiator"
    Then I should see Next Site of Care Detail reports column Tile text as "Anchor Admit CCN"
    Then I should see Next Site of Care Detail reports column Tile text as "Anchor Admit Facility"
    Then I should see Next Site of Care Detail reports column Tile text as "Anchor Admit Date"
    Then I should see Next Site of Care Detail reports column Tile text as "Medicare ID"
    Then I should see Next Site of Care Detail reports column Tile text as "Patient"
    Then I should see Next Site of Care Detail reports column Tile text as "DOB"
    Then I should see Next Site of Care Detail reports column Tile text as "Anchor Disch Date"
    Then I should see Next Site of Care Detail reports column Tile text as "Anchor Discharge Facility"
    Then I should see Next Site of Care Detail reports column Tile text as "Anchor Disch CCN"
    Then I should see Next Site of Care Detail reports column Tile text as "Anchor Disch Facility Type"
    Then I should see Next Site of Care Detail reports column Tile text as "NetworkTier"
    Then I should see Next Site of Care Detail reports column Tile text as "Model"
    Then I should see Next Site of Care Detail reports column Tile text as "Bundle"
    
    When I click on edit toggle button
    And I wait for 2000 milli seconds
    
    When I click on "Participant" field filter under Episode Initiator filter field
    And I wait for 2000 milli seconds
    And I Click on "Filter" option from select options of filter field
    And I wait for 3000 milli seconds
    And I select the radio button of select from list
    And I wait for 3000 milli seconds
    And I verify "<participant>" in the filter value list
    And I wait for 1000 milli seconds
    And I select "<participant>" in the filter value list
    And I wait for 1000 milli seconds
    And I click on "Add Selected" in the filter modal
    And I click "Ok" button from filter to select field
    And I wait for 3000 milli seconds
    
    When I click on "BPID" field filter under Episode Initiator filter field
    And I wait for 2000 milli seconds
    And I Click on "Filter" option from select options of filter field
    And I wait for 3000 milli seconds
    And I select the radio button of select from list
    And I wait for 3000 milli seconds
    And I verify "<BPID1>" in the filter value list
    And I wait for 1000 milli seconds
    And I select "<BPID1>" in the filter value list
    And I wait for 1000 milli seconds
    And I click on "Add Selected" in the filter modal
    And I click "Ok" button from filter to select field
    And I wait for 3000 milli seconds
    
    When I click on "Ancho Disch Month" field filter under Episode Initiator filter field
    And I Click on "Filter" option from select options of filter field
    And I select the radio button of select from list
    And I wait for 5000 milli seconds
    And I verify "<Month>" in the filter value list
    And I wait for 1000 milli seconds
    And I select "<Month>" in the filter value list
    And I wait for 1000 milli seconds
    And I click on "Add Selected" in the filter modal
    And I click "Ok" button from filter to select field
    And I wait for 5000 milli seconds
    
    Examples:
    
      | email                         | participant | BPID1   | Month |
      | shutestaug231132a@yopmail.com | Penn        | 2070-021| Dec   |