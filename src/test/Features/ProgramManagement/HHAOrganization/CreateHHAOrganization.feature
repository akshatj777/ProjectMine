Feature: Create HHA organization functionality tests

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

  Scenario: Verification of availability of all the fields on Create HHA Organization page
    When I click on "HHA" organization tab on organization dashboard
    Then I verify "+" button under "HHA" organization page
    And I verify "CCN" header label under "HHA" organization
    And I verify "HHA Organization Name" header label under "HHA" organization
    And I verify "City" header label under "HHA" organization
    And I verify "State" header label under "HHA" organization
    And I verify "Postal Code" header label under "HHA" organization
    Then I click on "+" button on "HHA" organization page
    And I verify "Create HHA Organization" header text on create organization page
    And I verify "Has a Managing Organization" radio button on create organization page
    And I verify "No Managing Organization" radio button on create organization page
    And I verify "*HHA Organization Name" field on create organization page
    And I verify "Short Name" field on create organization page
    And I verify "*Address 1" field on create organization page
    And I verify "Address 2" field on create organization page
    And I verify "*City" field on create organization page
    And I verify "CCN" field on create organization page
    And I verify "Region" dropdown field on create organization page
    And I verify "Market" dropdown field on create organization page
    And I verify "EIN" field on create organization page
    And I verify "NPI" field on create organization page
    And I verify "*State" dropdown field on create organization page
    And I verify "*Postal Code" field on create organization page
    And I verify "Submit" button on create organization page
    And I verify "Cancel" button on create organization page

  Scenario Outline: <Description>
    When I click on "HHA" organization tab on organization dashboard
    Then I click on "+" button on "HHA" organization page
    And I verify "Create HHA Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <HHA_Name> in "HHA Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "HHA - <CCN>" in "CCN" on create organization page
    And I provide unique "HHA - <EIN>" in "EIN" on create organization page
    And I provide unique "HHA - <NPI>" in "NPI" on create organization page
    Then I click on "Submit" button on "create" organization page
    And I verify "Please enter an Organization Name" mandatory field validation message on create organization page
    And I verify "Please enter an Address" mandatory field validation message on create organization page
    And I verify "Please enter a City" mandatory field validation message on create organization page
    And I verify "Please select a State" mandatory field validation message on create organization page
    And I verify "Please enter a Postal Code" mandatory field validation message on create organization page
    And I verify "At least one identification is required" mandatory field validation message on create organization page

    Examples: 
      | Description                                             | Has_MO | HHA_Name | Address1 | City | State | Postal_Code | CCN | EIN | NPI |
      | Create a HHA Organization With Mandatory Fields Missing | YES    |          |          |      |       |             |     |     |     |

  Scenario: Check validation for Invalid Managing Organization in Create HHA Organization
    When I click on "HHA" organization tab on organization dashboard
    Then I click on "+" button on "HHA" organization page
    And I verify "Create HHA Organization" header text on create organization page
    And I select "YES" radio button for managing organization
    Then I select "Invalid_Managing_Org" managing organization name in "YES" Has a Management Organization drop down
    And I verify "No results found" in Has a Management Organization dropdown

  Scenario Outline: <Description>
    When I click on "HHA" organization tab on organization dashboard
    Then I click on "+" button on "HHA" organization page
    And I verify "Create HHA Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <HHA_Name> in "HHA Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "HHA - <CCN>" in "CCN" on create organization page
    And I provide unique "HHA - <EIN>" in "EIN" on create organization page
    And I provide unique "HHA - <NPI>" in "NPI" on create organization page
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                      | Has_MO | Managing_Org | HHA_Name | Address1 | City | State      | Postal_Code | CCN | EIN | NPI | ValidationMsg                               |
      | Check validation for blank Managing Organization | YES    | Blank        | HHANAME  | Address1 | City | California |       10000 | CCN | EIN | NPI | A Managing Organization has to be selected. |
      | Check validation for blank HHA name              | YES    | MONAME       |          | Address1 | City | California |       10000 | CCN | EIN | NPI | Please enter an Organization Name           |
      | Check validation for blank Address1              | YES    | MONAME       | HHANAME  |          | City | California |       10000 | CCN | EIN | NPI | Please enter an Address                     |
      | Check validation for blank City                  | YES    | MONAME       | HHANAME  | Address1 |      | California |       10000 | CCN | EIN | NPI | Please enter a City                         |
      | Check validation for blank State                 | YES    | MONAME       | HHANAME  | Address1 | City |            |       10000 | CCN | EIN | NPI | Please select a State                       |
      | Check validation for blank Postal code           | NO     |              | HHANAME  | Address1 | City | California |             | CCN | EIN | NPI | Please enter a Postal Code                  |
      | Check validation for blank Identifiers           | NO     |              | HHANAME  | Address1 | City | California |       10000 |     |     |     | At least one identification is required     |

  Scenario Outline: <Description>
    When I click on "HHA" organization tab on organization dashboard
    Then I click on "+" button on "HHA" organization page
    And I verify "Create HHA Organization" header text on create organization page
    Then I enter <HHA_Name> in "HHA Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <City> in "City" on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "HHA - <CCN>" in "CCN" on create organization page
    And I provide unique "HHA - <EIN>" in "EIN" on create organization page
    And I provide unique "HHA - <NPI>" in "NPI" on create organization page
    And I switch the focus to "submit" button
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                                  | HHA_Name                                                                     | Address1                                                  | Short_Name                                     | Address2                                                  | City                                           | Postal_Code  | CCN         | EIN         | NPI          | ValidationMessage                                              |
      | Check Character Limit for HHA name field                     | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |                                                           |                                                |                                                           |                                                |              |             |             |              | The Organization Name may not be greater than 75 characters.   |
      | Check Character Limit for Address1 field                     |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                                                           |                                                |              |             |             |              | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for Short Name field                   |                                                                              |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                                                           |                                                |              |             |             |              | The shortName may not be greater than 45 characters.           |
      | Check Character Limit for Address2 field                     |                                                                              |                                                           |                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |              |             |             |              | The second address line may not be greater than 55 characters. |
      | Check Character Limit for City field                         |                                                                              |                                                           |                                                |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |              |             |             |              | The City may not be greater than 45 characters.                |
      | Check Character Limit for Postal code field                  |                                                                              |                                                           |                                                |                                                           |                                                | 10000-00000  |             |             |              | Please enter a valid Postal Code                               |
      | Check Character Limit for CCN field - Less than 6 characters |                                                                              |                                                           |                                                |                                                           |                                                |              | lessThan6   |             |              | The CCN must be at least 6 characters.                         |
      #| Check Character Limit for CCN field - Greater than 10 characters |                                                                              |                                                           |                                                |                                                           |                                                |              | greaterThan10 |               |               | The CCN may not be greater than 10 characters.                 |
      #| Check Character Limit for EIN field                              |                                                                              |                                                           |                                                |                                                           |                                                |              |               | greaterThan10 |               | The EIN may not be greater than 10 characters.                 |
      #| Check Character Limit for NPI field                              |                                                                              |                                                           |                                                |                                                           |                                                |              |               |               | greaterThan10 | The NPI may not be greater than 10 characters.                 |
      | Check Allowed Characters for Postal code field               |                                                                              |                                                           |                                                |                                                           |                                                | abcdefghijkl |             |             |              | Please enter a valid Postal Code                               |
      | Check Allowed Characters for CCN field                       |                                                                              |                                                           |                                                |                                                           |                                                |              | @$%^&6!*&57 |             |              | The CCN field must be alphanumeric.                            |
      | Check Allowed Characters for EIN field                       |                                                                              |                                                           |                                                |                                                           |                                                |              |             | $@^&*%67$^& |              | The EIN field must be alphanumeric.                            |
      | Check Allowed Characters for NPI field                       |                                                                              |                                                           |                                                |                                                           |                                                |              |             |             | *@$%^93%#^&4 | The NPI field must be alphanumeric.                            |

  Scenario Outline: <Description>
    When I click on "HHA" organization tab on organization dashboard
    Then I click on "+" button on "HHA" organization page
    And I verify "Create HHA Organization" header text on create organization page
    And I select "<Has_MO>" radio button for managing organization
    Then I select "<Managing_Org>" managing organization name in "<Has_MO>" Has a Management Organization drop down
    Then I enter <HHA_Name> in "HHA Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Short_Name> in "Short Name" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I select region "<Region>" in "create HHA" organization page
    And I select market "<Market>" in "create HHA" organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "HHA - <CCN>" in "CCN" on create organization page
    And I provide unique "HHA - <EIN>" in "EIN" on create organization page
    And I provide unique "HHA - <NPI>" in "NPI" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create HHA - <Has_MO>" organization page

    Examples: 
      | Description                                                                                      | Has_MO | Managing_Org | HHA_Name             | Address1                                                | Short_Name                                    | Address2                                                | City                                          | State      | Postal_Code | Region  | Market  | CCN | EIN        | NPI        | Message                                |
      | Check Character Limit edge condition for HHA name field - Without MO                             | NO     |              | equalsTo75Characters | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | CCN | EIN        | NPI        | HHA Organization Successfully Created. |
      | Check Character Limit edge condition for Address1 field - Without MO                             | NO     |              | HHANAME              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsjklmnopqrs | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | CCN | EIN        | NPI        | HHA Organization Successfully Created. |
      | Check Character Limit edge condition for Short Name field - Without MO                           | NO     |              | HHANAME              | Address1                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | CCN | EIN        | NPI        | HHA Organization Successfully Created. |
      | Check Character Limit edge condition for Address2 field - Without MO                             | NO     |              | HHANAME              | Address1                                                | Short_Name                                    | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsjklmnopqrs | City                                          | California |       10000 | Midwest | Chicago | CCN | EIN        | NPI        | HHA Organization Successfully Created. |
      | Check Character Limit edge condition for City field - Without MO                                 | NO     |              | HHANAME              | Address1                                                | Short_Name                                    | Address2                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrs | California |       10000 | Midwest | Chicago | CCN | EIN        | NPI        | HHA Organization Successfully Created. |
      | Check Character Limit edge condition for Postal code field - Without MO                          | NO     |              | HHANAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California | 10000-0000  | Midwest | Chicago | CCN | EIN        | NPI        | HHA Organization Successfully Created. |
      | To check the Allowed characters for the available fields in Create HHA Organization - Without MO | NO     |              | AllowedCharatcters   | !@$%^&*()_+{}:<>?,./;'[]\\=Address1                     | !@$%^&*()_+{}:<>?,./;'[]\\=Short_Name         | !@$%^&*()_+{}:<>?,./;'[]\\=Address2                     | !@$%^&*()_+{}:<>?,./;'[]\\=City123            | California |       10000 | Midwest | Chicago | CCN | EIN        | NPI        | HHA Organization Successfully Created. |
      | Create HHA Organization with Mandatory fields - Without MO                                       | YES    |              | HHANAME              | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         | CCN |            |            | HHA Organization Successfully Created. |
      | Create HHA Organization with Mandatory fields + ShortName - Without MO                           | YES    |              | HHANAME              | Address1                                                | Short_Name                                    |                                                         | City                                          | California |       10000 |         |         | CCN |            |            | HHA Organization Successfully Created. |
      | Create HHA Organization with Mandatory fields + Address2 - Without MO                            | NO     |              | HHANAME              | Address1                                                |                                               | Address2                                                | City                                          | California |       10000 |         |         | CCN |            |            | HHA Organization Successfully Created. |
      | Create HHA Organization with Mandatory fields + ShortName + NPI - With MO                        | YES    | MONAME       | HHANAME              | Address1                                                | Short_Name                                    |                                                         | City                                          | California |       10000 |         |         | CCN |            | NPI        | HHA Organization Successfully Created. |
      | Create HHA Organization with Mandatory fields + ShortName + Address2 + EIN - With MO             | YES    | MONAME       | HHANAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 |         |         | CCN | EIN        |            | HHA Organization Successfully Created. |
      | Create HHA Organization with Mandatory fields + ShortName + Address2 + Region + Market - With MO | YES    | MONAME       | HHANAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | CCN |            |            | HHA Organization Successfully Created. |
      | Create HHA Organization with Mandatory fields + Address2 + Address2 - Without MO                 | NO     |              | HHANAME              | Address1                                                |                                               | Address2                                                | City                                          | California |       10000 |         |         | CCN |            |            | HHA Organization Successfully Created. |
      | Create HHA Organization with Mandatory fields - With MO                                          | YES    | MONAME       | HHANAME              | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         | CCN |            |            | HHA Organization Successfully Created. |
      | Create HHA Organization with all the available fields - Without MO                               | NO     |              | HHANAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | CCN | EIN        | NPI        | HHA Organization Successfully Created. |
      | Create HHA Organization with all the available fields - With MO                                  | YES    | MONAME       | HHANAME              | Address1                                                | Short_Name                                    | Address2                                                | City                                          | California |       10000 | Midwest | Chicago | CCN | EIN        | NPI        | HHA Organization Successfully Created. |
      | Create Duplicate HHA Organization with Mandatory fields - Without MO                             | NO     |              | DUPLICATE_hha        | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         | CCN |            |            | HHA Organization Successfully Created. |
      | Create Duplicate HHA Organization with Mandatory fields - With MO                                | YES    | MONAME       | DUPLICATE_hha        | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         | CCN |            |            | HHA Organization Successfully Created. |
      | Create HHA Organization with Mandatory fields same EIN and NPI                                   | YES    | MONAME       | HHANAME              | Address1                                                |                                               |                                                         | City                                          | California |       10000 |         |         |     | 1234567890 | 1234567890 | HHA Organization Successfully Created. |

  Scenario Outline: Identifiers - <Description>
    When I click on "HHA" organization tab on organization dashboard
    Then I click on "+" button on "HHA" organization page
    And I verify "Create HHA Organization" header text on create organization page
    And I provide unique "HHA - <CCN>" in "CCN" on create organization page
    And I provide unique "HHA - <EIN>" in "EIN" on create organization page
    And I provide unique "HHA - <NPI>" in "NPI" on create organization page
    And I switch the focus to "submit" button
    And I verify "<Message>" field validation message on create organization page
    And I verify "<Message1>" field validation message on create organization page

    Examples: 
      | Description                                              | CCN           | Message | Message1             |
      | Verify Validation of HHA Organization with duplicate CCN | DUPLICATE_CCN |         | CCN Id already taken |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type |
      | MO   |
