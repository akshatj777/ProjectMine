Feature: Edit Bundle Payment Contract functionality tests

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

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    Then I click on "+" button on "PGP" organization page
    And I verify "Create PGP Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <PGP_Name> in "PGP Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select region "<Region>" in "create PGP" organization page
    And I select market "<Market>" in "create PGP" organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "PGP - <EIN>" in "EIN" on create organization page
    And I provide unique "PGP - <NPI>" in "NPI" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create PGP - <Has_MO>" organization page

    Examples: 
      | Description                                                        | Has_MO | Managing_Org | PGP_Name | Address1 | Short_Name | Address2 | City | Region  | Market  | State      | Postal_Code | EIN | NPI | Message                                |
      | Create PGP Organization with all the available fields - Without MO | NO     |              | PGPNAME  | Address1 | Short_Name | Address2 | City | Midwest | Chicago | California |       10000 | EIN | NPI | PGP Organization Successfully Created. |
      | Create PGP Organization with all the available fields - With MO    | YES    | MONAME       | PGPNAME  | Address1 | Short_Name | Address2 | City | Midwest | Chicago | California |       10000 | EIN | NPI | PGP Organization Successfully Created. |

  Scenario Outline: <Description>
    When I click on "Payor" organization tab on organization dashboard
    Then I click on "+" button on "Payor" organization page
    And I verify "Create Payor Organization" header text on create organization page
    Then I enter <Payor_Name> in "Payor Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Contact_Person> in "Contact Person" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <Contact_Email> in "Contact Email" on create organization page
    And I enter <City> in "City" on create organization page
    And I enter <Contact_Phone> in "Contact Phone" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "Payor - <EIN>" in "EIN" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create Payor" organization page

    Examples: 
      | Description                                         | Payor_Name | Contact_Person    | Contact_Email       | Contact_Phone | Address1 | Address2 | City | State    | Postal_Code | EIN | Message                                  |
      | Create Payor Organization with all available fields | PAYORNAME  | ContactPersonTest | Sample1@yopmail.com |    5555599999 | Address1 | Address2 | City | New York |       10001 | EIN | Payor Organization Successfully Created. |

  Scenario Outline: Create Programs under Payor Organization
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify the "Create New Program" button on view profile of "payor" Organization
    Then I click on "Create New Program" button on "create" organization page
    And I verify "Create Program" header text on create organization page
    Then I enter <Program_Name> in "Program Name" on create organization page
    And I click on checkbox for "Attribute to the physician who admitted the patient" Attribution rule
    And I click on checkbox for "Attribute to the triggering provider id on the triggering claim" Attribution rule
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create Programs" on Payor organization page

    Examples: 
      | Description                              | Payor_Name | Program_Name | Message                      |
      | Create Programs under Payor Organization | PAYORNAME  | PROGRAMNAME  | Program Successfully Created |

  Scenario Outline: Create Bundle using API calls
    Given create Bundle Json to String and pass it to body with "<name>" and "<content>" and "<bundleCode>"
    When create Bundle with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id 0 and bundle

    Examples: 
      | desc        | bundleCode | name    | content                | expStatusCode | responseMsg |
      | validBundle | BC         | bundle- | create-bundle-content1 |           201 |             |
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
      | Create Contracts with all available fields using Hospital Organization | NO     | PAYORNAME  | 2017/02/01        | 2019/12/01      | 2017/05/01      | 2018/07/30    | 2017/07/01     | 2018/02/01   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | CID         | FETCHFROMAPI |    96 |          121 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using Hospital Organization | YES    | PAYORNAME  | 2017/01/15        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | CID         | FETCHFROMAPI |   103 |           91 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using PGP Organization      | NO     | PAYORNAME  | 2017/01/16        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | PGP               | PGPNAME           | CID         | FETCHFROMAPI |   113 |          121 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using PGP Organization      | YES    | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | PGP               | PGPNAME           | CID         | FETCHFROMAPI |    56 |          121 |         135 |         106 | Contract Successfully Created |

  Scenario Outline: <Description>
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
      | Description                                              | Payor_Name | Bundle_Payment_Contract | Program     | SearchParam  |
      | Search for a Bundle by Bundle Name on Edit contract page | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPI |

  #| Search for a Bundle by Bundle code on Edit contract page | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | FETCHFROMAPIForBundleID |
  Scenario Outline: <Description>
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
      | Edit and save a contract | PAYORNAME  | PROGRAMNAME             | PROGRAMNAME | ACH               | ACHNAME           |    96 | 2017/03/15        | 2019/10/10      | 2017/06/01      | 2018/06/30    | 2017/07/01     | 2018/02/28   | 2017/10/01        | 2017/12/30      |           78 |          87 |          97 | Contract Successfully Updated |
