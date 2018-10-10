Feature: View Payor Organization functionality tests

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
    And I verify the url after creation of an organization on view profile of "Payor" organization

    Examples: 
      | Description                  | Payor_Name |
      | Verify payor Org name in url | PAYORNAME  |

  Scenario Outline: Verification of details on view profile of Payor Organization
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I Verify the "x" button on View page
    And I click on "x" button on particular organization
    And User should get redirected to the "Payor" organization tab page
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify <Organization Type> in "type" on view profile of "Payor" Organization
    And I verify <Address1> in "address1" on view profile of "Payor" Organization
    And I verify <Address2> in "address2" on view profile of "Payor" Organization
    And I verify <City> in "city" on view profile of "Payor" Organization
    And I verify <StateInitials> in "state" on view profile of "Payor" Organization
    And I verify <Postal_Code> in "zip" on view profile of "Payor" Organization
    Then I verify <Contact_Person> in "contact-name" on view profile of "Payor" Organization
    And I verify <Contact_Phone> in "contact-phone" on view profile of "Payor" Organization
    And I verify <Contact_Email> in "contact-email" on view profile of "Payor" Organization
    And I Verify the "Edit" button on View page
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify the "Create New Program" button on view profile of "payor" Organization
    And I verify "Contracts" tab present under "Payor" Organization

    Examples: 
      | Description                       | Payor_Name | Contact_Person    | Contact_Email      | Contact_Phone | Address1 | Address2 | City | State    | Postal_Code | StateInitials | Organization Type |
      | View details on Payor Org profile | PAYORNAME  | ContactPersonTest | Sample@yopmail.com | 212-567-8970  | Address1 | Address2 | City | New York |       10001 | NY            | Payor             |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type  |
      | Payor |
