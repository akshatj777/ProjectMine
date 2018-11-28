Feature: View Hospice organization functionality tests

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <desc>
    Given Build Json for Hospice "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ein>" and "<npi>" and "<ccn>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<marketId>"
    When create hospice org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                           | name        | shortName  | managingOrgId | participantId | ein | npi | ccn | address1 | address2 | city           | state | zip   | marketId | expStatusCode | responseMsg | type    | id |
      | Create Hospice using API calls | HOSPICENAME | Short_Name | hasChild      |               | EIN | NPI | CCN | Address1 | Address2 | AutomationCity | NY    | 10000 |        2 |           201 |             | hospice |  0 |
      | Create Hospice using API calls | HOSPICENAME | Short_Name |               |               | EIN | NPI | CCN | Address1 | Address2 | AutomationCity | NY    | 10000 |        2 |           201 |             | hospice |  0 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospice" organization tab on organization dashboard
    When I search with "<Hospice_Name> - <Has_MO>" on organization in search box
    And I click "<Hospice_Name> - <Has_MO>" field in search list on organization page
    And I verify the url after creation of an organization on view profile of "Hospice" organization

    Examples: 
      | Description                                                                        | Has_MO | Hospice_Name |
      | Verify Hospice org shortName in Url after creating under profile page - with MO    | YES    | HOSPICENAME  |
      | Verify Hospice org shortName in Url after creating under profile page - without MO | NO     | HOSPICENAME  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospice" organization tab on organization dashboard
    When I search with "<Hospice_Name> - <Has_MO>" on organization in search box
    And I click "<Hospice_Name> - <Has_MO>" field in search list on organization page
    And I Verify the "x" button on View page
    And I click on "x" button on particular organization
    And User should get redirected to the "Hospice" organization tab page
    When I search with "<Hospice_Name> - <Has_MO>" on organization in search box
    And I click "<Hospice_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hospice_Name> - <Has_MO>" name on the header of view profile
    And I verify <Organization Type> in "type" on view profile of "Hospice" Organization
    And I verify <Address1> in "address1" on view profile of "Hospice" Organization
    And I verify <Address2> in "address2" on view profile of "Hospice" Organization
    And I verify <City> in "city" on view profile of "Hospice" Organization
    #And I verify Region name <Region> on view profile of "Hospice" organization
    #And I verify Market name <Market> on view profile of "Hospice" organization
    And I verify <StateVerification> in "state" on view profile of "Hospice" Organization
    And I verify <Postal_Code> in "zip" on view profile of "Hospice" Organization
    And I verify CCN "<CCN> - <Has_MO>" on view profile of "Hospice" organization
    And I verify EIN/TIN id "<EIN/TIN> - <Has_MO>" on view profile of "Hospice" organization
    And I verify NPI number "<NPI> - <Has_MO>" on view profile of "Hospice" organization
    And I verify "Managing Organization - <Has_MO>" on view profile of "Hospice" Organization
    And I verify "Participant Id - <Has_MO>" on view profile of "Hospice" Organization
    And I Verify the "Edit" button on View page

    Examples: 
      | Description                                                                     | Has_MO | Hospice_Name | Address1 | Short_Name | Address2 | Region  | Market              | City           | State   | Postal_Code | CCN | EIN/TIN | NPI | StateVerification | Organization Type |
      | Verification of Hospice Organization details on Hospice view page  - without MO | NO     | HOSPICENAME  | Address1 | ShortName  | Address2 | Midwest | Eastern Great Lakes | AutomationCity | NewYork |       10000 | CCN | EIN     | NPI | NY                | Hospice           |
      | Verification of Hospice Organization details on Hospice view page - with MO     | YES    | HOSPICENAME  | Address1 | ShortName  | Address2 | Midwest | Eastern Great Lakes | AutomationCity | NewYork |       10000 | CCN | EIN     | NPI | NY                | Hospice           |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "Hospice" organization tab present under "Managing" Organization
    And I click on "Hospice" organization tab on under Managing Organization
    When I search with "<Hospice_Name> - <Has_MO>" on organization in search box
    And I click "<Hospice_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hospice_Name> - <Has_MO>" name on the header of view profile
    And I verify <Organization Type> in "type" on view profile of "Hospice" Organization
    And I verify <Address1> in "address1" on view profile of "Hospice" Organization
    And I verify <Address2> in "address2" on view profile of "Hospice" Organization
    And I verify <City> in "city" on view profile of "Hospice" Organization
    And I verify <StateVerification> in "state" on view profile of "Hospice" Organization
    And I verify <Postal_Code> in "zip" on view profile of "Hospice" Organization
    And I verify CCN "<CCN> - <Has_MO>" on view profile of "Hospice" organization
    And I verify EIN/TIN id "<EIN/TIN> - <Has_MO>" on view profile of "Hospice" organization
    And I verify NPI number "<NPI> - <Has_MO>" on view profile of "Hospice" organization
    And I verify "Managing Organization - <Has_MO>" on view profile of "Hospice" Organization
    And I verify "Participant Id - <Has_MO>" on view profile of "Hospice" Organization
    And I click on "Edit" button on particular organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "edit Hospice - <Has_MO>" organization page
    When I click on "Managing" organization tab on organization dashboard
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "Hospice" organization tab present under "Managing" Organization
    And I click on "Hospice" organization tab on under Managing Organization
    And I verify count of "Hospice" organizations is increased by 2
    And I search with "<Hospice_Name> - <Has_MO>" on view profile Managing Organization search box
    And I verify "<Hospice_Name> - <Has_MO>" details of "Hospice" associated on Managing Organization page
    And I verify "CCN" details of "Hospice" associated on Managing Organization page
    And I verify "<City>" details of "Hospice" associated on Managing Organization page
    And I verify "<StateVerification>" details of "Hospice" associated on Managing Organization page
    And I verify "<Postal_Code>" details of "Hospice" associated on Managing Organization page
    And I search with "<Hospice_Name> - <Has_MO>" on view profile Managing Organization search box
    And I verify "<Hospice_Name> - <Has_MO>" details of "Hospice" associated on Managing Organization page
    And I click "<Hospice_Name> - <Has_MO>" for "Hospice" organization under MO profile page
    And I verify "<Hospice_Name> - <Has_MO>" name on the header of view profile
    And I verify <Organization Type> in "type" on view profile of "Hospice" Organization
    And I verify <Address1> in "address1" on view profile of "Hospice" Organization
    And I verify <Address2> in "address2" on view profile of "Hospice" Organization
    And I verify <City> in "city" on view profile of "Hospice" Organization
    And I verify <StateVerification> in "state" on view profile of "Hospice" Organization
    And I verify <Postal_Code> in "zip" on view profile of "Hospice" Organization
    And I verify CCN "<CCN> - <Has_MO>" on view profile of "Hospice" organization
    And I verify EIN/TIN id "<EIN/TIN> - <Has_MO>" on view profile of "Hospice" organization
    And I verify NPI number "<NPI> - <Has_MO>" on view profile of "Hospice" organization
    And I verify "Managing Organization - <Has_MO>" on view profile of "Hospice" Organization
    And I verify "Participant Id - <Has_MO>" on view profile of "Hospice" Organization

    Examples: 
      | Description                                                                           | Has_MO | MO_Name | Hospice_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Region  | Market  | CCN | EIN | NPI | StateVerification | Organization Type | Message                                    |
      | Verify that all the details are same when Submit is clicked without editing any field | YES    | MONAME  | HOSPICENAME  | Address1 | Short_Name | Address2 | AutomationCity | California |       10000 | Midwest | Chicago | CCN | EIN | NPI | CA                | Hospice           | Hospice Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "Hospice" organization tab present under "Managing" Organization
    And I click on "Hospice" organization tab on under Managing Organization
    Then I verify the Search bar on "Hospice" organization page
    And I get the count of "Hospice" organizations
    Then I click on "+" button on "Managing" organization page
    And I verify "Create Hospice Organization" header text on create organization page
    And I verify "Has a Management Organization" radio button is checked
    And I verify Managing Organization is auto filled on "create Hospice" Organization page
    Then I enter <Hospice_Name> in "Hospice Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "Hospice - <CCN>" in "CCN" on create organization page
    And I provide unique "Hospice - <EIN>" in "EIN" on create organization page
    And I provide unique "Hospice - <NPI>" in "NPI" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create Hospice - <Has_MO>" organization page
    When I click on "Managing" organization tab on organization dashboard
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "Hospice" organization tab present under "Managing" Organization
    And I click on "Hospice" organization tab on under Managing Organization
    And I verify count of "Hospice" organizations is increased by 2
    And I search with "<Hospice_Name> - <Has_MO>" on view profile Managing Organization search box
    And I verify "<Hospice_Name> - <Has_MO>" details of "Hospice" associated on Managing Organization page
    And I verify "CCN" details of "Hospice" associated on Managing Organization page
    And I verify "<City>" details of "Hospice" associated on Managing Organization page
    And I verify "<StateVerification>" details of "Hospice" associated on Managing Organization page
    And I verify "<Postal_Code>" details of "Hospice" associated on Managing Organization page
    And I search with "<Hospice_Name> - <Has_MO>" on view profile Managing Organization search box
    And I verify "<Hospice_Name> - <Has_MO>" details of "Hospice" associated on Managing Organization page
    And I click "<Hospice_Name> - <Has_MO>" for "Hospice" organization under MO profile page
    And I verify "<Hospice_Name> - <Has_MO>" name on the header of view profile
    And I verify <Organization Type> in "type" on view profile of "Hospice" Organization
    And I verify <Address1> in "address1" on view profile of "Hospice" Organization
    And I verify <Address2> in "address2" on view profile of "Hospice" Organization
    And I verify <City> in "city" on view profile of "Hospice" Organization
    And I verify <StateVerification> in "state" on view profile of "Hospice" Organization
    And I verify <Postal_Code> in "zip" on view profile of "Hospice" Organization
    And I verify CCN id "<CCN> - <Has_MO>" on "Hospice" organization profile page
    And I verify EIN/TIN id "<EIN/TIN> - <Has_MO>" on "Hospice" organization profile page
    And I verify NPI id "<NPI> - <Has_MO>" on "Hospice" organization profile page
    And I verify "Managing Organization - <Has_MO>" on view profile of "Hospice" Organization
    And I verify "Participant Id - <Has_MO>" on view profile of "Hospice" Organization

    Examples: 
      | Description                                                                 | Has_MO | MO_Name | Hospice_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Region  | Market  | CCN | EIN | NPI | StateVerification | Organization Type | Message                                    |
      | Verification of Hospice details and count on Hospice tab under Managing org | YES    | MONAME  | HOSPICENAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Midwest | Chicago | CCN | EIN | NPI | CA                | Hospice           | Hospice Organization Successfully Created. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "Hospice" organization tab present under "Managing" Organization
    And I click on "Hospice" organization under Managing Organization
    And I search with "<Hospice_Name1>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Hospice Organization" link under No matches
    And I click on "Create New Hospice Organization" link under No matches
    And I verify "Create Hospice Organization" header text on create organization page
    And I verify "Has a Management Organization" radio button is checked
    And I verify Managing Organization is auto filled on "create Hospice" Organization page
    Then I enter <Hospice_Name> in "Hospice Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "Hospice - <CCN>" in "CCN" on create organization page
    And I provide unique "Hospice - <EIN>" in "EIN" on create organization page
    And I provide unique "Hospice - <NPI>" in "NPI" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create Hospice - <Has_MO>" organization page

    Examples: 
      | Description                                                                                                                                 | Has_MO | MO_Name | Hospice_Name | Hospice_Name1 | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Region  | Market  | CCN | EIN | NPI | Message                                    |
      | Searching invalid details on Managing Organization Profile Page and Verify navigation on Clicking Create New Hospice Organization link text | YES    | MONAME  | HOSPICENAME  | NoMatchesOrg  | Address1 | Short_Name | Address2 | City | California |       10000 | Midwest | Chicago | CCN | EIN | NPI | Hospice Organization Successfully Created. |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type        |
      | MO, Hospice |
