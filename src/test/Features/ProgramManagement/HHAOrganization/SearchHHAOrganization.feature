Feature: Search the HHA organizations functionality tests

  Background: 
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    #And I switch to new window
    When I click on Organization link on Program Management page

  Scenario Outline: <Description>
    Then I verify "+" button under "Managing" organization page
    Then I click on "+" button on "Managing" organization page
    And I verify "Create Managing Organization" header text on create organization page
    Then I enter <MO_Name> in "Managing Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Contact_Person> in "Contact Person" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <Contact_Email> in "Contact Email" on create organization page
    And I enter <City> in "City" on create organization page
    And I enter <Contact_Phone> in "Contact Phone" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create MO" organization page

    Examples: 
      | Description                                            | MO_Name | Contact_Person    | Contact_Email      | Contact_Phone | Address1 | Address2 | City | State    | Postal_Code | Message                                     |
      | Create Managing Organization with all available fields | MONAME  | ContactPersonTest | Sample@yopmail.com |    5555599999 | Address1 | Address2 | City | New York |       10001 | Managing Organization Successfully Created. |

  Scenario Outline: <Description>
    When I click on "HHA" organization tab on organization dashboard
    Then I click on "+" button on "HHA" organization page
    And I verify "Create HHA Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <HHA_Name> in "HHA Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I select region "<Region>" in "create HHA" organization page
    And I select market "<Market>" in "create HHA" organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "HHA - <CCN>" in "CCN" on create organization page
    And I provide unique "HHA - <EIN>" in "EIN" on create organization page
    And I provide unique "HHA - <NPI>" in "NPI" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create HHA - <Has_MO>" organization page

    Examples: 
      | Description                                                        | Has_MO | Managing_Org | HHA_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Region  | Market  | CCN | EIN | NPI | Message                                |
      | Create HHA Organization with all the available fields - Without MO | NO     |              | HHANAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Midwest | Chicago | CCN | EIN | NPI | HHA Organization Successfully Created. |
      | Create HHA Organization with all the available fields - With MO    | YES    | MONAME       | HHANAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Midwest | Chicago | CCN | EIN | NPI | HHA Organization Successfully Created. |

  Scenario Outline: <Description>
    When I click on "HHA" organization tab on organization dashboard
    Then I verify the Search bar on "HHA" organization page
    Then I search "<SearchParam> - <Has_MO>" and verify with search list options on "HHA" organization search box

    Examples: 
      | Description                                            | Has_MO | SearchParam |
      | Search HHA Organization with CCN  - With MO            | YES    | CCN         |
      | Search HHA Organization with CCN  - Without MO         | NO     | CCN         |
      | Search HHA Organization with HHA Org Name - With MO    | YES    | HHANAME     |
      | Search HHA Organization with HHA Org Name - Without MO | NO     | HHANAME     |
      | Search HHA Organization with City                      |        | City        |
      | Search HHA Organization with State                     |        | CA          |
      | Search HHA Organization with Postal Code               |        |       10000 |

  Scenario Outline: <Description>
    When I click on "HHA" organization tab on organization dashboard
    Then I search with "<HHA_Name> - <Has_MO>" on organization in search box
    And I verify "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I click "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "HHA Organization Name" field to "<Edited_HHA_Name> - <Has_MO>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "edit HHA - <Has_MO>" organization page
    Then I search "<Edited_HHA_Name> - <Has_MO>" and verify with search list options on "HHA" organization search box
    Then I search with "<HHA_Name> - <Has_MO>" old name in organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New HHA Organization" link under No matches

    Examples: 
      | Description                                                     | Has_MO | HHA_Name | Edited_HHA_Name | Message                                |
      | Search HHA Organization after editing the HHA name - With MO    | YES    | HHANAME  | HHANAME         | HHA Organization Successfully Updated. |
      | Search HHA Organization after editing the HHA name - Without MO | NO     | HHANAME  | HHANAME         | HHA Organization Successfully Updated. |

  Scenario Outline: <Description>
    When I click on "HHA" organization tab on organization dashboard
    Then I search with "<HHA_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New HHA Organization" link under No matches

    Examples: 
      | Description                                                              | HHA_Name       |
      | Verification of error message if HHA organization is not found in search | NoMatchHHAName |
