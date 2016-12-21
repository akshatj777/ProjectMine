package stepDefination.Episode2;

import com.remedy.Episode2.PatientsPage;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

/**
 * Created by ashish.ranjan on 24-11-2016.
 */
public class PatientsPageSteps extends DriverScript {
    PatientsPage patientsPage = new PatientsPage(driver);

    @Then("^I should see \"([^\"]*)\" tab in the filter bar on patients page$")
    public void i_should_see_tab_in_the_filter_bar_on_patients_page(String filterTabText) throws Throwable {
        patientsPage.iVerifyTabInFilterBarOnPatientsPage(filterTabText);

    }

    @When("^I click on \"([^\"]*)\" tab in the filter bar on patients page$")
    public void i_click_on_tab_in_the_filter_bar_on_patients_page(String filterTabText) throws Throwable {
        patientsPage.iClickTabInFilterBarOnPatientsPage(filterTabText);
    }

    @Then("^I should see view section on patients page$")
    public void i_should_see_view_section_on_patients_page() throws Throwable {
        patientsPage.iVerifyViewSectionOnPatientsPage("View:");

    }

    @Then("^I should see \"([^\"]*)\" view as active view on patients page$")
    public void i_should_see_view_as_active_view_on_patients_page(String viewOption) throws Throwable {
        patientsPage.iVerifyViewAsActiveViewOnPatientsPage(By.cssSelector("button.valentino-icon-"+viewOption+""));
    }

    @Then("^I should have \"([^\"]*)\" view option on patients page$")
    public void i_sould_have_view_option_on_patients_page(String viewOption) throws Throwable {
        patientsPage.iVerifyToHaveViewOptionOnPatientsPage(By.cssSelector("button.valentino-icon-"+viewOption+""), viewOption);
    }

    @When("^I select \"([^\"]*)\" view on patients page$")
    public void i_select_view_on_patients_page(String viewOption) throws Throwable {
        patientsPage.iClickViewOnPatientsPage("button.valentino-icon-"+viewOption+"");
    }

    @When("^I type \"([^\"]*)\" in the patient search field on patients page$")
    public void i_type_in_the_patient_search_field_on_patients_page(String patientName) throws Throwable {
        patientsPage.iEnterInPatientSearchFieldOnPatientsPage(patientName);
    }

    @Then("^I should see patient searched result contains \"([^\"]*)\" on patients page$")
    public void i_should_see_patient_searched_result_contains_on_patient_page(String patientText) throws Throwable {
        patientsPage.iVerifyPatientSearchedResultContainsTextOnPatientPage(patientText);
    }

    @Then("^I should see Filters button present on patients page$")
    public void i_should_see_filter_button_present_on_patient_page() throws Throwable {
        patientsPage.iVerifyElementTextPresentOnPatientPage(By.xpath("//button[span[span[contains(text(),'Filters')]]]"),"Filter");
    }

    @Then("^I should see \"([^\"]*)\" as placeholder for search on patients page$")
    public void i_Should_See_As_Placeholder_For_Search_On_Patient_Page(String patientText) throws Throwable {
        patientsPage.iVerifySeeAsPlaceholderForSearchOnPatientPage(patientText);
    }

    @Then("^I should see the total patient count on patient page$")
    public void i_should_see_the_total_patient_count_on_patient_page() throws Throwable {
        patientsPage.iVerifyElementPresentOnPatientPage(By.cssSelector("div.ng-scope>div>strong.ng-binding"));
    }

    @Then("^I should see Export feature present on patient page$")
    public void i_should_see_export_feature_present_on_patient_page() throws Throwable {
        patientsPage.iVerifyElementPresentOnPatientPage(By.cssSelector(".export-link>a"));
        patientsPage.iVerifyElementTextPresentOnPatientPage(By.cssSelector(".export-link>a"), "Export");
    }

    @Then("^I should see Sort by feature is present on patient page$")
    public void i_should_see_Sortby_feature_present_on_patient_page() throws Throwable {
        patientsPage.iVerifyElementTextPresentOnPatientPage(By.xpath("//strong[@class='sort-select-label']"),"Sort by:");
    }

    @Then("^I should see Refresh button is present on patient page$")
    public void i_should_see_Refresh_button_is_present() throws Throwable {
        patientsPage.iVerifyElementPresentOnPatientPage(By.cssSelector("button.btn-reload"));
    }

    @Then("^I verify Add Patient button is present on patients page$")
    public void i_verify_Add_Patient_button_is_present_on_patients_page() throws Throwable {
        patientsPage.iVerifyElementPresentOnPatientPage(By.xpath("//button[contains(text(),'Add Patient')]"));
    }

    @Then("^I verify \"([^\"]*)\" Patient Cards are present on patients page$")
    public void i_verify_Patient_Cards_are_present_on_patients_page(int Count) throws Throwable {
        patientsPage.iVerifyCountOFPatientCardsArePresentOnPatientsPage(Count);
    }

    @When("^I click on \"([^\"]*)\" worklist filter options on the patients page$")
    public void i_click_on_worklist_filter_option_on_the_patients_page(String worklistFilter) throws Throwable {
        patientsPage.iClickOnWorkistFilterOptionsOnPatientsPage(worklistFilter);
    }

    @Then("^I should verify \"([^\"]*)\" worklist sub bar option is present on patients page$")
    public void i_should_verify_worklist_sub_bar_option_on_the_patients_page(String worklistSubbar) throws Throwable {
        patientsPage.iVerifyWorklistSubBarOptionsPresentOnPatientsPage(worklistSubbar);
    }
}
