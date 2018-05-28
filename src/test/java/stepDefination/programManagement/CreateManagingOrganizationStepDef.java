package stepDefination.programManagement;

import com.remedy.programManagement.CreateManagingOrganization;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

public class CreateManagingOrganizationStepDef extends DriverScript{
	CreateManagingOrganization createMO = new CreateManagingOrganization(driver);
	
	@And("^I verify \"([^\"]*)\" button under \"([^\"]*)\" organization page$")
	  public void i_Verify_Button_Under_Organization_Page(String button, String org) throws Throwable {
		 createMO.iVerifyButtonUnderOrganizationTab(button);
	    }
	 
	 @And("^I verify \"([^\"]*)\" header text on ([^\"]*) organization page$")
	  public void i_Verify_HeaderText_On_Create_Organization_Page(String text, String action) throws Throwable {
		 createMO.iVerifyHeaderTextOnCreateOrganizationPage(text);
	    }
	 
	 @And("^I verify \"([^\"]*)\" field on ([^\"]*) organization page$")
	  public void i_Verify_Label_Fields_On_Create_Organization_Page(String text, String action) throws Throwable {
		 createMO.iVerifyLabelFieldsOnCreateOrganizationPage(text);
	    }
	 
	 @And("^I verify \"([^\"]*)\" radio button on ([^\"]*) organization page$")
	  public void i_Verify_RadioButton_Label_On_Create_Organization_Page(String text, String action) throws Throwable {
		 createMO.iVerifyRadioButtonLabelOnCreateOrganizationPage(text);
	    }

	 @And("^I click on \"([^\"]*)\" button on \"([^\"]*)\" organization page$")
	  public void i_Click_On_Button_On_Create_Organization_Page(String text, String page) throws Throwable {
		 createMO.iClickOnButtonOnCreateOrganizationPage(text);
	    }

	 @Then("^User navigated to \"([^\"]*)\" view page$")
	  public void user_navigated_to_view_page(String org) throws Throwable {
		 createMO.userNavigatedToViewPage(org);
	 }

	 @And("^I verify \"([^\"]*)\" button on ([^\"]*) organization page$")
	  public void i_verify_On_Button_On_Create_Organization_Page(String text, String action) throws Throwable {
		 createMO.iVerifyOnButtonOnCreateOrganizationPage(text);
	    }
	 
	 @And("^I verify \"([^\"]*)\" mandatory field validation message on ([^\"]*) organization page$")
	  public void i_Verify_ValidationMessage_Under_MandatoryFields_On_Create_Organization_Page(String text, String action) throws Throwable {
		 createMO.iVerifyManadtoryFieldValidationOnCreateOrganizationPage(text);
	    }
	 
	 @And("^I verify \"([^\"]*)\" field validation message on ([^\"]*) organization page$")
	  public void i_Verify_ValidationMessage_Under_Fields_On_Create_Organization_Page(String text, String action) throws Throwable {
		 createMO.iVerifyManadtoryFieldValidationOnCreateOrganizationPage(text);
	    }
		
	 @And("^I enter ([^\"]*) in \"([^\"]*)\" on create organization page$")
	  public void i_Enter_Details_In_Fileds_On_Create_Organization_Page(String text,String field) throws Throwable {
		 createMO.iEnterDetailsInFieldsOnCreateOrganizationPage(text,field);
	    }

	 @And("^I select ([^\"]*) in State on create organization page$")
	  public void i_Selecct_State_FromDropDown_On_Create_Organization_Page(String text) throws Throwable {
		 createMO.iSelectStateFromDropDownOnCreateOrganizationPage(text);
	 }
	 
	 @Then("^I verify \"([^\"]*)\" after submitting the \"([^\"]*)\" organization page$")
	  public void i_Verify_Message_After_Submitting_Create_Organization_Page(String msg, String org) throws Throwable {
		 createMO.iVerifyMessageAfterSubmittingCreateOrganizationPage(msg, org);
	 }
	 
	 @Then("^I verify duplicate \"([^\"]*)\" after submitting the \"([^\"]*)\" organization page$")
	  public void i_Verify_Duplicate_Message_After_Submitting_Create_Organization_Page(String msg, String org) throws Throwable {
		 createMO.iVerifyDuplicateMessageAfterSubmittingCreateOrganizationPage(msg, org);
	 }
	 
	 @And("^I switch the focus to \"([^\"]*)\" button$")
	  public void i_Switch_The_Focus_To_Button(String type) throws Throwable {
		 createMO.iSwitchFocusToButton(type);
	 } 
}