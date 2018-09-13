package stepDefination.programManagement;

import com.remedy.programManagement.CreateManagingOrganization;
import com.remedy.programManagement.CreatePrograms;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

public class CreateProgramsStepDef extends DriverScript{
	CreatePrograms programs= new CreatePrograms(driver);
	CreateManagingOrganization createMO = new CreateManagingOrganization(driver);
	
	@And("^I verify \"([^\"]*)\" after submitting the \"([^\"]*)\" on Payor organization page$")
	  public void i_Verify_Message_After_Submitting_Create_Organization_Page(String text, String org) throws Throwable {
		programs.iVerifyMessageAfterSubmittingCreateOrganizationPageUnderPayorOrganization(text, org);
	 }
	
	@And("^I verify \"([^\"]*)\" header label under \"([^\"]*)\" view profile page$")
	  public void i_Verify_Header_Label_Under_Organization(String header,String org) throws Throwable {
		programs.iVerifyHeaderLabelUnderSelectedOrganization(header,org);
		}
	
	@And("^I select \"([^\"]*)\" Program name \"([^\"]*)\" in create Contract page under \"([^\"]*)\" Organization$")
	  public void i_select_Program_name_in_create_Contract_page_under_Payor_Organization(int index,String text, String org) throws Throwable {
		programs.iSelectProgramNameInCreateContractPageUnderPayorOrganization(index,text,org);
		}
	
	@And("^I verify \"([^\"]*)\" on \"([^\"]*)\" page under Payor Organization$")
	  public void i_Verify_On_Contract_On_Create_Contract_Page_Under_Payor_Organization(String text, String act) throws Throwable {
		programs.iVerifyContractHeaderOnCreateContractPageUnderPayorOrganization(text, act);
	    }
	
	@And("^I select Organization type \"([^\"]*)\" for Contract \"([^\"]*)\" on \"([^\"]*)\" Contracts page$")
	  public void i_Select_OrganizationType_on_Create_Contracts_Page(String text, int num, String field) throws Throwable {
		programs.iSelectOrganizationTypeOnCreateContratsPageUnderPayorOrganization(text, num, field);
	    }
	
	@And("^I select Organization name \"([^\"]*)\" for Contract \"([^\"]*)\" on \"([^\"]*)\" Contracts page$")
	  public void i_Select_Organization_Name_on_Create_Contracts_Page(String text, int num, String field) throws Throwable {
		programs.iSelectOrganizationNameOnCreateContratsPageUnderPayorOrganization(text, num, field);
	    }
	
	@And("^I select \"([^\"]*)\" Bundle \"([^\"]*)\" for Contract \"([^\"]*)\" on \"([^\"]*)\" Contracts page$")
	  public void i_Select_Bundle1_on_Create_Contracts_Page(int bundleNumber, String text, int num, String field) throws Throwable {
		programs.iSelectBundleOnCreateContractsPageUnderPayorOrganization(bundleNumber, text,num,field);
	    }
	
	@And("^I enter price \"([^\"]*)\" for Contract \"([^\"]*)\" on \"([^\"]*)\" Contracts page$")
	  public void i_Enter_Price_on_Create_Contracts_Page(String text, int num, String field) throws Throwable {
		programs.iEnterPriceOnCreateContractsPage(text,num,field);
	    }
	
	@And("^I enter \"([^\"]*)\" in \"([^\"]*)\" field for \"([^\"]*)\" on create Contract page$")
	  public void i_Enter_For_Bundle_Price1_on_Create_Contracts_Page(String text, String field, String act) throws Throwable {
		programs.iEnterDetailsOnCreateContractPage(text, field, act);
	    }
	
	@Then ("^I Click on \"([^\"]*)\" button$")
	public void i_Click_on_Addbundle_Button(String text){
		createMO.iClickOnButtonOnCreateOrganizationPage(text);
	}
	
	@And("^I verify \"([^\"]*)\" header text on create Contracts page$")
	  public void i_Verify_Create_Contract_Header_Text_On_Create_Contracts_Page(String text) throws Throwable {
		programs.iVerifyCreateContractHeaderTextOnCreateContractsPage(text);
	    }
	
	@And("^I verify \"([^\"]*)\" dropdown box on create Contracts page$")
	  public void i_Verify_Field_On_Create_Contracts_Page(String text) throws Throwable {
		programs.iVerifyFieldOnCreateContractsPage(text);
	    }
	
