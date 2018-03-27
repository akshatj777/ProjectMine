Feature: Bulk Upload User from SA

  Scenario Outline: <Description>
    Given I am on mail login page
    Then I enter username "<Email>" to login mail account
    Then I enter password "<Password>" to login mail account
    Then I click on Mail icon in my account
    Then I click on Inbox in mail
    Then I click on delete icon in mail
    Then I signout from mail account

    Examples: 
      | Description                                    | User                            | Email                                   | Password |
      | Delete Old Mails from the respective Email IDs | Executive                       | test.automatemail.executive@gmail.com   | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Manager                         | test.automatemail.manager@gmail.com     | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Case Manager                    | test.automatemail.casemanager@gmail.com | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Physician                       | test.automatemail.phys@gmail.com        | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Remedy TCS                      | test.automatemail.rtcs@gmail.com        | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Remedy LPN                      | test.automatemail.rlpn@gmail.com        | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Remedy RN                       | test.automatemail.rrn@gmail.com         | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Remedy Field RN                 | test.automatemail.rfrn@gmail.com        | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Remedy PM                       | test.automatemail.remedypm@gmail.com    | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Remedy Sales Team               | test.automatemail.rst@gmail.com         | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Remedy Executive                | test.automatemail.re@gmail.com          | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Partner Program Executive       | test.automatemail.ppe@gmail.com         | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Remedy Other                    | test.automatemail.ro@gmail.com          | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Partner Program Administrator   | test.automatemail.ppa@gmail.com         | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Remedy Program Administrator    | test.automatemail.rpa@gmail.com         | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Partner Technical Administrator | test.automatemail.pta@gmail.com         | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Remedy Technical Administrator  | test.automatemail.rta@gmail.com         | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Transitional Case Manager       | test.automatemail.tcm@gmail.com         | Intel@01 |
      | Delete Old Mails from the respective Email IDs | Downstream Provider             | test.automatemail.dp@gmail.com          | Intel@01 |
