Feature: Super Admin Landing page verification

  Scenario: Verification of availability of fields on Super User Landing page
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    And I should not see text "Unable to Load users" on Users page
    And I verify "SearchBox" on landing page
    And I verify "UsersTabOnLeftPane" on landing page
    And I verify "EmailOnTopRight" on landing page
    And I verify "User table" on landing page
    And I verify "Lock status Column" on landing page
    And I verify "User Name Column" on landing page
    And I verify "User Role Column" on landing page
    And I verify "User Email Column" on landing page
    And I verify "Date Created Column" on landing page
    And I verify "Next Page Icon" on landing page
    And I verify "Last Page Icon" on landing page
    And I click on Last Page Icon on landing page
    And I verify "Previous Page Icon" on landing page
    And I verify "First Page Icon" on landing page
    And I click on First Page Icon on landing page
    And I verify "Users Count" on landing page
    And I should see "Add User" Button in landing page
    Then I click on "Add User" Button
    Then I am navigated to user creation page
    Then I should see "Add New User" on the user creation page
    Then I click on close icon from user creation page
    Then I verify "1" text on landing page
    And I click on "icon chevron right" on landing page
    Then I verify "2" text on landing page
    Then I click on "Add User" Button
    Then I am navigated to user creation page
    Then I should see "Add New User" on the user creation page
    Then I click on close icon from user creation page
    Then I verify "2" text on landing page
    And I click on "icon chevron left" on landing page
    Then I verify "1" text on landing page
    Then I select any user
    And I verify that I am navigated to view user page
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    And I verify "SearchBox" on landing page
    Then I enter "<InvalidSearchParameter>" in search box for "<user>-<Role>"
    Then I should see cross icon to exit search
    Then I verify No Results Found is displayed
    Then I click on cross icon
    Then I enter "<SearchParameter>" in search box for "<user>-<Role>"
    Then I verify availability of "<SearchParameter>" for "<user>-<Role>"

    Examples: 
      | Description                    | user        | Role      | Email             | InvalidSearchParameter | SearchParameter                          |
      | Search a user using First Name | Super Admin | Executive | test.automatemail |                1768789 | Firstname                                |
      | Search a user using Last Name  | Super Admin | Executive | test.automatemail |                1768789 | Lastnamelastnamelastnamelastnamelastname |
      | Search a user using Email      | Super Admin | Executive | test.automatemail |                1768789 | FetchFromHM                              |

  Scenario Outline: Verify ability of Super Admin user to lock a user
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Adming
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    And I verify "SearchBox" on landing page
    Then I enter "<SearchParameter>" in search box for "<user>-<Role>"
    Then I verify availability of "<SearchParameter>" for "<user>-<Role>"
    Then I "lock" user
    Then I verify user is "Locked"
    Then I "unlock" user
    Then I should see an alert with "Are you sure you want to unlock"
    Then I click on "Cancel" button from the unlock alert
    Then I verify user is "Locked"
    And I click on the top user link
    Then I select "Log Out" option from the dropdown list
    And I should see Log in widget
    Then I enter newuser email for "<user>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I should see User is Blocked

    Examples: 
      | user        | Role      | Email             | SearchParameter |
      | Super Admin | Executive | test.automatemail | FetchFromHM     |

  Scenario Outline: Verify ability of Super Admin user to unlock a locked user
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Adming
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I enter "<SearchParameter>" in search box for "<user>-<Role>"
    Then I verify availability of "<SearchParameter>" for "<user>-<Role>"
    Then I "unlock" user
    Then I should see an alert with "Are you sure you want to unlock"
    Then I click on "Unlock" button from the unlock alert
    Then I verify user is "Unlocked"
    And I click on the top user link
    Then I select "Log Out" option from the dropdown list
    And I should see Log in widget
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<user>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page

    Examples: 
      | user        | Role      | Email             | SearchParameter | Applications               |
      | Super Admin | Executive | test.automatemail | FetchFromHM     | Episodes, Reports, Lessons |

  Scenario: User should not get error message when he goes back to User Admin page from top navigation Menu
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Episodes 2.0
    And I click on the "Reports" tile
    Then I verify page tile for reports page
    And I click on "User Admin" tile from menu
    Then I should see header text "Users"
    Then I click on "Reports" from Management dropdown
    And I switch to new window
    Then I verify page tile for reports page
    And I click on "User Admin" tile from menu
    Then I should see header text "Users"

  Scenario Outline: Verifying that User is redirected to User admin page although doesn't have access to UA
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text User Adming
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<user>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page

    Examples: 
      | user        | Role      | Applications               |
      | Super Admin | Executive | Episodes, Reports, Lessons |
