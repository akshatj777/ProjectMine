package stepDefination.Reports;

import com.remedy.Reports.ReportHomePage;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import java.util.List;

/**
 * Created by salam on 5/10/16.
 */
public class ReportHomePageSteps extends DriverScript {

    ReportHomePage reportHomePage = new ReportHomePage(driver);

    @And("^I should see Reports Tile text as ([^\"]*)$")
    public void iShouldSeeReportsTileTextAs(String text) throws Throwable {
        reportHomePage.iVerifyReportsTextforTiles(text);
    }
    
    @And("^I should not see Reports Tile text as \"([^\"]*)\"$")
    public void iShouldNotSeeReportsTileTextAs(String element) throws Throwable {
        reportHomePage.iVerifyReportsTextNotPresent(element);
    }

    @And("^I click on the Reports Tile with text \"([^\"]*)\"$")
    public void iClickReportTileWithText(String tile) throws Throwable {
        reportHomePage.iClickOnReportTileWithText(tile);
    }

    @And("^I should see \"([^\"]*)\" Reports text for \"([^\"]*)\" reports$")
    public void iShouldSeeReportsTextForOverallProgram(String tile, String reportsTextName) throws Throwable {
        reportHomePage.iVerifyReportsTextForReportsTextName(reportsTextName, tile);
    }

    @And("^I click on \"([^\"]*)\" report text for Overall Program Reports$")
    public void iClickTextForOverallProgramReports(String text) throws Throwable {
        reportHomePage.iClickOnReportTextForOverallProgramReportTile(text);
    }

    @And("^I should see \"([^\"]*)\" in the reports header page$")
    public void iShouldSeeReportsTextHeaderPage(String headerText) throws Throwable {
        reportHomePage.iVerifyReportsPageHeaderText(headerText);
    }

    @And("^I switch to reports embedded iframe$")
    public void iShouSeeReportsTheReportsHeaderPage() throws Throwable {
        reportHomePage.iSwitchToReportsPageFrameWithXpath("//iframe[@class='embedded-iframe ng-scope']");
    }

    @And("^I should see performance reports column Tile text as \"([^\"]*)\"$")
    public void iShouldSeePerformanceReportsColumnTileTextAs(String tile) throws Throwable {
        reportHomePage.iVerifyPerformanceReportsColumnsTitleText(tile);
    }

    @And("^I click on field-panel-icon button$")
    public void iClickFieldPaneliconButton() throws Throwable {
        reportHomePage.iClickReportFieldPanelIconButton();
    }
    
    @When("^I click on field-layout-icon button$")
    public void iClickFieldLayouticonButton() throws Throwable {
        reportHomePage.iClickReportFieldLayoutIconButton();
    }

    @And("I move the mouse to \"([^\"]*)\" field filter under \"([^\"]*)\" filter field$")
    public void iMoveMouseToFieldFilterUnderFilterField(String filterField, String filterTitle) throws Throwable {
        reportHomePage.iMoveToElementToPerform(".//*[@id='fieldListTree']//div[@formula='["+filterTitle+"].["+filterField+"]']");
    }

    @And("I click to \"([^\"]*)\" field filter under \"([^\"]*)\" filter field$")
    public void iClickToFieldFilterUnderFilterField(String filterField, String filterTitle) throws Throwable {
    	reportHomePage.iMoveToElementAndPerformRightClick(filterField, filterTitle);
    }
      
    @And("^I choose \"([^\"]*)\" option from select options of filter field$")
    public void iChooseOptionFromSelectOptionsFilterField(String optionText) throws Throwable {
        reportHomePage.iChooseOptionsFromFilterWithXpath("//td[@id='cmdField"+optionText+"_text']");
    }
    
    @And("^I Click on \"([^\"]*)\" option from select options of filter field$")
    public void iClickOnOptionFromSelectOptionsFilterField(String optionText) throws Throwable {
        reportHomePage.iChooseOptionsFromFilterWithXpath("//td[@id='field"+optionText+"_text']");
    }

    @And("^I should see \"([^\"]*)\" in the header text of filter page$")
    public void iShouldSeeFilterOnHeaderTextFilterPage(String appliedFilter) throws Throwable {
        reportHomePage.iVerifyFilterModalHeaderText("Filter on "+appliedFilter);
    }
    
    @And("^I verify \"([^\"]*)\" in the header text of filter page$")
    public void iVerifyFilterOnHeaderTextFilterPage(String appliedFilter) throws Throwable {
        reportHomePage.iVerifyFilterTitleHeaderText("Filter on "+appliedFilter);
    }

    @Then("^I should see \"([^\"]*)\" in the filter value list$")
    public void i_should_see_in_the_filter_value_list(String filterText) throws Throwable {
        reportHomePage.iVerifyFilterValueListModalText(filterText);
    }
    
    @Then("^I verify \"([^\"]*)\" in the filter value list$")
    public void i_verify_in_the_filter_value_list(String filterText) throws Throwable {
        reportHomePage.iSeeFilterValueListText(filterText);
    }

    @And("^I click on \"([^\"]*)\" in the filter value list$")
    public void i_click_on_in_the_filter_value_list(String filterText) throws Throwable {
         reportHomePage.iClickOnFilterTextFormFilterValueList(filterText);
    }
    
    @And("^I select \"([^\"]*)\" in the filter value list$")
    public void i_select_in_the_filter_value_list(String filterText) throws Throwable {
         reportHomePage.iSelectFilterTextFormFilterValueList(filterText);
    }

    @And("^I click on add selected in the filter model$")
    public void i_click_on_add_selected_in_the_filter_modal() throws Throwable {
        reportHomePage.iClickAddSelectedArrowFromFilterModal();
    }
    
    @And("^I click on \"([^\"]*)\" in the filter modal$")
    public void i_click_on_in_the_filter_modal(String text) throws Throwable {
        reportHomePage.iClickSelectedFromFilterModal(text);
    }

    @And("^I click on ok button from filter$")
    public void i_click_on_ok_button_from_filter() throws Throwable {
        reportHomePage.iClickOkButtonFromFilterModal();
    }
    
    @And("^I click \"([^\"]*)\" button from filter to select field$")
    public void i_click_button_from_filter_to_select_field(String text) throws Throwable {
        reportHomePage.iClickButtonFromFilterModalToSelectField(text);
    }

    @And("^I click on cancel button from filter$")
    public void i_click_on_cancel_button_from_filter() throws Throwable {
        reportHomePage.iClickCancelButtonFromFilterModal();
    }

    @And("^I click on close reports cross icon on report page$")
    public void i_click_on_close_report_cross_icon_report_page() throws Throwable {
        reportHomePage.iClickOnCloseReportsCrossLink();
    }
    
    @When("^I click on reports tab appearing on reports page$")
    public void i_click_on_reports_tab_appearing_on_reports_page() throws Throwable {
        reportHomePage.iClickOnReportsTabOnReportsPage();
    }

    @Then("^I should see following Reports text for Overall Program reports$")
    public void i_should_see_following_Reports_text_for_Overall_Program_reports(List<String> reportLinks) throws Throwable {
         for (int i=0; i<reportLinks.size(); i++) {
            reportHomePage.iVerifyFollowingReportsTextsForReportsTile("Overall Program", reportLinks.get(i));
        }
    }

    @Then("^I should see \"([^\"]*)\" result in \"([^\"]*)\" field column for \"([^\"]*)\" filter field$")
    public void i_should_see_result_in_field_column_for_filter_field(String text, String filterCol, String filterOption) throws Throwable {
        reportHomePage.iVerifyFilterResultInColumnFieldForReportFilterField(text, filterCol, filterOption);
    }

    @Then("^I should see following Reports text for Dashboards reports$")
    public void i_should_see_following_Reports_text_for_Dashboards_reports(List<String> reportLinks) throws Throwable {
        for (int i=0; i<reportLinks.size(); i++) {
            reportHomePage.iVerifyFollowingReportsTextsForReportsTile("Dashboards", reportLinks.get(i));
        }
    }

    @Then("^I should see following Reports text for Patient ID reports$")
    public void i_should_see_following_Reports_text_for_Patient_ID_reports(List<String> reportLinks) throws Throwable {
        for (int i=0; i<reportLinks.size(); i++) {
            reportHomePage.iVerifyFollowingReportsTextsForReportsTile("Patient ID", reportLinks.get(i));
        }
    }

    @Then("^I should see following Reports text for Post Acute Care reports$")
    public void i_should_see_following_Reports_text_for_Post_Acute_Care_reports(List<String> reportLinks) throws Throwable {
        for (int i=0; i<reportLinks.size(); i++) {
            reportHomePage.iVerifyFollowingReportsTextsForReportsTile("Post Acute Care", reportLinks.get(i));
        }
    }

    @Then("^I should see following Reports text for Physician reports$")
    public void i_should_see_following_Reports_text_for_Physician_reports(List<String> reportLinks) throws Throwable {
        for (int i=0; i<reportLinks.size(); i++) {
            reportHomePage.iVerifyFollowingReportsTextsForReportsTile("Physician", reportLinks.get(i));
        }
    }

    @Then("^I should see following Reports text for Readmissions reports$")
    public void i_should_see_following_Reports_text_for_Readmissions_reports(List<String> reportLinks) throws Throwable {
        for (int i=0; i<reportLinks.size(); i++) {
            reportHomePage.iVerifyFollowingReportsTextsForReportsTile("Readmissions", reportLinks.get(i));
        }
    }

    @Then("^I should see following Reports text for NSoC reports$")
    public void i_should_see_following_Reports_text_for_NSoC_reports(List<String> reportLinks) throws Throwable {
        for (int i=0; i<reportLinks.size(); i++) {
            reportHomePage.iVerifyFollowingReportsTextsForReportsTile("NSoC", reportLinks.get(i));
        }
    }

    @And("^I click on \"([^\"]*)\" reports text for \"([^\"]*)\" report tile$")
    public void i_click_on_reports_text_for_report_tile(String tile, String reportsTextName) throws Throwable {
        reportHomePage.iClickOnReportsTextForReportsTextName(reportsTextName, tile);
    }
    