	@And("^I verify \"([^\"]*)\" field for Contract \"([^\"]*)\" on Create Contracts page$")
	  public void i_Verify_Dates_Field_On_Create_Contracts_Page(String text) throws Throwable {
		programs.iVerifyFieldOnCreateContractsPage(text);
	    }
	
	@And("^I click on checkbox for \"([^\"]*)\" Attribution rule$")
	  public void i_Click_On_Checkboxe_For_Attribution_Rules_On_Create_Programs(String text) throws Throwable {
		programs.iClickOnCheckboxeForAttributionRulesOnCreatePrograms(text);
	    }
	
	@And("^I verify the \"([^\"]*)\" on \"([^\"]*)\" Network Contract page$")
	  public void i_Verify_PGP_Organization_Name_On_Network_Contract_Page(String text, String page) throws Throwable {
		programs.iVerifyPGPOrganizationNameOnNetworkContractPage(text, page);
	    }
	
	@And("^I verify Search box for Hospital Organization on \"([^\"]*)\" Network Contract page$")
	  public void i_Verify_Search_Box_For_Hospital_Organization_On_Network_Contract_Page(String page) throws Throwable {
		programs.iVerifySearchBoxForHospitalOrganizationOnNetworkContractPage(page);
	    }
	
	@And("^I verify \"([^\"]*)\" field on \"([^\"]*)\" Network Contract page$")
	  public void i_Verify_Date_Field_On_Network_Contract_Page(String field, String page) throws Throwable {
		programs.iVerifyDateFieldOnNetworkContractPage(field, page);
	    }
	
	@And("^I verify Default Network Contract Start date should be today's date$")
	  public void i_Verify_Default_Network_Contract_Start_Date_Should_Be_Today_Date() throws Throwable {
		programs.iVerifyDefaultNetworkContractStartDateShouldBeTodayDate();
	    }
	
	@And("^I verify \"([^\"]*)\" on Create Network Contract page$")
	  public void i_Verify_Program_On_Create_Network_Contract_Page(String text) throws Throwable {
		programs.iVerifyProgramOnCreateNetworkContractPage(text);
	    }
	
	@And("^I verify \"([^\"]*)\" in \"([^\"]*)\" after selecting Contract Name$")
	  public void i_Verify_The_Details_After_Selecting_Contract_Name(String text, String field){
		programs.iVerifyTheDetailsAfterSelectingContractNameOnCreateNetworkContractPage(text,field);
	    }
	
	@And("^I verify Default Network Contract Start Date should be Bundled payment Contract's Start Date$")
	  public void I_Verify_Default_Network_Contract_Start_Date_Should_be_of_Bundled_Payment_Contract_Start_Date(){
		programs.iVerifyDefaultNetworkContractStartDateShouldBeOfBundledPaymentContractStartDate();
	    }
	
	@And("^I verify Default Network Contract End Date should be Bundled payment Contract's End Date$")
	  public void i_Verify_Default_Network_Contract_End_Date_Should_Be_of_Bundled_Payment_Contract_End_Date(){
		programs.iVerifyDefaultNetworkContractEndDateShouldBeofBundledPaymentContractEndDate();
	    }
	
	@And("^I enter date \"([^\"]*)\" in \"([^\"]*)\" field for index \"([^\"]*)\"$")
	  public void enterDateInContractPage(String date, String field, int index) throws Throwable {
		programs.enterDate(date,field, index);
	    }

	@And("^I click on react date picker close icon for \"([^\"]*)\"$")
	  public void i_Click_On_React_Date_Picker_Close_Icon_For_Date(String field) {
		programs.iClickOnReactDatePickerCloseIconForDate(field);
	    }
	
	@And("^I search \"([^\"]*)\" and verify with search list options on \"([^\"]*)\" dropdown box$")
	  public void i_Search_With_Search_List_Options_On_Dropdown_Box(String searchParam, String org) throws Throwable {
		programs.iSearchWithSearchListOptionsOnDropdownBox(searchParam, org);
	    }
	
	@Then("^I click on cancel search button$")
	  public void i_Click_On_Cancel_Search_Button() throws Throwable {
		programs.iClickOnCancelSearchButton();
	    }
	
