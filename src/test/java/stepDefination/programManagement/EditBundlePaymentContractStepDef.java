package stepDefination.programManagement;

import com.remedy.programManagement.CreateBundlePaymentContracts;
import com.remedy.programManagement.EditBundlePaymentContract;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

public class EditBundlePaymentContractStepDef extends DriverScript {
	
	CreateBundlePaymentContracts CreateBPContracts= new CreateBundlePaymentContracts(driver);
	EditBundlePaymentContract editBPContract = new EditBundlePaymentContract(driver);

	@And("^I verify \"([^\"]*)\" field for \"([^\"]*)\" on edit Contracts page$")
	  public void i_Verify_Date_Fields_On_Create_Contracts_Page(String text, String action) throws Throwable {
		CreateBPContracts.iVerifyDateFieldsOnCreateContractsPage(text,action);
	 }
	
	@And("^I verify \"([^\"]*)\" field is editable$")
	  public void i_Verify_Price_field_is_Editable(String text) throws Throwable {
		editBPContract.iVerifyPriceFieldisEditable(text);
	 }
	
	@Then("^I verify \"([^\"]*)\" dropdown box is not editable$")
	  public void i_Verify_Dropdown_Box_is_not_Editable(String text) throws Throwable {
		editBPContract.iVerifyDropdownBoxisnotEditable(text);
	 }
	
	@Then("^I verify program \"([^\"]*)\" dropdown box is not editable$")
	  public void i_Verify_Program_Dropdown_Box_is_not_Editable(String text) throws Throwable {
		editBPContract.iVerifyProgramDropdownBoxisnotEditable(text);
	 }
	
	@Then("^I verify \"([^\"]*)\" field is not editable$")
	  public void i_Verify_Contract_Id_Field_is_not_Editable(String text) throws Throwable {
		editBPContract.iVerifyContractIdFieldisnotEditable(text);
	 }
	
	@Then("^I edit \"([^\"]*)\" in \"([^\"]*)\" field for \"([^\"]*)\" on edit Contract page$")
	  public void i_Edit_Price_Field_on_Edit_Contarct_Page(String text, String field, String field1) throws Throwable {
		editBPContract.iEditPriceFieldonEditContarctPage(text,field,field1);
	 }
	
	@Then("^I click on react date picker icon for \"([^\"]*)\" for index \"([^\"]*)\" on edit contract page$")
	  public void i_Click_on_ReactDatePicker_Icon_on_Edit_Contarct_Page(String field, int index) throws Throwable {
		editBPContract.iClickonReactDatePickerIcononEditContarctPage(field, index);
	 }
}
