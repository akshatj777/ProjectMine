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
		programdashboard.GetTextFromScreenShot(text,"//div[@tb-test-id='KPI_Episode']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 152px; height: 52px;']",resolution);
	}
	
	@Then("^I set the time from starting date as \"([^\"]*)\" to ending date \"([^\"]*)\" to validate claims episode data$")
	public void i_set_the_time_from_starting_date_as_to_ending_date_to_validate_claims_episode_data(String start,String end) throws Throwable{
		programdashboard.iSetStartAndEndDateForClaimsData(start, end);
	}
	
	@And("^I verify \"([^\"]*)\" data is matched with database value on dashboard with picture resolution \"([^\"]*)\"$")
	public void i_verify_data_is_matched_with_database_value_on_dashboard_with_picture_resolution(String text,String resolution) throws Throwable{
		programdashboard.ReadTextFromSavingsRateField(text, "//div[@tb-test-id='Savings Rate']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 309px; height: 79px;']", resolution);
	}
	
	@And("^I verify \"([^\"]*)\" count matched with database value on dashboard for program size with picture resolution \"([^\"]*)\"$")
	public void i_verify_program_size_count_matched_with_database_as_on_the_dashboard(String text,String resolution) throws Throwable{
		programdashboard.GetTextFromScreenShot(text,"//div[@tb-test-id='KPI_Program_size']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 227px; height: 52px;']",resolution);
	}
	
	@And("^I verify \"([^\"]*)\" count matched with database value on dashboard for npra with picture resolution \"([^\"]*)\"$")
	public void i_verify_npra_count_matched_with_database_as_on_the_dashboard(String text,String resolution) throws Throwable{
		programdashboard.GetTextFromScreenShot(text,"//div[@tb-test-id='KPI_NPRA']//div[@class='tvimagesContainer']/canvas[@style='display: block; width: 205px; height: 52px;']",resolution);
	}
	
	@Then("^I select \"([^\"]*)\" from \"([^\"]*)\" field and click on \"([^\"]*)\"$")
	public void i_select_from_field_and_click_on(String text,String field,String apply) throws Throwable{
		programdashboard.iSelectValuesFromDropDown(text, field, apply);
	}
	
	@And("^I set the time for starting date to \"([^\"]*)\" on dashboard and ending date to today date$")
	public void i_set_time_for_starting_date_to_on_dashboard_and_ending_date_to_today_date(String date) throws Throwable{
		programdashboard.iSetCalendarAttributeValueForEndingTodayDate(date);
	}
	
	@Then("^I read the text from image$")
	public void i_read_the_text_from_image() throws Throwable{
		programdashboard.ireadtextfromimage();
	}
	
}
