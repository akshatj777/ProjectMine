Feature: Edit a Program

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
    And I verify "ID" header label under "Payor" view profile page
    And I verify "Program Name" header label under "Payor" view profile page
    And I verify the "Create New Program" button on view profile of "payor" Organization
    When I search with "<Program_Name>" on organization in search box
    And I click "<Program_Name>" field in search list on organization page
    And I verify "<Program_Name>" name on the header of view profile
    And I verify "Edit Program" header text on create organization page
    And I verify "*Program Name" field on create organization page
    And I verify the sub headline of "Attribution Rules"
    And I verify the sub headline of "Validate To"
    And I verify the "Multiple Bundle Episode" checkbox
    And I verify "Submit" button on create organization page
    And I verify "Cancel" button on create organization page

    Examples: 
      | Description                    | Payor_Name | Program_Name |
      | Search for a Program by the ID | PAYORNAME  | PROGRAMNAME  |
