Feature: View User - Super Admin User

  Scenario Outline: <Description>
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
      | View Physicians user created from Super Admin user                | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName      | LastNameLastNameLastNameLastNameLastName | 998-877-6655 | Physicians                | Episodes, Reports, Physician Connect, Lessons | Episodes 2.0, Administration, TCI                    |  	 | Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2                                                                    | Covenant     | Covenant--BPCI Model 3 | Covenant--3056-i37--Pacific Coast Manor, Covenant--3056-i38--Sunrise Skilled Nursing & Rehabilitation Center, Covenant--3056-i39--Pyramid Point Post, Covenant--3056-i40--Hilltop Skilled Nursing, Covenant--3056-i41--Mccormick                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
      | View Transitional Case Manager user created from Super Admin user | Partner Technical Administrator | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | 998-877-6655 | Transitional Case Manager | Episodes, Reports, Lessons                    | Episodes 2.0, Administration, Physician Connect, TCI |     | Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | Covenant     | Covenant--BPCI Model 3 | Covenant--3056-i42--Palo Alto Sub, Covenant--3056-i43--Meadow Manor, Covenant--3056-i44--Villa Georgetown, Covenant--3056-i45--Highland Health                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
