Feature: Search the Hospital organizations functionality tests

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
    When I click on "Hospital" organization tab on organization dashboard
    Then I click on "+" button on "Hospital" organization page
    And I verify "Create Hospital Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <Hosp_Name> in "Hospital Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "ACH - <CCN>" in "CCN" on create organization page
    And I provide unique "ACH - <EIN>" in "EIN" on create organization page
    And I provide unique "ACH - <NPI>" in "NPI" on create organization page
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
    Then I verify "<Message>" after submitting the "create ACH - <Has_MO>" organization page

    Examples: 
      | Description                                                             | Has_MO | Managing_Org | Hosp_Name | Address1 | Short_Name | Address2 | City           | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type  | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | Message                                     |
      | Create Hospital Organization with all the available fields - Without MO | NO     |              | ACHNAME   | Address1 | Short_Name | Address2 | AutomationCity | California |       10000 | Loc_Name | Loc_Address1 | Inpatient | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | Hospital Organization Successfully Created. |
      | Create Hospital Organization with all the available fields - With MO    | YES    | MONAME       | ACHNAME   | Address1 | Short_Name | Address2 | AutomationCity | California |       10000 | Loc_Name | Loc_Address1 | Inpatient | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | Hospital Organization Successfully Created. |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    Then I verify the Search bar on "Hospital" organization page
    Then I search "<SearchParam> - <Has_MO>" and verify with search list options on "Hospital" organization search box

    Examples: 
      | Description                                                      | Has_MO | SearchParam    |
      | Search Hospital Organization with CCN  - With MO                 | YES    | CCN            |
      | Search Hospital Organization with CCN  - Without MO              | NO     | CCN            |
      | Search Hospital Organization with Hospital Org Name - With MO    | YES    | ACHNAME        |
      | Search Hospital Organization with Hospital Org Name - Without MO | NO     | ACHNAME        |
      | Search Hospital Organization with City                           |        | AutomationCity |
      | Search Hospital Organization with State                          |        | CA             |
      | Search Hospital Organization with Postal Code                    |        |          10000 |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    Then I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I verify "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Hospital Organization Name" field to "<Edited_Hospital_Name> - <Has_MO>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "edit ACH - <Has_MO>" organization page
    Then I search "<Edited_Hospital_Name> - <Has_MO>" and verify with search list options on "Hospital" organization search box
    Then I search with "<Hosp_Name> - <Has_MO>" old name in organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Hospital Organization" link under No matches

    Examples: 
      | Description                                                               | Has_MO | Hosp_Name | Edited_Hospital_Name | Message                                     |
      | Search Hospital Organization after editing the Hospital name - With MO    | YES    | ACHNAME   | ACHNAME              | Hospital Organization Successfully Updated. |
      | Search Hospital Organization after editing the Hospital name - Without MO | NO     | ACHNAME   | ACHNAME              | Hospital Organization Successfully Updated. |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    When I search with "<Hosp_Name> - <Has_MO>" on organization in search box
    And I click "<Hosp_Name> - <Has_MO>" field in search list on organization page
    Then I search "<SearchParam>" and verify with search list options on Location in "<Hosp_Name> - <Has_MO>" profile page

    Examples: 
      | Description                                         | Has_MO | Hosp_Name | SearchParam  |
      | Searching Location Name on Hospital Profile Page    | YES    | ACHNAME   | Loc_Name     |
      | Searching Location Address on Hospital Profile Page | YES    | ACHNAME   | Loc_Address1 |
      | Searching Location Type on Hospital Profile Page    | NO     | ACHNAME   | Inpatient    |
      | Searching Location Region on Hospital Profile Page  | NO     | ACHNAME   | Midwest      |
      | Searching Location Matket on Hospital Profile Page  | NO     | ACHNAME   | Chicago      |

  Scenario Outline: <Description>
    When I click on "Hospital" organization tab on organization dashboard
    Then I search with "<Hosp_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Hospital Organization" link under No matches

    Examples: 
      | Description                                                                   | Hosp_Name      |
      | Verification of error message if Hospital organization is not found in search | NoMatchACHName |
