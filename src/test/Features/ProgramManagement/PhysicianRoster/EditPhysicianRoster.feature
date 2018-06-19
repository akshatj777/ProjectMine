Feature: Edit Physician Roster functionality tests

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
      | desc                                  | name    | shortName | managingOrgId | participantId | ein | npi | address1 | address2 | city           | state | zip   | marketId | regionId | expStatusCode | responseMsg | id | type |
      | Create PGP using API calls with MO    | PGPNAME | ShortName | hasChild      |               | EIN | NPI | Address1 | Address2 | AutomationCity | CA    | 10000 |        1 |        1 |           201 |             |  0 | pgp  |
      | Create PGP using API calls without MO | PGPNAME | ShortName |               |               | EIN | NPI | Address1 | Address2 | AutomationCity | CA    | 10000 |        1 |        1 |           201 |             |  0 | pgp  |

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

  Scenario Outline: <desc>
    Given build Json for Contract "<contractId>" and "<endDate>" and "<organizationId>" and "<programId>" and "<startDate>" and "<participatingBundleId>" and "<price>" and "<bundleStartDate>" and "<bundleEndDate>" and "<type>" and "<orgType>" and "<priceStartDate>" and "<priceEndDate>" and "<baseLineEndDate>" and "<baseLineStatDate>" and "<trendFactor>" and "<upperBound>" and "<lowerBound>"
    When create contract with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                                                    | id | type          | orgType      | contractId | endDate      | organizationId | programId | startDate    | participatingBundleId | bundleStartDate | bundleEndDate | priceStartDate | priceEndDate | price | baseLineEndDate | baseLineStatDate | trendFactor | upperBound | lowerBound | expStatusCode | responseMsg |
      | Create Contract with Hopsital has MO using API Calls    |  0 | bundlePayment | hospital     | []         | [2019-12-31] |                |           | [2017-01-15] |                       | [2017-05-01]    | [2019-06-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |
      | Create Contract with Hopsital has no MO using API Calls |  0 | bundlePayment | hospitalNOMO | []         | [2019-12-26] |                |           | [2017-02-09] |                       | [2019-01-01]    | [2019-07-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |
      | Create Contract with PGP using API Calls                |  0 | bundlePayment | pgp          | []         | [2019-12-25] |                |           | [2017-01-01] |                       | [2019-01-01]    | [2019-06-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |
      | Create Contract with PGP has no MO using API Calls      |  0 | bundlePayment | pgpNOMO      | []         | [2019-12-26] |                |           | [2017-01-16] |                       | [2019-01-01]    | [2019-06-30]  | [2019-03-03]   | [2019-05-26] | [121] | []              | []               | [10]        | [50.89]    | [20.89]    |           201 |             |

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

  Scenario Outline: <desc>
    Given create physician roster Json "<practitionerContractId>" and "<practionerId>" and "<startDate>" and "<endDate>" and "<noOfRosters>"
    When Add a physician "<index>" to a roster
    Then verification of Actual vs expected results <expPostCode> and "<respMsg>"

    Examples: 
      | desc                                            | noOfRosters | index | practitionerContractId | practionerId         | startDate  | endDate    | expPostCode | respMsg |
      | createAPhysicianRoster under Hospital has MO    |           1 |     0 | null                   | addPhysicianToRoster | 2018-01-01 | 2018-12-01 |         200 |         |
      | createAPhysicianRoster under Hospital has no MO |           1 |     1 | null                   | addPhysicianToRoster | 2017-01-30 | 2017-12-01 |         200 |         |
      | createAPhysicianRoster under PGP has MO         |           1 |     2 | null                   | addPhysicianToRoster | 2017-07-01 | 2017-12-01 |         200 |         |
      | createAPhysicianRoster under PGP has no MO      |           1 |     3 | null                   | addPhysicianToRoster | 2017-01-30 | 2017-06-30 |         200 |         |

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
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    Then I search with "<Physician_Roster>" on view profile of "PGP" Organization search box
    Then I verify "<Physician_Roster>" field in search list on view profile of "PGP" Organization search box
    Then I click "<Physician_Roster>" field in search list on view profile of "PGP" Organization search box
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Edit" Physician Roster page
    Then I verify Program name is not editable
    Then I verify first name "<FirstName>" after adding Physician from dropdown on edit physician roster page
    Then I verify last name "<LastName>" after adding Physician from dropdown on edit physician roster page
    Then I verify "1" npi "<NPI>" after adding Physician from dropdown on edit physician roster page
    Then I verify start date "<Start_Date>" after adding Physician from dropdown on edit physician roster page
    Then I verify end date "<End_Date>" after adding Physician from dropdown on edit physician roster page
    And I verify "Select a physician" text is appearing on the "Create" Physician Roster page
    And I verify "practitioner" dropdown above add practioner is appearing on "Create" Physician Roster page
    And I verify "Add Physician" button on "Create" Physician Roster page
    And I verify "Submit" button on create Physician Roster page
    And I verify "Cancel" button on create Physician Roster page

    Examples: 
      | Description                                                                                     | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Physician_Roster | FirstName | LastName     | NPI          | Start_Date | End_Date   |
      | Editable fields for Physician and To verify user is not allowed to edit the non-editable fields | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2017-01-30 | 2017-06-30 |

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
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    Then I search with "<Physician_Roster>" on view profile of "PGP" Organization search box
    Then I verify "<Physician_Roster>" field in search list on view profile of "PGP" Organization search box
    Then I click "<Physician_Roster>" field in search list on view profile of "PGP" Organization search box
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Edit" Physician Roster page
    And I click on react date picker close icon for "Start Date"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                                  | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | Start_Date | End_Date   | Physician_Roster | FirstName | LastName     | NPI          | ValidationMessage                                                  |
      | Validation message if Start Date is left blank on edit Physician Roster page | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2017-01-09 | 2019-12-26 | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | The start date is before the start of the Bundled Payment Contract |

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
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    Then I search with "<Physician_Roster>" on view profile of "PGP" Organization search box
    Then I verify "<Physician_Roster>" field in search list on view profile of "PGP" Organization search box
    Then I click "<Physician_Roster>" field in search list on view profile of "PGP" Organization search box
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Edit" Physician Roster page
    And I click on react date picker close icon for "End Date"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                                                                          | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | Start_Date | End_Date   | Physician_Roster | FirstName | LastName     | NPI          | ValidationMessage                                             |
      | Validation message if End Date is left blank when Bundle Payment Contract has End Date on Edit Physician Roster page | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | 2017-01-09 | 2019-12-26 | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | The end date is after the end of the Bundled Payment Contract |

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
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    Then I search with "<Physician_Roster>" on view profile of "PGP" Organization search box
    Then I verify "<Physician_Roster>" field in search list on view profile of "PGP" Organization search box
    Then I click "<Physician_Roster>" field in search list on view profile of "PGP" Organization search box
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Edit" Physician Roster page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                                                                                              | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | Physician_Roster | FirstName | LastName     | NPI          | ContractStartDate | ContractEndDate | ValidationMessage                                                  |
      | Check validation message when Physician Roster Start Date is prior to Bundle Payment Contract Start Date on Edit Physician Roster page   | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2017/01/08        | 2019/12/26      | The start date is before the start of the Bundled Payment Contract |
      | Check validation message when Physician Roster Start Date is greater than Bundle Payment Contract End Date on Edit Physician Roster page | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2019/12/27        | 2019/12/26      | The start date and end date are not valid.                         |
      | Validation when Physician Roster Start Date is greater than Physician Roster End Date on Edit Physician Roster page                      | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2019/12/02        | 2019/12/01      | The start date and end date are not valid.                         |
      | Validation when Physician Roster End Date is greater than Bundle Payment Contract End Date on Edit Physician Roster page                 | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2017/01/30        | 2019/12/30      | The end date is after the end of the Bundled Payment Contract      |
      | Validation when Physician Roster End Date is prior to Bundle Payment Contract Start Date on Edit Physician Roster page                   | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2017/01/30        | 2017/01/28      | The start date and end date are not valid.                         |

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
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    Then I search with "<Physician_Roster>" on view profile of "PGP" Organization search box
    Then I verify "<Physician_Roster>" field in search list on view profile of "PGP" Organization search box
    Then I click "<Physician_Roster>" field in search list on view profile of "PGP" Organization search box
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Edit" Physician Roster page
    Then I enter date "<PhysicianStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<PhysicianEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on edit Physician Roster page

    Examples: 
      | Description                                                              | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Contract_ID | Physician_Roster | FirstName | LastName     | NPI          | PhysicianStartDate | PhysicianEndDate | ValidationMessage                                                                                                    |
      | Validation when Physician Start and End Dates are edited with same dates | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               |         123 | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2018/04/02         | 2018/04/02       | Validation errors: Require valid date range. End date (if specified) should be less a future date to the start date. |

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
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    Then I search with "<Physician_Roster>" on view profile of "PGP" Organization search box
    Then I verify "<Physician_Roster>" field in search list on view profile of "PGP" Organization search box
    Then I click "<Physician_Roster>" field in search list on view profile of "PGP" Organization search box
    And I verify "Add Physician" header text on create organization page
    And I verify the "<PGP_Organization_Name> - <Has_MO>" on "Edit" Physician Roster page
    Then I enter date "<PhysicianStartDate>" in "PhysicianStartDate" field for index "0"
    Then I enter date "<PhysicianEndDate>" in "PhysicianEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "edit Contracts " on Payor organization page

    Examples: 
      | Description                                                        | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Physician_Roster | PhysicianStartDate | PhysicianEndDate | Message                         |
      | Edit and save a physician with all the available fields without MO | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | FETCHFROMAPI     | 2017/01/30         | 2017/06/30       | Physicians Successfully Updated |
      | Edit and save a physician with all the available fields with MO    | YES    | PGPNAME  | PROGRAMNAME  | PGPNAME               | FETCHFROMAPI     | 2018/07/01         | 2018/12/01       | Physicians Successfully Updated |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    Then I search with "<Physician_Roster>" on view profile of "Hospital" Organization search box
    Then I verify "<Physician_Roster>" field in search list on view profile of "Hospital" Organization search box
    Then I click "<Physician_Roster>" field in search list on view profile of "Hospital" Organization search box
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Edit" Physician Roster page
    Then I verify Program name is not editable
    Then I verify first name "<FirstName>" after adding Physician from dropdown on edit physician roster page
    Then I verify last name "<LastName>" after adding Physician from dropdown on edit physician roster page
    Then I verify "1" npi "<NPI>" after adding Physician from dropdown on Create physician roster page
    Then I verify start date "<Start_Date>" after adding Physician from dropdown on edit physician roster page
    Then I verify end date "<End_Date>" after adding Physician from dropdown on edit physician roster page
    And I verify "Select a physician" text is appearing on the "Edit" Physician Roster page
    And I verify "practitioner" dropdown above add practioner is appearing on "Edit" Physician Roster page
    And I verify "Add Physician" button on "Edit" Physician Roster page
    And I verify "Submit" button on create Physician Roster page
    And I verify "Cancel" button on create Physician Roster page

    Examples: 
      | Description                                                                                     | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Physician_Roster | FirstName | LastName     | NPI          | Start_Date | End_Date   |
      | Editable fields for Physician and To verify user is not allowed to edit the non-editable fields | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2017-01-30 | 2017-12-01 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    Then I search with "<Physician_Roster>" on view profile of "Hospital" Organization search box
    Then I verify "<Physician_Roster>" field in search list on view profile of "Hospital" Organization search box
    Then I click "<Physician_Roster>" field in search list on view profile of "Hospital" Organization search box
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Edit" Physician Roster page
    And I click on react date picker close icon for "Start Date"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                                  | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Contract_ID | Start_Date | End_Date   | Physician_Roster | FirstName | LastName     | NPI          | ValidationMessage                                                  |
      | Validation message if Start Date is left blank on edit Physician Roster page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    |         123 | 2017-01-09 | 2019-12-26 | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | The start date is before the start of the Bundled Payment Contract |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    Then I search with "<Physician_Roster>" on view profile of "Hospital" Organization search box
    Then I verify "<Physician_Roster>" field in search list on view profile of "Hospital" Organization search box
    Then I click "<Physician_Roster>" field in search list on view profile of "Hospital" Organization search box
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Edit" Physician Roster page
    And I click on react date picker close icon for "End Date"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                                                                          | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Physician_Roster | FirstName | LastName     | NPI          | ValidationMessage                                             |
      | Validation message if End Date is left blank when Bundle Payment Contract has End Date on Edit Physician Roster page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | The end date is after the end of the Bundled Payment Contract |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    Then I search with "<Physician_Roster>" on view profile of "Hospital" Organization search box
    Then I verify "<Physician_Roster>" field in search list on view profile of "Hospital" Organization search box
    Then I click "<Physician_Roster>" field in search list on view profile of "Hospital" Organization search box
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Edit" Physician Roster page
    Then I enter date "<ContractStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<ContractEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                                                                                              | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Physician_Roster | FirstName | LastName     | NPI          | ContractStartDate | ContractEndDate | ValidationMessage                                                  |
      | Check validation message when Physician Roster Start Date is prior to Bundle Payment Contract Start Date on Edit Physician Roster page   | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2017/01/08        | 2017/12/01      | The start date is before the start of the Bundled Payment Contract |
      | Check validation message when Physician Roster Start Date is greater than Bundle Payment Contract End Date on Edit Physician Roster page | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2019/12/27        | 2017/12/01      | The start date and end date are not valid.                         |
      | Validation when Physician Roster Start Date is greater than Physician Roster End Date on Edit Physician Roster page                      | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2019/12/05        | 2019/12/01      | The start date and end date are not valid.                         |
      | Validation when Physician Roster End Date is greater than Bundle Payment Contract End Date on Edit Physician Roster page                 | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2017/01/30        | 2019/12/28      | The end date is after the end of the Bundled Payment Contract      |
      | Validation when Physician Roster End Date is prior to Bundle Payment Contract Start Date on Edit Physician Roster page                   | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2017/01/30        | 2017/01/02      | The start date and end date are not valid.                         |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    Then I search with "<Physician_Roster>" on view profile of "Hospital" Organization search box
    Then I verify "<Physician_Roster>" field in search list on view profile of "Hospital" Organization search box
    Then I click "<Physician_Roster>" field in search list on view profile of "Hospital" Organization search box
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Edit" Physician Roster page
    Then I enter date "<PhysicianStartDate>" in "ContractStartDate" field for index "0"
    Then I enter date "<PhysicianEndDate>" in "ContractEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on edit Physician Roster page

    Examples: 
      | Description                                                              | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Physician_Roster | FirstName | LastName     | NPI          | PhysicianStartDate | PhysicianEndDate | ValidationMessage                                                                                                    |
      | Validation when Physician Start and End Dates are edited with same dates | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI     | firstName | testLastName | FETCHFROMAPI | 2017/12/01         | 2017/12/01       | Validation errors: Require valid date range. End date (if specified) should be less a future date to the start date. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    Then I search with "<Physician_Roster>" on view profile of "Hospital" Organization search box
    Then I verify "<Physician_Roster>" field in search list on view profile of "Hospital" Organization search box
    Then I click "<Physician_Roster>" field in search list on view profile of "Hospital" Organization search box
    And I verify "Add Physician" header text on create organization page
    And I verify the "<Hospital_Organization_Name> - <Has_MO>" on "Edit" Physician Roster page
    Then I enter date "<PhysicianStartDate>" in "PhysicianStartDate" field for index "0"
    Then I enter date "<PhysicianEndDate>" in "PhysicianEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "edit Contracts" on Payor organization page

    Examples: 
      | Description                                                        | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Physician_Roster | PhysicianStartDate | PhysicianEndDate | Message                         |
      | Edit and save a physician with all the available fields without MO | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI     | 2017/02/30         | 2017/08/30       | Physicians Successfully Updated |
      | Edit and save a physician with all the available fields with MO    | YES    | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI     | 2018/03/01         | 2018/12/01       | Physicians Successfully Updated |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type                                                    |
      | MO, Hospital, PGP, Payor, Program, Bundle, practitioner |
