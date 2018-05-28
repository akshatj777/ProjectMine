Feature: Create Programs organization under Payor Organization functionality tests

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

  Scenario Outline: Verification of details on Programs under Payor Organization
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify "ID" header label under "Payor" view profile page
    And I verify "Program Name" header label under "Payor" view profile page
    And I verify the "Create New Program" button on view profile of "payor" Organization
    Then I click on "Create New Program" button on "create" organization page
    And I verify "Create Program" header text on create organization page
    And I verify "*Program Name" field on create organization page
    And I verify "Attribute to the physician who has the highest claim allowed amount during the lookForward window" attribution rules on "create" program page
    And I verify "Attribute to the physician who admitted the patient" attribution rules on "create" program page
    And I verify "Attribute to the physician who has the highest claim allowed amount during the lookBack window" attribution rules on "create" program page
    And I verify "Attribute to the triggering provider id on the triggering claim" attribution rules on "create" program page
    And I verify "Attribute to the physician who has the most claims during the lookForward window" attribution rules on "create" program page
    And I verify "Attribute to the attending physician on the triggering claim" attribution rules on "create" program page
    And I verify "Attribute to the physician who discharged the patient from the trigger" attribution rules on "create" program page
    And I verify "Attribute to the physician who has the most claims during the trigger window" attribution rules on "create" program page
    And I verify "Attribute to the physician who has the highest claim allowed amount during the trigger window" attribution rules on "create" program page
    And I verify "Attribute to the physician who bills the most E&M codes during the trigger window" attribution rules on "create" program page
    And I verify "Attribute to the physician who has the most claims during the lookBack window" attribution rules on "create" program page
    And I verify "Attribute to the operating physician on the triggering claim" attribution rules on "create" program page
    And I verify "Submit" button on create organization page
    And I verify "Cancel" button on create organization page

    Examples: 
      | Description                                                  | Payor_Name |
      | Verification of details on Programs under Payor Organization | PAYORNAME  |

  Scenario Outline: Create Programs under Payor Organization
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify the "Create New Program" button on view profile of "payor" Organization
    Then I click on "Create New Program" button on "create" organization page
    And I verify "Create Program" header text on create organization page
    Then I enter <Program_Name> in "Program Name" on create organization page
    Then I click on "Submit" button on "create" organization page
    And I verify "<ValidationMsg>" mandatory field validation message on create organization page

    Examples: 
      | Description                                                                   | Payor_Name | Program_Name                                   | ValidationMsg                                          |
      | Check validation message if Program Name is left blank                        | PAYORNAME  |                                                | Please enter a Program Name                            |
      | Check validation message for exceeding Character limit for Program Name field | PAYORNAME  | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrst | The programName may not be greater than 45 characters. |

  Scenario Outline: <Description>
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify the "Create New Program" button on view profile of "payor" Organization
    Then I click on "Create New Program" button on "create" organization page
    And I verify "Create Program" header text on create organization page
    Then I enter <Program_Name> in "Program Name" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create Programs" on Payor organization page

    Examples: 
      | Description                                                 | Payor_Name | Program_Name         | Message                      |
      | Check Character Limit edge condition for Program Name field | PAYORNAME  | equalsTo45Characters | Program Successfully Created |
      | To check the Allowed characters for the available field     | PAYORNAME  | AllowedCharatcters   | Program Successfully Created |
      | Create Program under Payor Organization                    | PAYORNAME  | PROGRAMNAME          | Program Successfully Created |

  Scenario Outline: <Description>
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify the "Create New Program" button on view profile of "payor" Organization
    Then I click on "Create New Program" button on "create" organization page
    And I verify "Create Program" header text on create organization page
    Then I enter <Program_Name> in "Program Name" on create organization page
    Then I click on "Submit" button on "create" organization page
    Then I verify duplicate "<Message>" after submitting the "create Programs" organization page

    Examples: 
      | Description                                 | Payor_Name | Program_Name          | Message                                                                                          |
      | Create Program using duplicate program name | PAYORNAME  | DUPLICATE_PROGRAMNAME | There is a conflict error because an entity with similar identifying attributes already existed. |

  Scenario Outline: <Description>
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify the "Create New Program" button on view profile of "payor" Organization
    Then I click on "Create New Program" button on "create" organization page
    And I verify "Create Program" header text on create organization page
    Then I enter <Program_Name> in "Program Name" on create organization page
    And I drag and drop the attribution rules in "Create" Program page
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create Programs" on Payor organization page

    Examples: 
      | Description                                          | Payor_Name | Program_Name | Message                      |
      | Create Program using Drag and Drop attribution rules | PAYORNAME  | PROGRAMNAME  | Program Successfully Created |

  Scenario Outline: Edit Programs under Payor Organization
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    Then I search with "<Program_Name>" on organization in search box
    And I verify "<Program_Name>" field in search list on organization page
    And I click "<Program_Name>" field in search list on organization page
    And I verify "Edit Program" header text on edit organization page
    And I edit "Program Name" field to "<Edited_Program_Name>" for organization
    Then I click on "Submit" button on "edit" organization page
    Then I verify "<Message>" after submitting the "edit Programs" on Payor organization page

    Examples: 
      | Description                            | Payor_Name | Program_Name | Edited_Program_Name | Message                      |
      | Edit Programs under Payor Organization | PAYORNAME  | PROGRAMNAME  | PROGRAMNAME         | Program Successfully Updated |

  Scenario Outline: <Description>
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify the "Create New Program" button on view profile of "payor" Organization
    Then I click on "Create New Program" button on "create" organization page
    And I verify "Create Program" header text on create organization page
    Then I enter <Program_Name> in "Program Name" on create organization page
    And I click on checkbox for "Attribute to the physician who admitted the patient" Attribution rule
    And I click on checkbox for "Attribute to the triggering provider id on the triggering claim" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the highest claim allowed amount during the lookForward window" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the highest claim allowed amount during the lookBack window" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the most claims during the lookForward window" Attribution rule
    And I click on checkbox for "Attribute to the attending physician on the triggering claim" Attribution rule
    And I click on checkbox for "Attribute to the physician who discharged the patient from the trigger" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the most claims during the trigger window" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the highest claim allowed amount during the trigger window" Attribution rule
    And I click on checkbox for "Attribute to the physician who bills the most E&M codes during the trigger window" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the most claims during the lookBack window" Attribution rule
    And I click on checkbox for "Attribute to the operating physician on the triggering claim" Attribution rule
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create Programs" on Payor organization page

    Examples: 
      | Description                              | Payor_Name | Program_Name | Message                      |
      | Create Programs under Payor Organization | PAYORNAME  | PROGRAMNAME  | Program Successfully Created |
