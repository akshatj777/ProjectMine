Feature: Super Admin Create user with Medicare and Product tile verification on Create user page and on Login with created user

  Background: Login with predefined user on Gmail account and delete the previous mail
    Given I am on mail login page
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I click on select all checkbox in mail
    Then I click on delete icon in mail 
    Then I signout form mail account

  Scenario Outline: Super Admin create all User and verifies the Product tile appearing on login as per selected user role
    Given I am on the login page
    When I log in as super user
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
      | Role                            | lastName                        | HealthSystem Search | Health System     | Provider | Phone        | payer    | NPI        | Episode1 | RemedyU | Reports | Episode2     | Institute | Physican connect             | Administration | userroletext   | Internal Support | Support |
      | Remedy Technical Administrator  | Remedy Technical Administrator  | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute | Gainsharing Physician Survey | User Admin     | ROLE_ADMIN     | Internal Support | Support |
      | Executive                       | Executive                       | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_PRM       | Internal Support | Support |
      | Manager                         | Manager                         | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_PRM       |                  | Support |
      | Case Manager                    | Case Manager                    | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_TCS       |                  | Support |
      | Physicians                      | Physicians                      | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare | 1234567890 | Episodes | RemedyU | Reports | Episodes 2.0 | Institute | Gainsharing Physician Survey |                | ROLE_CLINICIAN |                  | Support |
      | Remedy TCS                      | Remedy TCS                      | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_TCS       | Internal Support | Support |
      | Remedy LPN                      | Remedy LPN                      | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_LPN       | Internal Support | Support |
      | Remedy RN                       | Remedy RN                       | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_RN        | Internal Support | Support |
      | Remedy Field RN                 | Remedy Field RN                 | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_FRN       | Internal Support | Support |
      | Remedy PM                       | Remedy PM                       | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_PM        | Internal Support | Support |
      | Remedy Sales Team               | Remedy Sales Team               | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            |          | RemedyU | Reports |              | Institute |                              |                |                | Internal Support |         |
      | Remedy Executive                | Remedy Executive                | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute |                              |                | ROLE_PM        | Internal Support | Support |
      | Prospective Partner Executive   | Prospective Partner Executive   | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            |          | RemedyU |         |              | Institute |                              |                |                |                  |         |
      | Remedy Other                    | Remedy Other                    | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU |         | Episodes 2.0 | Institute |                              |                | ROLE_PRM       | Internal Support | Support |
      | Partner Program Administrator   | Partner Program Administrator   | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute | Gainsharing Physician Survey |                | ROLE_PRM       | Internal Support | Support |
      | Remedy Program Administrator    | Remedy Program Administrator    | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute | Gainsharing Physician Survey |                | ROLE_PRM       | Internal Support | Support |
      | Partner Technical Administrator | Partner Technical Administrator | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports | Episodes 2.0 | Institute | Gainsharing Physician Survey | User Admin     | ROLE_PM        | Internal Support | Support |
      | Transitional Case Manager       | Transitional Case Manager       | Stamford            | Stamford Hospital | *        | 302-459-1143 | Medicare |            | Episodes | RemedyU | Reports |              | Institute |                              |                | ROLE_TCS       |                  | Support |
      | Downstream Provider             | Downstream Provider             |                     |                   |   495204 | 302-459-1143 |          |            | Episodes |         |         | Episodes 2.0 | Institute |                              |                |                |                  | Support |

  Scenario Outline: Super Admin create User with different health system, provider and few product tiles and verifies the Product tiles on login as per selected user role
    Given I am on the login page
    When I log in as super user
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
    Then I should see Tile text <RemedyU>
    Then I should see Tile text <Reports>
    Then I should see Tile text <Administration>
    Then I should see Tile text <Episode2>
    Then I should see Tile text <Physican connect>
    Then I should see Tile text <Institute>
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
      | Role                            | lastName                        | HealthSystem Search      | Health System            | Provider | Facility                                         | Phone        | payer    | NPI        | Label1            | Label2            | Episode1 | RemedyU | Reports | Episode2     | Institute | Physican connect             | Administration | userroletext   | Internal Support | Support |
      | Remedy Technical Administrator  | Remedy Technical Administrator  | Trinity                  | Trinity                  | 2070-c83 | Holy Cross Rehabilitation Institute (100073-REH) | 302-459-1143 | Medicare |            | episode_connect   | physician_portal  | Episodes |         |         |              | Institute | Gainsharing Physician Survey |                | ROLE_ADMIN     |                  | Support |
      | Executive                       | Executive                       | Stamford                 | Stamford Hospital        | 2070-015 | Stamford Hospital (TSH)                          | 302-459-1143 | Medicare |            | episode_connect   | episode_connect_2 | Episodes |         |         | Episodes 2.0 | Institute |                              |                | ROLE_PRM       |                  | Support |
      | Manager                         | Manager                         | St. Lukes Health Network | St. Lukes Health Network | *        |                                                  | 302-459-1143 | Medicare |            | reports           | episode_connect_2 |          |         | Reports | Episodes 2.0 | Institute |                              |                | ROLE_PRM       |                  | Support |
      | Case Manager                    | Case Manager                    | St. Lukes Health Network | St. Lukes Health Network | 2070-023 | Allentown (A)                                    | 302-459-1143 | Medicare |            | reports           | episode_connect_2 |          |         | Reports | Episodes 2.0 | Institute |                              |                | ROLE_TCS       |                  | Support |
      | Physicians                      | Physicians                      | Stamford                 | Stamford Hospital        | 2070-015 | Stamford Hospital (TSH)                          | 302-459-1143 | Medicare | 1234567890 | reports           | episode_connect_2 |          |         | Reports | Episodes 2.0 | Institute |                              |                | ROLE_CLINICIAN |                  | Support |
      | Remedy TCS                      | Remedy TCS                      | St. Lukes Health Network | St. Lukes Health Network | 2070-023 | Allentown (A)                                    | 302-459-1143 | Medicare |            | internal_support  | lessons           |          | RemedyU |         |              | Institute |                              |                | ROLE_TCS       | Internal Support |         |
      | Remedy LPN                      | Remedy LPN                      | St. Lukes Health Network | St. Lukes Health Network | *        |                                                  | 302-459-1143 | Medicare |            | internal_support  | lessons           |          | RemedyU |         |              | Institute |                              |                | ROLE_LPN       | Internal Support |         |
      | Remedy RN                       | Remedy RN                       | Hackensack               | Hackensack               | 2070-005 | Hackensack University Medical Center (HUMC)      | 302-459-1143 | Medicare |            | internal_support  | lessons           |          | RemedyU |         |              | Institute |                              |                | ROLE_RN        | Internal Support |         |
      | Remedy Field RN                 | Remedy Field RN                 | St. Lukes Health Network | St. Lukes Health Network | 2070-023 | Allentown (A)                                    | 302-459-1143 | Medicare |            | tci               | episode_connect   | Episodes |         |         |              | Institute |                              |                | ROLE_FRN       |                  | Support |
      | Remedy PM                       | Remedy PM                       | Hackensack               | Hackensack               | 2070-005 | Hackensack University Medical Center (HUMC)      | 302-459-1143 | Medicare |            | tci               | episode_connect   | Episodes |         |         |              | Institute |                              |                | ROLE_PM        |                  | Support |
      | Remedy Sales Team               | Remedy Sales Team               | St. Lukes Health Network | St. Lukes Health Network | *        |                                                  | 302-459-1143 | Medicare |            | reports           | tci               |          |         | Reports |              | Institute |                              |                |                |                  |         |
      | Remedy Executive                | Remedy Executive                | Stamford                 | Stamford Hospital        | 2070-015 | Stamford Hospital (TSH)                          | 302-459-1143 | Medicare |            | episode_connect   | episode_connect_2 | Episodes |         |         | Episodes 2.0 | Institute |                              |                | ROLE_PM        |                  | Support |
      | Prospective Partner Executive   | Prospective Partner Executive   | Stamford                 | Stamford Hospital        | *        |                                                  | 302-459-1143 | Medicare |            | lessons           |                   |          | RemedyU |         |              | Institute |                              |                |                |                  |         |
      | Remedy Other                    | Remedy Other                    | St. Lukes Health Network | St. Lukes Health Network | 2070-023 | Allentown (A)                                    | 302-459-1143 | Medicare |            | episode_connect_2 | tci               |          |         |         | Episodes 2.0 | Institute |                              |                | ROLE_PRM       |                  | Support |
      | Partner Program Administrator   | Partner Program Administrator   | Hackensack               | Hackensack               | 2070-005 | Hackensack University Medical Center (HUMC)      | 302-459-1143 | Medicare |            | physician_portal  | internal_support  |          |         |         |              | Institute | Gainsharing Physician Survey |                | ROLE_PRM       | Internal Support |         |
      | Remedy Program Administrator    | Remedy Program Administrator    | St. Lukes Health Network | St. Lukes Health Network | *        |                                                  | 302-459-1143 | Medicare |            | physician_portal  | internal_support  |          |         |         |              | Institute | Gainsharing Physician Survey |                | ROLE_PRM       | Internal Support |         |
      | Partner Technical Administrator | Partner Technical Administrator | St. Lukes Health Network | St. Lukes Health Network | 2070-023 | Allentown (A)                                    | 302-459-1143 | Medicare |            | episode_connect   | reports           | Episodes |         | Reports |              | Institute |                              |                | ROLE_PM        |                  | Support |
      | Transitional Case Manager       | Transitional Case Manager       | Stamford                 | Stamford Hospital        | 2070-015 | Stamford Hospital (TSH)                          | 302-459-1143 | Medicare |            | episode_connect   | reports           | Episodes |         | Reports |              | Institute |                              |                | ROLE_TCS       |                  | Support |
      | Downstream Provider             | Downstream Provider             |                          |                          |   004402 | Coram Cvs/specialty Infusion Services (004402)   | 302-459-1143 |          |            |                   | episode_connect   |          |         |         | Episodes 2.0 | Institute |                              |                |                |                  | Support |
