Feature: Reset and forgot password functionality from UA2 application

  Scenario Outline: <Description>
    Given I am on mail login page
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I click on delete icon in mail
    Then I signout from mail account
    Given I am on the login page
    When I enter email field <UserName> for login
    And I enter password field <Password> for Login
    Then I click Access button
    Then I should see Tile text User Admin
    And I click on the "User Admin" tile
    Then I should see header text "Users"
    When I click on Add User button
    Then I should see "Add New User" on the user creation page
    Then I verify the header "General Information"
    And I fill in First Name with "<FirstName>"
    Then I fill in Last Name with <LastName>
    And I enter Email "<Email>" to Create user
    And I enter Phone field with <Phone>
    When I click the Organizational Role Field
    Then I pick a Organizational <Role>
    Then I enter NPI field with "<NPI>" for role "<Role>"
    Then I click on Next button
    Then I verify the header "Applications"
    Then I verify applications "<Applications>" are unchecked
    Then I verify Learning Pathway search box is not available
    Then I select "<Applications>" product
    Then I verify applications "<Applications>" are checked
    Then I click on Select button
    Then I verify Learning Pathway search box is available
    Then I select "<LearningPathwaySearchParameter>" from the results
    Then I verify "<ApplicationsNotVisible>" is not visible on Applications tab
    Then I click on Next button
    Then I verify the header "Permissions"
    And I search for health system with <Health System1>
    And I select a <Health System1>
    Then I select "<Programs1>" programs
    Then I select "<Locations1>" locations
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
    Then I click on Submit button for "<User>"
    And I click on the top user account link
    Then I click on "Log Out" button
    And I should see Log in widget
    Given I am on the login page
    Then I click on "Log Out" button again
    Given I am on mail login page
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
    Then I verify Account Verification in Inbox in my account
    Then I click on Account Verification mail in Inbox
    Then I verify "Confirm my account!" link in mail content
    Then I click on "Confirm my account!" link in mail content
    And I switch to new window
    Then I enter email to generate password link
    And I click on send mail button
    Then I switch back to old window
    Then I click on Inbox in mail
    Then I verify the unread mail in inbox in my account
    Then I verify Change Password mail in Inbox in my account
    Then I click on Change Password mail in Inbox
    Then I verify "Change my password" link in mail content
    Then I click on "Change my password" link in mail content
    And I switch to new window
    And I enter new password "Testing1" to set new password
    And I enter confirm new password "Testing1" to set new password
    And I click on submit button to set new password

    Examples: 
      | Description                                                     | User        | UserName                               | Password | FirstName                            | LastName                                 | Email             | Phone      | Role      | Applications | ApplicationsNotVisible                               | NPI | LearningPathwaySearchParameter                                                                                                                                                                                       | Health System1   | Programs1   | Locations1                                       | HasHealthSystem2 | Health System2 | Programs2 | Locations2 | HasHealthSystem3 | Health System3 | Programs3 | Locations3 |
      | Login with Super Admin User and create user with Executive role | Super Admin | lbarinstein+qaadmin@remedypartners.com | Testing1 | FirstNameFirstNameFirstNameFirstName | LastNameLastNameLastNameLastNameLastName | test.automatemail | 9988776655 | Executive | Episodes     | Episodes 2.0, Administration, Physician Connect, TCI |     | i am learning path, Learning Pathway 2, Care Coordination External, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2, Physician Acute Care Hospital Model 2, Remedy University | Sound Physicians | BPCI-Model2 | 6005-080--Winchester Medical Center - Rehab Unit |                  |                |           |            |                  |                |           |            |

  Scenario Outline: Reset Password: Valid new password and confirm password match
    Given I am on the login page
    Then I enter newuser email for "<User>-<Role>" login to Remedy
    Then I enter newuser password for login to Remedy
    Then I click Access button
    Then I verify Remedy Connect page
    Then I click on "Reset Password" button from top right corner icon
    Then I click on Okay on reset password confirmation box
    Given I am on mail login page
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
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
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
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
    Then I enter password "Intel@01" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    And I wait for 3000 milli seconds
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
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "Intel@01" to login mail account
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
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "Intel@01" to login mail account
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
    Then I enter username "test.automatemail" to login mail account
    Then I enter password "Intel@01" to login mail account
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
