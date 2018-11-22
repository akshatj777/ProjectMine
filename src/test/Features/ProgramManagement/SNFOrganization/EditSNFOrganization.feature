Feature: Edit SNF organization functionality tests

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <desc>
    Given Build Json and pass it to post method with SNF "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ccn>" and "<ein>" and "<npi>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<locationName>" and "<locationType>" and "<marketId>" and "<locAddr1>" and "<locAddr2>" and "<locCity>" and "<locState>" and "<locZip>" and "<locationId>"
    When create SNF org with this data "snf"
    Then verification of Actual vs expected results <expPostCode> and "<errorMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                                  | participantId | name    | shortName | managingOrgId | ccn | ein | npi | locationId | locAddr1     | locAddr2     | locCity  | locState | locZip | locationName | locationType    | marketId | regionId | address1 | address2 | city           | state | zip   | expPostCode | errorMsg | id | type |
      | Create SNF using API calls with MO    |               | SNFNAME | shortName | hasChild      | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | NY       |  10001 | Loc_Name     | [17,18,19],[17] |        1 |        1 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |          |  0 | snf  |
      | Create SNF using API calls without MO |               | SNFNAME | shortName |               | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | NY       |  10001 | Loc_Name     | [17,18,19],[17] |        1 |        1 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |          |  0 | snf  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "SNF" organization tab on organization dashboard
    When I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit SNF Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit SNF - <Has_MO>" organization page
    And I verify "*SNF Organization Name" field on edit organization page
    And I verify "Short Name" field on edit organization page
    And I verify "*Address 1" field on edit organization page
    And I verify "Address 2" field on edit organization page
    And I verify "*City" field on edit organization page
    And I verify "*State" dropdown field on edit organization page
    And I verify "*Postal Code" field on edit organization page
    And I verify "ccn" identifier is not editable
    And I verify "ein" identifier is not editable
    And I verify "npi" identifier is not editable
    And I verify "+" button under "edit SNF" organization page
    And I verify "*Location Name" field on edit organization page
    And I verify "*Address 1" field on edit organization page
    And I verify "Address 2" field on edit organization page
    And I verify "Region" dropdown field on edit organization page
    And I verify "*City" field on edit organization page
    And I verify "Market" dropdown field on edit organization page
    And I verify "*State" dropdown field on edit organization page
    And I verify "*Postal Code" field on edit organization page
    And I verify "Submit" button on edit organization page
    And I verify "Cancel" button on edit organization page

    Examples: 
      | Description                                                                  | Has_MO | SNF_Name |
      | Verification of availability of all the fields on Edit SNF Organization page | NO     | SNFNAME  |
      | Verification of availability of all the fields on Edit SNF Organization page | YES    | SNFNAME  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "SNF" organization tab on organization dashboard
    When I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit SNF Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit SNF - <Has_MO>" organization page
    And I edit "SNF Organization Name" field to "<Edited_SNF_Name>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "City" field to "<Org_City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    And I verify "<ValidationMessage>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                     | Has_MO | SNF_Name | Edited_SNF_Name | Org_Address1 | Org_City | State      | Org_Postal_Code | Loc_Name | Loc_Address1 | Loc_City | Loc_State  | Loc_Postal_Code | ValidationMessage                 |
      | Check validation for blank SNF name             | NO     | SNFNAME  |                 | Address1     | City     | California |           10000 | LocName  | LAddress1    | LCity    | California |           10001 | Please enter an Organization Name |
      | Check validation for blank Address1             | NO     | SNFNAME  | SNFNAME         |              | City     | California |           10000 | LocName  | LAddress1    | LCity    | California |           10001 | Please enter an Address           |
      | Check validation for blank City                 | NO     | SNFNAME  | SNFNAME         | Address1     |          | California |           10000 | LocName  | LAddress1    | LCity    | California |           10001 | Please enter a City               |
      | Check validation for blank State                | NO     | SNFNAME  | SNFNAME         | Address1     | City     |            |           10000 | LocName  | LAddress1    | LCity    | California |           10001 | Please select a State             |
      | Check validation for blank Postal code          | NO     | SNFNAME  | SNFNAME         | Address1     | City     | California |                 | LocName  | LAddress1    | LCity    | California |           10001 | Please enter a Postal Code        |
      | Check validation for blank Location name        | YES    | SNFNAME  | SNFNAME         | Address1     | City     | California |           10000 |          | LAddress1    | LCity    | California |           10001 | Please enter a Location Name      |
      | Check validation for blank Location Address1    | YES    | SNFNAME  | SNFNAME         | Address1     | City     | California |           10000 | LocName  |              | LCity    | California |           10001 | Please enter an Address           |
      | Check validation for blank Location City        | YES    | SNFNAME  | SNFNAME         | Address1     | City     | California |           10000 | LocName  | LAddress1    |          | California |           10001 | Please enter a City               |
      | Check validation for blank Location State       | YES    | SNFNAME  | SNFNAME         | Address1     | City     | California |           10000 | LocName  | LAddress1    | LCity    |            |           10001 | Please select a State             |
      | Check validation for blank Location Postal code | NO     | SNFNAME  | SNFNAME         | Address1     | City     | California |                 | LocName  | LAddress1    | LCity    | California |                 | Please enter a Postal Code        |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "SNF" organization tab on organization dashboard
    When I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit SNF Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit SNF - <Has_MO>" organization page
    And I edit "SNF Organization Name" field to "<Edited_SNF_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit "address2" field to <Loc_Address2> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    And I switch the focus to "submit" button
    And I verify "<ValidationMessage>" field validation message on edit organization page

    Examples: 
      | Description                                                                           | Has_MO | SNF_Name | Edited_SNF_Name                                                              | Org_Address1                                             | Short_Name                                     | Org_Address2                                              | City                                           | Org_Postal_Code | Loc_Name                                                                       | Loc_Address1                                              | Loc_Address2                                              | Loc_City                                       | Loc_Postal_Code | ValidationMessage                                              |
      | Check Character Limit for SNF name field on Edit SNF Organization page                | NO     | SNFNAME  | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |                                                          |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                |                 | The Organization Name may not be greater than 75 characters.   |
      | Check Character Limit for Address1 field on Edit SNF Organization page                | NO     | SNFNAME  |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsthijklmnopq |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                |                 | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Short Name field on Edit SNF Organization page              | NO     | SNFNAME  |                                                                              |                                                          | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                |                 | The shortName may not be greater than 45 characters.           |
      | Check Character Limit for Address2 field on Edit SNF Organization page                | NO     | SNFNAME  |                                                                              |                                                          |                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                 |                                                                                |                                                           |                                                           |                                                |                 | The second address line may not be greater than 55 characters. |
      | Check Character Limit for City field on Edit SNF Organization page                    | NO     | SNFNAME  |                                                                              |                                                          |                                                |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                 |                                                                                |                                                           |                                                           |                                                |                 | The City may not be greater than 45 characters.                |
      | Check Character Limit for Postal code field on Edit SNF Organization page             | YES    | SNFNAME  |                                                                              |                                                          |                                                |                                                           |                                                | 10000-00000     |                                                                                |                                                           |                                                           |                                                |                 | Please enter a valid Postal Code                               |
      | Check Character Limit for Location name field on Edit SNF Organization page           | YES    | SNFNAME  |                                                                              |                                                          |                                                |                                                           |                                                |                 | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcdefghijklmnopqrstuvwxyzabcasf |                                                           |                                                           |                                                |                 | The Location Name may not be greater than 75 characters.       |
      | Check Character Limit for Location Address1 field on Edit SNF Organization page       | YES    | SNFNAME  |                                                                              |                                                          |                                                |                                                           |                                                |                 |                                                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                           |                                                |                 | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Location Address2 field on Edit SNF Organization page       | YES    | SNFNAME  |                                                                              |                                                          |                                                |                                                           |                                                |                 |                                                                                |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                 | The second address line may not be greater than 55 characters. |
      | Check Character Limit for Location City field on Edit SNF Organization page           | YES    | SNFNAME  |                                                                              |                                                          |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                 | The City may not be greater than 45 characters.                |
      | Check Character Limit for Location Postal code field on Edit SNF Organization page    | NO     | SNFNAME  |                                                                              |                                                          |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                | 10000-00000     | Please enter a valid Postal Code                               |
      | Check Allowed Characters for Postal code field on Edit SNF Organization page          | NO     | SNFNAME  |                                                                              |                                                          |                                                |                                                           |                                                | abcdefghij      |                                                                                |                                                           |                                                           |                                                |                 | Please enter a valid Postal Code                               |
      | Check Allowed Characters for Location Postal code field on Edit SNF Organization page | NO     | SNFNAME  |                                                                              |                                                          |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                | abcdefghij      | Please enter a valid Postal Code                               |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "SNF" organization tab on organization dashboard
    When I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit SNF Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit SNF - <Has_MO>" organization page
    And I edit "SNF Organization Name" field to "<Edited_SNF_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit "address2" field to <Loc_Address1> for Location "1" for organization
    And I edit Region dropdown field to <Loc_Region> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit Market dropdown field to <Loc_Market> for Region "<Loc_Region>" for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForSNFNAME - <Has_MO>" organization page

    Examples: 
      | Description                                                                                                      | Has_MO | SNF_Name | Edited_SNF_Name | Org_Address1                                            | Short_Name                                    | Org_Address2                                            | City                                          | State      | Org_Postal_Code | Loc_Name                                                                    | Loc_Address1                                            | Loc_Type        | Loc_Region | Loc_Market | Loc_Address2                                            | Loc_City                                      | Loc_State  | Loc_Postal_Code | Message                                |
      #| Check Character Limit edge condition for SNF Organization Name field on Edit SNF Organization page - Without MO  | NO     | SNFNAME  | equalsTo75Characters | add1                                                    | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Check Character Limit edge condition for Address1 field on Edit SNF Organization page - Without MO               | NO     | SNFNAME  | SNFNAME         | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsjklmnopqrs | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Check Character Limit edge condition for Short Name field on Edit SNF Organization page - Without MO             | NO     | SNFNAME  | SNFNAME         | Address1                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Check Character Limit edge condition for Address2 field on Edit SNF Organization page - Without MO               | NO     | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsjklmnopqrs | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Check Character Limit edge condition for City field on Edit SNF Organization page - Without MO                   | NO     | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    | Address2                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Check Character Limit edge condition for Postal code field on Edit SNF Organization page - Without MO            | NO     | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California | 10000-0000      | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Check Character Limit edge condition for Location Name field on Edit SNF Organization page - Without MO          | NO     | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrszabcdefghijklmnopqrsjklmnopqrs | Loc_Address1                                            | Skilled Nursing | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Check Character Limit edge condition for Location Address1 field on Edit SNF Organization page - Without MO      | NO     | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrszabcdefghi | Skilled Nursing | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Check Character Limit edge condition for Location Address2 field on Edit SNF Organization page - Without MO      | NO     | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing | Midwest    | Chicago    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrszabcdefghi | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Check Character Limit edge condition for Location city field on Edit SNF Organization page - Without MO          | NO     | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing | Midwest    | Chicago    | Loc_Address2                                            | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqsd | California |           10000 | SNF Organization Successfully Updated. |
      | Check Character Limit edge condition for Location postal code field on Edit SNF Organization page - Without MO   | NO     | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California | 10000-2345      | SNF Organization Successfully Updated. |
      #| To check the Allowed characters for the available fields in Edit SNF Organization - Without MO                   | NO     | SNFNAME  | AllowedCharatcters   | a!@$%^&*()_+{}:<>?,./;'[]/\\=Address1                   | !@$%^&*()_+{}:<>?,./;'[]/\\=Short_Name        | !@$%^&*()_+{}:<>?,./;'[]/\\=Address2                    | !@$%^&*()_+{}:<>?,./;'[]/\\=City123           | California |           10000 | !@$%^&*()_+{}:<>?,./;'[]/\\=Loc_Name123                                     | !@$%^&*()_+{}:<>?,./;'[]/\\=Loc_Address1                | Skilled Nursing | Midwest    | Chicago    | !@$%^&*()_+{}:<>?,./;'[]/\\=Loc_Address2                | !@$%^&*()_+{}:<>?,./;'[]/\\=Loc_City123       | California |           10000 | SNF Organization Successfully Updated. |
      | Edit SNF Organization with Mandatory fields - Without MO                                                         | NO     | SNFNAME  | SNFNAME         | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                 |            |            |                                                         | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Edit SNF Organization with Mandatory fields + ShortName - Without MO                                             | NO     | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                 |            |            |                                                         | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Edit SNF Organization with Mandatory fields + Address2 - Without MO                                              | NO     | SNFNAME  | SNFNAME         | Address1                                                |                                               | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                 |            |            |                                                         | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Edit SNF Organization with Mandatory fields + Location Address2 - Without MO                                     | NO     | SNFNAME  | SNFNAME         | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                 |            |            | Loc_Address2                                            | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Edit SNF Organization with Mandatory fields + Location Region - With MO                                          | YES    | SNFNAME  | SNFNAME         | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                 | Midwest    |            |                                                         | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Edit SNF Organization with Mandatory fields + ShortName + Location Type - With MO                                | YES    | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing |            |            |                                                         | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Edit SNF Organization with Mandatory fields + ShortName + Address2 + Location Type - With MO                     | YES    | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing |            |            |                                                         | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Edit SNF Organization with Mandatory fields + ShortName + Address2 + Location Region + Location Market - With MO | YES    | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                 | Midwest    | Chicago    |                                                         | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Edit SNF Organization with Mandatory fields + Address2 + Location Type + Location Address2 - Without MO          | NO     | SNFNAME  | SNFNAME         | Address1                                                |                                               | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing |            |            | Loc_Address2                                            | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Edit SNF Organization with Mandatory fields - With MO                                                            | YES    | SNFNAME  | SNFNAME         | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                 |            |            |                                                         | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Edit SNF Organization with all the available fields - Without MO                                                 | NO     | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
      | Edit SNF Organization with all the available fields - With MO                                                    | YES    | SNFNAME  | SNFNAME         | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Skilled Nursing | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |

  #| Edit duplicate SNF Organization name with Mandatory fields - Without MO                                          | NO     | SNFNAME  | DUPLICATE_SNF   | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                 |            |            |                                                         | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
  #| Edit duplicate SNF Organization name with Mandatory fields - With MO                                             | YES    | SNFNAME  | DUPLICATE_SNF   | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                 |            |            |                                                         | Loc_City                                      | California |           10000 | SNF Organization Successfully Updated. |
  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "SNF" organization tab on organization dashboard
    When I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit SNF Organization" header text on edit organization page
    And I verify Managing Organization radio buttons status on "Edit SNF - <Has_MO>" organization page
    And I edit "SNF Organization Name" field to "<Edited_SNF_Name>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    And I verify "Please enter an Organization Name" mandatory field validation message on edit organization page
    And I verify "Please enter an Address" mandatory field validation message on edit organization page
    And I verify "Please enter a City" mandatory field validation message on edit organization page
    And I verify "Please select a State" mandatory field validation message on edit organization page
    And I verify "Please enter a Postal Code" mandatory field validation message on edit organization page
    And I verify "Please enter a Location Name" mandatory field validation message on edit organization page
    And I verify "Please enter an Address" mandatory field validation message on edit organization page
    And I verify "Please enter a City" mandatory field validation message on edit organization page
    And I verify "Please select a State" mandatory field validation message on edit organization page
    And I verify "Please enter a Postal Code" mandatory field validation message on edit organization page

    Examples: 
      | Description                                           | Has_MO | SNF_Name | Edited_SNF_Name | Org_Address1 | City | State | Org_Postal_Code | Loc_Name | Loc_Address1 | Loc_City | Loc_State | Loc_Postal_Code |
      | Edit a SNF Organization With Mandatory Fields Missing | NO     | SNFNAME  |                 |              |      |       |                 |          |              |          |           |                 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "SNF" organization tab on organization dashboard
    When I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit "address2" field to <Loc_Address2> for Location "1" for organization
    And I edit Region dropdown field to <Loc_Region> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit Market dropdown field to <Loc_Market> for Region "<Loc_Region>" for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForSNFNAME - <Has_MO>" organization page

    Examples: 
      | Description                                                    | Has_MO | SNF_Name | Loc_Name     | Loc_Address1  | Loc_Type        | Loc_Region | Loc_Market | Loc_Address2  | Loc_City   | Loc_State  | Loc_Postal_Code | Message                                |
      | Edit and Save an existing Location details on SNF Organization | NO     | SNFNAME  | Loc_Name new | Loc_Address12 | Skilled Nursing | Midwest    | Chicago    | Loc_Address22 | Loc_City11 | California |           10001 | SNF Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "SNF" organization tab on organization dashboard
    Then I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "SNF Organization Name" field to "<Edited_SNF_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit location ID field to "<Loc_ID>" for Location "1" for "SNF" organization
    And I edit "address2" field to <Loc_Address1> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForSNFNAME - <Has_MO>" organization page

    Examples: 
      | Description                                         | Has_MO | SNF_Name | Edited_SNF_Name | Org_Address1 | Short_Name | Org_Address2 | City | State      | Org_Postal_Code | Loc_Name | Loc_Address1 | Loc_Type  | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Loc_ID | Message                                |
      | Edit SNF Organization with Location id - Without MO | NO     | SNFNAME  | SNFNAME         | Address1     | Short_Name | Address2     | City | California |           10000 | Loc_Name | Loc_Address1 | Inpatient | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | LID    | SNF Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "SNF" organization tab on organization dashboard
    Then I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "SNF Organization Name" field to "<Edited_SNF_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit location ID field to "<Loc_ID>" for Location "1" for "SNF" organization
    And I edit "address2" field to <Loc_Address1> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    And I verify "<ValidationMessage>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                                     | Has_MO | SNF_Name | Edited_SNF_Name | Org_Address1 | Short_Name | Org_Address2 | City | State      | Org_Postal_Code | Loc_Name | Loc_Address1 | Loc_Type  | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Loc_ID          | ValidationMessage         |
      | Edit SNF Organization with duplication Location id - Without MO | NO     | SNFNAME  | SNFNAME         | Address1     | Short_Name | Address2     | City | California |           10000 | Loc_Name | Loc_Address1 | Inpatient | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | Duplication_LID | This ID is already in use |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
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
    And I enter Location Id <Location_ID> for Location "1" on "create Hospital" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create ACH - <Has_MO>" organization page
    When I click on "SNF" organization tab on organization dashboard
    Then I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "SNF Organization Name" field to "<Edited_SNF_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit location ID field to "<Loc_ID>" for Location "1" for "SNF" organization
    And I edit "address2" field to <Loc_Address1> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    And I verify "<ValidationMessage>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                                                   | Has_MO | Managing_Org | SNF_Name | Hosp_Name | Edited_SNF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type        | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | Location_ID | Loc_ID      | Message                                     | ValidationMessage         |
      | Validation message when duplicate locationId of the Hospital Org - Without MO | NO     |              | SNFNAME  | ACHNAME   | SNFNAME         | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Skilled Nursing | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | LID         | HospitalLID | Hospital Organization Successfully Created. | This ID is already in use |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    Then I click on "+" button on "LTCH" organization page
    And I verify "Create Long-Term Care Hospital Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <LTCH_Name> in "Long-Term Care Hospital Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "LTCH - <CCN>" in "CCN" on create organization page
    And I provide unique "LTCH - <EIN>" in "EIN" on create organization page
    And I provide unique "LTCH - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter Location Id <Location_ID> for Location "1" on "create LTCH" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create LTCH - <Has_MO>" organization page
    When I click on "SNF" organization tab on organization dashboard
    Then I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "SNF Organization Name" field to "<Edited_SNF_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit location ID field to "<Loc_ID>" for Location "1" for "SNF" organization
    And I edit "address2" field to <Loc_Address1> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    And I verify "<ValidationMessage>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                                               | Has_MO | Managing_Org | LTCH_Name | SNF_Name | Edited_SNF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | Location_ID | Loc_ID  | Message                                 | ValidationMessage         |
      | Validation message when duplicate locationId of the LTCH Org - Without MO | NO     |              | LTCHNAME  | SNFNAME  | SNFNAME         | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | LID         | LTCHLID | LTCH Organization Successfully Created. | This ID is already in use |

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
    And I verify "Location 1" on "Create IRF" organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter Location Id <Location_ID> for Location "1" on "create IRF" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create IRF - <Has_MO>" organization page
    When I click on "SNF" organization tab on organization dashboard
    Then I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "SNF Organization Name" field to "<Edited_SNF_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit location ID field to "<Loc_ID>" for Location "1" for "SNF" organization
    And I edit "address2" field to <Loc_Address1> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    And I verify "<ValidationMessage>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                                              | Has_MO | Managing_Org | IRF_Name | SNF_Name | Edited_SNF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Location_ID | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | Loc_Name2 | Loc_ID | Message                                | ValidationMessage         |
      | Validation message when duplicate locationId of the IRF Org - Without MO | NO     |              | IRFNAME  | SNFNAME  | SNFNAME         | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | LID         | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | Loc_Name2 | IRFLID | IRF Organization Successfully Created. | This ID is already in use |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "SNF" organization tab on organization dashboard
    When I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    Then I click on "+" button on "SNF" organization page
    And I verify "Location 2" on "Create SNF" organization page
    And I enter location name <Loc_Name> for Location "2" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "2" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "create" organization page
    And I enter city <Loc_City> for Location "2" on "create" organization page
    And I select state <Loc_State> for Location "2" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create SNF - <Has_MO>" organization page

    Examples: 
      | Description                                                | Has_MO | SNF_Name | Loc_Name   | Loc_Address1 | Loc_Type        | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Message                                |
      | Add one more location Location details on SNF Organization | NO     | SNFNAME  | Loc_Name12 | Loc_Address1 | Skilled Nursing | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | SNF Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "SNF" organization tab on organization dashboard
    Then I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify Managing Organization radio buttons status on "Edit SNF - <Has_MO>" organization page
    And I select "<Has_MO1>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO1>" Has a Management Organization drop down
    And I edit "SNF Organization Name" field to "<Edited_SNF_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit "address2" field to <Loc_Address1> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForSNFNAME - <Has_MO>" organization page
    When I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I verify "<SNF_Name> - <Has_MO>" name on the header of view profile
    And I verify "Managing Organization - <Has_MO1>" on view profile of "SNF" Organization

    Examples: 
      | Description                                        | Has_MO | Has_MO1 | Managing_Org | SNF_Name | Edited_SNF_Name | Org_Address1 | Short_Name | Org_Address2 | City | State      | Org_Postal_Code | Loc_Name | Loc_Address1 | Loc_Type  | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Message                                |
      | Edit SNF organization with MO to without MO        | YES    | NO      | MO2          | SNFNAME  | SNFNAME         | Address1     | Short_Name | Address2     | City | California |           10000 | Loc_Name | Loc_Address1 | Inpatient | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           12345 | SNF Organization Successfully Updated. |
      | Edit verify SNF organization without MO to with MO | NO     | YES     | MO2          | SNFNAME  | SNFNAME         | Address1     | Short_Name | Address2     | City | California |           10000 | Loc_Name | Loc_Address1 | Inpatient | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           15623 | SNF Organization Successfully Updated. |

  Scenario Outline: Create another MO for use in while editing SNF organization
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
    When I click on "SNF" organization tab on organization dashboard
    Then I search with "<SNF_Name> - <Has_MO1>" on organization in search box
    And I verify "<SNF_Name> - <Has_MO1>" field in search list on organization page
    And I click "<SNF_Name> - <Has_MO1>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify Managing Organization radio buttons status on "Edit SNF - <Has_MO>" organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    And I edit "SNF Organization Name" field to "<Edited_SNF_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit "address2" field to <Loc_Address1> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForSNFNAME - <Has_MO>" organization page
    When I search with "<SNF_Name> - <Has_MO>" on organization in search box
    And I click "<SNF_Name> - <Has_MO>" field in search list on organization page
    And I verify "<SNF_Name> - <Has_MO>" name on the header of view profile
    And I verify "Managing Organization2 - <Has_MO>" on view profile of "SNF" Organization

    Examples: 
      | Description                              | Has_MO | Has_MO1 | Managing_Org | SNF_Name | Edited_SNF_Name | Org_Address1 | Short_Name | Org_Address2 | City | State      | Org_Postal_Code | Loc_Name | Loc_Address1 | Loc_Type  | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Message                                |
      | Changing the MO details on edit SNF page | YES    | NO      | MO_Name2     | SNFNAME  | SNFNAME         | Address1     | Short_Name | Address2     | City | California |           10000 | Loc_Name | Loc_Address1 | Inpatient | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           45621 | SNF Organization Successfully Updated. |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type    |
      | MO, SNF |
