Feature: Verification of Landing Page for PTA User

  Scenario Outline: Create User through UA API call
    Given Build JSON for Create User "<FirstName>" and "<LastName>" and "<Email>" and "<Phone>" and "<NPI>" and "<RoleID>" and "<Applications>" and "<Locations>" and "<LearningPathways>"
    When Create User with this data for "<User>"
    Then Verify Actual vs expected results "<expStatusCode>" and "<responseMsg>"
    Given I am on mail login page
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

    Examples: 
      | User                            | FirstName                            | LastName                                 | Email                           | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                                                        | LearningPathways                       | Locations                                                                      | expStatusCode |
      | Super Admin                     | FirstName                            | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,physician_portal-Physician Connect,admin-Administration,lessons-Lessons | 5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1 | 441355--ALL_BPIDS--ALL_FACILITIES                                              |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 |     | Leader                          | 1-Leader                           | episode_connect-Episode Connect Classic,Reporting Classic-Reporting Classic,lessons-Lessons                                                         | 5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1 | 441355--3056-804--COVC0023, 441355--3056-805--055519, 441355--3056-806--055761 |           200 |

  Scenario: Verification of availability of fields on PTA User Landing page
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    And I should not see text "Unable to Load users" on Users page
    And I verify "SearchBox" on landing page
    And I verify "UsersTabOnLeftPane" on landing page
    #And I verify "EmailOnTopRight" on landing page for "Super Admin-Partner Technical Administrator"
    And I verify "User table" on landing page
    And I verify "Lock status Column" on landing page
    And I verify "User Name Column" on landing page
    And I verify "User Role Column" on landing page
    And I verify "User Email Column" on landing page
    And I verify "Date Created Column" on landing page
    And I verify "Release version" on landing page
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
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    And I verify "SearchBox" on landing page
    And I verify ghost text "Search" in search box
    Then I enter "<InvalidSearchParameter>" in search box for "<user>-<Role>"
    Then I should see cross icon to exit search
    Then I verify No Results Found is displayed
    Then I click on cross icon
    Then I enter "<SearchParameter>" in search box for "<user>-<Role>"
    Then I verify availability of "<SearchParameter>" for "<user>-<Role>"

    Examples: 
      | Description                    | user                            | Role   | Email                           | InvalidSearchParameter | SearchParameter                          |
      | Search a user using First Name | Partner Technical Administrator | Leader | qaautomation@remedypartners.com |                1768789 | Firstnamefirstnamefirstnamefirstname     |
      | Search a user using Last Name  | Partner Technical Administrator | Leader | qaautomation@remedypartners.com |                1768789 | Lastnamelastnamelastnamelastnamelastname |
      | Search a user using Email      | Partner Technical Administrator | Leader | qaautomation@remedypartners.com |                1768789 | FetchFromHM                              |

  Scenario Outline: Verify ability of PTA user to lock a user and cancel unlock
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    And I verify "SearchBox" on landing page
    Then I enter "<SearchParameter>" in search box for "<user>-<Role>"
    Then I verify availability of "<SearchParameter>" for "<user>-<Role>"
    Then I "lock" user
    Then I verify user is "Locked"
    And I click on the top user link
    Then I select "Log Out" option from the dropdown list
    And I should see Log in widget
    Then I enter newuser email for "<user>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I should see User is Blocked

    Examples: 
      | user                            | Role   | Email                           | SearchParameter |
      | Partner Technical Administrator | Leader | qaautomation@remedypartners.com | FetchFromHM     |

  Scenario Outline: Verify ability of PTA user to unlock a locked user
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    And I click on the "Users" tile
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
    Then I enter newuser email for "<user>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page

    Examples: 
      | user                            | Role   | Email                           | SearchParameter | Applications            |
      | Partner Technical Administrator | Leader | qaautomation@remedypartners.com | FetchFromHM     | Episode Connect Classic |
