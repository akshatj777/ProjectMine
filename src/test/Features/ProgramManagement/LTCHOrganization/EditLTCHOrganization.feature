Feature: Edit LTCH organization functionality tests

  Scenario Outline: Create MO using API calls
    Given build json for Managing org "<name>" and "<particpantId>" and "<contactPerson>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create org with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"

    Examples: 
      | desc      | particpantId | name   | contactPerson | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type       |
      | Create MO |              | MONAME | contactPerson | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | management |

  Scenario Outline: <desc>
    Given Build Json and pass it to post method for ltch org with "<name>" and "<participantId>" and "<shortName>" and "<managingOrgId>" and "<ccn>" and "<ein>" and "<npi>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>" and "<locationName>" and "<locationType>" and "<marketId>" and "<locAddr1>" and "<locAddr2>" and "<locCity>" and "<locState>" and "<locZip>" and "<locationId>"
    When create ltch org with this data "ltch"
    Then verification of Actual vs expected results <expPostCode> and "<errorMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc                       | participantId | name     | shortName | managingOrgId | ccn | ein | npi | locationId | locAddr1     | locAddr2     | locCity  | locState | locZip | locationName | locationType | marketId | regionId | address1 | address2 | city           | state | zip   | expPostCode | errorMsg | id | type |
      | Create LTCH Org with MO    |               | LTCHNAME | ShortName | hasChild      | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | NY       |  10001 | Loc_Name     | [20],[20]    |     10,8 |      3,2 | Address1 | Address2 | AutomationCity | NY    | 10000 |         201 |          |  0 | ltch |
      | Create LTCH Org without MO |               | LTCHNAME | ShortName |               | CCN | EIN | NPI | ,          | Loc_Address1 | Loc_Address2 | Loc_City | NY       |  10001 | Loc_Name     | [20],[20]    |     10,8 |      3,2 | Address1 | Address2 | AutomationCity | NY    | 10000 |         201 |          |  0 | ltch |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    Then I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I verify "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Long-Term Care Hospital Organization" header text on edit organization page
    And I verify Managing Organization field on "Edit LTCH - <Has_MO>" organization page
    And I verify "*Long-Term Care Hospital Organization Name" field on edit organization page
    And I verify "*Address 1" field on edit organization page
    And I verify "Short Name" field on edit organization page
    And I verify "Address 2" field on edit organization page
    And I verify "*City" field on edit organization page
    And I verify "*State" dropdown field on edit organization page
    And I verify "*Postal Code" field on edit organization page
    And I verify "ccn" identifier is not editable
    And I verify "ein" identifier is not editable
    And I verify "npi" identifier is not editable
    And I verify "*Location Name" field on edit organization page
    And I verify "*Address 1" field on edit organization page
    And I verify "Location Type" dropdown field on edit organization page
    And I verify "Address 2" field on edit organization page
    And I verify "Region" dropdown field on edit organization page
    And I verify "*City" field on edit organization page
    And I verify "Market" dropdown field on edit organization page
    And I verify "*State" dropdown field on edit organization page
    And I verify "*Postal Code" field on edit organization page
    Then I verify "+" button under "Edit Hospital" organization page
    And I verify "Submit" button on edit organization page
    And I verify "Cancel" button on edit organization page

    Examples: 
      | Description                                                                       | Has_MO | LTCH_Name |
      | Verification of availability of all the fields on Edit Hospital Organization page | NO     | LTCHNAME  |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    Then I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I verify "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Long-Term Care Hospital Organization Name" field to "<Edited_LTCH_Name>" for organization
    And I edit "Address 1" field to "<Address1>" for organization
    And I edit "City" field to "<City>" for organization
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
      | Description                                     | Has_MO | LTCH_Name | Edited_LTCH_Name | Address1 | City | State      | Org_Postal_Code | Loc_Name | Loc_Address1 | Loc_City | Loc_State  | Loc_Postal_Code | ValidationMessage                 |
      | Check validation for blank LTCH name            | NO     | LTCHNAME  |                  | Address1 | City | California |           10000 | LocName  | LAddress1    | LCity    | California |           10001 | Please enter an Organization Name |
      | Check validation for blank Address1             | NO     | LTCHNAME  | LTCHNAME         |          | City | California |           10000 | LocName  | LAddress1    | LCity    | California |           10001 | Please enter an Address           |
      | Check validation for blank City                 | NO     | LTCHNAME  | LTCHNAME         | Address1 |      | California |           10000 | LocName  | LAddress1    | LCity    | California |           10001 | Please enter a City               |
      | Check validation for blank State                | NO     | LTCHNAME  | LTCHNAME         | Address1 | City |            |           10000 | LocName  | LAddress1    | LCity    | California |           10001 | Please select a State             |
      | Check validation for blank Postal code          | NO     | LTCHNAME  | LTCHNAME         | Address1 | City | California |                 | LocName  | LAddress1    | LCity    | California |           10001 | Please enter a Postal Code        |
      | Check validation for blank Location name        | YES    | LTCHNAME  | LTCHNAME         | Address1 | City | California |           10000 |          | LAddress1    | LCity    | California |           10001 | Please enter a Location Name      |
      | Check validation for blank Location Address1    | YES    | LTCHNAME  | LTCHNAME         | Address1 | City | California |           10000 | LocName  |              | LCity    | California |           10001 | Please enter an Address           |
      | Check validation for blank Location City        | YES    | LTCHNAME  | LTCHNAME         | Address1 | City | California |           10000 | LocName  | LAddress1    |          | California |           10001 | Please enter a City               |
      | Check validation for blank Location State       | YES    | LTCHNAME  | LTCHNAME         | Address1 | City | California |           10000 | LocName  | LAddress1    | LCity    |            |           10001 | Please select a State             |
      | Check validation for blank Location Postal code | NO     | LTCHNAME  | LTCHNAME         | Address1 | City | California |                 | LocName  | LAddress1    | LCity    | California |                 | Please enter a Postal Code        |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    Then I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I verify "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Long-Term Care Hospital Organization Name" field to "<Edited_LTCH_Name> - <Has_MO>" for organization
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
      | Description                                                                            | Has_MO | LTCH_Name | Edited_LTCH_Name                                                             | Org_Address1                                              | Short_Name                                     | Org_Address2                                              | City                                           | Org_Postal_Code | Loc_Name                                                                       | Loc_Address1                                              | Loc_Address2                                              | Loc_City                                       | Loc_Postal_Code | ValidationMessage                                              |
      | Check Character Limit for LTCH name field on Edit LTCH Organization page               | NO     | LTCHNAME  | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |                                                           |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                |                 | The Organization Name may not be greater than 75 characters.   |
      | Check Character Limit for Address1 field on Edit LTCH Organization page                | NO     | LTCHNAME  |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                |                 | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Short Name field on Edit LTCH Organization page              | NO     | LTCHNAME  |                                                                              |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                |                 | The shortName may not be greater than 45 characters.           |
      | Check Character Limit for Address2 field on Edit LTCH Organization page                | NO     | LTCHNAME  |                                                                              |                                                           |                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                 |                                                                                |                                                           |                                                           |                                                |                 | The second address line may not be greater than 55 characters. |
      | Check Character Limit for City field on Edit LTCH Organization page                    | NO     | LTCHNAME  |                                                                              |                                                           |                                                |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                 |                                                                                |                                                           |                                                           |                                                |                 | The City may not be greater than 45 characters.                |
      | Check Character Limit for Postal code field on Edit LTCH Organization page             | YES    | LTCHNAME  |                                                                              |                                                           |                                                |                                                           |                                                | 10000-00000     |                                                                                |                                                           |                                                           |                                                |                 | Please enter a valid Postal Code                               |
      | Check Character Limit for Location name field on Edit LTCH Organization page           | YES    | LTCHNAME  |                                                                              |                                                           |                                                |                                                           |                                                |                 | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcdefghijklmnopqrstuvwxyzabcasf |                                                           |                                                           |                                                |                 | The Location Name may not be greater than 75 characters.       |
      | Check Character Limit for Location Address1 field on Edit LTCH Organization page       | YES    | LTCHNAME  |                                                                              |                                                           |                                                |                                                           |                                                |                 |                                                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                           |                                                |                 | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Location Address2 field on Edit LTCH Organization page       | YES    | LTCHNAME  |                                                                              |                                                           |                                                |                                                           |                                                |                 |                                                                                |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                 | The second address line may not be greater than 55 characters. |
      | Check Character Limit for Location City field on Edit LTCH Organization page           | YES    | LTCHNAME  |                                                                              |                                                           |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                 | The City may not be greater than 45 characters.                |
      | Check Character Limit for Location Postal code field on Edit LTCH Organization page    | NO     | LTCHNAME  |                                                                              |                                                           |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                | 10000-00000     | Please enter a valid Postal Code                               |
      | Check Allowed Characters for Postal code field on Edit LTCH Organization page          | NO     | LTCHNAME  |                                                                              |                                                           |                                                |                                                           |                                                | abcdefghij      |                                                                                |                                                           |                                                           |                                                |                 | Please enter a valid Postal Code                               |
      | Check Allowed Characters for Location Postal code field on Edit LTCH Organization page | NO     | LTCHNAME  |                                                                              |                                                           |                                                |                                                           |                                                |                 |                                                                                |                                                           |                                                           |                                                | abcdefghij      | Please enter a valid Postal Code                               |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    Then I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I verify "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Long-Term Care Hospital Organization Name" field to "<Edited_LTCH_Name> - <Has_MO>" for organization
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
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForLTCHNAME - <Has_MO>" organization page

    Examples: 
      | Description                                                                                                       | Has_MO | LTCH_Name | Edited_LTCH_Name     | Org_Address1                                            | Short_Name                                    | Org_Address2                                            | City                                          | State      | Org_Postal_Code | Loc_Name                                                                    | Loc_Address1                                            | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2                                            | Loc_City                                      | Loc_State  | Loc_Postal_Code | Message                                 |
      #| Check Character Limit edge condition for LTCH Name field on Edit LTCH Organization - Without MO                   | NO     | LTCHNAME  | equalsTo75Characters | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Check Character Limit edge condition for Address1 field on Edit LTCH Organization - With MO                       | YES    | LTCHNAME  | LTCHNAME             | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklm | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Check Character Limit edge condition for Short Name field on Edit LTCH Organization - With MO                     | YES    | LTCHNAME  | LTCHNAME             | Address1                                                | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabc | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Check Character Limit edge condition for Address2 field on Edit LTCH Organization - With MO                       | YES    | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklm | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Check Character Limit edge condition for City field on Edit LTCH Organization - With MO                           | YES    | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabc | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Check Character Limit edge condition for Postal code field on Edit LTCH Organization - With MO                    | YES    | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California | 10000-6325      | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Check Character Limit edge condition for Location name field on Edit LTCH Organization - Without MO               | NO     | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklmilcomabcdefghijklmab | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Check Character Limit edge condition for Location Address1 field on Edit LTCH Organization - Without MO           | NO     | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklm | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Check Character Limit edge condition for Location Address2 field on Edit LTCH Organization - Without MO           | NO     | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklm | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Check Character Limit edge condition for Location City field on Edit LTCH Organization - With MO                  | YES    | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabc | California |           10000 | LTCH Organization Successfully Updated. |
      | Check Character Limit edge condition for Location Postal code field on Edit LTCH Organization - With MO           | YES    | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California | 10001-4562      | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with Mandatory fields - Without MO                                                         | NO     | LTCHNAME  | LTCHNAME             | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            |                                                         | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with Mandatory fields + ShortName - Without MO                                             | NO     | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            |                                                         | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with Mandatory fields + Address2 - Without MO                                              | NO     | LTCHNAME  | LTCHNAME             | Address1                                                |                                               | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            |                                                         | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with Mandatory fields + Location Type - Without MO                                         | NO     | LTCHNAME  | LTCHNAME             | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital |            |            |                                                         | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with Mandatory fields + Location Address2 - Without MO                                     | NO     | LTCHNAME  | LTCHNAME             | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            | Loc_Address2                                            | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with Mandatory fields + Location Region - With MO                                          | YES    | LTCHNAME  | LTCHNAME             | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                         | Midwest    |            |                                                         | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with Mandatory fields + ShortName + Location Type - With MO                                | YES    | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital |            |            |                                                         | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with Mandatory fields + ShortName + Address2 + Location Type - With MO                     | YES    | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital |            |            |                                                         | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with Mandatory fields + ShortName + Address2 + Location Region + Location Market - With MO | YES    | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                         | Midwest    | Chicago    |                                                         | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with Mandatory fields + Address2 + Location Type + Location Address2 - Without MO          | NO     | LTCHNAME  | LTCHNAME             | Address1                                                |                                               | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital |            |            | Loc_Address2                                            | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with Mandatory fields - With MO                                                            | YES    | LTCHNAME  | LTCHNAME             | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            |                                                         | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with all the available fields - Without MO                                                 | NO     | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit LTCH Organization with all the available fields - With MO                                                    | YES    | LTCHNAME  | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit duplicate LTCH Organization name with Mandatory fields - Without MO                                          | NO     | LTCHNAME  | DUPLICATE_LTCH       | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            |                                                         | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |
      | Edit duplicate LTCH Organization name with Mandatory fields - With MO                                             | YES    | LTCHNAME  | DUPLICATE_LTCH       | Address1                                                |                                               |                                                         | City                                          | California |           10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            |                                                         | Loc_City                                      | California |           10000 | LTCH Organization Successfully Updated. |

  Scenario Outline: Edit a LTCH Organization With Mandatory Fields Missing
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    Then I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I verify "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I edit "Long-Term Care Hospital Organization Name" field to "<Edited_LTCH_Name>" for organization
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
      | Description                                                | Has_MO | LTCH_Name | Edited_LTCH_Name | Org_Address1 | City | State | Org_Postal_Code | Loc_Name | Loc_Address1 | Loc_City | Loc_State | Loc_Postal_Code |
      | Edit a Hospital Organization With Mandatory Fields Missing | NO     | LTCHNAME  |                  |              |      |       |                 |          |              |          |           |                 |

  Scenario Outline: Add one more Location details on Edit Hospital Organization
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    Then I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I verify "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click on "Edit" button on particular organization
    Then I click on "+" button on "Edit LTCH" organization page
    Then I verify "Location 2" on "Edit" organization page
    And I enter location name <Loc_Name> for Location "2" on "Edit" organization page
    And I enter address1 <Loc_Address1> for Location "2" on "Edit" organization page
    And I select location type <Loc_Type> for Location "2" on "Edit" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "Edit" organization page
    And I select region <Loc_Region> for Location "2" on "Edit" organization page
    And I enter city <Loc_City> for Location "2" on "Edit" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "2" on "Edit" organization page
    And I select state <Loc_State> for Location "2" on "Edit" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "Edit" organization page
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "FETCHFROMAPIForLTCHNAME - <Has_MO>" organization page

    Examples: 
      | Description                                             | Has_MO | LTCH_Name | Loc_Name      | Loc_Address1  | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2  | Loc_City  | Loc_State  | Loc_Postal_Code | Message                                 |
      | Add one more Location details on Edit LTCH Organization | YES    | LTCHNAME  | Loc_Name new1 | Loc_Address14 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address24 | Loc_City1 | California |           10001 | LTCH Organization Successfully Updated. |

  Scenario Outline: Edit a LTCH Organization with duplicate Location details
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "LTCH" organization tab on organization dashboard
    Then I search with "<LTCH_Name> - <Has_MO>" on organization in search box
    And I verify "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I click "<LTCH_Name> - <Has_MO>" field in search list on organization page
    And I verify "2" location count on view "LTCH" organization page
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

    Examples: 
      | Description                                              | Has_MO | LTCH_Name | Loc_Name | Loc_Address1 | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Message                                 |
      | Edit a LTCH Organization with duplicate Location details | YES    | LTCHNAME  | Loc_Name | Loc_Address1 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | LTCH Organization Successfully Updated. |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type     |
      | MO, LTCH |
