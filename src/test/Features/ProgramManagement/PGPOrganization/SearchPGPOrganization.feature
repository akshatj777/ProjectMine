Feature: Search the PGP organizations functionality tests

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
      | desc                                  | name    | shortName | managingOrgId | participantId | ein | npi | address1  | address2 | city           | state | zip   | marketId | expStatusCode | responseMsg | id | type |
      | Create PGP using API calls with MO    | PGPNAME | ShortName | hasChild      |               | EIN | NPI | Adderess1 | Address2 | AutomationCity | CA    | 10000 |        2 |           201 |             |  0 | pgp  |
      | Create PGP using API calls without MO | PGPNAME | ShortName |               |               | EIN | NPI | Adderess1 | Address2 | AutomationCity | CA    | 10000 |        2 |           201 |             |  0 | pgp  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    Then I verify the Search bar on "PGP" organization page
    Then I search "<SearchParam> - <Has_MO>" and verify with search list options on "PGP" organization search box

    Examples: 
      | Description                                            | Has_MO | SearchParam    |
      | Search PGP Organization with PGP orgId  - With MO      | YES    | PGP_Id         |
      | Search PGP Organization with PGP orgId  - Without MO   | NO     | PGP_Id         |
      | Search PGP Organization with EIN  - With MO            | YES    | EIN            |
      | Search PGP Organization with EIN  - Without MO         | NO     | EIN            |
      | Search PGP Organization with PGP Org Name - With MO    | YES    | PGPNAME        |
      | Search PGP Organization with PGP Org Name - Without MO | NO     | PGPNAME        |
      | Search PGP Organization with City                      |        | AutomationCity |
      | Search PGP Organization with State                     |        | CA             |
      | Search PGP Organization with Postal Code               |        |          10000 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "PGP Organization Name" field to "<Edited_PGP_Name> - <Has_MO>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForPGPNAME - <Has_MO>" organization page
    Then I search "<Edited_PGP_Name> - <Has_MO>" and verify with search list options on "PGP" organization search box
    Then I search with "<PGP_Name> - <Has_MO>" old name in organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New PGP Organization" link under No matches

    Examples: 
      | Description                                                     | Has_MO | PGP_Name | Edited_PGP_Name | Message                                |
      | Search PGP Organization after editing the PGP name - With MO    | YES    | PGPNAME  | PGPNAME         | PGP Organization Successfully Updated. |
      | Search PGP Organization after editing the PGP name - Without MO | NO     | PGPNAME  | PGPNAME         | PGP Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New PGP Organization" link under No matches

    Examples: 
      | Description                                                              | PGP_Name       |
      | Verification of error message if PGP organization is not found in search | NoMatchPGPName |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type    |
      | MO, PGP |
