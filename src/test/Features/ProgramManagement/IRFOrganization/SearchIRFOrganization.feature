Feature: Search IRF organization functionality tests

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
    When I click on "IRF" organization tab on organization dashboard
    Then I click on "+" button on "IRF" organization page
    And I verify "Create Inpatient Rehab Facility Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <IRF_Name> in "Inpatient Rehab Facility Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "IRF - <CCN>" in "CCN" on create organization page
    And I provide unique "IRF - <EIN>" in "EIN" on create organization page
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I select location type <Loc_Type> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create IRF - <Has_MO>" organization page

    Examples: 
      | Description                                                        | Has_MO | Managing_Org | IRF_Name | Address1 | Short_Name | Address2 | City           | State    | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | Message                                |
      | Create IRF Organization with all the available fields - Without MO | NO     |              | IRFNAME  | Address1 | Short_Name | Address2 | AutomationCity | New York |       10000 | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | irf Organization Successfully Created. |
      | Create IRF Organization with all the available fields - With MO    | YES    | MONAME       | IRFNAME  | Address1 | Short_Name | Address2 | AutomationCity | New York |       10000 | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | irf Organization Successfully Created. |

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
      | Description                                    | Has_MO | IRF_Name | SearchParam  |
      | Searching Location Name on IRF Profile Page    | YES    | IRFNAME  | Loc_Name     |
      | Searching Location Address on IRF Profile Page | YES    | IRFNAME  | Loc_Address1 |
      | Searching Location Type on IRF Profile Page    | NO     | IRFNAME  | IRF          |
      | Searching Location Region on IRF Profile Page  | NO     | IRFNAME  | Midwest      |
      | Searching Location Market on IRF Profile Page  | NO     | IRFNAME  | Chicago      |

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
    Then I verify "<Message>" after submitting the "edit IRF - <Has_MO>" organization page
    Then I search "<Edited_IRF_Name> - <Has_MO>" and verify with search list options on "IRF" organization search box
    Then I search with "<IRF_Name> - <Has_MO>" old name in organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New IRF Organization" link under No matches

    Examples: 
      | Description                                                     | Has_MO | IRF_Name | Edited_IRF_Name | Message                                |
      | Search IRF Organization after editing the IRF name - With MO    | YES    | IRFNAME  | IRFNAME         | irf Organization Successfully Updated. |
      | Search IRF Organization after editing the IRF name - Without MO | NO     | IRFNAME  | IRFNAME         | irf Organization Successfully Updated. |

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
      | type |
      | MO   |