    @Then("^I should see \"([^\"]*)\" in the Operations Dashboard report page header$")
    public void i_should_see_in_the_Operations_Dashboard_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyOperationsDashboardReportPageHeader(headedText);
    }

    @Then("^I should see \"([^\"]*)\" in the Performance Overall Program report page header$")
    public void i_should_see_in_the_Performance_Overall_Program_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyPerformanceOverallProgramReportPageHeader(headedText);
    }
    
    @Then("^I should see \"([^\"]*)\" in the Patient ID report page header$")
    public void i_should_see_in_the_patient_id_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyPerformanceOverallProgramReportPageHeader(headedText);
    }

    @Then("^I should see \"([^\"]*)\" in the Inpatient Episode Clearing Patient ID report page header$")
    public void i_should_see_in_the_Inpatient_Episode_Clearing_Patient_ID_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyInpatientEpisodeClearingIssuesPatientIDReportPageHeader(headedText);
    }
    
    @Then("^I should see \"([^\"]*)\" in the Episode DRG Issues Patient ID report page header$")
    public void i_should_see_in_the_Episode_DRG_Issues_Patient_ID_report_page_header(String text) throws Throwable {
        reportHomePage.iVerifyEpisodeDRGIssuesReportPageHeader(text);
    }

    @Then("^I should see \"([^\"]*)\" in the SNF LOS Detail Post Acute Care report page header$")
    public void i_should_see_in_the_SNF_LOS_Detail_Post_Acute_Care_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifySNFLOSDetailPostAcuteCareReportPageHeader(headedText);
    }
    
    @Then("^I should see \"([^\"]*)\" in the Post Acute Care report page header$")
    public void i_should_see_in_the_Post_Acute_Care_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyPostAccuteCareReportPageHeader(headedText);
    }

    @Then("^I should see \"([^\"]*)\" in the Physician Performance Physician report page header$")
    public void i_should_see_in_the_Physician_Performance_Physician_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyPhysicianPerformancePhysicianReportPageHeader(headedText);
    }
    
    @Then("^I should see \"([^\"]*)\" in the Physician Volume Physician report page header$")
    public void i_should_see_in_the_Physician_Volume_Physician_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyPhysicianPerformancePhysicianReportPageHeader(headedText);
    }
    
    @Then("^I should see \"([^\"]*)\" in the Physician Spending Physician report page header$")
    public void i_should_see_in_the_Physician_Spending_Physician_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyPhysicianPerformancePhysicianReportPageHeader(headedText);
    }

    @Then("^I should see \"([^\"]*)\" in the CARL NSOC report page header$")
    public void i_should_see_in_the_CARL_NSOC_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyCARLNSOCReportPageHeader(headedText);
    }
    
    @Then("^I should see \"([^\"]*)\" in the Next Site of Care Detail NSOC report page header$")
    public void i_should_see_in_the_Next_Site_of_Care_Detail_NSOC_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyNextSiteOfCareDetailNSOCReportPageHeader(headedText);
    }
    
    @Then("^I should see \"([^\"]*)\" in the Next Site of Care Summary NSOC report page header$")
    public void i_should_see_in_the_Next_Site_of_Care_Summary_NSOC_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyCARLNSOCReportPageHeader(headedText);
    }

    @Then("^I should see \"([^\"]*)\" in the Readmissions Readmission report page header$")
    public void i_should_see_in_the_Readmissions_Readmission_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyReadmissionsReadmissionReportPageHeader(headedText);
    }
    
    @Then("^I should see \"([^\"]*)\" in the Readmissions Claims Readmission report page header$")
    public void i_should_see_in_the_Readmissions_claims_Readmission_report_page_header(String headedText) throws Throwable {
        reportHomePage.iVerifyReadmissionsReadmissionReportPageHeader(headedText);
    }

    @And("^I should see \"([^\"]*)\" header title for \"([^\"]*)\" column in Operations Dashboard report$")
    public void i_should_see_header_title_for_column_in_Operations_Dashboard_report(String titleText, String elementColumn) throws Throwable {
        reportHomePage.iVerifyHeaderTitleForColumnOperationsDashboardReport(elementColumn, titleText);
    }

    @And("^I select ([^\"]*) from \"([^\"]*)\" filter in Operations Dashboard report$")
    public void i_select_from_filter_in_Operations_Dashboard_report(String filterOptions, String filterType) throws Throwable {
        reportHomePage.iChooseOptionsFromFilterOperationsDashboardReport(filterType,filterOptions);
    }

    @Then("^I enter \"([^\"]*)\" as the value on the textbox in the filter modal$")
    public void i_enter_as_the_value_on_the_tetbox_in_the_filter_modal(String value) throws Throwable {
    	reportHomePage.iEnterAsTheValueOnTheTextboxInTheFilterModal(value);
    }

    @Then("^I click on range filter dropdown and selected Less Than range in the filter modal$")
    public void i_click_on_range_filter_dropdown_and_selected_Less_Than_range_in_the_filter_modal() throws Throwable {
    	reportHomePage.iClickOnRangeFilterDropdownAndSelectedLessThanRangeInTheFilterModal();
    }

    @When("^I click on \"([^\"]*)\" for the \"([^\"]*)\" in the filter value list$")
    public void i_click_on_for_the_in_the_filter_value_list(String month, String year) throws Throwable {
    	reportHomePage.iClickOnForTheInTheFilterValueList(month, year);
    }

    @Then("^I click on \"([^\"]*)\" report text for Readmissions Reports$")
    public void i_click_on_report_text_for_Readmissions_Reports(String text) throws Throwable {
    	reportHomePage.iClickOnReportTextForReadmissionsReports(text);
    }

    @Then("^I should see Readmission reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_Readmission_reports_column_Tile_text_as(String text) throws Throwable {
        reportHomePage.iShouldSeeReadmissionReportsColumnTileTextAs(text);
    }

    @Then("^I click on \"([^\"]*)\" report text for Physician Reports$")
    public void i_click_on_report_text_for_Physician_Reports(String text) throws Throwable {
        reportHomePage.iClickOnReportTextForPhysicianReports(text);
    }

    @Then("^I should see Spending reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_Spending_reports_column_Tile_text_as(String text) throws Throwable {
        reportHomePage.iShouldSeeSpendingReportsColumnTileTextAs(text);
    }

    @Then("^I should see Volume reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_Volume_reports_column_Tile_text_as(String text) throws Throwable {
        reportHomePage.iShouldSeeVolumeReportsColumnTileTextAs(text);
    }

    @Then("^I click on \"([^\"]*)\" report text for Post Acute Care Reports$")
    public void i_click_on_report_text_for_Post_Acute_Care_Reports(String text) throws Throwable {
    	reportHomePage.iClickOnReportTextForPostAcuteCareReportsTile(text);
    }
    
    @Then("^I should see Post Acute Care \\(Claims\\) reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_Post_Acute_Care_Claims_reports_column_Tile_text_as(String tile) throws Throwable {
    	reportHomePage.iShouldSeePostAcuteCareClaimsReportsColumnTileTextAs(tile);
    }
    
    @Then("^I should see snf performance reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_snf_performance_reports_column_Tile_text_as(String tile) throws Throwable {
        reportHomePage.iShouldSeeSnfPerformanceReportsColumnTileTextAs(tile);
    }

    @Then("^I should see SNF volume reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_SNF_volume_reports_column_Tile_text_as(String tile) throws Throwable {
    	reportHomePage.iShouldSeeSnfPerformanceReportsColumnTileTextAs(tile);
    }
    
    @Then("^I should see Initial SNF Length of Stay Summary reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_Initial_SNF_Length_of_Stay_Summary_reports_column_Tile_text_as(String tile) throws Throwable {
    	reportHomePage.iShouldSeeInitialSNFLengthOfStaySummaryReportsColumnTileTextAs(tile);
    }
    
    @Then("^I should see Next Site of Care Detail reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_Next_Site_of_Care_Detail_reports_column_Tile_text_as(String tile) throws Throwable {
    	reportHomePage.iShouldSeeNextSiteOfCareDetailReportsColumnTileTextAs(tile);
    }

    @Then("^I click on \"([^\"]*)\" report text for Patient ID Reports$")
    public void i_click_on_report_text_for_Patient_ID_Reports(String text) throws Throwable {
        reportHomePage.iClickOnReportTextForPatientIDReports(text);
    }

    @Then("^I should see Episode Avg Day to DRG reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_Episode_Avg_Day_to_DRG_reports_column_Tile_text_as(String tile) throws Throwable {
        reportHomePage.iShouldSeeEpisodeAvgDayToDRGReportsColumnTileTextAs(tile);
    }
    
    @Then("^I should see Episode DRG Issues reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_Episode_DRG_Issues_reports_column_Tile_text_as(String tile) throws Throwable {
        reportHomePage.iShouldSeeEpisodeDRGIssuesReportsColumnTileTextAs(tile);
    }

    @Then("^I should see Episode with DRG issue reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_Episode_with_DRG_issue_reports_column_Tile_text_as(String tile) throws Throwable {
    	reportHomePage.iShouldSeeEpisodeWithDRGIssueReportsColumnTileTextAs(tile);
    }

    @Then("^I should see Next site of care reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_Next_site_of_care_reports_column_Tile_text_as(String tile) throws Throwable {
    	reportHomePage.iShouldSeeNextSiteOfCareReportsColumnTileTextAs(tile);
    }
    
    @Then("^I click on \"([^\"]*)\" report text for NSoC Reports$")
    public void i_click_on_report_text_for_NSoC_Reports(String text) throws Throwable {
    	reportHomePage.iClickOnReportTextForNSoCReports(text);
    }
    
    @When("^I select \"([^\"]*)\" from the drop down list on the filter page$")
    public void i_select_from_the_drop_down_list_on_the_filter_page(String range) throws Throwable {
    	reportHomePage.iSelectFromTheDropdownListOnTheFilterPage(range);
    }
    
    @Then("^I should see Next site of care summary reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_Next_site_of_care_summary_reports_column_Tile_text_as(String tile) throws Throwable {
    	reportHomePage.iShouldSeeNextSiteOfCareSummaryReportsColumnTileTextAs(tile);
    }

    @Then("^I should see Readmissions reports column Tile text as \"([^\"]*)\"$")
    public void i_should_see_Readmissions_reports_column_Tile_text_as(String tile) throws Throwable {
        reportHomePage.iShouldSeeReadmissionsReportsColumnTileTextAs(tile);
    }
    
    @Then("^I should see \"([^\"]*)\" appearing under program overview reports$")
    public void i_should_see_appearing_under_program_overview_reports(String text) throws Throwable {
        reportHomePage.iVerifyTextUnderProgramOverviewReport(text);
    }
    
    @And("^I should see \"([^\"]*)\" under overall program$")
    public void i_Should_See_Under_Overall_Program(String text) throws Throwable {
    	reportHomePage.iShouldSeeUnderOverallProgram(text);
    }
    
    @Then("^I should see \"([^\"]*)\" under program overview reports$")
    public void i_should_see_under_program_overview_reports(String text) throws Throwable {
        reportHomePage.iVerifyTextProgramOverviewReport(text);
    }
    
    @Then("^I verify skilled nursing graph appearing under overall program report$")
    public void i_verify_skilled_nursing_graph_under_report() throws Throwable {
    	reportHomePage.iVerifySkilledNursingGraphUnderReport();
    }
    
    @Then("^I verify long term acute care graph appearing under overall program report$")
    public void i_verify_long_term_acute_graph_under_report() throws Throwable {
    	reportHomePage.iVerifyLongTermAcuteGraphUnderReport();
    }
    
    @Then("^I verify inpatient rehab graph appearing under overall program report$")
    public void i_verify_inpatient_rehab_graph_under_report() throws Throwable {
    	reportHomePage.iVerifyInpatientRehabGraphUnderReport();
    }
    
    @Then("^I verify home health graph appearing under overall program report$")
    public void i_verify_home_health_graph_under_report() throws Throwable {
    	reportHomePage.iVerifyHomeHealthGraphUnderReport();
    }
    
    @Then("^I verify home graph appearing under overall program report$")
    public void i_verify_home_graph_under_report() throws Throwable {
    	reportHomePage.iVerifyHomeGraphUnderReport();
    }
    
    @Then("^I verify other graph appearing under overall program report$")
    public void i_verify_other_graph_under_report() throws Throwable {
    	reportHomePage.iVerifyOtherGraphUnderReport();
    }
    
    @Then("^I verify initial snf length of stay graph appearing under overall program report$")
    public void i_verify_initial_snf_length_of_stay_graph_under_report() throws Throwable {
    	reportHomePage.iVerifyInitialSnfLengthOfStayGraphUnderReport();
    }
    
    @Then("^I verify snf days graph appearing under overall program report$")
    public void i_verify_snf_days_graph_under_report() throws Throwable {
    	reportHomePage.iVerifySnfDaysGraphUnderReport();
    }
    
    @Then("^I verify episodes w readmit graph appearing under overall program report$")
    public void i_verify_episodes_w_readmit_graph_under_report() throws Throwable {
    	reportHomePage.iVerifyEpisodesWReadmitGraphUnderReport();
    }
    
    @Then("^I verify readmits per episode graph appearing under overall program report$")
    public void i_verify_readmits_per_episode_graph_under_report() throws Throwable {
    	reportHomePage.iVerifyReadmitsPerEpisodeGraphUnderReport();
    }
    
    @Then("^I verify episodes graph appearing under overall program report$")
    public void i_verify_episodes_graph_under_report() throws Throwable {
    	reportHomePage.iVerifyEpisodesGraphUnderReport();
    }
    
    @Then("^I verify npra graph appearing under overall program report$")
    public void i_verify_npra_graph_under_report() throws Throwable {
    	reportHomePage.iVerifyNpraGraphUnderReport();
    }
    
    @And("^I verify \"([^\"]*)\" is present on the left side of overall program report$")
    public void i_Verify_Is_Present_On_The_Left_Side_Of_Overall_Program_Report(String text) throws Throwable {
    	reportHomePage.iVerifyFilterOptions(text);
    }
    
    @Then("^I should see partcipant filter on the left side of overall program report$")
    public void i_should_see_participant_filter_on_the_left_side_of_overall_program_reort() throws Throwable {
    	reportHomePage.iVerifyParticipantFilter();
    }
    
    @And("^I click on \"([^\"]*)\" under program overview reports$")
    public void i_click_on_under_program_overview_reports(String text) throws Throwable{
    	reportHomePage.iClickOnProgramOverviewReports(text);
    }
    
    @Then("^I again click on Post Acute Utilization under program overview reports$")
    public void i_again_click_on_post_acute_utilization() throws Throwable {
    	reportHomePage.iAgainClickOnPostAcuteUtilization();
    }
    
    @Then("^I again click on SNF Length of Stay under program overview reports$")
    public void i_again_click_on_snf_length_of_stay() throws Throwable {
    	reportHomePage.iAgainClickOnSNFLengthOfStay();
    }
    
    @Then("^I again click on Readmissions under program overview reports$")
    public void i_again_click_on_redamissions() throws Throwable {
    	reportHomePage.iAgainClickOnReadmissions();
    }
    
    @Then("^I should see daterange filter on the left side of overall program report$")
    public void i_should_see_daterange_filter_on_the_left_side_of_overall_program_reort() throws Throwable {
    	reportHomePage.iVerifyDateRangeFilter();
    }
    
    @Then("^I should see episode initiator filter on the left side of overall program report$")
    public void i_should_see_episode_initiator_filter_on_the_left_side_of_overall_program_reort() throws Throwable {
    	reportHomePage.iVerifyEpisodeInitiatorFilter();
    }
    
    @Then("^I should see facility filter on the left side of overall program report$")
    public void i_should_see_facility_filter_on_the_left_side_of_overall_program_reort() throws Throwable {
    	reportHomePage.iVerifyFacilityFilter();
    }
    
    @Then("^I should see bundle filter on the left side of overall program report$")
    public void i_should_see_bundle_filter_on_the_left_side_of_overall_program_reort() throws Throwable {
    	reportHomePage.iVerifyBundleFilter();
    }
    
    @Then("^I should see bundle risk filter on the left side of overall program report$")
    public void i_should_see_bundle_risk_filter_on_the_left_side_of_overall_program_reort() throws Throwable {
    	reportHomePage.iVerifyBundleRiskFilter();
    }
    
    @Then("^I should see view filter on the left side of overall program report$")
    public void i_should_see_view_filter_on_the_left_side_of_overall_program_reort() throws Throwable {
    	reportHomePage.iVerifyViewFilter();
    }
    
    @Then("^I should see data source filter on the left side of overall program report$")
    public void i_should_see_data_source_filter_on_the_left_side_of_overall_program_reort() throws Throwable {
    	reportHomePage.iVerifyDataSourceFilter();
    }
    
    @And("^I click on \"([^\"]*)\" option appearing under view filter$")
    public void i_click_on_option_appearing_under_view_filter(String text) throws Throwable{
    	reportHomePage.iClickOnTableOptionForViewFilter(text);
    }
    
    @Then("^I select \"([^\"]*)\" radio button under data source filter$")
    public void i_select_radio_button_under_data_source_filter(String text) throws Throwable {
    	reportHomePage.iSelectEpisodeConnectRadioButton(text);
    }
    
    @Then("^I should see \"([^\"]*)\" table under overall program report$")
    public void i_should_see_table_under_overall_program_report(String text) throws Throwable {
    	reportHomePage.iSeeOverallProgramReport(text);
    }
    
    @Then("^I should see claims table under post acute utilization report$")
    public void i_should_seeclaims_table_under_post_acute_utilization_report() throws Throwable {
    	reportHomePage.iSeeClaimsReportForPostAcuteUtlization();
    }
    
    @Then("^I should see claims table under SNF Length of stay report$")
    public void i_should_seeclaims_table_under_SNF_Length_of_stay_report() throws Throwable {
    	reportHomePage.iSeeClaimsReportForSNFLengthofStay();
    }
    
    @Then("^I should see claims table under Readmissions report$")
    public void i_should_seeclaims_table_under_Readmissions_report() throws Throwable {
    	reportHomePage.iSeeClaimsReportForReadmissions();
    }
    
    @Then("^I should see \"([^\"]*)\" table under post acute utilization report$")
    public void i_should_see_table_under_post_acute_utlization_report(String text) throws Throwable {
    	reportHomePage.iSeePostAcuteUtilizationReport(text);
    }
    
    @Then("^I should see \"([^\"]*)\" table under SNF length of stay report$")
    public void i_should_see_table_under_SNF_length_of_stay_report(String text) throws Throwable {
    	reportHomePage.iSeeSNFLengthofStayReport(text);
    }
    
    @Then("^I should see \"([^\"]*)\" table under readmissions report$")
    public void i_should_see_table_under_readmissions_report(String text) throws Throwable {
    	reportHomePage.iSeeReadmissionsReport(text);
    }
    
    @And("^I click on \"([^\"]*)\" button under skilled nursing graph for post accute utilization report$")
    public void i_click_on_button_under_skilled_nursing_graph_for_post_accute_utilization(String text) throws Throwable{
    	reportHomePage.iClickOnSkilledNursingZoom(text);
    }
    
    @And("^I click on \"([^\"]*)\" button under inpatient rehab graph for post accute utilization report$")
    public void i_click_on_button_under_inpatient_rehab_graph_for_post_accute_utilization(String text) throws Throwable{
    	reportHomePage.iClickOnInpatientRehabZoom(text);
    }
    
    @And("^I click on \"([^\"]*)\" button under long term acute care graph for post accute utilization report$")
    public void i_click_on_button_under_long_term_acute_care_graph_for_post_accute_utilization(String text) throws Throwable{
    	reportHomePage.iClickOnLongTermAcuteCareZoom(text);
    }
    
    @And("^I click on \"([^\"]*)\" button under home health graph for post accute utilization report$")
    public void i_click_on_button_under_home_health_graph_for_post_accute_utilization(String text) throws Throwable{
    	reportHomePage.iClickOnHomeHealthZoom(text);
    }
    
    @And("^I click on \"([^\"]*)\" button under home graph for post accute utilization report$")
    public void i_click_on_button_under_home_graph_for_post_accute_utilization(String text) throws Throwable{
    	reportHomePage.iClickOnHomeZoom(text);
    }
    
    @And("^I click on \"([^\"]*)\" button under other graph for post accute utilization report$")
    public void i_click_on_button_under_other_graph_for_post_accute_utilization(String text) throws Throwable{
    	reportHomePage.iClickOnOtherZoom(text);
    }
       
    @Then("^I verify \"([^\"]*)\" text appearing on the \"([^\"]*)\" graph$")
    public void i_verify_text_appearing_on_the_graph(String text,String graph) throws Throwable{
    	reportHomePage.iVerifyZoomOutText(text,graph);
    }
    
    @And("^I click on export symbol on \"([^\"]*)\" graph$")
    public void i_click_on_export_symbol_on_graph(String export) throws Throwable{
    	reportHomePage.iClickOnExportSymbol(export);
    }
    
    @Then("^I Verify \"([^\"]*)\" is appearing after clicking on \"([^\"]*)\" export symbol$")
    public void i_verify_is_appearing_after_clicking_on_export_symbol(String text,String Graph) throws Throwable{
    	reportHomePage.iVerifyAppearingClickingExport(text, Graph);
    }
    
    @And("^I click on \"([^\"]*)\" option under \"([^\"]*)\" export symbol$")
    public void i_click_on_option_under_export_symbol(String text,String Graph) throws Throwable{
    	reportHomePage.iClickOnOptionUnderExportSymbol(text, Graph);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under Export Options for \"([^\"]*)\" graph$")
    public void i_verify_is_appearing_under_export_options_for_graph(String text,String Graph) throws Throwable{
    	reportHomePage.iVerifyUnderExportOptions(text, Graph);
    }
    
    @And("^I click on \"([^\"]*)\" Export Options for \"([^\"]*)\" graph$")
    public void i_click_on_export_option_for_graph(String text,String Graph) throws Throwable{
    	reportHomePage.iClickOnExportOption(text, Graph);
    }
    
    @Then("^I verify graph appearing under export options popup$")
    public void i_verify_graph_appearing_under_export_options_popup()throws Throwable{
    	reportHomePage.iVerifyGraphUnderExportOptionsPopUp();
    }
    
    @Then("^I close the export options popup$")
    public void i_close_the_export_options_popup()throws Throwable{
    	reportHomePage.iCloseTheExportOptionsPopUp();
    }
    
    @Then("^I should click on \"([^\"]*)\" option under \"([^\"]*)\" export symbol$")
    public void i_click_on_XLS_CSV_option_under_export_symbol(String text,String Graph) throws Throwable{
    	reportHomePage.iClickOnXLSCSVOptionUnderExportSymbol(text, Graph);
    }
    
    @Then("^I Should see \"([^\"]*)\" is appearing after clicking on \"([^\"]*)\" export symbol$")
    public void i_should_see_is_appearing_after_clicking_on_export_symbol(String text,String Graph) throws Throwable{
    	reportHomePage.iShouldSeeAppearingClickingExport(text, Graph);
    }
    
    @Then("^I scroll the page to bottom by \"([^\"]*)\"$")
    public void i_scroll_the_page_to_bottom(String text) throws Throwable{
    	reportHomePage.iScrollPageToBottom(text);
    }
    
    @Then("^I Click on \"([^\"]*)\" button appearing under benchmark in filter options$")
    public void i_click_on_button_appearing_under_benchmark_in_filter_option(String text) throws Throwable{
    	reportHomePage.iClickOnAdjustHistoricButton(text);
    }
    
    @And("^I verify current url is not changed after clicking on adjusted historic button$")
    public void i_verify_cuurent_url_is_not_changed_after_clicking_on_adjusted_historic_button() throws Throwable{
    	reportHomePage.IVerifyURLAfterClickingAdjustedHistoricButton();
    }
     
    @Then("^I uncheck All option under \"([^\"]*)\" filter in the filter options$")
    public void i_select_all_option_under_filter_in_the_filter_option(String filter) throws Throwable{
    	reportHomePage.iSelectFilterInFilterOptions(filter);
    }
    
    @Then("^I click on date range filter under filter options for program overview reports$")
    public void i_click_on_date_range_filter_under_filter_options_for_program_overview_reports() throws Throwable{
    	reportHomePage.iClickOnDateRangeFilter();
    }
    
    @And("^I click on start range box to select date$")
    public void i_click_on_start_range_box_to_select_date() throws Throwable{
    	reportHomePage.ISelectStartDateRangeDates();
    }
    
    @And("^I click on end range box to select date$")
    public void i_click_on_end_range_box_to_select_date() throws Throwable{
    	reportHomePage.ISelectEndDateRangeDates();
    }
    
    @Then("^I select \"([^\"]*)\" month in the \"([^\"]*)\" date range filter$")
    public void i_select_month_in_the_date_range_filter(String month,String range) throws Throwable{
    	reportHomePage.iSelectMonthInDateRange(month, range);
    }
    
    @Then("^I click on apply button under date range filter$")
    public void i_click_on_apply_button_under_date_range_filter() throws Throwable{
    	reportHomePage.iClickOnApplyButtonForDateRangeFilter();
    }
    
    @Then("^I select End month \"([^\"]*)\" in the calendar$")
    public void i_select_end_month_in_the_calendar(String enddate) throws Throwable{
    	reportHomePage.iClickOnEndMonthDate(enddate);
    }
    
    @When("^I click on show all filters icon button$")
    public void i_click_on_show_all_filters_icon_button() throws Throwable{
    	reportHomePage.iClickOnShowAllFiltersIcon();
    }
    
    @When("^I click on filter count label to see preselected filters$")
    public void i_click_on_filter_count_label_to_see_preselected_filters() throws Throwable{
    	reportHomePage.iClickOnFiltersCountLabel();
    }
    
    @Then("^I verify \"([^\"]*)\" filter is preselected under the filter$")
    public void i_verify_preselected_under_the_filter(String text) throws Throwable{
    	reportHomePage.iVerifyPreselectedModelFilter(text);
    }
    
    @Then("^I should see \"([^\"]*)\" is present under preselected model filter$")
    public void i_should_see_is_present_under_preselected_model_filter(String text) throws Throwable{
    	reportHomePage.iSeeModelFilterPreselected(text);
    }
    
    @Then("^I should see \"([^\"]*)\" is present under preselected participant id filter$")
    public void i_should_see_is_present_under_preselected_participant_id_filter(String text) throws Throwable{
    	reportHomePage.iSeeParticipantIDFilterPreselected(text);
    }
    
    @Then("^I should see \"([^\"]*)\" is present under preselected post acute category filter$")
    public void i_should_see_is_present_under_preselected_post_acute_category_filter(String text) throws Throwable{
    	reportHomePage.iSeePostAcuteCategoryFilterPreselected(text);
    }
    
    @Then("^I should see \"([^\"]*)\" is present under preselected BPID filter$")
    public void i_should_see_is_present_under_preselected_bpid_filter(String text) throws Throwable{
    	reportHomePage.iSeeBPIDFilterPreselected(text);
    }
    
    @Then("^I should see \"([^\"]*)\" is present under preselected Bundle Code filter$")
    public void i_should_see_is_present_under_preselected_bundle_code_filter(String text) throws Throwable{
    	reportHomePage.iSeeBundleCodeFilterPreselected(text);
    }
    
    @Then("^I should see \"([^\"]*)\" is present under preselected Dashboard Anchor CCN filter$")
    public void i_should_see_is_present_under_preselected_dashboard_anchor_ccn_filter(String text) throws Throwable{
    	reportHomePage.iSeeDashboardAnchorCCNFilterPreselected(text);
    }
    
    @Then("^I should see \"([^\"]*)\" is present under preselected anchor month filter$")
    public void i_should_see_is_present_under_preselected_anchor_month_filter(String text) throws Throwable{
    	reportHomePage.iSeeAnchorMonthFilterPreselected(text);
    }
    
    @Then("^I should see \"([^\"]*)\" under \"([^\"]*)\" field$")
    public void i_should_see_under__filed(String text,String field) throws Throwable{
    	reportHomePage.iSeeUnderMeasuresField(text,field);
    }
    
    @Then("^I should see \"([^\"]*)\" appearing under \"([^\"]*)\" field$")
    public void i_should_see_appearing_under__filed(String text,String field) throws Throwable{
    	reportHomePage.iSeeUnderLevelTimeField(text,field);
    }
    
    @Then("^I should see \"([^\"]*)\" for Nsoc Summary under \"([^\"]*)\" field$")
    public void i_should_see_for_NSoC_summary_under__filed(String text,String field) throws Throwable{
    	reportHomePage.iSeeUnderNSOCLevelTimeField(text, field);
    }
    
    @Then("^I should see \"([^\"]*)\" for SNF LOS Summary under \"([^\"]*)\" field$")
    public void i_should_see_for_SNF_LOS_summary_under__filed(String text,String field) throws Throwable{
    	reportHomePage.iSeeUnderNSOCLevelTimeField(text, field);
    }
    
    @Then("^I click on a number under episodes column$")
    public void i_click_on_a_number_under_episodes_column() throws Throwable{
    	reportHomePage.iClickOnFirstNumberUnderEpisodesColumn();
    }
    
    @Then("^I click on a number under episodes column of spending claims report$")
    public void i_click_on_a_number_under_episodes_column_of_spending_claims_report() throws Throwable{
    	reportHomePage.iClickOnEpisodeNumberUnderEpisodesColumnofSpendingClaimsReport();
    }
    
    @Then("^I click on one of the episode column number under Episode with DRG Issue Report$")
    public void i_click_on_One_of_the_episode_column_number_under_episode_with_drg_issue_report() throws Throwable{
    	reportHomePage.iClickOnEpisodesColumnNumberForEpisodewithDRGIssues();
    }
    
    @Then("^I should verify \"([^\"]*)\" is appearing under Episodes table$")
    public void i_should_verify_is_appearing_under_episodes_table(String text) throws Throwable{
    	reportHomePage.iShouldVerifyInEpisodesTable(text);
    }
    
    @Then("^I remove \"([^\"]*)\" field filter under \"([^\"]*)\" filter field from default filters$")
    public void i_remove_field_filter_under_filter_field_from_default_filters(String field,String title) throws Throwable{
    	reportHomePage.iRemoveDeefaultFilters(field, title);
    }
    
    @Then("^I select \"([^\"]*)\" discharge month in anchor discharge month filter$")
    public void i_select_discharge_month_in_anchor_discharge_month_filter(String text) throws Throwable{
    	reportHomePage.iSelectCurrentMonthInAnchorDischargeMonth(text);
    }
    
    @When("^I click on filters toggle button$")
    public void i_click_on_filters_toggle_button() throws Throwable{
    	reportHomePage.iClickOnFiltersToggleButton();
    }
    
    @When("^I click on layout toggle button$")
    public void i_click_on_layout_toggle_button() throws Throwable{
    	reportHomePage.iClickOnLayoutToggleButton();
    }
    
    @When("^I click on edit toggle button$")
    public void i_click_on_edit_toggle_button() throws Throwable{
    	reportHomePage.iClickOnEditToggleButton();
    }
    
    @Then("^I should see \"([^\"]*)\" is appearing under preselected filter$")
    public void i_should_see_is_appearing_under_preselected_filter(String text) throws Throwable{
    	reportHomePage.iSeePreselectedFilters(text);
    }
    
    @Then("^I verify Initial SNF Length of Stay Summary reports column text as \"([^\"]*)\"$")
    public void i_verify_initial_snf_length_of_stay_summary_report_column_text(String tile) throws Throwable{
    	reportHomePage.iVerifyInitialSNFLengthOfStaySummaryReportsColumnTextAs(tile);
    }
    
    @And("^I select the radio button of select from list$")
    public void i_select_the_radio_button_of_select_from_list() throws Throwable{
    	reportHomePage.iSelectRadioButtonOfSelectFromList();
    }
   
    @When("^I click on \"([^\"]*)\" under anchor admission month filter$")
    public void i_click_on_under_anchor_admission_month_filter(String month) throws Throwable{
    	reportHomePage.iClickOnAnchorAdmissionMonth(month);
    }
    
    @Then("^I should not see \"([^\"]*)\" report after clicking on next site of care$")
    @And("^I should not see \"([^\"]*)\" report after clicking on patient id$")
    @When("^I should not see \"([^\"]*)\" report after clicking on readmissions$")
    public void i_should_not_see_report_after_clicking_on_next_site_of_care(String report) throws Throwable{
    	reportHomePage.iShouldNotSeeReportName(report);
    }
    
    @When("^I click on select from list option on the filter page$")
    public void i_click_on_select_from_list_option_on_the_filter_page() throws Throwable{
    	reportHomePage.iSelectFromListOnFilterPage();
    }
    
    @Then("^I click on \"([^\"]*)\" claims graph point under overall program of program overview report$")
    public void i_click_on_graph_point_under_overall_program_overview_report(String npra) throws Throwable{
    	reportHomePage.iClickOnNPRAGraphPoint(npra);
    }
    
    @Then("^I verify \"([^\"]*)\" in the new window after clicking on the graph point$")
    public void i_verify_in_the_new_window_after_clicking_on_the_graph_point(String text) throws Throwable{
    	reportHomePage.iVerifyInTheNewWindowAfterClickingOnGraph(text);
    }
    
    @Then("^I click on skilled nursing \"([^\"]*)\" claims graph point under post acute utilization of program overview report$")
    public void i_click_on_skilled_nursing_claims_graph_point_under_postacuteutilization_of_program_overview_report(String text) throws Throwable{
    	reportHomePage.iClickOnGrpahPointForPostAcuteUtilization(text);
    }
    
    @Then("^I click on long term acute care \"([^\"]*)\" claims graph point under post acute utilization of program overview report$")
    public void i_click_on_long_term_acute_care_claims_graph_point_under_postacuteutilization_of_program_overview_report(String text) throws Throwable{
    	reportHomePage.iClickOnGrpahPointForPostAcuteUtilization(text);
    }
    
    @Then("^I click on inpatient rehab \"([^\"]*)\" claims graph point under post acute utilization of program overview report$")
    public void i_click_on_inpatient_rehab_claims_graph_point_under_postacuteutilization_of_program_overview_report(String text) throws Throwable{
    	reportHomePage.iClickOnGrpahPointForPostAcuteUtilization(text);
    }
    
    @Then("^I click on home health \"([^\"]*)\" claims graph point under post acute utilization of program overview report$")
    public void i_click_on_home_health_claims_graph_point_under_postacuteutilization_of_program_overview_report(String text) throws Throwable{
    	reportHomePage.iClickOnGrpahPointForPostAcuteUtilization(text);
    }
    
    @Then("^I click on \"([^\"]*)\" claims graph point under post acute utilization of program overview report$")
    public void i_click_on_graph_point_under_postacuteutilization_of_program_overview_report(String text) throws Throwable{
    	reportHomePage.iClickOnGrpahPointForHome(text);
    }
    
    @Then("^I click on \"([^\"]*)\" graph point of claims under post acute utilization of program overview report$")
    public void i_click_on_graph_point_of_claims_under_postacuteutilization_of_program_overview_report(String text) throws Throwable{
    	reportHomePage.iClickOnOtherGraphPostAcuteUtilizationGraphPoint(text);
    }
    
    @Then("^I click on initial snf length of stay \"([^\"]*)\" claims graph point under snf length of stay of program overview report$")
    public void i_click_on_initial_snf_length_of_stay_claims_graph_point_under_postacuteutilization_of_program_overview_report(String text) throws Throwable{
    	reportHomePage.iClickOnGrpahPointForSNFLengthOfStay(text);
    }
    
    @Then("^I click on snf days \"([^\"]*)\" claims graph point under snf length of stay of program overview report$")
    public void i_click_on_snf_days_claims_graph_point_under_postacuteutilization_of_program_overview_report(String text) throws Throwable{
    	reportHomePage.iClickOnGrpahPointForSNFLengthOfStay(text);
    }
    
    @Then("^I click on episodes w readmit \"([^\"]*)\" claims graph point under readmissions of program overview report$")
    public void i_click_on_episodes_w_readmit_claims_graph_point_under_readmissions_of_program_overview_report(String text) throws Throwable{
    	reportHomePage.iClickOnGrpahPointForReadmissions(text);
    }
    
    @Then("^I click on readmits per episode \"([^\"]*)\" claims graph point under readmissions of program overview report$")
    public void i_click_on_readmits_per_episodes_claims_graph_point_under_readmissions_of_program_overview_report(String text) throws Throwable{
    	reportHomePage.iClickOnGrpahPointForreadmitperepisodeunderReadmissions(text);
    }
    
    @And("^I enter \"([^\"]*)\" in the search field textbox after clicking on list option$")
    public void i_enter_anchoradmissionquarter_in_the_search_field_textbox_after_clicking_on_list_option(String text)throws Throwable{
    	reportHomePage.iEnterAnchorAdmissionQuarterInSearchField(text);
    }
    
    @Then("^I click on find button after entering anchor admission quarter in the textbox$")
    public void i_click_on_find_button_after_entering_anchor_admission_quarter_in_the_textbox()throws Throwable{
    	reportHomePage.iClickOnFindButtonAfterEnteringAnchorAdmissionQuarter();
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under preselected anchor admission date filter$")
    public void i_verify_anchor_admission_year_appearing_under_preselected_filter(String text) throws Throwable{
    	reportHomePage.iVerifyAnchorAdmissionYearPreSelectedFilter(text);
    }
    
    @Then("^I click on \"([^\"]*)\" filter under filter options$")
    public void i_click_on_facility_filter_under_filter_options(String facility) throws Throwable{
    	reportHomePage.iClickOnFacilityFilterUnderFilterOptions(facility);
    }
    
    @Then("^I uncheck selected All options under \"([^\"]*)\" filter options$")
    public void i_uncheck_selected_all_options_under_filter_options(String text) throws Throwable{
    	reportHomePage.iUncheckAllOptionForFacilityFilter(text);
    }
    
    @Then("^I select \"([^\"]*)\" from the facility filter dropdown under filter options$")
    public void i_select_from_the_facility_filter_dropdown_under_filter_options(String text) throws Throwable{
    	reportHomePage.iSelectFaciltyFromFacilityFilterUnderProgramOverviewReport(text);
    }
    
    @Then("^I click on apply button for facility filter under filter options$")
    public void i_click_on_apply_button_for_facility_filter_under_filter_options() throws Throwable{
    	reportHomePage.iClickOnApplyButtonUnderFaciltyFilterOptions();
    }
    
    @Then("^I click on \"([^\"]*)\" button for view filter under filter options$")
    public void i_click_on_button_for_view_filter_under_filter_options(String text) throws Throwable{
    	reportHomePage.iClickOnTableViewOptionUnderViewFilter(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under overall program table view data$")
    public void i_verify_is_appearing_under_overall_program_table_view_data(String text) throws Throwable{
    	reportHomePage.iVerifyClaimsandeEcTextUnderOverallProgram(text);
    }
    
    @Then("^I should see ec data is appearing with color \"([^\"]*)\" for episodes column under overall program$")
    public void i_should_see_ec_data_is_appearing_with_color_for_episodes_column_under_overall_program(String color) throws Throwable{
    	reportHomePage.iShouldSeeEcandClaimsDatawithColorForEpisodesColumnUnderOverallProgram(color);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under post acute utilization table view data$")
    public void i_verify_is_appearing_under_post_acute_utilization_table_view_data(String text) throws Throwable{
    	reportHomePage.iVerifyClaimsandEcTextUnderPostAcuteUtilization(text);
    }
    
    @Then("^I should see ec data is appearing with color \"([^\"]*)\" for all columns under post acute utilization$")
    public void i_should_see_ec_data_is_appearing_with_color_for_all_columns_under_post_acute_utilization(String color) throws Throwable{
    	reportHomePage.iShouldSeeEcandClaimsDatawithColorForEpisodesColumnUnderPostAcuteUtilization(color);
    }
    
    @Then("^I should see claims data is appearing with color \"([^\"]*)\" for episodes column under overall program$")
    public void i_should_see_claims_data_is_appearing_with_color_for_episodes_column_under_overall_program(String color) throws Throwable{
    	reportHomePage.iShouldSeeEcandClaimsDatawithColorForEpisodesColumnUnderOverallProgram(color);
    }
    
    @Then("^I should see claims data is appearing with color \"([^\"]*)\" for all columns under post acute utilization$")
    public void i_should_see_claims_data_is_appearing_with_color_for_all_columns_under_post_acute_utilization(String color) throws Throwable{
    	reportHomePage.iShouldSeeEcandClaimsDatawithColorForEpisodesColumnUnderPostAcuteUtilization(color);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under snf length of stay table view data$")
    public void i_verify_is_appearing_under_snf_length_of_stay_table_view_data(String text) throws Throwable{
    	reportHomePage.iVerifyClaimsandEcTextUnderSnfLengthOfStay(text);
    }
    
    @Then("^I should see ec data is appearing with color \"([^\"]*)\" for all columns under snf length of stay$")
    public void i_should_see_ec_data_is_appearing_with_color_for_all_columns_under_snf_length_of_stay(String color) throws Throwable{
    	reportHomePage.iShouldSeeEcandClaimsDatawithColorForEpisodesColumnUnderSnfLengthOfStay(color);
    }
    
    @Then("^I should see claims data is appearing with color \"([^\"]*)\" for all columns under snf length of stay$")
    public void i_should_see_claims_data_is_appearing_with_color_for_all_columns_under_snf_length_of_stay(String color) throws Throwable{
    	reportHomePage.iShouldSeeEcandClaimsDatawithColorForEpisodesColumnUnderSnfLengthOfStay(color);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under readmissions table view data$")
    public void i_verify_is_appearing_under_readmissions_table_view_data(String text) throws Throwable{
    	reportHomePage.iVerifyClaimsandEcTextUnderReadmissions(text);
    }
    
    @Then("^I should see ec data is appearing with color \"([^\"]*)\" for all columns under readmissions$")
    public void i_should_see_ec_data_is_appearing_with_color_for_all_columns_under_readmissions(String color) throws Throwable{
    	reportHomePage.iShouldSeeEcandClaimsDatawithColorForEpisodesColumnUnderReadmissions(color);
    }
    
    @Then("^I should see claims data is appearing with color \"([^\"]*)\" for all columns under readmissions$")
    public void i_should_see_claims_data_is_appearing_with_color_for_all_columns_under_readmissions(String color) throws Throwable{
    	reportHomePage.iShouldSeeEcandClaimsDatawithColorForEpisodesColumnUnderReadmissions(color);
    }
    
    @Then("^I click on skilled nursing \"([^\"]*)\" ec graph point under post acute utilization of program overview report$")
    public void i_click_on_skilled_nursing_ec_graph_point_under_postacuteutilization_of_program_overview_report(String text) throws Throwable{
    	reportHomePage.iClickOnGrpahPointForPostAcuteUtilization(text);
    }
    
    @And("^I choose add to report option from select options of filter field$")
    public void iChooseAddToReportOptionFromSelectOptionsFilterField() throws Throwable {
        reportHomePage.iChooseOptionsFromFilterWithXpath("//td[@id='cmdFieldAdd_text']");
    }
    
    @Then("^I verify the DOB column format is in ([^\"]*) for \"([^\"]*)\"$")
    public void i_Verify_the_DOB_Column_Format_is_in_yyyy_mm_dd(String format,String text) throws Throwable{
    	reportHomePage.iVerifyDOBColumnValueFormat(format,text);
    }
    
    @Then("^I enter \"([^\"]*)\" in the search field textbox for filters$")
    public void i_Enter_dob_in_the_search_field_textbox_for_filters(String dob) throws Throwable{
    	reportHomePage.iEnterInTheSearchFieldForFilters(dob);
    }

    @Then("I verify \"([^\"]*)\" is appearing under date range filter option on the left side")
    public void i_verify_is_appearing_under_date_range_filter_option_on_the_left_side(String range) throws Throwable{
    	reportHomePage.iVerifyDateRangeFilterInFilterOptions(range);
    }
    
    @Then("I click on year text box and select ([^\"]*) from the year field")
    public void i_click_on_year_text_box_and_select_from_the_year_field(String year) throws Throwable {
    	reportHomePage.iClickOnYearTextBoxInsideDateRangeFilter(year);
    }
    
    @Then("I click the ([^\"]*) appearing under \"([^\"]*)\" field filter under filter options")
    public void i_check_the_appearing_under_participant_field_filter_under_filter_options(String participant,String text) throws Throwable{
    	reportHomePage.iClickOnParticiapntFieldFilterUnderFilterOptions(participant,text);
    }
    
    @Then("I verify \"([^\"]*)\" is appearing under \"([^\"]*)\" filter field after applying filter")
    @And("^I verify \"([^\"]*)\" is appearing under \"([^\"]*)\" filter field in performance scorecard dashboard page$")
    public void i_verify_is_appearing_under_participant_filter_field_after_aplying_filter(String participant,String text) throws Throwable{
    	reportHomePage.iVerifyParticipantFieldAfterApplyingFilter(participant,text);
    }
    
    @Then("I click on apply button under the filter in filter options")
    public void i_click_on_apply_button_under_the_filter_in_filter_options() throws Throwable{
    	reportHomePage.iClickOnApplyButtonForFilterInFilterOptions();
    }
    
    @And("I enter ([^\"]*) under the \"([^\"]*)\" field searchbox")
    public void i_enter_under_the_field_searchbox(String part,String text) throws Throwable{
    	reportHomePage.iEnterTheValueInSearchField(part, text);
    }
    
    @Then("I click the ([^\"]*) appearing under facility field filter under filter options")
    public void i_click_the_appearing_under_facility_field_filter_under_filter_options(String text) throws Throwable {
    	reportHomePage.iClickOnAppearingFacilityAfterSearching(text);
    }
    
    @Then("I click on \"([^\"]*)\" filter in the filter options")
    public void i_click_on_filter_in_the_filter_options(String text) throws Throwable{
    	reportHomePage.iClickOnFilterUnderFilterOptions(text);
    }
    
    @And("I wait for the reports embedded iframe to load")
    public void i_wait_for_the_reports_embedded_iframe_to_load() throws Throwable{
    	reportHomePage.iWaitforTheReportsEmbeddedIframeToLoad();
    }
    
    @And("I will wait to see \"([^\"]*)\" is appearing inside the iframe")
    @Then("^I will wait to see \"([^\"]*)\" is appearing in the new window$")
    public void i_will_wait_to_see_is_appearing_inside_the_iframe(String reportname) throws Throwable{
    	reportHomePage.iWillWaitToSeeReportNameInsideIframe(reportname);
    }
    
    @And("I wait to see \"([^\"]*)\" tile")
    public void i_wait_to_see_tile(String tile) throws Throwable{
    	reportHomePage.iWaitToseeTile(tile);
    }
    
    @And("I wait to see \"([^\"]*)\" under reports tile text")
    public void i_wait_to_see_under_reports_tile_text(String report) throws Throwable{
    	reportHomePage.iWaitToSeeUnderReportsTileText(report);
    }
    
    @And("I wait for the elements to load in new window after clicking one of the episode")
    public void i_wait_for_the_elements_to_load_in_new_window_after_clicking_one_of_the_episode() throws Throwable{
    	reportHomePage.iWaitForElementsToLoadInNewWindow();
    }
    
    @And("I wait until refresh button is disappeared")
    public void i_wait_until_refresh_button_is_disappeared() throws Throwable{
    	reportHomePage.iWaitUntillRefreshButtonDisappeared();
    }
    
    @Then("I wait until loading icon disappears in program overview report")
    public void i_wait_until_loading_icon_disappears_in_program_overview_report() throws Throwable{
    	reportHomePage.iWaitUntillLoadingIconDisappears();
    }
    
    @And("I will wait to see \"([^\"]*)\" under program overview report in iframe")
    public void i_will_wait_to_see_under_program_overiview_report_in_iframe(String text) throws Throwable{
    	reportHomePage.iWaitToSeeOverallProgramUnderDashboardReport(text);
    }
    
    @And("I will wait to see \"([^\"]*)\" is appearing after clicking graph point")
    public void i_will_wait_to_see_is_appearing_after_clicking_graph(String reportname) throws Throwable{
    	reportHomePage.iWillWaitToSeeReportNameAfterClickingGraph(reportname);
    }
    
    @And("I wait until loading message disappears inside frame in reports")
    @Then("^I wait until loading message disappears in the new window after clicking on element$")
    public void i_wait_until_loading_message_disappears_inside_frame_in_reports() throws Throwable{
    	reportHomePage.iWaitUntillLoadingMessageDisappearsIndideFrameInReports();
    }
    
    @And("^I click on \"([^\"]*)\" in the filter value list for anchor facility$")
    public void i_click_on_in_the_filter_value_list_for_anchor_facility(String filterText) throws Throwable {
         reportHomePage.iClickOnAnchorFacilityTextFromFilterValueListSingleQuotes(filterText);
    }
    
    @Then("^I click on \"([^\"]*)\" appearing in the new window after clicking on drill through$")
    public void i_click_on_select_column_appearing_in_new_window_after_clicking_on_drill_through(String text) throws Throwable{
    	reportHomePage.iClickOnSelectColumnInNewWindowAfterClikingDrillThrough(text);
    }
    
    @Then("^I verify \"([^\"]*)\" title is appearing on popup after clicking select columns$")
    public void i_verify_title_is_appearing_on_popup_after_clicking_select_columns(String text) throws Throwable{
    	reportHomePage.iVerifyTitleOnPopupAfterClickingSelectColumns(text);
    }
    
    @And("^I click on \"([^\"]*)\" checkbox under \"([^\"]*)\" in the popup of select drill through columns$")
    public void i_click_checkbox_of_selectdrill_through_columns_popup(String text,String type) throws Throwable{
    	reportHomePage.iClickOnCheckBoxInEpisodeDrillThroughPopUp(text,type);
    }
    
    @And("^I click on ok button after selecting drill through column$")
    public void i_click_on_ok_button_after_selecting_drill_through_column() throws Throwable {
        reportHomePage.iClickOkButtonFromFilterModal();
    }
    
    @When("^I enter \"([^\"]*)\" in the search field box under select drill through columns$")
    public void i_enter_in_the_search_field_box_under_select_drill_through_columns(String text) throws Throwable{
    	reportHomePage.iEnterValueInTextBoxUnderSelectDrillThroughColumns(text);
    }
    
    @Then("^I should see \"([^\"]*)\" appearing under physician dashboard reports$")
    public void i_should_see_appearing_under_physician_dashboard_reports(String text) throws Throwable {
        reportHomePage.iVerifyTextUnderPhysicianDashboardReport(text);
    }
    
    @Then("^I wait until loading icon disappears in physician dashboard report$")
    public void i_wait_until_loading_icon_disappears_in_physician_dashboard_report() throws Throwable{
    	reportHomePage.iWaitUntillLoadingIconDisappears();
    }
    
    @When("^I click the first name under attributed physican column$")
    public void i_click_the_first_name_under_attributed_physician_column() throws Throwable{
    	reportHomePage.iClickOnFirstNameUnderAttributedPhysicianColumn();
    }
    
    @And("^I will wait to see \"([^\"]*)\" in the newly opened tab after clicking attributed physician$")
    public void i_will_wait_to_see_in_the_newly_opened_tab_after_clicking_attributed_physician(String text) throws Throwable{
    	reportHomePage.iWillWaitToSeeAfterClickingAttributedPhysicianName(text);
    }
    
    @Then("^I verify scorecards appearing on performance scorecard dashboard page$")
    @And("^I verify the user is on the same page by verifying the performance scorecards are appearing$")
    public void i_verify_scorecards_appearing_on_the_performance_scorecard_dashboard_page() throws Throwable{
    	reportHomePage.iVerifyScorecardsUnderPerformanceScoreCardDashboard();
    }
    
    @Then("^I verify \"([^\"]*)\" scorecard is appearing under performance scorecard$")
    @And("^I verify \"([^\"]*)\" KPI is appearing under performance scorecard$")
    public void i_verify_scorecard_is_appearing_under_performance_scorecard(String text) throws Throwable{
    	reportHomePage.iVerifyScorecardUnderPerformanceScorecard(text);
    }
    
    @Then("^I verify initially top \"([^\"]*)\" physicians are loaded$")
    public void i_verify_initially_top_physicians_are_loaded(String text) throws Throwable{
    	reportHomePage.iVerifyInitiallyTop100PhysiciansLoaded(text);
    }
    
    @Then("^I verify \"([^\"]*)\" physicians are present under attributed physician column on dashboard physician report$")
    public void i_verify_physician_count_under_attributed_physician_column_on_dashboard_physician_report(int count) throws Throwable{
    	reportHomePage.iVerifyPhysicianCountUnderAttributedPhysicians(count);
    }
    
    @Then("^I verify \"([^\"]*)\" count button appearing on the dashborad physician page$")
    public void i_verify_count_button_appearing_on_the_dashboard_physician_page(String text) throws Throwable{
    	reportHomePage.iVerifyDiffernetCountButtonsOnDashboardPhyisician(text);
    }
    
    @Then("^I verify pagination section is appearing above of physicians on the dashboard physician page$")
    public void i_verify_pagination_section_is_appearing_on_the_dashboard_physician_page() throws Throwable{
    	reportHomePage.iVerifyPaginationIsPresentAboveOnDashboardPhysicianPage();
    }
    
    @And("^I verify \"([^\"]*)\" tab is appearing above physicians inside the pagination section on dashboard physician page$")
    public void i_verify_tab_is_appearing_inside_the_pagination_section_on_dashboard_physician_page(String text) throws Throwable{
    	reportHomePage.iVerifyTabsAppearingUnderPaginationOnAbovePagination(text);
    }
    
    @Then("^I verify pagination section is appearing at bottom of physicians on the dashboard physician page$")
    public void i_verify_pagination_section_is_appearing_at_bottom_of_physician_on_the_dashboard_physician_page() throws Throwable{
    	reportHomePage.iVerifyPaginationIsPresentBottomOnDashboardPhysicianPage();
    }
    
    @And("^I verify \"([^\"]*)\" tab is appearing below physicians inside the pagination section on dashboard physician page$")
    public void i_verify_tab_is_appearing_below_physicians_inside_the_pagination_section_on_dashboard_physician_page(String text) throws Throwable{
    	reportHomePage.iVerifyTabsAppearingUnderPaginationOnBelowPagination(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing above physicians on dashboard physician report$")
    public void i_verify_onetohundread_appearing_above_physicians_on_dashboard_physician_report(String text) throws Throwable{
    	reportHomePage.iVerifyOneToHundreadAbovePhysicians(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing below physicians on dashboard physician report$")
    public void i_verify_onetohundread_appearing_below_physicians_on_dashboard_physician_report(String text) throws Throwable{
    	reportHomePage.iVerifyOneToHundreadBelowPhysicians(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under filter options in newly opened scorecard page$")
    @And("^I verify \"([^\"]*)\" is appearing under filter options in newly opened overall performance page$")
    public void i_verify_is_appearing_under_filter_options_in_newly_opened_scorecard_page(String text) throws Throwable{
    	reportHomePage.iVerifyFilternameAppearingInScorecardPage(text);
    }
    
    @Then("^I verify \"([^\"]*)\" filter is appearing under filter options under scorecard page$")
    public void i_verify_filter_is_appearing_under_filter_options_under_scorecard_page(String text) throws Throwable{
    	reportHomePage.iVerifyFilterBoxAppearingInScorecardPage(text);
    }
    
    @Then("^I verify \"([^\"]*)\" spotlights is appearing beside the attributed physicians$")
    public void i_verify_spotlights_is_appearng_beside_the_attributed_physician(String text) throws Throwable{
    	reportHomePage.iVerifySpotlightColorBesideAttributedPhysicians(text);
    }
    
    @And("^I should verify spotlights are not appearing on the physician dashboard page$")
    public void i_should_verify_spotlights_are_not_appearing_on_the_physician_dashboard_page() throws Throwable{
    	reportHomePage.iShouldVerifySpotlightsNotAppearingOnPhysicianDashboard();
    }
    
    @Then("^I should verify \"([^\"]*)\" is appearing before the count under \"([^\"]*)\" column$")
    public void i_should_verify_symbol_is_appearing_before_the_count_under_column(String symbol,String text) throws Throwable{
    	reportHomePage.iShouldVerifySymbolInTheColumn(symbol, text);
    }
    
    @Then("^I verify \"([^\"]*)\" table is appearing after selecting table option under dashboard physician report$")
    public void i_verify_table_is_appearing_after_selecting_table_option_under_physician_report(String text) throws Throwable{
    	reportHomePage.iVerifyTableIsAppearingAfterSelectingTableUnderPhysicianDashboardReport(text);
    }
    
    @Then("^I verify \"([^\"]*)\" section is appearing on the performance scorecard dashboard page$")
    public void i_verify_section_is_appearing_on_the_performance_scorecard_dashboard_page(String text) throws Throwable{
    	reportHomePage.iVerifySectionUnderPerformanceScorecardDashboard(text);
    }
    
    @And("^I verify Top 5 \"([^\"]*)\" performance table is appearing on the performance scorecard dashboard page$")
    public void i_verify_top_5_performance_table_is_appearing_on_the_performance_scorecard_dashboard_page(String text) throws Throwable{
    	reportHomePage.iVerifyTop5PerformanceTableOnPerformanceScorecardDashbaord(text);
    }
    
    @Then("^I verify bar containers appearing under post acute care discharge disposition on the performance scorecard dashboard page$")
    public void i_verify_bar_containers_appearing_under_post_acute_care_discharge_disposition_on_the_performance_scorecard_dashboard_page() throws Throwable{
    	reportHomePage.iVerifyBarContainersUnderPostAcuteCareDischargeDisposition();
    }
    
    @And("^I click on \"([^\"]*)\" is kpi box on the performance scorecard dashboard page$")
    public void i_click_on_kpibox_on_the_performance_scorecard_dashboard_page(String text) throws Throwable{
    	reportHomePage.iClickOnKpiBoxOnPerformanceScoreCardForDrillThrough(text);
    }
    
    @And("^I click on a row under top 5 \"([^\"]*)\" performance table$")
    public void i_click_on_a_row_under_top5_performance_table(String text) throws Throwable{
    	reportHomePage.iClickOnTop5TableUnderPerformanceScorecardDashboard(text);
    }
    
    @Then("^I click on one of the bar graph present under post acute care discharge disposition section$")
    public void i_click_on_one_of_the_bar_graph_present_under_post_acute_care_discharge_disposition_section() throws Throwable{
    	reportHomePage.iClickOnBarGraphUnderPostAcuteDischargeDispositionSection();
    }
    
    @Then("^I verify actual calculation is appearing on the \"([^\"]*)\" kpi box$")
    public void i_verify_actual_calculation_is_appearing_on_the_kpi_box(String text) throws Throwable{
    	reportHomePage.iVerifyActualValueInKpiBox(text);
    }
    
    @And("^I verify adjusted calculation is appearing on the \"([^\"]*)\" kpi box$")
    public void i_verify_adjusted_calculation_is_appearing_on_the_kpi_box(String text) throws Throwable{
    	reportHomePage.iVerifyAdjustedValueInKpiBox(text);
    }
    
    @And("^I verify \"([^\"]*)\" column is appearing under top 5 \"([^\"]*)\" performance table$")
    public void i_verify_column_is_appearing_under_top5_performance_table(String column,String text) throws Throwable{
    	reportHomePage.iVerifyColumnUnderTop5PerformanceTable(column, text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing on the actual value of \"([^\"]*)\" kpi box$")
    public void i_verify_symbol_is_appearing_on_the_actual_value_of_kpi_box(String symbol,String kpibox) throws Throwable{
    	reportHomePage.iVerifySymbolOnKPIBox(symbol, kpibox);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing on the adjusted value of \"([^\"]*)\" kpi box$")
    public void i_verify_symbol_is_appearing_on_the_adjusted_value_of_kpi_box(String symbol,String kpibox) throws Throwable{
    	reportHomePage.iVerifySymbolForAdjustedValueOnKPIBox(symbol, kpibox);
    }
    
    @Then("^I verify \"([^\"]*)\" symbol is appearing in the values under avg episode cost and avg target price in \"([^\"]*)\" table$")
    public void i_verify_symbol_is_appearing_in_the_values_under_avg_episode_cost(String symbol,String text) throws Throwable{
    	reportHomePage.iVerifySymbolAppearingUnderAvgEpisodeCostInBundleTable(symbol,text);
    }
    
    @Then("^I verify attributed physician names are center alligned$")
    public void i_verify_attributed_physician_names_are_center_alligned() throws Throwable{
    	reportHomePage.iVerifyAttributedPhysicianColumnValuesCenterAlligned();
    }
    
    @Then("^I verify episode eps column values are center alligned$")
    public void i_verify_episodes_column_values_are_center_alligned() throws Throwable{
    	reportHomePage.iVerifyEpisodesColumnValuesCenterAlligned();
    }
    
    @Then("^I verify avg episode cost column spotlights are center alligned$")
    public void i_verify_avg_episode_cost_column_spotlights_are_center_alligned() throws Throwable{
    	reportHomePage.iVerifyAvgEpisodeCostValuesCenterAlligned();
    }
    
    @Then("^I verify disch to snf column spotlights are center alligned$")
    public void i_verify_disch_to_snf_column_spotlights_are_center_alligned() throws Throwable{
    	reportHomePage.iVerifyDischToSnfValuesCenterAlligned();
    }
    
    @Then("^I verify snf days column spotlights are center alligned$")
    public void i_verify_snf_days_column_spotlights_are_center_alligned() throws Throwable{
    	reportHomePage.iVerifySnfDaysValuesCenterAlligned();
    }
    
    @Then("^I verify eps with readmit column spotlights are center alligned$")
    public void i_verify_eps_with_readmit_column_spotlights_are_center_alligned() throws Throwable{
    	reportHomePage.iVerifyEpsWithReadmitValuesCenterAlligned();
    }
    
    @Then("^I verify actual values in kpi boxes are center alligned in performance scorecard page$")
    public void i_verify_actual_values_in_kpi_boxes_are_center_alligned_in_performance_scorecard_page() throws Throwable{
    	reportHomePage.iVerifyKPIBoxesValuesCenterAlligned();
    }
    
    @Then("^I verify episode volume column values under \"([^\"]*)\" performance table are center alligned$")
    public void i_verify_episode_volume_column_under_performance_table_are_center_alligned(String text) throws Throwable{
    	reportHomePage.iVerifyEpsiodeVolumeColumnUnderPerformanceTable(text);
    }
    
    @Then("^I verify avg episode cost column values under \"([^\"]*)\" performance table are center alligned$")
    public void i_verify_avg_episode_cost_column_under_performance_table_are_center_alligned(String text) throws Throwable{
    	reportHomePage.iVerifyAvgEpisodeCostColumnUnderPerformanceTable(text);
    }
    
    @Then("^I verify avg target price column values under \"([^\"]*)\" performance table are center alligned$")
    public void i_verify_avg_target_price_column_under_performance_table_are_center_alligned(String text) throws Throwable{
    	reportHomePage.iVerifyAvgTargetPriceColumnUnderPerformanceTable(text);
    }
    
    @Then("^I verify Adjusted Historic button is appearing beside benchmark option on physician dashboard page$")
    @And("^I verify Adjusted Historic button is appearing beside benchmark option on performance scorecard page$")
    public void i_verify_adjusted_historic_button_is_appearing_beside_benchmark_option_on_physician_dashboard_page() throws Throwable{
    	reportHomePage.iVerifyAdjustedHistoricButtonOnPhysicianDashboardReport();
    }
    
    @Then("^I verify \"([^\"]*)\" option is appearing beside data source on the physician dashboard report page$")
    @And("I verify \"([^\"]*)\" option is appearing beside data source on the performance scorecard page")
    public void i_verify_option_is_appearing_beside_data_source_on_the_physician_dashboard_report_page(String text) throws Throwable{
    	reportHomePage.iVerifyClaimsUnderDataSourceUnderPhysicianReport(text);
    }
    
    @And("^I verify \"([^\"]*)\" is appearing in the fields after searching$")
    public void i_verify_is_appearing_in_the_fields_after_searching(String text) throws Throwable{
    	reportHomePage.iVerifyFilterFieldAfterSearching(text);
    }
    
    @And("^I verify \"([^\"]*)\" is appearing in the available fields under next site of care summary report$")
    @Then("^I verify \"([^\"]*)\" is appearing in the level fields after searching$")
    public void i_verify_is_appearing_in_the_available_fields_under_next_site_of_care_summary_report(String text) throws Throwable{
    	reportHomePage.iVerifyInAvailableFieldsAfterSearchingUnderNextSiteOfCareSummary(text);
    }
    
    @And("^I click on clear search field element$")
    public void i_click_on_clear_search_field_element() throws Throwable{
    	reportHomePage.IClickOnCloseToClearTextBox();
    }
    
    @Then("I should not see \"([^\"]*)\" is not appearing in the default measures list")
    public void i_should_not_see_is_not_appearing_in_the_default_measures_list(String text) throws Throwable{
    	reportHomePage.iVerifyTextNotAppearingInDefaultMeasure(text);
    }
    
    @And("I should not see \"([^\"]*)\" in the searched results under the measures")
    @Then("I should not see \"([^\"]*)\" in the searched results under the levels")
    public void i_should_not_see_in_the_searched_results_under_the_measures(String text) throws Throwable{
    	reportHomePage.iShouldNotSeeUnderSearchedMeasuresResults(text);
    }
    
    @And("^I verify \"([^\"]*)\" header name is center alligned on physician dashboard report$")
    public void i_verify_header_name_is_center_alligned_on_physician_dashbaord_report(String text) throws Throwable{
    	reportHomePage.iVerifyHeaderNameCenterAlligned(text);
    }
    
    @And("^I should not see \"([^\"]*)\" in the filter value list$")
    public void i_should_not_see_in_the_filter_value_list(String text) throws Throwable{
    	reportHomePage.iShouldNotSeeElementInTheFilterValueList(text);
    }
    
    @And("^I verify \"([^\"]*)\" column is already present on the reports$")
    @Then("^I verify \"([^\"]*)\" column is added to report after selecting add to report option$")
    public void i_velrify_column_is_added_to_report_after_selecting_add_to_report_option(String text) throws Throwable{
    	reportHomePage.iShouldSeeColumnAfterClickingAddToReport(text);
    }
    
    @And("^I verify \"([^\"]*)\" is appearing in the drg column rows$")
    public void i_verify_text_is_appearing_in_the_drg_column_rows(String text) throws Throwable{
    	reportHomePage.iVerifyRowsNameUnderDRG(text);
    }
    
    @Then("^I click on a number under episodes column of next site of care summary report$")
    public void i_click_on_a_number_under_episodes_column_of_next_site_of_care_summary_report() throws Throwable{
    	reportHomePage.iClickOnEpisodeNumberUnderEpisodesColumnofNextSiteOfCareSummaryReport();
    }
    
    @Then("^I click on a number under episodes column of initial snf length of stay summary report$")
    public void i_click_on_a_number_under_episodes_column_of_initial_snf_length_of_stay_summary_report() throws Throwable{
    	reportHomePage.iClickOnEpisodeNumberUnderEpisodesColumnofInitialSNFLengthOfStaySummaryReport();
    }
    
    @Then("^I verify whether \"([^\"]*)\" checkbox under \"([^\"]*)\" is checked$")
    public void i_verify_whether_checkbox_under_is_checked(String text,String type) throws Throwable{
    	reportHomePage.iVerifyCheckboxIsCheckedForDrillThrough(text, type);
    }
    
    @Then("^I verify anchor post acute admission year \"([^\"]*)\" is preselected under nsoc model3 report$")
    public void i_verify_anchor_post_acute_admission_year_is_preselected_under_nsoc_model3_report(String text) throws Throwable{
    	reportHomePage.iSeeAnchorPostAcuteAdmissionYearFilterPreselected(text);
    }
    
    @Then("^I verify isAnchorAdmission filter having \"([^\"]*)\" under preselected nsoc model3 filter$")
    public void i_verify_isanchoradmission_filter_having_under_preselected_nsoc_model3_filter(String text) throws Throwable{
    	reportHomePage.iSeeIsAnchorAdmissionFilterPreselected(text);
    }
    
    @And("^I should not see Report with text as \"([^\"]*)\"$")
    public void iShouldNotSeeReportWithTextAs(String element) throws Throwable {
        reportHomePage.iVerifyReportsTextNotPresent(element);
    }
    
    @Then("^I click on a number under episodes column of nsoc model3 report$")
    public void i_click_on_a_number_under_episodes_column_of_nsoc_model3_report() throws Throwable{
    	reportHomePage.iClickOnNumberOfEpisodesColumnUnderNsocModel3Report();
    }
    
    @And("^I verify \"([^\"]*)\" is still appearing on the reports page$")
    public void i_verify_is_still_appearing_on_the_reports_page(String text) throws Throwable{
    	reportHomePage.iVerifyReportNameIsStillAppearingAfterWaitingForSomeTime(text);
    }
    
    @Then("^I verify \"([^\"]*)\" field is appearing in the report table after clicking on add to report$")
    public void i_verify_field_is_appearing_in_the_report_table_after_clicking_on_add_to_report(String text) throws Throwable{
    	reportHomePage.iVerifyColumnAfterClikingOnAddToReport(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing in the preselected filter for payer$")
    public void i_verify_is_appearing_in_the_preselected_filter_for_payer(String text) throws Throwable{
    	reportHomePage.iVerifyPayerFilterTextInPreselectedFilters(text);
    }
    
    @And("^I should not see \"([^\"]*)\" in the preselected filter for payer$")
    public void i_should_not_see_in_the_preslected_filter_for_payer(String text) throws Throwable{
    	reportHomePage.iShouldNotSeePayerPreselectedTextInFilterList(text);
    }
    
    @Then("^I remove \"([^\"]*)\" field filter under filter field from default filters$")
    public void i_remove_payer_field_filter_under_filter_field_from_default_filters(String text) throws Throwable{
    	reportHomePage.iRemovePayerFieldFilterFromDefaultFilters(text);
    }
    
    @And("^I verify there are no default filters appearing after removing all the default filters$")
    public void i_verify_there_are_no_default_filters_appearing_after_removing_all_the_default_filters() throws Throwable{
    	reportHomePage.iVerifyNoDeafultFiltersAfterRemovingFilters();
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under selected post acute type filter$")
    public void i_verify_is_appearing_under_selected_post_acute_type_filter(String text) throws Throwable{
    	reportHomePage.iVerifyPostAcuteTypeFilterTextInSelectedFilters(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under selected network tier filter$")
    public void i_verify_is_appearing_under_selected_network_tier_filter(String text) throws Throwable{
    	reportHomePage.iVerifyNetworkTierTextInSelectedFilter(text);
    }
    
    @And("^I verify \"([^\"]*)\" is visible under \"([^\"]*)\" column in the report$")
    public void i_verify_is_visible_under_column_in_the_report(String data,String column) throws Throwable{
    	reportHomePage.iVerifyDataInTheColumnsInsideReports(data, column);
    }
    
    @And("^I verify \"([^\"]*)\" field is appearing in the layout section after selecting add to report$")
    public void i_verify_field_is_appearing_in_the_layout_section_after_selecting_add_to_report(String text) throws Throwable{
    	reportHomePage.iVerifyFieldInTheLayoutSectionAfterAddToReport(text);
    }
    
    @Then("^I click on avatar symbol to see the menu$")
    public void i_click_on_avatar_symbol_to_see_the_menu() throws Throwable{
    	reportHomePage.iClickOnAvatarSymbolToClickOnMenu();
    }
    
    @And("^I should not see \"([^\"]*)\" is present in the list after clicking on avatar$")
    public void i_should_not_see_is_present_in_the_list_after_clicking_on_avatar(String text) throws Throwable{
    	reportHomePage.iShouldNotSeeTextInListAfterClickingOnAvatar(text);
    }
    
    @And("^I click on \"([^\"]*)\" tab after clicking on avatar symbol to redirect to reporting help center page$")
    public void i_click_on_tab_after_clicking_on_avatar_symbol_to_redirect_to_reporting_help_center_page(String text) throws Throwable{
    	reportHomePage.iClickOnTabUnderAvatar(text);
    }
    
    @And("^I verify \"([^\"]*)\" is appearing in the list after clicking on avatar$")
    public void i_verify_is_appearing_in_the_list_after_clicking_on_avatar(String text) throws Throwable{
    	reportHomePage.iVerifyTextInTheAvatarList(text);
    }
    
    @Then("^I wait to see \"([^\"]*)\" in the new tab after clicking on help center$")
    public void i_wait_to_see_in_the_new_tab_after_clicking_on_help_center(String text) throws Throwable{
    	reportHomePage.iWillWaitToSeeAfterClickingHelpCenter(text);
    }
    
    @And("^I should not see login widget after switching to a new tab$")
    public void i_should_not_see_login_widget_after_switching_to_a_new_tab() throws Throwable{
    	reportHomePage.iShouldNotSeeLoginWidget();
    }
    
    @Then("^I verify \"([^\"]*)\" tab is appearing in the reporting help center page$")
    public void i_verify_tab_is_appearing_in_the_reporting_help_center_page(String text) throws Throwable{
    	reportHomePage.iVerifyTabIsAppearingInTheReportingHomePage(text);
    }
    
    @And("^I click on \"([^\"]*)\" tab on the reporting help center page$")
    public void i_click_on_tab_on_the_reporting_help_center_page(String text) throws Throwable{
    	reportHomePage.iClickOnTabOnReportingHelpCenter(text);
    }
    
    @Then("^I should see following text under using reports section in reporting help center page$")
    public void i_should_see_following_text_under_using_reports_section_in_reporting_help_center_page(List<String> textlinks) throws Throwable {
        for (int i=0; i<textlinks.size(); i++) {
            reportHomePage.iVerifyTextUnderFieldsInReportingHelpCenter("Using Reports", textlinks.get(i));
        }
    }
    
    @Then("^I should see following text under reports by category section in reporting help center page$")
    public void i_should_see_following_text_under_reports_by_category_section_in_reporting_help_center_page(List<String> textlinks) throws Throwable {
    	for (int i=0; i<textlinks.size(); i++) {
            reportHomePage.iVerifyTextUnderFieldsInReportingHelpCenter("Reports by Category", textlinks.get(i));
        }
    }
    
    @Then("^I should see following text under reports by title section in reporting help center page$")
    public void i_should_see_following_text_under_reports_by_title_section_in_reporting_help_center_page(List<String> textlinks) throws Throwable {
    	for (int i=0; i<textlinks.size(); i++) {
            reportHomePage.iVerifyTextUnderFieldsInReportingHelpCenter("Reports by Title", textlinks.get(i));
        }
    }
    
    @Then("^I should see following text under report insights section in reporting help center page$")
    public void i_should_see_following_text_under_reports_insights_section_in_reporting_help_center_page(List<String> textlinks) throws Throwable {
    	for (int i=0; i<textlinks.size(); i++) {
            reportHomePage.iVerifyTextUnderFieldsInReportingHelpCenter("Report Insights", textlinks.get(i));
        }
    }
    
    @Then("^I verify \"([^\"]*)\" text is appearing in the glossary page$")
    public void i_verify_text_is_appearing_in_the_glossary_page(String text) throws Throwable{
    	reportHomePage.iVerifyTextOnTheGlossaryPage(text);
    }
    
    @And("^I should be able to see terms and conditions list mentioned in the glossary page$")
    public void i_should_be_able_to_see_terms_and_conditions_list_mentioned_in_the_glossary_page() throws Throwable {
    	reportHomePage.iShouldSeeTermsAndConditionsListOnGlossaryPage();
    }
    
    @Then("^I should see \"([^\"]*)\" text is appearing on the help center page$")
    public void i_should_see_text_is_appearing_on_the_help_center_page(String text) throws Throwable {
    	reportHomePage.iVerifyTitleOnTheReportingHelpCenterPage(text);
    }
    
    @And("^I should see \"([^\"]*)\" in the value list after selecting filter$")
    public void i_should_see_in_the_value_list_after_selecting_filter(String text) throws Throwable{
    	reportHomePage.iVerifyInFilterValueListAfterSelectingFilterOption(text);
    }
    
    @And("^I should see \"([^\"]*)\" is added in layout section after clicking on add to report$")
    public void i_should_see_is_added_in_layout_section_after_clicking_on_add_to_report(String text) throws Throwable{
    	reportHomePage.iVerifyFieldUnderLayoutAfterAddingToReport(text);
    }
    
    @Then("^I click on a number under episodes column to verify drill through$")
    public void i_click_on_a_number_under_episodes_column_to_verify_drill_through() throws Throwable{
    	reportHomePage.iClickOnNumberUnderEpisodesColumnToVerifyDrillThrough();
    }
    
    @Then("^I verify the episodes count matches with dill through$")
    public void i_verify_the_episodes_count_matches_with_drill_through() throws Throwable{
    	reportHomePage.iVerifyTheEpisodeCountWithDrillThrough();
    }
    
    @Then("^I verify anchor post acute discharge month is in ([^\"]*) format$")
    public void i_verify_anchor_post_acute_dischare_month_is_in_YYYY_MM_format(String format) throws Throwable{
    	reportHomePage.iVerifyAnchorDischargeMonthFormat(format);
    }
    
    @When("^I click on \"([^\"]*)\" field which is listed under \"([^\"]*)\" filter from available fields$")
    public void i_click_to_value_in_the_available_fields(String text,String filter) throws Throwable{
    	reportHomePage.iClickOnFieldUnderAvailableFieldsInReports(text,filter);
    }
    
    @Then("^I verify there are no duplicate values in the eligibility filter field list$")
    public void i_verify_there_are_no_duplicate_values_in_the_eligility_filter_field_list() throws Throwable{
    	reportHomePage.iVerifyNoDuplicateValuesInEligilityFilterFieldList();
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under selected anchor discharge care setting filter$")
    public void i_verify_is_appearing_under_selected_anchor_discharge_care_setting_filter(String text) throws Throwable{
    	reportHomePage.iVerifyAnchorDischrgeCareSettingFilterTextInSelectedFilters(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under selected network tier anchor discharge filter$")
    public void i_verify_is_appearing_under_selected_network_tier_anchor_discharge_filter(String text) throws Throwable{
    	reportHomePage.iVerifyNetworkTierAnchorDischargeTextInSelectedFilter(text);
    }
    
    @When("^I click to \"([^\"]*)\" filter field under available fields$")
    public void i_click_to_filter_field_under_available_fields(String text) throws Throwable{
    	reportHomePage.iClickOnDashboardAnchorCCNFilterField(text);
    }
    
    @When("^I click on \"([^\"]*)\" field in the layout section to open the list$")
    public void i_click_on_field_in_the_layout_section_to_open_the_list(String text) throws Throwable{
    	reportHomePage.iClickOnFieldInLayoutSectionToOpenList(text);
    }
    
    @Then("I click on remove from report option in the list")
    public void i_click_on_remove_from_report_option_in_the_list() throws Throwable{
    	reportHomePage.iClickOnRemoveFromReportInTheList();
    }
    
    @And("I verify \"([^\"]*)\" column is not present in the reports")
    public void i_verify_column_is_not_present_in_the_reports(String text) throws Throwable{
    	reportHomePage.iVerifyTextNotPresentInTheReportsTable(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under preselected anchor hospital admission year filter$")
    public void i_verify_is_appearing_under_preselected_anchor_hospital_admission_year_filter(String text) throws Throwable{
    	reportHomePage.iSeeAnchorHospitalAdmissionYearFilterPreselected(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under preselected filters for anchor Discharge Date Key$")
    public void i_verify_is_appearing_under_preselected_filters_for_anchor_Discharge_Date_Key(String text) throws Throwable{
    	reportHomePage.iSeeAnchorDischargeDateKeyFilterPreselected(text);
    }
    
    @When("^I click on Episodes field in the default measures to open the list$")
    public void i_click_on_Episodes_field_in_the_default_measures_to_open_the_list() throws Throwable{
    	reportHomePage.iClickonEpisodesFieldUnderDefaultMeasuresToOpenList();
    }
    
    @Then("^I should verify \"([^\"]*)\" is appearing under Episodes drill through columns popup$")
    public void i_should_verify_is_appearing_under_episode_drill_through_columns_popup(String text) throws Throwable{
    	reportHomePage.iShouldVerifyInEpisodesDrillThroughColumnsPopUp(text);
    }
    
    @And ("^I choose remove report option from select options of filter field$")
    public void i_choose_remove_report_option_from_select_option_of_filter_field(){
    	reportHomePage.ichooseremovereportoptionfromselectoptionoffilterfield();
    }
    
    @Then ("^I search for the field \"([^\"]*)\" from the available fields$") 
    public void i_search_for_the_field_from_available_field(String text){
    	reportHomePage.isearchforthefieldfromavailablefield(text);
    }
    
    @When ("^I click to \"([^\"]*)\" field filter under \"([^\"]*)\" filter field in layout section$")
    public void i_click_filter_field_in_layout_section(String filterTitle,String filterField){
    	reportHomePage.iclickfilterfieldinlayoutsection(filterTitle,filterField);
    }

    @Then("^I verify \"([^\"]*)\" text is appearing in the FAQ page$")
    public void i_verify_text_is_appearing_in_the_FAQ_page(String text) throws Throwable{
    	reportHomePage.iVerifyTextOnTheFAQPage(text);
    }
    
    @And("^I should be able to see FAQ links list mentioned in the FAQ page$")
    public void i_should_be_able_to_see_FAQ_links_list_mentioned_in_the_FAQ_page() throws Throwable{
    	reportHomePage.iShouldSeeFAQListOnFAQPage();
    }
    
    @Then("^I should see \"([^\"]*)\" is present under preselected anchor discharge date key filter$")
    public void i_should_see_is_present_under_preselected_anchor_discharge_date_key_filter(String text) throws Throwable{
    	reportHomePage.iSeeAnchorDischargeDateKeyFilterPreselected(text);
    }

    @And("^I verify search field is appearing below the count on performance evaluation by physician page$")
    public void i_verify_search_field_is_appearing_below_the_count_on_peformance_evaluation_by_physician_page() throws Throwable{
    	reportHomePage.iVerifySeachFieldOnPerformanceEvaluationByPhysicianPage();
    }
    
    @Then("^I verify Attributed Physician filter is appearing on physician dashboard page$")
    public void i_verify_attributed_physician_filter_is_appearing_on_physician_dashboard_page() throws Throwable{
    	reportHomePage.iVerifyAttributedPhysicianFilterOnPhysicianPage();
    }
    
    @And("^I verify \"([^\"]*)\" filter is not having \"([^\"]*)\" in the filter$")
    public void i_verify_attributed_filter_is_not_having_in_the_filter(String filter,String text) throws Throwable{
    	reportHomePage.iVerifyFilterNotHavingTheTextOnScoreCardPage(filter, text);
    }
    
    @And("I click on the attributed physician having \"([^\"]*)\" dot in the chart of physician dashboard report")
    public void i_click_on_the_attributed_physician_having_dot_in_the_chart_of_physician_dashboard_report(String color) throws Throwable{
    	reportHomePage.iClickOnAttributedPhyisicanCorrespondingToColor(color);
    }
    
    @And("^I verify text with \"([^\"]*)\" is appearing inside the scorecards on performance scorecard page$")
    public void i_verify_text_with_is_appearing_inside_the_scorecards_on_performance_scorecard_page(String color) throws Throwable{
    	reportHomePage.iVerifyTextColorOnScorecardsOnPerformanceScorecardPage(color);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing on the scorecard corresponding to the \"([^\"]*)\" color$")
    public void i_verify_is_appearing_on_the_scorecard_corresonding_to_the_color(String message,String color) throws Throwable{
    	reportHomePage.iVerifyMessageAsPerColorOnScorecards(message, color);
    }
    
    @Then("^I verify \"([^\"]*)\" text is appearing beside the search field on physician dashboard report$")
    public void i_verify_text_is_appearing_beside_the_search_field_on_physician_dashboard_report(String text) throws Throwable{
    	reportHomePage.iVerifyTextBesideTheSearchBoxOnPhysicianDashboardReport(text);
    }
    
    @When("^I should not see \"([^\"]*)\" report after clicking on dashboard$")
    public void i_should_not_see_report_after_clicking_on_dashboard(String report) throws Throwable{
    	reportHomePage.iShouldNotSeeReportName(report);
    }
    
    @Then("^I verify \"([^\"]*)\" section is not appearing on the performance scorecard page$")
    public void i_verify_section_not_appearing_on_the_performance_scorecard_page(String text) throws Throwable{
    	reportHomePage.iVerifyTextNotAppearingUnderPhysicianScoreCard(text);
    }
    
    @Then("^I verify \"([^\"]*)\" filter is not appearing in the filters section on scorecard page$")
    public void i_verify_filter_is_not_appearing_in_the_filter_section(String text) throws Throwable{
    	reportHomePage.iVerifyTextNotPresentInFilterSections(text);
    }

    @Then("^I wait untill page loading message disappears$")
    public void i_wait_untill_page_loading_message_disappears() throws Throwable{
    	reportHomePage.iWillWaitUntillLoadingMessageDisappears();
    }
    
    @And("^I verify apply button is not clickable for ([^\"]*) in the filters after unchecking all option$")
    public void i_verify_apply_button_is_not_clickable_in_the_filters_after_unchecking_all_option(String text) throws Throwable{
    	reportHomePage.iVerifyApPlyButtonIsNotClickableAfterDesectingAll(text);
    }
    
    @And("^I select a \"([^\"]*)\" name in filter and verify the same name is appearing on scorecard page$")
    public void i_select_a_name_in_filter_and_verify_the_same_name_is_appearing_on_scorecard_page(String text) throws Throwable{
    	reportHomePage.iSelectNameInFilterAndVerifySmeNameOnScoreCardPage(text);
    }
    
    @And("^I click on \"([^\"]*)\" link on the performance scorecard page$")
    public void i_click_on_link_on_the_performance_scorecard_page(String text) throws Throwable{
    	reportHomePage.iClickOnLinkUnderPerformanceScoreCardPage(text);
    }
    
    @Then("^I verify \"([^\"]*)\" toggle button is appearing beside \"([^\"]*)\"$")
    public void i_verify_toggle_button_is_appearing_beside(String text,String value) throws Throwable{
    	reportHomePage.iVerifyToggleButtonOnPhysicianDashboard(text,value);
    }
    
    @And("^I click on \"([^\"]*)\" radio button beside \"([^\"]*)\"$")
    public void i_click_on_radio_button_beside_cost_metric(String text,String value) throws Throwable{
    	reportHomePage.iClickOnRadioButtonOnPhysicianDashboard(text,value);
    }
    
    @And("^I verify column name \"([^\"]*)\" is appearing on the scorecard page$")
    @Then("^I verify column name \"([^\"]*)\" is appearing on the overall performance page$")
    public void i_verify_column_name_is_appearing_on_the_scorecard_page(String text) throws Throwable{
    	reportHomePage.iVerifyColumnNameOnScoreCardPage(text);
    }
    
    @Then("^I verify \"([^\"]*)\" column name is appearing under quaterly performance table$")
    public void i_verify_column_name_is_appearing_under_quaterly_performance_table(String text) throws Throwable{
    	reportHomePage.iVerifyColumnAppearingUnderQuaterlyPerformanceTable(text);
    }
    
    @And("^I verify \"([^\"]*)\" column name is appearing under episodes volume table$")
    public void i_verify_column_name_is_appearing_under_episodes_volume_table(String text) throws Throwable{
    	reportHomePage.iverifyColumnNameAppearingUnderEpisodesVolume(text);
    }
    
    @Then("^I verify \"([^\"]*)\" column is not appearing on performance scorecard page$")
    public void i_verify_column_is_not_appearing_on_performance_scorecard_page(String text) throws Throwable{
    	reportHomePage.iVerifyColumnNotPresentOnThePerformanceScoreCardPage(text);
    }
    
    @And("^I verify \"([^\"]*)\" column is appearing under \"([^\"]*)\" column on scorecard page$")
    public void i_verify_column_is_appearing_under_columns_on_scorecard(String text,String table) throws Throwable{
    	reportHomePage.iVerifyColumnUnderTableOnScoreCardPage(text, table);
    }
    
    @And("^I verify \"([^\"]*)\" is appearing on clicking on lmj link$")
    public void i_verify_is_appearing_on_clicking_on_lmj_link(String text) throws Throwable{
    	reportHomePage.iVerifyElementOnNewWindowOnClickingLMJLink(text);
    }
    
    @Then("^I verify \"([^\"]*)\" section is appearing on overall performance page$")
    public void i_verify_section_is_appearing_on_overall_performance_page(String text) throws Throwable{
    	reportHomePage.iVerifySectionOnOverallPerformancePage(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing on the overall performance page$")
    public void i_verify_is_appearing_on_the_overall_performance_page(String text) throws Throwable{
    	reportHomePage.iVerifyIsAppearingOnOverallPerformancePage(text);
    }
    
    @Then("^I verify \"([^\"]*)\" column name is appearing under major joint replacement of the lower extremity table$")
    public void i_verify_column_name_is_appearing_under_major_joint_replacement_of_lower_extremity(String text) throws Throwable{
    	reportHomePage.iVerifyColumnAppearingUnderQuaterlyPerformanceTable(text);
    }
    
    @And("^I verify \"([^\"]*)\" column name is appearing under performance comparison DRG \"([^\"]*)\" table$")
    public void i_verify_column_name_is_appearing_under_performance_comparison_table(String text,String drg) throws Throwable{
    	reportHomePage.iVerifyTextInPerformanceComaprisonTable(text,drg);
    }
    
    @Then("^I verify column name \"([^\"]*)\" is appearing in performance comparison drg \"([^\"]*)\" table$")
    public void i_verify_column_name_is_appearing_in_performance_comparison_drg_table(String text,String drg) throws Throwable{
    	reportHomePage.iVerifyNamesOnPerformanceComparisonTable(text,drg);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing inside the performance comparison drg \"([^\"]*)\" table$")
    public void i_verify_is_appearing_inside_the_performance_comaprison_drg_table(String text,String drg) throws Throwable{
    	reportHomePage.iVerifyTheNamesInsideTheComaprisonTables(text, drg);
    }
    
    @And("^I verify \"([^\"]*)\" is appearing inside drg \"([^\"]*)\" performance comparison table$")
    public void i_verify_is_appearing_inside_drg_performance_comparison_table(String text,String drg) throws Throwable{
    	reportHomePage.iVerifyCurrentAndSystemInsidePerformanceComparison(text, drg);
    }
    
    @Then("^I verify the data under fracture and non fracture is only \"([^\"]*)\" in the rows under drg table \"([^\"]*)\"$")
    public void i_verify_the_data_under_fracture_and_non_fracture_is_only_blank_under_drg_tables(String text,String drg) throws Throwable{
    	reportHomePage.iVerifyDataUnderFractureAndNonFractureColumns(text,drg);
    }
    
    @And("^I fetch the value of episodes present beside first physician$")
    public void i_fetch_the_value_of_episodes_present_beside_first_physician() throws Throwable{
    	reportHomePage.iFetchValueOfEpisodesFromFirstPhysician();
    }
    
    @And("^I verify fetched episodes data is appearing inside the kpi box of episodes$")
    public void i_verify_fetched_episodes_data_is_appearing_inside_the_kpi_box_of_episodes() throws Throwable{
    	reportHomePage.iVerifyFetchedEpisodeIsSameInEpisodesKPIBox();
    }
    
    @Then("^I verify same episodes data is appearing under overall performance column in quaterly performance table$")
    public void i_verify_same_episodes_data_is_appearing_under_overall_performance_column_in_quaterly_performance_table() throws Throwable{
    	reportHomePage.iVerifySameEpisodesDataIsAppearingUnderOverallPerformanceInQuaterlyPerformanceTable();
    }
    
    @And("^I click on \"([^\"]*)\" report under ([^\"]*) in reports$")
    public void i_click_on_report_text_for_module_report(String report,String module) throws Throwable{
    	reportHomePage.iClickOnReportUnderModuleInReports(report, module);
    }
    
    @And("^I verify there is no \"([^\"]*)\" value appearing inside report in the column \"([^\"]*)\"$")
    public void i_verify_there_is_no_value_appearing_inside_report_in_the_column(String value,String field) throws Throwable{
    	reportHomePage.iVerifyNotAppearingInsideColumnsInReports(value, field);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under selected drgcode filter$")
    public void i_verify_is_appearing_under_selected_grdcode_filter(String text) throws Throwable{
    	reportHomePage.iVerifyDRGCodeTextInSelectedFilter(text);
    }
    
    @Then("^I remove the field \"([^\"]*)\" from the report column$")
    public void i_remove_the_field_from_the_report_column(String text) throws Throwable{
    	reportHomePage.iRemoveTheTheFieldFromReportColumn(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is not appearing in the added field \"([^\"]*)\"$")
    public void i_verify_is_not_appearing_in_the_added_field(String text,String field) throws Throwable{
    	reportHomePage.iVerifyIsNoTAppearinGInTheAddedField(text, field);
    }
    
    @Then("^I should not see \"([^\"]*)\" report after clicking on dashboards$")
    public void i_should_not_see_report_after_clicking_on_dashboards(String report) throws Throwable{
    	reportHomePage.iShouldNotSeeReportName(report);	
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under preselected anchor admission year filter$")
    public void i_verify_anchor_hospital_admission_year_appearing_under_preselected_filter(String text) throws Throwable{
    	reportHomePage.iVerifyAnchorAdmissionYearPreSelectedFilter(text);
    }
    
    @Then("^I verify \"([^\"]*)\" column is appearing in report after selecting add to report option$")
    public void i_velrify_column_is_appearing_in_report_after_selecting_add_to_report_option(String text) throws Throwable{
    	reportHomePage.iVerifyColumnAfterClickingAddToReport(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under selected anchor discharge care setting filter in snf los report$")
    public void i_verify_is_appearing_under_selected_anchor_discharge_care_setting_filter_in_snf_los_report(String text) throws Throwable{
    	reportHomePage.iVerifyAnchorDischrgeCareSettingFilterTextInSelectedFiltersInSNFLOSReport(text);
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under selected network tier anchor discharge filter under snf los report$")
    public void i_verify_is_appearing_under_selected_network_tier_anchor_discharge_filter_under_snf_los_report(String text) throws Throwable{
    	reportHomePage.iVerifyNetworkTierAnchorDischargeTextInSelectedFilterUnderSNFLOSReport(text);
    }
    
    @And("^I click on \"([^\"]*)\" in the filter value list for anchor hospital facility$")
    public void i_click_on_in_the_filter_value_list_for_anchor_hospital_facility(String filterText) throws Throwable {
         reportHomePage.iClickOnFilterTextFormFilterValueListForAnchorHospitalFacility(filterText);
    }
    
    @And("^I click on \"([^\"]*)\" button under the ([^\"]*) in filter options$")
    public void iClickOnApplyButtonForTheFilterField(String button,String text) throws Throwable{
    	reportHomePage.iClickOnApplyButtonUnderFilterNameInFilterOptions(button, text);
    }
    
    @Then("^I verify data is appearing after opening report$")
    public void i_verify_data_is_appearing_after_opening_report() throws Throwable{
    	reportHomePage.iVerifyDataAppearingAfterOpeningReport();
    }
    
    @Then("^I verify \"([^\"]*)\" is appearing under default filter anchor admission year$")
    public void i_verify_anchor_hospital_admission_year_appearing_under_default_filter_anchor_admission_year(String text) throws Throwable{
    	reportHomePage.iVerifyAnchorAdmissionYearDefaultFilter(text);
    }
    
    @Then("^I verify anchor post acute admission year \"([^\"]*)\" is preselected under episode drg issues model3 report$")
    public void i_verify_anchor_post_acute_admission_year_is_preselected_under_episode_drg_issues_model3_report(String text) throws Throwable{
    	reportHomePage.iSeeAnchorPostAcuteAdmissionYearFilterPreselectedUnderEpisodeDrgIssuesReport(text);
    }
    
    @Then("^I verify anchor post acute admission year \"([^\"]*)\" is preselected under ipec model3 report$")
    public void i_verify_anchor_post_acute_admission_year_is_preselected_under_ipec_model3_report(String text) throws Throwable{
    	reportHomePage.iSeeAnchorPostAcuteAdmissionYearFilterPreselectedInIPECModel3(text);
    }
}

