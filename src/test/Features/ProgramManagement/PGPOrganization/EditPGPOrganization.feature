Feature: Edit PGP organization functionality tests

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <desc>
    Given Build Json for PGP "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ein>" and "<npi>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<marketId>"
    When create pgp org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                                  | name    | shortName | managingOrgId | participantId | ein | npi | address1  | address2 | city           | state | zip   | marketId | expStatusCode | responseMsg | id | type |
      | Create PGP using API calls with MO    | PGPNAME | ShortName | hasChild      |               | EIN | NPI | Adderess1 | Address2 | AutomationCity | CA    | 10000 |        2 |           201 |             |  0 | pgp  |
      | Create PGP using API calls without MO | PGPNAME | ShortName |               |               | EIN | NPI | Adderess1 | Address2 | AutomationCity | CA    | 10000 |        2 |           201 |             |  0 | pgp  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit PGP Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit PGP - <Has_MO>" organization page
    And I verify "*PGP Organization Name" field on edit organization page
    And I verify "Short Name" field on edit organization page
    And I verify "Address 1" field on edit organization page
    And I verify "Address 2" field on edit organization page
    And I verify "City" field on edit organization page
    And I verify "Region" dropdown field on edit organization page
    And I verify "Market" dropdown field on edit organization page
    And I verify "State" dropdown field on edit organization page
    And I verify "Postal Code" field on edit organization page
    And I verify "ein" identifier is not editable
    And I verify "npi" identifier is not editable
    And I verify "Submit" button on edit organization page
    And I verify "Cancel" button on edit organization page

    Examples: 
      | Description                                                                  | Has_MO | PGP_Name |
      | Verification of availability of all the fields on Edit PGP Organization page | NO     | PGPNAME  |
      | Verification of availability of all the fields on Edit PGP Organization page | YES    | PGPNAME  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit PGP Organization" header text on create organization page
    And I verify Managing Organization radio buttons status on "Edit PGP - <Has_MO>" organization page
    And I select "YES" radio button for managing organization
    Then I select "Invalid_Managing_Org" managing organization name in "YES" Has a Management Organization drop down
    And I verify "No results found" in Has a Management Organization dropdown

    Examples: 
      | Description                                                         | Has_MO | PGP_Name |
      | Check validation for Invalid Managing Organization on edit PGP page | YES    | PGPNAME  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit PGP Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit PGP - <Has_MO>" organization page
    And I edit "PGP Organization Name" field to "<Edited_PGP_Name>" for organization
    Then I click on "Submit" button on "Edit" organization page
    And I verify "<ValidationMessage>" field validation message on edit organization page

    Examples: 
      | Description                         | Has_MO | PGP_Name | Edited_PGP_Name | ValidationMessage                 |
      | Check validation for blank PGP name | NO     | PGPNAME  |                 | Please enter an Organization Name |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit PGP Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit PGP - <Has_MO>" organization page
    And I edit "PGP Organization Name" field to "<Edited_PGP_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit "Postal Code" field to "<Postal_Code>" for organization
    And I switch the focus to "submit" button
    And I verify "<ValidationMessage>" field validation message on edit organization page

    Examples: 
      | Description                                    | Has_MO | PGP_Name | Edited_PGP_Name                                                              | Address1                                                                | Short_Name                                     | Address2                                                                | City                                           | Postal_Code  | ValidationMessage                                              |
      | Check Character Limit for PGP name field       | YES    | PGPNAME  | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |                                                                         |                                                |                                                                         |                                                |              | The Organization Name may not be greater than 75 characters.   |
      | Check Character Limit for Address1 field       | YES    | PGPNAME  |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstvwxyzabcdefghijklmnopqrst |                                                |                                                                         |                                                |              | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Short Name field     | YES    | PGPNAME  |                                                                              |                                                                         | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                                                                         |                                                |              | The shortName may not be greater than 45 characters.           |
      | Check Character Limit for Address2 field       | NO     | PGPNAME  |                                                                              |                                                                         |                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstvwxyzabcdefghijklmnopqrst |                                                |              | The second address line may not be greater than 55 characters. |
      | Check Character Limit for City field           | NO     | PGPNAME  |                                                                              |                                                                         |                                                |                                                                         | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |              | The City may not be greater than 45 characters.                |
      | Check Character Limit for Postal code field    | NO     | PGPNAME  |                                                                              |                                                                         |                                                |                                                                         |                                                | 10000-00000  | Please enter a valid Postal Code                               |
      | Check Allowed Characters for Postal code field | YES    | PGPNAME  |                                                                              |                                                                         |                                                |                                                                         |                                                | abcdefghijkl | Please enter a valid Postal Code                               |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit PGP Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit PGP - <Has_MO>" organization page
    And I edit "PGP Organization Name" field to "<Edited_PGP_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Address2>" for organization
    And I edit Region "<Region>" in "edit PGP" organization page
    And I edit Market dropdown field to "<Market>" for Region "<Region>" for "PGP" organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForPGPNAME - <Has_MO>" organization page

    Examples: 
      | Description                                                                                                                                | Has_MO | Managing_Org | PGP_Name | Edited_PGP_Name | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Region  | Market  | State      | Postal_Code | Message                                |
      #| Check Character Limit edge condition for PGP Name field on Edit PGP Organization - Without MO                                              | NO     |              | PGPNAME  | equalsTo75Characters | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Check Character Limit edge condition for Address1 field on Edit PGP Organization - Without MO                                              | NO     |              | PGPNAME  | PGPNAME         | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklm | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Check Character Limit edge condition for Short Name field on Edit PGP Organization - Without MO                                            | NO     |              | PGPNAME  | PGPNAME         | Address1                                                | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabc | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Check Character Limit edge condition for Address2 field on Edit PGP Organization - Without MO                                              | NO     |              | PGPNAME  | PGPNAME         | Address1                                                | Short_Name                                    | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklm | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Check Character Limit edge condition for City field on Edit PGP Organization - Without MO                                                  | NO     |              | PGPNAME  | PGPNAME         | Address1                                                | Short_Name                                    | Address2                                                | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabc | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Check Character Limit edge condition for Postal code field on Edit PGP Organization - Without MO                                           | NO     |              | PGPNAME  | PGPNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California | 10000-6326  | PGP Organization Successfully Updated. |
      #| To check the Allowed characters for the available fields in Edit PGP Organization - Without MO                                             | NO     |              | PGPNAME  | AllowedCharatcters   | !@$%^&*()_+{}:<>?,./;'[]\\=Address1                     | !@$%^&*()_+{}:<>?,./;'[]\\=Short_Name         | !@$%^&*()_+{}:<>?,./;'[]\\=Address2                     | !@$%^&*()_+{}:<>?,./;'[]\\=City123            | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Edit PGP Organization with Mandatory fields - Without MO                                                                                   | NO     |              | PGPNAME  | PGPNAME         |                                                         |                                               |                                                         |                                               |         |         |            |             | PGP Organization Successfully Updated. |
      | Edit PGP Organization with Mandatory fields - With MO                                                                                      | YES    | MONAME       | PGPNAME  | PGPNAME         |                                                         |                                               |                                                         |                                               |         |         |            |             | PGP Organization Successfully Updated. |
      | Edit PGP Organization with Mandatory fields + Address1 + Short Name + Address2 + City + State + Region + Market + postal Code - Without MO | YES    |              | PGPNAME  | PGPNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Edit PGP Organization with Mandatory fields + Address1 + Short Name + City + State + Region + Market + postal Code - With MO               | YES    | MONAME       | PGPNAME  | PGPNAME         | Address1                                                | Short_Name                                    |                                                         | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Edit PGP Organization with Mandatory fields + Address1 + Short Name + Address2 + City + State + postal Code- Without MO                    | YES    |              | PGPNAME  | PGPNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          |         |         | California |       10001 | PGP Organization Successfully Updated. |
      | Edit PGP Organization with all the available fields - Without MO                                                                           | NO     |              | PGPNAME  | PGPNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Edit PGP Organization with all the available fields - With MO                                                                              | YES    | MONAME       | PGPNAME  | PGPNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
  		#| Edit Duplicate PGP Organization with all the available fields - Without MO                                                                 | NO     |              | PGPNAME  | DUPLICATE_PGP   | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
  		#| Edit Duplicate PGP Organization with all the available fields - With MO                                                                    | YES    | MONAME       | PGPNAME  | DUPLICATE_PGP   | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
  
  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify Managing Organization radio buttons status on "Edit PGP - <Has_MO>" organization page
    And I select "<Has_MO1>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO1>" Has a Management Organization drop down
    And I edit "PGP Organization Name" field to "<Edited_PGP_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForPGPNAME - <Has_MO>" organization page
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Managing Organization - <Has_MO1>" on view profile of "PGP" Organization

    Examples: 
      | Description                                        | Has_MO | Has_MO1 | Managing_Org | PGP_Name | Edited_PGP_Name | Org_Address1 | Short_Name | Org_Address2 | City | State      | Org_Postal_Code | Message                                |
      | Edit PGP organization with MO to without MO        | YES    | NO      | MO2          | PGPNAME  | PGPNAME         | Address1     | Short_Name | Address2     | City | California |           10000 | PGP Organization Successfully Updated. |
      | Edit verify PGP organization without MO to with MO | NO     | YES     | MO2          | PGPNAME  | PGPNAME         | Address1     | Short_Name | Address2     | City | California |           10000 | PGP Organization Successfully Updated. |

  Scenario Outline: Create another MO for use in while editing Hospital organization
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
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO1>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO1>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO1>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify Managing Organization radio buttons status on "Edit PGP - <Has_MO>" organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    And I edit "PGP Organization Name" field to "<Edited_PGP_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForPGPNAME - <Has_MO>" organization page
    When I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I verify "<PGP_Name> - <Has_MO>" name on the header of view profile
    And I verify "Managing Organization2 - <Has_MO>" on view profile of "PGP" Organization

    Examples: 
      | Description                              | Has_MO | Has_MO1 | Managing_Org | PGP_Name | Edited_PGP_Name | Org_Address1 | Short_Name | Org_Address2 | City | State      | Org_Postal_Code | Message                                |
      | Changing the MO details on edit PGP page | YES    | NO      | MO_Name2     | PGPNAME  | PGPNAME         | Address1     | Short_Name | Address2     | City | California |           10000 | PGP Organization Successfully Updated. |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type    |
      | MO, PGP |
