Feature: Edit PGP organization functionality tests

  Background: 
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
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
    When I click on "PGP" organization tab on organization dashboard
    Then I click on "+" button on "PGP" organization page
    And I verify "Create PGP Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <PGP_Name> in "PGP Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select region "<Region>" in "create PGP" organization page
    And I select market "<Market>" in "create PGP" organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "PGP - <EIN>" in "EIN" on create organization page
    And I provide unique "PGP - <NPI>" in "NPI" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create PGP - <Has_MO>" organization page

    Examples: 
      | Description                                                        | Has_MO | Managing_Org | PGP_Name | Address1 | Short_Name | Address2 | City | Region  | Market  | State      | Postal_Code | EIN | NPI | Message                                |
      | Create PGP Organization with all the available fields - Without MO | NO     |              | PGPNAME  | Address1 | Short_Name | Address2 | City | Midwest | Chicago | California |       10000 | EIN | NPI | PGP Organization Successfully Created. |
      | Create PGP Organization with all the available fields - With MO    | YES    | MONAME       | PGPNAME  | Address1 | Short_Name | Address2 | City | Midwest | Chicago | California |       10000 | EIN | NPI | PGP Organization Successfully Created. |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit PGP Organization" header text on edit organization page
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

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit PGP Organization" header text on edit organization page
    And I edit "PGP Organization Name" field to "<Edited_PGP_Name>" for organization

    Examples: 
      | Description                         | Has_MO | PGP_Name | Edited_PGP_Name | ValidationMsg                     |
      | Check validation for blank PGP name | NO     | PGPNAME  |                 | Please enter an Organization Name |

  Scenario Outline: <Description>
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit PGP Organization" header text on edit organization page
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
    When I click on "PGP" organization tab on organization dashboard
    Then I search with "<PGP_Name> - <Has_MO>" on organization in search box
    And I verify "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click "<PGP_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit PGP Organization" header text on edit organization page
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
    Then I verify "<Message>" after submitting the "Edit PGP - <Has_MO>" organization page

    Examples: 
      | Description                                                                                                                                | Has_MO | Managing_Org | PGP_Name | Edited_PGP_Name      | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Region  | Market  | State      | Postal_Code | Message                                |
      | Check Character Limit edge condition for PGP Name field on Edit PGP Organization - Without MO                                              | NO     |              | PGPNAME  | equalsTo75Characters | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Check Character Limit edge condition for Address1 field on Edit PGP Organization - Without MO                                              | NO     |              | PGPNAME  | PGPNAME              | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklm | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Check Character Limit edge condition for Short Name field on Edit PGP Organization - Without MO                                            | NO     |              | PGPNAME  | PGPNAME              | Address1                                                | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabc | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Check Character Limit edge condition for Address2 field on Edit PGP Organization - Without MO                                              | NO     |              | PGPNAME  | PGPNAME              | Address1                                                | Short_Name                                    | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklm | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Check Character Limit edge condition for City field on Edit PGP Organization - Without MO                                                  | NO     |              | PGPNAME  | PGPNAME              | Address1                                                | Short_Name                                    | Address2                                                | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabc | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Check Character Limit edge condition for Postal code field on Edit PGP Organization - Without MO                                           | NO     |              | PGPNAME  | PGPNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California | 10000-6326  | PGP Organization Successfully Updated. |
      #| To check the Allowed characters for the available fields in Edit PGP Organization - Without MO                                             | NO     |              | PGPNAME  | AllowedCharatcters   | !@$%^&*()_+{}:<>?,./;'[]\\=Address1                     | !@$%^&*()_+{}:<>?,./;'[]\\=Short_Name         | !@$%^&*()_+{}:<>?,./;'[]\\=Address2                     | !@$%^&*()_+{}:<>?,./;'[]\\=City123            | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated.                                                           |
      | Edit PGP Organization with Mandatory fields - Without MO                                                                                   | NO     |              | PGPNAME  | PGPNAME              |                                                         |                                               |                                                         |                                               |         |         |            |             | PGP Organization Successfully Updated. |
      | Edit PGP Organization with Mandatory fields - With MO                                                                                      | YES    | MONAME       | PGPNAME  | PGPNAME              |                                                         |                                               |                                                         |                                               |         |         |            |             | PGP Organization Successfully Updated. |
      | Edit PGP Organization with Mandatory fields + Address1 + Short Name + Address2 + City + State + Region + Market + postal Code - Without MO | YES    |              | PGPNAME  | PGPNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Edit PGP Organization with Mandatory fields + Address1 + Short Name + City + State + Region + Market + postal Code - With MO               | YES    | MONAME       | PGPNAME  | PGPNAME              | Address1                                                | Short_Name                                    |                                                         | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Edit PGP Organization with Mandatory fields + Address1 + Short Name + Address2 + City + State + postal Code- Without MO                    | YES    |              | PGPNAME  | PGPNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          |         |         | California |       10001 | PGP Organization Successfully Updated. |
      | Edit PGP Organization with all the available fields - Without MO                                                                           | NO     |              | PGPNAME  | PGPNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Edit PGP Organization with all the available fields - With MO                                                                              | YES    | MONAME       | PGPNAME  | PGPNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Edit Duplicate PGP Organization with all the available fields - Without MO                                                                 | NO     |              | PGPNAME  | DUPLICATE_PGP        | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
      | Edit Duplicate PGP Organization with all the available fields - With MO                                                                    | YES    | MONAME       | PGPNAME  | DUPLICATE_PGP        | Address1                                                | Short_Name                                    | Address2                                                | City                                          | Midwest | Chicago | California |       10000 | PGP Organization Successfully Updated. |
