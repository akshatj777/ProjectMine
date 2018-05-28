Feature: Edit Payor organization functionality tests

  Background: 
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard

  Scenario Outline: <Description>
    Then I click on "+" button on "Payor" organization page
    And I verify "Create Payor Organization" header text on create organization page
    Then I enter <Payor_Name> in "Payor Organization Name" on create organization page
    And I enter <Address1> in "Address 1" on create organization page
    And I enter <Contact_Person> in "Contact Person" on create organization page
    And I enter <Address2> in "Address 2" on create organization page
    And I enter <Contact_Email> in "Contact Email" on create organization page
    And I enter <City> in "City" on create organization page
    And I enter <Contact_Phone> in "Contact Phone" on create organization page
    And I select <State> in State on create organization page
    And I enter <Postal_Code> in "Postal Code" on create organization page
    And I provide unique "Payor - <EIN>" in "EIN" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create Payor" organization page

    Examples: 
      | Description                                         | Payor_Name | Contact_Person    | Contact_Email      | Contact_Phone | Address1 | Address2 | City | State    | Postal_Code | EIN | Message                                  |
      | Create Payor Organization with all available fields | PAYORNAME  | ContactPersonTest | Sample@yopmail.com |    5555599999 | Address1 | Address2 | City | New York |       10001 | EIN | Payor Organization Successfully Created. |

  Scenario Outline: <Description>
    Then I search with "<Payor_Name>" on organization in search box
    And I verify "<Payor_Name>" field in search list on organization page
    And I click "<Payor_Name>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Payor Organization" header text on edit organization page
    And I verify "*Payor Organization Name" field on edit organization page
    And I verify "Contact Person" field on edit organization page
    And I verify "Contact Email" field on edit organization page
    And I verify "Contact Phone" field on edit organization page
    And I verify "*Address 1" field on edit organization page
    And I verify "Address 2" field on edit organization page
    And I verify "*City" field on edit organization page
    And I verify "*State" dropdown field on edit organization page
    And I verify "*Postal Code" field on edit organization page
    And I verify "ein" identifier is not editable
    And I verify "Submit" button on edit organization page
    And I verify "Cancel" button on edit organization page

    Examples: 
      | Description                                                                    | Payor_Name |
      | Verification of availability of all the fields on Edit Payor Organization page | PAYORNAME  |

  Scenario Outline: <Description>
    Then I search with "<Payor_Name>" on organization in search box
    And I verify "<Payor_Name>" field in search list on organization page
    And I click "<Payor_Name>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Payor Organization" header text on edit organization page
    And I edit "Payor Organization Name" field to "<Edited_Payor_Name>" for organization
    And I edit "Address 1" field to "<Address1>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    And I verify "<ValidationMessage>" mandatory field validation message on edit organization page

    Examples: 
      | Description                                                                  | Payor_Name | Edited_Payor_Name | Address1 | City | State      | Postal_Code | ValidationMessage                 |
      | Check validation for blank Payor name field on Edit Payor Organization page  | PAYORNAME  |                   | Address1 | City | California |       10000 | Please enter an Organization Name |
      | Check validation for blank Address1 field on Edit Payor Organization page    | PAYORNAME  | PAYORNAME         |          | City | California |       10000 | Please enter an Address           |
      | Check validation for blank City field on Edit Payor Organization page        | PAYORNAME  | PAYORNAME         | Address1 |      | California |       10000 | Please enter a City               |
      | Check validation for blank State field on Edit Payor Organization page       | PAYORNAME  | PAYORNAME         | Address1 | City |            |       10000 | Please select a State             |
      | Check validation for blank Postal code field on Edit Payor Organization page | PAYORNAME  | PAYORNAME         | Address1 | City | California |             | Please enter a Postal Code        |

  Scenario Outline: <Description>
    Then I search with "<Payor_Name>" on organization in search box
    And I verify "<Payor_Name>" field in search list on organization page
    And I click "<Payor_Name>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Payor Organization" header text on edit organization page
    And I edit "Payor Organization Name" field to "<Edited_Payor_Name>" for organization
    And I edit "Address 1" field to "<Address1>" for organization
    And I edit "Contact Person" field to "<Contact_Person>" for organization
    And I edit "Address 2" field to "<Address2>" for organization
    And I edit "Contact Email" field to "<Contact_Email>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit "Contact Phone" field to "<Contact_Phone>" for organization
    And I edit "Postal Code" field to "<Postal_Code>" for organization
    And I switch the focus to "submit" button
    And I verify "<ValidationMessage>" field validation message on edit organization page

    Examples: 
      | Description                                                                     | Payor_Name | Edited_Payor_Name                                                            | Address1                                                  | Contact_Person                                 | Address2                                                  | Contact_Email                                                                                                                                                                                                                                                    | City                                           | Contact_Phone | Postal_Code | ValidationMessage                                              |
      | Check Character Limit for Payor Name field on Edit Payor Organization page      | PAYORNAME  | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwx |                                                           |                                                |                                                           |                                                                                                                                                                                                                                                                  |                                                |               |             | The Organization Name may not be greater than 75 characters.   |
      | Check Character Limit for Address1 field on Edit Payor Organization page        | PAYORNAME  |                                                                              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                |                                                           |                                                                                                                                                                                                                                                                  |                                                |               |             | The first address line may not be greater than 55 characters.  |
      | Check Character Limit for ContactPerson field on Edit Payor Organization page   | PAYORNAME  |                                                                              |                                                           | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |                                                           |                                                                                                                                                                                                                                                                  |                                                |               |             | The Contact Person may not be greater than 45 characters.      |
      | Check Character Limit for Address2 field on Edit Payor Organization page        | PAYORNAME  |                                                                              |                                                           |                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasdfghjk |                                                                                                                                                                                                                                                                  |                                                |               |             | The second address line may not be greater than 55 characters. |
      | Check Character Limit for ContactEmail field on Edit Payor Organization page    | PAYORNAME  |                                                                              |                                                           |                                                |                                                           | abcdefghabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrsContactEm@yopmail.com |                                                |               |             | The Contact Email may not be greater than 254 characters.      |
      | Check Character Limit for City field on Edit Payor Organization page            | PAYORNAME  |                                                                              |                                                           |                                                |                                                           |                                                                                                                                                                                                                                                                  | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst |               |             | The City may not be greater than 45 characters.                |
      | Check Character Limit for ContactPhone field on Edit Payor Organization page    | PAYORNAME  |                                                                              |                                                           |                                                |                                                           |                                                                                                                                                                                                                                                                  |                                                |   98745612301 |             | The Contact Phone format is invalid.                           |
      | Check Character Limit for Postal code field on Edit Payor Organization page     | PAYORNAME  |                                                                              |                                                           |                                                |                                                           |                                                                                                                                                                                                                                                                  |                                                |               | 10000-00000 | Please enter a valid Postal Code                               |
      | Check Allowed Characters for ContactEmail field on Edit Payor Organization page | PAYORNAME  |                                                                              |                                                           |                                                |                                                           | @$%%6%^7$^&%@yopmail.com                                                                                                                                                                                                                                         |                                                |               |             | The Contact Email format is invalid.                           |
      | Check Allowed Characters for ContactPhone field on Edit Payor Organization page | PAYORNAME  |                                                                              |                                                           |                                                |                                                           |                                                                                                                                                                                                                                                                  |                                                |   98745612301 |             | The Contact Phone format is invalid.                           |
      | Check Allowed Characters for PostalCode field on Edit Payor Organization page   | PAYORNAME  |                                                                              |                                                           |                                                |                                                           |                                                                                                                                                                                                                                                                  |                                                |               | abcdefgh    | Please enter a valid Postal Code                               |

  Scenario Outline: <Description>
    Then I search with "<Payor_Name>" on organization in search box
    And I verify "<Payor_Name>" field in search list on organization page
    And I click "<Payor_Name>" field in search list on organization page
    And I click on "Edit" button on particular organization
    And I verify "Edit Payor Organization" header text on edit organization page
    And I edit "Payor Organization Name" field to "<Edited_Payor_Name>" for organization
    And I edit "Address 1" field to "<Address1>" for organization
    And I edit "Contact Person" field to "<Contact_Person>" for organization
    And I edit "Address 2" field to "<Address2>" for organization
    And I edit "Contact Email" field to "<Contact_Email>" for organization
    And I edit "City" field to "<City>" for organization
    And I edit "Contact Phone" field to "<Contact_Phone>" for organization
    And I edit <State> field for organization
    And I edit "Postal Code" field to "<Postal_Code>" for organization
    Then I click on "Submit" button on "Edit" organization page
    Then I verify "<Message>" after submitting the "edit Payor" organization page

    Examples: 
      | Description                                                                                 | Payor_Name | Edited_Payor_Name    | Contact_Person                                | Contact_Email                                 | Contact_Phone | Address1                                                | Address2                                                | City                                          | State    | Postal_Code | Message                                  |
      | Check Character Limit edge condition for PAYOR NAME field on Edit Payor Organization        | PAYORNAME  | equalsTo75Characters | ContactPersonTest                             | Sample@yopmail.com                            |    5555599999 | Address1                                                | Address2                                                | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Check Character Limit edge condition for Address1 field on Edit Payor Organization          | PAYORNAME  | PAYORNAME            | ContactPersonTest                             | Sample@yopmail.com                            |    5555599999 | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasabcd | Address2                                                | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Check Character Limit edge condition for ContactPerson field on Edit Payor Organization     | PAYORNAME  | PAYORNAME            | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqab | Sample@yopmail.com                            |    5555599999 | Address1                                                | Address2                                                | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Check Character Limit edge condition for Address2 field on Edit Payor Organization          | PAYORNAME  | PAYORNAME            | ContactPersonTest                             | Sample@yopmail.com                            |    5555599999 | Address1                                                | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstabcasabcd | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Check Character Limit edge condition for ContactEmail field on Payor Payor Organization     | PAYORNAME  | PAYORNAME            | ContactPersonTest                             | abcdefghijklmnopqrstuvwxyzabcdefg@yopmail.com |    5555599999 | Address1                                                | Address2                                                | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Check Character Limit edge condition for City field on Edit Payor Organization              | PAYORNAME  | PAYORNAME            | ContactPersonTest                             | Sample@yopmail.com                            |    5555599999 | Address1                                                | Address2                                                | abcdefghijklmnopqrstuvwxyzabcdefgayopmailccom | New York |       10001 | Payor Organization Successfully Updated. |
      | Check Character Limit edge condition for ContactPhone field on Edit Payor Organization      | PAYORNAME  | PAYORNAME            | ContactPersonTest                             | Sample@yopmail.com                            |    9988956468 | Address1                                                | Address2                                                | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Check Character Limit edge condition for Postal code field on Edit Payor Organization       | PAYORNAME  | PAYORNAME            | ContactPersonTest                             | Sample@yopmail.com                            |    5555599999 | Address1                                                | Address2                                                | City                                          | New York | 10001-5623  | Payor Organization Successfully Updated. |
      #| To check the Allowed characters for the available fields                                    | PAYORNAME  | AllowedCharatctersForPayorNAMEField   | !@$% ^&*()+}{;:<>?=-\\/.,Contact_person001    | !$%^&*'.-=+Contact_Email001@gmail.com         | 1(235)526 5236 | !@$test% ^&2356*()_+}{;:<>?=-\\/.,Address1              | !@$test% ^&2356*()_+}{;:<>?=-\\/.,Address2              | !@$test% ^&2356*()_+}{;:<>?=-\\/.,City        | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with Mandatory fields                                               | PAYORNAME  | PAYORNAME            |                                               |                                               |               | Address1                                                |                                                         | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with Mandatory fields + Address2                                    | PAYORNAME  | PAYORNAME            |                                               |                                               |               | Address1                                                | Address2                                                | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with Mandatory fields + ContactPerson                               | PAYORNAME  | PAYORNAME            | ContactPersonTest                             |                                               |               | Address1                                                |                                                         | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with Mandatory fields + ContactEmail                                | PAYORNAME  | PAYORNAME            |                                               | Sample@yopmail.com                            |               | Address1                                                |                                                         | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with Mandatory fields + ContactPhone                                | PAYORNAME  | PAYORNAME            |                                               |                                               |    5555599999 | Address1                                                |                                                         | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with Mandatory fields + Address2 +  ContactEmail                    | PAYORNAME  | PAYORNAME            |                                               | Sample@yopmail.com                            |               | Address1                                                | Address2                                                | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with Mandatory fields  + Address2 + ContactPhone                    | PAYORNAME  | PAYORNAME            |                                               |                                               |    5555599999 | Address1                                                | Address2                                                | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with Mandatory fields + Address2 + ContactPerson + ContactEmail     | PAYORNAME  | PAYORNAME            | ContactPersonTest                             | Sample@yopmail.com                            |               | Address1                                                | Address2                                                | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with Mandatory fields + ContactEmail + ContactPerson + ContactPhone | PAYORNAME  | PAYORNAME            | ContactPersonTest                             | Sample@yopmail.com                            |    5555599999 | Address1                                                |                                                         | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with Mandatory fields + ContactEmail + ContactPerson                | PAYORNAME  | PAYORNAME            | ContactPersonTest                             | Sample@yopmail.com                            |               | Address1                                                |                                                         | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with Mandatory fields + ContactEmail + ContactPhone                 | PAYORNAME  | PAYORNAME            |                                               | Sample@yopmail.com                            |    5555599999 | Address1                                                |                                                         | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with Mandatory fields + ContactPhone + ContactPerson + Address2     | PAYORNAME  | PAYORNAME            | ContactPersonTest                             |                                               |    5555599999 | Address1                                                | Address2                                                | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
      | Edit Payor Organization with all available fields                                           | PAYORNAME  | PAYORNAME            | ContactPersonTest                             | Sample@yopmail.com                            |    5555599999 | Address1                                                | Address2                                                | City                                          | New York |       10001 | Payor Organization Successfully Updated. |
