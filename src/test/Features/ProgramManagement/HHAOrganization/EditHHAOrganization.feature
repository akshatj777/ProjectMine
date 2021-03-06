Feature: Edit HHA organization functionality tests

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <desc>
    Given Build Json for HHA "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ein>" and "<npi>" and "<ccn>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<marketId>"
    When create hha org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                  | name    | shortName | managingOrgId | participantId | ein | npi | ccn | address1 | address2 | city | state | zip   | marketId | regionId | expStatusCode | responseMsg | id | type |
      | Create HHA with MO    | HHANAME | ShortName | hasChild      |               | EIN | NPI | CCN | Address1 | Address2 | City | CA    | 10000 |        1 |        1 |           201 |             |  0 | hha  |
      | Create HHA without MO | HHANAME | ShortName |               |               | EIN | NPI | CCN | Address1 | Address2 | City | CA    | 10000 |        1 |        1 |           201 |             |  0 | hha  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "HHA" organization tab on organization dashboard
    When I search with "<HHA_Name> - <Has_MO>" on organization in search box
    And I verify "<HHA_Name> - <Has_MO>" name on the header of view profile
    And I click "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit HHA Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit HHA - <Has_MO>" organization page
    And I verify "*HHA Organization Name" field on edit organization page
    And I verify "Short Name" field on edit organization page
    And I verify "*Address 1" field on edit organization page
    And I verify "Address 2" field on edit organization page
    And I verify "*City" field on edit organization page
    And I verify "Region" dropdown field on edit organization page
    And I verify "Market" dropdown field on edit organization page
    And I verify "*State" dropdown field on edit organization page
    And I verify "*Postal Code" field on edit organization page
    And I verify "CCN" field on edit organization page
    And I verify "EIN" field on edit organization page
    And I verify "NPI" field on edit organization page
    And I verify "Submit" button on edit organization page
    And I verify "Cancel" button on edit organization page

    Examples: 
      | Description                                                                               | Has_MO | HHA_Name |
      | Verification of availability of all the fields on Edit HHA Organization page - Without MO | NO     | HHANAME  |
      | Verification of availability of all the fields on Edit HHA Organization page - With MO    | YES    | HHANAME  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "HHA" organization tab on organization dashboard
    Then I search with "<HHA_Name> - <Has_MO>" on organization in search box
    And I verify "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I click "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit HHA Organization" header text on create organization page
    And I verify Managing Organization radio buttons status on "Edit HHA - <Has_MO>" organization page
    And I select "YES" radio button for managing organization
    Then I select "Invalid_Managing_Org" managing organization name in "YES" Has a Management Organization drop down
    And I verify "No results found" in Has a Management Organization dropdown

    Examples: 
      | Description                                                         | Has_MO | HHA_Name |
      | Check validation for Invalid Managing Organization on edit HHA page | YES    | HHANAME  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "HHA" organization tab on organization dashboard
    When I search with "<HHA_Name> - <Has_MO>" on organization in search box
    And I verify "<HHA_Name> - <Has_MO>" name on the header of view profile
    And I click "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit HHA Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit HHA - <Has_MO>" organization page
    And I edit "HHA Organization Name" field to "<Edited_HHA_Name>" for organization
    And I edit "Address 1" field to "<Address1>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on Edit organization page

    Examples: 
      | Description                            | Has_MO | HHA_Name | Edited_HHA_Name | Address1 | City | State      | Postal_Code | ValidationMsg                     |
      | Check validation for blank HHA name    | NO     | HHANAME  |                 | Address1 | City | California |       10000 | Please enter an Organization Name |
      | Check validation for blank Address1    | NO     | HHANAME  | HHANAME         |          | City | California |       10000 | Please enter an Address           |
      | Check validation for blank City        | NO     | HHANAME  | HHANAME         | Address1 |      | California |       10000 | Please enter a City               |
      | Check validation for blank State       | YES    | HHANAME  | HHANAME         | Address1 | City |            |       10000 | Please select a State             |
      | Check validation for blank Postal code | NO     | HHANAME  | HHANAME         | Address1 | City | California |             | Please enter a Postal Code        |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "HHA" organization tab on organization dashboard
    When I search with "<HHA_Name> - <Has_MO>" on organization in search box
    And I verify "<HHA_Name> - <Has_MO>" name on the header of view profile
    And I click "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit HHA Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit HHA - <Has_MO>" organization page
    And I edit "HHA Organization Name" field to "<Edited_HHA_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit "Postal Code" field to "<Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    And I verify "<ValidationMessage>" field validation message on edit organization page

    Examples: 
      | Description                                    | Has_MO | HHA_Name | Edited_HHA_Name                                                              | Address1                                                  | Short_Name                                     | Address2                                                  | City                                           | Postal_Code  | ValidationMessage                                              |
      | Check Character Limit for HHA name field       | NO     | HHANAME  | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |                                                           |                                                |                                                           |                                                |              | The Organization Name may not be greater than 75 characters.   |
      | Check Character Limit for Address1 field       | NO     | HHANAME  |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                                                           |                                                |              | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Short Name field     | NO     | HHANAME  |                                                                              |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                                                           |                                                |              | The shortName may not be greater than 45 characters.           |
      | Check Character Limit for Address2 field       | NO     | HHANAME  |                                                                              |                                                           |                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |              | The second address line may not be greater than 55 characters. |
      | Check Character Limit for City field           | NO     | HHANAME  |                                                                              |                                                           |                                                |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |              | The City may not be greater than 45 characters.                |
      | Check Character Limit for Postal code field    | YES    | HHANAME  |                                                                              |                                                           |                                                |                                                           |                                                | 10000-00000  | Please enter a valid Postal Code                               |
      | Check Allowed Characters for Postal code field | YES    | HHANAME  |                                                                              |                                                           |                                                |                                                           |                                                | abcdefghijkl | Please enter a valid Postal Code                               |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "HHA" organization tab on organization dashboard
    When I search with "<HHA_Name> - <Has_MO>" on organization in search box
    And I verify "<HHA_Name> - <Has_MO>" name on the header of view profile
    And I click "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit HHA Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit HHA - <Has_MO>" organization page
    And I edit "HHA Organization Name" field to "<Edited_HHA_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Address2>" for organization
    And I edit Region "<Region>" in "edit HHA" organization page
    And I edit Market dropdown field to "<Market>" for Region "<Region>" for "HHA" organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForHHANAME - <Has_MO>" organization page

    Examples: 
      | Description                                                                     | Has_MO | HHA_Name | Edited_HHA_Name      | Address1                                                | Short_Name                                    | Address2                                                | City                                          | State      | Postal_Code | Region  | Market  | Message                                |
      | Check Character Limit edge condition for HHA name field - Without MO            | NO     | HHANAME  | equalsTo75Characters | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | HHA Organization Successfully Updated. |
      | Check Character Limit edge condition for Address1 field - Without MO            | NO     | HHANAME  | HHANAME              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsjklmnopqrs | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | HHA Organization Successfully Updated. |
      | Check Character Limit edge condition for Short Name field - Without MO          | NO     | HHANAME  | HHANAME              | Address1                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | HHA Organization Successfully Updated. |
      | Check Character Limit edge condition for Address2 field - Without MO            | NO     | HHANAME  | HHANAME              | Address1                                                | Short_Name                                    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsjklmnopqrs | City                                          | California |       10000 | Midwest | Chicago | HHA Organization Successfully Updated. |
      | Check Character Limit edge condition for City field - Without MO                | NO     | HHANAME  | HHANAME              | Address1                                                | Short_Name                                    | Address2                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs | California |       10000 | Midwest | Chicago | HHA Organization Successfully Updated. |
      | Check Character Limit edge condition for Postal code field - Without MO         | NO     | HHANAME  | HHANAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California | 10000-0000  | Midwest | Chicago | HHA Organization Successfully Updated. |
      #| To check the Allowed characters for the available fields in Edit HHA Organization - Without MO | NO     | HHANAME  | AllowedCharatcters   | !@$%^&*()_+{}:<>?,./;'[]\\=Address1                     | !@$%^&*()_+{}:<>?,./;'[]\\=Short_Name         | !@$%^&*()_+{}:<>?,./;'[]\\=Address2                     | !@$%^&*()_+{}:<>?,./;'[]\\=City123            | California |       10000 | Midwest | Chicago | HHA Organization Successfully Updated. |
      | Edit HHA Organization with Mandatory fields - Without MO                        | NO     | HHANAME  | HHANAME              | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         | HHA Organization Successfully Updated. |
      | Edit HHA Organization with Mandatory fields + ShortName - Without MO            | NO     | HHANAME  | HHANAME              | Address1                                                | Short_Name                                    |                                                         | City                                          | California |       10000 |         |         | HHA Organization Successfully Updated. |
      | Edit HHA Organization with Mandatory fields + Address2 - Without MO             | NO     | HHANAME  | HHANAME              | Address1                                                |                                               | Address2                                                | City                                          | California |       10000 |         |         | HHA Organization Successfully Updated. |
      | Edit HHA Organization with Mandatory fields + Address2 + ShortName - Without MO | NO     | HHANAME  | HHANAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 |         |         | HHA Organization Successfully Updated. |
      | Edit HHA Organization with Mandatory fields - With MO                           | YES    | HHANAME  | HHANAME              | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         | HHA Organization Successfully Updated. |
      | Edit HHA Organization with all the available fields - Without MO                | NO     | HHANAME  | HHANAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | HHA Organization Successfully Updated. |
      | Edit HHA Organization with all the available fields - With MO                   | YES    | HHANAME  | HHANAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | HHA Organization Successfully Updated. |
  	  #| Edit Duplicate HHA Organization with Mandatory fields - Without MO                             | NO     | HHANAME  | DUPLICATE_HHA        | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         | HHA Organization Successfully Updated. |
  	  #| Edit Duplicate HHA Organization with Mandatory fields - With MO                                | YES    | HHANAME  | DUPLICATE_HHA        | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         | HHA Organization Successfully Updated. |
  
  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "HHA" organization tab on organization dashboard
    Then I search with "<HHA_Name> - <Has_MO>" on organization in search box
    And I verify "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I click "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify Managing Organization radio buttons status on "Edit HHA - <Has_MO>" organization page
    And I select "<Has_MO1>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO1>" Has a Management Organization drop down
    And I edit "HHA Organization Name" field to "<Edited_HHA_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForHHANAME - <Has_MO>" organization page
    When I search with "<HHA_Name> - <Has_MO>" on organization in search box
    And I click "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I verify "<HHA_Name> - <Has_MO>" name on the header of view profile
    And I verify "Managing Organization - <Has_MO1>" on view profile of "HHA" Organization

    Examples: 
      | Description                                        | Has_MO | Has_MO1 | Managing_Org | HHA_Name | Edited_HHA_Name | Org_Address1 | Short_Name | Org_Address2 | City | State      | Org_Postal_Code | Message                                |
      | Edit HHA organization with MO to without MO        | YES    | NO      | MO2          | HHANAME  | HHANAME         | Address1     | Short_Name | Address2     | City | California |           10000 | HHA Organization Successfully Updated. |
      | Edit verify HHA organization without MO to with MO | NO     | YES     | MO2          | HHANAME  | HHANAME         | Address1     | Short_Name | Address2     | City | California |           10000 | HHA Organization Successfully Updated. |

  Scenario Outline: Create another MO for use in while editing HHA organization
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
    When I click on "HHA" organization tab on organization dashboard
    Then I search with "<HHA_Name> - <Has_MO1>" on organization in search box
    And I verify "<HHA_Name> - <Has_MO1>" field in search list on organization page
    And I click "<HHA_Name> - <Has_MO1>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify Managing Organization radio buttons status on "Edit HHA - <Has_MO>" organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    And I edit "HHA Organization Name" field to "<Edited_HHA_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForHHANAME - <Has_MO>" organization page
    When I search with "<HHA_Name> - <Has_MO>" on organization in search box
    And I click "<HHA_Name> - <Has_MO>" field in search list on organization page
    And I verify "<HHA_Name> - <Has_MO>" name on the header of view profile
    And I verify "Managing Organization2 - <Has_MO>" on view profile of "HHA" Organization

    Examples: 
      | Description                              | Has_MO | Has_MO1 | Managing_Org | HHA_Name | Edited_HHA_Name | Org_Address1 | Short_Name | Org_Address2 | City | State      | Org_Postal_Code | Message                                |
      | Changing the MO details on edit HHA page | YES    | NO      | MO_Name2     | HHANAME  | HHANAME         | Address1     | Short_Name | Address2     | City | California |           10000 | HHA Organization Successfully Updated. |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type    |
      | MO, HHA |
