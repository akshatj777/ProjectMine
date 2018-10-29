Feature: PM-1672-Program Priority Rank

  Scenario Outline: Create Payor using API calls
    Given build Json for Payor "<name>" and "<participantId>" and "<tinEin>" and "<contactName>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create payor with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc         | participantId | name      | tinEin | contactName       | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type  |
      | Create Payor |               | PAYORNAME | EIN    | ContactPersonTest | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | payor |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify "ID" header label under "Payor" view profile page
    And I verify "Program Name" header label under "Payor" view profile page
    And I verify "Rank" header label under "Payor" view profile page
    And I verify the "Create New Program" button on view profile of "payor" Organization
    And I verify the "Rank Programs" button on view profile of "payor" Organization
    Then I click on "Rank Programs" button on "view profile of Payor" organization page
    Then I verify "Rank Program" header text on Rank program page
    Then I verify "<Payor_Name>" on Rank program page
    Then I verify Programs text on Rank program page
    And I verify "Submit" button on create organization page
    And I verify "Cancel" button on create organization page
    Then I click on "Submit" button on "create" organization page
    And I verify vadlidation meassage "<Meassage>" on "Rank peograms" page

    Examples: 
      | Description                                      | Payor_Name | Meassage                                                 |
      | Verification of details under Payor profile page | PAYORNAME  | Validation errors: Program ranking list cannot be empty. |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type  |
      | Payor |
