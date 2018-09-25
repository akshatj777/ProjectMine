Feature: View User - PTA User

  Scenario Outline: Create PTA through API call and then verify the user
    Given Build JSON for Create User "<FirstName>" and "<LastName>" and "<Email>" and "<Phone>" and "<NPI>" and "<RoleID>" and "<Applications>" and "<Locations>" and "<LearningPathways>"
    When Create User with this data for "<User>"
    Then Verify Actual vs expected results "<expStatusCode>" and "<responseMsg>"
    Given I am on mail login page
    Then I enter username "qaautomation@remedysystems.com" to login mail account
    Then I enter password "9h$00v3T$dF@OPn0" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify account for user "<User>-<Role>"
    Then I set new password for the user "<User>-<Role>"

    Examples: 
      | User                            | FirstName                                 | LastName                                 | Email                          | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                                             | LearningPathways                                                                                 | Locations                                                                                                                                                                                                                                                                                                                                                                  | expStatusCode |
      | Super Admin                     | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |            |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episode Connect Classic, reports-Reporting Classic, admin-Administration, lessons-Remedy University, analytics-Reporting | HZhmTBQzHtU1, NFdw0Kts2C01, n9yn5n0Qa581                                                         | 441324--6005-059--140007, 441324--3090-068--290039, 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046 |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com | 9988776655 |     | Leader                          | 1-Leader                           | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting                       | HZhmTBQzHtU1, NFdw0Kts2C01, n9yn5n0Qa581                                                         | 441324--6005-059--140007                                                                                                                                                                                                                                                                                                                                                   |           200 |
      | Partner Technical Administrator | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |            |     | Manager                         | 2-Manager                          | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting                       | HZhmTBQzHtU1                                                                                     | 441324--6005-059--140007                                                                                                                                                                                                                                                                                                                                                   |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstName      | LastName                                 | qaautomation@remedysystems.com |            |     | Advanced Operator               | 3-Advanced Operator                | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting                       | HZhmTBQzHtU1, NFdw0Kts2C01, n9yn5n0Qa581, 5HDc3E6aK_E1, p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81 | 441324--6005-059--140007, 441324--3090-068--290039, 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046 |           200 |
      | Partner Technical Administrator | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedysystems.com | 9988776655 |     | Operator                        | 22-Operator                        | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting                       | 5HDc3E6aK_E1, p11D0Vl2FSg1, qfy2xp8zSFc1, 18h7phZr1h81                                           | 441324--3090-068--290039, 441324--3090-191--290039, 441324--3090-068--010118, 441324--3090-068--050113, 441324--3090-068--200018, 441324--3090-068--240093, 441324--3090-068--270049, 441324--3090-068--290012, 441324--3090-068--290021, 441324--3090-068--290022, 441324--3090-068--290041, 441324--3090-068--290045, 441324--3090-068--290046                           |           200 |

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
    Then I refresh the view user page
    And I verify that I am navigated to user page

    Examples: 
      | Description                                          | User                            | UserName                               | Password | FirstName                                 | LastName                                 | Phone        | Role              | ApplicationsEnabled                                                                                                  | ApplicationsNotVisible                              | NPI | LearningPathway                                                                                                                                                                                                     | HealthSystem     | Programs                                                       | Locations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
      | View Leader user created from Super Admin user       | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | 998-877-6655 | Leader            | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Administration |     | New learning Path, Learning Pathway 2, Remedy University                                                                                                                                                            | Sound Physicians | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | View Manager user created from Super Admin user      | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName                                 | LastNameLastNameLastNameLastNameLastName |              | Manager           | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Administration |     | New learning Path                                                                                                                                                                                                   | Sound Physicians | Sound Physicians--BPCI Model 2                                 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | View Advanced Operator user created from Super Admin | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastName                                 |              | Advanced Operator | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Administration |     | New learning Path, Learning Pathway 2, Remedy University, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | Sound Physicians | Sound Physicians--BPCI Model 3, Sound Physicians--BPCI Model 2 | Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--3090-068--Mountainview Hospital, Sound Physicians--3090-191--Mountainview Hospital, Sound Physicians--3090-068--Vaughan Regional Medical Center Parkway Campus, Sound Physicians--3090-068--San Mateo Medical Center, Sound Physicians--3090-068--Aroostook Medical Center, Sound Physicians--3090-068--Mayo Clinic Health System - Mankato, Sound Physicians--3090-068--St Vincent Healthcare, Sound Physicians--3090-068--St Rose Dominican Hospitals - Rose De Lima Campus, Sound Physicians--3090-068--Valley Hospital Medical Center, Sound Physicians--3090-068--Desert Springs Hosp MC, Sound Physicians--3090-068--Summerlin Hospital Medical Center, Sound Physicians--3090-068--St Rose Dominican Hospitals - Siena Campus, Sound Physicians--3090-068--Spring Valley Hospital Medical Center |
      | View Operator user created from Super Admin user     | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | 998-877-6655 | Operator          | Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute | Episode Connect for Post-acute Care, Administration |     | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2                                                           | Sound Physicians | Sound Physicians--BPCI Model 3                                 | Sound Physicians--3090-068--Mountainview Hospital, Sound Physicians--3090-191--Mountainview Hospital, Sound Physicians--3090-068--Vaughan Regional Medical Center Parkway Campus, Sound Physicians--3090-068--San Mateo Medical Center, Sound Physicians--3090-068--Aroostook Medical Center, Sound Physicians--3090-068--Mayo Clinic Health System - Mankato, Sound Physicians--3090-068--St Vincent Healthcare, Sound Physicians--3090-068--St Rose Dominican Hospitals - Rose De Lima Campus, Sound Physicians--3090-068--Valley Hospital Medical Center, Sound Physicians--3090-068--Desert Springs Hosp MC, Sound Physicians--3090-068--Summerlin Hospital Medical Center, Sound Physicians--3090-068--St Rose Dominican Hospitals - Siena Campus, Sound Physicians--3090-068--Spring Valley Hospital Medical Center                                                                   |

  Scenario Outline: Lock/Unlock user from view user page
    Given I am on the login page
    Then I enter newuser email for "Super Admin-Partner Technical Administrator" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "Users" tile
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
      | User                            | Role   | UserName                               | Password |
      | Partner Technical Administrator | Leader | lbarinstein+qaadmin@remedypartners.com | Testing1 |
