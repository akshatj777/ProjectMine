Feature: Hospital Organization View profile Functionality tests.

  Background: 
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    #And I switch to new window
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
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I Verify the "x" button on View page
    And I click on "x" button on particular organization
    And User should get redirected to the "Hospital" organization tab page
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify <Organization Type> in "type" on view profile of "Hospital" Organization
    And I verify <Address1> in "address1" on view profile of "Hospital" Organization
    And I verify <Address2> in "address2" on view profile of "Hospital" Organization
    And I verify <City> in "city" on view profile of "Hospital" Organization
    And I verify <StateVerification> in "state" on view profile of "Hospital" Organization
    And I verify <Postal_Code> in "zip" on view profile of "Hospital" Organization
    And I verify CCN "<CCN> - <Has_MO>" on view profile of "Hospital" organization
    And I verify EIN/TIN id "<EIN/TIN> - <Has_MO>" on view profile of "Hospital" organization
    And I verify NPI number "<NPI> - <Has_MO>" on view profile of "Hospital" organization
    And I verify Region name <Loc_Region> on view profile of "Hospital" organization
    And I verify Market name <Loc_Market> on view profile of "Hospital" organization
    And I verify "Managing Organization - <Has_MO>" on view profile of "Hospital" Organization
    And I verify "Participant Id - <Has_MO>" on view profile of "Hospital" Organization
    And I verify "1" location count on view "Hospital" organization page
    And I verify header name "ID" under "Location" for "Hospital" organization
    And I verify header name "Location Name" under "Location" for "Hospital" organization
    And I verify header name "Address" under "Location" for "Hospital" organization
    And I verify header name "Type" under "Location" for "Hospital" organization
    And I verify header name "Region" under "Location" for "Hospital" organization
    And I verify header name "Market" under "Location" for "Hospital" organization
    And I Verify the "Edit" button on View page
    And I click on "Edit" button on particular organization
    Then I click on "+" button on "Edit Hospital" organization page
    Then I verify "Location 2" on "Edit" organization page
    And I enter location name <Loc_Name> for Location "2" on "Edit" organization page
    And I enter address1 <Loc_Address1> for Location "2" on "Edit" organization page
    And I select location type <Loc_Type> for Location "2" on "Edit" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "Edit" organization page
    And I select region <Loc_Region> for Location "2" on "Edit" organization page
    And I enter city <Loc_City> for Location "2" on "Edit" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "2" on "Edit" organization page
    And I select state <Loc_State> for Location "2" on "Edit" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "Edit" organization page
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "Edit ACH - <Has_MO>" organization page
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I verify "<Hosp_Name> - <Has_MO>" name on the header of view profile
    And I verify "2" location count on view "Hospital" organization page

    Examples: 
      | Description                                                                                    | Has_MO | Hosp_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name   | Loc_Address1 | Loc_Type  | Loc_Address2 | Loc_Region | Loc_City | Loc_Market | Loc_State  | Loc_Postal_Code | CCN | EIN/TIN | NPI | StateVerification | Organization Type | Message                                     |
      | Verification of Hospital details and count of locations displayed under Hospital org - with MO | YES    | ACHNAME   | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name21 | Loc_Address1 | Inpatient | Loc_Address2 | Midwest    | Loc_City | Chicago    | California |           10000 | CCN | EIN     | NPI | CA                | ACH               | Hospital Organization Successfully Updated. |

  Scenario Outline: <Description>
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
    And I verify count of "ACH" organizations is increased by 1
    And I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I verify "<Hosp_Name> - <Has_MO>" details of "Hospital" associated on Managing Organization page
    And I verify "CCN" details of "Hospital" associated on Managing Organization page
    And I verify "<City>" details of "Hospital" associated on Managing Organization page
    And I verify "<StateVerification>" details of "Hospital" associated on Managing Organization page
    And I verify "<Postal_Code>" details of "Hospital" associated on Managing Organization page

    Examples: 
      | Description                                                                   | Has_MO | MO_Name | Hosp_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type  | Loc_Address2 | Loc_Region | Loc_City | Loc_Market | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | StateVerification | Organization Type | Message                                     |
      | Verification of Hospital details and count on Hospital tab under Managing org | YES    | MONAME  | ACHNAME   | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Inpatient | Loc_Address2 | Midwest    | Loc_City | Chicago    | California |           10000 | CCN | EIN | NPI | CA                | ACH               | Hospital Organization Successfully Created. |

  Scenario Outline: <Description>
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "ACH" organization tab present under "Managing" Organization
    And I click on "ACH" organization under Managing Organization
    And I search with "<Hosp_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Hospital Organization" link under No matches

    Examples: 
      | Description                                                             | MO_Name | Hosp_Name        |
      | Searching invalid details on Managing Organization Profile Page for ACH | MONAME  | NoMatchesACHNAME |
