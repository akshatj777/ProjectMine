Feature: Search SNF organization functionality tests

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
    When I click on "SNF" organization tab on organization dashboard
    Then I click on "+" button on "SNF" organization page
    And I verify "Create SNF Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <SNF_Name> in "SNF Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "SNF - <CCN>" in "CCN" on create organization page
    And I provide unique "SNF - <EIN>" in "EIN" on create organization page
    And I provide unique "SNF - <NPI>" in "NPI" on create organization page
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
    Then I verify "<Message>" after submitting the "create SNF - <Has_MO>" organization page

    Examples: 
      | Description                                                        | Has_MO | Managing_Org | SNF_Name | Address1 | Short_Name | Address2 | City           | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type        | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | Message                                |
      | Create SNF Organization with all the available fields - Without MO | NO     |              | SNFNAME  | Address1 | Short_Name | Address2 | AutomationCity | California |       10000 | Loc_Name | Loc_Address1 | Skilled Nursing | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | SNF Organization Successfully Created. |
      | Create SNF Organization with all the available fields - With MO    | YES    | MONAME       | SNFNAME  | Address1 | Short_Name | Address2 | AutomationCity | California |       10000 | Loc_Name | Loc_Address1 | Skilled Nursing | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | SNF Organization Successfully Created. |

  Scenario Outline: <Description>
    When I click on "SNF" organization tab on organization dashboard
    Then I verify the Search bar on "SNF" organization page
    Then I search "<SearchParam> - <Has_MO>" and verify with search list options on "SNF" organization search box

    Examples: 
      | Description                                            | Has_MO | SearchParam    |
      | Search SNF Organization with CCN  - With MO            | YES    | CCN            |
      | Search SNF Organization with CCN  - Without MO         | NO     | CCN            |
      | Search SNF Organization with SNF Org Name - With MO    | YES    | SNFNAME        |
      | Search SNF Organization with SNF Org Name - Without MO | NO     | SNFNAME        |
      | Search SNF Organization with City                      |        | AutomationCity |
      | Search SNF Organization with State                     |        | CA             |
      | Search SNF Organization with Postal Code               |        |          10000 |

  Scenario Outline: <Description>
    When I click on "SNF" organization tab on organization dashboard
    Then I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "SNF Organization Name" field to "<Edited_SNF_Name> - <Has_MO>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "edit SNF - <Has_MO>" organization page
    Then I search "<Edited_SNF_Name> - <Has_MO>" and verify with search list options on "SNF" organization search box
    Then I search with "<SNF_Name> - <Has_MO>" old name in organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New SNF Organization" link under No matches

    Examples: 
      | Description                                                     | Has_MO | SNF_Name | Edited_SNF_Name | Message                                |
      | Search SNF Organization after editing the SNF name - With MO    | YES    | SNFNAME  | SNFNAME         | SNF Organization Successfully Updated. |
      | Search SNF Organization after editing the SNF name - Without MO | NO     | SNFNAME  | SNFNAME         | SNF Organization Successfully Updated. |

  Scenario Outline: <Description>
    When I click on "SNF" organization tab on organization dashboard
    When I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I verify "Location" tab present under "SNF" Organization
    And I click on "Location" tab on view profile of "SNF" Organization
    Then I search "<SearchParam>" and verify with search list options on Location in "<SNF_Name> - <Has_MO>" profile page

    Examples: 
      | Description                                    | Has_MO | SNF_Name | SearchParam     |
      | Searching Location Name on SNF Profile Page    | YES    | SNFNAME  | Loc_Name        |
      | Searching Location Address on SNF Profile Page | YES    | SNFNAME  | Loc_Address1    |
      | Searching Location Type on SNF Profile Page    | NO     | SNFNAME  | Skilled Nursing |
      | Searching Location Region on SNF Profile Page  | NO     | SNFNAME  | Midwest         |
      | Searching Location Market on SNF Profile Page  | NO     | SNFNAME  | Chicago         |

  Scenario Outline: <Description>
    When I click on "SNF" organization tab on organization dashboard
    When I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I verify "Location" tab present under "SNF" Organization
    And I click on "Location" tab on view profile of "SNF" Organization
    Then I search with "<Loc_Name>" on Location search box in "SNF" View Profile page
    Then I verify the "No matches" message for invalid search in Organization

    Examples: 
      | Description                                                                    | Has_MO | SNF_Name | Loc_Name  |
      | Search SNF Organization with Location Name in SNF view profile page  - With MO | YES    | SNFNAME  | NoMatches |

  Scenario Outline: <Description>
    When I click on "SNF" organization tab on organization dashboard
    Then I search with "<SNF_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New SNF Organization" link under No matches

    Examples: 
      | Description                                                              | SNF_Name      |
      | Verification of error message if SNF organization is not found in search | NoMatchSNFOrg |
