Feature: Reporting Help Center

  Scenario Outline: Verify the help center page from the reports tiles page appears for all the users
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Overall Program" under reports tile text
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I click on "Using Reports" tab on the reporting help center page
    Then I should see following text under using reports section in reporting help center page
      | New in Reports                               |
      | Getting Started                              |
      | Report Types                                 |
      | Reports Toolbar                              |
      | Using Fields                                 |
      | Using Filters                                |
      | Sort a Column                                |
      | View Patient Data                            |
      | Conditional Formatting                       |
      | Display Percentages, Ranks, and Running Sums |
      | Create a Calculated Measure                  |
      | Aggregate Multiple Time Periods              |
      | Display Subtotals                            |
      | Export a Report                              |
      | More Actions Menu                            |
      | View as Table or Chart                       |
    And I click on "Reports by Category" tab on the reporting help center page
    Then I should see following text under reports by category section in reporting help center page
      | Dashboards        |
      | Overall Program   |
      | Patient ID        |
      | Post Acute Care   |
      | Next Site of Care |
      | Readmissions      |
    And I click on "Reports by Title" tab on the reporting help center page
    Then I should see following text under reports by title section in reporting help center page
      | CARL Report                               |
      | Episode DRG Issues Report                 |
      | Financial Performance (Claims) Report     |
      | Initial SNF Length of Stay Summary Report |
      | Inpatient Episode Clearing Report         |
      | Next Site of Care Summary Report          |
      | Performance (Claims) Report               |
      | Post Acute Care (Claims) Report           |
      | Program Overview Dashboard                |
      | Readmissions Report                       |
      | Readmissions (Claims) Report              |
      | SNF Performance (Claims) Report           |
      | Spending (Claims) Report                  |
    And I click on "Report Insights" tab on the reporting help center page
    Then I should see following text under report insights section in reporting help center page
      | Retrospective Analysis     |
      | Real-Time Analysis         |
      | Data Completion and Claims |
    And I click on "FAQs" tab on the reporting help center page
    Then I verify "Frequently Asked Questions" text is appearing in the FAQ page
    And I should be able to see FAQ links list mentioned in the FAQ page
    And I click on "Glossary" tab on the reporting help center page
    Then I verify "The following terms and concepts are used across Remedy Connect Reports." text is appearing in the glossary page
    And I should be able to see terms and conditions list mentioned in the glossary page

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | shutestaug221130a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |
      | shutestaug15240p@yopmail.com       |
      | shutestaug221145a@yopmail.com      |

  Scenario Outline: Verify help option is not appearing on the product tiles page
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    Then I click on avatar symbol to see the menu
    And I should not see "Help Center" is present in the list after clicking on avatar

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |

  Scenario Outline: Verify user is able to open reporting help center from ctools,claims and ec reports
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Overall Program" under reports tile text
    #Dashboard(Program Overview)
    When I click on the Reports Tile with text "Dashboards"
    When I click on "Program Overview" reports text for "Dashboards" report tile
    And I wait for the reports embedded iframe to load
    When I switch to reports embedded iframe
    Then I wait until loading icon disappears in program overview report
    And I will wait to see "Overall Program" under program overview report in iframe
    When I switch to default window from iframe
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    #Dashboards(Physician)
    When I click on "Dashboards" tile on the top navigation of reports page
    Then I click on "Physician" report under "Dashboards" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Physician" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    #Overall Program(Claims)
    When I click on "Overall Program" tile on the top navigation of reports page
    Then I click on "Performance (Claims)" report under "Overall Program" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Performance (Claims)" in the reports header page
    Then I wait for 20000 milli seconds
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    When I click on "Overall Program" tile on the top navigation of reports page
    Then I click on "Financial Performance (Claims)" report under "Overall Program" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Financial Performance (Claims)" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    When I click on "Overall Program" tile on the top navigation of reports page
    Then I click on "Spending (Claims)" report under "Overall Program" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Spending (Claims)" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    #Post Acute Care(Claims)
    When I click on "Post Acute Care" tile on the top navigation of reports page
    Then I click on "SNF Performance (Claims)" report under "Post Acute Care" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "SNF Performance (Claims)" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    When I click on "Post Acute Care" tile on the top navigation of reports page
    Then I click on "SNF Volume (Claims)" report under "Post Acute Care" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "SNF Volume (Claims)" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    When I click on "Post Acute Care" tile on the top navigation of reports page
    Then I click on "Post Acute Care (Claims)" report under "Post Acute Care" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Post Acute Care (Claims)" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    #Physician(Claims)
    When I click on "Physician" tile on the top navigation of reports page
    Then I click on "Performance (Claims)" report under "Physician" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Performance (Claims)" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    When I click on "Physician" tile on the top navigation of reports page
    Then I click on "Volume (Claims)" report under "Physician" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Volume (Claims)" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    When I click on "Physician" tile on the top navigation of reports page
    Then I click on "Spending (Claims)" report under "Physician" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Spending (Claims)" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    #Readmissions(Claims)
    When I click on "Readmissions" tile on the top navigation of reports page
    Then I click on "Readmissions (Claims)" report under "Readmissions" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Readmissions (Claims)" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    # Patient ID(Ec Reports)
    When I click on "Patient ID" tile on the top navigation of reports page
    Then I click on "Episode DRG Issues" report under "Patient ID" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Episode DRG Issues" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    When I click on "Patient ID" tile on the top navigation of reports page
    Then I click on "InPatient Episode Clearing" report under "Patient ID" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "InPatient Episode Clearing" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    #Post Acute Care(EC Reports)
    When I click on "Post Acute Care" tile on the top navigation of reports page
    Then I click on "Initial SNF Length of Stay Summary" report under "Post Acute Care" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Initial SNF Length of Stay Summary" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    #Next Site Of Care(EC Reports)
    When I click on "Next Site of Care" tile on the top navigation of reports page
    Then I click on "CARL" report under "Next Site of Care" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "CARL" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    When I click on "Next Site of Care" tile on the top navigation of reports page
    Then I click on "Next Site of Care Summary" report under "Next Site of Care" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Next Site of Care Summary" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    #Readmissions(EC Reports)
    When I click on "Readmissions" tile on the top navigation of reports page
    Then I click on "Readmissions" report under "Readmissions" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Readmissions" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window

    Examples: 
      | email                         |
      | shutestaug231132a@yopmail.com |

  Scenario Outline: Verify user is able to open reporting help center from model3 reports
    Given I am on the login page
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I wait to see "Reports" tile
    When I click on the "Reports" tile
    And I wait to see "Next Site of Care" under reports tile text
    When I click on the Reports Tile with text "Patient ID"
    Then I click on "Episode DRG Issues [Model 3]" report text for Patient ID Reports
    And I wait for the reports embedded iframe to load
    Then I verify "Episode DRG Issues [Model 3]" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    When I click on "Patient ID" tile on the top navigation of reports page
    Then I click on "InPatient Episode Clearing [Model 3]" report under "Patient ID" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "InPatient Episode Clearing [Model 3]" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    When I click on "Next Site of Care" tile on the top navigation of reports page
    Then I click on "Next Site of Care Summary [Model 3]" report under "Next Site of Care" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Next Site of Care Summary [Model 3]" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    When I click on "Next Site of Care" tile on the top navigation of reports page
    Then I click on "Next Site of Care Summary [Model 3]" report under "Next Site of Care" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Next Site of Care Summary [Model 3]" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window
    When I click on "Readmissions" tile on the top navigation of reports page
    Then I click on "Readmissions [Model 3]" report under "Readmissions" reports tile on the top of reports page
    And I wait for the reports embedded iframe to load
    Then I verify "Readmissions [Model 3]" in the reports header page
    Then I click on avatar symbol to see the menu
    And I verify "Help Center" is appearing in the list after clicking on avatar
    Then I click on "Help Center" tab after clicking on avatar symbol to redirect to reporting help center page
    #And I switch to new window
    Then I wait to see "Reports Help Center" in the new tab after clicking on help center
    And I should not see login widget after switching to a new tab
    Then I verify "Using Reports" tab is appearing in the reporting help center page
    Then I verify "Reports by Category" tab is appearing in the reporting help center page
    Then I verify "Reports by Title" tab is appearing in the reporting help center page
    Then I verify "Report Insights" tab is appearing in the reporting help center page
    Then I verify "FAQs" tab is appearing in the reporting help center page
    Then I verify "Glossary" tab is appearing in the reporting help center page
    And I switch back to old window

    Examples: 
      | email                              |
      | RPFINM3SNFSaberHealth@yopmail.com  |
      | OPSFINM3SNFSaberHealth@yopmail.com |

  Scenario Outline: User should see auth0 login widget if trying to access the url directly and login with valid credentials to see program overview dashboard page under reporting help center
    Given I am on the login page
    And I go to "https://hlpctr-qa.remedypartners.com/help/Content/REPORTS_Category/Dashboards/Program%20Overview%20Dashboard.htm" page
    And I should see Log in widget
    When I enter email field <email> for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I should see "Program Overview Dashboard" text is appearing on the help center page

    Examples: 
      | email                              |
      | shutestaug231132a@yopmail.com      |
      | reptestachmodel2opsfin@yopmail.com |

  Scenario: User should redirect to auth0 when tried login with invalid credentials with reporting help center url link
    Given I am on the login page
    And I go to "https://hlpctr-qa.remedypartners.com/help/Content/REPORTS_Category/Dashboards/Program%20Overview%20Dashboard.htm" page
    And I should see Log in widget
    When I enter email field test@remedypartnerscom for login
    And I enter password field Testing1 for Login
    Then I click Access button
    And I should see Log in widget
