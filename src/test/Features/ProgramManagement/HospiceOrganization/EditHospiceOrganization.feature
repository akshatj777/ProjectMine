Feature: Edit Hospice organization functionality tests

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
    When I search with "<Hospice_Name> - <Has_MO>" on organization in search box
    And I verify "<Hospice_Name> - <Has_MO>" name on the header of view profile
    And I click "<Hospice_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Hospice Organization" header text on edit organization page
    And I verify Managing Organization field on "Edit Hospice - <Has_MO>" organization page
    And I edit "Hospice Organization Name" field to "<Edited_Hospice_Name>" for organization
    And I edit "Address 1" field to "<Address1>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on Edit organization page

    Examples: 
      | Description                             | Has_MO | Hospice_Name | Edited_Hospice_Name | Address1 | City | State      | Postal_Code | ValidationMsg                     |
      | Check validation for blank Hospice name | NO     | HOSPICENAME  |                     | Address1 | City | California |       10000 | Please enter an Organization Name |
      | Check validation for blank Address1     | NO     | HOSPICENAME  | HOSPICENAME         |          | City | California |       10000 | Please enter an Address           |
      | Check validation for blank City         | NO     | HOSPICENAME  | HOSPICENAME         | Address1 |      | California |       10000 | Please enter a City               |
      | Check validation for blank State        | YES    | HOSPICENAME  | HOSPICENAME         | Address1 | City |            |       10000 | Please select a State             |
      | Check validation for blank Postal code  | NO     | HOSPICENAME  | HOSPICENAME         | Address1 | City | California |             | Please enter a Postal Code        |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospice" organization tab on organization dashboard
    When I search with "<Hospice_Name> - <Has_MO>" on organization in search box
    And I verify "<Hospice_Name> - <Has_MO>" name on the header of view profile
    And I click "<Hospice_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Hospice Organization" header text on edit organization page
    And I verify Managing Organization field on "Edit Hospice - <Has_MO>" organization page
    And I edit "Hospice Organization Name" field to "<Edited_Hospice_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit "Postal Code" field to "<Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    And I verify "<ValidationMessage>" field validation message on edit organization page

    Examples: 
      | Description                                    | Has_MO | Hospice_Name | Edited_Hospice_Name                                                          | Address1                                                  | Short_Name                                     | Address2                                                  | City                                           | Postal_Code  | ValidationMessage                                              |
      | Check Character Limit for Hospice name field   | NO     | HOSPICENAME  | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |                                                           |                                                |                                                           |                                                |              | The Organization Name may not be greater than 75 characters.   |
      | Check Character Limit for Address1 field       | NO     | HOSPICENAME  |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                                                           |                                                |              | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Short Name field     | NO     | HOSPICENAME  |                                                                              |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                                                           |                                                |              | The shortName may not be greater than 45 characters.           |
      | Check Character Limit for Address2 field       | NO     | HOSPICENAME  |                                                                              |                                                           |                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |              | The second address line may not be greater than 55 characters. |
      | Check Character Limit for City field           | NO     | HOSPICENAME  |                                                                              |                                                           |                                                |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |              | The City may not be greater than 45 characters.                |
      | Check Character Limit for Postal code field    | YES    | HOSPICENAME  |                                                                              |                                                           |                                                |                                                           |                                                | 10000-00000  | Please enter a valid Postal Code                               |
      | Check Allowed Characters for Postal code field | YES    | HOSPICENAME  |                                                                              |                                                           |                                                |                                                           |                                                | abcdefghijkl | Please enter a valid Postal Code                               |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Hospice" organization tab on organization dashboard
    When I search with "<Hospice_Name> - <Has_MO>" on organization in search box
    And I verify "<Hospice_Name> - <Has_MO>" name on the header of view profile
    And I click "<Hospice_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Hospice Organization" header text on edit organization page
    And I verify Managing Organization field on "Edit Hospice - <Has_MO>" organization page
    And I edit "Hospice Organization Name" field to "<Edited_Hospice_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Address2>" for organization
    And I edit Region "<Region>" in "edit Hospice" organization page
    And I edit Market dropdown field to "<Market>" for Region "<Region>" for "Hospice" organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "edit Hospice - <Has_MO>" organization page

    Examples: 
      | Description                                                                         | Has_MO | Hospice_Name | Edited_Hospice_Name  | Address1                                                | Short_Name                                    | Address2                                                | City                                          | State      | Postal_Code | Region  | Market  | Message                                    |
      | Check Character Limit edge condition for Hospice name field - Without MO            | NO     | HOSPICENAME  | equalsTo75Characters | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | Hospice Organization Successfully Updated. |
      | Check Character Limit edge condition for Address1 field - Without MO                | NO     | HOSPICENAME  | HOSPICENAME          | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsjklmnopqrs | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | Hospice Organization Successfully Updated. |
      | Check Character Limit edge condition for Short Name field - Without MO              | NO     | HOSPICENAME  | HOSPICENAME          | Address1                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | Hospice Organization Successfully Updated. |
      | Check Character Limit edge condition for Address2 field - Without MO                | NO     | HOSPICENAME  | HOSPICENAME          | Address1                                                | Short_Name                                    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsjklmnopqrs | City                                          | California |       10000 | Midwest | Chicago | Hospice Organization Successfully Updated. |
      | Check Character Limit edge condition for City field - Without MO                    | NO     | HOSPICENAME  | HOSPICENAME          | Address1                                                | Short_Name                                    | Address2                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs | California |       10000 | Midwest | Chicago | Hospice Organization Successfully Updated. |
      | Check Character Limit edge condition for Postal code field - Without MO             | NO     | HOSPICENAME  | HOSPICENAME          | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California | 10000-0000  | Midwest | Chicago | Hospice Organization Successfully Updated. |
      #| To check the Allowed characters for the available fields in Edit Hospice Organization - Without MO | NO     | HOSPICENAME  | AllowedCharatcters   | !@$%^&*()_+{}:<>?,./;'[]\\=Address1                     | !@$%^&*()_+{}:<>?,./;'[]\\=Short_Name         | !@$%^&*()_+{}:<>?,./;'[]\\=Address2                     | !@$%^&*()_+{}:<>?,./;'[]\\=City123            | California |       10000 | Midwest | Chicago | Hospice Organization Successfully Updated.                                                           |
      | Edit Hospice Organization with Mandatory fields - Without MO                        | NO     | HOSPICENAME  | HOSPICENAME          | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         | Hospice Organization Successfully Updated. |
      | Edit Hospice Organization with Mandatory fields + ShortName - Without MO            | NO     | HOSPICENAME  | HOSPICENAME          | Address1                                                | Short_Name                                    |                                                         | City                                          | California |       10000 |         |         | Hospice Organization Successfully Updated. |
      | Edit Hospice Organization with Mandatory fields + Address2 - Without MO             | NO     | HOSPICENAME  | HOSPICENAME          | Address1                                                |                                               | Address2                                                | City                                          | California |       10000 |         |         | Hospice Organization Successfully Updated. |
      | Edit Hospice Organization with Mandatory fields + Address2 + ShortName - Without MO | NO     | HOSPICENAME  | HOSPICENAME          | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 |         |         | Hospice Organization Successfully Updated. |
      | Edit Hospice Organization with Mandatory fields - With MO                           | YES    | HOSPICENAME  | HOSPICENAME          | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         | Hospice Organization Successfully Updated. |
      | Edit Hospice Organization with all the available fields - Without MO                | NO     | HOSPICENAME  | HOSPICENAME          | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | Hospice Organization Successfully Updated. |
      | Edit Hospice Organization with all the available fields - With MO                   | YES    | HOSPICENAME  | HOSPICENAME          | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | Hospice Organization Successfully Updated. |
      | Edit Duplicate Hospice Organization with Mandatory fields - Without MO              | NO     | HOSPICENAME  | DUPLICATE_Hospice    | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         | Hospice Organization Successfully Updated. |
      | Edit Duplicate Hospice Organization with Mandatory fields - With MO                 | YES    | HOSPICENAME  | DUPLICATE_Hospice    | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         | Hospice Organization Successfully Updated. |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type |
      | MO   |
