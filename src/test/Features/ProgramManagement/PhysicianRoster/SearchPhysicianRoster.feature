Feature: Search Physician Roster functionality tests

  Background: 
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page

  Scenario Outline: <Description>
    Then I verify "+" button under "Managing" organization page
    Then I click on "+" button on "Managing" organization page
    And I verify "Create Managing Organization" header text on create organization page
    Then I enter <MO_Name> in "Managing Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Contact_Person> in "Contact Person" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <Contact_Email> in "Contact Email" on create organization page
    And I enter <City> in "City" on create organization page
    And I enter <Contact_Phone> in "Contact Phone" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create MO" organization page

    Examples: 
      | Description                                            | MO_Name | Contact_Person    | Contact_Email      | Contact_Phone | Address1 | Address2 | City | State    | Postal_Code | Message                                     |
      | Create Managing Organization with all available fields | MONAME  | ContactPersonTest | Sample@yopmail.com |    5555599999 | Address1 | Address2 | City | New York |       10001 | Managing Organization Successfully Created. |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    Then I click on "+" button on "Hospital" organization page
    And I verify "Create Hospital Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <Hosp_Name> in "Hospital Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "ACH - <CCN>" in "CCN" on create organization page
    And I provide unique "ACH - <EIN>" in "EIN" on create organization page
    And I provide unique "ACH - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I select location type <Loc_Type> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create ACH - <Has_MO>" organization page

    Examples: 
      | Description                                                             | Has_MO | Managing_Org | Hosp_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type  | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | Message                                     |
      | Create Hospital Organization with all the available fields - Without MO | NO     |              | ACHNAME   | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Inpatient | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | Hospital Organization Successfully Created. |
      | Create Hospital Organization with all the available fields - With MO    | YES    | MONAME       | ACHNAME   | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Inpatient | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | Hospital Organization Successfully Created. |

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
      | Description                                         | Payor_Name | Contact_Person    | Contact_Email      | Contact_Phone | Address1 | Address2 | City | State    | Postal_Code | EIN | Message                                  |
      | Create Payor Organization with all available fields | PAYORNAME  | ContactPersonTest | Sample@yopmail.com |    5555599999 | Address1 | Address2 | City | New York |       10001 | EIN | Payor Organization Successfully Created. |

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
      | Create Contracts with all available fields using Hospital Organization | NO     | PAYORNAME  | 2017/01/09        | 2019/12/19      | 2017/05/01      | 2019/07/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | CID         | FETCHFROMAPI |    96 |          121 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using Hospital Organization | YES    | PAYORNAME  | 2017/01/15        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | ACH               | ACHNAME           | CID         | FETCHFROMAPI |   103 |           91 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using PGP Organization      | NO     | PAYORNAME  | 2017/01/16        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | PGP               | PGPNAME           | CID         | FETCHFROMAPI |   113 |          121 |         135 |         106 | Contract Successfully Created |
      | Create Contracts with all available fields using PGP Organization      | YES    | PAYORNAME  | 2017/01/01        | 2019/12/31      | 2019/01/01      | 2019/06/30    | 2019/03/03     | 2019/05/26   | 2019/03/09        | 2019/05/12      | PROGRAMNAME  | PGP               | PGPNAME           | CID         | FETCHFROMAPI |    56 |          121 |         135 |         106 | Contract Successfully Created |

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
      | validPractionerCreate | firstName | testLastName | PC  | f      | 2018-01-01      | ap     | test   | 2018-01-01          | dd                        | otherFirstName | otherLastName | ff          | ff          | generatePrimaryTaxId |                   1 |            2 |           2,5 |                  NY,NY | addr1    | addr2    | city | ny    | zip |           201 |             |                0 |          0 |                0 | CPT               |

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
      | Description                                                        | Has_MO | PGP_Name | Program_Name | PGP_Organization_Name | Physician    | PhysicianStartDate | PhysicianEndDate | Message                         |
      | Add Physician with all the available fields under PGP Organization | NO     | PGPNAME  | PROGRAMNAME  | PGPNAME               | FETCHFROMAPI | 2017/01/30         | 2017/06/30       | Physicians Successfully Updated |
      | Add Physician with all the available fields under PGP Organization | YES    | PGPNAME  | PROGRAMNAME  | PGPNAME               | FETCHFROMAPI | 2017/07/01         | 2017/12/01       | Physicians Successfully Updated |

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
    Then I enter date "<PhysicianStartDate>" in "PhysicianStartDate" field for index "0"
    Then I enter date "<PhysicianEndDate>" in "PhysicianEndDate" field for index "1"
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "Create Contracts" on Payor organization page

    Examples: 
      | Description                                                             | Has_MO | Hosp_Name | Program_Name | Hospital_Organization_Name | Physician    | PhysicianStartDate | PhysicianEndDate | Message                         |
      | Add Physician with all the available fields under Hospital Organization | NO     | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI | 2017/01/30         | 2017/12/01       | Physicians Successfully Updated |
      | Add Physician with all the available fields under Hospital Organization | YES    | ACHNAME   | PROGRAMNAME  | ACHNAME                    | FETCHFROMAPI | 2018/01/01         | 2018/12/01       | Physicians Successfully Updated |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    Then I search "<SearchParam>" and verify with search list options on view profile of "PGP" organization search box

    Examples: 
      | Description                          | Has_MO | PGP_Name | SearchParam  |
      | Search for a Physician by NPI        | NO     | PGPNAME  | FETCHFROMAPI |
      | Search for a Physician by First Name | NO     | PGPNAME  | firstName    |
      | Search for a Physician by Last Name  | NO     | PGPNAME  | testLastName |
      | Search for a Physician by Start Date | NO     | PGPNAME  | 2017-01-30   |
      | Search for a Physician by End Date   | NO     | PGPNAME  | 2017-06-30   |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Bundled Payment Contracts" as default tab selected on view profile of "PGP" Organization
    And I verify "Network Contracts" tab present under "PGP" Organization
    And I verify "Physicians" tab present under "PGP" Organization
    And I click on "Physicians" tab on view profile of "PGP" Organization
    Then I search with "<Physician_Roster>" on view profile of "PGP" Organization search box
    Then I verify the "No matches" message for invalid search in Organization

    Examples: 
      | Description                               | Has_MO | PGP_Name | Physician_Roster |
      | Search for a Physician by invalid details | NO     | PGPNAME  | Invalidsearch    |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    Then I search "<SearchParam>" and verify with search list options on view profile of "Hospital" organization search box

    Examples: 
      | Description                          | Has_MO | Hosp_Name | SearchParam  |
      | Search for a Physician by NPI        | NO     | ACHNAME   | FETCHFROMAPI |
      | Search for a Physician by First Name | NO     | ACHNAME   | firstName    |
      | Search for a Physician by Last Name  | NO     | ACHNAME   | testLastName |
      | Search for a Physician by Start Date | NO     | ACHNAME   | 2017-01-30   |
      | Search for a Physician by End Date   | NO     | ACHNAME   | 2017-12-01   |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "Location" as default tab selected on view profile of "Hospital" Organization
    And I verify "Bundled Payment Contracts" tab present under "Hospital" Organization
    And I verify "Physicians" tab present under "Hospital" Organization
    And I click on "Physicians" tab on view profile of "Hospital" Organization
    Then I search with "<Physician_Roster>" on view profile of "Hospital" Organization search box
    Then I verify the "No matches" message for invalid search in Organization

    Examples: 
      | Description                               | Has_MO | Hosp_Name | Physician_Roster |
      | Search for a Physician by invalid details | NO     | ACHNAME   | Invalidsearch    |
