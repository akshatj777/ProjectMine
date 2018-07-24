Feature: Create Bundled Payment Contracts functionality tests

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
      | desc                       | participantId | name    | shortName | managingOrgId | ccn | ein | npi | locationId | locAddr1     | locAddr2     | locCity  | locState | locZip | locationName | locationType | marketId | regionId | address1 | address2 | city           | state | zip   | expPostCode | id | type     | errorMsg |
      | Create Hospital with MO    |               | ACHNAME | shortName | hasChild      | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | CA       |  10001 | Loc_Name     | [2,4,3],[5]  |        1 |        1 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |  0 | hospital |          |
      | Create Hospital without MO |               | ACHNAME | shortName |               | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | CA       |  10001 | Loc_Name     | [2,4,3],[5]  |        1 |        1 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |  0 | hospital |          |

  Scenario Outline: <desc>
    Given Build Json for PGP "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ein>" and "<npi>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<marketId>"
    When create pgp org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                                  | name    | shortName | managingOrgId | participantId | ein | npi | address1  | address2 | city           | state | zip   | marketId | expStatusCode | responseMsg | id | type |
      | Create PGP using API calls with MO    | PGPNAME | ShortName | hasChild      |               | EIN | NPI | Adderess1 | Address2 | AutomationCity | CA    | 10000 |        2 |           201 |             |  0 | pgp  |
      | Create PGP using API calls without MO | PGPNAME | ShortName |               |               | EIN | NPI | Adderess1 | Address2 | AutomationCity | CA    | 10000 |        2 |           201 |             |  0 | pgp  |

  Scenario Outline: <desc>
    Given Build Json and pass it to post method with SNF "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ccn>" and "<ein>" and "<npi>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<locationName>" and "<locationType>" and "<marketId>" and "<locAddr1>" and "<locAddr2>" and "<locCity>" and "<locState>" and "<locZip>" and "<locationId>"
    When create SNF org with this data "snf"
    Then verification of Actual vs expected results <expPostCode> and "<errorMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                                  | participantId | name    | shortName | managingOrgId | ccn | ein | npi | locationId | locAddr1     | locAddr2     | locCity  | locState | locZip | locationName | locationType    | marketId | regionId | address1 | address2 | city           | state | zip   | expPostCode | errorMsg | id | type |
      | Create SNF using API calls with MO    |               | SNFNAME | shortName | hasChild      | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | NY       |  10001 | Loc_Name     | [17,18,19],[17] |        1 |        1 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |          |  0 | snf  |
      | Create SNF using API calls without MO |               | SNFNAME | shortName |               | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | NY       |  10001 | Loc_Name     | [17,18,19],[17] |        1 |        1 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |          |  0 | snf  |

  Scenario Outline: <desc>
    Given Build Json for HHA "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ein>" and "<npi>" and "<ccn>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<marketId>"
    When create hha org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                  | name    | shortName | managingOrgId | participantId | ein | npi | ccn | address1 | address2 | city | state | zip   | marketId | regionId | expStatusCode | responseMsg | id | type |
      | Create HHA with MO    | HHANAME | ShortName | hasChild      |               | EIN | NPI | CCN | Address1 | Address2 | City | CA    | 10000 |        1 |        1 |           201 |             |  0 | hha  |
      | Create HHA without MO | HHANAME | ShortName |               |               | EIN | NPI | CCN | Address1 | Address2 | City | CA    | 10000 |        1 |        1 |           201 |             |  0 | hha  |

  Scenario Outline: Create Payor using API calls
    Given build Json for Payor "<name>" and "<participantId>" and "<tinEin>" and "<contactName>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create payor with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc         | participantId | name      | tinEin | contactName       | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type  |
      | Create Payor |               | PAYORNAME | EIN    | ContactPersonTest | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | payor |

  Scenario Outline: <desc>
    And build json for Program with attribution rules "<prgName>" and "<payorOrgId>" and "1" and "0" and "1" and "programID" and "<multipleBundleEpisodes>"
    When create program with this data
    Then verification of Actual vs expected results <expPrgStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                           | id | programID | prgName     | payorOrgId | expPrgStatusCode | responseMsg | name      | address1 | address2 | city | state | zip   | participantId | tinEin | contactName | contactEmail       | contactPhone | expDelCode | type    | multipleBundleEpisodes |
      | Create Program using API calls |  0 |           | PROGRAMNAME |            |              201 |             | PAYORNAME | Address1 | Address2 | City | CA    | 10000 |               | EIN    | ContactName | Sample@yopmail.com | 856-890-7890 |        204 | program | true                   |
      | Create Program using API calls |  0 |           | PROGRAMNAME |            |              201 |             | PAYORNAME | Address1 | Address2 | City | CA    | 10000 |               | EIN    | ContactName | Sample@yopmail.com | 856-890-7890 |        204 | program | true                   |
      | Create Program using API calls |  0 |           | PROGRAMNAME |            |              201 | true        | PAYORNAME | Address1 | Address2 | City | CA    | 10000 |               | EIN    | ContactName | Sample@yopmail.com | 856-890-7890 |        204 | program |                        |
      | Create Program using API calls |  0 |           | PROGRAMNAME |            |              201 |             | PAYORNAME | Address1 | Address2 | City | CA    | 10000 |               | EIN    | ContactName | Sample@yopmail.com | 856-890-7890 |        204 | program |                        |
      | Create Program using API calls |  0 |           | PROGRAMNAME |            |              201 |             | PAYORNAME | Address1 | Address2 | City | CA    | 10000 |               | EIN    | ContactName | Sample@yopmail.com | 856-890-7890 |        204 | program |                        |
      | Create Program using API calls |  0 |           | PROGRAMNAME |            |              201 |             | PAYORNAME | Address1 | Address2 | City | CA    | 10000 |               | EIN    | ContactName | Sample@yopmail.com | 856-890-7890 |        204 | program |                        |

  Scenario Outline: Create Bundle using API calls
    Given create Bundle Json to String and pass it to body with "<name>" and "<content>" and "<bundleCode>"
    When create Bundle with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id 0 and bundle

    Examples: 
      | desc        | bundleCode | name    | content                | expStatusCode | responseMsg |
      | validBundle | BC         | bundle- | create-bundle-content1 |           201 |             |
      | validBundle | BC         | bundle- | create-bundle-content1 |           201 |             |

  Scenario Outline: Verification of details on Contracts under Payor Organization
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "payor" Organization
    And I verify the "Create New Contract" button on view profile of "payor" Organization
    And I verify "Program" header label under "Payor" view profile page
    And I verify "Contract ID" header label under "Payor" view profile page
    And I verify "Organization Name" header label under "Payor" view profile page
    And I verify "Type" header label under "Payor" view profile page
    And I verify "Address" header label under "Payor" view profile page
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create Contracts page
    And I verify "*Program" dropdown box on create Contracts page
    And I verify "Bundle" dropdown box is appearing on "Create Contract" page
    And I verify "Contract 1 " on "Create Contract" page under Payor Organization
    And I verify "Contract Id" field on create Contracts page under Payor Organization
    And I verify "*Start Date" field for "Contract1" on create Contracts page
    And I verify "End Date" field for "Contract1" on create Contracts page
    And I verify "*Start Date" field for "Bundle1" on create Contracts page
    And I verify "End Date" field for "Bundle1" on create Contracts page
    And I verify "*Start Date" field for "Bundle_price1" on create Contracts page
    And I verify "End Date" field for "Bundle_price1" on create Contracts page
    And I verify "Baseline Start" field for "Baseline_Start_Date" on create Contracts page
    And I verify "Baseline End" field for "Baseline_End_Date" on create Contracts page
    And I verify "*Price" field on create Contracts page under Payor Organization
    And I verify "Trend Factor" field on create Contracts page under Payor Organization
    And I verify "Upper Bound" field on create Contracts page under Payor Organization
    And I verify "Lower Bound" field on create Contracts page under Payor Organization
    And I verify "Add Price" button on create organization page
    And I verify "Add Bundle" button on create organization page
    And I verify "+" button on create organization page
    And I verify "Submit" button on create organization page
    And I verify "Cancel" button on create organization page

    Examples: 
      | Description                                                   | Payor_Name | Program_Name |
      | Verification of details on Contracts under Payor Organization | PAYORNAME  | PROGRAMNAME  |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price>" in "price" field for "Bundle1 Price1" on create Contract page
    And I click on react date picker close icon for "Contract_Start_Date"
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
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                                      | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Bundle       | Price | Trend_Factor | Upper_Bound | Lower_Bound | ValidationMsg |
      | Validation message if Start Date is left blank- Contract Section | NO     | PAYORNAME  |                   | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |   123 |          121 |         135 |         106 | Required      |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price>" in "price" field for "Bundle1 Price1" on create Contract page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    And I click on react date picker close icon for "Bundle_Start_Date"
    Then I enter date "<BundleEndDate>" in "BundleEndDate" field for index "3"
    Then I enter date "<PriceStartDate>" in "PriceStartDate" field for index "4"
    Then I enter date "<PriceEndDate>" in "Baseline Date" field for index "5"
    Then I enter date "<BaselineStartDate>" in "BaselineStartDate" field for index "6"
    Then I enter date "<BaselineEndDate>" in "BaselineEndDate" field for index "7"
    And I enter "<Trend_Factor>" in "trendFactor" field for "Bundle1 Price1" on create Contract page
    And I enter "<Upper_Bound>" in "upperBound" field for "Bundle1 Price1" on create Contract page
    And I enter "<Lower_Bound>" in "lowerBound" field for "Bundle1 Price1" on create Contract page
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                                             | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Bundle       | Price | Trend_Factor | Upper_Bound | Lower_Bound | ValidationMsg |
      | Check validation message if Start Date is left blank for Bundle Section | NO     | PAYORNAME  | 2017/01/01        | 2019/12/31      |                 | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |   123 |          121 |         135 |         106 | Required      |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price>" in "price" field for "Bundle1 Price1" on create Contract page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    And I click on react date picker close icon for "Bundle Start Date"
    Then I enter date "<BundleEndDate>" in "BundleEndDate" field for index "3"
    Then I enter date "<PriceEndDate>" in "Baseline Date" field for index "5"
    And I click on react date picker close icon for "Bundle_Price_Start_Date"
    Then I enter date "<BaselineStartDate>" in "BaselineStartDate" field for index "6"
    Then I enter date "<BaselineEndDate>" in "BaselineEndDate" field for index "7"
    And I enter "<Trend_Factor>" in "trendFactor" field for "Bundle1 Price1" on create Contract page
    And I enter "<Upper_Bound>" in "upperBound" field for "Bundle1 Price1" on create Contract page
    And I enter "<Lower_Bound>" in "lowerBound" field for "Bundle1 Price1" on create Contract page
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                                                   | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Bundle       | Price | Trend_Factor | Upper_Bound | Lower_Bound | ValidationMsg |
      | Check validation message if Start Date is left blank for Bundle price Section | NO     | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    |                | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |   123 |          121 |         135 |         106 | Required      |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name>" for Contract "1" on "create" Contracts page
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
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                             | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Bundle       | Price | Trend_Factor | Upper_Bound | Lower_Bound | ValidationMsg                 |
      | Check validation message if Provider Name is left blank | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               |                   | FETCHFROMAPI |   123 |          121 |         135 |         106 | Please select an organization |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price>" in "price" field for "Bundle1 Price1" on create Contract page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                                                                             | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Bundle       | Price | Trend_Factor | Upper_Bound | Lower_Bound | ValidationMsg                                  |
      | Check validation message for Contract creation with Contract End Date is before the Contract Start Date | NO     | PAYORNAME  | 2017/01/05        | 2017/01/03      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |   123 |          121 |         135 |         106 | The Contract End Date is before the start date |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
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
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                                                                                     | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Bundle       | Price | Trend_Factor | Upper_Bound | Lower_Bound | ValidationMsg                                                   |
      | Check validation message if Program Name is left blank                                                          | NO     | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      |              | ACH               | ACHNAME           | FETCHFROMAPI |   123 |          121 |         135 |         106 | Please select a Program                                         |
      | Check validation message if Bundle Name is left blank                                                           | NO     | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           |              |   123 |          121 |         135 |         106 | Required                                                        |
      | Check validation message if Price field is left blank                                                           | NO     | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |       |          121 |         135 |         106 | Required                                                        |
      | Check validation message for contract creation with Bundle End Date is before the bundle Start Date             | NO     | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/02/24      | 2019/01/24    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |   123 |          121 |         135 |         106 | The bundle end date is before the bundle start date             |
      | Check validation message for Contract creation with Bundle Price End Date is before the Bundle Price Start Date | NO     | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/05/03     | 2019/04/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |       |          121 |         135 |         106 | The bundle price end date is before the bundle price start date |
      | Check validation message for contract creation with Bundle End Date is after Contract End Date                  | NO     | PAYORNAME  | 2017/01/01        | 2019/10/25      | 2019/01/01      | 2019/11/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |       |          121 |         135 |         106 | The bundle end date is after the contract end date              |
      | Check validation messages for contract creation with Bundle Price End Date is after Bundle End Date             | NO     | PAYORNAME  | 2017/01/01        | 2019/12/25      | 2019/01/01      | 2019/09/30    | 2019/03/03     | 2019/10/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |       |          121 |         135 |         106 | The bundle price end date is after the bundle end date          |
      | Check validation messages for contract creation with Bundle Start Date is before the Contract Start Date        | NO     | PAYORNAME  | 2017/03/01        | 2019/12/25      | 2017/02/21      | 2019/09/30    | 2019/03/03     | 2019/08/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |       |          121 |         135 |         106 | The bundle start date is before the contract start date         |
      | Check validation messages for contract creation with Bundle Price Start Date is before the Bundle Start Date    | NO     | PAYORNAME  | 2017/01/01        | 2019/12/25      | 2018/04/21      | 2019/09/30    | 2018/03/03     | 2019/08/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |       |          121 |         135 |         106 | The bundle price start date is before the bundle start date     |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price>" in "price" field for "Bundle1 Price1" on create Contract page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                                                                             | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Bundle       | Price | Trend_Factor | Upper_Bound | Lower_Bound | ValidationMsg                                  |
      | Check validation message for Contract creation with Contract End Date is before the Contract Start Date | NO     | PAYORNAME  | 2017/01/05        | 2017/01/03      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |   123 |          121 |         135 |         106 | The Contract End Date is before the start date |

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
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
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
    Then I verify duplicate "<Message>" after submitting the "create BPC" organization page

    Examples: 
      | Description                                                  | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Contract_Id | Bundle       | Price | Trend_Factor | Upper_Bound | Lower_Bound | Message                                                                                                                                      |
      | Validation message for invalid Character format- Contract Id | YES    | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | HHA               | HHANAME           | @$%G&*9!    | FETCHFROMAPI |   123 |          121 |         135 |         106 | Validation errors: Validation failed for contractId. Only alpha-numeric characters and dashes - are allowed and maximum character limit is 8 |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    Then I search "<SearchParam> - <Has_MO>" and verify with search list options on "Organization_Name" dropdown box

    Examples: 
      | Description                                                      | Has_MO | Payor_Name | Program_Name | Organization_Type | SearchParam |
      | Search for a Hospital organization by CCN                        | NO     | PAYORNAME  | PROGRAMNAME  | ACH               | CCN         |
      | Search for a Hospital organization by Hospital Organization Name | NO     | PAYORNAME  | PROGRAMNAME  | ACH               | ACHNAME     |
      | Search for a PGP organization by EIN                             | NO     | PAYORNAME  | PROGRAMNAME  | PGP               | PGPNAMEEIN  |
      | Search for a PGP organization by PGP Organization Name           | NO     | PAYORNAME  | PROGRAMNAME  | PGP               | PGPNAME     |
      | Search for a SNF organization by CCN                             | NO     | PAYORNAME  | PROGRAMNAME  | SNF               | SNFNAMECCN  |
      | Search for a SNF organization by SNF Organization Name           | NO     | PAYORNAME  | PROGRAMNAME  | SNF               | SNFNAME     |
      | Search for a HHA organization by CCN                             | NO     | PAYORNAME  | PROGRAMNAME  | HHA               | HHANAMECCN  |
      | Search for a HHA organization by HHA Organization Name           | NO     | PAYORNAME  | PROGRAMNAME  | HHA               | HHANAME     |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    Then I search "<SearchParam>" and verify with search list options on "Bundle" dropdown box

    Examples: 
      | Description                        | Has_MO | Payor_Name | Program_Name | Organization_Type | Organization_Name | SearchParam  |
      | Search for a Bundle by Bundle Name | NO     | PAYORNAME  | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |

  | Search for a Bundle by Bundle Code | NO     | PAYORNAME  | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPIForBundleID |
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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I click and search with invalid name on "<Organization_Name>" dropdown box
    Then I verify the "No results found" message for invalid search in Organization Name dropdown box

    Examples: 
      | Description                                  | Has_MO | Payor_Name | Program_Name | Organization_Type | Organization_Name             |
      | Error message for an invalid Provider search | NO     | PAYORNAME  | PROGRAMNAME  | ACH               | InvalidSearchOrganizationName |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I click and search with invalid name on "<Bundle1>" dropdown box
    Then I verify the "No results found" message for invalid search in Organization Name dropdown box

    Examples: 
      | Description                                | Has_MO | Payor_Name | Program_Name | Organization_Type | Organization_Name | Bundle1       |
      | Error message for an invalid Bundle search | NO     | PAYORNAME  | PROGRAMNAME  | ACH               | ACHNAME           | InvalidSearch |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
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
      | Description                                                                                                           | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Contract_Id     | Bundle       | Price | Trend_Factor | Upper_Bound | Lower_Bound | Message                       |
      | Create Contracts with all available fields using Hospital Organization                                                | NO     | PAYORNAME  | 2017/02/09        | 2019/12/19      | 2017/05/01      | 2019/07/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | CID             | FETCHFROMAPI |    96 |          121 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using Hospital Organization                                                | YES    | PAYORNAME  | 2017/01/15        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | CID             | FETCHFROMAPI |   103 |           91 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using PGP Organization                                                     | NO     | PAYORNAME  | 2017/01/16        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | PGP               | PGPNAME           | CID             | FETCHFROMAPI |   113 |          121 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using PGP Organization - Contract ID having Alphanumeric and "-" Character | YES    | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | PGP               | PGPNAME           | CID-            | FETCHFROMAPI |    56 |          121 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using SNF Organization                                                     | NO     | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | SNF               | SNFNAME           | CID             | FETCHFROMAPI |    73 |          121 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using SNF Organization                                                     | YES    | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | SNF               | SNFNAME           | CID             | FETCHFROMAPI |   123 |          121 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using HHA Organization                                                     | NO     | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | HHA               | HHANAME           | CID             | FETCHFROMAPI |    46 |          121 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using HHA Organization - Contract ID having All alphabets                  | YES    | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | HHA               | HHANAME           | AllAlphabetsCID | FETCHFROMAPI |    99 |          121 |         135 |         106 | Contract Successfully Created |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "2" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price>" in "price" field for "Bundle1 Price1" on create Contract page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<BundleStartDate>" in "BundleStartDate" field for index "2"
    Then I enter date "<PriceStartDate>" in "PriceStartDate" field for index "4"
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "Create Contracts" on Payor organization page

    Examples: 
      | Description                                                        | Has_MO | Payor_Name | ContractStartDate | BundleStartDate | PriceStartDate | Program_Name | Organization_Type | Organization_Name | Bundle       | Price | Message                       |
      | Create Contracts only Mandatory fields using Hospital Organization | NO     | PAYORNAME  | 2017/05/23        | 2018/07/24      | 2019/02/03     | PROGRAMNAME  | ACH               | ACHNAME           | FETCHFROMAPI |    89 | Contract Successfully Created |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price1>" in "price" field for "Bundle1 Price1" on create Contract page
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
    Then I click on "Add Bundle" button on "create" organization page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price2>" in "price" field for "Bundle2 Price1" on create Contract page
    Then I enter date "<BundleStartDate1>" in "BundleStartDate" field for index "8"
    Then I enter date "<BundleEndDate1>" in "BundleEndDate" field for index "9"
    Then I enter date "<PriceStartDate1>" in "PriceStartDate" field for index "10"
    Then I enter date "<PriceEndDate1>" in "Baseline Date" field for index "11"
    Then I enter date "<BaselineStartDate1>" in "BaselineStartDate" field for index "12"
    Then I enter date "<BaselineEndDate1>" in "BaselineEndDate" field for index "13"
    And I enter "<Trend_Factor1>" in "trendFactor" field for "Bundle2 Price1" on create Contract page
    And I enter "<Upper_Bound1>" in "upperBound" field for "Bundle2 Price1" on create Contract page
    And I enter "<Lower_Bound1>" in "lowerBound" field for "Bundle2 Price1" on create Contract page
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                                                  | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | BundleStartDate1 | BundleEndDate1 | PriceStartDate1 | PriceEndDate1 | BaselineStartDate1 | BaselineEndDate1 | Program_Name | Organization_Type | Organization_Name | Contract_Id | Bundle       | Bundle_2     | Price1 | Price2 | Trend_Factor | Upper_Bound | Lower_Bound | Trend_Factor1 | Upper_Bound1 | Lower_Bound1 | ValidationMsg                                |
      | Create contract using duplicate Bundles with overlapping dates in 1 contract | NO     | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2017/03/01      | 2018/03/30    | 2017/05/01     | 2017/08/30   | 2017/06/09        | 2017/07/12      | 2017/03/01       | 2018/03/30     | 2017/05/01      | 2017/08/30    | 2017/06/09         | 2017/07/12       | PROGRAMNAME  | ACH               | ACHNAME           | CID         | FETCHFROMAPI | FETCHFROMAPI |    113 |     96 |          121 |         135 |         106 |           121 |          135 |          106 | Bundle Date Range overlaps with other bundle |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
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
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                 | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Contract_Id   | Bundle       | Price | Trend_Factor | Upper_Bound | Lower_Bound | ValidationMsg     |
      | Create contract using duplicate Contract Id | NO     | PAYORNAME  | 2017/01/30        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | SNF               | SNFNAME           | Duplicate_CID | FETCHFROMAPI |   123 |          121 |         135 |         106 | ID already exists |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "1" Program name "<Program_Name>" in create Contract page under "Payor" Organization
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
    Then I verify duplicate "<Message>" after submitting the "create BPC" organization page

    Examples: 
      | Description                                                                                       | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Contract_Id | Bundle       | Price | Trend_Factor | Upper_Bound | Lower_Bound | Message                                                                                          |
      | Create contract using duplicate (Program+Provider+Bundle) combination with non-overlapping dates. | NO     | PAYORNAME  | 2020/01/31        | 2022/12/01      | 2021/01/02      | 2022/06/29    | 2021/03/02     | 2022/05/25   | 2022/03/09        | 2012/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | CID         | FETCHFROMAPI |   123 |          121 |         135 |         106 | There is a conflict error because an entity with similar identifying attributes already existed. |
      | Create contract using duplicate (Program+Provider+Bundle) combination with overlapping dates      | NO     | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | CID         | FETCHFROMAPI |   123 |          121 |         135 |         106 | There is a conflict error because an entity with similar identifying attributes already existed. |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "3" Program name "<Program_Name>" in create Contract page under "Payor" Organization
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
    Then I click on "Add Price" button on "create" organization page
    And I enter "<Price1>" in "price" field for "Bundle1 Price2" on create Contract page
    Then I enter date "<PriceStartDate1>" in "PriceStartDate" field for index "8"
    Then I enter date "<PriceEndDate1>" in "Baseline Date" field for index "9"
    Then I enter date "<BaselineStartDate1>" in "BaselineStartDate" field for index "10"
    Then I enter date "<BaselineEndDate1>" in "BaselineEndDate" field for index "11"
    And I enter "<Trend_Factor>" in "trendFactor" field for "Bundle1 Price2" on create Contract page
    And I enter "<Upper_Bound>" in "upperBound" field for "Bundle1 Price2" on create Contract page
    And I enter "<Lower_Bound>" in "lowerBound" field for "Bundle1 Price2" on create Contract page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "Create Contracts" on Payor organization page

    Examples: 
      | Description                                          | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | PriceStartDate1 | PriceEndDate1 | BaselineStartDate1 | BaselineEndDate1 | Program_Name | Organization_Type | Organization_Name | Contract_Id | Bundle       | Price | Price1 | Trend_Factor | Upper_Bound | Lower_Bound | Message                       |
      | Create contract with 1 Bundle having multiple Prices | NO     | PAYORNAME  | 2017/02/05        | 2019/12/28      | 2018/01/04      | 2019/06/21    | 2018/02/02     | 2018/05/30   | 2018/03/01        | 2018/04/04      | 2018/06/02      | 2018/10/30    | 2018/07/01         | 2018/08/08       | PROGRAMNAME  | ACH               | ACHNAME           | CID         | FETCHFROMAPI |   123 |    101 |          121 |         135 |         106 | Contract Successfully Created |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "4" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I enter "<Contract_Id>" in "Contract Id" field for "Contract1" on create Contract page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price1>" in "price" field for "Bundle1 Price1" on create Contract page
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
    And I enter "<Lower_Bound>" in "lowerBound" field for "Bundl1 Price1" on create Contract page
    Then I click on "Add Bundle" button on "create" organization page
    And I select "2" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price2>" in "price" field for "Bundle2 Price1" on create Contract page
    Then I enter date "<BundleStartDate1>" in "BundleStartDate" field for index "8"
    Then I enter date "<BundleEndDate1>" in "BundleEndDate" field for index "9"
    Then I enter date "<PriceStartDate1>" in "PriceStartDate" field for index "10"
    Then I enter date "<PriceEndDate1>" in "Baseline Date" field for index "11"
    Then I enter date "<BaselineStartDate1>" in "BaselineStartDate" field for index "12"
    Then I enter date "<BaselineEndDate1>" in "BaselineEndDate" field for index "13"
    And I enter "<Trend_Factor1>" in "trendFactor" field for "Bundle2 Price1" on create Contract page
    And I enter "<Upper_Bound1>" in "upperBound" field for "Bundle2 Price1" on create Contract page
    And I enter "<Lower_Bound1>" in "lowerBound" field for "Bundle2 Price1" on create Contract page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "Create Contracts" on Payor organization page

    Examples: 
      | Description                           | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | BundleStartDate1 | BundleEndDate1 | PriceStartDate1 | PriceEndDate1 | BaselineStartDate1 | BaselineEndDate1 | Program_Name | Organization_Type | Organization_Name | Contract_Id | Bundle       | Bundle_2     | Price1 | Price2 | Trend_Factor | Upper_Bound | Lower_Bound | Trend_Factor1 | Upper_Bound1 | Lower_Bound1 | Message                       |
      | Create contract with multiple Bundles | NO     | PAYORNAME  | 2017/01/02        | 2019/12/30      | 2017/03/04      | 2018/03/30    | 2017/05/01     | 2017/08/30   | 2017/06/09        | 2017/07/12      | 2018/05/01       | 2019/06/30     | 2018/08/03      | 2019/03/26    | 2018/11/09         | 2019/01/16       | PROGRAMNAME  | ACH               | ACHNAME           | CID         | FETCHFROMAPI | FETCHFROMAPI |    108 |     96 |          121 |         135 |         106 |            98 |          107 |           67 | Contract Successfully Created |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "4" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I enter "<Contract_Id>" in "Contract Id" field for "Contract1" on create Contract page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price1>" in "price" field for "Bundle1 Price1" on create Contract page
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
    And I enter "<Lower_Bound>" in "lowerBound" field for "Bundl1 Price1" on create Contract page
    Then I click on "Add Bundle" button on "create" organization page
    Then I click on "+" button on "create" organization page
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price1>" in "price" field for "Bundle1 Price1" on create Contract page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "8"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "9"
    Then I enter date "<BundleStartDate>" in "BundleStartDate" field for index "10"
    Then I enter date "<BundleEndDate>" in "BundleEndDate" field for index "11"
    Then I enter date "<PriceStartDate>" in "PriceStartDate" field for index "12"
    Then I enter date "<PriceEndDate>" in "Baseline Date" field for index "13"
    Then I enter date "<BaselineStartDate>" in "BaselineStartDate" field for index "14"
    Then I enter date "<BaselineEndDate>" in "BaselineEndDate" field for index "15"
    And I enter "<Trend_Factor>" in "trendFactor" field for "Bundle1 Price1" on create Contract page
    And I enter "<Upper_Bound>" in "upperBound" field for "Bundle1 Price1" on create Contract page
    And I enter "<Lower_Bound>" in "lowerBound" field for "Bundl1 Price1" on create Contract page
    Then I click on "Submit" button on "create" organization page

    Examples: 
      | Description                                      | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | BundleStartDate1 | BundleEndDate1 | PriceStartDate1 | PriceEndDate1 | BaselineStartDate1 | BaselineEndDate1 | Program_Name | Organization_Type | Organization_Name | Organization_Type1 | Organization_Name1 | Contract_Id | Bundle       | Bundle_2     | Price1 | Price2 | Trend_Factor | Upper_Bound | Lower_Bound | Trend_Factor1 | Upper_Bound1 | Lower_Bound1 | Message                       |
      | Create multiple contracts with duplicate Bundles | NO     | PAYORNAME  | 2017/01/02        | 2019/12/30      | 2017/03/04      | 2018/03/30    | 2017/05/01     | 2017/08/30   | 2017/06/09        | 2017/07/12      | 2018/05/01       | 2019/06/30     | 2018/08/03      | 2019/03/26    | 2018/11/09         | 2019/01/16       | PROGRAMNAME  | ACH               | ACHNAME           | PGP                | PGPNAME            | CID         | FETCHFROMAPI | FETCHFROMAPI |    108 |     96 |          121 |         135 |         106 |            98 |          107 |           67 | Contract Successfully Created |

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
    And I verify "Contracts" tab present under "Payor" Organization
    And I click on "Contracts" tab on view profile of "Payor" Organization
    And I verify the "Create New Contract" button on view profile of "Payor" Organization
    Then I click on "Create New Contract" button on "create" organization page
    And I verify "Create Contract" header text on create organization page
    And I select "5" Program name "<Program_Name>" in create Contract page under "Payor" Organization
    And I select Organization type "<Organization_Type>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I enter "<Contract_Id>" in "Contract Id" field for "Contract1" on create Contract page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price1>" in "price" field for "Bundle1 Price1" on create Contract page
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
    And I enter "<Lower_Bound>" in "lowerBound" field for "Bundl1 Price1" on create Contract page
    Then I click on "Add Bundle" button on "create" organization page
    And I select "2" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price2>" in "price" field for "Bundle2 Price1" on create Contract page
    Then I enter date "<BundleStartDate1>" in "BundleStartDate" field for index "8"
    Then I enter date "<BundleEndDate1>" in "BundleEndDate" field for index "9"
    Then I enter date "<PriceStartDate1>" in "PriceStartDate" field for index "10"
    Then I enter date "<PriceEndDate1>" in "Baseline Date" field for index "11"
    Then I enter date "<BaselineStartDate1>" in "BaselineStartDate" field for index "12"
    Then I enter date "<BaselineEndDate1>" in "BaselineEndDate" field for index "13"
    And I enter "<Trend_Factor1>" in "trendFactor" field for "Bundle2 Price1" on create Contract page
    And I enter "<Upper_Bound1>" in "upperBound" field for "Bundle2 Price1" on create Contract page
    And I enter "<Lower_Bound1>" in "lowerBound" field for "Bundle2 Price1" on create Contract page
    Then I click on "+" button on "create" organization page
    And I select Organization type "<Organization_Type1>" for Contract "1" on "create" Contracts page
    And I select Organization name "<Organization_Name1> - <Has_MO>" for Contract "1" on "create" Contracts page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price1>" in "price" field for "Bundle1 Price1" on create Contract page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "14"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "15"
    Then I enter date "<BundleStartDate>" in "BundleStartDate" field for index "16"
    Then I enter date "<BundleEndDate>" in "BundleEndDate" field for index "17"
    Then I enter date "<PriceStartDate>" in "PriceStartDate" field for index "18"
    Then I enter date "<PriceEndDate>" in "Baseline Date" field for index "19"
    Then I enter date "<BaselineStartDate>" in "BaselineStartDate" field for index "20"
    Then I enter date "<BaselineEndDate>" in "BaselineEndDate" field for index "21"
    And I enter "<Trend_Factor>" in "trendFactor" field for "Bundle1 Price1" on create Contract page
    And I enter "<Upper_Bound>" in "upperBound" field for "Bundle1 Price1" on create Contract page
    And I enter "<Lower_Bound>" in "lowerBound" field for "Bundl1 Price1" on create Contract page
    Then I click on "Add Bundle" button on "create" organization page
    And I select "2" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    And I enter "<Price2>" in "price" field for "Bundle2 Price1" on create Contract page
    Then I enter date "<BundleStartDate1>" in "BundleStartDate" field for index "22"
    Then I enter date "<BundleEndDate1>" in "BundleEndDate" field for index "23"
    Then I enter date "<PriceStartDate1>" in "PriceStartDate" field for index "24"
    Then I enter date "<PriceEndDate1>" in "Baseline Date" field for index "25"
    Then I enter date "<BaselineStartDate1>" in "BaselineStartDate" field for index "26"
    Then I enter date "<BaselineEndDate1>" in "BaselineEndDate" field for index "27"
    And I enter "<Trend_Factor1>" in "trendFactor" field for "Bundle2 Price1" on create Contract page
    And I enter "<Upper_Bound1>" in "upperBound" field for "Bundle2 Price1" on create Contract page
    And I enter "<Lower_Bound1>" in "lowerBound" field for "Bundle2 Price1" on create Contract page
    Then I click on "Submit" button on "create" organization page

    Examples: 
      | Description                                     | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | BundleStartDate1 | BundleEndDate1 | PriceStartDate1 | PriceEndDate1 | BaselineStartDate1 | BaselineEndDate1 | Program_Name | Organization_Type | Organization_Name | Organization_Type1 | Organization_Name1 | Contract_Id | Bundle       | Bundle_2     | Price1 | Price2 | Trend_Factor | Upper_Bound | Lower_Bound | Trend_Factor1 | Upper_Bound1 | Lower_Bound1 | Message                       |
      | Create multiple contracts with multiple Bundles | NO     | PAYORNAME  | 2017/01/02        | 2019/12/30      | 2017/03/04      | 2018/03/30    | 2017/05/01     | 2017/08/30   | 2017/06/09        | 2017/07/12      | 2018/05/01       | 2019/06/30     | 2018/08/03      | 2019/03/26    | 2018/11/09         | 2019/01/16       | PROGRAMNAME  | ACH               | ACHNAME           | PGP                | PGPNAME            | CID         | FETCHFROMAPI | FETCHFROMAPI |    108 |     96 |          121 |         135 |         106 |            98 |          107 |           67 | Contract Successfully Created |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type                                                |
      | MO, Hospital, PGP, SNF, HHA, Payor, Program, Bundle |
