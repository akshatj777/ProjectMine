Feature: Edit user page for SA

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

    #Then I verify Account Verification in Inbox in my account
    #Then I click on Account Verification mail in Inbox
    #Then I verify "Confirm My Account!" link in mail content
    #Then I click on "Confirm My Account!" link in mail content
    #And I switch to new window
    #Then I enter email to generate password link
    #And I click on send mail button
    #Then I switch back to old window
    #Then I click on Inbox in mail
    #Then I verify the unread mail in inbox in my account
    #Then I verify Change Password mail in Inbox in my account
    #Then I click on Change Password mail in Inbox
    #Then I verify "Change My Password" link in mail content
    #Then I click on "Change My Password" link in mail content
    #And I switch to new window
    #And I enter new password "Testing1@" to set new password
    #And I enter confirm new password "Testing1@" to set new password
    #And I click on submit button to set new password
    Examples: 
      | User        | FirstName                                 | LastName                                 | Email                           | Phone      | NPI | Role                            | RoleID                             | Applications                                                                                                                                            | LearningPathways                                                                                                     | Locations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | expStatusCode |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Executive                       | 1-Executive                        | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                                                                | 3hSOHNAnvjc1,NFdw0Kts2C01,n9yn5n0Qa581                                                                               | 514083--2070-015--TSH                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |           200 |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedypartners.com |            |     | Manager                         | 2-Manager                          | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                                                                | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,qfy2xp8zSFc1,18h7phZr1h81                                                     | 441354--3056-i11--075181                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |           200 |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedypartners.com | 9988776655 |     | Case Manager                    | 3-Case Manager                     | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                                                                | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,5HDc3E6aK_E1                                                                  | 514029--2070-023--A, 514029--2070-023--L, 514029--2070-025--T                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |           200 |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            | NPI | Physicians                      | 4-Physicians                       | episode_connect-Episodes,reports-Reports,lessons-Lessons,physician_portal-Physician Connect                                                             | 3hSOHNAnvjc1,18h7phZr1h81,n9yn5n0Qa581                                                                               | 441444--2070-g14--100029, 441444--3056-q91--441310, 441444--3056-q91--181318                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |           200 |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedypartners.com |            |     | Remedy TCS                      | 5-Remedy TCS                       | episode_connect-Episodes,reports-Reports,lessons-Lessons,episode_connect_2-Episodes 2.0,tci-TCI                                                         | NFdw0Kts2C01,jusUV22erpk1,p11D0Vl2FSg1,18h7phZr1h81,n9yn5n0Qa581                                                     | 514083--2070-015--TSH, 441369--3056-m03--365402                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |           200 |
      | Super Admin | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Remedy LPN                      | 6-Remedy LPN                       | episode_connect-Episodes,reports-Reports,lessons-Lessons,episode_connect_2-Episodes 2.0,tci-TCI                                                         |                                                                                                                      | 441348--2070-020--HUP, 441348--2070-021--PMC, 441354--3056-i11--075181, 441354--3056-i12--075211                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |           200 |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedypartners.com | 9988776655 |     | Remedy RN                       | 7-Remedy RN                        | episode_connect-Episodes,reports-Reports,lessons-Lessons,episode_connect_2-Episodes 2.0,tci-TCI                                                         | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,HZhmTBQzHtU1,5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 | 441444--2070-g14--100029, 441444--3056-q91--441310, 441444--3056-q91--181318, 441324--6005-059--140010, 441324--6005-072--100022, 441324--3056-b75--490033, 441324--3090-066--140011                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |           200 |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedypartners.com |            |     | Remedy Field RN                 | 8-Remedy Field RN                  | episode_connect-Episodes,reports-Reports,lessons-Lessons,episode_connect_2-Episodes 2.0,tci-TCI                                                         | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,HZhmTBQzHtU1,5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81              | 439207--2070-060--420091, 439207--2070-060--310083, 439207--2070-060--160045, 439207--2070-060--310041, 439207--2070-060--310086, 439207--2070-060--310044, 439207--2070-060--310112, 439207--2070-060--310038, 439207--2070-060--310086-1, 439207--2070-060--310039, 439207--2070-060--100019, 439207--2070-060--100217, 439207--2070-060--330119, 439207--2070-060--390048, 439207--2070-060--310096, 439207--2070-060--440002, 439207--2070-060--310002, 439207--2070-060--490063, 439207--2070-060--310029-IRF, 439207--2070-060--160029, 439207--2070-060--HUMC, 439207--2070-060--420070, 439207--2070-060--223321233, 439207--2070-060--100044, 439207--2070-060--310061, 439207--2070-060--330106, 439207--2070-060--310022, 439207--2070-060--310014, 439207--2070-060--310022-2, 439207--2070-060--310022-1, 439207--2070-060--210048, 439207--2070-060--210001, 439207--2070-060--100092, 439207--2070-060--100291, 439207--2070-060--310070, 439207--2070-060--100044-1, 439207--2070-060--310073, 439207--2070-060--390268, 439207--2070-060--310031, 439207--2070-060--310032, 439207--2070-060--440189, 439207--2070-060--310076, 439207--2070-060--100044-2, 439207--2070-060--310034-REH, 439207--2070-060--310034-REH, 439207--2070-060--310069, 439207--2070-060--490045, 439207--2070-060--310029, 439207--2070-060--310108, 439207--3056-a08--210048, 439207--3056-a08--310083, 807551--6005-197--UHS, 807551--6005-197--330394-REH, 807551--6005-198--CMH, 807551--3090-209--337181                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |           200 |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedypartners.com |            |     | Remedy PM                       | 9-Remedy PM                        | episode_connect-Episodes,reports-Reports,lessons-Lessons,episode_connect_2-Episodes 2.0,tci-TCI                                                         | NFdw0Kts2C01,HZhmTBQzHtU1,p11D0Vl2FSg1,qfy2xp8zSFc1                                                                  | 439207--2070-060--420091, 439207--3056-a08--210048, 439207--3056-a08--310083, 439207--3056-a08--210001, 439207--3056-a08--330106, 439207--3056-a08--310096, 439207--3056-a08--310076, 807551--6005-197--UHS, 807551--6005-197--330394-REH, 807551--6005-198--CMH, 807551--6005-200--430016, 807551--6005-200--100284 , 807551--6005-200--330307, 807551--6005-200--220012, 807551--6005-200--070028, 807551--6005-200--330304, 807551--6005-200--330385, 807551--6005-200--330222, 807551--6005-200--390119, 807551--6005-200--030093, 807551--6005-200--161395906, 807551--6005-200--330151, 807551--6005-200--330393, 807551--6005-200--330175, 807551--6005-200--310115, 807551--6005-200--050082, 807551--6005-200--080004, 807551--6005-200--210048, 807551--6005-200--150035, 807551--6005-200--330090, 807551--6005-200--PG3, 807551--6005-200--CMH, 807551--6005-200--UHS, 807551--6005-200--390042, 807551--6005-200--390001, 807551--6005-200--050503, 807551--6005-200--330136, 807551--6005-200--330011, 807551--6005-200--330231, 807551--6005-200--330132, 807551--6005-200--050684, 807551--6005-200--330078, 807551--6005-200--330013, 807551--6005-200--330085, 807551--6005-200--190020, 807551--6005-200--330141, 807551--6005-200--030061, 807551--6005-200--050390, 807551--6005-200--330394-REH, 807551--6005-200--ALB, 807551--6005-200--190146, 807551--3090-209--337181                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |           200 |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedypartners.com |            |     | Remedy Sales Team               | 11-Remedy Sales Team               | episode_connect-Episodes,lessons-Lessons,tci-TCI                                                                                                        | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,p11D0Vl2FSg1                                                                  | 439207--2070-060--420091, 439207--2070-060--310083, 439207--2070-060--160045, 439207--2070-060--310041, 439207--2070-060--310086, 439207--2070-060--310044, 439207--2070-060--310112, 439207--2070-060--310038, 439207--2070-060--310086-1, 439207--2070-060--310039, 439207--2070-060--100019, 439207--2070-060--100217, 439207--2070-060--330119, 439207--2070-060--390048, 439207--2070-060--310096, 439207--2070-060--440002, 439207--2070-060--310002, 439207--2070-060--490063, 439207--2070-060--310029-IRF, 439207--2070-060--160029, 439207--2070-060--HUMC, 439207--2070-060--420070, 439207--2070-060--223321233, 439207--2070-060--100044, 439207--2070-060--310061, 439207--2070-060--330106, 439207--2070-060--310022, 439207--2070-060--310014, 439207--2070-060--310022-2, 439207--2070-060--310022-1, 439207--2070-060--210048, 439207--2070-060--210001, 439207--2070-060--100092, 439207--2070-060--100291, 439207--2070-060--310070, 439207--2070-060--100044-1, 439207--2070-060--310073, 439207--2070-060--390268, 439207--2070-060--310031, 439207--2070-060--310032, 439207--2070-060--440189, 439207--2070-060--310076, 439207--2070-060--100044-2, 439207--2070-060--310034-REH, 439207--2070-060--310034-REH, 439207--2070-060--310069, 439207--2070-060--490045, 439207--2070-060--310029, 439207--2070-060--310108, 439207--3056-a08--210048, 439207--3056-a08--310083, 439207--3056-a08--210001, 439207--3056-a08--330106, 439207--3056-a08--310096, 439207--3056-a08--310076, 807551--6005-197--UHS, 807551--6005-197--330394-REH, 807551--6005-198--CMH, 807551--6005-200--430016, 807551--6005-200--100284 , 807551--6005-200--330307, 807551--6005-200--220012, 807551--6005-200--070028, 807551--6005-200--330304, 807551--6005-200--330385, 807551--6005-200--330222, 807551--6005-200--390119, 807551--6005-200--030093, 807551--6005-200--161395906, 807551--6005-200--330151, 807551--6005-200--330393, 807551--6005-200--330175, 807551--6005-200--310115, 807551--6005-200--050082, 807551--6005-200--080004, 807551--6005-200--210048, 807551--6005-200--150035, 807551--6005-200--330090, 807551--6005-200--PG3, 807551--6005-200--CMH, 807551--6005-200--UHS, 807551--6005-200--390042, 807551--6005-200--390001, 807551--6005-200--050503, 807551--6005-200--330136, 807551--6005-200--330011, 807551--6005-200--330231, 807551--6005-200--330132, 807551--6005-200--050684, 807551--6005-200--330078, 807551--6005-200--330013, 807551--6005-200--330085, 807551--6005-200--190020, 807551--6005-200--330141, 807551--6005-200--030061, 807551--6005-200--050390, 807551--6005-200--330394-REH, 807551--6005-200--ALB, 807551--6005-200--190146, 807551--3090-209--337181 |           200 |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedypartners.com | 9988776655 |     | Remedy Executive                | 14-Remedy Executive                | episode_connect-Episodes,reports-Reports,lessons-Lessons,episode_connect_2-Episodes 2.0,tci-TCI                                                         | jusUV22erpk1,HZhmTBQzHtU1,n9yn5n0Qa581                                                                               | 439108--CJR-1--390168, 439108--2070-a55--390168, 439207--2070-060--420091, 439207--3056-a08--210048, 439207--3056-a08--310083, 439207--3056-a08--210001, 439207--3056-a08--330106, 439207--3056-a08--310096, 439207--3056-a08--210001, 439207--3056-a08--330106, 439207--3056-a08--310096, 439207--3056-a08--310076                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |           200 |
      | Super Admin | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Prospective Partner Executive   | 15-Prospective Partner Executive   | lessons-Lessons                                                                                                                                         |                                                                                                                      | 514083--2070-015--TSH                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |           200 |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedypartners.com |            |     | Remedy Other                    | 17-Remedy Other                    | episode_connect-Episodes,lessons-Lessons,episode_connect_2-Episodes 2.0,tci-TCI                                                                         | HZhmTBQzHtU1,18h7phZr1h81                                                                                            | 439108--2070-a55--390168, 439108--CJR-1--390168, 809046--CJR-10-6--310084                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |           200 |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedypartners.com |            |     | Partner Program Administrator   | 18-Partner Program Administrator   | episode_connect-Episodes,reports-Reports,lessons-Lessons,episode_connect_2-Episodes 2.0,physician_portal-Physician Connect                              | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,18h7phZr1h81,n9yn5n0Qa581                                                     | 441371--3056-m55--555836, 441371--3056-m61--555745, 441371--3056-m63--555746,441371--3056-m69--555768, 441371--3056-m74--106022                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |           200 |
      | Super Admin | FirstName                                 | LastName                                 | qaautomation@remedypartners.com | 9988776655 |     | Remedy Program Administrator    | 19-Remedy Program Administrator    | episode_connect-Episodes,reports-Reports,lessons-Lessons,episode_connect_2-Episodes 2.0,tci-TCI,physician_portal-Physician Connect                      | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581                                        | 441444--2070-g14--100029, 441444--3056-q91--181318, 441444--3056-q91--441310,441324--6005-059--140007, 441324--6005-059--140010, 441324--3056-b75--490033, 439207--2070-060--420091, 439207--2070-060--310083, 439207--2070-060--160045, 439207--2070-060--310041, 439207--2070-060--310086, 439207--2070-060--310044, 439207--2070-060--310112, 439207--2070-060--310038, 439207--2070-060--310086-1, 439207--2070-060--310039, 439207--2070-060--100019, 439207--2070-060--100217, 439207--2070-060--330119, 439207--2070-060--390048, 439207--2070-060--310096, 439207--2070-060--440002, 439207--2070-060--310002, 439207--2070-060--490063, 439207--2070-060--310029-IRF, 439207--2070-060--160029, 439207--2070-060--HUMC, 439207--2070-060--420070, 439207--2070-060--223321233, 439207--2070-060--100044, 439207--2070-060--310061, 439207--2070-060--330106, 439207--2070-060--310022, 439207--2070-060--310014, 439207--2070-060--310022-2, 439207--2070-060--310022-1, 439207--2070-060--210048, 439207--2070-060--210001, 439207--2070-060--100092, 439207--2070-060--100291, 439207--2070-060--310070, 439207--2070-060--100044-1, 439207--2070-060--310073, 439207--2070-060--390268, 439207--2070-060--310031, 439207--2070-060--310032, 439207--2070-060--440189, 439207--2070-060--310076, 439207--2070-060--100044-2, 439207--2070-060--310034-REH, 439207--2070-060--310034-REH, 439207--2070-060--310069, 439207--2070-060--490045, 439207--2070-060--310029, 439207--2070-060--310108, 439207--3056-a08--210048, 439207--3056-a08--310083, 439207--3056-a08--210001, 439207--3056-a08--330106, 439207--3056-a08--310096, 439207--3056-a08--310076                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |           200 |
      | Super Admin | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Partner Technical Administrator | 20-Partner Technical Administrator | episode_connect-Episodes,reports-Reports,lessons-Lessons,physician_portal-Physician Connect,admin-Administration                                        | NFdw0Kts2C01,HZhmTBQzHtU1,n9yn5n0Qa581                                                                               | 441355--3056-804--COVC0023, 441355--3056-805--055519, 441355--3056-806--055761,441355--3056-807--295023,  441355--3056-808--555164                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |           200 |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastName                                 | qaautomation@remedypartners.com | 9988776655 |     | Remedy Technical Administrator  | 21-Remedy Technical Administrator  | episode_connect-Episodes,reports-Reports,lessons-Lessons,episode_connect_2-Episodes 2.0,tci-TCI,physician_portal-Physician Connect,admin-Administration | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,HZhmTBQzHtU1,5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 | 439207--2070-060--420091, 439207--2070-060--310083, 439207--2070-060--160045, 439207--2070-060--310041, 439207--2070-060--310086, 439207--2070-060--310044, 439207--2070-060--310112, 439207--2070-060--310038, 439207--2070-060--310086-1, 439207--2070-060--310039, 439207--2070-060--100019, 439207--2070-060--100217, 439207--2070-060--330119, 439207--2070-060--390048, 439207--2070-060--310096, 439207--2070-060--440002, 439207--2070-060--310002, 439207--2070-060--490063, 439207--2070-060--310029-IRF, 439207--2070-060--160029, 439207--2070-060--HUMC, 439207--2070-060--420070, 439207--2070-060--223321233, 439207--2070-060--100044, 439207--2070-060--310061, 439207--2070-060--330106, 439207--2070-060--310022, 439207--2070-060--310014, 439207--2070-060--310022-2, 439207--2070-060--310022-1, 439207--2070-060--210048, 439207--2070-060--210001, 439207--2070-060--100092, 439207--2070-060--100291, 439207--2070-060--310070, 439207--2070-060--100044-1, 439207--2070-060--310073, 439207--2070-060--390268, 439207--2070-060--310031, 439207--2070-060--310032, 439207--2070-060--440189, 439207--2070-060--310076, 439207--2070-060--100044-2, 439207--2070-060--310034-REH, 439207--2070-060--310034-REH, 439207--2070-060--310069, 439207--2070-060--490045, 439207--2070-060--310029, 439207--2070-060--310108, 439207--3056-a08--210048, 439207--3056-a08--310083, 439207--3056-a08--210001, 439207--3056-a08--330106, 439207--3056-a08--310096, 439207--3056-a08--310076,807551--6005-200--430016, 807551--6005-200--100284 , 807551--6005-200--330307, 807551--6005-200--220012, 807551--6005-200--070028, 807551--6005-200--330304, 807551--6005-200--330385, 807551--6005-200--330222, 807551--6005-200--390119, 807551--6005-200--030093, 807551--6005-200--161395906, 807551--6005-200--330151, 807551--6005-200--330393, 807551--6005-200--330175, 807551--6005-200--310115, 807551--6005-200--050082, 807551--6005-200--080004, 807551--6005-200--210048, 807551--6005-200--150035, 807551--6005-200--330090, 807551--6005-200--PG3, 807551--6005-200--CMH, 807551--6005-200--UHS, 807551--6005-200--390042, 807551--6005-200--390001, 807551--6005-200--050503, 807551--6005-200--330136, 807551--6005-200--330011, 807551--6005-200--330231, 807551--6005-200--330132, 807551--6005-200--050684, 807551--6005-200--330078, 807551--6005-200--330013, 807551--6005-200--330085, 807551--6005-200--190020, 807551--6005-200--330141, 807551--6005-200--030061, 807551--6005-200--050390, 807551--6005-200--330394-REH, 807551--6005-200--ALB, 807551--6005-200--190146, 807551--6005-197--UHS, 807551--3090-209--337181, 439108--CJR-1--390168, 439108--2070-a55--390168      |           200 |
      | Super Admin | FirstName                                 | LastNameLastNameLastNameLastNameLastName | qaautomation@remedypartners.com |            |     | Transitional Case Manager       | 22-Transitional Case Manager       | episode_connect-Episodes,reports-Reports,lessons-Lessons                                                                                                | 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,HZhmTBQzHtU1,5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 | 807551--6005-197--UHS, 807551--6005-200--220012, 807551--3090-209--337181                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |           200 |

  Scenario Outline: Verifying editable/non-editable fields of general information tab and editing them
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I verify the header "General Information"
    Then I verify the availability of fields "First Name"
    And I fill in First Name with "<FirstName>"
    Then I verify the availability of fields "Last Name"
    Then I fill in Last Name with <LastName>
    Then I verify the availability of fields "Email"
    And I should not be able to edit Email
    Then I verify the availability of fields "Phone"
    And I fill in Phone with <Phone>
    Then I verify the availability of fields "Role"
    Then I verify the availability of field NPI for "<Role>"
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I select "<Applications>" product
    Then I click on learning pathway dropdown
    Then I enter "<RemoveLearningPathwaySearchParameter>" in Learning Pathway search box
    Then I remove "<RemoveLearningPathwaySearchParameter>" from the results
    Then I verify that Learning Pathway ID "<LearningPathwayID>" is not displayed for the enabled Learning Pathway
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify phone "<Phone>"
    Then I verify NPI "<NPI>"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget

    Examples: 
      | User        | Role       | FirstName        | LastName        | Email                            | Phone        | NPI | RemoveLearningPathwaySearchParameter | LearningPathwayID | Applications       |
      | Super Admin | Physicians | FirstName'Edited | LastName'Edited | qaautomation@remedypartners.com2 | 996-385-2451 | NPI | i am learning path, 18h7phZr1h81     | n9yn5n0Qa581      | Episodes, Episodes |

  Scenario: Verify NPI on the EC1 tile
    Given I am on the login page
    When I enter email field qa.admin@yopmail.com for login
    And I enter password field Episode1! for Login
    And I click Access button
    And I click on Episode1 tile for "Super Admin-Physicians" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "Super Admin-Physicians" user
    And I verify NPI on ECI for "Super Admin-Physicians" user

  Scenario Outline: Editing user role from <PreviousRole> to <Role>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I enter "<LearningPathwaySearchParameter>" in Learning Pathway search box
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    Then I verify role "<Role>"
    Then I verify enabled "<Applications>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<ApplicationsVisible>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #Then I click on Hamburger menu on top left of homepage
    #And I verify "<ApplicationsVisible>" in product menu dropdown
    #And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    #And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    #And I switch back to old window
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    #When I click on field-panel-icon button for "<User>-<Role>" user
    #When I click to "BPID" field filter under "Episode Initiator" filter field for "<User>-<Role>" user
    #And I choose "Filter" option from select options of filter field for "<User>-<Role>" user
    #And I should see "<BPID>" in the filter value list for "<User>-<Role>" user
    #And I click on cancel button from filter for "<User>-<Role>" user
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I click on RemedyU tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I switch back to old window
    And I redirect to Remedy connect page
    #And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    #And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | User        | UserName                               | Password | Email                            | NPI | PreviousRole | Role                          | EnableApplications | Applications                                                     | ApplicationsVisible        | ApplicationsNotVisible       | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName                   | BPID | LearningPathway                                                                                                                       | FirstName | LastName | Facilities        |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com2 |     | Manager      | Partner Program Administrator | Physician Connect  | Episodes, Reports, Physician Connect, Lessons, Physician Connect | Episodes, Reports, Lessons | Administration, Episodes 2.0 |                                | ROLE_PRM | Patient ID     | Episode DRG Issues [Model 3] |      | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | FirstName | LastName | Apple - Watertown |

  Scenario Outline: Changing the products and general details for <Role> and verifying product tile
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Applications" tab
    Then I unselect "<DisableApplications>" product
    Then I select "Permissions" tab
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify role "<Role>"
    Then I verify enabled "<Applications>"
    Then I verify disabled "<DisableApplications>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #Then I click on Hamburger menu on top left of homepage
    #And I verify "<Applications>" in product menu dropdown
    #And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    #And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    #And I switch back to old window
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    #When I click on field-panel-icon button for "<User>-<Role>" user
    #When I click to "BPID" field filter under "Episode Initiator" filter field for "<User>-<Role>" user
    #And I choose "Filter" option from select options of filter field for "<User>-<Role>" user
    #And I should see "<BPID>" in the filter value list for "<User>-<Role>" user
    #And I click on cancel button from filter for "<User>-<Role>" user
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I click on RemedyU tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I switch back to old window
    And I redirect to Remedy connect page
    #And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    #And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | User        | Role         | Email                            | DisableApplications | Applications               | ApplicationsNotVisible                                   | Roletext | ReportCategory | ReportName                   | BPID | LearningPathway                                                                                                                                                                                                                                          | Facilities                                                                                                                                                          | FirstName | LastName |
      | Super Admin | Case Manager | qaautomation@remedypartners.com2 | Reports             | Episodes, TCI, Lessons     | Episodes 2.0, Administration, Physician Connect, Reports | ROLE_TCS | Patient ID     | Episode DRG Issues           |      | i am learning path, Learning Pathway 2, max-test-052417, Care Coordination External                                                                                                                                                                      | Allentown, Bethlehem, Anderson                                                                                                                                      | FirstName | LastName |
      | Super Admin | Remedy RN    | qaautomation@remedypartners.com2 | Reports, Episodes   | Episodes 2.0, TCI, Lessons | Reports, Episodes, Administration, Physician Connect     | ROLE_RN  | Patient ID     | Episode DRG Issues [Model 3] |      | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | North Shore Med Center, Rhea Medical Center, The Medical Center At Franklin, Evanston Hospital, Jackson North Med Center, Warren Memorial Hospital, Herrin Hospital | FirstName | LastName |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I remove health system "<Remove HealthSystem1>"
    And I click on "Remove" button on permissions tab
    Then I remove health system "<Remove HealthSystem2>"
    And I click on "Remove" button on permissions tab
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify health system "<Health System>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #Then I click on Hamburger menu on top left of homepage
    #And I verify "<Applications>" in product menu dropdown
    #And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    #And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    #And I switch back to old window
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    #When I click on field-panel-icon button for "<User>-<Role>" user
    #When I click to "BPID" field filter under "Episode Initiator" filter field for "<User>-<Role>" user
    #And I choose "Filter" option from select options of filter field for "<User>-<Role>" user
    #And I should see "<BPID>" in the filter value list for "<User>-<Role>" user
    #And I click on cancel button from filter for "<User>-<Role>" user
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I click on RemedyU tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I switch back to old window
    And I redirect to Remedy connect page
    #And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    #And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | Description                          | User        | Role      | Email                            | Applications                    | ApplicationsNotVisible                          | Remove HealthSystem1 | Remove HealthSystem2 | Health System    | Programs    | Locations                                                                               | Facilities                                                          | ProgramsValidation             | LocationsValidation                                                                                                         | LearningPathway                                           | FirstName                                 | LastName                                 | Roletext | ReportCategory | ReportName         |
      | Remove Existing org and add new org1 | Super Admin | Executive | qaautomation@remedypartners.com2 | Reports, Episodes, TCI, Lessons | Episodes 2.0, Administration, Physician Connect | Stamford Hospital    | Penn                 | Sound Physicians | BPCI-Model2 | 6005-080--Winchester Medical Center - Rehab Unit, 6005-063--Fairbanks Memorial Hospital | Winchester Medical Center - Rehab Unit, Fairbanks Memorial Hospital | Sound Physicians--BPCI Model 2 | Sound Physicians--6005-080--Winchester Medical Center - Rehab Unit, Sound Physicians--6005-063--Fairbanks Memorial Hospital | i am learning path, Learning Pathway 2, Remedy University | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | ROLE_PRM | Patient ID     | Episode DRG Issues |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Applications" tab
    Then I unselect "<DisableApplications>" product
    Then I select "Permissions" tab
    Then I click Add Organization button for "<HasHealthSystem2>" flag
    And I search for health system with <Health System2>
    And I select a <Health System2>
    Then I select "<Programs2>" programs
    Then I select "<Locations2>" locations
    Then I click Add Organization button for "<HasHealthSystem3>" flag
    And I search for health system with <Health System3>
    And I select a <Health System3>
    Then I select "<Programs3>" programs
    Then I select "<Locations3>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify health system "<HealthSystemValidation>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #Then I click on Hamburger menu on top left of homepage
    #And I verify "<Applications>" in product menu dropdown
    #And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    #And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    #And I switch back to old window
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    #When I click on field-panel-icon button for "<User>-<Role>" user
    #When I click to "BPID" field filter under "Episode Initiator" filter field for "<User>-<Role>" user
    #And I choose "Filter" option from select options of filter field for "<User>-<Role>" user
    #And I should see "<BPID>" in the filter value list for "<User>-<Role>" user
    #And I click on cancel button from filter for "<User>-<Role>" user
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I click on RemedyU tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I switch back to old window
    And I redirect to Remedy connect page
    #And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    #And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | Description       | User        | Role                            | Email                            | Applications                                    | AppliationNotVisible            | DisableApplications | Locations2                       | Programs2   | HasHealthSystem2 | Health System2 | HasHealthSystem3 | Health System3    | Programs3   | Locations3                  | Facilities                                                                                                                                                                                                 | HealthSystemValidation                  | ProgramsValidation                                                                | LocationsValidation                                                                                                                                                                                                                                                                                                                                               | LearningPathway                                          | FirstName | LastName                                 | Roletext | ReportName                   | ReportCategory |
      | Add org2 and org3 | Super Admin | Partner Technical Administrator | qaautomation@remedypartners.com2 | Episodes, Reports, Administration, TCI, Lessons | Physician Connect, Episodes 2.0 | Physician Connect   | 2070-g14--North Shore Med Center | BPCI-Model2 | Yes              | TeamHealth     | Yes              | Stamford Hospital | BPCI-Model2 | 2070-015--Stamford Hospital | Stamford Hospital, North Shore Med Center, Catered Manor Nursing Center, Downey Care Center, Encinitas Nursing and Rehabilitation Center,  Carson Nursing and Rehabilitation Center,  Arbor Nursing Center | Covenant, TeamHealth, Stamford Hospital | Stamford Hospital--BPCI Model 2, TeamHealth--BPCI Model 2, Covenant--BPCI Model 3 | Stamford Hospital--2070-015--Stamford Hospital, TeamHealth--2070-g14--North Shore Med Center, Covenant--3056-804--Catered Manor Nursing Center, Covenant--3056-805--Downey Care Center, Covenant--3056-806--Encinitas Nursing And Rehabilitation Center,  Covenant--3056-807--Carson Nursing And Rehabilitation Center,  Covenant--3056-808--Arbor Nursing Center | Learning Pathway 2, New learning Path, Remedy University | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_PRM | Episode DRG Issues [Model 3] | Patient ID     |

  Scenario Outline: Editing locations -<Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Applications" tab
    Then I unselect "<DisableApplications>" product
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System>"
    Then I deselect "<RemoveLocations>" locations
    Then I select "<Locations>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify health system "<Health System>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #Then I click on Hamburger menu on top left of homepage
    #And I verify "<Applications>" in product menu dropdown
    #And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    #And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    #And I switch back to old window
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    #When I click on field-panel-icon button for "<User>-<Role>" user
    #When I click to "BPID" field filter under "Episode Initiator" filter field for "<User>-<Role>" user
    #And I choose "Filter" option from select options of filter field for "<User>-<Role>" user
    #And I should see "<BPID>" in the filter value list for "<User>-<Role>" user
    #And I click on cancel button from filter for "<User>-<Role>" user
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I click on RemedyU tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I switch back to old window
    And I redirect to Remedy connect page
    #And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    #And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | Description                                | User        | Role       | Email                            | Applications                                  | ApplicationsNotVisible                          | DisableApplications | RemoveLocations | Locations                                                  | Programs    | Health System | Facilities                                                                                                                                              | ProgramsValidation                                       | LocationsValidation                                                                                                                                                                                                                                   | LearningPathway                                                                                                                                | FirstName | LastName                                 | Roletext | ReportCategory | ReportName         |
      | Edit single location to multiple locations | Super Admin | Remedy TCS | qaautomation@remedypartners.com2 | Episodes, Reports, TCI, Lessons               | Episodes 2.0, Administration, Physician Connect | Episodes 2.0        |                 | 3056-m04--Altercare Post, 3056-m05--Altercare - Big Rapids | BPCI-Model3 | Altercare     | Altercare Post-Acute Rehab Center, Altercare - Big Rapids, Stamford Hospital, Altercare - Alliance                                                      | Stamford Hospital--BPCI Model 2, Altercare--BPCI Model 3 | Altercare--3056-m04--Altercare Post, Altercare--3056-m05--Altercare - Big Rapids, Stamford Hospital--2070-015--Stamford Hospital, Altercare--3056-m03--Altercare - Alliance                                                                           | Learning Pathway 2, max-test-052417, Clinical Operations Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | FirstName | LastName                                 | ROLE_TCS | Patient ID     | Episode DRG Issues |
      | Edit to All Locations                      | Super Admin | Remedy LPN | qaautomation@remedypartners.com2 | Episodes 2.0, Reports, TCI, Lessons           | Episodes, Administration, Physician Connect     | Episodes            |                 | All Locations                                              | BPCI-Model2 | Penn          | UPenn - Hospital of the Univ. of Pennsylvania, Upenn - Penn Presbyterian Hospital, Upenn - Pennsylvania Hospital, Apple - Rocky Hill, Apple - Watertown | Penn--BPCI Model 2, Apple Rehab--BPCI Model 3            | Penn--2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania, Penn--2070-021--Upenn - Penn Presbyterian Hospital, Penn--2070-022--Upenn - Pennsylvania Hospital, Apple Rehab--3056-i11--Apple - Watertown, Apple Rehab--3056-i12--Apple - Rocky Hill |                                                                                                                                                | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_LPN | Patient ID     | Episode DRG Issues |
      | Edit All locations to single location      | Super Admin | Remedy LPN | qaautomation@remedypartners.com2 | Episodes 2.0, Reports, TCI, Lessons, Episodes | Administration, Physician Connect               | Episodes            | All Locations   | 2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania    | BPCI-Model2 | Penn          | UPenn - Hospital of the Univ. of Pennsylvania, Apple - Rocky Hill, Apple - Watertown                                                                    | Penn--BPCI Model 2, Apple Rehab--BPCI Model 3            | Penn--2070-020--Upenn - Hospital Of The Univ. Of Pennsylvania, Apple Rehab--3056-i11--Apple - Watertown, Apple Rehab--3056-i12--Apple - Rocky Hill                                                                                                    |                                                                                                                                                | FirstName | LastNameLastNameLastNameLastNameLastName | ROLE_LPN | Patient ID     | Episode DRG Issues |

  Scenario Outline: Edit programs- <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Applications" tab
    Then I unselect "<DisableApplications>" product
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System>"
    Then I deselect "<RemovePrograms>" programs
    #Then I select "<Programs>" programs for existing organisation
    #Then I select "<Locations>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify health system "<HealthSystemValidation>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #Then I click on Hamburger menu on top left of homepage
    #And I verify "<Applications>" in product menu dropdown
    #And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    #And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    #And I switch back to old window
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    #When I click on field-panel-icon button for "<User>-<Role>" user
    #When I click to "BPID" field filter under "Episode Initiator" filter field for "<User>-<Role>" user
    #And I choose "Filter" option from select options of filter field for "<User>-<Role>" user
    #And I should see "<BPID>" in the filter value list for "<User>-<Role>" user
    #And I click on cancel button from filter for "<User>-<Role>" user
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I click on RemedyU tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I switch back to old window
    And I redirect to Remedy connect page
    #And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    #And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | Description                                                                                         | User        | Role             | Email                            | Applications                                  | ApplicationsNotVisible            | DisableApplications | Locations | RemovePrograms | Programs    | Health System                                        | Facilities                                                                                                                                                                                           | LearningPathway                                                                                                                                                                                                                       | FirstName                                 | LastName | Roletext | ReportCategory | ReportName                   | HealthSystemValidation                                                               | ProgramsValidation                                                                                                                                                 | LocationsValidation                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | Search user with multiple model-disable model-2 and model-3 remained enabled then verify locations  | Super Admin | Remedy Field RN  | qaautomation@remedypartners.com2 | Episodes, Episodes 2.0, Reports, TCI, Lessons | Administration, Physician Connect | Episodes, Episodes  |           | BPCI-Model2    | BPCI-Model3 | Cardiovascular Associates of The Delaware Valley,p A | Howard County General Hospital, East Orange General Hospital, United Health Services, Binghamton General-Sandiford Rehabilitation Center, Chenango Memorial Hospital, UHS Twin Tier Home Health Inc. | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | ROLE_FRN | Patient ID     | Episode DRG Issues [Model 3] | United Health Services of New York, Cardiovascular Associates of The Delaware Valley | United Health Services of New York--BPCI Model 2, United Health Services of New York--BPCI Model 3, Cardiovascular Associates of The Delaware Valley--BPCI Model 3 | United Health Services of New York--6005-197--United Health Services, United Health Services of New York--6005-197--Binghamton General, United Health Services of New York--6005-198--Chenango Memorial Hospital, United Health Services of New York--3090-209--Uhs Twin Tier Home Health Inc., Cardiovascular Associates of The Delaware Valley--3056-a08--Howard County General Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--East Orange General Hospital |
      | Search user with multiple model-disable model-3 with model-2 remained enabled and verify locations  | Super Admin | Remedy Executive | qaautomation@remedypartners.com2 | Episodes, Episodes 2.0, Reports, TCI, Lessons | Administration, Physician Connect | Episodes, Episodes  |           | BPCI-Model3    | BPCI-Model2 | Cardiovascular Associates of The Delaware Valley,p A | Butler Memorial Hospital, Carolinas Hospital System - Florence                                                                                                                                       | max-test-052417, New learning Path, Remedy University                                                                                                                                                                                 | FirstNameFirstNameFirstNameFirstNameFirst | LastName | ROLE_PRM | Patient ID     | Episode DRG Issues           | Cardiovascular Associates of The Delaware Valley, Butler Memorial Hospital           | Cardiovascular Associates of The Delaware Valley--BPCI Model 2, Butler Memorial Hospital--BPCI-CJR, Butler Memorial Hospital--BPCI Model 2                         | Butler Memorial Hospital--CJR-1--Butler Memorial Hospital, Butler Memorial Hospital--2070-a55--Butler Memorial Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Carolinas Hospital System - Florence                                                                                                                                                                                                                                                            |
      | Search user with multiple model-disable BPCI-CJR with model-2 remained enabled and verify locations | Super Admin | Remedy Other     | qaautomation@remedypartners.com2 | Episodes, Episodes 2.0, TCI, Lessons          | Administration, Physician Connect | Episodes, Episodes  |           | BPCI-CJR       | BPCI-Model2 | Butler Memorial Hospital                             | Butler Memorial Hospital, Monmouth Medical Center - Southern Campus                                                                                                                                  | New learning Path, Physician Acute Care Hospital Model 2                                                                                                                                                                              | FirstName                                 | LastName | ROLE_PRM | Patient ID     | Episode DRG Issues           | Butler Memorial Hospital, RWJ Barnabas Health                                        | Butler Memorial Hospital--BPCI Model 2, RWJ Barnabas Health--BPCI-CJR                                                                                              | Butler Memorial Hospital--2070-a55--Butler Memorial Hospital, RWJ Barnabas Health--CJR-10-6--Monmouth Medical Center - Southern Campus                                                                                                                                                                                                                                                                                                                                               |

  Scenario Outline: Changing General information, Role from <PreviousRole> to <Role> and Remove existing org and add new org
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I fill in Phone with <Phone>
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I select "<EnableApplications>" product
    #Then I click on Select button
    #Then I enter "<LearningPathwaySearchParameter>" in Learning Pathway search box
    #Then I select "<LearningPathwaySearchParameter>" from the results
    Then I click on Next button
    Then I remove health system "<Remove HealthSystem>"
    And I click on "Remove" button on permissions tab
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select location by facility key "<Locations>"
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    Then I verify first name "<FirstName>"
    Then I verify last name "<LastName>"
    Then I verify phone "<Phone>"
    Then I verify enabled "<EnableApplications>"
    Then I verify health system "<HealthSystemValidation>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #Then I click on Hamburger menu on top left of homepage
    #And I verify "<Applications>" in product menu dropdown
    #And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    #And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    #And I switch back to old window
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    #When I click on field-panel-icon button for "<User>-<Role>" user
    #When I click to "BPID" field filter under "Episode Initiator" filter field for "<User>-<Role>" user
    #And I choose "Filter" option from select options of filter field for "<User>-<Role>" user
    #And I should see "<BPID>" in the filter value list for "<User>-<Role>" user
    #And I click on cancel button from filter for "<User>-<Role>" user
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I click on RemedyU tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I switch back to old window
    And I redirect to Remedy connect page
    #And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    #And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | User        | UserName                               | Password | FirstName | LastName       | Email                            | Phone        | NPI | PreviousRole | Role    | EnableApplications | Applications               | ApplicationsNotVisible                          | Remove HealthSystem                                                    | Health System                                                          | Programs    | Locations | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName         | BPID | Facilities                              | LearningPathway                                                                     | HealthSystemValidation   | ProgramsValidation                     | LocationsValidation                                              |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstName | LastNameEdited | qaautomation@remedypartners.com2 | 996-385-2451 |     | Case Manager | Manager | Reports            | Episodes, Reports, Lessons | Administration, Physician Connect, Episodes 2.0 | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network | BPCI-Model2 |    390035 |                                | ROLE_PRM | Patient ID     | Episode DRG Issues |      | St. Luke's Hospital Quakertown Hospital | i am learning path, Learning Pathway 2, max-test-052417, Care Coordination External | St. Lukes Health Network | St. Lukes Health Network--BPCI Model 2 | St. Lukes Health Network--2070-026--Hospital Quakertown Hospital |

  Scenario Outline: Changing General information, Role from <PreviousRole> to <Role> and edit Data permissions
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I verify the header "General Information"
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I fill in Phone with <Phone>
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I unselect "<RemoveApplications>" product
    Then I select "<EnableApplications>" product
    Then I click on Next button
    Then I click on existing organisation "<Health System>"
    Then I deselect "<RemovePrograms>" programs
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    Then I verify last name "<LastName>"
    Then I verify phone "<Phone>"
    Then I verify enabled "<EnableApplications>"
    Then I verify disabled "<RemoveApplications>"
    Then I verify health system "<Health System>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #Then I click on Hamburger menu on top left of homepage
    #And I verify "<Applications>" in product menu dropdown
    #And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    #And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    #And I switch back to old window
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    #When I click on field-panel-icon button for "<User>-<Role>" user
    #When I click to "BPID" field filter under "Episode Initiator" filter field for "<User>-<Role>" user
    #And I choose "Filter" option from select options of filter field for "<User>-<Role>" user
    #And I should see "<BPID>" in the filter value list for "<User>-<Role>" user
    #And I click on cancel button from filter for "<User>-<Role>" user
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I click on RemedyU tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I switch back to old window
    And I redirect to Remedy connect page
    #And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    #And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | User        | UserName                               | Password | FirstName       | LastName       | Email                            | Phone        | NPI | PreviousRole              | Role              | EnableApplications | RemoveApplications | Applications | ApplicationsNotVisible                     | Health System                      | RemovePrograms           | Programs    | Locations                                                     | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName         | BPID | Facilities                                | ProgramsValidation                               | LocationsValidation                                                                                                                   | LearningPathway                                                                                                                                                                                                                                          |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameEdited | LastNameEdited | qaautomation@remedypartners.com2 | 996-385-2451 |     | Transitional Case Manager | Remedy Sales Team | TCI                | Reports            | TCI, Lessons | Administration, Physician Connect, Reports | United Health Services of New York | BPCI-Model3, BPCI-Model2 | BPCI-Model2 | 6005-197--United Health Services, 6005-200--Cape Cod Hospital |                                | ROLE_TCS | Patient ID     | Episode DRG Issues |      | United Health Services, Cape Cod Hospital | United Health Services of New York--BPCI Model 2 | United Health Services of New York--6005-197--United Health Services, United Health Services of New York--6005-200--Cape Cod Hospital | i am learning path, Learning Pathway 2, max-test-052417, New learning Path, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University |

  Scenario Outline: Remove phone, Role from <PreviousRole> to <Role> add new org
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    And I fill in Phone with <Phone>
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I click on Next button
    Then I click Add Organization button for "<HasHealthSystem2>" flag
    And I search for health system with <Health System2>
    And I select a <Health System2>
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    Then I verify phone "<PhoneValidation>"
    Then I verify enabled "<EnableApplications>"
    Then I verify health system "<Health System2>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #Then I click on Hamburger menu on top left of homepage
    #And I verify "<Applications>" in product menu dropdown
    #And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    #And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    #And I switch back to old window
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    #When I click on field-panel-icon button for "<User>-<Role>" user
    #When I click to "BPID" field filter under "Episode Initiator" filter field for "<User>-<Role>" user
    #And I choose "Filter" option from select options of filter field for "<User>-<Role>" user
    #And I should see "<BPID>" in the filter value list for "<User>-<Role>" user
    #And I click on cancel button from filter for "<User>-<Role>" user
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I click on RemedyU tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I switch back to old window
    And I redirect to Remedy connect page
    #And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    #And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | User        | FirstName | LastName | PreviousRole      | Role       | Phone      | PhoneValidation | NPI | EnableApplications          | Applications               | ApplicationsNotVisible       | Email                            | HasHealthSystem2 | Health System2 | Programs    | Locations                        | Roletext       | ReportCategory | ReportName         | BPID | HealthSystemValidation                         | ProgramsValidation                                                         | LocationsValidation                                                                                                                                                                 | Facilities                                                        | LearningPathway                                                                                          |
      | Super Admin | FirstName | LastName | Remedy Sales Team | Physicians | 9999999999 | 999-999-9999    | NPI | Physician Connect, Episodes | Episodes, Reports, Lessons | Episodes 2.0, Administration | qaautomation@remedypartners.com2 | Yes              | TeamHealth     | BPCI-Model2 | 2070-g14--North Shore Med Center | ROLE_CLINICIAN | Patient ID     | Episode DRG Issues |      | TeamHealth, United Health Services of New York | TeamHealth--BPCI Model 2, United Health Services of New York--BPCI Model 2 | TeamHealth--2070-g14--North Shore Med Center, United Health Services of New York--6005-197--United Health Services, United Health Services of New York--6005-200--Cape Cod Hospital | North Shore Med Center, United Health Services, Cape Cod Hospital | i am learning path, Learning Pathway 2, max-test-052417, Clinical Operations Acute Care Hospital Model 2 |

  Scenario Outline: Edit phone, Role from <PreviousRole> to <Role> and Remove Existing Location and Add new Location
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    And I fill in Phone with <Phone>
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I select "<EnableApplications>" product
    Then I click on Next button
    Then I click on existing organisation "<Health System>"
    Then I select "<DisableLocations>" locations
    Then I select location by BPID "<EnableLocations>"
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    Then I verify phone "<PhoneValidation>"
    Then I verify enabled "<EnableApplications>"
    Then I verify health system "<Health System>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"
    And I click on the top user account link
    Then I click on "Log Out" button
    Given I am on the login page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I verify "<Applications>" product on SPOE page
    Then I verify "<ApplicationsNotVisible>" product is not visible on SPOE page
    #Then I click on Hamburger menu on top left of homepage
    #And I verify "<Applications>" in product menu dropdown
    #And I verify "<ApplicationsNotVisible>" is not present in product menu dropdown
    #And I redirect to Remedy connect page
    And I click on Episode1 tile for "<User>-<Role>" user
    #And I switch to new window
    And I verify "Dashboard" after redirection to EC1 for "<User>-<Role>" user
    And I click on username icon on right top corner "<User>-<Role>" and open user profile on EC1
    And I verify "<Facilities>" facility on user profile for "<User>-<Role>" user
    And I verify "Not Associated" payer on user profile for "<User>-<Role>" user
    And I verify "Medicare" payer on user profile for "<User>-<Role>" user
    And I should not see "Emblem" payer on user profile for "<User>-<Role>" user
    And I click on PatientList on SideMenu bar Episode1 for "<User>-<Role>" user
    And I verify Patient card appearing on Active Patients page for "<User>-<Role>" user
    And I click on gear menu and then click on Add Note and verify user role "<Roletext>" for "<User>-<Role>" user
    #And I switch back to old window
    And I click on Reports tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Reports homepage
    And I click on the Reports Tile with text "<ReportCategory>" for "<User>-<Role>" user
    Then I click on "<ReportName>" report text for Overall Program Reports for "<User>-<Role>" user
    Then I verify "<ReportName>" on the reports main page for "<User>-<Role>" user
    #When I click on field-panel-icon button for "<User>-<Role>" user
    #When I click to "BPID" field filter under "Episode Initiator" filter field for "<User>-<Role>" user
    #And I choose "Filter" option from select options of filter field for "<User>-<Role>" user
    #And I should see "<BPID>" in the filter value list for "<User>-<Role>" user
    #And I click on cancel button from filter for "<User>-<Role>" user
    And I redirect to Remedy connect page
    And I click on Episodes 2 tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to Episodes 2 homepage
    And I verify patient card appearing on Episode 2 for "<User>-<Role>" user
    And I click on RemedyU tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to RemedyU homepage
    And I verify details "<FirstName> <LastName>" for "<User>-<Role>" user on RemedyU dashboard
    And I verify learning pathway "<LearningPathway>" appearing for "<User>-<Role>" user on RemedyU dashboard
    And I switch back to old window
    And I redirect to Remedy connect page
    #And I click on Gainsharing Physician Survey tile for "<User>-<Role>" user
    #And I verify "<User>-<Role>" user navigated to Gainsharing Physician Survey homepage
    #And I redirect to Remedy connect page
    And I click on User Admin tile for "<User>-<Role>" user
    And I verify "<User>-<Role>" user navigated to User Admin homepage
    And I redirect to Remedy connect page
    And I click on Institute tile for "<User>-<Role>" user
    And I switch to new window
    And I verify "<User>-<Role>" user navigated to Institute homepage
    And I switch back to old window
    And I click on the top user account link on remedy connect page
    And I verify "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify "Reset Password" in dropdown on profile icon for "<Role>" user
    And I verify "Log Out" in dropdown on profile icon for "<Role>" user
    And I click on "Support" in dropdown on profile icon for "<User>-<Role>" user
    And I verify page header "Login" for "Support" on Remedy Connect for "<User>-<Role>" user
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "We have sent you an e-mail with a link to reset your password."
    And I click Okay button for reset password popup
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | User        | FirstName | LastName | PreviousRole | Role                           | Phone      | PhoneValidation | NPI | EnableApplications                | Applications                                                  | Email                            | Health System                      | Programs                 | DisableLocations                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | EnableLocations                                                            | Roletext   | ReportCategory | ReportName         | BPID | Facilities                                                                                                                                                                                                                                                                       | ProgramsValidation                                                                                                                                                                                                                 | LocationsValidation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | LearningPathway                                                                                                               |
      | Super Admin | FirstName | LastName | Remedy PM    | Remedy Technical Administrator | 9999999999 | 999-999-9999    |     | Physician Connect, Administration | Episodes, Episodes 2.0, Reports, Administration, TCI, Lessons | qaautomation@remedypartners.com2 | United Health Services of New York | BPCI-Model2, BPCI-Model3 | 6005-197--United Health Services, 6005-197--Binghamton General, 6005-198--Chenango Memorial Hospital, 6005-200--Avera Mckennan Hospital & University Health Center, 6005-200--Westchester General Hospital , 6005-200--Cayuga Medical Center At Ithaca, 6005-200--Cape Cod Hospital, 6005-200--St  Vincent, 6005-200--White Plains Hospital Center, 6005-200--North Central Bronx Hospital, 6005-200--Saratoga Hospital, 6005-200--Moses Taylor Hospital, 6005-200--Banner Del E Webb Medical Center, 6005-200--161395906, 6005-200--St. James Mercy Hospital, 6005-200--University Hospital, 6005-200--Cortland Regional Medical Center, 6005-200--Hackettstown Regional Medical Center, 6005-200--St Johns Regional Medical Center, 6005-200--Bayhealth - Kent General Hospital, 6005-200--Howard County General Hospital, 6005-200--Porter Regional Hospital, 6005-200--Arnot Ogden Medical Center, 6005-200--St. Peter's Hospital, 6005-200--Chenango Memorial Hospital, 6005-200--United Health Services, 6005-200--Washington Hospital, 6005-200--Geisinger - Community Medical Center, 6005-200--Scripps Memorial Hospital - Encinitas, 6005-200--Mary Imogene Bassett Hospital, 6005-200--Our Lady Of Lourdes Memorial Hospital, 6005-200--Queens Hospital Center, 6005-200--Tlc Health Network, 6005-200--Menifee Valley Medical Center, 6005-200--Sisters Of Charity Hospital, 6005-200--Albany Medical Center Hospital, 6005-200--Aurelia Osborn Fox Memorial Hospital, 6005-200--Lane Regional Medical Center, 6005-200--Brookhaven Memorial Hospital Medical Center, 6005-200--Banner Boswell Medical Center, 6005-200--Hemet Valley Medical Center, 6005-200--Binghamton General, 6005-200--Albany Memorial Hospital, 6005-200--East Jefferson General Hospital, 3090-209--Uhs Twin Tier Home Health Inc. | 6005-197--United Health Services, 3090-209--Uhs Twin Tier Home Health Inc. | ROLE_ADMIN | Patient ID     | Episode DRG Issues |      | Carolinas Hospital System - Florence, Howard County General Hospital, East Orange General Hospital, Meritus Medical Center, North Shore University Hospital, St. Michael's Medical Center, Saint Barnabas Medical Center, United Health Services, UHS Twin Tier Home Health Inc. | Cardiovascular Associates of The Delaware Valley--BPCI Model 2, Cardiovascular Associates of The Delaware Valley--BPCI Model 3, United Health Services of New York--BPCI Model 2, United Health Services of New York--BPCI Model 3 | United Health Services of New York--3090-209--Uhs Twin Tier Home Health Inc., Cardiovascular Associates of The Delaware Valley--2070-060--Carolinas Hospital System - Florence, Cardiovascular Associates of The Delaware Valley--3056-a08--Howard County General Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--East Orange General Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--Meritus Medical Center, Cardiovascular Associates of The Delaware Valley--3056-a08--North Shore University Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--St. Michael's Medical Center, Cardiovascular Associates of The Delaware Valley--3056-a08--Saint Barnabas Medical Center, United Health Services of New York--6005-197--United Health Services | Learning Pathway 2, New learning Path, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2 |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I verify the header "General Information"
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I enter Phone field with <Phone>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    And I switch the focus to Next button
    Then I verify the validation message "<ValidationMsg>" on Create User Page

    Examples: 
      | Description                                           | User        | FirstName  | LastName   | Email                            | Phone      | Role       | NPI        | ValidationMsg                     |
      | Verify validation message for blank First name        | Super Admin |            | Last Name  | qaautomation@remedypartners.com2 | 9874563210 | Executive  |            | First Name is required            |
      | Verify validation message for blank Last name         | Super Admin | First Name |            | qaautomation@remedypartners.com2 | 9874563210 | Executive  |            | Last Name is required             |
      | Verify validation message for blank NPI               | Super Admin | First Name | Last Name  | qaautomation@remedypartners.com2 | 9874563210 | Physicians |            | NPI is required                   |
      | Verify validation message for invalid Phone           | Super Admin | First Name | Last Name  | qaautomation@remedypartners.com2 |     123564 | Physicians | NPI        | Please enter a valid phone number |
      | Verify validation message for NPI less than 10 digits | Super Admin | First Name | Last Name  | qaautomation@remedypartners.com2 | 9874563210 | Physicians |     123564 | Please enter a valid NPI          |
      | Verify validation message for NPI as alphabets        | Super Admin | First Name | Last Name  | qaautomation@remedypartners.com2 | 9874563210 | Physicians | abcdefgihj | Please enter a valid NPI          |
      | Verify validation message for NPI as alphanumeric     | Super Admin | First Name | Last Name  | qaautomation@remedypartners.com2 | 9874563210 | Physicians | abcde12345 | Please enter a valid NPI          |
      | Verify validation message for invalid First Name      | Super Admin | 8473827919 | Last Name  | qaautomation@remedypartners.com2 | 9874563210 | Physicians | NPI        | Please enter a valid name         |
      | Verify validation message for invalid Last name       | Super Admin | First Name | 8473827919 | qaautomation@remedypartners.com2 | 9874563210 | Physicians | NPI        | Please enter a valid name         |

  Scenario Outline: Verify auto selected programs in Organizations
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I verify the header "Permissions"
    Then I select already selected "<Health System>"
    Then I verify default program "BPCI-Model2" associated with organization

    Examples: 
      | User        | Role       | Health System     |
      | Super Admin | Remedy TCS | Stamford Hospital |

  Scenario Outline: Verify the functionality of back/Cancel button
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I verify the header "General Information"
    And I fill in First Name with "First Name"
    Then I fill in Last Name with LastName
    Then I click on Next button
    Then I verify the header "Applications"
    Then I click on "General Information" tab on the left
    Then I verify the header "General Information"
    Then I click on "Applications" tab on the left
    Then I verify the header "Applications"
    Then I click on "Permissions" tab on the left
    Then I verify the header "Permissions"
    Then I click on Back button
    Then I verify the header "Applications"
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I click on "General Information" tab on the left
    Then I verify the header "General Information"
    When I click the Organizational Role Field to edit
    Then I pick a Organizational Manager
    Then I click on "Applications" tab on the left
    Then I verify the header "Applications"
    Then I click on Next button
    Then I verify the header "Permissions"
    Then I click Add Organization button for "<HasHealthSystem2>" flag
    And I search for health system with TeamHealth
    And I select a TeamHealth
    Then I click on Cancel button
    And I verify that I am navigated to user page
    Then I verify role "<Role>"

    Examples: 
      | User        | Role      | HasHealthSystem2 |
      | Super Admin | Executive | Yes              |

  Scenario Outline: Verify applications on changing role
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I verify the header "General Information"
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role1>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<ApplicationsUnchecked1>" are unchecked
    Then I verify applications "<ApplicationsChecked1>" are checked
    Then I click on "General Information" tab on the left
    Then I verify the header "General Information"
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role2>
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<ApplicationsUnchecked2>" are unchecked
    Then I verify applications "<ApplicationsChecked2>" are checked

    Examples: 
      | User        | PreviousRole | Role1                          | ApplicationsChecked1       | ApplicationsUnchecked1                               | Role2             | ApplicationsChecked2 | ApplicationsUnchecked2 |
      | Super Admin | Executive    | Remedy Technical Administrator | Reports, Episodes, Lessons | Episodes 2.0, Physician Connect, Administration, TCI | Remedy Sales Team | Lessons, Reports     | TCI                    |

  Scenario Outline: Invalid Health system and invalid location validation
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I click Add Organization button for "<HasHealthSystem2>" flag
    And I search for health system with <InvalidHealthSystem>
    And I verify No results found for invalid health system
    Then I click on Select dropdown
    And I search for health system with <Health System2>
    And I select a <Health System2>
    Then I select "<Programs2>" programs
    Then I select "<invalidLocations>" invalid locations
    And I verify No results found for invalid Location for "second" organisation
    Then I click on existing organisation "<Health System2>"
    Then I verify incomplete status for health system

    Examples: 
      | User        | Role    | HasHealthSystem2 | InvalidHealthSystem | Health System2 | Programs2   | invalidLocations |
      | Super Admin | Manager | Yes              | hdvb                | Avalon         | BPCI-Model3 | hkfj             |

  Scenario Outline: Remove selected locations and then remove the org
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System>"
    Then I select "<DisableLocations>" locations
    Then I remove health system "<Health System>"
    And I click on "Remove" button on permissions tab
    Then I click on Submit button while edit for "<User>-<Role>"

    Examples: 
      | User        | Role      | Health System | DisableLocations                         |
      | Super Admin | Remedy RN | TeamHealth    | 3056-q91--The Medical Center At Franklin |

  Scenario Outline: Verify the search functionality in selected locations and delete a location
    Given I am on the login page
    When I enter email field lbarinstein+qaadmin@remedypartners.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I verify the header "Permissions"
    Then I click on existing organisation "<Health System>"
    And I verify selected Location "<SelectedLocations>" in the selected Locations section
    Then I search the "<Locations>" in the Selected Locations section
    Then I verify facility key "<facilityKey>" is displayed with location name "Fairbanks Memorial Hospital"
    And I click on remove link icon for selected Locations on selected Locations section
    And I verify Selected Locations section after click on remove link icon

    Examples: 
      | User        | UserName                               | Password | Role      | Health System    | SelectedLocations                    | Locations                             | facilityKey |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | Executive | Sound Physicians | Fairbanks Memorial Hospital (020012) | 6005-063--Fairbanks Memorial Hospital |      020012 |

  Scenario Outline: Changing role from physician to Manager then back to Physicians
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<PreviousRole>"
    Then I select user with role "<User>-<PreviousRole>"
    And I verify that I am navigated to user page
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI1>" for role "<Role>"
    Then I click on Next button
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<Role>--<PreviousRole>"
    Then I verify role "<Role>"
    And I click on Edit button
    When I click the Organizational Role Field to edit
    Then I pick a Organizational <PreviousRole>
    Then I enter NPI field with "<NPI2>" for role "<PreviousRole>"
    Then I click on Next button
    Then I click on Next button
    Then I click on Submit button while edit for "<User>-<PreviousRole>--<Role>"
    Then I verify role "<PreviousRole>"

    Examples: 
      | User        | UserName                               | Password | Email                            | NPI1 | NPI2 | PreviousRole | Role    | EnableApplications | Applications                                                     | ApplicationsNotVisible       | LearningPathwaySearchParameter | Roletext | ReportCategory | ReportName                   | BPID | LearningPathway                                                                                                                       | FirstName | LastName | Facilities        |
      | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | qaautomation@remedypartners.com2 |      | NPI  | Physicians   | Manager |                    | Episodes, Reports, Physician Connect, Lessons, Physician Connect | Administration, Episodes 2.0 |                                | ROLE_PRM | Patient ID     | Episode DRG Issues [Model 3] |      | i am learning path, Learning Pathway 2, max-test-052417, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2 | FirstName | LastName | Apple - Watertown |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System1>"
    Then I deselect "<RemoveLocations1>" locations
    Then I select "<AddLocations1>" locations
    Then I click on existing organisation "<Health System2>"
    Then I deselect "<RemoveLocations2>" locations
    Then I select "<AddLocations2>" locations
    Then I click on existing organisation "<Health System3>"
    Then I deselect "<RemoveLocations3>" locations
    Then I select "<AddLocations3>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify health system "<Health System_Validation>"
    Then I verify programs "<ProgramsValidation>"
    Then I verify location "<LocationsValidation>"

    Examples: 
      | Description                                   | User        | Role                         | Email                            | Health System1 | RemoveLocations1              | AddLocations1 | Health System2   | RemoveLocations2            | AddLocations2                      | Health System3                                       | RemoveLocations3                                                                         | AddLocations3 | Health System_Validation                                                       | ProgramsValidation                                                                                                                                                                                                                                 | LocationsValidation                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | Editing data permissions for user with 3 orgs | Super Admin | Remedy Program Administrator | qaautomation@remedypartners.com2 | TeamHealth     | 3056-q91--Rhea Medical Center |               | Sound Physicians | 6005-059--Evanston Hospital | 6005-072--Jackson North Med Center | Cardiovascular Associates of The Delaware Valley,p A | 3056-a08--Saint Barnabas Medical Center , 2070-060--Carolinas Hospital System - Florence |               | TeamHealth, Sound Physicians, Cardiovascular Associates of The Delaware Valley | TeamHealth--BPCI Model 2, TeamHealth--BPCI Model 3, Sound Physicians--BPCI Model 2, Sound Physicians--BPCI Model 3, Cardiovascular Associates of The Delaware Valley--BPCI Model 2, Cardiovascular Associates of The Delaware Valley--BPCI Model 3 | TeamHealth--2070-g14--North Shore Med Center, TeamHealth--3056-q91--The Medical Center At Franklin, Sound Physicians--6005-059--Presence Saint Joseph Medical Center, Sound Physicians--6005-072--Jackson North Med Center, Sound Physicians--3056-b75--Warren Memorial Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--East Orange General Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--St Lukes Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Community Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Kennedy Univ Hospital - Stratford And Cherry Hills, Cardiovascular Associates of The Delaware Valley--2070-060--Capital Health Medical Center - Hopewell, Cardiovascular Associates of The Delaware Valley--2070-060--Bayshore Community Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Rwj University Hospital At New Brunswick, Cardiovascular Associates of The Delaware Valley--2070-060--Kennedy Memorial Washington Township, Cardiovascular Associates of The Delaware Valley--2070-060--Raritan Bay Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Holmes Regional Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Sebastian River Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Lenox Hill Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Lewistown Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--St. Michael, Cardiovascular Associates of The Delaware Valley--2070-060--Jackson-, Cardiovascular Associates of The Delaware Valley--2070-060--Newark Beth Israel Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Inova Fairfax Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Lourdes Rehab At Camden, Cardiovascular Associates of The Delaware Valley--2070-060--Mercy Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Hackensack University Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Tuomey Healthcare System, Cardiovascular Associates of The Delaware Valley--2070-060--223321233, Cardiovascular Associates of The Delaware Valley--2070-060--Martin Memorial South, Cardiovascular Associates of The Delaware Valley--2070-060--Lourdes Medical Center Of Burlington County, Cardiovascular Associates of The Delaware Valley--2070-060--North Shore University Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Virtua Marlton, Cardiovascular Associates of The Delaware Valley--2070-060--Cooper University Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Virtua Voorhees, Cardiovascular Associates of The Delaware Valley--2070-060--Virtua West Jersey Hospitals Berlin, Cardiovascular Associates of The Delaware Valley--2070-060--Howard County General Hospital, Cardiovascular Associates of The Delaware Valley--2070-060--Meritus Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Wuesthoff Medical Center  Rockledge, Cardiovascular Associates of The Delaware Valley--2070-060--Wuesthoff Medical Center - Melbourne, Cardiovascular Associates of The Delaware Valley--2070-060--Saint Peter, Cardiovascular Associates of The Delaware Valley--2070-060--Martin Memorial North, Cardiovascular Associates of The Delaware Valley--2070-060--Jersey Shore University Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Mount Nittany Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Deborah Heart And Lung Center, Cardiovascular Associates of The Delaware Valley--2070-060--Inspira Medical Center Vineland, Cardiovascular Associates of The Delaware Valley--2070-060--Regional Hospital Of Jackson, Cardiovascular Associates of The Delaware Valley--2070-060--Saint Barnabas Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Martin Memorial West, Cardiovascular Associates of The Delaware Valley--2070-060--Riverview Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--310034-REH, Cardiovascular Associates of The Delaware Valley--2070-060--Inspira Medical Center Elmer, Cardiovascular Associates of The Delaware Valley--2070-060--Novant Health Prince William Medical Center, Cardiovascular Associates of The Delaware Valley--2070-060--Our Lady Of Lourdes Medical Center - Camden, Cardiovascular Associates of The Delaware Valley--2070-060--Jfk Medical Ctr - Anthony M. Yelencsics Community, Cardiovascular Associates of The Delaware Valley--3056-a08--Howard County General Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--East Orange General Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--Meritus Medical Center, Cardiovascular Associates of The Delaware Valley--3056-a08--North Shore University Hospital, Cardiovascular Associates of The Delaware Valley--3056-a08--St. Michael |

  Scenario Outline: Validating- all locations should not be displayed as selected when the "All Locations" check box is unchecked while editing the user
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I click on existing organisation "<Health System>"
    Then I select "<AddLocations>" locations
    Then I deselect "<AddLocations>" locations
    And I verify selected Location "<SelectedLocations>" are not shown in selected Locations section

    Examples: 
      | User        | Role      | Health System    | AddLocations  | SelectedLocations                  |
      | Super Admin | Executive | Sound Physicians | All Locations | Advocate Trinity Hospital (140048) |

  Scenario Outline: <Description>
    Given I am on the login page
    When I log in as super user
    Then I should see Tile text Users
    And I click on the "Users" tile
    Then I should see header text "Users"
    Then I search for user with role "<User>-<Role>"
    Then I select user with role "<User>-<Role>"
    And I verify that I am navigated to user page
    And I click on Edit button
    Then I select "Permissions" tab
    Then I remove health system "<Remove HealthSystem>"
    And I click on "Remove" button on permissions tab
    And I search for health system with <Health System>
    And I select a <Health System>
    Then I select "<Programs>" programs
    Then I select "<Locations>" locations
    Then I click on Submit button while edit for "<User>-<Role>"
    Then I verify error message "User does not exist. Please go back to the users list page." is not displayed

    Examples: 
      | Description                                                                                         | User        | Role      | Remove HealthSystem | Health System                                                          | Programs    | Locations     |
      | Error message "User does not exist. Please go back to the users list page." should not be displayed | Super Admin | Executive | Sound Physicians    | St. Lukes Health Network, Inc. DBA St. Lukes University Health Network | BPCI-Model2 | All Locations |
