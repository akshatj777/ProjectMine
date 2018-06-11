Feature: Search a Bundle Payment Contract Functionality tests

  Background: 
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page

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
    And build json for Program with attribution rules "<prgName>" and "<payorOrgId>" and "cId" and "" and "0" and "programID"
    When create program with this data
    Then verification of Actual vs expected results <expPrgStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                           | id | programID | prgName     | payorOrgId | expPrgStatusCode | responseMsg | name      | address1 | address2 | city | state | zip   | participantId | tinEin | contactName | contactEmail       | contactPhone | expDelCode | type    |
      | Create Program using API calls |  0 |           | PROGRAMNAME |            |              201 |             | PAYORNAME | Address1 | Address2 | City | CA    | 10000 |               | EIN    | ContactName | Sample@yopmail.com | 856-890-7890 |        204 | program |

  Scenario Outline: Create Bundle using API calls
    Given create Bundle Json to String and pass it to body with "<name>" and "<content>" and "<bundleCode>"
    When create Bundle with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id 0 and bundle

    Examples: 
      | desc        | bundleCode | name    | content                | expStatusCode | responseMsg |
      | validBundle | BC         | bundle- | create-bundle-content1 |           201 |             |

  Scenario Outline: <Description>
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "<Program_Name>" Program name in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I enter "<Contract_Id>" in "Contract Id" field for "Contract1" on create Contract page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price>" in "price" field for "Bundle1 Price1" on create Contract page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I enter date "<BundleStartDate>" in "BundleStartDate" field for index "2"
    Then I enter date "<BundleEndDate>" in "BundleEndDate" field for index "3"
    Then I enter date "<PriceStartDate>" in "PriceStartDate" field for index "4"
    Then I enter date "<PriceEndDate>" in "Baseline Date" field for index "5"
    Then I enter date "<BaselineStartDate>" in "BaselineStartDate" field for index "6"
    Then I enter date "<BaselineEndDate>" in "BaselineEndDate" field for index "7"
    And I enter "<Trend_Factor>" in "trendFactor" field for "Bundle1 Price1" on create Contract page
    And I enter "<Upper_Bound>" in "upperBound" field for "Bundle1 Price1" on create Contract page
    And I enter "<Lower_Bound>" in "lowerBound" field for "Bundle1 Price1" on create Contract page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "Create Contracts" on Payor organization page

    Examples: 
      | Description                                                            | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Contract_Id | Bundle       | Price | Trend_Factor | Upper_Bound | Lower_Bound | Message                       |
      | Create Contracts with all available fields using Hospital Organization | NO     | PAYORNAME  | 2017/01/09        | 2019/12/19      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | CID         | FETCHFROMAPI |   123 |          121 |         135 |         106 | Contract Successfully Created |

  Scenario Outline: <Description>
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    Then I search "<SearchParam>" and verify with search list options on "Bundle Payment Contract" search box

    Examples: 
      | Description                                | Payor_Name | SearchParam |
      | Search for a Contract by Program Name      | PAYORNAME  | PROGRAMNAME |
      | Search for a Contract by Contract ID       | PAYORNAME  | CID         |
      | Search for a Contract by Organization Name | PAYORNAME  | ACHNAME     |
      | Search for a Contract by Provider Type     | PAYORNAME  | ACH         |
      | Search for a Contract by  Address          | PAYORNAME  | Address1    |

  Scenario Outline: <Description>
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    Then I search "<SearchParam>" and verify with search list options on "Programs" search box
    Then I verify the "No matches" message for invalid search in Organization

    Examples: 
      | Description                             | Payor_Name | SearchParam               |
      | Error message if a Program is Not found | PAYORNAME  | InvalidSearchContractName |
