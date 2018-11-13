Feature: View HHA organization functionality tests

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <desc>
    Given Build Json for HHA "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ein>" and "<npi>" and "<ccn>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<marketId>"
    When create hha org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                  | name    | shortName | managingOrgId | participantId | ein | npi | ccn | address1 | address2 | city | state | zip   | marketId | regionId | expStatusCode | responseMsg | id | type |
      | Create HHA with MO    | HHANAME | ShortName | hasChild      |               | EIN | NPI | CCN | Address1 | Address2 | City | CA    | 10000 |        1 |        1 |           201 |             |  0 | hha  |
      | Create HHA without MO | HHANAME | ShortName |               |               | EIN | NPI | CCN | Address1 | Address2 | City | CA    | 10000 |        1 |        1 |           201 |             |  0 | hha  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "HHA" organization tab on organization dashboard
    When I search with "<HHA_Name> - <Has_MO>" on organization in search box
    And I click "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I verify the url after creation of an organization on view profile of "HHA" organization

    Examples: 
      | Description                                                                    | Has_MO | HHA_Name |
      | Verify HHA org shortName in Url after creating under profile page - with MO    | YES    | HHANAME  |
      | Verify HHA org shortName in Url after creating under profile page - without MO | NO     | HHANAME  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "HHA" organization tab on organization dashboard
    When I search with "<HHA_Name> - <Has_MO>" on organization in search box
    And I click "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I Verify the "x" button on View page
    And I click on "x" button on particular organization
    And User should get redirected to the "HHA" organization tab page
    When I search with "<HHA_Name> - <Has_MO>" on organization in search box
    And I click "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I verify "<HHA_Name> - <Has_MO>" name on the header of view profile
    And I verify <Organization Type> in "type" on view profile of "HHA" Organization
    And I verify <Address1> in "address1" on view profile of "HHA" Organization
    And I verify <Address2> in "address2" on view profile of "HHA" Organization
    And I verify <City> in "city" on view profile of "HHA" Organization
    #And I verify Region name <Region> on view profile of "HHA" organization
    #And I verify Market name <Market> on view profile of "HHA" organization
    And I verify <StateVerification> in "state" on view profile of "HHA" Organization
    And I verify <Postal_Code> in "zip" on view profile of "HHA" Organization
    And I verify CCN "<CCN> - <Has_MO>" on view profile of "HHA" organization
    And I verify EIN/TIN id "<EIN/TIN> - <Has_MO>" on view profile of "HHA" organization
    And I verify NPI number "<NPI> - <Has_MO>" on view profile of "HHA" organization
    And I verify "Managing Organization - <Has_MO>" on view profile of "HHA" Organization
    And I verify "Participant Id - <Has_MO>" on view profile of "HHA" Organization
    And I Verify the "Edit" button on View page

    Examples: 
      | Description                                                             | Has_MO | HHA_Name | Address1 | Short_Name | Address2 | Region  | Market  | City | State      | Postal_Code | CCN | EIN/TIN | NPI | StateVerification | Organization Type  |
      | Verification of HHA Organization details on HHA view page  - without MO | NO     | HHANAME  | Address1 | ShortName  | Address2 | Midwest | Chicago | City | California |       10000 | CCN | EIN     | NPI | CA                | Home Health Agency |
      | Verification of HHA Organization details on HHA view page - with MO     | YES    | HHANAME  | Address1 | ShortName  | Address2 | Midwest | Chicago | City | California |       10000 | CCN | EIN     | NPI | CA                | Home Health Agency |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "HHA" organization tab present under "Managing" Organization
    And I click on "HHA" organization tab on under Managing Organization
    Then I verify the Search bar on "HHA" organization page
    And I get the count of "HHA" organizations
    Then I click on "+" button on "Managing" organization page
    And I verify "Create HHA Organization" header text on create organization page
    And I verify "Has a Management Organization" radio button is checked
    And I verify Managing Organization is auto filled on "create HHA" Organization page
    Then I enter <HHA_Name> in "HHA Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "HHA - <CCN>" in "CCN" on create organization page
    And I provide unique "HHA - <EIN>" in "EIN" on create organization page
    And I provide unique "HHA - <NPI>" in "NPI" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create HHA - <Has_MO>" organization page
    When I click on "Managing" organization tab on organization dashboard
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "HHA" organization tab present under "Managing" Organization
    And I click on "HHA" organization tab on under Managing Organization
    And I verify count of "HHA" organizations is increased by 2
    And I search with "<HHA_Name> - <Has_MO>" on view profile Managing Organization search box
    And I verify "<HHA_Name> - <Has_MO>" details of "HHA" associated on Managing Organization page
    And I verify "CCN" details of "HHA" associated on Managing Organization page
    And I verify "<City>" details of "HHA" associated on Managing Organization page
    And I verify "<StateVerification>" details of "HHA" associated on Managing Organization page
    And I verify "<Postal_Code>" details of "HHA" associated on Managing Organization page

    Examples: 
      | Description                                                         | Has_MO | MO_Name | HHA_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Region  | Market  | CCN | EIN | NPI | StateVerification | Organization Type | Message                                |
      | Verification of HHA details and count on HHA tab under Managing org | YES    | MONAME  | HHANAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Midwest | Chicago | CCN | EIN | NPI | CA                | Hospice           | HHA Organization Successfully Created. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "HHA" organization tab present under "Managing" Organization
    And I click on "HHA" organization under Managing Organization
    And I search with "<HHA_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New HHA Organization" link under No matches

    Examples: 
      | Description                                                                 | MO_Name | HHA_Name     |
      | Searching invalid details on Managing Organization Profile Page for Hospice | MONAME  | NoMatchesOrg |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type    |
      | MO, HHA |
