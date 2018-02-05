Feature: Create Managing organization functionality tests

  Background: 
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    And I switch to new window
    Then I verify "Welcome to Program Management" header on the page

  Scenario: Verification of availability of all the fields on Create Managing Organization page
    When I click on Organization link on Program Management page
    Then I verify "+" button under "Managing" organization page
    And I verify "Participant ID" header label under "Managing" organization
    And I verify "Managing Organization Name" header label under "Managing" organization
    And I verify "City" header label under "Managing" organization
    And I verify "State" header label under "Managing" organization
    And I verify "Postal Code" header label under "Managing" organization
    Then I click on "+" button on "Managing" organization page
    And I verify "Create Managing Organization" header text on create organization page
    And I verify "*Managing Organization Name" field on create organization page
    And I verify "Contact Person" field on create organization page
    And I verify "Contact Email" field on create organization page
    And I verify "Contact Phone" field on create organization page
    And I verify "*Address 1" field on create organization page
    And I verify "Address 2" field on create organization page
    And I verify "*City" field on create organization page
    And I verify "*State" dropdown field on create organization page
    And I verify "*Postal Code" field on create organization page
    And I verify "Submit" button on create organization page
    And I verify "Cancel" button on create organization page

  Scenario Outline: Create MO all Mandatory fields missing 
    When I click on Organization link on Program Management page
    Then I click on "+" button on "Managing" organization page
    And I verify "Create Managing Organization" header text on create organization page
    Then I enter <MO_Name> in "Managing Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    Then I click on "Submit" button on "create" organization page
    And I verify "Please enter an Organization Name" mandatory field validation message on create organization page
    And I verify "Please enter an Address" mandatory field validation message on create organization page
    And I verify "Please enter a City" mandatory field validation message on create organization page
    And I verify "Please select a State" mandatory field validation message on create organization page
    And I verify "Please enter a Zip Code" mandatory field validation message on create organization page

  Scenario Outline: <Description>
    When I click on Organization link on Program Management page
    Then I verify "+" button under "Managing" organization page
    Then I click on "+" button on "Managing" organization page
    And I verify "Create Managing Organization" header text on create organization page
    Then I enter <MO_Name> in "Managing Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <City> in "City" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                          | MO_Name | Address1 | City | State      | Postal_Code | ValidationMsg                     |
      | Check validation for blank MO name                   |         | Address1 | City | California |       10000 | Please enter an Organization Name |
      | Check validation for blank Address1                  | MONAME  |          | City | California |       10000 | Please enter an Address           |
      | Check validation for blank City                      | MONAME  | Address1 |      | California |       10000 | Please enter a City               |
      | Check validation for blank State                     | MONAME  | Address1 | City |            |       10000 | Please select a State             |
      | Check validation for blank Postal code               | MONAME  | Address1 | City | California |             | Please enter a Zip Code           |
      | Submit with errors Managing Organization not created | MONAME  | Address1 | City | California | abcdefgh    | Please enter a valid Zip Code     |

  Scenario Outline: <Description>
    When I click on Organization link on Program Management page
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
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I switch the focus to "submit" button
    And I verify "<ValidationMessage>" field validation message on create organization page

    Examples: 
      | Description                                     | MO_Name                                                                      | Address1                                                  | Contact_Person                                 | Address2                                                  | Contact_Email                                  | City                                           | Contact_Phone   | Postal_Code | ValidationMessage                                              |
      | Check Character Limit for MoName field          | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |                                                           |                                                |                                                           |                                                |                                                |                 |             | The Organization Name may not be greater than 75 characters.   |
      | Check Character Limit for Address1 field        |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                                                           |                                                |                                                |                 |             | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for ContactPerson field   |                                                                              |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                                                           |                                                |                                                |                 |             | The Contact Person may not be greater than 45 characters.      |
      | Check Character Limit for Address2 field        |                                                                              |                                                           |                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                                                |                 |             | The second address line may not be greater than 55 characters. |
      | Check Character Limit for ContactEmail field    |                                                                              |                                                           |                                                |                                                           | abcdefghijklmnopqrstuvwxyzabcdefgh@yopmail.com |                                                |                 |             | The Contact Email may not be greater than 45 characters.       |
      | Check Character Limit for City field            |                                                                              |                                                           |                                                |                                                           |                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                 |             | The City may not be greater than 45 characters.                |
      | Check Character Limit for ContactPhone field    |                                                                              |                                                           |                                                |                                                           |                                                |                                                | 987456123012356 |             | The Contact Phone format is invalid.                           |
      | Check Character Limit for Postal code field     |                                                                              |                                                           |                                                |                                                           |                                                |                                                |                 | 10000-00000 | Please enter a valid Zip Code                                  |
      | Check Allowed Characters for ContactEmail field | !@$% ^&*()_+}{:< >?=-\\/.5426MOName                                          | !@$% ^&*()_+}{:< >?=-\\/.5426Address1                     | !@$% ^&*()+}{;:<>?=-\\/.,Contact_person001     | !@$% ^&*()_+}{:< >?=-\\/.5426Address2                     | !@$%^&*-=,./\\:;'()[]_Testing120@gmail.com     | !@$% ^&*()_+}{:< >?=-\\/.5426city              | 234-235-5678    |       10235 | The Contact Email format is invalid.                           |
      | Check Allowed Characters for ContactPhone field | !@$% ^&*()_+}{:< >?=-\\/.5426MOName                                          | !@$% ^&*()_+}{:< >?=-\\/.5426Address1                     | !@$% ^&*()+}{;:<>?=-\\/.,Contact_person001     | !@$% ^&*()_+}{:< >?=-\\/.5426Address2                     | !$%^&==-Testing120@gmail.com                   | !@$% ^&*()_+}{:< >?=-\\/.5426city              | 123-234-5678    |       10235 | The Contact Phone format is invalid.                           |
      | Check Allowed Characters for ContactPhone field | !@$% ^&*()_+}{:< >?=-\\/.5426MOName                                          | !@$% ^&*()_+}{:< >?=-\\/.5426Address1                     | !@$% ^&*()+}{;:<>?=-\\/.,Contact_person001     | !@$% ^&*()_+}{:< >?=-\\/.5426Address2                     | !$%^&==-Testing120@gmail.com                   | !@$% ^&*()_+}{:< >?=-\\/.5426city              | @$% (456)jkl256 |       10235 | The Contact Phone format is invalid.                           |
      | Check Allowed Characters for PostalCode field   |                                                                              |                                                           |                                                |                                                           |                                                |                                                |                 | abcdefgh    | Please enter a valid Zip Code                                  |

  Scenario Outline: <Description>
    When I click on Organization link on Program Management page
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
      | Description                                                                                    | MO_Name              | Contact_Person                                | Contact_Email                                 | Contact_Phone  | Address1                                                | Address2                                                | City                                          | State    | Postal_Code | Message                                                                                          |
      | Check Character Limit edge condition for MOName field                                          | equalsTo75Characters | ContactPersonTest                             | Sample@yopmail.com                            | 234-235-5678   | Address1                                                | Address2                                                | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Check Character Limit edge condition for Address1 field                                        | MONAME               | ContactPersonTest                             | Sample@yopmail.com                            |     5555599999 | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasabcd | Address2                                                | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Check Character Limit edge condition for ContactPerson field                                   | MONAME               | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqab | Sample@yopmail.com                            |     5555599999 | Address1                                                | Address2                                                | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Check Character Limit edge condition for Address2 field                                        | MONAME               | ContactPersonTest                             | Sample@yopmail.com                            |     5555599999 | Address1                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasabcd | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Check Character Limit edge condition for ContactEmail field                                    | MONAME               | ContactPersonTest                             | abcdefghijklmnopqrstuvwxyzabcdefg@yopmail.com |     5555599999 | Address1                                                | Address2                                                | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Check Character Limit edge condition for City field                                            | MONAME               | ContactPersonTest                             | Sample@yopmail.com                            | 234-235-5678   | Address1                                                | Address2                                                | abcdefghijklmnopqrstuvwxyzabcdefgayopmailccom | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Check Character Limit edge condition for ContactPhone field                                    | MONAME               | ContactPersonTest                             | Sample@yopmail.com                            | 1(235)526 5236 | Address1                                                | Address2                                                | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Check Character Limit edge condition for Postal code field                                     | MONAME               | ContactPersonTest                             | Sample@yopmail.com                            |     5555599999 | Address1                                                | Address2                                                | City                                          | New York | 10001-5623  | Managing Organization Successfully Created.                                                      |
      | To check the Allowed characters for the available fields                                       | AllowedCharatcters   | !@$% ^&*()+}{;:<>?=-\\/.,Contact_person001    | !$%^&*'.-=+Contact_Email001@gmail.com         | 1(235)526 5236 | !@$test% ^&2356*()_+}{;:<>?=-\\/.,Address1              | !@$test% ^&2356*()_+}{;:<>?=-\\/.,Address2              | !@$test% ^&2356*()_+}{;:<>?=-\\/.,City        | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields                                             | MONAME               |                                               |                                               |                | Address1                                                |                                                         | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + Address2                                  | MONAME               |                                               |                                               |                | Address1                                                | Address2                                                | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + ContactName                               | MONAME               | ContactPersonTest                             |                                               |                | Address1                                                |                                                         | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + ContactEmail                              | MONAME               |                                               | Sample@yopmail.com                            |                | Address1                                                |                                                         | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + ContactPhone                              | MONAME               |                                               |                                               |     5555599999 | Address1                                                |                                                         | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + Address2 + ContactName                    | MONAME               | ContactPersonTest                             |                                               |                | Address1                                                | Address2                                                | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + Address2 +  ContactEmail                  | MONAME               |                                               | Sample@yopmail.com                            |                | Address1                                                | Address2                                                | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + Address2 + ContactPhone                   | MONAME               |                                               |                                               |     5555599999 | Address1                                                | Address2                                                | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + Address2 + ContactName + ContactEmail     | MONAME               | ContactPersonTest                             | Sample@yopmail.com                            |                | Address1                                                | Address2                                                | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + ContactEmail + ContactName + ContactPhone | MONAME               | ContactPersonTest                             | Sample@yopmail.com                            |                | Address1                                                |                                                         | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + ContactEmail + ContactName                | MONAME               | ContactPersonTest                             | Sample@yopmail.com                            |     5555599999 | Address1                                                |                                                         | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + ContactEmail + ContactPhone               | MONAME               |                                               | Sample@yopmail.com                            |                | Address1                                                |                                                         | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + ContactPhone + ContactName                | MONAME               | ContactPersonTest                             |                                               |     5555599999 | Address1                                                |                                                         | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with Mandatory fields + ContactPhone + ContactName + Address2     | MONAME               | ContactPersonTest                             |                                               |     5555599999 | Address1                                                |                                                         | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create Managing Organization with all available fields                                         | MONAME               | ContactPersonTest                             | Sample@yopmail.com                            |     5555599999 | Address1                                                | Address2                                                | City                                          | New York |       10001 | Managing Organization Successfully Created.                                                      |
      | Create using duplicate Managing Organization Name                                              | DUPLICATE_MO         | ContactPersonTest                             | Sample@yopmail.com                            |     5555599999 | Address1                                                | Address2                                                | City                                          | New York |       10001 | There is a conflict error because an entity with similar identifying attributes already existed. |
