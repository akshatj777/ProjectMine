Feature: Reset and forgot password functionality from UA2 application

  Scenario Outline: Create User through UA API call
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
      | User        | FirstName                                 | LastName                                 | Email                          | Phone | NPI | Role   | RoleID   | Applications                                                                                                       | LearningPathways                       | Locations             | expStatusCode |
      | Super Admin | FirstNameFirstNameFirstNameFirstNameFirst | LastNameLastNameLastNameLastNameLastName | qaautomation@remedysystems.com |       |     | Leader | 1-Leader | episode_connect-Episode Connect Classic, reports-Reporting Classic, lessons-Remedy University, analytics-Reporting | 3hSOHNAnvjc1,NFdw0Kts2C01,n9yn5n0Qa581 | 514083--2070-015--TSH |           200 |

  Scenario Outline: Reset Password: Validating validation message for - <Description>
    Given I am on the login page
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    And I enter password field <Password> for Login
    Then I click Access button
    Then I click on "Reset Password" button from top right corner icon
    Then I click on Okay on reset password confirmation box
    Given I am on mail login page
    Then I enter username "qaautomation@remedysystems.com" to login mail account
    Then I enter password "9h$00v3T$dF@OPn0" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change My Password" link in mail content
    Then I click on "Change My Password" link in mail content
    And I switch to new window
    And I enter new password "<NewPassword>" to set new password
    And I enter confirm new password "<ConfirmPass>" to set new password
    And I click on submit button to set new password
    And I validate the validation message "<ValidationMsg>" for reset password

    Examples: 
      | Description                                               | User        | Role   | Password  | NewPassword | ConfirmPass | ValidationMsg                                                |
      | Password reset successful                                 | Super Admin | Leader | Testing1@ | Testing2    | Testing2    | Remedy Connect                                               |
      | when password and the confirmation password are different | Super Admin | Leader | Testing2  | Testing1$   | Test        | Please ensure the password and the confirmation are the same |
      | When entered password does not meet guidelines            | Super Admin | Leader | Testing2  | test        |             | Password guidelines                                          |

  Scenario Outline: Forgot Password- Forgot password page validation and putting invalid and valid email and logging in with new password
    Given I am on the login page
    Then I click on forgot password link
    Then I verify reset password message "Please enter your email address. We will send you an email to reset your password."
    And I verify Email textbox
    And I verify Send Email button
    And I verify back button on forgot password page
    Then I click on back button on forgot password page
    And I should see Log in widget
    Then I click on forgot password link
    Then I enter email for "<User>-<Role>" to generate password link
    And I click on send mail button
    Given I am on mail login page
    Then I enter username "qaautomation@remedysystems.com" to login mail account
    Then I enter password "9h$00v3T$dF@OPn0" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change My Password" link in mail content
    Then I click on "Change My Password" link in mail content
    And I switch to new window
    And I enter new password "<NewPassword>" to set new password
    And I enter confirm new password "<NewPassword>" to set new password
    And I click on submit button to set new password
    Given I am on the login page
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    And I enter password field <NewPassword> for Login
    Then I click Access button
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    And I enter password field <WrongPassword> for Login
    Then I click Access button
    Then I should see error message for invalid credentials "Wrong email or password."

    Examples: 
      | User        | Role   | NewPassword | WrongPassword |
      | Super Admin | Leader | Testing1    | Testing8      |

  Scenario Outline: Forgot Password- Validating validation message - <Description>
    Given I am on the login page
    Then I click on forgot password link
    Then I enter email for "<User>-<Role>" to generate password link
    And I click on send mail button
    Given I am on mail login page
    Then I enter username "qaautomation@remedysystems.com" to login mail account
    Then I enter password "9h$00v3T$dF@OPn0" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change My Password" link in mail content
    Then I click on "Change My Password" link in mail content
    And I switch to new window
    And I enter new password "<NewPassword>" to set new password
    And I enter confirm new password "<ConfirmPassword>" to set new password
    And I click on submit button to set new password
    And I validate the validation message "<ValidationMsg>" for reset password

    Examples: 
      | Description                                               | User        | Role   | NewPassword | ConfirmPassword | ValidationMsg                                                |
      | when password and the confirmation password are different | Super Admin | Leader | Testing3    | Test            | Please ensure the password and the confirmation are the same |
      | When entered password does not meet guidelines            | Super Admin | Leader | Test        |                 | Password guidelines                                          |
