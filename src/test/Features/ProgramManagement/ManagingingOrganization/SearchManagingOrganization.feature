Feature: Search the Managing organization functionality test

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    Then I verify the Search bar on "Managing" organization page
    Then I search "<SearchParam>" and verify with search list options on "Managing" organization search box

    Examples: 
      | Description                                             | SearchParam |
      | Search Managing Organization with Postal Code           |       10001 |
      | Search Managing Organization with State                 | NY          |
      | Search Managing Organization with City                  | City        |
      | Search Managing Organization with Managing Organization | MONAME      |
      | Search Managing Organization with Paticipant ID         | PID         |
      | Search Managing Organization with ID                    | MO_ID       |

  Scenario Outline: Search for a managing organization after editing the Managing organization name
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    Then I search with "<MO_Name>" on organization in search box
    And I verify "<MO_Name>" field in search list on organization page
    And I click "<MO_Name>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Managing Organization Name" field to "<Edited_MO_Name>" for organization
    Then I click on "Submit" button on "edit" organization page
    Then I verify "Managing Organization Successfully Updated." after submitting the "FETCHFROMAPI" organization page
    Then I search "<Edited_MO_Name>" and verify with search list options on "Managing" organization search box
    Then I search with "<MO_Name>" old name in organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Managing Organization" link under No matches

    Examples: 
      | Description                                                                     | MO_Name | Edited_MO_Name | type       | id |
      | Search for a managing organization after editing the Managing organization name | MONAME  | MONAME         | management |  0 |

  Scenario Outline: Verification of error message if an organization is not found in search box
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    Then I search with "<MO_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Managing Organization" link under No matches

    Examples: 
      | Description                                                                 | MO_Name               |
      | Verification of error message if an organization is not found in search box | NoMatchMnagingOrgName |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type |
      | MO   |
