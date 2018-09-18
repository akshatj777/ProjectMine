Feature: Search the LTCH organizations functionality tests

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
    Then I verify the Search bar on "LTCH" organization page
    Then I search "<SearchParam> - <Has_MO>" and verify with search list options on "LTCH" organization search box

    Examples: 
      | Description                                              | Has_MO | SearchParam    |
      | Search LTCH Organization with LTCH Org id - With MO      | YES    | LTCH_Id        |
      | Search LTCH Organization with LTCH Org id - Without MO   | NO     | LTCH_Id        |
      | Search LTCH Organization with CCN  - With MO             | YES    | CCN            |
      | Search LTCH Organization with CCN  - Without MO          | NO     | CCN            |
      | Search LTCH Organization with LTCH Org Name - With MO    | YES    | LTCHNAME       |
      | Search LTCH Organization with LTCH Org Name - Without MO | NO     | LTCHNAME       |
      | Search LTCH Organization with City                       |        | AutomationCity |
      | Search LTCH Organization with State                      |        | NY             |
      | Search LTCH Organization with Postal Code                |        |          10000 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    When I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    Then I search "<SearchParam>" and verify with search list options on Location in "<LTCH_Name> - <Has_MO>" profile page

    Examples: 
      | Description                                      | Has_MO | LTCH_Name | SearchParam             |
      | Searching Location index id on LTCH Profile Page | YES    | LTCHNAME  | LocIndexId              |
      | Searching Location index id on LTCH Profile Page | NO     | LTCHNAME  | LocIndexId              |
      | Searching Location Name on LTCH Profile Page     | YES    | LTCHNAME  | Loc_Name                |
      | Searching Location Address on LTCH Profile Page  | YES    | LTCHNAME  | Loc_Address1            |
      | Searching Location Type on LTCH Profile Page     | NO     | LTCHNAME  | Long Term Care Hospital |
      | Searching Location Region on LTCH Profile Page   | NO     | LTCHNAME  | Midwest                 |
      | Searching Location Matket on LTCH Profile Page   | NO     | LTCHNAME  | Chicago                 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    Then I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I verify "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Long-Term Care Hospital Organization Name" field to "<Edited_LTCH_Name> - <Has_MO>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForLTCHNAME - <Has_MO>" organization page
    Then I search "<Edited_LTCH_Name> - <Has_MO>" and verify with search list options on "LTCH" organization search box
    Then I search with "<LTCH_Name> - <Has_MO>" old name in organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Long-Term Care Hospital Organization" link under No matches

    Examples: 
      | Description                                                       | Has_MO | LTCH_Name | Edited_LTCH_Name | Message                                 |
      | Search LTCH Organization after editing the LTCH name - With MO    | YES    | LTCHNAME  | LTCHNAME         | LTCH Organization Successfully Updated. |
      | Search LTCH Organization after editing the LTCH name - Without MO | NO     | LTCHNAME  | LTCHNAME         | LTCH Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    Then I search with "<LTCH_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Long-Term Care Hospital Organization" link under No matches

    Examples: 
      | Description                                                               | LTCH_Name       |
      | Verification of error message if LTCH organization is not found in search | NoMatchLTCHName |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type     |
      | MO, LTCH |
