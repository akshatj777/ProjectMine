Feature: Create Physician Roster functionality tests

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
      | desc                       | participantId | name    | shortName | managingOrgId | ccn | ein | npi | locationId | locAddr1     | locAddr2     | locCity  | locState | locZip | locationName | locationType | marketId | regionId | address1 | address2 | city           | state | zip   | expPostCode | id | type     | errorMsg |
      | Create Hospital with MO    |               | ACHNAME | shortName | hasChild      | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | CA       |  10001 | Loc_Name     | [2,4,3],[5]  |        1 |        1 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |  0 | hospital |          |
      | Create Hospital without MO |               | ACHNAME | shortName |               | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | CA       |  10001 | Loc_Name     | [2,4,3],[5]  |        1 |        1 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |  0 | hospital |          |

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

  Scenario Outline: Create Payor using API calls
    Given build Json for Payor "<name>" and "<participantId>" and "<tinEin>" and "<contactName>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create payor with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc         | participantId | name      | tinEin | contactName       | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type  |
      | Create Payor |               | PAYORNAME | EIN    | ContactPersonTest | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | payor |

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
    And I select "1" Bundle "<Bundle_1>" for Contract "1" on "create" Contracts page
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
      | Description                                                            | Has_MO | Payor_Name | ContractStartDate | ContractEndDate | BundleStartDate | BundleEndDate | PriceStartDate | PriceEndDate | BaselineStartDate | BaselineEndDate | Program_Name | Organization_Type | Organization_Name | Contract_Id | Bundle_1     | Price | Trend_Factor | Upper_Bound | Lower_Bound | Message                       |
      | Create Contracts with all available fields using Hospital Organization | NO     | PAYORNAME  | 2017/01/09        | 2019/12/26      | 2017/05/01      | 2019/07/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | CID         | FETCHFROMAPI |    96 |          121 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using Hospital Organization | YES    | PAYORNAME  | 2017/01/15        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | CID         | FETCHFROMAPI |   103 |           91 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using PGP Organization      | NO     | PAYORNAME  | 2017/01/16        | 2019/12/26      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | PGP               | PGPNAME           | CID         | FETCHFROMAPI |   113 |          121 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using PGP Organization      | YES    | PAYORNAME  | 2017/01/01        | 2019/12/25      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | PGP               | PGPNAME           | CID         | FETCHFROMAPI |    56 |          121 |         135 |         106 | Contract Successfully Created |

  Scenario Outline: : <Description>
    When create provider taxonomy classification grouping sepecialization Json "classificationForPhysRoster"
    Given create provider taxonomy with this data "classification"
    Then verification of Actual vs expected results 201 and ""
    When create provider taxonomy classification grouping sepecialization Json "groupingForPhysRoster"
    Given create provider taxonomy with this data "grouping"
    Then verification of Actual vs expected results 201 and ""
    When create provider taxonomy classification grouping sepecialization Json "specializationForPhysRoster"
    Given create provider taxonomy with this data "specialization"
    Then verification of Actual vs expected results 201 and ""
    When create provider taxonomy Json "definition" and "notes" and "<providerTaxonCode>" and "<classificationId>" and "<groupingId>" and "<specializationId>"
    Given create provider taxonomy
    Then verification of Actual vs expected results 201 and ""
    When create practitioner Json "<firstName>" and "<lastName>" and "<npi>" and "<gender>" and "<enumerationDate>" and "<prefix>" and "<suffix>" and "<npiDeactivationDate>" and "<npiDeactivationReasonCode>" and "<otherFirstName>" and "<otherLastName>" and "<otherPrefix>" and "<otherSuffix>" and "<primaryTaxonomyId>" and "<secondaryTaxonomyId>" and "<licenseNumber>" and "<licenseNumberStateCode>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<noOfLicenses>"
    Given create practitioner with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id 0 and practitioner

    Examples: 
      | Description           | firstName | lastName     | npi | gender | enumerationDate | prefix | suffix | npiDeactivationDate | npiDeactivationReasonCode | otherFirstName | otherLastName | otherPrefix | otherSuffix | primaryTaxonomyId    | secondaryTaxonomyId | noOfLicenses | licenseNumber | licenseNumberStateCode | address1 | address2 | city | state | zip | expStatusCode | responseMsg | classificationId | groupingId | specializationId | providerTaxonCode |
      | validPractionerCreate | firstName | testLastName | PC  | f      | 2018-01-01      | ap     | test   | 2018-01-01          | dd                        | otherFirstName | otherLastName | ff          | ff          | generatePrimaryTaxId |                   1 |            2 |           2,5 | NY,NY                  | addr1    | addr2    | city | ny    | zip |           201 |             |                0 |          0 |                0 | CPT               |
      | validPractionerCreate | firstName | testLastName | PC  | f      | 2018-01-01      | ap     | test   | 2018-01-01          | dd                        | otherFirstName | otherLastName | ff          | ff          | generatePrimaryTaxId |                   1 |            2 |           2,5 | NY,NY                  | addr1    | addr2    | city | ny    | zip |           201 |             |                0 |          0 |                0 | CPT               |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    And I verify "Please select and add at least one physician" text is appearing on the "Create" Physician Roster page
    And I verify "Select a physician" text is appearing on the "Create" Physician Roster page
    And I verify "practitioner" dropdown above add practioner is appearing on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I verify "Submit" button on create Physician Roster page
    And I verify "Cancel" button on create Physician Roster page

    Examples: 
      | Description                                                  | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name |
      | Elements on Add Physician page without selecting any program | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I verify "contract-id" is appearing after selecting program from dropdown on physician roster page
    And I verify "start-date" is appearing after selecting program from dropdown on physician roster page
    And I verify "end-date" is appearing after selecting program from dropdown on physician roster page
    And I verify "Please select and add at least one physician" text is appearing on the "Create" Physician Roster page
    And I verify "Select a physician" text is appearing on the "Create" Physician Roster page
    And I verify "practitioner" dropdown above add practioner is appearing on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I verify "Submit" button on create Physician Roster page
    And I verify "Cancel" button on create Physician Roster page

    Examples: 
      | Description                                                                                     | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | Start_Date | End_Date   |
      | Elements on Add Physician page after selecting a Contract(Program) with Start Date and End Date | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2017-01-16 | 2019-12-31 |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I verify "contract-id" is appearing after selecting program from dropdown on physician roster page
    And I verify "start-date" is appearing after selecting program from dropdown on physician roster page
    And I verify "end-date" is appearing after selecting program from dropdown on physician roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I verify first name "<FirstName>" after adding Physician from dropdown on Create physician roster page
    Then I verify last name "<LastName>" after adding Physician from dropdown on Create physician roster page
    Then I verify "1" npi "<NPI>" after adding Physician from dropdown on Create physician roster page
    Then I verify start date "<Start_Date>" after adding Physician from dropdown on Create physician roster page
    #Then I verify end date "<End_Date>" after adding Physician from dropdown on Create physician roster page
    And I select "2" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I verify first name "<FirstName>" after adding Physician from dropdown on Create physician roster page
    Then I verify last name "<LastName>" after adding Physician from dropdown on Create physician roster page
    Then I verify "2" npi "<NPI>" after adding Physician from dropdown on Create physician roster page
    Then I verify start date "<Start_Date>" after adding Physician from dropdown on Create physician roster page
    #Then I verify end date "<End_Date>" after adding Physician from dropdown on Create physician roster page
    And I verify "Submit" button on create Physician Roster page
    And I verify "Cancel" button on create Physician Roster page

    Examples: 
      | Description                                                | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | Start_Date | End_Date   | Physician    | FirstName | LastName     | NPI          |
      | Elements on Add Physician page after selecting a Physician | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2017-01-16 | 2019-12-26 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    And I click on react date picker close icon for "Start Date"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                    | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | Start_Date | End_Date   | Physician    | FirstName | LastName     | NPI          | ValidationMessage                                                  |
      | Validation message if Start Date is left blank | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2017-01-09 | 2019-12-26 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | The start date is before the start of the Bundled Payment Contract |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                                                                | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | Physician    | FirstName | LastName     | NPI          | ContractStartDate | ContractEndDate | ValidationMessage                                                  |
      | Check validation message when Physician Roster Start Date is prior to Bundle Payment Contract Start Date   | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | 2017/01/08        | 2019/12/26      | The start date is before the start of the Bundled Payment Contract |
      | Check validation message when Physician Roster Start Date is greater than Bundle Payment Contract End Date | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | 2019/12/27        | 2019/12/26      | The start date and end date are not valid.                         |
      | Validation when Physician Roster Start Date is greater than Physician Roster End Date                      | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | 2019/12/02        | 2019/12/01      | The start date and end date are not valid.                         |
      | Validation when Physician Roster End Date is greater than Bundle Payment Contract End Date                 | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | 2019/12/27        | 2019/12/26      | The start date and end date are not valid.                         |
      | Validation when Physician Roster End Date is prior to Bundle Payment Contract Start Date                   | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | 2017/01/30        | 2017/01/28      | The start date and end date are not valid.                         |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create Physician Roster page

    Examples: 
      | Description                                                              | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | Physician    | FirstName | LastName     | NPI          | ContractStartDate | ContractEndDate | ValidationMessage                                                                                                    |
      | Validation when Physician Start and End Dates are edited with same dates | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | 2019/12/26        | 2019/12/26      | Validation errors: Require valid date range. End date (if specified) should be less a future date to the start date. |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    Then I search "<SearchParam>" and verify with search list options on select a Physician dropdown box

    Examples: 
      | Description                                       | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | SearchParam  |
      | Search for a Physician organization by NPI        | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | FETCHFROMAPI |
      | Search for a Physician organization by First Name | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | firstName    |
      | Search for a Physician organization by Last Name  | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | testLastName |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    Then I search "<SearchParam>" and verify with search list options on select a Physician dropdown box
    Then I verify the "No results found" message for invalid search in select a Physician dropdown box

    Examples: 
      | Description                      | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | SearchParam   |
      | Error message for invalid search | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | invalidsearch |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I enter date "<PhysicianEndDate>" in "PhysicianEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "Create Contracts" on Payor organization page

    Examples: 
      | Description                                 | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Physician    | PhysicianEndDate | Message                         |
      | Add Physician with all the available fields | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | FETCHFROMAPI | 2019/12/26       | Physicians Successfully Updated |
      | Add Physician with all the available fields | YES    | PGPNAME  | PROGRAMNAME  | PGPNAME               | FETCHFROMAPI | 2019/12/25       | Physicians Successfully Updated |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I enter date "<PhysicianStartDate>" in "PhysicianStartDate" field for index "0"
    Then I enter date "<PhysicianEndDate>" in "PhysicianEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "Create Contracts" on Payor organization page

    Examples: 
      | Description                                 | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Physician    | PhysicianStartDate | PhysicianEndDate | Message                         |
      | Add Physician with all the available fields | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | FETCHFROMAPI | 2017/01/30         | 2017/12/01       | Physicians Successfully Updated |
      | Add Physician with all the available fields | YES    | PGPNAME  | PROGRAMNAME  | PGPNAME               | FETCHFROMAPI | 2018/01/01         | 2018/12/01       | Physicians Successfully Updated |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I enter date "<PhysicianEndDate>" in "PhysicianEndDate" field for index "1"
    And I select "2" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I enter date "<PhysicianEndDate1>" in "PhysicianEndDate" field for index "3"
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "Create Contracts" on Payor organization page

    Examples: 
      | Description             | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Physician    | PhysicianEndDate | PhysicianEndDate1 | Message                         |
      | Add multiple Physicians | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | FETCHFROMAPI | 2019/12/24       | 2019/12/23        | Physicians Successfully Updated |

  @Hospital
  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    And I verify the "Add Physician" button on view profile of "Hospital" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    And I verify "Please select and add at least one physician" text is appearing on the "Create" Physician Roster page
    And I verify "Select a physician" text is appearing on the "Create" Physician Roster page
    And I verify "practitioner" dropdown above add practioner is appearing on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I verify "Submit" button on create Physician Roster page
    And I verify "Cancel" button on create Physician Roster page

    Examples: 
      | Description                                                                              | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name |
      | Elements on Add Physician page without selecting any program under Hospital Profile page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    And I verify the "Add Physician" button on view profile of "Hospital" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I verify "contract-id" is appearing after selecting program from dropdown on physician roster page
    And I verify "start-date" is appearing after selecting program from dropdown on physician roster page
    And I verify "end-date" is appearing after selecting program from dropdown on physician roster page
    And I verify "Please select and add at least one physician" text is appearing on the "Create" Physician Roster page
    And I verify "Select a physician" text is appearing on the "Create" Physician Roster page
    And I verify "practitioner" dropdown above add practioner is appearing on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I verify "Submit" button on create Physician Roster page
    And I verify "Cancel" button on create Physician Roster page

    Examples: 
      | Description                                                                                                                 | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Contract_ID | Start_Date | End_Date   |
      | Elements on Add Physician page after selecting a Contract(Program) with Start Date and End Date under Hospital Profile page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    |         123 | 2017-01-09 | 2019-12-26 |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I verify "contract-id" is appearing after selecting program from dropdown on physician roster page
    And I verify "start-date" is appearing after selecting program from dropdown on physician roster page
    And I verify "end-date" is appearing after selecting program from dropdown on physician roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I verify first name "<FirstName>" after adding Physician from dropdown on Create physician roster page
    Then I verify last name "<LastName>" after adding Physician from dropdown on Create physician roster page
    Then I verify "1" npi "<NPI>" after adding Physician from dropdown on Create physician roster page
    Then I verify start date "<Start_Date>" after adding Physician from dropdown on Create physician roster page
    #Then I verify end date "<End_Date>" after adding Physician from dropdown on Create physician roster page
    And I select "2" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I verify first name "<FirstName>" after adding Physician from dropdown on Create physician roster page
    Then I verify last name "<LastName>" after adding Physician from dropdown on Create physician roster page
    Then I verify "2" npi "<NPI>" after adding Physician from dropdown on Create physician roster page
    Then I verify start date "<Start_Date>" after adding Physician from dropdown on Create physician roster page
    #Then I verify end date "<End_Date>" after adding Physician from dropdown on Create physician roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I verify "Submit" button on create Physician Roster page
    And I verify "Cancel" button on create Physician Roster page

    Examples: 
      | Description                                                                            | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Contract_ID | Start_Date | End_Date   | Physician    | FirstName | LastName     | NPI          |
      | Elements on Add Physician page after selecting a Physician under Hospital Profile page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    |         123 | 2017-01-09 | 2019-12-26 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    And I click on react date picker close icon for "Start Date"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                                | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Contract_ID | Start_Date | End_Date   | Physician    | FirstName | LastName     | NPI          | ValidationMessage                                                  |
      | Validation message if Start Date is left blank under Hospital Profile page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    |         123 | 2017-01-09 | 2019-12-26 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | The start date is before the start of the Bundled Payment Contract |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    And I verify the "Add Physician" button on view profile of "Hospital" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                                                                                            | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Contract_ID | Physician    | FirstName | LastName     | NPI          | ContractStartDate | ContractEndDate | ValidationMessage                                                  |
      | Check validation message when Physician Roster Start Date is prior to Bundle Payment Contract Start Date under Hospital Profile page   | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    |         123 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | 2017/01/01        | 2019/12/26      | The start date is before the start of the Bundled Payment Contract |
      | Check validation message when Physician Roster Start Date is greater than Bundle Payment Contract End Date under Hospital Profile page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    |         123 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | 2019/12/30        | 2019/12/26      | The start date and end date are not valid.                         |
      | Validation when Physician Roster Start Date is greater than Physician Roster End Date under Hospital Profile page                      | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    |         123 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | 2019/12/06        | 2019/12/01      | The start date and end date are not valid.                         |
      | Validation when Physician Roster End Date is greater than Bundle Payment Contract End Date under Hospital Profile page                 | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    |         123 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | 2017/01/30        | 2019/12/30      | The end date is after the end of the Bundled Payment Contract      |
      | Validation when Physician Roster End Date is prior to Bundle Payment Contract Start Date under Hospital Profile page                   | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    |         123 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | 2017/01/09        | 2017/01/01      | The start date and end date are not valid.                         |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create Physician Roster page

    Examples: 
      | Description                                                                                                  | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Contract_ID | Physician    | FirstName | LastName     | NPI          | ContractStartDate | ContractEndDate | ValidationMessage                                                                                                    |
      | Validation when Physician Roster Start Date is same as Physician Roster End Date under Hospital Profile page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    |         123 | FETCHFROMAPI | firstName | testLastName | FETCHFROMAPI | 2019/12/26        | 2019/12/26      | Validation errors: Require valid date range. End date (if specified) should be less a future date to the start date. |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    And I verify the "Add Physician" button on view profile of "Hospital" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    Then I search "<SearchParam>" and verify with search list options on select a Physician dropdown box

    Examples: 
      | Description                                                                   | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | SearchParam  |
      | Search for a Physician organization by NPI under Hospital Profile page        | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI |
      | Search for a Physician organization by First Name under Hospital Profile page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | firstName    |
      | Search for a Physician organization by Last Name under Hospital Profile page  | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | testLastName |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    Then I search "<SearchParam>" and verify with search list options on select a Physician dropdown box
    Then I verify the "No results found" message for invalid search in select a Physician dropdown box

    Examples: 
      | Description                                                  | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | SearchParam   |
      | Error message for invalid search under Hospital Profile page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | invalidsearch |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    And I verify the "Add Physician" button on view profile of "Hospital" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I enter date "<PhysicianEndDate>" in "PhysicianEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "Create Contracts" on Payor organization page

    Examples: 
      | Description                                                             | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | PhysicianEndDate | Physician    | Message                         |
      | Add Physician with all the available fields under Hospital Profile page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | 2019/12/26       | FETCHFROMAPI | Physicians Successfully Updated |
      | Add Physician with all the available fields under Hospital Profile page | YES    | ACHNAME   | PROGRAMNAME  | ACHNAME                    | 2019/12/31       | FETCHFROMAPI | Physicians Successfully Updated |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I enter date "<PhysicianStartDate>" in "PhysicianStartDate" field for index "0"
    Then I enter date "<PhysicianEndDate>" in "PhysicianEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "Create Contracts" on Payor organization page

    Examples: 
      | Description                                                             | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Physician    | PhysicianStartDate | PhysicianEndDate | Message                         |
      | Add Physician with all the available fields under Hospital Profile page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI | 2017/01/30         | 2017/12/01       | Physicians Successfully Updated |
      | Add Physician with all the available fields under Hospital Profile page | YES    | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI | 2018/01/01         | 2018/12/01       | Physicians Successfully Updated |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    And I verify the "Add Physician" button on view profile of "PGP" Organization
    Then I click on "Add Physician" button on "create" organization page
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Create" Physician Roster page
    And I verify "Program" dropdown is appearing on "Create" Physician Roster page
    Then I select "<Program_Name>" Program name from program dropdown on "Create" Physician Roster page
    And I select "1" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I enter date "<PhysicianEndDate>" in "PhysicianEndDate" field for index "1"
    And I select "2" Physician "<Physician>" on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I click on "Add Physician" button on "Create" Physician Roster page
    Then I enter date "<PhysicianEndDate1>" in "PhysicianEndDate" field for index "3"
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "Create Contracts" on Payor organization page

    Examples: 
      | Description                                         | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Physician    | PhysicianEndDate | PhysicianEndDate1 | Message                         |
      | Add multiple Physicians under Hospital Profile page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI | 2019/12/21       | 2019/12/23        | Physicians Successfully Updated |
