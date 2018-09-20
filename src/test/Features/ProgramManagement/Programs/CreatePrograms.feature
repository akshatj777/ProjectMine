Feature: Create Programs organization under Payor Organization functionality tests

  Scenario Outline: Create Payor using API calls
    Given build Json for Payor "<name>" and "<participantId>" and "<tinEin>" and "<contactName>" and "<contactEmail>" and "<contactPhone>" and "<address1>" and "<address2>" and "<city>" and "<state>" and "<zip>"
    When create payor with this data
    Then verification of Actual vs expected results <expStatusCode> and "<responseMsg>"
    When Get by id <id> and <type>

    Examples: 
      | desc         | participantId | name      | tinEin | contactName       | contactEmail       | contactPhone | address1 | address2 | city | state | zip   | expStatusCode | responseMsg | id | type  |
      | Create Payor |               | PAYORNAME | EIN    | ContactPersonTest | Sample@yopmail.com | 212-567-8970 | Address1 | Address2 | City | NY    | 10001 |           201 |             |  0 | payor |

  Scenario Outline: Verification of details on Programs under Payor Organization
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
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
    And I verify the sub headline of "Attribution Rules"
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
    And I verify the sub headline of "Validate To"
    And I verify "Bundle inclusions" validation ranks on "create" program page
    And I verify "Bundle exclusion" validation ranks on "create" program page
    And I verify "Earliest contract start date" validation ranks on "create" program page
    And I verify "Earliest trigger from date" validation ranks on "create" program page
    And I verify the "Multiple Bundle Episode" checkbox
    And I verify "Submit" button on create organization page
    And I verify "Cancel" button on create organization page

    Examples: 
      | Description                                                  | Payor_Name |
      | Verification of details on Programs under Payor Organization | PAYORNAME  |

  Scenario Outline: Create Programs under Payor Organization
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
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

  Scenario Outline: Create Programs under Payor Organization
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify the "Create New Program" button on view profile of "payor" Organization
    Then I click on "Create New Program" button on "create" organization page
    And I verify "Create Program" header text on create organization page
    Then I enter <Program_Name> in "Program Name" on create organization page
    And I verify the sub headline of "Attribution Rules"
    And I click on checkbox for "Attribute to the physician group which billed the part B claim" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the highest claim allowed amount during the lookBack window" Attribution rule
    And I click on checkbox for "Attribute to the triggering provider id on the triggering claim" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the highest claim allowed amount during the trigger window" Attribution rule
    And I click on checkbox for "Attribute to the provider with the earliest contract start date" Attribution rule
    And I click on checkbox for "Attribute to the physician who discharged the patient from the trigger" Attribution rule
    And I click on checkbox for "Attribute to the operating physician on the triggering claim" Attribution rule
    And I click on checkbox for "Attribute to the physician who bills the most E&M codes during the trigger window" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the most claims during the lookBack window" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the most claims during the lookForward window" Attribution rule
    And I click on checkbox for "Attribute to the physician who admitted the patient" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the highest claim allowed amount during the lookForward window" Attribution rule
    And I uncheck for "Physician Group" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the most claims during the trigger window" Attribution rule
    And I click on checkbox for "Attribute to the attending physician on the triggering claim" Attribution rule
    And I click on checkbox for "Attribute to the provider with the earliest Bundle start date" Attribution rule
    And I verify the sub headline of "Validate To"
    And I click on checkbox for "Bundle inclusions" Attribution rule
    And I click on checkbox for "Bundle exclusion" Attribution rule
    And I click on checkbox for "Earliest contract start date" Attribution rule
    And I click on checkbox for "Earliest trigger from date" Attribution rule
    Then I click on "Submit" button on "create" organization page
    Then I verify duplicate "<Message>" after submitting the "create Programs" organization page

    Examples: 
      | Description                                       | Payor_Name | Program_Name | Message                                                                                                                         |
      | validation message if did not rank atleast 1 rule | PAYORNAME  | PROGRAMNAME  | Validation errors: Program requires at lease one Attribute Rule Ranking - Program requires at lease one Validation Rule Ranking |

  Scenario Outline: Create Programs under Payor Organization
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify the "Create New Program" button on view profile of "payor" Organization
    Then I click on "Create New Program" button on "create" organization page
    And I verify "Create Program" header text on create organization page
    Then I enter <Program_Name> in "Program Name" on create organization page
    And I verify the sub headline of "Attribution Rules"
    And I click on checkbox for "Attribute to the physician group which billed the part B claim" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the highest claim allowed amount during the lookBack window" Attribution rule
    And I click on checkbox for "Attribute to the triggering provider id on the triggering claim" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the highest claim allowed amount during the trigger window" Attribution rule
    And I click on checkbox for "Attribute to the provider with the earliest contract start date" Attribution rule
    And I click on checkbox for "Attribute to the physician who discharged the patient from the trigger" Attribution rule
    And I click on checkbox for "Attribute to the operating physician on the triggering claim" Attribution rule
    And I click on checkbox for "Attribute to the physician who bills the most E&M codes during the trigger window" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the most claims during the lookBack window" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the most claims during the lookForward window" Attribution rule
    And I click on checkbox for "Attribute to the physician who admitted the patient" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the highest claim allowed amount during the lookForward window" Attribution rule
    And I uncheck for "Physician Group" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the most claims during the trigger window" Attribution rule
    And I click on checkbox for "Attribute to the attending physician on the triggering claim" Attribution rule
    And I click on checkbox for "Attribute to the provider with the earliest Bundle start date" Attribution rule
    And I verify the sub headline of "Validate To"
    Then I click on "Submit" button on "create" organization page
    Then I verify duplicate "<Message>" after submitting the "create Programs" organization page

    Examples: 
      | Description                              | Payor_Name | Program_Name | Message                                                                 |
      | Create Program without Attribution rules | PAYORNAME  | PROGRAMNAME  | Validation errors: Program requires at lease one Attribute Rule Ranking |

  Scenario Outline: Create Programs under Payor Organization
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify the "Create New Program" button on view profile of "payor" Organization
    Then I click on "Create New Program" button on "create" organization page
    And I verify "Create Program" header text on create organization page
    Then I enter <Program_Name> in "Program Name" on create organization page
    And I verify the sub headline of "Validate To"
    And I click on checkbox for "Bundle inclusions" Attribution rule
    And I click on checkbox for "Bundle exclusion" Attribution rule
    And I click on checkbox for "Earliest contract start date" Attribution rule
    And I click on checkbox for "Earliest trigger from date" Attribution rule
    Then I click on "Submit" button on "create" organization page
    Then I verify duplicate "<Message>" after submitting the "create Programs" organization page

    Examples: 
      | Description                             | Payor_Name | Program_Name | Message                                                                  |
      | Create Program without validation ranks | PAYORNAME  | PROGRAMNAME  | Validation errors: Program requires at lease one Validation Rule Ranking |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
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
      | Create Program under Payor Organization                     | PAYORNAME  | PROGRAMNAME          | Program Successfully Created |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
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
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
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

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Program Management
    And I click on the "Program Management" tile
    When I click on Organization link on Program Management page
    When I click on "Payor" organization tab on organization dashboard
    When I search with "<Payor_Name>" on organization in search box
    And I click "<Payor_Name>" field in search list on organization page
    And I verify "<Payor_Name>" name on the header of view profile
    And I verify "Programs" as default tab selected on view profile of "Payor" Organization
    And I verify the "Create New Program" button on view profile of "payor" Organization
    Then I click on "Create New Program" button on "create" organization page
    And I verify "Create Program" header text on create organization page
    Then I enter <Program_Name> in "Program Name" on create organization page
    And I verify the sub headline of "Attribution Rules"
    And I click on checkbox for "Attribute to the physician who admitted the patient" Attribution rule
    And I click on checkbox for "Attribute to the triggering provider id on the triggering claim" Attribution rule
    And I click on checkbox for "Attribute to the physician who has the highest claim allowed amount during the lookForward window" Attribution rule
    And I verify the sub headline of "Validate To"
    And I click on checkbox for "Bundle inclusions" Attribution rule
    And I click on checkbox for "Bundle exclusion" Attribution rule
    And I click on checkbox for "Multiple Bundle Episode"
    Then I click on "Submit" button on "create" organization page
    Then I verify "<Message>" after submitting the "create Programs" on Payor organization page

    Examples: 
      | Description                              | Payor_Name | Program_Name | Message                      |
      | Create Programs under Payor Organization | PAYORNAME  | PROGRAMNAME  | Program Successfully Created |

  Scenario Outline: Delete references of the name list
    When delete references of the name list type "<type>"

    Examples: 
      | type  |
      | Payor |
