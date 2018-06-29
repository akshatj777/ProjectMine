Feature: Create Network Contracts functionality tests

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
      | desc                                                    | id | type          | orgType      | contractId | endDate      | organizationId | programId | startDate    | participatingBundleId | bundleStartDate | bundleEndDate | priceStartDate | priceEndDate | price | baseLineEndDate | baseLineStatDate | trendFactor | upperBound | lowerBound | expStatusCode | responseMsg |
      | Create Contract with Hopsital has MO using API Calls    |  0 | bundlePayment | hospital     | []         | [2019-12-31] |                |           | [2017-01-15] |                       | [2017-05-01]    | [2019-07-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |
      | Create Contract with Hopsital has no MO using API Calls |  0 | bundlePayment | hospitalNOMO | []         | [2019-12-19] |                |           | [2017-02-09] |                       | [2017-05-01]    | [2019-07-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |
      | Create Contract with PGP using API Calls                |  0 | bundlePayment | pgp          | []         | [2019-12-28] |                |           | [2017-01-01] |                       | [2019-01-01]    | [2019-06-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |
      | Create Contract with PGP has no MO using API Calls      |  0 | bundlePayment | pgpNOMO      | []         | [2019-12-28] |                |           | [2017-01-16] |                       | [2019-01-01]    | [2019-06-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |

  Scenario Outline: Verify available fields on create network contract page
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I verify the "<PGP_Organization_Name>" on "Create" Network Contract page
    And I verify "*Program" on Create Network Contract page
    And I verify Search box for Hospital Organization on "Create" Network Contract page
    And I verify "*" field on "Create" Network Contract page
    And I verify Default Network Contract Start date should be today's date
    And I verify "End Date" field on "Create" Network Contract page
    And I verify "Submit" button on create organization page
    And I verify "Cancel" button on create organization page

    Examples: 
      | Description                                   | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name |
      | Verify fields on create network contract page | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |

  Scenario Outline: Elements on Create Network Contract page after selecting Contract(Program) with Start Date and End Date
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I verify the "<PGP_Organization_Name>" on "Create" Network Contract page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    And I verify Search box for Hospital Organization on "Create" Network Contract page
    And I verify "<Contract_ID>" in "Contract Id" after selecting Contract Name
    And I verify "<Start_Date>" in "Start Date" after selecting Contract Name
    And I verify "<End_Date>" in "End Date" after selecting Contract Name
    And I verify Default Network Contract Start Date should be Bundled payment Contract's Start Date
    And I verify Default Network Contract End Date should be Bundled payment Contract's End Date
    And I verify "Submit" button on create organization page
    And I verify "Cancel" button on create organization page

    Examples: 
      | Description                                                                                           | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | Start_Date | End_Date   |
      | Verify after selecting Contract(Program) with Start Date and End Date on create Network Contract page | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2017-01-01 | 2019-12-31 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Network Contract page
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                 | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | Start_Date | End_Date   | Organization_Name | ValidationMessage      |
      | Validation message if Program is left blank | NO     | PGPNAME  |              | PGPNAME               |         123 | 2018-02-02 | 2018-02-02 | ACHNAME           | Program is not present |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Network Contract page
    And I click on react date picker close icon for "Start Date"
    And I click on react date picker close icon for "End Date"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                                            | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | Start_Date | End_Date   | Organization_Name | ValidationMessage                                        |
      | Validation message if Hospital Organization is left blank                              | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2018-02-02 | 2018-02-02 |                   |                                                          |
      | Validation message if Start Date is left blank                                         | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 |            | 2018-02-02 | ACHNAME           | Start Date is not present                                |
      | Validation message if End Date is left blank when Bundle Payment Contract has End Date | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2018-02-02 |            | ACHNAME           | End Date is greater than the Contract (Program) End Date |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Network Contract page
    And I click on react date picker close icon for "Start Date"
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    And I click on react date picker close icon for "End Date"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                                                         | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | ContractStartDate | ContractEndDate | Organization_Name | ValidationMessage                                          |
      | Check Validation when Network Contract Start Date is prior to Bundled Payment Contract Start Date   | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2017/01/01        | 2019/12/28      | ACHNAME           | Start Date is prior to the Contract (Program) Start Date   |
      | Check Validation when Network Contract Start Date is greater than Bundled Payment Contract End Date | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2019/12/31        | 2019/12/28      | ACHNAME           | Start Date is greater than the Contract (Program) End Date |
      | Check Validation when Network Contract End Date is prior to Bundled Payment Contract Start Date     | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2017/01/30        | 2017/01/26      | ACHNAME           | End Date is prior to the Start Date                        |
      | Check Validation when Network Contract End Date is greater than Bundled Payment Contract End Date   | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2017/01/01        | 2019/12/30      | ACHNAME           | Start Date is prior to the Contract (Program) Start Date   |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Network Contract page
    And I click on react date picker close icon for "Start Date"
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    And I click on react date picker close icon for "End Date"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    Then I verify duplicate "<Message>" after submitting the "create Network Contract" organization page

    Examples: 
      | Description                                                                            | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | ContractStartDate | ContractEndDate | Organization_Name | Message                                                                                                              |
      | Check Validation when Network Contract Start Date is same as Network Contract End Date | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2017/01/30        | 2017/01/30      | ACHNAME           | Validation errors: Require valid date range. End date (if specified) should be less a future date to the start date. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    Then I search "<SearchParam> - <Has_MO>" and verify with search list options on "Organization_Name" dropdown box in Network Contract page

    Examples: 
      | Description                                                      | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | SearchParam |
      | Search for a Hospital organization by CCN                        | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | CCN         |
      | Search for a Hospital organization by Hospital Organization Name | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | ACHNAME     |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Network Contract page
    And I click on react date picker close icon for "Start Date"
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    And I click on react date picker close icon for "End Date"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create Contracts" on Payor organization page

    Examples: 
      | Description                                           | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Organization_Name | ContractStartDate | ContractEndDate | Message                               |
      | Create Network contract with all the available fields | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | ACHNAME           | 2017/01/30        | 2019/12/20      | Network Contract Successfully Created |
      | Create Network contract with all the available fields | YES    | PGPNAME  | PROGRAMNAME  | PGPNAME               | ACHNAME           | 2017/03/12        | 2019/09/20      | Network Contract Successfully Created |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Network Contract page
    Then I click on "Submit" button on "create" organization page

    Examples: 
      | Description                                                                        | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Organization_Name | Message                               |
      | Create Network contract with all the available fields (without changing the dates) | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | ACHNAME           | Network Contract Successfully Created |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Network Contract page
    And I click on react date picker close icon for "Start Date"
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    And I click on react date picker close icon for "End Date"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    Then I verify duplicate "<Message>" after submitting the "Create_Network_Contract" organization page

    Examples: 
      | Description                                                                           | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Organization_Name | ContractStartDate | ContractEndDate | Message                                                          |
      | Create Network Contract using duplicate Program and Hospital Organization combination | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | ACHNAME           | 2017/01/20        | 2019/12/20      | Validation errors: Contract already exists for organization with |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Network Contract page
    And I click on react date picker close icon for "Start Date"
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    And I click on react date picker close icon for "End Date"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                                                       | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | ContractStartDate | ContractEndDate | Organization_Name | ValidationMessage                                        |
      | Create Network Contract with Start Date, when Bundle Payment contract has Start Date and End Date | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2017/01/01        | 2019/12/28      | ACHNAME           | End Date is greater than the Contract (Program) End Date |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Network Contract page
    And I click on react date picker close icon for "Start Date"
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    And I click on react date picker close icon for "End Date"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    Then I verify duplicate "<Message>" after submitting the "Create_Network_Contract" organization page

    Examples: 
      | Description                                                                                                                                                       | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Organization_Name | ContractStartDate | ContractEndDate | Message                                                          |
      | Create Network Contract using duplicate Program and Hospital Organization combination with separate date range when Bundle payment contract having only StartDate | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | ACHNAME           | 2017/04/12        | 2019/09/20      | Validation errors: Contract already exists for organization with |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Network Contract page
    Then I click on cancel search button
    And I verify the selected Hospital organization should not be displayed in the search box

    Examples: 
      | Description                                  | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Organization_Name |
      | Check the cancel search button functionality | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | ACHNAME           |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I click on "Network Contracts" tab on view profile of "PGP" Organization
    And I verify the "Create New Network Contract" button on view profile of "PGP" Organization
    Then I click on "Create New Network Contract" button on view profile of "PGP" Organization
    And I verify "Create Network Contract" header text on "create Network Contract" page
    And I select "<Program_Name>" Program name in create Contract page under "PGP" Organization
    And I select Organization name "<Organization_Name> - <Has_MO>" for Contract "1" on "create" Network Contract page
    Then I verify the "No results found" message for invalid search in Organization Name dropdown box

    Examples: 
      | Description                                   | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Organization_Name     |
      | Error message if an organization is not found | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | NoNetworkContractName |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type                                      |
      | MO, Hospital, PGP, Payor, Program, Bundle |
