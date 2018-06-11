Feature: Reset and forgot password functionality from UA2 application

  Scenario Outline: Reset Password: Valid new password and confirm password match
    Given I am on the login page
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I verify Remedy Connect page
    Then I click on "Reset Password" button from top right corner icon
    Then I click on Okay on reset password confirmation box
    Given I am on mail login page
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change my password" link in mail content
    Then I click on "Change my password" link in mail content
    And I switch to new window
    And I enter new password "<NewPassword>" to set new password
    And I enter confirm new password "<NewPassword>" to set new password
    And I click on submit button to set new password
    Then I verify Remedy Connect page

    Examples: 
      | User        | Role      | NewPassword |
      | Super Admin | Executive | Testing2    |

  Scenario Outline: Reset Password: New password and confirm password mismatch
    Given I am on the login page
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    And I enter password field <Password> for Login
    Then I click Access button
    Then I verify Remedy Connect page
    Then I click on "Reset Password" button from top right corner icon
    Then I click on Okay on reset password confirmation box
    Given I am on mail login page
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change my password" link in mail content
    Then I click on "Change my password" link in mail content
    And I switch to new window
    And I enter new password "<NewPassword>" to set new password
    And I enter confirm new password "<ConfirmPass>" to set new password
    And I click on submit button to set new password
    And I should see error message for password mismatch "Please ensure the password and the confirmation are the same"

    Examples: 
      | User        | Role      | Password | NewPassword | ConfirmPass |
      | Super Admin | Executive | Testing2 | Testing1    | Test        |

  Scenario Outline: Reset Password: Invalid new password
    Given I am on the login page
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    And I enter password field <Password> for Login
    Then I click Access button
    Then I verify Remedy Connect page
    Then I click on "Reset Password" button from top right corner icon
    Then I click on Okay on reset password confirmation box
    Given I am on mail login page
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change my password" link in mail content
    Then I click on "Change my password" link in mail content
    And I switch to new window
    And I enter new password "<NewPassword>" to set new password
    And I enter confirm new password "<NewPassword>" to set new password
    And I click on submit button to set new password
    And I should see password guidelines for a valid password

    Examples: 
      | User        | Role      | Password | NewPassword |
      | Super Admin | Executive | Testing2 | test        |

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
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change my password" link in mail content
    Then I click on "Change my password" link in mail content
    And I switch to new window
    And I enter new password "<NewPassword>" to set new password
    And I enter confirm new password "<NewPassword>" to set new password
    And I click on submit button to set new password
    Given I am on the login page
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    And I enter password field <NewPassword> for Login
    Then I click Access button
    Then I verify Remedy Connect page
    Then I click on "Log Out" button again
    And I should see Log in widget
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    And I enter password field <Password> for Login
    Then I click Access button
    Then I should see error message for invalid credentials "Wrong email or password."

    Examples: 
      | User        | Role      | NewPassword | Password |
      | Super Admin | Executive | Testing1    | Testing2 |

  Scenario Outline: Forgot Password- New Password and confirm password mismatch
    Given I am on the login page
    Then I click on forgot password link
    Then I enter email for "<User>-<Role>" to generate password link
    And I click on send mail button
    Given I am on mail login page
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change my password" link in mail content
    Then I click on "Change my password" link in mail content
    And I switch to new window
    And I enter new password "<NewPassword>" to set new password
    And I enter confirm new password "<ConfirmPassword>" to set new password
    And I click on submit button to set new password
    And I should see error message for password mismatch "Please ensure the password and the confirmation are the same"

    Examples: 
      | User        | Role      | NewPassword | ConfirmPassword |
      | Super Admin | Executive | Testing3    | Test            |

  Scenario Outline: Forgot Password- putting invalid new password and verify password guidelines
    Given I am on the login page
    Then I click on forgot password link
    Then I enter email for "<User>-<Role>" to generate password link
    And I click on send mail button
    Given I am on mail login page
    Then I enter username "qaautomation@remedypartners.com" to login mail account
    Then I enter password "1Welcome2" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change my password" link in mail content
    Then I click on "Change my password" link in mail content
    And I switch to new window
    And I enter new password "<NewPassword>" to set new password
    And I enter confirm new password "<NewPassword>" to set new password
    And I click on submit button to set new password
    And I should see password guidelines for a valid password

    Examples: 
      | User        | Role      | NewPassword |
      | Super Admin | Executive | Test        |
