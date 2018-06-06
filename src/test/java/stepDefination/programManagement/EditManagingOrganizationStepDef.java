package stepDefination.programManagement;

import com.remedy.programManagement.EditManagingOrganization;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.And;

public class EditManagingOrganizationStepDef extends DriverScript{
	EditManagingOrganization editManagingOrg = new EditManagingOrganization(driver);
	
	@And("^I click \"([^\"]*)\" field in search list on organization page$")
	  public void i_Click_Field_In_SearchList_On_Organization_Page(String field) throws Throwable {
		editManagingOrg.iClickFieldInSearchListOnOrganizationPage(field);
	    }
	
	@And("^I click on \"([^\"]*)\" button on particular organization$")
	  public void i_Click_On_Button_On_Particular_Organization(String button) throws Throwable {
		editManagingOrg.iClickOnButtonOnParticularOrganization(button);
	    }
	
	@And("^I edit \"([^\"]*)\" field to \"([^\"]*)\" for organization$")
	  public void i_Edit_All_Fields_Of_Organization(String field1, String field2) throws Throwable {
			editManagingOrg.iEditAllFieldsOFOrganization(field1,field2);
	 }
	 
	@And("^I edit ([^\"]*) field for organization$")
	  public void i_Selecct_State_FromDropDown_On_Create_Organization_Page(String text) throws Throwable {
		 editManagingOrg.iEditStateFieldForOrganization(text);
	 }
	
	@And("^I click \"([^\"]*)\" field in search list on \"([^\"]*)\" organization page$")
	  public void i_Click_Field_In_SearchList_On_ACHandSNF_Organization_Page(String field, String org) throws Throwable {
		editManagingOrg.iClickFieldInSearchListOnACHandSNFOrganizationPage(field, org);
	    }
}