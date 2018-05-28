Feature: Search the Managing organization functionality test

  Background: 
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    #And I switch to new window

  Scenario Outline: <Description>
    When I click on Organization link on Program Management page
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

  Scenario Outline: Search for a managing organization after editing the Managing organization name
    When I click on Organization link on Program Management page
    Then I search with "<MO_Name>" on organization in search box
    And I verify "<MO_Name>" field in search list on organization page
    And I click "<MO_Name>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Managing Organization Name" field to "<Edited_MO_Name>" for organization
    Then I click on "Submit" button on "edit" organization page
    Then I verify "Managing Organization Successfully Updated." after submitting the "edit MO" organization page
    Then I search "<Edited_MO_Name>" and verify with search list options on "Managing" organization search box
    Then I search with "<MO_Name>" old name in organization search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Managing Organization" link under No matches

    Examples: 
      | Description                                                                     | MO_Name | Edited_MO_Name |
      | Search for a managing organization after editing the Managing organization name | MONAME  | MONAME         |

  Scenario Outline: Verification of error message if an organization is not found in search box
    When I click on Organization link on Program Management page
    Then I search with "<MO_Name>" on organization in search box
    Then I verify the "No matches" message for invalid search in Organization
    And I verify the "Create New Managing Organization" link under No matches

    Examples: 
      | Description                                                                 | MO_Name               |
      | Verification of error message if an organization is not found in search box | NoMatchMnagingOrgName |
