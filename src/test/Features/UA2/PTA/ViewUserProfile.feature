Feature: View User - Super Admin User

  Scenario Outline: Create PTA through API call and then verify the user
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
      | User                            | FirstName                                 | LastName                                 | Email                           | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                     | LearningPathways                                    | Locations                                                                                                                                                                                                                                                                                                              | expStatusCode |
      | Super Admin                     | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episodes,reports-Reports,physician_portal-Physician Connect,admin-Administration,lessons-Lessons | 5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1              | 441355--ALL_BPIDS--ALL_FACILITIES                                                                                                                                                                                                                                                                                      |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 |     | Executive                       | 1-Executive                        | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                         | 5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1              | 441355--3056-804--COVC0023, 441355--3056-805--055519, 441355--3056-806--055761                                                                                                                                                                                                                                         |           200 |
      | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Manager                         | 2-Manager                          | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                         | p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 | 441355--3056-808--555164                                                                                                                                                                                                                                                                                               |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | qaautomation@remedypartners.com |            |     | Case Manager                    | 3-Case Manager                     | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                         | 5HDc3E6aK_E1                                        | 441355--3056-809--055922, 441355--3056-810--555442, 441355--3056-811--555394, 441355--3056-812--055797, 441355--3056-813--165218, 441355--3056-814--145571, 441355--3056-815--165559, 441355--3056-816--145769, 441355--3056-817--155446, 441355--3056-818--155295, 441355--3056-819--365489, 441355--3056-820--365488 |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com | 9988776655 | NPI | Physicians                      | 4-Physicians                       | episode_connect-Episodes,reports-Reports,lessons-Lessons,physician_portal-Physician Connect                      | p11D0Vl2FSg1,qfy2xp8zSFc1                           | 441355--3056-i37--056048, 441355--3056-i38--145783, 441355--3056-i39--155298, 441355--3056-i40--145862, 441355--3056-i41--155649                                                                                                                                                                                       |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedypartners.com | 9988776655 |     | Transitional Case Manager       | 22-Transitional Case Manager       | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                         | 5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81 | 441355--3056-i42--055646, 441355--3056-i43--146048, 441355--3056-i44--365786, 441355--3056-i45--145508                                                                                                                                                                                                                 |           200 |

  Scenario Outline: <Description>
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify All Users button
    Then I click on All Users button
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify Edit Icon
    Then I click on Edit Icon
    Then I verify Delete User button
    Then I click on cross button on Edit User Page
    Then I verify Lock/Unlock Icon
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify role "<Role>"
    Then I verify email "<Email>" for "<User>-<Role>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    Then I verify enabled "<ApplicationsEnabled>"
    Then I verify learning pathway "<LearningPathway>"
    Then I verify health system "<HealthSystem>"
    Then I verify programs "<Programs>"
    Then I verify location "<Locations>"

    Examples: 
      | Description                                                       | User                            | UserName                               | Password | FirstName                                 | LastName                                 | Phone        | Role                      | ApplicationsEnabled                           | ApplicationsNotVisible                               | NPI | LearningPathway                                                                                                                                           | HealthSystem | Programs               | Locations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | View Executive user created from Super Admin user                 | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | 998-877-6655 | Executive                 | Episodes, Reports, Lessons                    | Episodes 2.0, Administration, Physician Connect, TCI |     | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                        | Covenant     | Covenant--BPCI Model 3 | Covenant--3056-804--Catered Manor Nursing Center, Covenant--3056-805--Downey Care Center, Covenant--3056-806--Encinitas Nursing And Rehabilitation Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | View Manager user created from Super Admin user                   | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName                                 | LastNameLastNameLastNameLastNameLastName |              | Manager                   | Episodes, Reports, Lessons                    | Episodes 2.0, Administration, Physician Connect, TCI |     | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University          | Covenant     | Covenant--BPCI Model 3 | Covenant--3056-808--Arbor Nursing Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | View Case Manager user created from Super Admin                   | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastName                                 |              | Case Manager              | Episodes, Reports, Lessons                    | Episodes 2.0, Administration, Physician Connect, TCI |     | Care Coordination External                                                                                                                                | Covenant     | Covenant--BPCI Model 3 | Covenant--3056-809--Courtyard Health Care Center, Covenant--3056-810--Emerald Gardens Nursing Center, Covenant--3056-811--Buena Vista Care Center, Covenant--3056-812--Gilroy Healthcare And Rehabilitation Center, Covenant--3056-813--Eagle Point Nursing & Rehabilitation Center, Covenant--3056-814--Cedar Ridge Health Rehab Center, Covenant--3056-815--Ennoble Skilled Nursing And Rehabilitation Center, Covenant--3056-816--Friendship Skilled Nursing & Rehabilitation Center, Covenant--3056-817--Covington Manor Health And  Rehabilitation Center, Covenant--3056-818--Clinton House Health And Rehab Center, Covenant--3056-819--Edgewood Manor Nursing Center, Covenant--3056-820--Fairview Skilled Nursing And Rehabilitation Center |
      | View Physicians user created from Super Admin user                | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | 998-877-6655 | Physicians                | Episodes, Reports, Physician Connect, Lessons | Episodes 2.0, Administration, TCI                    |     | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                                                    | Covenant     | Covenant--BPCI Model 3 | Covenant--3056-i37--Pacific Coast Manor, Covenant--3056-i38--Sunrise Skilled Nursing & Rehabilitation Center, Covenant--3056-i39--Pyramid Point Post, Covenant--3056-i40--Hilltop Skilled Nursing, Covenant--3056-i41--Mccormick                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | View Transitional Case Manager user created from Super Admin user | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | 998-877-6655 | Transitional Case Manager | Episodes, Reports, Lessons                    | Episodes 2.0, Administration, Physician Connect, TCI |     | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | Covenant     | Covenant--BPCI Model 3 | Covenant--3056-i42--Palo Alto Sub, Covenant--3056-i43--Meadow Manor, Covenant--3056-i44--Villa Georgetown, Covenant--3056-i45--Highland Health                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

  Scenario Outline: Lock/Unlock user from view user page
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    Then I verify Lock/Unlock Icon
    Then I click on "Lock" icon on view user page
    Then I verify that user is "Locked" on view user page
    Then I click on "Unlock" icon on view user page
    Then I should see an alert with "Are you sure you want to unlock"
    Then I click on "Unlock" button from the unlock alert
    Then I verify that user is "Unlocked" on view user page

    Examples: 
      | User                            | Role      | UserName                               | Password |
      | Partner Technical Administrator | Executive | lbarinstein+qaadmin@remedypartners.com | Testing1 |
