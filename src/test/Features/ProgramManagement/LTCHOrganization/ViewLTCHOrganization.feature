Feature: LTCH Organization View profile Functionality tests.

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <desc>
    Given Build Json and pass it to post method for ltch org with "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ccn>" and "<ein>" and "<npi>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<locationName>" and "<locationType>" and "<marketId>" and "<locAddr1>" and "<locAddr2>" and "<locCity>" and "<locState>" and "<locZip>" and "<locationId>"
    When create ltch org with this data "ltch"
    Then verification of Actual vs expected results <expPostCode> and "<errorMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                       | participantId | name     | shortName | managingOrgId | ccn | ein | npi | locationId | locAddr1     | locAddr2     | locCity  | locState | locZip | locationName | locationType | marketId | regionId | address1 | address2 | city           | state | zip   | expPostCode | errorMsg | id | type |
      | Create LTCH Org with MO    |               | LTCHNAME | ShortName | hasChild      | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | NY       |  10001 | Loc_Name     | [20],[20]    |        1 |        1 | Address1 | Address2 | AutomationCity | NY    | 10000 |         201 |          |  0 | ltch |
      | Create LTCH Org without MO |               | LTCHNAME | ShortName |               | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | NY       |  10001 | Loc_Name     | [20],[20]    |        1 |        1 | Address1 | Address2 | AutomationCity | NY    | 10000 |         201 |          |  0 | ltch |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    When I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I verify the url after creation of an organization on view profile of "LTCH" organization

    Examples: 
      | Description                                                                     | Has_MO | LTCH_Name |
      | Verify LTCH org shortName in Url after creating under profile page - with MO    | YES    | LTCHNAME  |
      | Verify LTCH org shortName in Url after creating under profile page - without MO | NO     | LTCHNAME  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    When I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I Verify the "x" button on View page
    And I click on "x" button on particular organization
    And User should get redirected to the "LTCH" organization tab page
    When I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I verify "<LTCH_Name> - <Has_MO>" name on the header of view profile
    And I verify <Organization Type> in "type" on view profile of "LTCH" Organization
    And I verify <Address1> in "address1" on view profile of "LTCH" Organization
    And I verify <Address2> in "address2" on view profile of "LTCH" Organization
    And I verify <City> in "city" on view profile of "LTCH" Organization
    And I verify <StateVerification> in "state" on view profile of "LTCH" Organization
    And I verify <Postal_Code> in "zip" on view profile of "LTCH" Organization
    And I verify CCN "<CCN> - <Has_MO>" on view profile of "LTCH" organization
    And I verify EIN/TIN id "<EIN/TIN> - <Has_MO>" on view profile of "LTCH" organization
    And I verify NPI number "<NPI> - <Has_MO>" on view profile of "LTCH" organization
    #And I verify Region name <Loc_Region> on view profile of "LTCH" organization
    #And I verify Market name <Loc_Market> on view profile of "LTCH" organization
    And I verify "Managing Organization - <Has_MO>" on view profile of "LTCH" Organization
    And I verify "Participant Id - <Has_MO>" on view profile of "LTCH" Organization
    And I verify "1" location count on view "LTCH" organization page
    And I verify header name "ID" under "Location" for "LTCH" organization
    And I verify header name "Location Name" under "Location" for "LTCH" organization
    And I verify header name "Address" under "Location" for "LTCH" organization
    #And I verify header name "Region" under "Location" for "LTCH" organization
    #And I verify header name "Market" under "Location" for "LTCH" organization
    And I verify Location index id "<LID>" on view profile of "<LTCH_Name> - <Has_MO>" organization
    And I Verify the "Edit" button on View page
    And I click on "Edit" button on particular organization
    Then I click on "+" button on "Edit LTCH" organization page
    Then I verify "Location 2" on "Edit" organization page
    And I enter location name <Loc_Name> for Location "2" on "Edit" organization page
    And I enter address1 <Loc_Address1> for Location "2" on "Edit" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "Edit" organization page
    #And I select region <Loc_Region> for Location "2" on "Edit" organization page
    And I enter city <Loc_City> for Location "2" on "Edit" organization page
    #And I select market <Loc_Market> for region "<Loc_Region>" for Location "2" on "Edit" organization page
    And I select state <Loc_State> for Location "2" on "Edit" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "Edit" organization page
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForLTCHNAME - <Has_MO>" organization page
    When I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I verify "<LTCH_Name> - <Has_MO>" name on the header of view profile
    And I verify "1" location count on view "LTCH" organization page
    And I verify Location index id "<LID>" on view profile of "<LTCH_Name> - <Has_MO>" organization

    Examples: 
      | Description                                                                            | Has_MO | LTCH_Name | Address1 | Short_Name | Address2 | City           | State      | Postal_Code | Loc_Name   | Loc_Address1 | Loc_Type                | Loc_Address2 | Loc_Region | Loc_City | Loc_Market | Loc_State  | Loc_Postal_Code | CCN | EIN/TIN | NPI | StateVerification | Organization Type       | Message                                 |
      | Verification of LTCH details and count of locations displayed under LTCH org - with MO | YES    | LTCHNAME  | Address1 | Short_Name | Address2 | AutomationCity | California |       10000 | Loc_Name21 | Loc_Address1 | Long Term Care Hospital | Loc_Address2 | Midwest    | Loc_City | Chicago    | California |           10000 | CCN | EIN     | NPI | NY                | Long-Term Care Hospital | LTCH Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "LTCH" organization tab present under "Managing" Organization
    And I click on "LTCH" organization tab on under Managing Organization
    Then I verify the Search bar on "LTCH" organization page
    And I get the count of "LTCH" organizations
    And I search with "<LTCH_Name> - <Has_MO>" on view profile Managing Organization search box
    And I verify "<LTCH_Name> - <Has_MO>" details of "LTCH" associated on Managing Organization page
    And I click "<LTCH_Name> - <Has_MO>" for "LTCH" organization under MO profile page
    And I click on "Edit" button on particular organization
    And I verify "Edit LTCH Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit LTCH - <Has_MO>" organization page
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "Edit LTCH - <Has_MO>" organization page
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "LTCH" organization tab present under "Managing" Organization
    And I click on "LTCH" organization tab on under Managing Organization
    And I search with "<LTCH_Name> - <Has_MO>" on view profile Managing Organization search box
    And I verify "<LTCH_Name> - <Has_MO>" details of "LTCH" associated on Managing Organization page
    And I click "<LTCH_Name> - <Has_MO>" for "LTCH" organization under MO profile page
    And I verify "<LTCH_Name> - <Has_MO>" name on the header of view profile
    And I verify <Organization Type> in "type" on view profile of "LTCH" Organization
    And I verify <Address1> in "address1" on view profile of "LTCH" Organization
    And I verify <Address2> in "address2" on view profile of "LTCH" Organization
    And I verify <City> in "city" on view profile of "LTCH" Organization
    And I verify <StateVerification> in "state" on view profile of "LTCH" Organization
    And I verify <Postal_Code> in "zip" on view profile of "LTCH" Organization
    And I verify CCN id "<CCN> - <Has_MO>" on "LTCH" organization profile page
    And I verify EIN/TIN id "<EIN/TIN> - <Has_MO>" on "LTCH" organization profile page
    And I verify NPI id "<NPI> - <Has_MO>" on "LTCH" organization profile page
    And I verify "Managing Organization - <Has_MO>" on view profile of "LTCH" Organization
    And I verify "Participant Id - <Has_MO>" on view profile of "LTCH" Organization
    And I verify "Location" tab present under "LTCH" Organization
    And I verify "Bundle Payment Contracts" tab present under "LTCH" Organization
    And I verify Location index id "<LID>" on view profile of "<LTCH_Name> - <Has_MO>" organization
    Then I verify Location details of "<Loc_Name>" on view profile of "LTCH" organization
    Then I verify Location details of "<Loc_Address1>" on view profile of "LTCH" organization

    Examples: 
      | Description                                                | Has_MO | MO_Name | LTCH_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type        | Loc_Address2 | Loc_Region | Loc_City | Loc_Market | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | StateVerification |
      | Verification of LTCH details through Managing organization | YES    | MONAME  | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Skilled Nursing | Loc_Address2 | Midwest    | Loc_City | Chicago    | California |           10000 | CCN | EIN | NPI | CA                |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "LTCH" organization tab present under "Managing" Organization
    And I click on "LTCH" organization tab on under Managing Organization
    Then I verify the Search bar on "LTCH" organization page
    And I get the count of "LTCH" organizations
    Then I click on "+" button on "Managing" organization page
    And I verify "Create LTCH Organization" header text on create organization page
    And I verify "Has a Management Organization" radio button is checked
    And I verify Managing Organization is auto filled on "create LTCH" Organization page
    Then I enter <LTCH_Name> in "LTCH Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "LTCH - <CCN>" in "CCN" on create organization page
    And I provide unique "LTCH - <EIN>" in "EIN" on create organization page
    And I provide unique "LTCH - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create LTCH - <Has_MO>" organization page
    When I click on "Managing" organization tab on organization dashboard
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "LTCH" organization tab present under "Managing" Organization
    When I click on "LTCH" organization tab on under Managing Organization
    And I verify count of "LTCH" organizations is increased by 2
    And I search with "<LTCH_Name> - <Has_MO>" on view profile Managing Organization search box
    And I verify "<LTCH_Name>" details of "LTCH" associated on Managing Organization page
    And I verify "CCN" details of "LTCH" associated on Managing Organization page
    And I verify "<City>" details of "LTCH" associated on Managing Organization page
    And I verify "<StateVerification>" details of "LTCH" associated on Managing Organization page
    And I verify "<Postal_Code>" details of "LTCH" associated on Managing Organization page
    And I search with "<LTCH_Name> - <Has_MO>" on view profile Managing Organization search box
    And I verify "<LTCH_Name> - <Has_MO>" details of "LTCH" associated on Managing Organization page
    And I click "<LTCH_Name> - <Has_MO>" for "LTCH" organization under MO profile page
    And I verify <Organization Type> in "type" on view profile of "LTCH" Organization
    And I verify <Address1> in "address1" on view profile of "LTCH" Organization
    And I verify <Address2> in "address2" on view profile of "LTCH" Organization
    And I verify <City> in "city" on view profile of "LTCH" Organization
    And I verify <StateVerification> in "state" on view profile of "LTCH" Organization
    And I verify <Postal_Code> in "zip" on view profile of "LTCH" Organization
    And I verify CCN id "<CCN> - <Has_MO>" on "LTCH" organization profile page
    And I verify EIN/TIN id "<EIN/TIN> - <Has_MO>" on "LTCH" organization profile page
    And I verify NPI id "<NPI> - <Has_MO>" on "SNF" organization profile page
    And I verify "Managing Organization - <Has_MO>" on view profile of "LTCH" Organization
    And I verify "Participant Id - <Has_MO>" on view profile of "LTCH" Organization
    And I verify Location index id "<LID>" on view profile of "<LTCH_Name> - <Has_MO>" organization
    Then I verify Location details of "<Loc_Name>" on view profile of "LTCH" organization
    Then I verify Location details of "<Loc_Address1>" on view profile of "LTCH" organization

    Examples: 
      | Description                                                           | Has_MO | MO_Name | LTCH_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type        | Loc_Address2 | Loc_Region | Loc_City | Loc_Market | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | StateVerification | Message                                 |
      | Verification of LTCH details and count on LTCH tab under Managing org | YES    | MONAME  | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Skilled Nursing | Loc_Address2 | Midwest    | Loc_City | Chicago    | California |           10000 | CCN | EIN | NPI | CA                | LTCH Organization Successfully Created. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "LTCH" organization tab present under "Managing" Organization
    And I click on "LTCH" organization under Managing Organization
    And I search with "<LTCH_Name1>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New LTCH Organization" link under No matches
    And I click on "Create New LTCH Organization" link under No matches
    And I verify "Create LTCH Organization" header text on create organization page
    And I verify "Has a Management Organization" radio button is checked
    And I verify Managing Organization is auto filled on "create LTCH" Organization page

    Examples: 
      | Description                                                              | MO_Name | LTCH_Name1        | LTCH_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type        | Loc_Address2 | Loc_Region | Loc_City | Loc_Market | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | StateVerification | Message                                |
      | Searching invalid details on Managing Organization Profile Page for LTCH | MONAME  | NoMatchesLTCHNAME | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Skilled Nursing | Loc_Address2 | Midwest    | Loc_City | Chicago    | California |           10000 | CCN | EIN | NPI | CA                | SNF Organization Successfully Created. |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type     |
      | MO, LTCH |
