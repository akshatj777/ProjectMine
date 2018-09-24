Feature: Edit IRF Organization functionality tests

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <desc>
    Given Build Json and pass it to post method with IRF "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ccn>" and "<ein>" and "<npi>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<locationName>" and "<locationType>" and "<marketId>" and "<locAddr1>" and "<locAddr2>" and "<locCity>" and "<locState>" and "<locZip>" and "<locationId>"
    When create IRF org with this data "irf"
    Then verification of Actual vs expected results <expPostCode> and "<errorMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                                  | participantId | name    | shortName | managingOrgId | ccn | ein | npi | locationId | locAddr1     | locAddr2     | locCity  | locState | locZip | locationName | locationType | marketId | regionId | address1 | address2 | city           | state | zip   | expPostCode | errorMsg | id | type |
      | Create IRF using API calls with MO    |               | IRFNAME | shortName | hasChild      | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | NY       |  10001 | Loc_Name     | [22]         |       10 |      3,2 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |          |  0 | irf  |
      | Create IRF using API calls without MO |               | IRFNAME | shortName |               | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | NY       |  10001 | Loc_Name     | [22]         |       10 |      3,2 | Address1 | Address2 | AutomationCity | CA    | 10000 |         201 |          |  0 | irf  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    When I search with "<IRF_Name> - <Has_MO>" on organization in search box
    And I verify "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Inpatient Rehab Facility Organization" header text on edit organization page
    And I verify Managing Organization field on "Edit IRF - <Has_MO>" organization page
    And I verify "*Inpatient Rehab Facility Organization Name" field on edit organization page
    And I verify "Short Name" field on edit organization page
    And I verify "*Address 1" field on edit organization page
    And I verify "Address 2" field on edit organization page
    And I verify "*City" field on edit organization page
    And I verify "*State" dropdown field on edit organization page
    And I verify "*Postal Code" field on edit organization page
    And I verify "ccn" identifier is not editable
    And I verify "ein" identifier is not editable
    And I verify "npi" identifier is not editable
    And I verify "+" button under "edit IRF" organization page
    And I verify "*Location Name" field on edit organization page
    And I verify "*Address 1" field on edit organization page
    And I verify "Location Type" dropdown field on edit organization page
    And I verify "Address 2" field on edit organization page
    And I verify "Region" dropdown field on edit organization page
    And I verify "*City" field on edit organization page
    And I verify "Market" dropdown field on edit organization page
    And I verify "*State" dropdown field on edit organization page
    And I verify "*Postal Code" field on edit organization page
    And I verify "Submit" button on edit organization page
    And I verify "Cancel" button on edit organization page

    Examples: 
      | Description                                                                  | Has_MO | IRF_Name |
      | Verification of availability of all the fields on Edit IRF Organization page | NO     | IRFNAME  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    When I search with "<IRF_Name> - <Has_MO>" on organization in search box
    And I verify "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Inpatient Rehab Facility Organization" header text on edit organization page
    And I edit "Inpatient Rehab Facility Organization Name" field to "<Edited_IRF_Name>" for organization
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
      | Description                                     | Has_MO | IRF_Name | Edited_IRF_Name | Org_Address1 | Org_City | State      | Org_Postal_Code | Loc_Name | Loc_Address1 | Loc_City | Loc_State  | Loc_Postal_Code | ValidationMessage                 |
      | Check validation for blank IRF name             | NO     | IRFNAME  |                 | Address1     | City     | California |           10000 | LocName  | LAddress1    | LCity    | California |           10001 | Please enter an Organization Name |
      | Check validation for blank Address1             | NO     | IRFNAME  | IRFNAME         |              | City     | California |           10000 | LocName  | LAddress1    | LCity    | California |           10001 | Please enter an Address           |
      | Check validation for blank City                 | NO     | IRFNAME  | IRFNAME         | Address1     |          | California |           10000 | LocName  | LAddress1    | LCity    | California |           10001 | Please enter a City               |
      | Check validation for blank State                | NO     | IRFNAME  | IRFNAME         | Address1     | City     |            |           10000 | LocName  | LAddress1    | LCity    | California |           10001 | Please select a State             |
      | Check validation for blank Postal code          | NO     | IRFNAME  | IRFNAME         | Address1     | City     | California |                 | LocName  | LAddress1    | LCity    | California |           10001 | Please enter a Postal Code        |
      | Check validation for blank Location name        | YES    | IRFNAME  | IRFNAME         | Address1     | City     | California |           10000 |          | LAddress1    | LCity    | California |           10001 | Please enter a Location Name      |
      | Check validation for blank Location Address1    | YES    | IRFNAME  | IRFNAME         | Address1     | City     | California |           10000 | LocName  |              | LCity    | California |           10001 | Please enter an Address           |
      | Check validation for blank Location City        | YES    | IRFNAME  | IRFNAME         | Address1     | City     | California |           10000 | LocName  | LAddress1    |          | California |           10001 | Please enter a City               |
      | Check validation for blank Location State       | YES    | IRFNAME  | IRFNAME         | Address1     | City     | California |           10000 | LocName  | LAddress1    | LCity    |            |           10001 | Please select a State             |
      | Check validation for blank Location Postal code | NO     | IRFNAME  | IRFNAME         | Address1     | City     | California |                 | LocName  | LAddress1    | LCity    | California |                 | Please enter a Postal Code        |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    When I search with "<IRF_Name> - <Has_MO>" on organization in search box
    And I verify "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Inpatient Rehab Facility Organization" header text on edit organization page
    And I edit "Inpatient Rehab Facility Organization Name" field to "<Edited_IRF_Name> - <Has_MO>" for organization
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
      | Description                                                                           | Has_MO | IRF_Name | Edited_IRF_Name                                                              | Org_Address1                                             | Short_Name                                     | Org_Address2                                              | City                                           | Org_Postal_Code | Loc_Name                                                                       | Loc_Address1                                              | Loc_Address2                                              | Loc_City                                       | Loc_Postal_Code | ValidationMessage                                              |
      | Check Character Limit for IRF name field on Edit IRF Organization page                | NO     | IRFNAME  | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |                                                          |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                |                 | The Organization Name may not be greater than 75 characters.   |
      | Check Character Limit for Address1 field on Edit IRF Organization page                | NO     | IRFNAME  |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsthijklmnopq |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                |                 | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Short Name field on Edit IRF Organization page              | NO     | IRFNAME  |                                                                              |                                                          | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                |                 | The shortName may not be greater than 45 characters.           |
      | Check Character Limit for Address2 field on Edit IRF Organization page                | NO     | IRFNAME  |                                                                              |                                                          |                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                 |                                                                                |                                                           |                                                           |                                                |                 | The second address line may not be greater than 55 characters. |
      | Check Character Limit for City field on Edit IRF Organization page                    | NO     | IRFNAME  |                                                                              |                                                          |                                                |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                 |                                                                                |                                                           |                                                           |                                                |                 | The City may not be greater than 45 characters.                |
      | Check Character Limit for Postal code field on Edit IRF Organization page             | YES    | IRFNAME  |                                                                              |                                                          |                                                |                                                           |                                                | 10000-00000     |                                                                                |                                                           |                                                           |                                                |                 | Please enter a valid Postal Code                               |
      | Check Character Limit for Location name field on Edit IRF Organization page           | YES    | IRFNAME  |                                                                              |                                                          |                                                |                                                           |                                                |                 | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcdefghijklmnopqrstuvwxyzabcasf |                                                           |                                                           |                                                |                 | The Location Name may not be greater than 75 characters.       |
      | Check Character Limit for Location Address1 field on Edit IRF Organization page       | YES    | IRFNAME  |                                                                              |                                                          |                                                |                                                           |                                                |                 |                                                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                           |                                                |                 | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Location Address2 field on Edit IRF Organization page       | YES    | IRFNAME  |                                                                              |                                                          |                                                |                                                           |                                                |                 |                                                                                |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                 | The second address line may not be greater than 55 characters. |
      | Check Character Limit for Location City field on Edit IRF Organization page           | YES    | IRFNAME  |                                                                              |                                                          |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                 | The City may not be greater than 45 characters.                |
      | Check Character Limit for Location Postal code field on Edit IRF Organization page    | NO     | IRFNAME  |                                                                              |                                                          |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                | 10000-00000     | Please enter a valid Postal Code                               |
      | Check Allowed Characters for Postal code field on Edit IRF Organization page          | NO     | IRFNAME  |                                                                              |                                                          |                                                |                                                           |                                                | abcdefghij      |                                                                                |                                                           |                                                           |                                                |                 | Please enter a valid Postal Code                               |
      | Check Allowed Characters for Location Postal code field on Edit IRF Organization page | NO     | IRFNAME  |                                                                              |                                                          |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                | abcdefghij      | Please enter a valid Postal Code                               |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    When I search with "<IRF_Name> - <Has_MO>" on organization in search box
    And I verify "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Inpatient Rehab Facility Organization" header text on edit organization page
    And I edit "Inpatient Rehab Facility Organization Name" field to "<Edited_IRF_Name> - <Has_MO>" for organization
    And I edit "Address 1" field to "<Org_Address1>" for organization
    And I edit "Short Name" field to "<Short_Name>" for organization
    And I edit "Address 2" field to "<Org_Address2>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Org_Postal_Code>" for organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit Location Type dropdown field to <Loc_Type> for Location "1" for organization
    And I edit "address2" field to <Loc_Address1> for Location "1" for organization
    And I edit Region dropdown field to <Loc_Region> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit Market dropdown field to <Loc_Market> for Region "<Loc_Region>" for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForIRFNAME - <Has_MO>" organization page

    Examples: 
      | Description                                                                                                      | Has_MO | IRF_Name | Edited_IRF_Name      | Org_Address1                                            | Short_Name                                    | Org_Address2                                            | City                                          | State      | Org_Postal_Code | Loc_Name                                                                    | Loc_Address1                                            | Loc_Type | Loc_Region | Loc_Market | Loc_Address2                                            | Loc_City                                      | Loc_State  | Loc_Postal_Code | Message                                |
      | Check Character Limit edge condition for IRF Organization Name field on Edit IRF Organization page - Without MO  | NO     | IRFNAME  | equalsTo75Characters | add1                                                    | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Check Character Limit edge condition for Address1 field on Edit IRF Organization page - Without MO               | NO     | IRFNAME  | IRFNAME              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsjklmnopqrs | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Check Character Limit edge condition for Short Name field on Edit IRF Organization page - Without MO             | NO     | IRFNAME  | IRFNAME              | Address1                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Check Character Limit edge condition for Address2 field on Edit IRF Organization page - Without MO               | NO     | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsjklmnopqrs | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Check Character Limit edge condition for City field on Edit IRF Organization page - Without MO                   | NO     | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    | Address2                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Check Character Limit edge condition for Postal code field on Edit IRF Organization page - Without MO            | NO     | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California | 10000-0000      | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Check Character Limit edge condition for Location Name field on Edit IRF Organization page - Without MO          | NO     | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrszabcdefghijklmnopqrsjklmnopqrs | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Check Character Limit edge condition for Location Address1 field on Edit IRF Organization page - Without MO      | NO     | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrszabcdefghi | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Check Character Limit edge condition for Location Address2 field on Edit IRF Organization page - Without MO      | NO     | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrszabcdefghi | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Check Character Limit edge condition for Location city field on Edit IRF Organization page - Without MO          | NO     | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqsd | California |           10000 | IRF Organization Successfully Updated. |
      | Check Character Limit edge condition for Location postal code field on Edit IRF Organization page - Without MO   | NO     | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California | 10000-2345      | IRF Organization Successfully Updated. |
      #| To check the Allowed characters for the available fields in Edit IRF Organization - Without MO                   | NO     | IRFNAME  | AllowedCharatcters   | a!@$%^&*()_+{}:<>?,./;'[]/\\=Address1                   | !@$%^&*()_+{}:<>?,./;'[]/\\=Short_Name        | !@$%^&*()_+{}:<>?,./;'[]/\\=Address2                    | !@$%^&*()_+{}:<>?,./;'[]/\\=City123           | California |           10000 | !@$%^&*()_+{}:<>?,./;'[]/\\=Loc_Name123                                     | !@$%^&*()_+{}:<>?,./;'[]/\\=Loc_Address1                | IRF      | Midwest    | Chicago    | !@$%^&*()_+{}:<>?,./;'[]/\\=Loc_Address2                | !@$%^&*()_+{}:<>?,./;'[]/\\=Loc_City123       | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with Mandatory fields - Without MO                                                         | NO     | IRFNAME  | IRFNAME              | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with Mandatory fields + ShortName - Without MO                                             | NO     | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with Mandatory fields + Address2 - Without MO                                              | NO     | IRFNAME  | IRFNAME              | Address1                                                |                                               | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with Mandatory fields + Location Type - Without MO                                         | NO     | IRFNAME  | IRFNAME              | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      |            |            |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with Mandatory fields + Location Address2 - Without MO                                     | NO     | IRFNAME  | IRFNAME              | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            | Loc_Address2                                            | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with Mandatory fields + Location Region - With MO                                          | YES    | IRFNAME  | IRFNAME              | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |          | Midwest    |            |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with Mandatory fields + ShortName + Location Type - With MO                                | YES    | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      |            |            |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with Mandatory fields + ShortName + Address2 + Location Type - With MO                     | YES    | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      |            |            |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with Mandatory fields + ShortName + Address2 + Location Region + Location Market - With MO | YES    | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |          | Midwest    | Chicago    |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with Mandatory fields + Address2 + Location Type + Location Address2 - Without MO          | NO     | IRFNAME  | IRFNAME              | Address1                                                |                                               | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      |            |            | Loc_Address2                                            | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with Mandatory fields - With MO                                                            | YES    | IRFNAME  | IRFNAME              | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with all the available fields - Without MO                                                 | NO     | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit IRF Organization with all the available fields - With MO                                                    | YES    | IRFNAME  | IRFNAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit duplicate IRF Organization name with Mandatory fields - Without MO                                          | NO     | IRFNAME  | DUPLICATE_IRF        | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit duplicate IRF Organization name with Mandatory fields - With MO                                             | YES    | IRFNAME  | DUPLICATE_IRF        | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit duplicate IRF Organization name with Mandatory fields - Without MO                                          | NO     | IRFNAME  | DUPLICATE_IRF        | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |
      | Edit duplicate IRF Organization name with Mandatory fields - With MO                                             | YES    | IRFNAME  | DUPLICATE_IRF        | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | IRF Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    When I search with "<IRF_Name> - <Has_MO>" on organization in search box
    And I verify "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Inpatient Rehab Facility Organization" header text on edit organization page
    And I edit "Inpatient Rehab Facility Organization Name" field to "<Edited_IRF_Name>" for organization
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
      | Description                                           | Has_MO | IRF_Name | Edited_IRF_Name | Org_Address1 | City | State | Org_Postal_Code | Loc_Name | Loc_Address1 | Loc_City | Loc_State | Loc_Postal_Code |
      | Edit a IRF Organization With Mandatory Fields Missing | NO     | IRFNAME  |                 |              |      |       |                 |          |              |          |           |                 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    When I search with "<IRF_Name> - <Has_MO>" on organization in search box
    And I verify "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit Location Type dropdown field to <Loc_Type> for Location "1" for organization
    And I edit "address2" field to <Loc_Address2> for Location "1" for organization
    And I edit Region dropdown field to <Loc_Region> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit Market dropdown field to <Loc_Market> for Region "<Loc_Region>" for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForIRFNAME - <Has_MO>" organization page

    Examples: 
      | Description                                                    | Has_MO | IRF_Name | Loc_Name     | Loc_Address1  | Loc_Type | Loc_Region | Loc_Market | Loc_Address2  | Loc_City    | Loc_State  | Loc_Postal_Code | Message                                |
      | Edit and Save an existing Location details on IRF Organization | NO     | IRFNAME  | Loc_Name new | Loc_Address12 | IRF      | Midwest    | Chicago    | Loc_Address22 | Loc_City11S | California |           10001 | IRF Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    When I search with "<IRF_Name> - <Has_MO>" on organization in search box
    And I verify "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 2" on "Create IRF" organization page
    And I enter location name <Loc_Name> for Location "2" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "2" on "create" organization page
    And I select location type <Loc_Type> for Location "2" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "create" organization page
    And I select region <Loc_Region> for Location "2" on "create" organization page
    And I enter city <Loc_City> for Location "2" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "2" on "create" organization page
    And I select state <Loc_State> for Location "2" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create IRF - <Has_MO>" organization page

    Examples: 
      | Description                                                | Has_MO | IRF_Name | Loc_Name   | Loc_Address1 | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Message                                |
      | Add one more location Location details on IRF Organization | NO     | IRFNAME  | Loc_Name12 | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | IRF Organization Successfully Updated. |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    When I search with "<IRF_Name> - <Has_MO>" on organization in search box
    And I verify "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I click "<IRF_Name> - <Has_MO>" field in search list on organization page
    And I verify "Location" tab present under "IRF" Organization
    And I click on "Location" tab on view profile of "IRF" Organization
    And I verify "2" location count on view "IRF" organization page
    And I click on "Edit" button on particular organization
    And I edit "Location Name" field to <Loc_Name> for Location "1" for organization
    And I edit "address1" field to <Loc_Address1> for Location "1" for organization
    And I edit Location Type dropdown field to <Loc_Type> for Location "1" for organization
    And I edit "address2" field to <Loc_Address2> for Location "1" for organization
    And I edit Region dropdown field to <Loc_Region> for Location "1" for organization
    And I edit "city" field to <Loc_City> for Location "1" for organization
    And I edit Market dropdown field to <Loc_Market> for Region "<Loc_Region>" for Location "1" for organization
    And I edit State dropdown field to <Loc_State> for Location "1" for organization
    And I edit "postalCode" field to <Loc_Postal_Code> for Location "1" for organization
    Then I verify "Location 2" on "Edit" organization page
    And I edit "Location Name" field to <Loc_Name> for Location "2" for organization
    Then I click on "Submit" button on "Edit" organization page
    #And I verify duplicate Location Message "Duplicate Location"

    Examples: 
      | Description                                             | Has_MO | IRF_Name | Loc_Name | Loc_Address1 | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Message                                |
      | Edit a IRF Organization with duplicate Location details | NO     | IRFNAME  | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | IRF Organization Successfully Updated. |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type |
      | MO   |