	@Then("^I verify the selected Hospital organization should not be displayed in the search box$")
	  public void i_Verify_The_Selected_Hospital_Organization_Should_Not_Be_Displayed_In_The_Search_Box() throws Throwable {
		programs.iVerifyTheSelectedHospitalOrganizationShouldNotBeDisplayedInTheSearchBox();
	    }
	
	@Then("^I verify the \"([^\"]*)\" message for invalid search in Organization Name dropdown box$")
	  public void i_Verify_The_Error_Message_For_Invalid_Search_In_Organization_Name_Dropdown_Box(String text) throws Throwable {
		programs.iVerifyTheErrorMessageForInvalidSearchInOrganizationNameDropdownBox(text);
	}
	
	@And("^I verify \"([^\"]*)\" attribution rules on \"([^\"]*)\" program page$")
	  public void i_Verify_Attribution_Rules_On_Create_Program_Page(String text, String act) throws Throwable {
		programs.iVerifyAttributionRulesOnCreateProgramPage(text,act);
	    }
	
	@And("^I drag and drop the attribution rules in \"([^\"]*)\" Program page$")
	  public void i_DragandDrop_the_Attribution_Rules_On_Create_Program_Page(String act) throws Throwable {
		programs.iDragandDroptheAttributionRulesOnCreateProgramPage(act);
	    }
	
	@Then("^I search \"([^\"]*)\" and verify with search list options on \"([^\"]*)\" search box$")
	  public void i_Search_And_Verify_With_Search_List_Options_On_Programs_Search_Box(String searchParam, String org) throws Throwable {
		programs.iSearchAndVerifyWithSearchListOptionsOnProgramsSearchBox(searchParam,org);
	}

	@And("^I click on date picker close icon$")
	  public void i_Click_on_Date_Picker_Close_Icon() throws Throwable {
		programs.iClickonDatePickerCloseIcon();
	    }
	
	@And("^I select Organization name \"([^\"]*)\" for Contract \"([^\"]*)\" on \"([^\"]*)\" Network Contract page$")
	  public void i_Select_Organization_Name_on_Create_Network_Contract_Page(String text, int num, String field) throws Throwable {
		programs.iSelectOrganizationNameOnCreateNetworkContractPageUnderPayorOrganization(text, num, field);
	    }
	
	@And("^I search \"([^\"]*)\" and verify with search list options on \"([^\"]*)\" dropdown box in Network Contract page$")
	  public void i_Search_With_Search_List_Options_On_Dropdown_Box_In_NetworkContract_Page(String searchParam, String org) throws Throwable {
		programs.iSearchWithSearchListOptionsOnDropdownBoxinNetworkContractpage(searchParam, org);
	    }
	
	 @And("^I click on \"([^\"]*)\" button on view profile of \"([^\"]*)\" Organization$")
	  public void i_Click_On_Button_On_Create_Organization_Page(String text, String page) throws Throwable {
		 createMO.iClickOnButtonOnCreateOrganizationPage(text);
	    }
	 
	 @And("^I verify \"([^\"]*)\" header text on \"([^\"]*)\" page$")
	  public void i_Verify_HeaderText_On_Create_Organization_Page(String text, String action) throws Throwable {
		 createMO.iVerifyHeaderTextOnCreateOrganizationPage(text);
	    }
	 
	 @And("^I verify auto incremented contract ID should be starts with \"([^\"]*)\"$")
	  public void i_Verify_Auto_Incremented_CID(String text) throws Throwable {
		 programs.iVerifyAutoIncrementedCID(text);
	    }
	 
	 @And("^I verify the sub headline of \"([^\"]*)\"$")
	  public void i_Verify_The_SubHeadline_Of_Attribution_Rules_And_ValidationRanks_On_Create_Program_Page(String text) throws Throwable {
		programs.iVerifyTheSubHeadlineOfAttributionRulesAndValidationRanksOnCreateProgramPage(text);
	    }
	 
	 @And("^I verify \"([^\"]*)\" validation ranks on \"([^\"]*)\" program page$")
	  public void i_Verify_Validation_Rankss_On_Create_Program_Page(String text, String act) throws Throwable {
		programs.iVerifyAttributionRulesOnCreateProgramPage(text,act);
	    }
	 
	 @And("^I verify the \"([^\"]*)\" checkbox$")
	  public void i_Verify_MultipleBundleEpisode_CheckBox(String text) throws Throwable {
		programs.iVerifyMultipleBundleEpisodeCheckBox(text);
	    }
}
