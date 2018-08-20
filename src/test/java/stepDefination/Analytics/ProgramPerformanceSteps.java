package stepDefination.Analytics;

import java.io.IOException;

import com.remedy.Analytics.ProgramPerformance;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class ProgramPerformanceSteps extends DriverScript{
	
	ProgramPerformance programdashboard= new ProgramPerformance(driver);
	
	@And("^I wait till the visibility of \"([^\"]*)\" field on login page$")
	public void i_wait_till_the_visibility_of_field_on_login_page(String text) throws Throwable{
		programdashboard.iWaitTillTheVisibilityOfFieldOLoginPage(text);
	}
	
	@Then("^I enter in \"([^\"]*)\" field for analytics as \"([^\"]*)\" for login$")
	public void i_enter_in_field_for_analytics_as_for_login(String field,String value) throws Throwable{
		programdashboard.iEnterInFieldsForAnalyticsOnLoginPage(field, value);
	}
	
	@And("^I click on \"([^\"]*)\" button on the analytics login page$")
	public void i_click_on_button_on_the_analytics_login_page(String text) throws Throwable{
		programdashboard.iClickonSignInButtonOnAnalyticsLoginPage(text);
	}
	
	@And("^I wait till the visibility of sections on the projects page$")
	public void i_wait_till_the_visibility_of_sections_on_the_projects_page() throws Throwable{
		programdashboard.iWaitTillTheVisibilityOfSectionsOnProjectsPage();
	}
	
	@Then("^I click on \"([^\"]*)\" section on the projects page$")
	public void i_click_on_section_on_the_projects_page(String text) throws Throwable{
		programdashboard.iClickOnSectionOnProjectsPage(text);
	}
	
	@And("^I wait to see the visibility of workbooks on the workbooks page$")
	public void i_wait_to_see_the_visibility_of_workbooks_on_the_workbooks_page() throws Throwable{
		programdashboard.iWaitToSeeTheWorkbooksOnWorkbooksPage();
	}
	
	@Then("^I click on \"([^\"]*)\" dashboard on workbook page$")
	public void i_click_on_dashboard_on_workbook_page(String dashboard) throws Throwable{
		programdashboard.iClickOnDashboardWithNameOnWorkBook(dashboard);
	}
	
	@And("^I wait to see the visibility of dashboards on views page$")
	public void i_wait_to_see_the_visibility_of_dashboards_on_views_page() throws Throwable{
		programdashboard.iWaitToSeeTheWorkbooksOnWorkbooksPage();
	}
	
	@Then("^I click on \"([^\"]*)\" dashboard on views page$")
	public void i_click_on_dashboard_on_views_page(String dashboard) throws Throwable{
		programdashboard.iClickOnDashboardWithNameOnWorkBook(dashboard);
	}
	
	@And("^I wait till the invisibility of loading spinner after clicking dashboard$")
	public void i_wait_till_the_invisibility_of_loading_spinner_after_clicking_dashboard() throws Throwable{
		programdashboard.iWaitTillInvisibiltyOfLoaderAfterClickingDashboard();
	}
	
	@And("^I switch to analytics iframe$")
	public void i_switch_to_analytics_iframe() throws Throwable{
		programdashboard.iSwitchToAnalyticsFrameWithXpath("//iframe[@class='report-iframe']");
	}
	
	@Then("^I enter incorrect \"([^\"]*)\" for analytics as \"([^\"]*)\" for login$")
	public void i_enter_incorrect_for_analytics_as_for_login(String field,String value) throws Throwable{
		programdashboard.iEnterInFieldsForAnalyticsOnLoginPage(field, value);
	}
	
	@Then("^I verify \"([^\"]*)\" \"([^\"]*)\" when i enter incorrect credentials$")
	public void i_verify_when_i_enter_incorrect_credentials(String text,String message) throws Throwable{
		programdashboard.iValidateTextWhenIncorrectCredentialsEntered(text, message);
	}
	
	@Then("^I verify \"([^\"]*)\" text is appearing inside dashboard$")
	@And("^I verify subtitle text \"([^\"]*)\" is appearing inside dashboard$")
	public void i_verify_text_is_appearing_inside_dashboard(String text) throws Throwable{
		programdashboard.iValidateTextForDashboard(text);
	}
	
	@And("^I verify \"([^\"]*)\" is appearing for BAN section on the dashboard$")
	public void i_verify_is_appearing_for_BAN_section_on_the_dashboard(String text) throws Throwable{
		programdashboard.iValidateTextForBANSections(text);
	}
	
	@Then("^I verify \"([^\"]*)\" count section is appearing on the dashboard below \"([^\"]*)\"$")
	public void i_verify_count_section_is_appearing_on_the_dashboard_below(String count,String text) throws Throwable{
		programdashboard.iVerifyCountSectionOnTheDashboards(count,text);
	}
	
	@And("^I verify legend \"([^\"]*)\" is appearing on the dashboard$")
	public void i_verify_legend_is_appearing_on_the_dashboard(String text) throws Throwable{
		programdashboard.iVerifyTheLegendIsAppearingOnDashboard(text);
	}
	
	@Then("^I verify legend color of \"([^\"]*)\" as \"([^\"]*)\" with color code \"([^\"]*)\"$")
	public void i_verify_legend_color_of_as_with_color_code(String field,String color,String code) throws Throwable{
		programdashboard.iVerifyColorCodeForLegegend(field, color, code);
	}
	
	@And("^I verify Episodes count as \"([^\"]*)\" on the dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_the_count_for_episodes_as_on_the_dashboard(String count,String resolution) throws Throwable{
		programdashboard.TakeShotOFElement(count,"//div[@tb-test-id='KPI_Episode']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 152px; height: 52px;']",resolution);
	}
	
	@And("^I verify program size count as \"([^\"]*)\" on the dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_the_count_for_program_size_as_on_the_dashboard(String count,String resolution) throws Throwable{
		programdashboard.TakeShotOFElement(count,"//div[@tb-test-id='KPI_Program_size']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 227px; height: 52px;']",resolution);
	}
	
	@And("^I verify npra count as \"([^\"]*)\" on the dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_npra_count_as_on_the_dashboard(String count,String resolution) throws Throwable{
		programdashboard.TakeShotOFElement(count,"//div[@tb-test-id='KPI_NPRA']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 205px; height: 52px;']",resolution);
	}
	
	@Then("^I verify \"([^\"]*)\" section is appearing on the dashboard$")
	public void i_verify_Savings_Rate_section_is_appearing_on_the_dashboard(String text) throws Throwable{
		programdashboard.iVerifySavingsRateSectionOnTheDashboards(text);
	}
	
//	@And("^I verify Discharge to SNF count as \"([^\"]*)\" on the dashboard$")
//	public void i_verify_Discharge_to_SNF_count_as_on_the_dashboards(String count) throws Throwable{
//		programdashboard.TakeShotOFElement(count,"//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 256px; height: 54px;']");
//	}
	
	@And("^I verify Discharge to SNF count as \"([^\"]*)\" on the dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_Discharge_to_SNF_count_as_on_the_dashboards_with_picture_resolution(String count,String resolution) throws Throwable{
		programdashboard.TakeShotOFElement(count,"//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 256px; height: 54px;']",resolution);
	}
	
	@And("^I verify SNF Days count as \"([^\"]*)\" on the dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_SNF_Days_count_as_on_the_dashboards_with_picture_resolution(String count,String resolution) throws Throwable{
		programdashboard.TakeShotOFElement(count,"//div[@tb-test-id='SNF Days Current']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 248px; height: 68px;']",resolution);
	}
	
	@Then("^I verify %Episodes with a Readmission section is appearing on the dashboard$")
	public void i_verify_episodes_with_a_readmission_section_is_appearing_on_the_dashboard() throws Throwable{
		programdashboard.iVerifyReadmissionsSectionOnTheDashboards();
	}
	
	@And("^I verify %Episodes with a Readmission count as \"([^\"]*)\" on the dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_episodes_with_a_readmission_count_as_on_the_dashboards_with_picture_resolution(String count,String resolution) throws Throwable{
		programdashboard.TakeShotOFElement(count,"//div[@tb-test-id='Readmissions Current']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 259px; height: 58px;']",resolution);
	}
	
	@And("^I verify blue colored text of Savings Rate as \"([^\"]*)\" on dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_blue_colored_text_of_savings_rate_as_on_dashboard_with_picture_resolution(String count,String resolution) throws Throwable{
		programdashboard.TakeShotOFBlueColorElement(count,"//div[@tb-test-id='Savings Rate']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 309px; height: 79px;']", resolution);
	}
	
	@And("^I verify blue colored text of SNF Discharge Benchmark variance as \"([^\"]*)\" on dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_blue_colored_text_of_discharge_to_snf_as_on_dashboard_with_picture_resolution(String count,String resolution) throws Throwable{
		programdashboard.TakeShotOFBlueColorElement(count,"//div[@tb-test-id='% SNF Disch Benchmark Variance']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 256px; height: 103px;']", resolution);
	}
	
	@And("^I verify blue colored text of SNF Days Benchmark Variance as \"([^\"]*)\" on dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_blue_colored_text_of_SNF_Days_Benchmark_variance_as_on_dashboard_with_picture_resolution(String count,String resolution) throws Throwable{
		programdashboard.TakeShotOFBlueColorElement(count,"//div[@tb-test-id='SNF Days Benchmark Variance']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 248px; height: 94px;']", resolution);
	}
	
	@And("^I verify blue colored text of Readmissions Benchmark Variance as \"([^\"]*)\" on dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_blue_colored_text_of_Readmission_Benchmark_variance_as_on_dashboard_with_picture_resolution(String count,String resolution) throws Throwable{
		programdashboard.TakeShotOFBlueColorElement(count,"//div[@tb-test-id='Readmissions Benchmark Variance']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 259px; height: 74px;']", resolution);
	}
	
	@Given("^I execute the jmeter application and execute jmx file \"([^\"]*)\"$")
	public void i_execute_the_jmeter_application_and_execute_jmx_file(String location) throws Throwable{
		programdashboard.executejmeter(location);
	}
	
	@And("^I click on \"([^\"]*)\" dashboard$")
	public void i_click_on_dashboard(String dashboard) throws Throwable{
		programdashboard.iClickOnDashboard(dashboard);
	}
	
	@And("^I set the time for starting date to \"([^\"]*)\" on dashboard$")
	public void i_set_time_for_starting_date_to_on_dashboard(String date) throws Throwable{
		programdashboard.iSetCalendarAttributeValue(date);
	}
	
	@Then("^I read the values from the text file \"([^\"]*)\"$")
	public void i_read_the_alues_from_the_text_file(String location) throws IOException{
		programdashboard.iReadTextFromOutputfile(location);
	}
	
	@And("^I verify \"([^\"]*)\" count matched with database value on the dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_ec_episodes_count_matched_with_database_as_on_the_dashboard(String text,String resolution) throws Throwable{
//		programdashboard.GetTextFromScreenShot(text,"//div[@tb-test-id='KPI_Episode']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 152px; height: 55px;']",resolution);
		programdashboard.GetTextFromScreenShot(text,"//div[@tb-test-id='KPI_Episode']//div[@class='tvimagesContainer']/canvas",resolution);
	}
	
	@Then("^I set the time from starting date as \"([^\"]*)\" to ending date to claimscube date to validate claims episode data$")
	public void i_set_the_time_from_starting_date_as_to_ending_date_to_validate_claims_episode_data(String start) throws Throwable{
		programdashboard.iSetStartAndEndDateForClaimsData(start);
	}
	
	@And("^I verify \"([^\"]*)\" data is matched with database value on dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_data_is_matched_with_database_value_on_dashboard_with_picture_resolution(String text,String resolution) throws Throwable{
		programdashboard.ReadTextFromSavingsRateField(text, "//div[@tb-test-id='Savings Rate']//div[@class='tvimagesContainer']/canvas", resolution);
	}
	
	@And("^I verify \"([^\"]*)\" count matched with database value on dashboard for program size with picture resolution \"([^\"]*)\"$")
	public void i_verify_program_size_count_matched_with_database_as_on_the_dashboard(String text,String resolution) throws Throwable{
		programdashboard.GetTextFromScreenShot(text,"//div[@tb-test-id='KPI_Program_size']//div[@class='tvimagesContainer']/canvas",resolution);
	}
	
	@And("^I verify \"([^\"]*)\" count matched with database value on dashboard for npra with picture resolution \"([^\"]*)\"$")
	public void i_verify_npra_count_matched_with_database_as_on_the_dashboard(String text,String resolution) throws Throwable{
		programdashboard.GetTextFromScreenShot(text,"//div[@tb-test-id='KPI_NPRA']//div[@class='tvimagesContainer']/canvas",resolution);
	}
	
	@Then("^I select \"([^\"]*)\" from \"([^\"]*)\" field and click on \"([^\"]*)\"$")
	public void i_select_from_field_and_click_on(String text,String field,String apply) throws Throwable{
		programdashboard.iSelectValuesFromDropDown(text, field, apply);
	}
	
	@And("^I set the time for starting date to claimscube date on dashboard and ending date to today date$")
	public void i_set_time_for_starting_date_to_on_dashboard_and_ending_date_to_today_date() throws Throwable{
		programdashboard.iSetCalendarAttributeValueForEndingTodayDate();
	}
	
	@And("^I set the time filter for End date to today date$")
	public void i_set_time_Filter_For_End_date_to_today_date() throws Throwable{
		programdashboard.iSetCalendarAttributeValueForTodaysEndDate();
	}
	
	@Then("^I read the text from image$")
	public void i_read_the_text_from_image() throws Throwable{
		programdashboard.ireadtextfromimage();
	}
	
	@And("^I verify \"([^\"]*)\" count matched with database value on dashboard for discharge to snf with picture resolution \"([^\"]*)\"$")
	public void i_verify_count_matched_with_database_for_discharge_to_snf_as_on_the_dashboard(String text,String resolution) throws Throwable{
		programdashboard.GetTextFromScreenShot(text,"//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas",resolution);
	}
	
	@Then("^I set the time from starting date as \"([^\"]*)\" and ending date to today date$")
	public void i_set_the_time_from_starting_date_as_and_ending_date_to_today_date(String text) throws Throwable{
		programdashboard.iSetCalendarstartingDateAndEndDateToToday(text);
	}
	
	@And("^I verify \"([^\"]*)\" count matched with database value on dashboard for snf days with picture resolution \"([^\"]*)\"$")
	public void i_verify_count_matched_with_database_for_snf_days_as_on_the_dashboard(String text,String resolution) throws Throwable{
		programdashboard.GetTextFromScreenShot(text,"//div[@tb-test-id='SNF Days Current']//div[@class='tvimagesContainer']/canvas",resolution);
	}
	
	@And("^I verify \"([^\"]*)\" count matched with database value on dashboard for episodes with readmission with picture resolution \"([^\"]*)\"$")
	public void i_verify_count_matched_with_database_for_episodes_with_readmission_as_on_the_dashboard(String text,String resolution) throws Throwable{
		programdashboard.GetTextFromScreenShot(text,"//div[@tb-test-id='Readmissions Current']//div[@class='tvimagesContainer']/canvas",resolution);
	}
	
	@And("^I verify bpid matched with data appearing under filet field \"([^\"]*)\"$")
	public void i_verify_bpid_matched_with_data_appearing_under_filter_field(String filter) throws Throwable{
		programdashboard.iVerifyTextInFiterFieldValues(filter);
	}
	
	@Then("^I read the values from the ipec dashbaord output file \"([^\"]*)\"$")
	public void i_read_the_values_from_the_ipec_dashbaord_output_file(String location) throws IOException{
		programdashboard.iReadValuesForOutputFileForIPECDashboard(location);
	}
	
	@Then("^I verify \"([^\"]*)\" text is appearing when tried to login with invalid credentials$")
	public void i_verify_text_is_appearing_when_tried_to_login_with_invalid_credentials(String text) throws Throwable{
		programdashboard.iVerifyInavlidTextAppearingWhenTriedWithIncorrectCredentials(text);
	}
	
	@Then("^I verify \"([^\"]*)\" legend is appearing on the program performance dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_performing_legend_is_appearing_on_the_program_performance_dashboard(String text,String resolution) throws Throwable{
		programdashboard.GetTextFromLegends(text,"//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 104px; height: 13px;']",resolution);
	}
	
	@Then("^I verify \"([^\"]*)\" legend is appearing on the program performance dashboard below underperforming with picture resolution \"([^\"]*)\"$")
	public void i_verify_performing_legend_is_appearing_on_the_program_performance_dashboard_below_underperforming(String text,String resolution) throws Throwable{
		programdashboard.GetTextFromLegends(text,"//div[@tb-test-id='"+text+"']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 104px; height: 14px;']",resolution);
	}
	
	@Then("^I verify %Discharge to SNF section is appearing on the dashboard$")
	public void i_verify_discharge_to_snf_section_is_appearing_on_the_dashboard() throws Throwable{
		programdashboard.iVerifyDischargeToSNFSectionOnTheDashboards();
	}
	
	@Then("^I verify SNF days section is appearing on the dashbaord$")
	public void i_verify_SNF_days_section_is_appearing_on_the_dashboard() throws Throwable{
		programdashboard.iVerifySNFDaysSectionOnTheDashboards();
	}
	
	@And("^I verify the \"([^\"]*)\" section appearing on program performance dashboard$")
	public void i_verify_section_appearing_on_program_performance_dashboard(String text) throws Throwable{
		programdashboard.iVerifyBenchmarkVarianceFieldsOnProgramOverview(text);
	}
	
	@Then("^I verify \"([^\"]*)\" is selected in the filter field \"([^\"]*)\"$")
	public void i_verify_value_is_selected_in_the_filter_field(String value,String filter) throws Throwable{
		programdashboard.iVerifyFilterValueAppearingOnDasboard(value, filter);
	}
	
	@Then("^I verify graph for \"([^\"]*)\" is appearing on the program performance dashboard$")
	public void i_verify_graph_for_is_appearing_on_the_program_performance_dashboard(String text) throws Throwable{
		programdashboard.iVerifyTheGraphsAppearingOnDashboard(text);
	}
	
	@Then("^I validate the text appearing after mouse hovering on discharge to SNF as \"([^\"]*)\"$")
	public void i_validate_the_text_appearing_after_mose_hovering_on_discharge_to_snf(String verifytext){
		programdashboard.iValidateMouseHoverText("//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas",verifytext);
	}
	
	@Then("^I validate the text appearing after mouse hovering on snf days as \"([^\"]*)\"$")
	public void i_validate_the_text_appearing_after_mouse_hovering_on_snf_days_as(String verifytext){
		programdashboard.iValidateMouseHoverText("//div[@tb-test-id='SNF Days Current']//div[@class='tvimagesContainer']/canvas",verifytext);
	}
	
	@Then("^I validate the text appearing after mouse hovering on episodes with a readmission as \"([^\"]*)\"$")
	public void i_validate_the_text_appearing_after_mouse_hovering_on_episodes_with_a_readmission_as(String verifytext){
		programdashboard.iValidateMouseHoverText("//div[@tb-test-id='Readmissions Current']//div[@class='tvimagesContainer']/canvas",verifytext);
	}
	
	@Then("^I validate the text appearing after mouse hovering on savings rate as \"([^\"]*)\"$")
	public void i_validate_the_text_appearing_after_mouse_hovering_on_savings_rate_as(String verifytext){
		programdashboard.iValidateMouseHoverText("//div[@tb-test-id='Savings Rate']//div[@class='tvimagesContainer']/canvas",verifytext);
	}
	
	@And("^I verify \"([^\"]*)\" is appearing in the tool tip text on the snf days metric value$")
	public void i_verify_is_appearing_in_the_tool_tip_text_on_the_snf_days_metric_value(String text){
		programdashboard.iValidateAdjHistText(text,"//div[@tb-test-id='SNF Days Current']//div[@class='tvimagesContainer']/canvas");
	}
	
	@And("^I verify \"([^\"]*)\" is appearing in the tool tip text on the episodes with a readmission value$")
	public void i_verify_is_appearing_in_the_tool_tip_text_on_the_episodes_with_a_readmission_metric_value(String text){
		programdashboard.iValidateAdjHistText(text,"//div[@tb-test-id='Readmissions Current']//div[@class='tvimagesContainer']/canvas");
	}
	
	@And("^I verify \"([^\"]*)\" is appearing on the program performance dashboard$")
	public void i_verify_is_appearing_on_the_program_performance_dashboard(String text){
		programdashboard.iValidateFilterName(text);
	}
	
	@And("^I click \"([^\"]*)\" Filter on the program performance dashboard$")
	public void i_click_filter_on_the_program_performance_dashboard(String text){
		programdashboard.iClickOnFilterName(text);
	}
	
	@Then("^I validate the text appearing after mouse hovering on discharge to SNF benchmark value as \"([^\"]*)\"$")
	public void i_validate_the_text_appearing_after_mose_hovering_on_discharge_to_snf_benchmark_value_as(String verifytext){
		programdashboard.iValidateMouseHoverText("//div[@tb-test-id='% SNF Disch Benchmark Variance']//div[@class='tvimagesContainer']/canvas",verifytext);
	}
	
	@Then("^I validate the text appearing after mouse hovering on snf days benchmark value as \"([^\"]*)\"$")
	public void i_validate_the_text_appearing_after_mouse_hovering_on_snf_days_benchmark_value_as(String verifytext){
		programdashboard.iValidateMouseHoverText("//div[@tb-test-id='SNF Days Benchmark Variance']//div[@class='tvimagesContainer']/canvas",verifytext);
	}
	
	@Then("^I validate the text appearing after mouse hovering on episodes with a readmission benchmark value as \"([^\"]*)\"$")
	public void i_validate_the_text_appearing_after_mouse_hovering_on_episodes_with_a_readmission_benchmark_value_as(String verifytext){
		programdashboard.iValidateMouseHoverTextForReadmissions("//div[@tb-test-id='Readmissions Benchmark Variance']//div[@class='tvimagesContainer']/canvas",verifytext);
	}
	
	@And("^I verify \"([^\"]*)\" title is appearing on the program performance dashboard$")
	public void i_verify_title_is_appearing_on_the_program_performance_dashboard(String text){
		programdashboard.iValidateTitleNameOnDashbaord(text);
	}
	
	@And("^I verify \"([^\"]*)\" text is appearing below %Disch to SNF benchmark metric value with picture resolution \"([^\"]*)\"$")
    public void i_verify_text_is_appearing_below_Disch_to_SNF_benchmark_metric_value(String text,String resolution) throws IOException{
		programdashboard.GetTextFromBenchmarks(text, "//div[@tb-test-id='% SNF Disch Benchmark Variance']//div[@class='tvimagesContainer']/canvas", resolution);
	}
	
	@And("^I verify \"([^\"]*)\" text is appearing below snf days benchmark metric value with pictur resolution \"([^\"]*)\"$")
	public void i_verify_text_is_appearing_below_snf_days_benchmark_metric_value(String text,String resolution) throws IOException{
		programdashboard.GetTextFromBenchmarks(text, "//div[@tb-test-id='SNF Days Benchmark Variance']//div[@class='tvimagesContainer']/canvas", resolution);
	}
	
	@And("^I verify \"([^\"]*)\" text is appearing below episodes with a readmission metric value with picture resolution \"([^\"]*)\"$")
	public void i_verify_text_is_appearing_below_episodes_with_a_readmission_metric_value_with_picture_resolution(String text,String resolution) throws IOException{
		programdashboard.GetTextForEpisodesWithReadmission(text, "//div[@tb-test-id='Readmissions Benchmark Variance']//div[@class='tvimagesContainer']/canvas", resolution);
	}
	
	@And("^I verify \"([^\"]*)\" text is appearing on %Disch to SNF metric field with picture resolution \"([^\"]*)\"$")
	public void i_verify_text_is_appearing_on_disch_to_snf_metric_field(String text,String resolution) throws IOException{
		programdashboard.GetTextFromBenchmarks(text, "//div[@tb-test-id='% SNF Disch Current']//div[@class='tvimagesContainer']/canvas", resolution);
	}
	
	@And("^I verify \"([^\"]*)\" text is appearing on SNF Days metric field with picture resolution \"([^\"]*)\"$")
	public void i_verify_text_is_appearing_on_snf_days_metric_field(String text,String resolution) throws IOException{
		programdashboard.GetTextFromBenchmarks(text, "//div[@tb-test-id='SNF Days Current']//div[@class='tvimagesContainer']/canvas", resolution);
	}
	
	@And("^I verify \"([^\"]*)\" text is appearing on episodes with a readmission metric field with picture resolution \"([^\"]*)\"$")
	public void i_verify_text_is_appearing_on_episodes_with_readmission_metric_field(String text,String resolution) throws IOException{
		programdashboard.GetTextForEpisodesWithReadmission(text, "//div[@tb-test-id='Readmissions Current']//div[@class='tvimagesContainer']/canvas", resolution);
	}
	
	@Then("^I verify \"([^\"]*)\" symbol is appearing beside benchmark text under %Disch to SNF metric field with picture resolution \"([^\"]*)\"$")
	public void i_verify_symbol_is_appearing_beside_benchmark_text_under_disch_to_snf_metric_field(String text,String resolution) throws IOException{
		programdashboard.GetTextFromBenchmarks(text, "//div[@tb-test-id='% SNF Disch Benchmark Variance']//div[@class='tvimagesContainer']/canvas", resolution);
	}
	
	@Then("^I verify \"([^\"]*)\" symbol is appearing beside benchmark text under snf days metric field with picture resolution \"([^\"]*)\"$")
	public void i_verify_symbol_is_appearing_beside_benchmark_text_under_snf_days_metric_field(String text,String resolution) throws IOException{
		programdashboard.GetTextFromBenchmarks(text, "//div[@tb-test-id='SNF Days Benchmark Variance']//div[@class='tvimagesContainer']/canvas", resolution);
	}
	
	@Then("^I verify \"([^\"]*)\" symbol is appearing beside benchmark text under episodes with a readmission metric field with picture resolution \"([^\"]*)\"$")
	public void i_verify_symbol_is_appearing_beside_benchmark_text_under_episodes_with_a_readmission_metric_field(String text,String resolution) throws IOException{
		programdashboard.GetTextForEpisodesWithReadmission(text, "//div[@tb-test-id='Readmissions Benchmark Variance']//div[@class='tvimagesContainer']/canvas", resolution);
	}
	
	@And("^I verify \"([^\"]*)\" tooltip is having the same value fetched from database$")
	public void i_verify_discharge_tooltip_is_having_the_same_value_fetched_from_database(String text) throws Throwable{
		programdashboard.iValidateBenchmarkToolTipText(text);
	}
	
	@And("^I verify Episode Initiator BPID values with database value$")
	public void i_verify_Episode_Initiator_BPID_values_with_database_value() throws Throwable{
		programdashboard.iVeriyEpisodeIntiatorBPID();
	}
}
