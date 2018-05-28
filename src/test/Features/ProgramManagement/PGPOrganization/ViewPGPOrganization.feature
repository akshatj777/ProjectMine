Feature: View Functionality tests for PGP Organization.

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
    And I verify Region name <Region> on view profile of "PGP" organization
    And I verify Market name <Market> on view profile of "PGP" organization
    And I verify <StateVerification> in "state" on view profile of "PGP" Organization
    And I verify <Postal_Code> in "zip" on view profile of "PGP" Organization
    And I verify EIN/TIN id "<EIN/TIN> - <Has_MO>" on view profile of "PGP" organization
    And I verify NPI number "<NPI> - <Has_MO>" on view profile of "PGP" organization
    And I verify "Managing Organization - <Has_MO>" on view profile of "PGP" Organization
    And I verify "Participant Id - <Has_MO>" on view profile of "PGP" Organization
    And I Verify the "Edit" button on View page

    Examples: 
      | Description                                                             | Has_MO | PGP_Name | Address1 | Short_Name | Address2 | Region  | Market  | City | State      | Postal_Code | EIN/TIN | NPI | StateVerification | Organization Type |
      | Verification of PGP Organization details on PGP view page  - without MO | NO     | PGPNAME  | Address1 | Short_Name | Address2 | Midwest | Chicago | City | California |       10000 | EIN     | NPI | CA                | PGP               |
      | Verification of PGP Organization details on PGP view page - with MO     | YES    | PGPNAME  | Address1 | Short_Name | Address2 | Midwest | Chicago | City | California |       10000 | EIN     | NPI | CA                | PGP               |

  Scenario Outline: <Description>
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

    Examples: 
      | Description                                                       | Has_MO | MO_Name | PGP_Name | City | State      | Postal_Code | TIN/EIN | NPI | StateVerification |
      | Searching PGP Organization Details on Managing Profile Page - PGP | YES    | MONAME  | PGPNAME  | City | California |       10000 | EIN     | NPI | CA                |

  Scenario Outline: <Description>
    When I search with "<MO_Name>" on organization in search box
    And I click "<MO_Name>" field in search list on organization page
    And I verify "PGP" organization tab present under "Managing" Organization
    And I click on "PGP" organization under Managing Organization
    And I search with "<PGP_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New PGP Organization" link under No matches

    Examples: 
      | Description                                                             | MO_Name | PGP_Name         |
      | Searching invalid details on Managing Organization Profile Page for PGP | MONAME  | NoMatchesPGPNAME |
