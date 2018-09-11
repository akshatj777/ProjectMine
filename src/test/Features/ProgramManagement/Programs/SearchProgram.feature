Feature: Search a Program

  Scenario Outline: Create Payor using API calls
    Given build Json for Payor "<name>" and "<participantId>" and "<tinEin>" and "<contactName>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create payor with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc         | participantId | name      | tinEin | contactName       | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type  |
      | Create Payor |               | PAYORNAME | EIN    | ContactPersonTest | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | payor |

  Scenario Outline: <desc>
    And build json for Program with attribution rules "<prgName>" and "<payorOrgId>" and "<AttributionRankID>" and "<AttributionRankValue>" and "<noOfAttributionRulesForThisPrg>" and "<ValidationRankID>" and "<ValidationRankValue>" and "<noOfValidationRulesForThisPrg>" and "<multipleBundleEpisode>"
    When create program with this data
    Then verification of Actual vs expected results <expPrgStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc               | id | prgName     | payorOrgId | AttributionRankID | AttributionRankValue | noOfAttributionRulesForThisPrg | ValidationRankID | ValidationRankValue | noOfValidationRulesForThisPrg | expPrgStatusCode | multipleBundleEpisode | responseMsg | name        | expDelCode | type    |
      | CreateValidProgram |  0 | PROGRAMNAME |            |                 2 |                    1 |                              1 |                3 |                   2 |                             1 |              201 | false                 |             | PayorPrgOne |        204 | program |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    Then I search "<SearchParam>" and verify with search list options on "Programs" search box

    Examples: 
      | Description                              | Payor_Name | SearchParam |
      #| Search for a Program by the ID           | PAYORNAME  | ID          |
      | Search for a Program by the Program name | PAYORNAME  | PROGRAMNAME |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    Then I search with "<Program_Name>" on organization in search box
    And I verify "<Program_Name>" field in search list on organization page
    And I click "<Program_Name>" field in search list on organization page
    And I verify "Edit Program" header text on edit organization page
    And I edit "Program Name" field to "<Edited_Program_Name>" for organization
    Then I click on "Submit" button on "edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIFORProgramName" on Payor organization page
    Then I search with "<Edited_Program_Name>" on organization in search box
    And I verify "<Edited_Program_Name>" field in search list on organization page

    Examples: 
      | Description                           | Payor_Name | Program_Name | Edited_Program_Name | Message                      |
      | Search after editing the Program name | PAYORNAME  | PROGRAMNAME  | PROGRAMNAME         | Program Successfully Updated |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    Then I search "<SearchParam>" and verify with search list options on "Programs" search box
    Then I verify the "No matches" message for invalid search in Organization

    Examples: 
      | Description                             | Payor_Name | SearchParam              |
      | Error message if a Program is Not found | PAYORNAME  | InvalidSearchProgramName |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type           |
      | Payor, Program |
