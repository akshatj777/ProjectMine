Feature: Search Hospice organization functionality tests

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
    When I click on "Hospice" organization tab on organization dashboard
    Then I click on "+" button on "Hospice" organization page
    And I verify "Create Hospice Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <Hospice_Name> in "Hospice Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I select region "<Region>" in "create Hospice" organization page
    And I select market "<Market>" in "create Hospice" organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "Hospice - <CCN>" in "CCN" on create organization page
    And I provide unique "Hospice - <EIN>" in "EIN" on create organization page
    And I provide unique "Hospice - <NPI>" in "NPI" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create Hospice - <Has_MO>" organization page

    Examples: 
      | Description                                                            | Has_MO | Managing_Org | Hospice_Name | Address1 | Short_Name | Address2 | City           | State      | Postal_Code | Region  | Market  | CCN | EIN | NPI | Message                                    |
      | Create Hospice Organization with all the available fields - Without MO | NO     |              | HOSPICENAME  | Address1 | Short_Name | Address2 | AutomationCity | California |       10000 | Midwest | Chicago | CCN | EIN | NPI | Hospice Organization Successfully Created. |
      | Create Hospice Organization with all the available fields - With MO    | YES    | MONAME       | HOSPICENAME  | Address1 | Short_Name | Address2 | AutomationCity | California |       10000 | Midwest | Chicago | CCN | EIN | NPI | Hospice Organization Successfully Created. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospice" organization tab on organization dashboard
    Then I verify the Search bar on "Hospice" organization page
    Then I search "<SearchParam> - <Has_MO>" and verify with search list options on "Hospice" organization search box

    Examples: 
      | Description                                                    | Has_MO | SearchParam    |
      | Search Hospice Organization with CCN  - With MO                | YES    | CCN            |
      | Search Hospice Organization with CCN  - Without MO             | NO     | CCN            |
      | Search Hospice Organization with Hospice Org Name - With MO    | YES    | HOSPICENAME    |
      | Search Hospice Organization with Hospice Org Name - Without MO | NO     | HOSPICENAME    |
      | Search Hospice Organization with City                          |        | AutomationCity |
      | Search Hospice Organization with State                         |        | CA             |
      | Search Hospice Organization with Postal Code                   |        |          10000 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospice" organization tab on organization dashboard
    Then I search with "<Hospice_Name> - <Has_MO>" on organization in search box
    And I verify "<Hospice_Name> - <Has_MO>" field in search list on organization page
    And I click "<Hospice_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Hospice Organization Name" field to "<Edited_Hospice_Name> - <Has_MO>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "edit Hospice - <Has_MO>" organization page
    Then I search "<Edited_Hospice_Name> - <Has_MO>" and verify with search list options on "Hospice" organization search box
    Then I search with "<Hospice_Name> - <Has_MO>" old name in organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Hospice Organization" link under No matches

    Examples: 
      | Description                                                             | Has_MO | Hospice_Name | Edited_Hospice_Name | Message                                    |
      | Search Hospice Organization after editing the Hospice name - With MO    | YES    | HOSPICENAME  | HOSPICENAME         | Hospice Organization Successfully Updated. |
      | Search Hospice Organization after editing the Hospice name - Without MO | NO     | HOSPICENAME  | HOSPICENAME         | Hospice Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospice" organization tab on organization dashboard
    Then I search with "<Hospice_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Hospice Organization" link under No matches

    Examples: 
      | Description                                                                  | Hospice_Name       |
      | Verification of error message if Hospice organization is not found in search | NoMatchHospiceName |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type |
      | MO   |
