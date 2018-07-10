Feature: Verification of Managing Organization details with no ACH/PGP/HHA/SNF associated to it

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: Verification of details on view profile of Managing Organization
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I Verify the "x" button on View page
    And I click on "x" button on particular organization
    And User should get redirected to the managing organization tab page
    And I verify "Managing" as default organizations tab selected on homepage
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "<MO_Name>" name on the header of view profile
    And I verify Participant Id on view profile of "Managing" Organization
    And I verify <Address1> in "address1" on view profile of "Managing" Organization
    And I verify <Address2> in "address2" on view profile of "Managing" Organization
    And I verify <City> in "city" on view profile of "Managing" Organization
    And I verify <StateInitials> in "state" on view profile of "Managing" Organization
    And I verify <Postal_Code> in "zip" on view profile of "Managing" Organization
    Then I verify <Contact_Person> in "contact-name" on view profile of "Managing" Organization
    And I verify <Contact_Phone> in "contact-phone" on view profile of "Managing" Organization
    And I verify <Contact_Email> in "contact-email" on view profile of "Managing" Organization
    And I Verify the "Edit" button on View page
    And I verify "ACH" organization tab present under "Managing" Organization
    And I verify "PGP" organization tab present under "Managing" Organization
    And I verify "SNF" organization tab present under "Managing" Organization
    And I verify "HHA" organization tab present under "Managing" Organization
    Then I verify "+" button under "Managing" organization page
    Then I verify "ACH" organization tab by default selected under Managing Organization
    And I verify "CCN" header label under "ACH" organization
    And I verify "ACH Organization Name" header label under "ACH" organization
    And I verify "City" header label under "ACH" organization
    And I verify "State" header label under "ACH" organization
    And I verify "Postal Code" header label under "ACH" organization
    And I verify the count "0 Organizations" for the associated organization
    And I click on "PGP" organization under Managing Organization
    And I verify "TIN/EIN" header label under "PGP" organization
    And I verify "PGP Organization Name" header label under "PGP" organization
    And I verify "City" header label under "PGP" organization
    And I verify "State" header label under "PGP" organization
    And I verify "Postal Code" header label under "PGP" organization
    And I verify the count "0 Organizations" for the associated organization
    And I click on "SNF" organization under Managing Organization
    And I verify "CCN" header label under "SNF" organization
    And I verify "SNF Organization Name" header label under "SNF" organization
    And I verify "City" header label under "SNF" organization
    And I verify "State" header label under "SNF" organization
    And I verify "Postal Code" header label under "SNF" organization
    And I verify the count "0 Organizations" for the associated organization
    And I click on "HHA" organization under Managing Organization
    And I verify "CCN" header label under "HHA" organization
    And I verify "HHA Organization Name" header label under "HHA" organization
    And I verify "City" header label under "HHA" organization
    And I verify "State" header label under "HHA" organization
    And I verify "Postal Code" header label under "HHA" organization
    And I verify the count "0 Organizations" for the associated organization

    Examples: 
      | Description                          | MO_Name | Contact_Person | Contact_Email      | Contact_Phone | Address1 | Address2 | City | State    | Postal_Code | StateInitials |
      | View details on Managing Org profile | MONAME  | contactPerson  | Sample@yopmail.com | 212-567-8970  | Address1 | Address2 | City | New York |       10001 | NY            |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "<MO_Name>" name on the header of view profile
    And I verify "ACH" organization tab present under "Managing" Organization
    Then I search with "<Hosp_Name>" on view profile of "Managing" Organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Hospital Organization" link under No matches
    And I click on "Create New Hospital Organization" link under No matches
    And I verify "Create Hospital Organization" header text on create organization page
    And I verify the respective Managing Organization should be pre-filled or selected on the Create organization page

    Examples: 
      | Description                                                                               | MO_Name | Hosp_Name |
      | Create new organization link for Hospital/PGP/ SNF/HHA on View Managing Organization page | MONAME  | NOMatches |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "ACH" organization tab present under "Managing" Organization
    Then I verify the Search bar on "Hospital" organization page
    And I get the count of "ACH" organizations
    Then I click on "+" button on "Managing" organization page
    And I verify "Create Hospital Organization" header text on create organization page
    And I verify "Has a Management Organization" radio button is checked
    And I verify Managing Organization is auto filled on "create Hospital" Organization page
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
    When I click on "Managing" organization tab on organization dashboard
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "ACH" organization tab present under "Managing" Organization
    And I verify count of "ACH" organizations is increased by 2
    And I search with "<Hosp_Name> - <Has_MO>" on view profile Managing Organization search box
    And I click on "<Hosp_Name> - <Has_MO>" on view profile Managing Organization search box
    And I Verify the "x" button on View page
    And I click on "x" button on particular organization
    And User should get redirected to the managing organization profile page

    Examples: 
      | Description                                                                   | Has_MO | MO_Name | Hosp_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type  | Loc_Address2 | Loc_Region | Loc_City | Loc_Market | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | StateVerification | Organization Type | Message                                     |
      | Cross button functionality on respective organization view page.	 | YES    | MONAME  | ACHNAME   | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Inpatient | Loc_Address2 | Midwest    | Loc_City | Chicago    | California |           10000 | CCN | EIN | NPI | CA                | ACH               | Hospital Organization Successfully Created. |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type |
      | MO   |
