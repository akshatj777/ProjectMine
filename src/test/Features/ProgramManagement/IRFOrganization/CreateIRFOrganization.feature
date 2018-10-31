Feature: Create IRF Organization functionality tests

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

  Scenario: Verification of availability of all the fields on Create IRF Organization page
    When I click on "IRF" organization tab on organization dashboard
    Then I verify "+" button under "IRF" organization page
    And I verify "CCN" header label under "IRF" organization
    And I verify "Database ID" header label under "IRF" organization
    And I verify "IRF Organization Name" header label under "IRF" organization
    And I verify "City" header label under "IRF" organization
    And I verify "State" header label under "IRF" organization
    And I verify "Postal Code" header label under "IRF" organization
    Then I click on "+" button on "IRF" organization page
    And I verify "Create Inpatient Rehab Facility Organization" header text on create organization page
    And I verify "*Inpatient Rehab Facility Organization Name" field on create organization page
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
    And I verify "+" button under "Create IRF" organization page
    And I verify "*Location Name" field on create organization page
    And I verify "*Address 1" field on create organization page
    And I verify "Address 2" field on create organization page
    And I verify "Region" dropdown field on create organization page
    And I verify "*City" field on create organization page
    And I verify "Market" dropdown field on create organization page
    And I verify "*State" dropdown field on create organization page
    And I verify "*Postal Code" field on create organization page
    And I verify "Submit" button on create organization page
    And I verify "Cancel" button on create organization page

  Scenario: Check validation for Invalid IRF Organization
    When I click on "IRF" organization tab on organization dashboard
    Then I click on "+" button on "IRF" organization page
    And I verify "Create Inpatient Rehab Facility Organization" header text on create organization page
    And I select "YES" radio button for managing organization
    Then I select "Invalid_Managing_Org" managing organization name in "YES" Has a Management Organization drop down
    And I verify "No results found" in Has a Management Organization dropdown

  Scenario Outline: <Description>
    When I click on "IRF" organization tab on organization dashboard
    Then I click on "+" button on "IRF" organization page
    And I verify "Create Inpatient Rehab Facility Organization" header text on create organization page
    And I select "YES" radio button for managing organization
    Then I search and verify "<MO_Name>" managing organization name in "YES" Has a Management Organization drop down box

    Examples: 
      | Description                                                 | Has_MO | MO_Name |
      | Search for a valid Managing Organization on Create IRF page | YES    | MONAME  |

  Scenario Outline: <Description>
    When I click on "IRF" organization tab on organization dashboard
    Then I click on "+" button on "IRF" organization page
    And I verify "Create Inpatient Rehab Facility Organization" header text on create organization page
    Then I enter <IRF_Name> in "Inpatient Rehab Facility Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "IRF - <CCN>" in "CCN" on create organization page
    And I provide unique "IRF - <EIN>" in "EIN" on create organization page
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    And I verify the radio buttons should get highlighted as red on create Organization Page

    Examples: 
      | Description                                            | IRF_Name | Address1 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI |
      | Validation message when radio buttons are not selected | IRFNAME  | Address1 | City | California |       10000 | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI |

  Scenario Outline: <Description>
    When I click on "IRF" organization tab on organization dashboard
    Then I click on "+" button on "IRF" organization page
    And I verify "Create Inpatient Rehab Facility Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <IRF_Name> in "Inpatient Rehab Facility Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "IRF - <CCN>" in "CCN" on create organization page
    And I provide unique "IRF - <EIN>" in "EIN" on create organization page
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                      | Has_MO | Managing_Org | IRF_Name | Address1 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | ValidationMsg                           |
      | Check validation for blank Managing Organization | YES    | Blank        | IRFNAME  | Address1 | City | California |       10000 | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please select one option                |
      | Check validation for blank IRF name              | YES    | MONAME       |          | Address1 | City | California |       10000 | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please enter an Organization Name       |
      | Check validation for blank Address1              | YES    | MONAME       | IRFNAME  |          | City | California |       10000 | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please enter an Address                 |
      | Check validation for blank City                  | YES    | MONAME       | IRFNAME  | Address1 |      | California |       10000 | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please enter a City                     |
      | Check validation for blank State                 | YES    | MONAME       | IRFNAME  | Address1 | City |            |       10000 | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please select a State                   |
      | Check validation for blank Postal code           | NO     |              | IRFNAME  | Address1 | City | California |             | LocName  | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please enter a Postal Code              |
      | Check validation for blank Location name         | NO     |              | IRFNAME  | Address1 | City | California |       10000 |          | LAddress1    | LCity    | California |           10001 | CCN | EIN | NPI | Please enter a Location Name            |
      | Check validation for blank Location Address1     | NO     |              | IRFNAME  | Address1 | City | California |       10000 | LocName  |              | LCity    | California |           10001 | CCN | EIN | NPI | Please enter an Address                 |
      | Check validation for blank Location City         | NO     |              | IRFNAME  | Address1 | City | California |       10000 | LocName  | LAddress1    |          | California |           10001 | CCN | EIN | NPI | Please enter a City                     |
      | Check validation for blank Location State        | NO     |              | IRFNAME  | Address1 | City | California |       10000 | LocName  | LAddress1    | LCity    |            |           10001 | CCN | EIN | NPI | Please select a State                   |
      | Check validation for blank Location Postal code  | NO     |              | IRFNAME  | Address1 | City | California |       10000 | LocName  | LAddress1    | LCity    | California |                 | CCN | EIN | NPI | Please enter a Postal Code              |
      | Check validation for blank Identifiers           | NO     |              | IRFNAME  | Address1 | City | California |       10000 | LocName  | LAddress1    | LCity    | California |           10001 |     |     |     | At least one identification is required |

  Scenario Outline: <Description>
    When I click on "IRF" organization tab on organization dashboard
    Then I click on "+" button on "IRF" organization page
    And I verify "Create Inpatient Rehab Facility Organization" header text on create organization page
    Then I enter <IRF_Name> in "Inpatient Rehab Facility Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "IRF - <CCN>" in "CCN" on create organization page
    And I provide unique "IRF - <EIN>" in "EIN" on create organization page
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter Location Id <Location_ID> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    And I switch the focus to "submit" button
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                  | IRF_Name                                                                     | Address1                                                  | Short_Name                                     | Address2                                                  | City                                           | Postal_Code  | Loc_Name                                                                     | Loc_Address1                                              | Location_ID             | Loc_Address2                                              | Loc_City                                                  | Loc_Postal_Code | CCN         | EIN         | NPI          | ValidationMessage                                              |
      | Check Character Limit for IRF name field                     | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |                                                           |                                                |                                                           |                                                |              |                                                                              |                                                           |                         |                                                           |                                                           |                 |             |             |              | The Organization Name may not be greater than 75 characters.   |
      | Check Character Limit for Address1 field                     |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                                                           |                                                |              |                                                                              |                                                           |                         |                                                           |                                                           |                 |             |             |              | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Short Name field                   |                                                                              |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                                                           |                                                |              |                                                                              |                                                           |                         |                                                           |                                                           |                 |             |             |              | The shortName may not be greater than 45 characters.           |
      | Check Character Limit for Address2 field                     |                                                                              |                                                           |                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |              |                                                                              |                                                           |                         |                                                           |                                                           |                 |             |             |              | The second address line may not be greater than 55 characters. |
      | Check Character Limit for City field                         |                                                                              |                                                           |                                                |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |              |                                                                              |                                                           |                         |                                                           |                                                           |                 |             |             |              | The City may not be greater than 45 characters.                |
      | Check Character Limit for Postal code field                  |                                                                              |                                                           |                                                |                                                           |                                                | 10000-00000  |                                                                              |                                                           |                         |                                                           |                                                           |                 |             |             |              | Please enter a valid Postal Code                               |
      | Check Character Limit for Location name field                |                                                                              |                                                           |                                                |                                                           |                                                |              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstqrstuvwxyzabcdefghijklmnopqrst |                                                           |                         |                                                           |                                                           |                 |             |             |              | The Location Name may not be greater than 75 characters.       |
      | Check Character Limit for Location Address1 field            |                                                                              |                                                           |                                                |                                                           |                                                |              |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                         |                                                           |                                                           |                 |             |             |              | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Location id field                  |                                                                              |                                                           |                                                |                                                           |                                                |              |                                                                              |                                                           | LIDmorethan20characters |                                                           |                                                           |                 |             |             |              | The Location Id may not be greater than 20 characters.         |
      | Check Character Limit for Location Address2 field            |                                                                              |                                                           |                                                |                                                           |                                                |              |                                                                              |                                                           |                         | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstjklmnopqrst |                                                           |                 |             |             |              | The second address line may not be greater than 55 characters. |
      | Check Character Limit for Location City field                |                                                                              |                                                           |                                                |                                                           |                                                |              |                                                                              |                                                           |                         |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                 |             |             |              | The City may not be greater than 45 characters.                |
      | Check Character Limit for Location Postal code field         |                                                                              |                                                           |                                                |                                                           |                                                |              |                                                                              |                                                           |                         |                                                           |                                                           | 10000-00000     |             |             |              | Please enter a valid Postal Code                               |
      | Check Character Limit for CCN field - Less than 4 characters |                                                                              |                                                           |                                                |                                                           |                                                |              |                                                                              |                                                           |                         |                                                           |                                                           |                 | lessThan4   |             |              | The CCN must be at least 4 characters.                         |
      | Check Allowed Characters for Postal code field               |                                                                              |                                                           |                                                |                                                           |                                                | abcdefghijkl |                                                                              |                                                           |                         |                                                           |                                                           |                 |             |             |              | Please enter a valid Postal Code                               |
      | Check Allowed Characters for Location Postal code field      |                                                                              |                                                           |                                                |                                                           |                                                |              |                                                                              |                                                           |                         |                                                           |                                                           | abcdefghijkl    |             |             |              | Please enter a valid Postal Code                               |
      | Check Allowed Characters for CCN field                       |                                                                              |                                                           |                                                |                                                           |                                                |              |                                                                              |                                                           |                         |                                                           |                                                           |                 | @$%^&6!*&57 |             |              | The CCN field must be alphanumeric.                            |
      | Check Allowed Characters for EIN field                       |                                                                              |                                                           |                                                |                                                           |                                                |              |                                                                              |                                                           |                         |                                                           |                                                           |                 |             | $@^&*%67$^& |              | The EIN field must be alphanumeric.                            |
      | Check Allowed Characters for NPI field                       |                                                                              |                                                           |                                                |                                                           |                                                |              |                                                                              |                                                           |                         |                                                           |                                                           |                 |             |             | *@$%^93%#^&4 | The NPI field must be alphanumeric.                            |
      | Validation message for invalid Character format- Location Id |                                                                              |                                                           |                                                |                                                           |                                                |              |                                                                              |                                                           | @$%fg^&*hg123           |                                                           |                                                           |                 |             |             |              | The Location Id format is invalid.                             |

  Scenario Outline: <Description>
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
    And I enter Location Id <Location_ID> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 2" on "Create IRF" organization page
    And I enter location name <Loc_Name> for Location "2" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "2" on "create" organization page
    And I enter Location Id <Location_ID> for Location "2" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "create" organization page
    And I select region <Loc_Region> for Location "2" on "create" organization page
    And I enter city <Loc_City> for Location "2" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "2" on "create" organization page
    And I select state <Loc_State> for Location "2" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    And I verify duplicate Location Message "Duplicate Location"

    Examples: 
      | Description                                                                       | Has_MO | Managing_Org | IRF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Location_ID | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN |
      | Validation message for create IRF with 2 locations with same details - Without MO | NO     |              | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 |  1234567890 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN |

  Scenario Outline: <Description>
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
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create IRF - <Has_MO>" organization page
    When I search with "IRFNAME - <Has_MO>" on "IRF" organization in search box
    And I click "IRFNAME - <Has_MO>" field in search list on "IRF" organization page
    Then I verify Location ID should be same as "IRF" Organization CCN

    Examples: 
      | Description                                                                                  | Has_MO | Managing_Org | IRF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | Message                                |
      | Create a IRF Organization with Mandatory Fields and CCN as mandatory identifier - Without MO | NO     |              | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | CCN | EIN | NPI | IRF Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create IRF - <Has_MO>" organization page
    When I search with "IRFNAME - <Has_MO>" on "IRF" organization in search box
    And I click "IRFNAME - <Has_MO>" field in search list on "IRF" organization page
    And I verify Location ID should be greater than "100000"

    Examples: 
      | Description                                                                                      | Has_MO | Managing_Org | IRF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | EIN | NPI | Message                                |
      | Create a IRF Organization with Mandatory Fields and any other identifier except CCN - Without MO | NO     |              | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       12356 | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           51636 | CCN | EIN | NPI | IRF Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I verify "Location 1" on "Create IRF" organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 2" on "Create IRF" organization page
    And I enter location name <Loc_Name1> for Location "2" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "2" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "create" organization page
    And I select region <Loc_Region> for Location "2" on "create" organization page
    And I enter city <Loc_City> for Location "2" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "2" on "create" organization page
    And I select state <Loc_State> for Location "2" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create IRF - <Has_MO>" organization page
    When I search with "IRFNAME - <Has_MO>" on "IRF" organization in search box
    And I click "IRFNAME - <Has_MO>" field in search list on "IRF" organization page

    Examples: 
      | Description                                                                                 | Has_MO | Managing_Org | IRF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Loc_Name1     | NPI | Message                                |
      | Create a IRF Organization without CCN identifier and having multiple locations - Without MO | NO     |              | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10001 | Loc_Name new2 | NPI | IRF Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I verify "Location 1" on "Create IRF" organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "IRF Organization Successfully Created." after submitting the "create IRF - <Has_MO>" organization page
    When I search with "IRFNAME - <Has_MO>" on "IRF" organization in search box
    And I click "IRFNAME - <Has_MO>" field in search list on "IRF" organization page
    And I verify Location ID should be greater than "100000"
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
    And I provide "CCN" as last created "Location_Id" on create organization page
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I verify "Location 1" on "Create IRF" organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create IRF - <Has_MO>" organization page

    Examples: 
      | Description                                                                                                                   | Has_MO | Managing_Org | IRF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Location_ID | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Loc_Name      | CCN | NPI | Message                                |
      | Verify auto generated location ID when CCN of current organization is already used as location Id for some other organization | NO     |              | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | LID         | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           14561 | Loc_Name new2 | CCN | NPI | IRF Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create IRF - <Has_MO>" organization page

    Examples: 
      | Description                                         | Has_MO | Managing_Org | IRF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Location_ID | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN | Message                                |
      | Create a IRF Organization(With - Location Id + CCN) | NO     |              | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | LID         | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10001 | CCN | IRF Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I provide unique "ACH - <NPI>" in "NPI" on create organization page
    And I verify "Location 1" on "Create Hospital" organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter Location Id <Location_ID> for Location "1" on "create Hospital" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "Hospital Organization Successfully Created." after submitting the "create ACH - <Has_MO>" organization page
    When I click on Organization link on Program Management page
    When I click on "IRF" organization tab on organization dashboard
    Then I click on "+" button on "IRF" organization page
    And I verify "Create Inpatient Rehab Facility Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <IRF_NAME> in "Inpatient Rehab Facility Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter Location Id <Loc_ID> for Location "1" on "create IRF" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify duplicate "<Message>" after submitting the "create IRF" organization page

    Examples: 
      | Description                                                    | Has_MO | Hosp_Name | Managing_Org | IRF_NAME | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Location_ID | Loc_ID       | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | NPI | Message                                                                                          |
      | Validation message using already existing Hospital Location ID | NO     | ACHNAME   |              | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | LID         | Hospital_LID | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10001 | NPI | There is a conflict error because an entity with similar identifying attributes already existed. |

  Scenario Outline: <Description>
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
    And I provide unique "IRF - <EIN>" in "EIN" on create organization page
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I verify "Location 1" on "Create IRF" organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter Location Id <Location_ID> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 2" on "Create IRF" organization page
    And I enter location name <Loc_Name> for Location "2" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "2" on "create" organization page
    And I enter Location Id <Location_ID> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "create" organization page
    And I select region <Loc_Region> for Location "2" on "create" organization page
    And I enter city <Loc_City> for Location "2" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "2" on "create" organization page
    And I select state <Loc_State> for Location "2" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    And I verify duplicate Location Message "Duplicate Location"

    Examples: 
      | Description                                                                         | Has_MO | Managing_Org | IRF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Location_ID | CCN | EIN | NPI | Message                                |
      | Create and verify IRF Organization with Same multiple location details - Without MO | NO     |              | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 |    12346789 | CCN | EIN | NPI | IRF Organization Successfully Created. |
      | Create and verify IRF Organization with Same multiple location - With MO            | YES    | MONAME       | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 |   123456789 | CCN | EIN | NPI | IRF Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I provide unique "IRF - <EIN>" in "EIN" on create organization page
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I verify "Location 1" on "Create IRF" organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 2" on "Create IRF" organization page
    And I enter location name <Loc_Name1> for Location "2" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "2" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "create" organization page
    And I select region <Loc_Region> for Location "2" on "create" organization page
    And I enter city <Loc_City> for Location "2" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "2" on "create" organization page
    And I select state <Loc_State> for Location "2" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create IRF - <Has_MO>" organization page

    Examples: 
      | Description                                                                      | Has_MO | Managing_Org | IRF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Loc_Name1     | CCN | EIN | NPI | Message                                |
      | Create IRF Organization with different details in multiple location - Without MO | NO     |              | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | Loc_Name New  | CCN | EIN | NPI | IRF Organization Successfully Created. |
      | Create IRF Organization with different details in multiple location - With MO    | YES    | MONAME       | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | Loc_Name New1 | CCN | EIN | NPI | IRF Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I provide unique "IRF - <EIN>" in "EIN" on create organization page
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I verify "Location 1" on "Create IRF" organization page
    And I enter location name <Loc_Name1> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 2" on "Create IRF" organization page
    And I enter location name <Loc_Name2> for Location "2" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "2" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "2" on "create" organization page
    And I select region <Loc_Region> for Location "2" on "create" organization page
    And I enter city <Loc_City> for Location "2" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "2" on "create" organization page
    And I select state <Loc_State> for Location "2" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "2" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 3" on "Create IRF" organization page
    And I enter location name <Loc_Name3> for Location "3" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "3" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "3" on "create" organization page
    And I select region <Loc_Region> for Location "3" on "create" organization page
    And I enter city <Loc_City> for Location "3" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "3" on "create" organization page
    And I select state <Loc_State> for Location "3" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "3" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 4" on "Create IRF" organization page
    And I enter location name <Loc_Name4> for Location "4" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "4" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "4" on "create" organization page
    And I select region <Loc_Region> for Location "4" on "create" organization page
    And I enter city <Loc_City> for Location "4" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "4" on "create" organization page
    And I select state <Loc_State> for Location "4" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "4" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 5" on "Create IRF" organization page
    And I enter location name <Loc_Name5> for Location "5" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "5" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "5" on "create" organization page
    And I select region <Loc_Region> for Location "5" on "create" organization page
    And I enter city <Loc_City> for Location "5" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "5" on "create" organization page
    And I select state <Loc_State> for Location "5" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "5" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 6" on "Create IRF" organization page
    And I enter location name <Loc_Name6> for Location "6" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "6" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "6" on "create" organization page
    And I select region <Loc_Region> for Location "6" on "create" organization page
    And I enter city <Loc_City> for Location "6" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "6" on "create" organization page
    And I select state <Loc_State> for Location "6" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "6" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 7" on "Create IRF" organization page
    And I enter location name <Loc_Name7> for Location "7" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "7" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "7" on "create" organization page
    And I select region <Loc_Region> for Location "7" on "create" organization page
    And I enter city <Loc_City> for Location "7" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "7" on "create" organization page
    And I select state <Loc_State> for Location "7" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "7" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 8" on "Create IRF" organization page
    And I enter location name <Loc_Name8> for Location "8" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "8" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "8" on "create" organization page
    And I select region <Loc_Region> for Location "8" on "create" organization page
    And I enter city <Loc_City> for Location "8" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "8" on "create" organization page
    And I select state <Loc_State> for Location "8" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "8" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 9" on "Create IRF" organization page
    And I enter location name <Loc_Name9> for Location "9" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "9" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "9" on "create" organization page
    And I select region <Loc_Region> for Location "9" on "create" organization page
    And I enter city <Loc_City> for Location "9" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "9" on "create" organization page
    And I select state <Loc_State> for Location "9" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "9" on "create" organization page
    Then I click on "+" button on "IRF" organization page
    And I verify "Location 10" on "Create IRF" organization page
    And I enter location name <Loc_Name10> for Location "10" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "10" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "10" on "create" organization page
    And I select region <Loc_Region> for Location "10" on "create" organization page
    And I enter city <Loc_City> for Location "10" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "10" on "create" organization page
    And I select state <Loc_State> for Location "10" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "10" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create IRF - <Has_MO>" organization page

    Examples: 
      | Description                                           | Has_MO | Managing_Org | IRF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | Loc_Name1 | Loc_Name2 | Loc_Name3 | Loc_Name4 | Loc_Name5 | Loc_Name6 | Loc_Name7 | Loc_Name8 | Loc_Name9 | Loc_Name10 | CCN | EIN | NPI | Message                                |
      | Create IRF Organization with 10 location - Without MO | NO     |              | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | Loc_Name1 | Loc_Name2 | Loc_Name3 | Loc_Name4 | Loc_Name5 | Loc_Name6 | Loc_Name7 | Loc_Name8 | Loc_Name9 | Loc_Name10 | CCN | EIN | NPI | IRF Organization Successfully Created. |
      | Create IRF Organization with 10 location - With MO    | YES    | MONAME       | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | Loc_Name1 | Loc_Name2 | Loc_Name3 | Loc_Name4 | Loc_Name5 | Loc_Name6 | Loc_Name7 | Loc_Name8 | Loc_Name9 | Loc_Name10 | CCN | EIN | NPI | IRF Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I provide unique "IRF - <EIN>" in "EIN" on create organization page
    And I provide unique "IRF - <NPI>" in "NPI" on create organization page
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create IRF - <Has_MO>" organization page

    Examples: 
      | Description                                                                                                        | Has_MO | Managing_Org | IRF_Name      | Address1                                                | Short_Name                                    | Address2                                                | City                                          | State      | Postal_Code | Loc_Name                                                                    | Loc_Address1                                            | Loc_Type | Loc_Region | Loc_Market | Loc_Address2                                            | Loc_City                                      | Loc_State  | Loc_Postal_Code | CCN | EIN           | NPI           | Message                                |
      #| Check Character Limit edge condition for IRF name field - Without MO                                                  | NO     |              | equalsTo75Characters | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Check Character Limit edge condition for Address1 field - Without MO                                               | NO     |              | IRFNAME       | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsjklmnopqrs | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Check Character Limit edge condition for Short Name field - Without MO                                             | NO     |              | IRFNAME       | Address1                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Check Character Limit edge condition for Address2 field - Without MO                                               | NO     |              | IRFNAME       | Address1                                                | Short_Name                                    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsjklmnopqrs | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Check Character Limit edge condition for City field - Without MO                                                   | NO     |              | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Check Character Limit edge condition for Postal code field - Without MO                                            | NO     |              | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California | 10000-0000  | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Check Character Limit edge condition for Location Name field - Without MO                                          | NO     |              | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrszabcdefghijklmnopqrsjklmnopqrs | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Check Character Limit edge condition for Location Address1 field - Without MO                                      | NO     |              | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrszabcdefghi | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Check Character Limit edge condition for Location Address2 field - Without MO                                      | NO     |              | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrszabcdefghi | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Check Character Limit edge condition for Location city field - Without MO                                          | NO     |              | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqsd | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Check Character Limit edge condition for Location postal code field - Without MO                                   | NO     |              | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California | 10000-2345      | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      #| To check the Allowed characters for the available fields in Create Inpatient Rehab Facility Organization - Without MO | NO     |              | AllowedCharatcters   | !@$%^&*()_+{}:<>?,./;'[]\\=Address1                     | !@$%^&*()_+{}:<>?,./;'[]\\=Short_Name         | !@$%^&*()_+{}:<>?,./;'[]\\=Address2                     | !@$%^&*()_+{}:<>?,./;'[]\\=City123            | California |       10000 | !@$%^&*()_+{}:<>?,./;'[]\\=Loc_Name123                                      | !@$%^&*()_+{}:<>?,./;'[]\\=Loc_Address1                 | IRF      | Midwest    | Chicago    | !@$%^&*()_+{}:<>?,./;'[]\\=Loc_Address2                 | !@$%^&*()_+{}:<>?,./;'[]\\=Loc_City123        | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Create IRF Organization with Mandatory fields - Without MO                                                         | NO     |              | IRFNAME       | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | CCN |               |               | IRF Organization Successfully Created. |
      | Create IRF Organization with Mandatory fields + ShortName - Without MO                                             | NO     |              | IRFNAME       | Address1                                                | Short_Name                                    |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | CCN |               |               | IRF Organization Successfully Created. |
      | Create IRF Organization with Mandatory fields + Address2 - Without MO                                              | NO     |              | IRFNAME       | Address1                                                |                                               | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | CCN | EIN           |               | IRF Organization Successfully Created. |
      | Create IRF Organization with Mandatory fields + Location Type - Without MO                                         | NO     |              | IRFNAME       | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      |            |            |                                                         | Loc_City                                      | California |           10000 | CCN | EIN           |               | IRF Organization Successfully Created. |
      | Create IRF Organization with Mandatory fields + Location Address2 - Without MO                                     | NO     |              | IRFNAME       | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           |               | IRF Organization Successfully Created. |
      | Create IRF Organization with Mandatory fields + Location Region - With MO                                          | YES    | MONAME       | IRFNAME       | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |          | Midwest    |            |                                                         | Loc_City                                      | California |           10000 | CCN | EIN           |               | IRF Organization Successfully Created. |
      | Create IRF Organization with Mandatory fields + ShortName + Location Type - With MO                                | YES    | MONAME       | IRFNAME       | Address1                                                | Short_Name                                    |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      |            |            |                                                         | Loc_City                                      | California |           10000 | CCN | EIN           |               | IRF Organization Successfully Created. |
      | Create IRF Organization with Mandatory fields + ShortName + Address2 + Location Type - With MO                     | YES    | MONAME       | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      |            |            |                                                         | Loc_City                                      | California |           10000 | CCN | EIN           |               | IRF Organization Successfully Created. |
      | Create IRF Organization with Mandatory fields + ShortName + Address2 + Location Region + Location Market - With MO | YES    | MONAME       | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |          | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           |               | IRF Organization Successfully Created. |
      | Create IRF Organization with Mandatory fields + Address2 + Location Type + Location Address2 - Without MO          | NO     |              | IRFNAME       | Address1                                                |                                               | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      |            |            | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           |               | IRF Organization Successfully Created. |
      | Create IRF Organization with Mandatory fields - With MO                                                            | YES    | MONAME       | IRFNAME       | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | CCN |               |               | IRF Organization Successfully Created. |
      | Create IRF Organization with all the available fields - Without MO                                                 | NO     |              | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Create IRF Organization with all the available fields - With MO                                                    | YES    | MONAME       | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 | CCN | EIN           | NPI           | IRF Organization Successfully Created. |
      | Create Duplicate IRF Organization with Mandatory fields - Without MO                                               | NO     |              | DUPLICATE_IRF | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | CCN |               |               | IRF Organization Successfully Created. |
      | Create Duplicate IRF Organization with Mandatory fields - With MO                                                  | YES    | MONAME       | DUPLICATE_IRF | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 | CCN |               |               | IRF Organization Successfully Created. |
      | Create IRF Organization with duplicate NPI- Without MO                                                             | NO     |              | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 |     | EIN           | DUPLICATE_NPI | IRF Organization Successfully Created. |
      | Create IRF Organization with duplicate EIN- Without MO                                                             | NO     |              | IRFNAME       | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            | IRF      | Midwest    | Chicago    | Loc_Address2                                            | Loc_City                                      | California |           10000 |     | DUPLICATE_EIN | NPI           | IRF Organization Successfully Created. |
      | Create IRF Organization with same EIN and NPI - With MO                                                            | YES    | MONAME       | IRFNAME       | Address1                                                |                                               |                                                         | City                                          | California |       10000 | Loc_Name                                                                    | Loc_Address1                                            |          |            |            |                                                         | Loc_City                                      | California |           10000 |     |    1234567890 |    1234567890 | IRF Organization Successfully Created. |

  Scenario Outline: <Description>
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
    And I enter location name <Loc_Name> for Location "1" on "create" organization page
    And I enter address1 <Loc_Address1> for Location "1" on "create" organization page
    And I enter address2 <Loc_Address2> for Location "1" on "create" organization page
    And I select region <Loc_Region> for Location "1" on "create" organization page
    And I enter city <Loc_City> for Location "1" on "create" organization page
    And I select market <Loc_Market> for region "<Loc_Region>" for Location "1" on "create" organization page
    And I select state <Loc_State> for Location "1" on "create" organization page
    And I enter zip <Loc_Postal_Code> for Location "1" on "create" organization page
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                            | Has_MO | Managing_Org | IRF_Name | Address1 | Short_Name | Address2 | City | State      | Postal_Code | Loc_Name | Loc_Address1 | Loc_Type | Loc_Region | Loc_Market | Loc_Address2 | Loc_City | Loc_State  | Loc_Postal_Code | CCN           | EIN | NPI | ValidationMessage    |
      | Create IRF Organization with duplicate CCN- Without MO | NO     |              | IRFNAME  | Address1 | Short_Name | Address2 | City | California |       10000 | Loc_Name | Loc_Address1 | IRF      | Midwest    | Chicago    | Loc_Address2 | Loc_City | California |           10000 | DUPLICATE_CCN |     | NPI | CCN Id already taken |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type |
      | MO   |