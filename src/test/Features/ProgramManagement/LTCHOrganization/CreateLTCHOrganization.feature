Feature: Create LTCH organization functionality tests

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

  Scenario: Verification of availability of all the fields on Create LTCH Organization page
    When I click on "LTCH" organization tab on organization dashboard
    Then I verify "+" button under "LTCH" organization page
    And I verify "CCN" header label under "LTCH" organization
    And I verify "LTCH Organization Name" header label under "LTCH" organization
    And I verify "City" header label under "LTCH" organization
    And I verify "State" header label under "LTCH" organization
    And I verify "Postal Code" header label under "LTCH" organization
    Then I click on "+" button on "LTCH" organization page
    And I verify "Create Long-Term Care Hospital Organization" header text on create organization page
    And I verify "*Long-Term Care Hospital Organization Name" field on create organization page
    And I verify "Has a Managing Organization" radio button on create organization page
    And I verify "No Managing Organization" radio button on create organization page
    And I verify "Short Name" field on create organization page
    And I verify "*Address 1" field on create organization page
    And I verify "Address 2" field on create organization page
    And I verify "*City" field on create organization page
    And I verify "*State" dropdown field on create organization page
    And I verify "*Postal Code" field on create organization page
    And I verify "CCN" field on create organization page
    And I verify "EIN" field on create organization page
    And I verify "NPI" field on create organization page
    And I verify "+" button under "Create LTCH" organization page
    And I verify "*Location Name" field on create organization page
    And I verify "*Address 1" field on create organization page
    And I verify "Location Id" field on create organization page
    And I verify "Location Type" dropdown field on create organization page
    And I verify "Address 2" field on create organization page
    And I verify "Region" dropdown field on create organization page
    And I verify "*City" field on create organization page
    And I verify "Market" dropdown field on create organization page
    And I verify "*State" dropdown field on create organization page
    And I verify "*Postal Code" field on create organization page
    And I verify "Submit" button on create organization page
    And I verify "Cancel" button on create organization page

  Scenario: Check validation for Invalid Managing Organization
    When I click on "LTCH" organization tab on organization dashboard
    Then I click on "+" button on "LTCH" organization page
    And I verify "Create Long-Term Care Hospital Organization" header text on create organization page
    And I select "YES" radio button for managing organization
    Then I select "Invalid_Managing_Org" managing organization name in "YES" Has a Management Organization drop down
    And I verify "No results found" in Has a Management Organization dropdown

  Scenario Outline: <Description>
    When I click on "LTCH" organization tab on organization dashboard
    Then I click on "+" button on "LTCH" organization page
    And I verify "Create Long-Term Care Hospital Organization" header text on create organization page
    And I select "YES" radio button for managing organization
    Then I search and verify "<MO_Name>" managing organization name in "YES" Has a Management Organization drop down box

    Examples: 
      | Description                                                  | Has_MO | MO_Name |
      | Search for a valid Managing Organization on Create LTCH page | YES    | MONAME  |

  Scenario Outline: <Description>
    When I click on "LTCH" organization tab on organization dashboard
    Then I click on "+" button on "LTCH" organization page
    And I verify "Create Long-Term Care Hospital Organization" header text on create organization page
    Then I enter <LTCH_Name> in "Long-Term Care Hospital Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "LTCH - <CCN>" in "CCN" on create organization page
    And I provide unique "LTCH - <EIN>" in "EIN" on create organization page
    And I provide unique "LTCH - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    And I verify the radio buttons should get highlighted as red on create Organization Page

    Examples: 
      | Description                                            | LTCH_Name | Address1 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI |
      | Validation message when radio buttons are not selected | LTCHNAME  | Address1 | City | California |       12358 | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI |

  Scenario Outline: <Description>
    When I click on "LTCH" organization tab on organization dashboard
    Then I click on "+" button on "LTCH" organization page
    And I verify "Create Long-Term Care Hospital Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <LTCH_Name> in "Long-Term Care Hospital Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "LTCH - <CCN>" in "CCN" on create organization page
    And I provide unique "LTCH - <EIN>" in "EIN" on create organization page
    And I provide unique "LTCH - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                      | Has_MO | Managing_Org | LTCH_Name | Address1 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | ValidationMsg                               |
      | Check validation for blank Managing Organization | YES    | Blank        | LTCHNAME  | Address1 | City | California |       10000 | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | A Managing Organization has to be selected. |
      | Check validation for blank LTCH name             | NO     | MONAME       |           | Address1 | City | California |       10000 | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please enter an Organization Name           |
      | Check validation for blank Address1              | NO     | MONAME       | LTCHNAME  |          | City | California |       10000 | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please enter an Address                     |
      | Check validation for blank City                  | YES    | MONAME       | LTCHNAME  | Address1 |      | California |       10000 | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please enter a City                         |
      | Check validation for blank State                 | NO     | MONAME       | LTCHNAME  | Address1 | City |            |       10000 | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please select a State                       |
      | Check validation for blank Postal code           | NO     | MONAME       | LTCHNAME  | Address1 | City | California |             | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please enter a Postal Code                  |
      | Check validation for blank Location name         | NO     | MONAME       | LTCHNAME  | Address1 | City | California |       10000 |          | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please enter a Location Name                |
      | Check validation for blank Location Address1     | NO     | MONAME       | LTCHNAME  | Address1 | City | California |       10000 | LocName  |              | LCity    | California |           10001 | CCN | EIN | NPI | Please enter an Address                     |
      | Check validation for blank Location City         | NO     | MONAME       | LTCHNAME  | Address1 | City | California |       10000 | LocName  | LAddress1    |          | California |           10001 | CCN | EIN | NPI | Please enter a City                         |
      | Check validation for blank Location State        | NO     | MONAME       | LTCHNAME  | Address1 | City | California |       10000 | LocName  | LAddress1    | LCity    |            |           10001 | CCN | EIN | NPI | Please select a State                       |
      | Check validation for blank Location Postal code  | NO     | MONAME       | LTCHNAME  | Address1 | City | California |       10000 | LocName  | LAddress1    | LCity    | California |                 | CCN | EIN | NPI | Please enter a Postal Code                  |
      | Check validation for blank Identifiers           | NO     | MONAME       | LTCHNAME  | Address1 | City | California |       10000 | LocName  | LAddress1    | LCity    | California |           10001 |     |     |     | At least one identification is required     |

  Scenario Outline: <Description>
    When I click on "LTCH" organization tab on organization dashboard
    Then I click on "+" button on "LTCH" organization page
    And I verify "Create Long-Term Care Hospital Organization" header text on create organization page
    Then I enter <LTCH_Name> in "Long-Term Care Hospital Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "LTCH - <CCN>" in "CCN" on create organization page
    And I provide unique "LTCH - <EIN>" in "EIN" on create organization page
    And I provide unique "LTCH - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter Location Id <Location_ID> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    And I switch the focus to "submit" button
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                  | LTCH_Name                                                                    | Address1                                                  | Short_Name                                     | Address2                                                  | City                                           | Postal_Code | Loc_Name                                                                     | Loc_Address1                                             | Location_ID             | Loc_Address2                                              | Loc_City                                                  | Loc_Postal_Code | CCN         | EIN         | NPI          | ValidationMessage                                              |
      | Check Character Limit for LTCH name field                    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |                                                           |                                                |                                                           |                                                |             |                                                                              |                                                          |                         |                                                           |                                                           |                 |             |             |              | The Organization Name may not be greater than 75 characters.   |
      | Check Character Limit for Address1 field                     |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                                                           |                                                |             |                                                                              |                                                          |                         |                                                           |                                                           |                 |             |             |              | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Short Name field                   |                                                                              |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                                                           |                                                |             |                                                                              |                                                          |                         |                                                           |                                                           |                 |             |             |              | The shortName may not be greater than 45 characters.           |
      | Check Character Limit for Address2 field                     |                                                                              |                                                           |                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |             |                                                                              |                                                          |                         |                                                           |                                                           |                 |             |             |              | The second address line may not be greater than 55 characters. |
      | Check Character Limit for City field                         |                                                                              |                                                           |                                                |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |             |                                                                              |                                                          |                         |                                                           |                                                           |                 |             |             |              | The City may not be greater than 45 characters.                |
      | Check Character Limit for Postal code field                  |                                                                              |                                                           |                                                |                                                           |                                                | 10000-00000 |                                                                              |                                                          |                         |                                                           |                                                           |                 |             |             |              | Please enter a valid Postal Code                               |
      | Check Character Limit for Location name field                |                                                                              |                                                           |                                                |                                                           |                                                |             | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstqrstuvwxyzabcdefghijklmnopqrst |                                                          |                         |                                                           |                                                           |                 |             |             |              | The Location Name may not be greater than 75 characters.       |
      | Check Character Limit for Location Address1 field            |                                                                              |                                                           |                                                |                                                           |                                                |             |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstqrstuvwxyz |                         |                                                           |                                                           |                 |             |             |              | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Location id field                  |                                                                              |                                                           |                                                |                                                           |                                                |             |                                                                              |                                                          | LIDmorethan20characters |                                                           |                                                           |                 |             |             |              | The Location Id may not be greater than 20 characters.         |
      | Check Character Limit for Location Address2 field            |                                                                              |                                                           |                                                |                                                           |                                                |             |                                                                              |                                                          |                         | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstjklmnopqrst |                                                           |                 |             |             |              | The second address line may not be greater than 55 characters. |
      | Check Character Limit for Location City field                |                                                                              |                                                           |                                                |                                                           |                                                |             |                                                                              |                                                          |                         |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                 |             |             |              | The City may not be greater than 45 characters.                |
      | Check Character Limit for Location Postal code field         |                                                                              |                                                           |                                                |                                                           |                                                |             |                                                                              |                                                          |                         |                                                           |                                                           | 10000-00000     |             |             |              | Please enter a valid Postal Code                               |
      | Check Allowed Characters for CCN field                       |                                                                              |                                                           |                                                |                                                           |                                                |             |                                                                              |                                                          |                         |                                                           |                                                           |                 | @$%^&6!*&57 |             |              | The CCN field must be alphanumeric.                            |
      | Check Allowed Characters for EIN field                       |                                                                              |                                                           |                                                |                                                           |                                                |             |                                                                              |                                                          |                         |                                                           |                                                           |                 |             | $@^&*%67$^& |              | The EIN field must be alphanumeric.                            |
      | Check Allowed Characters for NPI field                       |                                                                              |                                                           |                                                |                                                           |                                                |             |                                                                              |                                                          |                         |                                                           |                                                           |                 |             |             | *@$%^93%#^&4 | The NPI field must be alphanumeric.                            |
      | Check Allowed Characters for postal code field               |                                                                              |                                                           |                                                |                                                           |                                                | abcdefghij  |                                                                              |                                                          |                         |                                                           |                                                           |                 |             |             |              | Please enter a valid Postal Code                               |
      | Check Allowed Characters for Location postal code field      |                                                                              |                                                           |                                                |                                                           |                                                |             |                                                                              |                                                          |                         |                                                           |                                                           | abcdefghij      |             |             |              | Please enter a valid Postal Code                               |
      | Validation message for invalid Character format- Location Id |                                                                              |                                                           |                                                |                                                           |                                                |             |                                                                              |                                                          | @$%fg^&*hg123           |                                                           |                                                           |                 |             |             |              | The Location Id format is invalid.                             |
      | Submit with errors LTCH Organization is not created          | LTCHNAME                                                                     | Address1                                                  | Short_Name                                     | Address2                                                  | City                                           | jklmnoprs   | Loc_Name                                                                     | Loc_Address1                                             |                         | Loc_Address2                                              | Loc_City                                                  | abcdefghij      | CCN         |             |              | Please enter a valid Postal Code                               |

  Scenario Outline: <Description>
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
    And I verify "Location 1" on "Create LTCH" organization page
    And I enter location name LocationName for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter Location Id <Location_ID> for Location "1" on "create LTCH" organization page
    And I select location type <Loc_Type> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "+" button on "LTCH" organization page
    And I verify "Location 2" on "Create LTCH" organization page
    And I enter location name <Loc_Name> for Location "2" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "2" on "create" organization page
    And I enter Location Id <Location_ID> for Location "2" on "create LTCH" organization page
    And I select location type <Loc_Type> for Location "2" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "create" organization page
    And I select region <Loc_Region> for Location "2" on "create" organization page
    And I enter city <Loc_City> for Location "2" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "2" on "create" organization page
    And I select state <Loc_State> for Location "2" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify duplicate "<Message>" after submitting the "create LTCH - <Has_MO>" organization page

    Examples: 
      | Description                                                                             | Has_MO | Managing_Org | LTCH_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Location_ID | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Loc_Name1     | CCN | EIN | NPI | Message                                                                                          |
      | Validation message for duplicate Location ID within same LTCH organization - Without MO | NO     |              | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 |  1236547890 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10001 | Loc_Name new2 | CCN | EIN | NPI | There is a conflict error because an entity with similar identifying attributes already existed. |

  Scenario Outline: <Description>
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
    And I verify "Location 1" on "Create LTCH" organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I select location type <Loc_Type> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "+" button on "LTCH" organization page
    And I verify "Location 2" on "Create LTCH" organization page
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

    Examples: 
      | Description                                                                          | Has_MO | Managing_Org | LTCH_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | Message                                 |
      | Create and verify LTCH Organization with Same multiple location details - Without MO | NO     |              | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | LTCH Organization Successfully Created. |
      | Create and verify LTCH Organization with Same multiple location - With MO            | YES    | MONAME       | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | LTCH Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I verify "Location 1" on "Create LTCH" organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I select location type <Loc_Type> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "+" button on "LTCH" organization page
    And I verify "Location 2" on "Create LTCH" organization page
    And I enter location name <Loc_Name1> for Location "2" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "2" on "create" organization page
    And I select location type <Loc_Type> for Location "2" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "create" organization page
    And I select region <Loc_Region> for Location "2" on "create" organization page
    And I enter city <Loc_City> for Location "2" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "2" on "create" organization page
    And I select state <Loc_State> for Location "2" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create LTCH - <Has_MO>" organization page

    Examples: 
      | Description                                                                       | Has_MO | Managing_Org | LTCH_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Loc_Name1  | CCN | EIN | NPI | Message                                 |
      | Create LTCH Organization with different details in multiple location - Without MO | NO     |              | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | Loc_Name11 | CCN | EIN | NPI | LTCH Organization Successfully Created. |
      | Create LTCH Organization with different details in multiple location - With MO    | YES    | MONAME       | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | Loc_Name11 | CCN | EIN | NPI | LTCH Organization Successfully Created. |

  Scenario Outline: <Description>
    When I click on "LTCH" organization tab on organization dashboard
    Then I click on "+" button on "LTCH" organization page
    And I verify "Create Long-Term Care Hospital Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <LTCH_Name> in "Long-Term Care Hospital Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "LTCH - <CCN>" in "CCN" on create organization page
    And I provide unique "LTCH - <EIN>" in "EIN" on create organization page
    And I provide unique "LTCH - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    And I verify "Please enter an Organization Name" mandatory field validation message on create organization page
    And I verify "Please enter an Address" mandatory field validation message on create organization page
    And I verify "Please enter a City" mandatory field validation message on create organization page
    And I verify "Please select a State" mandatory field validation message on create organization page
    And I verify "Please enter a Postal Code" mandatory field validation message on create organization page
    And I verify "Please enter a Location Name" mandatory field validation message on create organization page
    And I verify "Please enter an Address" mandatory field validation message on create organization page
    And I verify "Please enter a City" mandatory field validation message on create organization page
    And I verify "Please select a State" mandatory field validation message on create organization page
    And I verify "Please enter a Postal Code" mandatory field validation message on create organization page
    And I verify "At least one identification is required" mandatory field validation message on create organization page

    Examples: 
      | Description                                              | Has_MO | LTCH_Name | Address1 | City | State | Postal_Code | Loc_Name | Loc_Address1 | Loc_City | Loc_State | Loc_Postal_Code | CCN | EIN | NPI |
      | Create a LTCH Organization With Mandatory Fields Missing | NO     |           |          |      |       |             |          |              |          |           |                 |     |     |     |

  Scenario Outline: <Description>
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
    And I select location type <Loc_Type> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create LTCH - <Has_MO>" organization page

    Examples: 
      | Description                                                                                                         | Has_MO | Managing_Org | LTCH_Name            | Address1                                                | Short_Name                                    | Address2                                                | City                                          | State      | Postal_Code | Loc_Name                                                                    | Loc_Address1                                            | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2                                            | Loc_City                                      | Loc_State  | Loc_Postal_Code | CCN | EIN           | NPI           | Message                                 |
      | Check Character Limit edge condition for LTCH Name field on Create LTCH Organization - Without MO                   | NO     |              | equalsTo75Characters | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Check Character Limit edge condition for Address1 field on Create LTCH Organization - Without MO                    | NO     |              | LTCHNAME             | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklm | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Check Character Limit edge condition for Short Name field on Create LTCH Organization - Without MO                  | NO     |              | LTCHNAME             | Address1                                                | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabc | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Check Character Limit edge condition for Address2 field on Create LTCH Organization - Without MO                    | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklm | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Check Character Limit edge condition for City field on Create LTCH Organization - Without MO                        | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabc | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Check Character Limit edge condition for Postal code field on Create LTCH Organization - Without MO                 | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California | 10000-6325  | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Check Character Limit edge condition for Location name field on Create LTCH Organization - Without MO               | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklmilcomabcdefghijklmab | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Check Character Limit edge condition for Location Address1 field on Create LTCH Organization - Without MO           | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklm | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Check Character Limit edge condition for Location Address2 field on Create LTCH Organization - Without MO           | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabcdefghijklm | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Check Character Limit edge condition for Location City field on Create LTCH Organization - Without MO               | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | abcdefghijklmnopqrstuvwxyzabcdefgopmailcomabc | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Check Character Limit edge condition for Location Postal code field on Create LTCH Organization - Without MO        | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California | 10001-4562      | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | To check the Allowed characters for the available fields in Create LTCH Organization - Without MO                   | NO     |              | AllowedCharatcters   | !@$%^&*()_+{}:<>?,./;'[]\\=Address1                     | !@$%^&*()_+{}:<>?,./;'[]\\=Short_Name         | !@$%^&*()_+{}:<>?,./;'[]\\=Address2                     | !@$%^&*()_+{}:<>?,./;'[]\\=City123            | California |       10000 | !@$%^&*()_+{}:<>?,./;'[]\\=Loc_Name123                                      | !@$%^&*()_+{}:<>?,./;'[]\\=Loc_Address1                 | Long Term Care Hospital | Midwest    | Chicago    | !@$%^&*()_+{}:<>?,./;'[]\\=Loc_Address2                 | !@$%^&*()_+{}:<>?,./;'[]\\=Loc_City123        | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Create LTCH Organization with Mandatory fields - Without MO                                                         | NO     |              | LTCHNAME             | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            |                                                         | Loc_City                                      | California |           10000 | CCN |               |               | LTCH Organization Successfully Created. |
      | Create LTCH Organization with Mandatory fields + ShortName - Without MO                                             | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            |                                                         | Loc_City                                      | California |           10000 | CCN |               |               | LTCH Organization Successfully Created. |
      | Create LTCH Organization with Mandatory fields + Address2 - Without MO                                              | NO     |              | LTCHNAME             | Address1                                                |                                               | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            |                                                         | Loc_City                                      | California |           10000 | CCN | EIN           |               | LTCH Organization Successfully Created. |
      | Create LTCH Organization with Mandatory fields + Location Type - Without MO                                         | NO     |              | LTCHNAME             | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital |            |            |                                                         | Loc_City                                      | California |           10000 | CCN | EIN           |               | LTCH Organization Successfully Created. |
      | Create LTCH Organization with Mandatory fields + Location Address2 - Without MO                                     | NO     |              | LTCHNAME             | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           |               | LTCH Organization Successfully Created. |
      | Create LTCH Organization with Mandatory fields + Location Region - With MO                                          | YES    | MONAME       | LTCHNAME             | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |                         | Midwest    |            |                                                         | Loc_City                                      | California |           10000 | CCN | EIN           |               | LTCH Organization Successfully Created. |
      | Create LTCH Organization with Mandatory fields + ShortName + Location Type - With MO                                | YES    | MONAME       | LTCHNAME             | Address1                                                | Short_Name                                    |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital |            |            |                                                         | Loc_City                                      | California |           10000 | CCN | EIN           |               | LTCH Organization Successfully Created. |
      | Create LTCH Organization with Mandatory fields + ShortName + Address2 + Location Type - With MO                     | YES    | MONAME       | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital |            |            |                                                         | Loc_City                                      | California |           10000 | CCN | EIN           |               | LTCH Organization Successfully Created. |
      | Create LTCH Organization with Mandatory fields + ShortName + Address2 + Location Region + Location Market - With MO | YES    | MONAME       | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |                         | Midwest    | Chicago    |                                                         | Loc_City                                      | California |           10000 | CCN | EIN           |               | LTCH Organization Successfully Created. |
      | Create LTCH Organization with Mandatory fields + Address2 + Location Type + Location Address2 - Without MO          | NO     |              | LTCHNAME             | Address1                                                |                                               | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital |            |            | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           |               | LTCH Organization Successfully Created. |
      | Create LTCH Organization with Mandatory fields - With MO                                                            | YES    | MONAME       | LTCHNAME             | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            |                                                         | Loc_City                                      | California |           10000 | CCN |               |               | LTCH Organization Successfully Created. |
      | Create LTCH Organization with all the available fields - Without MO                                                 | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Create LTCH Organization with all the available fields - With MO                                                    | YES    | MONAME       | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | LTCH Organization Successfully Created. |
      | Create Duplicate LTCH Organization with Mandatory fields - Without MO                                               | NO     |              | DUPLICATE_LTCH       | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            |                                                         | Loc_City                                      | California |           10000 | CCN |               |               | LTCH Organization Successfully Created. |
      | Create Duplicate LTCH Organization with Mandatory fields - With MO                                                  | YES    | MONAME       | DUPLICATE_LTCH       | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |                         |            |            |                                                         | Loc_City                                      | California |           10000 | CCN |               |               | LTCH Organization Successfully Created. |
      | Create LTCH Organization with duplicate NPI- Without MO                                                             | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | DUPLICATE_NPI | LTCH Organization Successfully Created. |
      | Create LTCH Organization with duplicate EIN- Without MO                                                             | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | DUPLICATE_EIN | NPI           | LTCH Organization Successfully Created. |
      | Create LTCH Organization with same EIN and NPI- Without MO                                                          | NO     |              | LTCHNAME             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 |     |    1234567890 |    1234567890 | LTCH Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I verify "<Message>" field validation message on create organization page

    Examples: 
      | Description                                               | Has_MO | Managing_Org | LTCH_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Location_ID | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Loc_Name      | CCN           | EIN | NPI | Message              |
      | Verify Validation of LTCH Organization with duplicate CCN | NO     |              | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 |  1236547890 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10001 | Loc_Name new2 | DUPLICATE_CCN |     |     | CCN Id already taken |

  Scenario Outline: <Description>
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
    Then I verify "<Message>" after submitting the "create LTCH - <Has_MO>" organization page
    When I search with "LTCHNAME - <Has_MO>" on "LTCH" organization in search box
    And I click "LTCHNAME - <Has_MO>" field in search list on "LTCH" organization page
    Then I verify Location ID should be same as "LTCH" Organization CCN

    Examples: 
      | Description                                                                                   | Has_MO | Managing_Org | LTCH_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | Message                                 |
      | Create a LTCH Organization with Mandatory Fields and CCN as mandatory identifier - Without MO | NO     |              | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | LTCH Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I provide unique "LTCH - <NPI>" in "NPI" on create organization page
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
    Then I verify "<Message>" after submitting the "create LTCH - <Has_MO>" organization page
    When I search with "LTCHNAME - <Has_MO>" on "LTCH" organization in search box
    And I click "LTCHNAME - <Has_MO>" field in search list on "LTCH" organization page

    Examples: 
      | Description                                                                                       | Has_MO | Managing_Org | LTCH_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | Message                                 |
      | Create a LTCH Organization with Mandatory Fields and any other identifier except CCN - Without MO | NO     |              | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | LTCH Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I provide unique "LTCH - <NPI>" in "NPI" on create organization page
    And I verify "Location 1" on "Create LTCH" organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I select location type <Loc_Type> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "+" button on "LTCH" organization page
    And I verify "Location 2" on "Create LTCH" organization page
    And I enter location name <Loc_Name1> for Location "2" on "create" organization page
    And I enter address1 <Loc_Address1_2> for Location "2" on "create" organization page
    And I select location type <Loc_Type> for Location "2" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "create" organization page
    And I select region <Loc_Region> for Location "2" on "create" organization page
    And I enter city <Loc_City> for Location "2" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "2" on "create" organization page
    And I select state <Loc_State> for Location "2" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create LTCH - <Has_MO>" organization page
    When I search with "LTCHNAME - <Has_MO>" on "LTCH" organization in search box
    And I click "LTCHNAME - <Has_MO>" field in search list on "LTCH" organization page

    Examples: 
      | Description                                                                                  | Has_MO | Managing_Org | LTCH_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Loc_Name1     | Loc_Address1_2 | EIN | NPI | Message                                 |
      | Create a LTCH Organization without CCN identifier and having multiple locations - Without MO | NO     |              | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10001 | Loc_Name new2 | new address1   | EIN | NPI | LTCH Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I verify "Location 1" on "Create LTCH" organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter Location Id <Location_ID> for Location "1" on "create LTCH" organization page
    And I select location type <Loc_Type> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create LTCH - <Has_MO>" organization page

    Examples: 
      | Description                                          | Has_MO | Managing_Org | LTCH_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Location_ID | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Loc_Name      | CCN | EIN | NPI | Message                                 |
      | Create a LTCH Organization(With - Location Id + CCN) | NO     |              | LTCHNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | LID         | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10001 | Loc_Name new2 | CCN | EIN | NPI | LTCH Organization Successfully Created. |

  Scenario Outline: <Description>
    When I click on "SNF" organization tab on organization dashboard
    Then I click on "+" button on "SNF" organization page
    And I verify "Create SNF Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <SNF_Name> in "SNF Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "SNF - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I select location type Skilled Nursing for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "SNF Organization Successfully Created." after submitting the "create SNF - <Has_MO>" organization page
    When I search with "SNFNAME - <Has_MO>" on "SNF" organization in search box
    And I click "SNFNAME - <Has_MO>" field in search list on "SNF" organization page
    And I verify Location ID should be greater than "100000"
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
    And I provide unique "LTCH - <NPI>" in "NPI" on create organization page
    And I verify "Location 1" on "Create LTCH" organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I provide "Location_Id" as last created "Location_Id" on create organization page
    And I select location type <Loc_Type> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create LTCH - <Has_MO>" organization page

    Examples: 
      | Description                                               | Has_MO | Managing_Org | LTCH_Name | SNF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Location_ID | Loc_Type                | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Loc_Name      | CCN | EIN | NPI | Message                                                                                         |
      | Validation message using already existing SNF Location ID | NO     |              | LTCHNAME  | SNFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 |  1236547890 | Long Term Care Hospital | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10001 | Loc_Name new2 | CCN | EIN | NPI | There is a conflict error because an entity with similar identifying attributes already existed |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type |
      | MO   |
