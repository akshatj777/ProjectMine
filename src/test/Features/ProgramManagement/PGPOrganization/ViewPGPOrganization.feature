Feature: View Functionality tests for PGP Organization.

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <desc>
    Given Build Json for PGP "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ein>" and "<npi>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<marketId>"
    When create pgp org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                                  | name    | shortName | managingOrgId | participantId | ein | npi | address1 | address2 | city           | state | zip   | marketId | regionId | expStatusCode | responseMsg | id | type |
      | Create PGP using API calls with MO    | PGPNAME | ShortName | hasChild      |               | EIN | NPI | Address1 | Address2 | AutomationCity | CA    | 10000 |        1 |        1 |           201 |             |  0 | pgp  |
      | Create PGP using API calls without MO | PGPNAME | ShortName |               |               | EIN | NPI | Address1 | Address2 | AutomationCity | CA    | 10000 |        1 |        1 |           201 |             |  0 | pgp  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify the url after creation of an organization on view profile of "PGP" organization

    Examples: 
      | Description                                                                    | Has_MO | PGP_Name |
      | Verify PGP org shortName in Url after creating under profile page - with MO    | YES    | PGPNAME  |
      | Verify PGP org shortName in Url after creating under profile page - without MO | NO     | PGPNAME  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I Verify the "x" button on View page
    And I click on "x" button on particular organization
    And User should get redirected to the "PGP" organization tab page
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify <Organization Type> in "type" on view profile of "PGP" Organization
    And I verify <Address1> in "address1" on view profile of "PGP" Organization
    And I verify <Address2> in "address2" on view profile of "PGP" Organization
    And I verify <City> in "city" on view profile of "PGP" Organization
    #And I verify Region name <Region> on view profile of "PGP" organization
    #And I verify Market name <Market> on view profile of "PGP" organization
    And I verify <StateVerification> in "state" on view profile of "PGP" Organization
    And I verify <Postal_Code> in "zip" on view profile of "PGP" Organization
    And I verify EIN/TIN id "<EIN/TIN> - <Has_MO>" on view profile of "PGP" organization
    And I verify NPI number "<NPI> - <Has_MO>" on view profile of "PGP" organization
    And I verify "Managing Organization - <Has_MO>" on view profile of "PGP" Organization
    And I verify "Participant Id - <Has_MO>" on view profile of "PGP" Organization
    And I Verify the "Edit" button on View page

    Examples: 
      | Description                                                             | Has_MO | PGP_Name | Address1 | Short_Name | Address2 | Region  | Market  | City           | State      | Postal_Code | EIN/TIN | NPI | StateVerification | Organization Type |
      | Verification of PGP Organization details on PGP view page  - without MO | NO     | PGPNAME  | Address1 | Short_Name | Address2 | Midwest | Chicago | AutomationCity | California |       10000 | EIN     | NPI | CA                | PGP               |
      | Verification of PGP Organization details on PGP view page - with MO     | YES    | PGPNAME  | Address1 | Short_Name | Address2 | Midwest | Chicago | AutomationCity | California |       10000 | EIN     | NPI | CA                | PGP               |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "PGP" organization tab present under "Managing" Organization
    And I click on "PGP" organization under Managing Organization
    And I get the count of "PGP" organizations
    And I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" details of "PGP" associated on Managing Organization page
    And I verify "TIN/EIN" details of "PGP" associated on Managing Organization page
    And I verify "<City>" details of "PGP" associated on Managing Organization page
    And I verify "<StateVerification>" details of "PGP" associated on Managing Organization page
    And I verify "<Postal_Code>" details of "PGP" associated on Managing Organization page
    Then I click on "+" button on "MO Profile" organization page
    And I verify "Create PGP Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <PGP_Name> in "PGP Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "PGP - <EIN>" in "EIN" on create organization page
    And I provide unique "PGP - <NPI>" in "NPI" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create PGP - <Has_MO>" organization page
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "PGP" organization tab present under "Managing" Organization
    And I click on "PGP" organization under Managing Organization
    And I search with "<PGP_Name> - <Has_MO>" on view profile Managing Organization search box
    And I verify "<PGP_Name> - <Has_MO>" details of "Hospice" associated on Managing Organization page
    And I click "<PGP_Name> - <Has_MO>" for "Hospice" organization under MO profile page
    And I verify <Organization Type> in "type" on view profile of "PGP" Organization
    And I verify <Address1> in "address1" on view profile of "PGP" Organization
    And I verify <Address2> in "address2" on view profile of "PGP" Organization
    And I verify <City> in "city" on view profile of "PGP" Organization
    And I verify <StateVerification> in "state" on view profile of "PGP" Organization
    And I verify <Postal_Code> in "zip" on view profile of "PGP" Organization
    And I verify EIN/TIN id "<EIN/TIN> - <Has_MO>" on view profile of "PGP" organization
    And I verify NPI number "<NPI> - <Has_MO>" on view profile of "PGP" organization
    And I verify "Managing Organization - <Has_MO>" on view profile of "PGP" Organization
    And I verify "Participant Id - <Has_MO>" on view profile of "PGP" Organization

    Examples: 
      | Description                                                       | Has_MO | MO_Name | PGP_Name | Address1 | Address2 | City | State      | Postal_Code | TIN/EIN | NPI | StateVerification | Organization Type | Message                                |
      | Searching PGP Organization Details on Managing Profile Page - PGP | YES    | MONAME  | PGPNAME  | Address1 | Address2 | City | California |       10000 | EIN     | NPI | CA                | PGP               | PGP Organization Successfully Created. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "PGP" organization tab present under "Managing" Organization
    And I click on "PGP" organization under Managing Organization
    And I search with "<PGP_Name1>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New PGP Organization" link under No matches
    And I click on "Create New PGP Organization" link under No matches
    And I verify "Create PGP Organization" header text on create organization page
    And I verify "Has a Management Organization" radio button is checked
    And I verify Managing Organization is auto filled on "create PGP" Organization page
    Then I enter <PGP_Name> in "PGP Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "PGP - <EIN>" in "EIN" on create organization page
    And I provide unique "PGP - <NPI>" in "NPI" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create PGP - <Has_MO>" organization page

    Examples: 
      | Description                                                             | Has_MO | Managing_Org | PGP_Name1       | PGP_Name | Address1 | Short_Name | Address2 | City | Region  | Market  | State      | Postal_Code | EIN | NPI | Message                                |
      | Searching invalid details on Managing Organization Profile Page for PGP | NO     |              | NoMatchesForPGP | PGPNAME  | Address1 | Short_Name | Address2 | City | Midwest | Chicago | California |       10000 | EIN | NPI | PGP Organization Successfully Created. |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type    |
      | MO, PGP |
