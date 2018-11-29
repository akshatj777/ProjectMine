Feature: Search IRF organization functionality tests

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <desc>
    Given Build Json and pass it to post method with IRF "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ccn>" and "<ein>" and "<npi>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<locationName>" and "<locationType>" and "<marketId>" and "<locAddr1>" and "<locAddr2>" and "<locCity>" and "<locState>" and "<locZip>" and "<locationId>"
    When create IRF org with this data "irf"
    Then verification of Actual vs expected results <expPostCode> and "<errorMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                                  | participantId | name    | shortName | managingOrgId | ccn | ein | npi | locationId | locAddr1     | locAddr2     | locCity  | locState | locZip | locationName | locationType | marketId | regionId | address1 | address2 | city           | state | zip   | expPostCode | errorMsg | id | type |
      | Create IRF using API calls with MO    |               | IRFNAME | shortName | hasChild      | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | NY       |  10001 | Loc_Name     | [22]         |       10 |      3,2 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |          |  0 | irf  |
      | Create IRF using API calls without MO |               | IRFNAME | shortName |               | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | NY       |  10001 | Loc_Name     | [22]         |       10 |      3,2 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |          |  0 | irf  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    Then I verify the Search bar on "IRF" organization page
    Then I search "<SearchParam> - <Has_MO>" and verify with search list options on "IRF" organization search box

    Examples: 
      | Description                                            | Has_MO | SearchParam    |
      | Search IRF Organization with id  - With MO             | YES    | IRF_Id         |
      | Search IRF Organization with id  - Without MO          | NO     | IRF_Id         |
      | Search IRF Organization with CCN  - With MO            | YES    | CCN            |
      | Search IRF Organization with CCN  - Without MO         | NO     | CCN            |
      | Search IRF Organization with IRF Org Name - With MO    | YES    | IRFNAME        |
      | Search IRF Organization with IRF Org Name - Without MO | NO     | IRFNAME        |
      | Search IRF Organization with City                      |        | AutomationCity |
      | Search IRF Organization with State                     |        | NY             |
      | Search IRF Organization with Postal Code               |        |          10000 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    When I search with "<IRF_Name> - <Has_MO>" on organization in search box
    And I click "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I verify "Location" tab present under "IRF" Organization
    And I click on "Location" tab on view profile of "IRF" Organization
    Then I search "<SearchParam>" and verify with search list options on Location in "<IRF_Name> - <Has_MO>" profile page

    Examples: 
      | Description                                     | Has_MO | IRF_Name | SearchParam  |
      | Searching Location index id on IRF Profile Page | YES    | IRFNAME  | LocIndexId   |
      | Searching Location index id on IRF Profile Page | NO     | IRFNAME  | LocIndexId   |
      | Searching Location Name on IRF Profile Page     | YES    | IRFNAME  | Loc_Name     |
      | Searching Location Address on IRF Profile Page  | YES    | IRFNAME  | Loc_Address1 |
      #| Searching Location Region on IRF Profile Page   | NO     | IRFNAME  | SouthEast    |
      #| Searching Location Market on IRF Profile Page   | NO     | IRFNAME  | South        |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    Then I search with "<IRF_Name> - <Has_MO>" on organization in search box
    And I click "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Inpatient Rehab Facility Organization Name" field to "<Edited_IRF_Name> - <Has_MO>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForIRFNAME - <Has_MO>" organization page
    Then I search "<Edited_IRF_Name> - <Has_MO>" and verify with search list options on "IRF" organization search box
    Then I search with "<IRF_Name> - <Has_MO>" old name in organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New IRF Organization" link under No matches

    Examples: 
      | Description                                                     | Has_MO | IRF_Name | Edited_IRF_Name | Message                                |
      | Search IRF Organization after editing the IRF name - With MO    | YES    | IRFNAME  | IRFNAME         | IRF Organization Successfully Updated. |
      | Search IRF Organization after editing the IRF name - Without MO | NO     | IRFNAME  | IRFNAME         | IRF Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    When I search with "<IRF_Name> - <Has_MO>" on organization in search box
    And I click "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I verify "Location" tab present under "IRF" Organization
    And I click on "Location" tab on view profile of "IRF" Organization
    Then I search with "<Loc_Name>" on Location search box in "IRF" View Profile page
    Then I verify the "No matches" message for invalid search in Organization

    Examples: 
      | Description                                                                    | Has_MO | IRF_Name | Loc_Name  |
      | Search IRF Organization with Location Name in IRF view profile page  - With MO | YES    | IRFNAME  | NoMatches |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    Then I search with "<IRF_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New IRF Organization" link under No matches

    Examples: 
      | Description                                                              | IRF_Name      |
      | Verification of error message if IRF organization is not found in search | NoMatchIRFOrg |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type    |
      | MO, irf |
