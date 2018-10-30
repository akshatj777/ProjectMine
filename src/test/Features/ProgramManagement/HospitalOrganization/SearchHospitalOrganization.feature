Feature: Search the Hospital organizations functionality tests

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <desc>
    Given Build Json and pass it to post method with "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ccn>" and "<ein>" and "<npi>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<locationName>" and "<locationType>" and "<marketId>" and "<locAddr1>" and "<locAddr2>" and "<locCity>" and "<locState>" and "<locZip>" and "<locationId>"
    When create org with this data "hospital"
    Then verification of Actual vs expected results <expPostCode> and "<errorMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                       | participantId | name    | shortName | managingOrgId | ccn | ein | npi | locationId | locAddr1     | locAddr2     | locCity  | locState | locZip | locationName | locationType | marketId | regionId | address1 | address2 | city           | state | zip   | expPostCode | id | type     | errorMsg |
      | Create Hospital with MO    |               | ACHNAME | shortName | hasChild      | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | CA       |  10001 | Loc_Name     | [2,4,3],[5]  |        1 |        1 | Address1 | Address2 | AutomationCity | NY    | 10000 |         201 |  0 | hospital |          |
      | Create Hospital without MO |               | ACHNAME | shortName |               | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | CA       |  10001 | Loc_Name     | [2,4,3],[5]  |        1 |        1 | Address1 | Address2 | AutomationCity | NY    | 10000 |         201 |  0 | hospital |          |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospital" organization tab on organization dashboard
    Then I verify the Search bar on "Hospital" organization page
    Then I search "<SearchParam> - <Has_MO>" and verify with search list options on "Hospital" organization search box

    Examples: 
      | Description                                                      | Has_MO | SearchParam    |
      | Search Hospital Organization with CCN  - With MO                 | YES    | CCN            |
      | Search Hospital Organization with CCN  - Without MO              | NO     | CCN            |
      | Search Hospital Organization with Hospital Org Name - With MO    | YES    | ACHNAME        |
      | Search Hospital Organization with Hospital Org Name - Without MO | NO     | ACHNAME        |
      | Search Hospital Organization with Hospital Org id - With MO      | YES    | Hosp_Id        |
      | Search Hospital Organization with Hospital Org id - Without MO   | NO     | Hosp_Id        |
      | Search Hospital Organization with City                           |        | AutomationCity |
      | Search Hospital Organization with State                          |        | NY             |
      | Search Hospital Organization with Postal Code                    |        |          10000 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    Then I search "<SearchParam>" and verify with search list options on Location in "<Hosp_Name> - <Has_MO>" profile page

    Examples: 
      | Description                                          | Has_MO | Hosp_Name | SearchParam  |
      | Searching Location index id on Hospital Profile Page | YES    | ACHNAME   | LocIndexId   |
      | Searching Location index id on Hospital Profile Page | NO     | ACHNAME   | LocIndexId   |
      | Searching Location Name on Hospital Profile Page     | YES    | ACHNAME   | Loc_Name     |
      | Searching Location Address on Hospital Profile Page  | YES    | ACHNAME   | Loc_Address1 |
      | Searching Location Region on Hospital Profile Page   | NO     | ACHNAME   | Midwest      |
      | Searching Location Matket on Hospital Profile Page   | NO     | ACHNAME   | Chicago      |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospital" organization tab on organization dashboard
    Then I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I verify "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Hospital Organization Name" field to "<Edited_Hospital_Name> - <Has_MO>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForACHNAME - <Has_MO>" organization page
    Then I search "<Edited_Hospital_Name> - <Has_MO>" and verify with search list options on "Hospital" organization search box
    Then I search with "<Hosp_Name> - <Has_MO>" old name in organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Hospital Organization" link under No matches

    Examples: 
      | Description                                                               | Has_MO | Hosp_Name | Edited_Hospital_Name | Message                                     |
      | Search Hospital Organization after editing the Hospital name - With MO    | YES    | ACHNAME   | ACHNAME              | Hospital Organization Successfully Updated. |
      | Search Hospital Organization after editing the Hospital name - Without MO | NO     | ACHNAME   | ACHNAME              | Hospital Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospital" organization tab on organization dashboard
    Then I search with "<Hosp_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Hospital Organization" link under No matches

    Examples: 
      | Description                                                                   | Hosp_Name      |
      | Verification of error message if Hospital organization is not found in search | NoMatchACHName |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type    |
      | MO, ACH |
