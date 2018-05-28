Feature: Create new User role with RTA and emblem payer and product tiles verification on create user page and on Login of created user

  Background: Login with predefined user on Gmail account and delete the previous mail
    Given I am on mail login page
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I click on select all checkbox in mail
    Then I click on delete icon in mail
    Then I signout form mail account

  Scenario Outline: Remedy Technical Admin can create user and verify product tiles after login and navigation of different tiles
    Given I am on the login page
    When I enter email field autortauser@mailinator.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "User Management"
    When I click on Create User button
    Then I should see "Create User" on the user creation page
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    And I fill in First Name with "Newuser"
    Then I fill in Last Name with <lastName>
    And I enter Email to Create user
    Then I enter Phone field with <Phone>
    And I enter NPI field with <NPI>
    When I click the payer Field under data
    Then I pick payer type from data section <payer>
    And I click on Health System field
    And I search for health system with <HealthSystem Search>
    And I select a <Health System>
    When I enter <Provider> search text
    Then I click the select all Facilites checkbox for the provider
    Then I select all the application for the role
    And I turn off the share file application
    And I click on Create button
    And I click on the top user account link
    Then I select Log Out option from the dropdown
    And I should see Log in widget
    Then I open new tab and close the last tab
    #And I switch to new window
    Given I am on mail login page
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I verify Account Verification in Inbox in my account
    Then I click on Account Verification mail in Inbox
    Then I verify "Confirm my account!" link in mail content
    Then I click on "Confirm my account!" link in mail content
    #And I switch to new window
    Then I enter email to generate password link
    And I click on send mail button
    Then I switch back to old window
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change my password" link in mail content
    Then I click on "Change my password" link in mail content
    #And I switch to new window
    And I enter new password "Testing1" to set new password
    And I enter confirm new password "Testing1" to set new password
    And I click on submit button to set new password
    Then I enter newuser email for login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I should see Tile text <Episode1>
    And I should see Tile text <RemedyU>
    And I should see Tile text <Reports>
    And I should see Tile text <Administration>
    And I should see Tile text <Episode2>
    And I should see Tile text <Physican connect>
    And I click on Episode1 tile under specific user login page <Episode1> and verify the userrole <userroletext>
    And I click on Institute tile under specific user login page <Institute>
    And I click on Reports tile under specific user login page <Reports>
    And I click on Episodes two tile under specific user login page <Episode2> with payer <payer>
    And I click on RemedyU tile under specific user login page <RemedyU>
    And I click on Physican connect tile under specific user login page <Physican connect>
    And I click on Internal Support option from dropdown under specific user login page <Internal Support>
    Then I select Support option from the dropdown under specific user login page <Support>
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "Password Reset"
    And I click Okay button for reset password popup
    And I click on the top user account link
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | Role                            | lastName                        | HealthSystem Search | Health System   | Provider | Phone        | payer         | NPI        | Episode1 | RemedyU | Reports | Episode2     | Institute | Physican connect             | Administration | userroletext   | Internal Support | Support |
      | Executive                       | Executive                       | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_PRM       | Internal Support | Support |
      | Manager                         | Manager                         | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_PRM       |                  | Support |
      | Case Manager                    | Case Manager                    | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_TCS       |                  | Support |
      | Physicians                      | Physicians                      | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health | 1234567890 | Episodes | RemedyU | Reports | Episodes 2.0 | Institute | Gainsharing Physician Survey |                | ROLE_CLINICIAN |                  | Support |
      | Remedy TCS                      | Remedy TCS                      | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_TCS       | Internal Support | Support |
      | Remedy LPN                      | Remedy LPN                      | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_LPN       | Internal Support | Support |
      | Remedy RN                       | Remedy RN                       | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_RN        | Internal Support | Support |
      | Remedy Field RN                 | Remedy Field RN                 | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_FRN       | Internal Support | Support |
      | Remedy PM                       | Remedy PM                       | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_PM        | Internal Support | Support |
      | Remedy Sales Team               | Remedy Sales Team               | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            |          | RemedyU | Reports |              | Institute |                              |                |                | Internal Support |         |
      | Remedy Executive                | Remedy Executive                | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_PM        | Internal Support | Support |
      | Prospective Partner Executive   | Prospective Partner Executive   | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            |          | RemedyU |         |              | Institute |                              |                |                |                  |         |
      | Remedy Other                    | Remedy Other                    | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU |         | Episodes 2.0 | Institute |                              |                | ROLE_PRM       | Internal Support | Support |
      | Partner Program Administrator   | Partner Program Administrator   | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute | Gainsharing Physician Survey |                | ROLE_PRM       | Internal Support | Support |
      | Remedy Program Administrator    | Remedy Program Administrator    | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute | Gainsharing Physician Survey |                | ROLE_PRM       | Internal Support | Support |
      | Partner Technical Administrator | Partner Technical Administrator | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute | Gainsharing Physician Survey | User Admin     | ROLE_PM        | Internal Support | Support |
      | Transitional Case Manager       | Transitional Case Manager       | RP Payer Test A     | RP Payer Test A | *        | 302-459-1143 | Emblem Health |            | Episodes | RemedyU | Reports |              | Institute |                              |                | ROLE_TCS       |                  | Support |

  Scenario Outline: Remedy Technical Admin can create user role different health system provider and few product tiles and verification of tiles on user login and navigation of different tiles
    Given I am on the login page
    When I enter email field autortauser@mailinator.com for login
    And I enter password field Testing1 for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "User Management"
    When I click on Create User button
    Then I should see "Create User" on the user creation page
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    And I fill in First Name with "Newuser"
    Then I fill in Last Name with <lastName>
    And I enter Email to Create user
    Then I enter Phone field with <Phone>
    And I enter NPI field with <NPI>
    When I click the payer Field under data
    Then I pick payer type from data section <payer>
    And I click on Health System field
    And I search for health system with <HealthSystem Search>
    And I select a <Health System>
    When I enter <Provider> search text
    Then I select the facility <Facility> checkbox for the <Provider>
    Then I select <Label1> product tile for user creation
    Then I select <Label2> product tile for user creation
    And I click on Create button
    And I click on the top user account link
    Then I select Log Out option from the dropdown
    And I should see Log in widget
    Then I open new tab and close the last tab
    #And I switch to new window
    Given I am on mail login page
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I verify Account Verification in Inbox in my account
    Then I click on Account Verification mail in Inbox
    Then I verify "Confirm my account!" link in mail content
    Then I click on "Confirm my account!" link in mail content
    #And I switch to new window
    Then I enter email to generate password link
    And I click on send mail button
    Then I switch back to old window
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change my password" link in mail content
    Then I click on "Change my password" link in mail content
    #And I switch to new window
    And I enter new password "Testing1" to set new password
    And I enter confirm new password "Testing1" to set new password
    And I click on submit button to set new password
    Then I enter newuser email for login to Remedy
    Then I enter newuser password for login to Remedy
    And I click Access button
    Then I should see Tile text <Episode1>
    Then I should see Tile text <Administration>
    Then I should see Tile text <Episode2>
    Then I should see Tile text <Physican connect>
    And I should see Tile text <RemedyU>
    And I should see Tile text <Reports>
    And I should see Tile text <Institute>
    And I click on Episode1 tile under specific user login page <Episode1> and verify the userrole <userroletext>
    And I click on Institute tile under specific user login page <Institute>
    And I click on Reports tile under specific user login page <Reports>
    And I click on Episodes two tile under specific user login page <Episode2> with payer <payer>
    And I click on RemedyU tile under specific user login page <RemedyU>
    And I click on Physican connect tile under specific user login page <Physican connect>
    And I click on Internal Support option from dropdown under specific user login page <Internal Support>
    Then I select Support option from the dropdown under specific user login page <Support>
    Then I select Reset Password option from the dropdown
    And I should see text popup for reset password "Password Reset"
    And I click Okay button for reset password popup
    And I click on the top user account link
    Then I select Log Out option from the dropdown
    And I should see Log in widget

    Examples: 
      | Role                            | lastName                        | HealthSystem Search | Health System   | Provider | Facility          | Phone        | payer         | NPI        | Label1            | Label2            | Episode1 | RemedyU | Reports | Episode2     | Institute | Physican connect             | Administration | userroletext   | Internal Support | Support |
      | Executive                       | Executive                       | RP Payer Test A     | RP Payer Test A | 7000-000 | Rp Test Hospital2 | 302-459-1143 | Emblem Health |            | episode_connect   | episode_connect_2 | Episodes |         |         | Episodes 2.0 | Institute |                              |                | ROLE_PRM       |                  | Support |
      | Manager                         | Manager                         | RP Payer Test A     | RP Payer Test A | *        |                   | 302-459-1143 | Emblem Health |            | reports           | episode_connect_2 |          |         | Reports | Episodes 2.0 | Institute |                              |                | ROLE_PRM       |                  | Support |
      | Case Manager                    | Case Manager                    | RP Payer Test A     | RP Payer Test A | *        |                   | 302-459-1143 | Emblem Health |            | reports           | episode_connect_2 |          |         | Reports | Episodes 2.0 | Institute |                              |                | ROLE_TCS       |                  | Support |
      | Physicians                      | Physicians                      | RP Payer Test A     | RP Payer Test A | 7000-000 | Rp Test Hospital2 | 302-459-1143 | Emblem Health | 1234567890 | reports           | episode_connect_2 |          |         | Reports | Episodes 2.0 | Institute |                              |                | ROLE_CLINICIAN |                  | Support |
      | Remedy TCS                      | Remedy TCS                      | RP Payer Test A     | RP Payer Test A | 7000-000 | Rp Test Hospital2 | 302-459-1143 | Emblem Health |            | internal_support  | lessons           |          | RemedyU |         |              | Institute |                              |                | ROLE_TCS       | Internal Support |         |
      | Remedy LPN                      | Remedy LPN                      | RP Payer Test A     | RP Payer Test A | *        |                   | 302-459-1143 | Emblem Health |            | internal_support  | lessons           |          | RemedyU |         |              | Institute |                              |                | ROLE_LPN       | Internal Support |         |
      | Remedy RN                       | Remedy RN                       | RP Payer Test A     | RP Payer Test A | 7000-000 | Rp Test Hospital2 | 302-459-1143 | Emblem Health |            | internal_support  | lessons           |          | RemedyU |         |              | Institute |                              |                | ROLE_RN        | Internal Support |         |
      | Remedy Field RN                 | Remedy Field RN                 | RP Payer Test A     | RP Payer Test A | *        |                   | 302-459-1143 | Emblem Health |            | tci               | episode_connect   | Episodes |         |         |              | Institute |                              |                | ROLE_FRN       |                  | Support |
      | Remedy PM                       | Remedy PM                       | RP Payer Test A     | RP Payer Test A | 7000-000 | Rp Test Hospital2 | 302-459-1143 | Emblem Health |            | tci               | episode_connect   | Episodes |         |         |              | Institute |                              |                | ROLE_PM        |                  | Support |
      | Remedy Sales Team               | Remedy Sales Team               | RP Payer Test A     | RP Payer Test A | *        |                   | 302-459-1143 | Emblem Health |            | reports           | tci               |          |         | Reports |              | Institute |                              |                |                |                  |         |
      | Remedy Executive                | Remedy Executive                | RP Payer Test A     | RP Payer Test A | 7000-000 | Rp Test Hospital2 | 302-459-1143 | Emblem Health |            | episode_connect   | episode_connect_2 | Episodes |         |         | Episodes 2.0 | Institute |                              |                | ROLE_PM        |                  | Support |
      | Prospective Partner Executive   | Prospective Partner Executive   | RP Payer Test A     | RP Payer Test A | *        |                   | 302-459-1143 | Emblem Health |            | lessons           |                   |          | RemedyU |         |              | Institute |                              |                |                |                  |         |
      | Remedy Other                    | Remedy Other                    | RP Payer Test A     | RP Payer Test A | *        |                   | 302-459-1143 | Emblem Health |            | episode_connect_2 | tci               |          |         |         | Episodes 2.0 | Institute |                              |                | ROLE_PRM       |                  | Support |
      | Partner Program Administrator   | Partner Program Administrator   | RP Payer Test A     | RP Payer Test A | 7000-000 | Rp Test Hospital2 | 302-459-1143 | Emblem Health |            | physician_portal  | internal_support  |          |         |         |              | Institute | Gainsharing Physician Survey |                | ROLE_PRM       | Internal Support |         |
      | Remedy Program Administrator    | Remedy Program Administrator    | RP Payer Test A     | RP Payer Test A | *        |                   | 302-459-1143 | Emblem Health |            | physician_portal  | internal_support  |          |         |         |              | Institute | Gainsharing Physician Survey |                | ROLE_PRM       | Internal Support |         |
      | Partner Technical Administrator | Partner Technical Administrator | RP Payer Test A     | RP Payer Test A | 7000-000 | Rp Test Hospital2 | 302-459-1143 | Emblem Health |            | episode_connect   | reports           | Episodes |         | Reports |              | Institute |                              |                | ROLE_PM        |                  | Support |
      | Transitional Case Manager       | Transitional Case Manager       | RP Payer Test A     | RP Payer Test A | *        |                   | 302-459-1143 | Emblem Health |            | episode_connect   | reports           | Episodes |         | Reports |              | Institute |                              |                | ROLE_TCS       |                  | Support |
