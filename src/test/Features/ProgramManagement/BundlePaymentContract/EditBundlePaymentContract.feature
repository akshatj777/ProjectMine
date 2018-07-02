Feature: Edit Bundle Payment Contract functionality tests

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

  Scenario Outline: <desc>
    Given Build Json for PGP "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ein>" and "<npi>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<marketId>"
    When create pgp org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                                  | name    | shortName | managingOrgId | participantId | ein | npi | address1  | address2 | city           | state | zip   | marketId | expStatusCode | responseMsg | id | type |
      | Create PGP using API calls with MO    | PGPNAME | ShortName | hasChild      |               | EIN | NPI | Adderess1 | Address2 | AutomationCity | CA    | 10000 |        2 |           201 |             |  0 | pgp  |
      | Create PGP using API calls without MO | PGPNAME | ShortName |               |               | EIN | NPI | Adderess1 | Address2 | AutomationCity | CA    | 10000 |        2 |           201 |             |  0 | pgp  |

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
      | validBundle | BC         | bundle- | create-bundle-content1 |           201 |             |

  Scenario Outline: <desc>
    Given build Json for Contract "<contractId>" and "<endDate>" and "<organizationId>" and "<programId>" and "<startDate>" and "<participatingBundleId>" and "<price>" and "<bundleStartDate>" and "<bundleEndDate>" and "<type>" and "<orgType>" and "<priceStartDate>" and "<priceEndDate>" and "<baseLineEndDate>" and "<baseLineStatDate>" and "<trendFactor>" and "<upperBound>" and "<lowerBound>"
    When create contract with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"

    Examples: 
      | desc                            | id | type          | orgType      | contractId | endDate      | organizationId | programId | startDate    | participatingBundleId | bundleStartDate | bundleEndDate | priceStartDate | priceEndDate | price | baseLineEndDate | baseLineStatDate | trendFactor | upperBound | lowerBound | expStatusCode | responseMsg |
      | Create Contract using API Calls |  0 | bundlePayment | hospital     | []         | [2019-12-31] |                |           | [2017-01-16] |                       | [2017-05-01]    | [2019-07-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |
      | Create Contract using API Calls |  0 | bundlePayment | hospitalNOMO | []         | [2019-12-30] |                |           | [2017-01-15] |                       | [2019-01-01]    | [2019-06-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |
      | Create Contract using API Calls |  0 | bundlePayment | pgp          | []         | [2019-12-19] |                |           | [2017-02-09] |                       | [2017-05-01]    | [2019-07-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |
      | Create Contract using API Calls |  0 | bundlePayment | pgpNOMO      | []         | [2019-12-19] |                |           | [2017-02-09] |                       | [2017-05-01]    | [2019-07-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    Then I verify program "<Program>" dropdown box is not editable
    Then I verify "<Organization_Type>" dropdown box is not editable
    Then I verify "<Organization_Name>" dropdown box is not editable
    Then I verify "Contract_Id" field is not editable
    Then I verify "<Bundle>" dropdown box is not editable
    And I verify "Price of bundle" field is editable
    And I verify "*Start Date" field for "Contract1" on edit Contracts page
    And I verify "End Date" field for "Contract1" on edit Contracts page
    And I verify "*Start Date" field for "Bundle1" on edit Contracts page
    And I verify "End Date" field for "Bundle1" on edit Contracts page
    And I verify "*Start Date" field for "Bundle_price1" on edit Contracts page
    And I verify "End Date" field for "Bundle_price1" on edit Contracts page
    And I verify "Baseline Start" field for "Baseline_Start_Date" on edit Contracts page
    And I verify "Baseline End" field for "Baseline_End_Date" on edit Contracts page
    And I verify "Trend Factor" field is editable
    And I verify "Upper Bound" field is editable
    And I verify "Lower Bound" field is editable
    And I verify "Add Price" button on edit organization page
    And I verify "Add Bundle" button on edit organization page
    And I verify "Submit" button on edit organization page
    And I verify "Cancel" button on edit organization page

    Examples: 
      | Description                                                                         | Payor_Name | Bundle_Payment_Contract | Program     | Organization_Type | Organization_Name | Bundle       |
      | Verification of details on Contracts under Payor Organization on edit contract page | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | ACH               | ACHNAME           | FETCHFROMAPI |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    Then I edit "<Price>" in "price" field for "Bundle1 Price1" on edit Contract page
    And I click on react date picker close icon for "Contract_Start_Date"
    And I click on react date picker close icon for "Bundle_Start_Date"
    And I click on react date picker close icon for "Bundle_Price_Start_Date"
    Then I click on "Submit" button on "edit" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                  | Payor_Name | Bundle_Payment_Contract | Program     | Price | ValidationMsg |
      | Edit a Contract With Mandatory Field Missing | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME |       | Required      |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    And I click on react date picker close icon for "Contract_Start_Date"
    Then I click on "Submit" button on "edit" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                                      | Payor_Name | Bundle_Payment_Contract | Program     | ValidationMsg |
      | Validation message if Start Date is left blank- Contract Section | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | Required      |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    And I click on react date picker close icon for "Bundle_Start_Date"
    Then I click on "Submit" button on "edit" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                                    | Payor_Name | Bundle_Payment_Contract | Program     | ValidationMsg |
      | Validation message if Start Date is left blank- Bundle Section | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | Required      |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    And I click on react date picker close icon for "Bundle_Price_Start_Date"
    Then I click on "Submit" button on "edit" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                                          | Payor_Name | Bundle_Payment_Contract | Program     | ValidationMsg |
      | Validation message if Start Date is left blank- Bundle Price Section | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | Required      |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I enter date "<BundleStartDate>" in "BundleStartDate" field for index "2"
    Then I enter date "<BundleEndDate>" in "BundleEndDate" field for index "3"
    Then I enter date "<PriceStartDate>" in "PriceStartDate" field for index "4"
    Then I enter date "<PriceEndDate>" in "Baseline Date" field for index "5"
    Then I enter date "<BaselineStartDate>" in "BaselineStartDate" field for index "6"
    Then I enter date "<BaselineEndDate>" in "BaselineEndDate" field for index "7"
    Then I click on "Submit" button on "edit" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                                                                              | Payor_Name | Bundle_Payment_Contract | Program     | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | ValidationMsg                                               |
      | Validation message for editing Contract with Contract End Date is before the Contract Start Date         | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | 2017/02/09        | 2017/01/07      | 2017/05/01      | 2018/07/30    | 2017/07/02     | 2018/02/01   | 2019/03/09        | 2019/05/12      | The Contract End Date is before the start date              |
      | Validation message for editing Contract with Bundle End Date is before the bundle Start Date             | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | 2017/02/09        | 2019/12/19      | 2017/05/01      | 2017/04/23    | 2017/07/02     | 2018/02/01   | 2019/03/09        | 2019/05/12      | The bundle end date is before the bundle start date         |
      | Validation message for editing Contract with Bundle Price End Date is before the Bundle Price Start Date | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | 2017/02/09        | 2019/12/19      | 2017/05/01      | 2019/06/30    | 2017/07/01     | 2017/06/01   | 2019/03/09        | 2019/05/12      | The bundle end date is before the bundle start date         |
      | Validation messages for editing Contract with Bundle End Date is after Contract End Date                 | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | 2017/02/09        | 2019/12/19      | 2017/05/01      | 2019/12/21    | 2017/07/02     | 2018/02/01   | 2019/03/09        | 2019/05/12      | The bundle end date is after the contract end date          |
      | Validation messages for editing Contract with Bundle Price End Date is after Bundle End Date             | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | 2017/02/09        | 2019/12/19      | 2017/05/01      | 2019/06/30    | 2018/03/03     | 2019/07/30   | 2019/03/09        | 2019/05/12      | The bundle price end date is after the bundle end date      |
      | Validation messages for editing Contract with Bundle Start Date is before the Contract Start Date        | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | 2017/02/09        | 2019/12/19      | 2017/01/07      | 2019/06/30    | 2018/03/03     | 2019/07/30   | 2019/03/09        | 2019/05/12      | The bundle start date is before the contract start date     |
      | Validation messages for editing Contract with Bundle Price Start Date is before the Bundle Start Date    | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | 2017/02/09        | 2017/02/07      | 2017/05/01      | 2019/06/30    | 2017/04/01     | 2019/07/30   | 2019/03/09        | 2019/05/12      | The bundle price start date is before the bundle start date |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I enter date "<BundleStartDate>" in "BundleStartDate" field for index "2"
    Then I enter date "<BundleEndDate>" in "BundleEndDate" field for index "3"
    Then I enter date "<PriceStartDate>" in "PriceStartDate" field for index "4"
    Then I enter date "<PriceEndDate>" in "Baseline Date" field for index "5"
    Then I enter date "<BaselineStartDate>" in "BaselineStartDate" field for index "6"
    Then I enter date "<BaselineEndDate>" in "BaselineEndDate" field for index "7"
    Then I click on "Submit" button on "edit" organization page
    And I verify "<ValidationMsg1>" mandatory field validation message on edit organization page
    And I verify "<ValidationMsg2>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                                                                                                  | Payor_Name | Bundle_Payment_Contract | Program     | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | ValidationMsg1                                          | ValidationMsg2 |
      | Validation messages for editing Contract with Contract Start Date is after the Bundle Start Date and Bundle Price Start Date | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | 2018/04/05        | 2019/12/19      | 2017/05/01      | 2019/06/30    | 2018/03/03     | 2019/05/30   | 2019/03/09        | 2019/05/12      | The bundle start date is before the contract start date |                |
      | Validation messages for editing Contract with Contract End Date is before the Bundle End Date and Bundle Price End Date      | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | 2017/02/09        | 2019/04/30      | 2017/05/01      | 2019/06/30    | 2018/03/03     | 2019/05/30   | 2019/03/09        | 2019/05/12      | The bundle end date is after the contract end date      |                |
      | Validation messages for editing Contract with Baseline End Date is before the Baseline Start Date                            | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | 2017/02/09        | 2019/12/19      | 2017/05/01      | 2019/06/30    | 2018/03/03     | 2019/07/30   | 2019/03/09        | 2019/02/12      | The bundle price end date is after the bundle end date  |                |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    Then I click on "Add Bundle" button on "edit" organization page
    Then I search "<SearchParam>" and verify with search list options on "Bundle_2" dropdown box

    Examples: 
      | Description                                              | Payor_Name | Bundle_Payment_Contract | Program     | SearchParam             |
      | Search for a Bundle by Bundle Name on Edit contract page | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPI            |
      | Search for a Bundle by Bundle code on Edit contract page | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPIForBundleID |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    Then I click on "Add Bundle" button on "edit" organization page
    And I click and search with invalid name on "<Bundle>" dropdown box
    Then I verify the "No results found" message for invalid search in Organization Name dropdown box

    Examples: 
      | Description                                                      | Payor_Name | Bundle_Payment_Contract | Program     | Bundle        |
      | Error message for an invalid Bundle search on Edit contract page | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | InvalidSearch |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    Then I click on "Add Bundle" button on "edit" organization page
    And I select "1" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    Then I edit "<Price2>" in "price" field for "Bundle2 Price1" on edit Contract page
    Then I enter date "<BundleStartDate1>" in "BundleStartDate" field for index "8"
    Then I enter date "<BundleEndDate1>" in "BundleEndDate" field for index "9"
    Then I enter date "<PriceStartDate1>" in "PriceStartDate" field for index "10"
    Then I enter date "<PriceEndDate1>" in "Baseline Date" field for index "11"
    Then I enter date "<BaselineStartDate1>" in "BaselineStartDate" field for index "12"
    Then I enter date "<BaselineEndDate1>" in "BaselineEndDate" field for index "13"
    And I edit "<Trend_Factor2>" in "trendFactor" field for "Bundle2 Price1" on edit Contract page
    And I edit "<Upper_Bound2>" in "upperBound" field for "Bundle2 Price1" on edit Contract page
    And I edit "<Lower_Bound2>" in "lowerBound" field for "Bundle21 Price1" on edit Contract page
    Then I click on "Submit" button on "edit" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                                  | Payor_Name | Bundle_Payment_Contract | Program     | Bundle       | Price2 | BundleStartDate1 | BundleEndDate1 | PriceStartDate1 | PriceEndDate1 | BaselineStartDate1 | BaselineEndDate1 | Trend_Factor2 | Upper_Bound2 | Lower_Bound2 | ValidationMsg                                |
      | Edit contract using duplicate Bundles with overlapping dates | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPI |     98 | 2017/05/01       | 2018/07/30     | 2017/07/01      | 2018/02/01    | 2019/03/09         | 2019/05/12       |            37 |           57 |           77 | Bundle Date Range overlaps with other bundle |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    Then I click on "Add Bundle" button on "edit" organization page
    And I select "2" Bundle "<Bundle>" for Contract "1" on "create" Contracts page
    Then I edit "<Price2>" in "price" field for "Bundle2 Price1" on edit Contract page
    Then I enter date "<BundleStartDate1>" in "BundleStartDate" field for index "8"
    Then I enter date "<BundleEndDate1>" in "BundleEndDate" field for index "9"
    Then I enter date "<PriceStartDate1>" in "PriceStartDate" field for index "10"
    Then I enter date "<PriceEndDate1>" in "Baseline Date" field for index "11"
    Then I enter date "<BaselineStartDate1>" in "BaselineStartDate" field for index "12"
    Then I enter date "<BaselineEndDate1>" in "BaselineEndDate" field for index "13"
    And I edit "<Trend_Factor2>" in "trendFactor" field for "Bundle2 Price1" on edit Contract page
    And I edit "<Upper_Bound2>" in "upperBound" field for "Bundle2 Price1" on edit Contract page
    And I edit "<Lower_Bound2>" in "lowerBound" field for "Bundle21 Price1" on edit Contract page
    Then I click on "Submit" button on "edit" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                                                                          | Payor_Name | Bundle_Payment_Contract | Program     | Bundle       | Price2 | BundleStartDate1 | BundleEndDate1 | PriceStartDate1 | PriceEndDate1 | BaselineStartDate1 | BaselineEndDate1 | Trend_Factor2 | Upper_Bound2 | Lower_Bound2 | ValidationMsg                                               |
      | Validation message if newly added Bundle - Bundle Name is left blank                                 | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME |              |     98 | 2018/09/30       | 2019/09/30     | 2018/11/01      | 2019/07/30    | 2019/01/30         | 2019/04/30       |            37 |           57 |           77 | Required                                                    |
      | Validation message if newly added Bundle - Start Date is left blank                                  | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPI |     98 |                  | 2019/09/30     | 2018/11/01      | 2019/07/30    | 2019/01/30         | 2019/04/30       |            37 |           57 |           77 | Required                                                    |
      | Validation message if newly added Bundle - price is left blank                                       | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPI |        | 2018/09/30       | 2019/09/30     | 2018/11/01      | 2019/07/30    | 2019/01/30         | 2019/04/30       |            37 |           57 |           77 | Required                                                    |
      | Validation message if newly added Bundle - price Start Date is left blank                            | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPI |     98 | 2018/09/30       | 2019/09/30     |                 | 2019/07/30    | 2019/01/30         | 2019/04/30       |            37 |           57 |           77 | Required                                                    |
      | Validation message if newly added Bundle Bundle End Date is before the bundle Start Date             | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPI |     98 | 2018/09/30       | 2018/09/01     | 2018/11/01      | 2019/07/30    | 2019/01/30         | 2019/04/30       |            37 |           57 |           77 | The bundle end date is before the bundle start date         |
      | Validation message if newly added Bundle Bundle Price End Date is before the Bundle Price Start Date | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPI |     98 | 2018/09/30       | 2019/09/30     | 2018/11/01      | 2018/10/01    | 2019/01/30         | 2019/04/30       |            37 |           57 |           77 | The bundle end date is before the bundle start date         |
      | Validation message if newly added Bundle Bundle End Date is after Contract End Date                  | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPI |     98 | 2018/09/30       | 2019/12/11     | 2018/11/01      | 2019/07/30    | 2019/01/30         | 2019/04/30       |            37 |           57 |           77 | The bundle end date is after the contract end date          |
      | Validation message if newly added Bundle Bundle Price End Date is after Bundle End Date              | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPI |     98 | 2018/09/30       | 2019/09/30     | 2018/11/01      | 2019/10/03    | 2019/01/30         | 2019/04/30       |            37 |           57 |           77 | The bundle price end date is after the bundle end date      |
      | Validation message if newly added Bundle Bundle Start Date is before the Contract Start Date         | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPI |     98 | 2017/01/15       | 2019/09/30     | 2018/11/01      | 2019/07/30    | 2019/01/30         | 2019/04/30       |            37 |           57 |           77 | The bundle start date is before the contract start date     |
      | Validation message if newly added Bundle Bundle Price Start Date is before the Bundle Start Date     | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPI |     98 | 2018/09/30       | 2019/09/30     | 2018/07/30      | 2019/07/30    | 2019/01/30         | 2019/04/30       |            37 |           57 |           77 | The bundle price start date is before the bundle start date |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    Then I enter date "<BaselineStartDate1>" in "BaselineStartDate" field for index "6"
    Then I enter date "<BaselineEndDate1>" in "BaselineEndDate" field for index "7"
    And I edit "<Trend_Factor>" in "trendFactor" field for "Bundle1 Price1" on edit Contract page
    And I edit "<Upper_Bound>" in "upperBound" field for "Bundle1 Price1" on edit Contract page
    And I edit "<Lower_Bound>" in "lowerBound" field for "Bundle1 Price1" on edit Contract page
    Then I click on "Submit" button on "edit" organization page
    Then I verify "<Message>" after submitting the "edit Contracts" on Payor organization page

    Examples: 
      | Description                                      | Payor_Name | Bundle_Payment_Contract | Program     | Organization_Type | Organization_Name | BaselineStartDate1 | BaselineEndDate1 | Trend_Factor | Upper_Bound | Lower_Bound | Message                       |
      | Edit a Contract With Non-Mandatory Field Missing | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | ACH               | ACHNAME           |                    |                  |              |             |             | Contract Successfully Updated |

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
    Then I search with "<Bundle_Payment_Contract>" on view profile of "Payor" Organization search box
    Then I verify "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    Then I click "<Bundle_Payment_Contract>" field in search list on view profile of "Payor" Organization search box
    And I verify "Edit Contract" header text on edit organization page
    Then I edit "<Price>" in "price" field for "Bundle1 Price1" on edit Contract page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I enter date "<BundleStartDate>" in "BundleStartDate" field for index "2"
    Then I enter date "<BundleEndDate>" in "BundleEndDate" field for index "3"
    Then I enter date "<PriceStartDate>" in "PriceStartDate" field for index "4"
    Then I enter date "<PriceEndDate>" in "Baseline Date" field for index "5"
    Then I enter date "<BaselineStartDate>" in "BaselineStartDate" field for index "6"
    Then I enter date "<BaselineEndDate>" in "BaselineEndDate" field for index "7"
    And I edit "<Trend_Factor>" in "trendFactor" field for "Bundle1 Price1" on edit Contract page
    And I edit "<Upper_Bound>" in "upperBound" field for "Bundle1 Price1" on edit Contract page
    And I edit "<Lower_Bound>" in "lowerBound" field for "Bundle1 Price1" on edit Contract page
    Then I click on "Submit" button on "edit" organization page
    Then I verify "<Message>" after submitting the "edit Contracts" on Payor organization page

    Examples: 
      | Description              | Payor_Name | Bundle_Payment_Contract | Program     | Organization_Type | Organization_Name | Price | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Trend_Factor | Upper_Bound | Lower_Bound | Message                       |
      | Edit and save a contract | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | ACH               | ACHNAME           |    96 | 2018/11/15        | 2019/10/10      | 2018/12/28      | 2019/08/30    | 2019/01/01     | 2019/4/28    | 2019/03/01        | 2019/06/30      |           78 |          87 |          97 | Contract Successfully Updated |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type                                      |
      | MO, Hospital, PGP, Payor, Program, Bundle |
