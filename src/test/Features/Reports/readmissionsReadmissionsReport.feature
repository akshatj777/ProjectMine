Feature: Readmissions readmisisons

  Scenario Outline: Verify that readmissions with readmissions report display data based on provisioning
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait for 2000 milli seconds
    When I click on the "Reports" tile
    And I wait for 2000 milli seconds
    When I click on the Reports Tile with text "Readmissions"
    Then I click on "Readmissions" report text for Readmissions Reports 
    And I wait for 30000 milli seconds
    Then I should see "Report" in the reports header page
    When I switch to reports embedded iframe

    Then I should see Readmissions reports column Tile text as "Episode Initiator"
    Then I should see Readmissions reports column Tile text as "Anchor Facility"
    Then I should see Readmissions reports column Tile text as "Issue" 
	
    When I click on field-panel-icon button
    And I wait for 4000 milli seconds

		When I click to "Participant" field filter under "Episode Initiator" filter field
    And I wait for 2000 milli seconds
    And I choose "Filter" option from select options of filter field
    And I wait for 2000 milli seconds
    And I should see "Participant" in the header text of filter page
    And I should see "<participant>" in the filter value list
    And I click on "<participant>" in the filter value list
    And I click on add selected in the filter modal
    And I click on ok button from filter
    And I wait for 3000 milli seconds
    And I should see "<participant>" result in "Participant" field column for "Episode Initiator" filter field
    
    When I click to "Episode Initiator" field filter under "Episode Initiator" filter field
    And I wait for 2000 milli seconds
    And I choose "Filter" option from select options of filter field
    And I wait for 2000 milli seconds
    And I should see "Episode Initiator" in the header text of filter page
    And I should see "<episodeInitiator1>" in the filter value list
    And I click on "<episodeInitiator1>" in the filter value list
    And I click on add selected in the filter modal
    And I click on ok button from filter
    And I wait for 3000 milli seconds
    And I should see "<episodeInitiator1>" result in "Episode Initiator" field column for "Episode Initiator" filter field
    
    When I click to "Anchor Facility" field filter under "Anchor Facility" filter field
    And I wait for 2000 milli seconds
    And I choose "Filter" option from select options of filter field
    And I wait for 2000 milli seconds
    And I should see "Anchor Facility" in the header text of filter page
    And I should see "<anchorFacility1>" in the filter value list
    And I should see "<anchorFacility2>" in the filter value list
    And I click on "<anchorFacility1>" in the filter value list
    And I click on add selected in the filter modal
    And I click on ok button from filter
    And I wait for 3000 milli seconds
    And I should see "<anchorFacility2>" result in "Anchor Facility" field column for "Anchor Facility" filter field
		
		When I click to "CCN" field filter under "Anchor Facility" filter field
    And I wait for 2000 milli seconds
    And I choose "Filter" option from select options of filter field
    And I wait for 2000 milli seconds
    And I should see "CCN" in the header text of filter page
    And I should see "<ccn1>" in the filter value list
    And I click on "<ccn1>" in the filter value list
    And I click on add selected in the filter modal
    And I click on ok button from filter
    And I wait for 3000 milli seconds
    And I should see "<ccn1>" result in "CCN" field column for "Anchor Facility" filter field
		
		When I click to "Bundle" field filter under "Bundle" filter field
    And I wait for 2000 milli seconds
    And I choose "Filter" option from select options of filter field
    And I wait for 2000 milli seconds
    And I should see "Bundle" in the header text of filter page
    And I should see "Amputation" in the filter value list
    And I should see "Atherosclerosis" in the filter value list
    And I click on "Amputation" in the filter value list
    And I click on add selected in the filter modal
    And I click on ok button from filter
    And I wait for 3000 milli seconds
    And I should see "Amputation" result in "Bundle" field column for "Bundle" filter field
    
   
 	  When I click to "Episode Status" field filter under "Episode Status" filter field
    And I wait for 2000 milli seconds
    And I choose "Filter" option from select options of filter field
    And I wait for 2000 milli seconds
    And I should see "Episode Status" in the header text of filter page
    And I should see "<EpisodeStatus1>" in the filter value list
    And I should see "<EpisodeStatus2>" in the filter value list
    And I should see "<EpisodeStatus3>" in the filter value list
    And I should see "<EpisodeStatus4>" in the filter value list
    And I click on "<EpisodeStatus1>" in the filter value list
    And I click on add selected in the filter modal
    And I click on ok button from filter
    And I wait for 3000 milli seconds
    And I should see "<EpisodeStatus1>" result in "Episode Status" field column for "Episode Status" filter field
  
		When I click to "Issue" field filter under "Issue" filter field
    And I wait for 2000 milli seconds
    And I choose "Filter" option from select options of filter field
    And I wait for 2000 milli seconds
    And I should see "Issue" in the header text of filter page
    And I should see "<Issue1>" in the filter value list
    And I should see "<Issue2>" in the filter value list
    And I click on "<Issue1>" in the filter value list
    And I click on add selected in the filter modal
    And I click on ok button from filter
    And I wait for 3000 milli seconds
    And I should see "<Issue1>" result in "Issue" field column for "Issue" filter field
    
    When I click to "BPID" field filter under "Episode Initiator" filter field
    And I wait for 2000 milli seconds
    And I choose "Filter" option from select options of filter field
    And I wait for 2000 milli seconds
    And I should see "BPID" in the header text of filter page
    And I should see "<BPID1>" in the filter value list
    And I click on "<BPID1>" in the filter value list
    And I click on add selected in the filter modal
    And I click on ok button from filter
    And I wait for 3000 milli seconds
    And I should see "<BPID1>" result in "BPID" field column for "Episode Initiator" filter field
   
		
    When I switch to default window from iframe
    When I click on close reports cross icon on report page
    And I wait for 1000 milli seconds
    Then I verify current page "Reports" title
    
    
     Examples:
      | email                         | participant | anchorFacility1                		  | anchorFacility2                  | Anchor Admission Month      |	Level(Names, Categories, etc.)       |episodeInitiator1								  | ccn1   |BPID1			|EpisodeStatus1 | EpisodeStatus2 | EpisodeStatus3 | EpisodeStatus4 | Issue1				|		Issue2					|
      | shutestaug231132a@yopmail.com | Penn        | Upenn - Penn Presbyterian Hospital  | Upenn - Pennsylvania Hospital		 | Month    									 |	 Anchor Begin Date									 |Penn Presbyterian Medical Center  | 390223 |2070-021	|Active         | Completed      | Expired        | Pending        |NO FINAL DRG	|	NO WORKING DRG 		|