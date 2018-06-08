Feature: Search the PGP organizations functionality tests

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
    Then I verify the Search bar on "PGP" organization page
    Then I search "<SearchParam> - <Has_MO>" and verify with search list options on "PGP" organization search box

    Examples: 
      | Description                                            | Has_MO | SearchParam |
      | Search PGP Organization with EIN  - With MO            | YES    | EIN         |
      | Search PGP Organization with EIN  - Without MO         | NO     | EIN         |
      | Search PGP Organization with PGP Org Name - With MO    | YES    | PGPNAME     |
      | Search PGP Organization with PGP Org Name - Without MO | NO     | PGPNAME     |
      | Search PGP Organization with City                      |        | City        |
      | Search PGP Organization with State                     |        | CA          |
      | Search PGP Organization with Postal Code               |        |       10000 |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "PGP Organization Name" field to "<Edited_PGP_Name> - <Has_MO>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "edit PGP - <Has_MO>" organization page
    Then I search "<Edited_PGP_Name> - <Has_MO>" and verify with search list options on "PGP" organization search box
    Then I search with "<PGP_Name> - <Has_MO>" old name in organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New PGP Organization" link under No matches

    Examples: 
      | Description                                                     | Has_MO | PGP_Name | Edited_PGP_Name | Message                                |
      | Search PGP Organization after editing the PGP name - With MO    | YES    | PGPNAME  | PGPNAME         | PGP Organization Successfully Updated. |
      | Search PGP Organization after editing the PGP name - Without MO | NO     | PGPNAME  | PGPNAME         | PGP Organization Successfully Updated. |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New PGP Organization" link under No matches

    Examples: 
      | Description                                                              | PGP_Name       |
      | Verification of error message if PGP organization is not found in search | NoMatchPGPName |
