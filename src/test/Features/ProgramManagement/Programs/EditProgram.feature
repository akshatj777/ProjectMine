Feature: Edit a Program

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <desc>
    Given Build Json and pass it to post method with "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ccn>" and "<ein>" and "<npi>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<locationName>" and "<locationType>" and "<marketId>" and "<locAddr1>" and "<locAddr2>" and "<locCity>" and "<locState>" and "<locZip>" and "<locationId>"
    When create org with this data "hospital"
    Then verification of Actual vs expected results <expPostCode> and "<errorMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                                       | participantId | name    | shortName | managingOrgId | ccn | ein | npi | locationId | locAddr1     | locAddr2     | locCity  | locState | locZip | locationName | locationType | marketId | regionId | address1 | address2 | city           | state | zip   | expPostCode | id | type     | errorMsg |
      | Create Hospital using API calls with MO    |               | ACHNAME | shortName | hasChild      | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | CA       |  10001 | Loc_Name     | [2,4,3],[5]  |        1 |        1 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |  0 | hospital |          |
      | Create Hospital using API calls without MO |               | ACHNAME | shortName |               | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | CA       |  10001 | Loc_Name     | [2,4,3],[5]  |        1 |        1 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |  0 | hospital |          |

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
      | CreateValidProgram |  0 | PROGRAMNAME |            |                 2 |                    1 |                              1 |                3 |                   2 |                             1 |              201 | true                  |             | PayorPrgOne |        204 | program |

  Scenario Outline: Create Bundle using API calls
    Given create Bundle Json to String and pass it to body with "<name>" and "<content>" and "<bundleCode>"
    When create Bundle with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id 0 and bundle

    Examples: 
      | desc        | bundleCode | name    | content                | expStatusCode | responseMsg |
      | validBundle | BC         | bundle- | create-bundle-content1 |           201 |             |

  Scenario Outline: <desc>
    Given build Json for Contract "<contractId>" and "<endDate>" and "<organizationId>" and "<programId>" and "<startDate>" and "<participatingBundleId>" and "<price>" and "<bundleStartDate>" and "<bundleEndDate>" and "<type>" and "<orgType>" and "<priceStartDate>" and "<priceEndDate>" and "<baseLineEndDate>" and "<baseLineStatDate>" and "<trendFactor>" and "<upperBound>" and "<lowerBound>"
    When create contract with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"

    Examples: 
      | desc                            | id | type          | orgType      | contractId | endDate      | organizationId | programId | startDate    | participatingBundleId | bundleStartDate | bundleEndDate | priceStartDate | priceEndDate | price | baseLineEndDate | baseLineStatDate | trendFactor | upperBound | lowerBound | expStatusCode | responseMsg |
      | Create Contract using API Calls |  0 | bundlePayment | hospitalNOMO | []         | [2019-12-19] |                |           | [2017-02-09] |                       | [2017-05-01]    | [2019-07-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |

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
    When I search with "<Program_Name>" on organization in search box
    And I click "<Program_Name>" field in search list on organization page
    And I verify "<Program_Name>" name on the header of view profile
    And I verify "Edit Program" header text on edit organization page
    And I verify "*Program Name" field on create organization page
    And I verify the sub headline of "Attribution Rules"
    And I verify "Attribute to the physician who has the highest claim allowed amount during the lookForward window" attribution rules on "edit" program page
    And I verify "Attribute to the physician who admitted the patient" attribution rules on "edit" program page
    And I verify "Attribute to the physician who has the highest claim allowed amount during the lookBack window" attribution rules on "edit" program page
    And I verify "Attribute to the triggering provider id on the triggering claim" attribution rules on "edit" program page
    And I verify "Attribute to the physician who has the most claims during the lookForward window" attribution rules on "edit" program page
    And I verify "Attribute to the attending physician on the triggering claim" attribution rules on "edit" program page
    And I verify "Attribute to the physician who discharged the patient from the trigger" attribution rules on "edit" program page
    And I verify "Attribute to the physician who has the most claims during the trigger window" attribution rules on "edit" program page
    And I verify "Attribute to the physician who has the highest claim allowed amount during the trigger window" attribution rules on "edit" program page
    And I verify "Attribute to the physician who bills the most E&M codes during the trigger window" attribution rules on "edit" program page
    And I verify "Attribute to the physician who has the most claims during the lookBack window" attribution rules on "edit" program page
    And I verify "Attribute to the operating physician on the triggering claim" attribution rules on "edit" program page
    And I verify the sub headline of "Validate To"
    And I verify "Bundle inclusions" validation ranks on "edit" program page
    And I verify "Bundle exclusion" validation ranks on "edit" program page
    And I verify "Earliest contract start date" validation ranks on "edit" program page
    And I verify "Earliest trigger from date" validation ranks on "edit" program page
    And I verify the "Multiple Bundle Episode" checkbox is not editable
    And I verify "Submit" button on edit organization page
    And I verify "Cancel" button on edit organization page

    Examples: 
      | Description                                 | Payor_Name | Program_Name |
      | Verify editable fields on edit program page | PAYORNAME  | PROGRAMNAME  |

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
    When I search with "<Program_Name>" on organization in search box
    And I click "<Program_Name>" field in search list on organization page
    And I verify "<Program_Name>" name on the header of view profile
    And I verify "Edit Program" header text on edit organization page
    And I edit "Program Name" field to "<Edited_Program_Name>" for organization
    And I click on checkbox for "Attribute to the attending physician on the triggering claim" Attribution rule
    Then I click on "Submit" button on "edit" organization page
    Then I verify duplicate "<Message>" after submitting the "edit Programs" organization page

    Examples: 
      | Description                                  | Payor_Name | Program_Name | Edited_Program_Name | Message                                                                 |
      | Check without Attribution rules on edit page | PAYORNAME  | PROGRAMNAME  | PROGRAMNAME         | Validation errors: Program requires at lease one Attribute Rule Ranking |

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
    When I search with "<Program_Name>" on organization in search box
    And I click "<Program_Name>" field in search list on organization page
    And I verify "<Program_Name>" name on the header of view profile
    And I verify "Edit Program" header text on edit organization page
    And I edit "Program Name" field to "<Edited_Program_Name>" for organization
    And I click on checkbox for "Bundle inclusions" Attribution rule
    Then I click on "Submit" button on "edit" organization page
    Then I verify duplicate "<Message>" after submitting the "edit Programs" organization page

    Examples: 
      | Description                                 | Payor_Name | Program_Name | Edited_Program_Name | Message                                                                  |
      | Check without validation ranks on edit page | PAYORNAME  | PROGRAMNAME  | PROGRAMNAME         | Validation errors: Program requires at lease one Validation Rule Ranking |

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
    When I search with "<Program_Name>" on organization in search box
    And I click "<Program_Name>" field in search list on organization page
    And I verify "<Program_Name>" name on the header of view profile
    And I verify "Edit Program" header text on edit organization page
    And I edit "Program Name" field to "<Edited_Program_Name>" for organization
    Then I click on "Submit" button on "edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIFORProgramName" on Payor organization page

    Examples: 
      | Description                                                              | Payor_Name | Program_Name | Edited_Program_Name  | Message                      |
      | Check Character Limit edge condition for Program Name field on edit page | PAYORNAME  | PROGRAMNAME  | equalsTo45Characters | Program Successfully Updated |
      | To check the Allowed characters for the available field on edit page     | PAYORNAME  | PROGRAMNAME  | AllowedCharatcters   | Program Successfully Updated |
      | Create Program under Payor Organization on edit page                     | PAYORNAME  | PROGRAMNAME  | PROGRAMNAME          | Program Successfully Updated |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    Then I search "<Edited_Program_Name>" and verify with search list options on "Bundle Payment Contract" search box
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    Then I verify the "<Edited_Program_Name>" on edit bundle payment contract page

    Examples: 
      | Description                                                                                   | Payor_Name | Program_Name | Edited_Program_Name | Bundle_Payment_Contract | Message                      |
      | Edit Program name and verify updated program name on view and edit of Bundle Payment Contarct | PAYORNAME  | PROGRAMNAME  | PROGRAMNAME         | PROGRAMNAME             | Program Successfully Updated |

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
    And I drag and drop the attribution rules in "edit" Program page
    Then I click on "Submit" button on "edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIFORProgramName" on Payor organization page

    Examples: 
      | Description                                        | Payor_Name | Program_Name | Edited_Program_Name | Message                      |
      | Edit Program using Drag and Drop attribution rules | PAYORNAME  | PROGRAMNAME  | PROGRAMNAME         | Program Successfully Updated |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type                                 |
      | MO, Payor, Program, Hospital, Bundle |
