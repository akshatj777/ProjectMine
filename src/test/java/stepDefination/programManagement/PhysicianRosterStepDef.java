package stepDefination.programManagement;

import com.remedy.programManagement.PhysicianRoster;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

public class PhysicianRosterStepDef extends DriverScript{
	
	PhysicianRoster physicianroster=new PhysicianRoster(driver);

	@And("^I verify the \"([^\"]*)\" on \"([^\"]*)\" Physician Roster page$")
	public void i_Verify_PGP_Organization_Name_On_Physician_Roster_Page(String text, String page) throws Throwable {
		physicianroster.iVerifyPGPOrganizationNameOnPhysicianRosterPage(text, page);
	}
	
	@And("^I verify \"([^\"]*)\" dropdown is appearing on \"([^\"]*)\" Physician Roster page$")
	public void i_verify_dropdown_is_appearing_on_Physician_Roster_page(String text,String page) throws Throwable{
		physicianroster.iVerifyProgramDropdownOnPhysicianRosterPage(text, page);
	}
	
	@And("^I verify \"([^\"]*)\" text is appearing on the \"([^\"]*)\" Physician Roster page$")
	public void i_verify_text_is_appearing_on_the_Physician_Roster_page(String text,String page) throws Throwable{
		physicianroster.iVerifyTextOnPhysicianRosterPage(text, page);
	}
	
	@And("^I verify \"([^\"]*)\" dropdown above add practioner is appearing on \"([^\"]*)\" Physician Roster page$")
	public void i_verify_dropdown_above_add_practioner_is_appearing_on_Physician_Roster_page(String text,String page) throws Throwable{
		physicianroster.iVerifyPractionerDropdownOnCreatePhysicianRosterPage(text, page);
	}
	
	@And("^I verify \"([^\"]*)\" button on \"([^\"]*)\" Physician Roster page$")
	public void i_verify_button_on_Physician_Roster_page(String text,String page) throws Throwable{
		physicianroster.iVerifyButtonOnPhysicianRosterPage(text, page);
	}
	
	@And("^I verify \"([^\"]*)\" button on ([^\"]*) Physician Roster page$")
	public void i_verify_On_Button_On_Create_Physician_Roster_Page(String text, String action) throws Throwable {
		physicianroster.iVerifyOnButtonOnCreatePhysicianosterPage(text);
	}
	
	@Then("^I select \"([^\"]*)\" Program name from program dropdown on \"([^\"]*)\" Physician Roster page$")
	public void i_select_program_from_program_dropdown_on_Physician_Roster_page(String text, String page) throws Throwable{
		physicianroster.iSelectProgramInProgramDropDownOnPhysicianRosterPage(text,page);
	}
	
	@And("^I verify \"([^\"]*)\" is appearing after selecting program from dropdown on physician roster page$")
	public void i_verify_is_appearing_after_selecting_program_from_dropdown_on_physician_roster_page(String text) throws Throwable{
		physicianroster.iVerifytextAfterSelectingProgramFromDropdownOnPhysicianRosterPage(text);
	}
	
	@And("^I select \"([^\"]*)\" Physician \"([^\"]*)\" on \"([^\"]*)\" Physician Roster page$")
	public void i_Select_a_Physician_on_Create_Physician_Roster_Page(int numberOfPractitioners, String text, String act) throws Throwable{
		physicianroster.iSelectaPhysicianonCreatePhysicianRosterPage(numberOfPractitioners, text, act);
	}
	
	@And("^I click on \"([^\"]*)\" button on \"([^\"]*)\" Physician Roster page$")
	public void i_Click_On_Add_Physician_Button(String text, String act) throws Throwable{
		physicianroster.iClickOnAddPhysicianButton(text, act);
	}
	
	@Then("^I verify first name \"([^\"]*)\" after adding Physician from dropdown on ([^\"]*) physician roster page$")
	public void i_Verify_FirstName_after_adding_Physician_From_Dropdown_on_Create_Physician_Roster_Page(String text, String act) throws Throwable{
		physicianroster.iVerifyDetailsAfterAddingPhysicianFromDropdownonCreatePhysicianRosterPage(text);
	}
	
	@Then("^I verify last name \"([^\"]*)\" after adding Physician from dropdown on ([^\"]*) physician roster page$")
	public void i_Verify_LastName_after_adding_Physician_From_Dropdown_on_Create_Physician_Roster_Page(String text, String act) throws Throwable{
		physicianroster.iVerifyDetailsAfterAddingPhysicianFromDropdownonCreatePhysicianRosterPage(text);
	}
	
	@Then("^I verify npi \"([^\"]*)\" after adding Physician from dropdown on ([^\"]*) physician roster page$")
	public void i_Verify_NPI_after_adding_Physician_From_Dropdown_on_Create_Physician_Roster_Page(String text, String act) throws Throwable{
		physicianroster.iVerifyDetailsAfterAddingPhysicianFromDropdownonCreatePhysicianRosterPage(text);
	}
	
	@Then("^I verify \"([^\"]*)\" npi \"([^\"]*)\" after adding Physician from dropdown on ([^\"]*) physician roster page$")
	public void i_Verify_NPI_after_adding_Physician(int numberOfPractitioner, String text, String act) throws Throwable{
		physicianroster.iVerifyNPIDetailsAfterAddingPhysicianFromDropdownonCreatePhysicianRosterPage(numberOfPractitioner, text);
	}
	
	@Then("^I verify start date \"([^\"]*)\" after adding Physician from dropdown on ([^\"]*) physician roster page$")
	public void i_Verify_StartDate_after_adding_Physician_From_Dropdown_on_Create_Physician_Roster_Page(String text, String act) throws Throwable{
		physicianroster.iVerifyDateAfterAddingPhysicianFromDropdownonCreatePhysicianRosterPage(text);
	}
	
	@Then("^I verify end date \"([^\"]*)\" after adding Physician from dropdown on ([^\"]*) physician roster page$")
	public void i_Verify_EndDate_after_adding_Physician_From_Dropdown_on_Create_Physician_Roster_Page(String text, String act) throws Throwable{
		physicianroster.iVerifyDateAfterAddingPhysicianFromDropdownonCreatePhysicianRosterPage(text);
	}
	
	@Then("^I search \"([^\"]*)\" and verify with search list options on select a Physician dropdown box$")
	public void i_Search_With_Search_List_Options_On_Select_a_Physician_Dropdown_Box(String searchParam) throws Throwable{
		physicianroster.iSearchWithSearchListOptionsOnSelectAPhysicianDropdownBox(searchParam);
	}
	
	@Then("^I verify the \"([^\"]*)\" message for invalid search in select a Physician dropdown box$")
	public void i_Verify_The_Error_Message_For_Invalid_Search_In_Organization_Name_Physician_Dropdown_Box(String text) throws Throwable{
		physicianroster.iVerifyTheErrorMessageForInvalidSearchInSelectaPhysicianDropdownBox(text);
	}
	
	@And("^I verify \"([^\"]*)\" field validation message on ([^\"]*) Physician Roster page$")
	public void i_Verify_Validation_Message_Message_on_Create_Physician_Roster_Page(String msg, String act) throws Throwable{
		physicianroster.iVerifyValidationMessageMessageonCreatePhysicianRosterPage(msg,act);
	}
}
