package stepDefination.UserAdmin;

import com.remedy.resources.DriverScript;
import com.remedy.userAdmin.UserAdminEdit;
import com.remedy.userAdmin.UserAdminSorting;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

public class UserAdminEditSteps extends DriverScript {
	UserAdminEdit UserEdit = new UserAdminEdit(driver);
	
	@Then("^I enter search box with ([^\"]*)$")
	public void i_Enter_Search_Box_With(String search) throws Throwable{
		UserEdit.i_Enter_Search_Box_With(search);
	}
	
	@And("^I click on the username card under user admin page$")
	public void i_Click_On_The_Username_Card_Under_User_Admin_Page() throws Throwable{
		UserEdit.iClickOnTheUsernameCardUnderUserAdminPage();
	}
	
	@And("^I verify the user details page for editing$")
	public void i_Verify_The_User_Details_Page_For_Editing() throws Throwable{
		UserEdit.iVerifyTheUserDetailsPageForEditing();
	}
	
	@And("^I verify the user ([^\"]*) address$")
	public void i_Verify_The_User_Email_Address(String email) throws Throwable{
		UserEdit.i_Verify_The_User_Email_Address(email);
	}
	
	@Then("^I clicked on Edit button under user Role row$")
	public void i_Clicked_On_Edit_Button_Under_User_Role_Row() throws Throwable{
		UserEdit.iClickedOnEditButtonUnderUserRoleRow();
	}
	
	@And("^I clicked on role tab to edit the user role assigned$")
	public void i_Clicked_On_Role_Tab_To_Edit_The_User_Role_Assigned() throws Throwable{
		UserEdit.i_Clicked_On_Role_Tab_To_Edit_The_User_Role_Assigned();
	}
	
	@And("^I should see dropdown list to select role$")
	public void i_Should_See_Dropdown_List_To_Select_Role() throws Throwable{
		UserEdit.i_Should_See_Dropdown_List_To_Select_Role();
	}
	
	@Then("^I clicked ([^\"]*) under edit user role tab again$")
	public void i_Clicked_Under_Edit_User_Role_Tab(String role) throws Throwable{
		UserEdit.i_Clicked_Under_Edit_User_Role_Tab(role);
	}
	
	@Then("^I clicked on Save button under edit user role tab$")
	public void i_Clicked_On_Save_Button_Under_Edit_User_Role_Tab() throws Throwable{
		UserEdit.i_Clicked_On_Save_Button_Under_Edit_User_Role_Tab();
	}
	
	@And("^I verify the user role again$")
	public void i_Verify_The_User_Role_Again() throws Throwable{
		UserEdit.i_Verify_The_User_Role_Again();
	}
	
	@Then("^I verify product tiles appear for user under user edit details page$")
	public void i_Verify_Product_Tiles_Appear_For_User_Under_User_Edit_Details_Page() throws Throwable{
		UserEdit.i_Verify_Product_Tiles_Appear_For_User_Under_User_Edit_Details_Page();
	}
	
	@Then("^I verify product tiles appear for user under user edit details page after role change$")
	public void i_Verify_Product_Tiles_Appear_For_User_Under_User_Edit_Details_Page_After_Role_Change() throws Throwable{
		UserEdit.i_Verify_Product_Tiles_Appear_For_User_Under_User_Edit_Details_Page_After_Role_Change();
	}
	
	@Then("^I clicked on Edit button under user Phone row$")
	public void i_Clicked_On_Edit_Button_Under_User_Phone_Row() throws Throwable{
		UserEdit.i_Clicked_On_Edit_Button_Under_User_Phone_Row();
	}
	
	@And("^I clicked on Phone tab to edit the user Phone number$")
	public void i_Clicked_On_Phone_Tab_To_Edit_The_User_Phone_number() throws Throwable{
		UserEdit.i_Clicked_On_Phone_Tab_To_Edit_The_User_Phone_number();
	}
	
	@And("^I cleared the textbox field under edit user phone tab$")
	public void i_Cleared_The_Textbox_Field_Under_Edit_User_Phone_Tab() throws Throwable{
		UserEdit.i_Cleared_The_Textbox_Field_Under_Edit_User_Phone_Tab();
	}
	
	@And("^I enter valid phone number \"([^\"]*)\"$")
	public void i_Enter_Valid_Phone_Number(String Text) throws Throwable{
		UserEdit.i_Enter_Valid_Phone_Number(Text);
	}
	
	@Then("^I clicked on Save button under edit user Phone tab$")
	public void i_Clicked_On_Save_Button_Under_Edit_User_Phone_Tab() throws Throwable{
		UserEdit.i_Clicked_On_Save_Button_Under_Edit_User_Phone_Tab();
	}
	
	@Then("^I verify the Permissions field$")
	public void i_Verify_The_Permissions_Field() throws Throwable{
		UserEdit.i_Verify_The_Permissions_Field();
	}
	
	@Then("^I clicked on Edit button under permissions data field$")
	public void i_Clicked_On_Edit_Button_Under_Permissions_Data_Field() throws Throwable{
		UserEdit.i_Clicked_On_Edit_Button_Under_Permissions_Data_Field();
	}
	
	@Then("^I clicked on Payer field to edit the payer$")
	public void i_Clicked_On_Payer_Field_To_Edit_The_Payer() throws Throwable{
		UserEdit.i_Clicked_On_Payer_Field_To_Edit_The_Payer();
	}
	
	@Then("^I enter text \"([^\"]*)\" under payer field$")
	public void i_Enter_Text_Under_Payer_Field(String Text) throws Throwable{
		UserEdit.i_Enter_Text_Under_Payer_Field(Text);
	 }
	
	@Then("^I clicked on search field under Health system Name$")
	public void i_Clicked_On_Search_Field_Under_Health_System_Name() throws Throwable{
		UserEdit.i_Clicked_On_Search_Field_Under_Health_System_Name();
	}
	
	@Then("^I enter \"([^\"]*)\" on search field under Health system Name$")
	public void i_Enter_On_Search_Field_Under_Health_System_Name(String Text) throws Throwable{
		UserEdit.i_Enter_On_Search_Field_Under_Health_System_Name(Text);
	}
	
	@Then("^I clicked on RP Payer Test A from dropdown list of Health system Name$")
	public void i_Clicked_On_RP_Payer_Test_A_From_Dropdown_List_Of_Health_System_Name() throws Throwable{
		UserEdit.i_Clicked_On_RP_Payer_Test_A_From_Dropdown_List_Of_Health_System_Name();
	}
	
	@Then("^I clicked on Mountainside Hospital from dropdown list of Health system Name$")
	public void i_Clicked_On_Mountainside_Hospital_From_Dropdown_List_Of_Health_System_Name() throws Throwable{
		UserEdit.i_Clicked_On_Mountainside_Hospital_From_Dropdown_List_Of_Health_System_Name();
	}
	
	@Then("^I clicked on search field under Provider Name$")
	public void i_Clicked_On_Search_Field_Under_Provider_Name() throws Throwable{
		UserEdit.i_Clicked_On_Search_Field_Under_Provider_Name();
	}
	
	@Then("^I enter \"([^\"]*)\" on search field under Provider Name$")
	public void i_Enter_On_Search_Field_Under_Provider_Name(String Text) throws Throwable{
		UserEdit.i_Enter_On_Search_Field_Under_Provider_Name(Text);
	}
	
	@Then("^I clicked on select all facilities under Provider Name$")
	public void i_Clicked_On_Select_All_Facilities_Under_Provider_Name() throws Throwable{
		UserEdit.i_Clicked_On_Select_All_Facilities_Under_Provider_Name();
	}
	
	@Then("^I clicked on save button under permissions data field$")
	public void i_Clicked_On_Save_Button_Under_Permissions_Data_Field() throws Throwable{
		UserEdit.i_Clicked_On_Save_Button_Under_Permissions_Data_Field();
	}
	
	@Then("^I verify the text under permissions data section$")
	public void i_Verify_The_Text_Under_Permissions_Data_Section() throws Throwable{
		UserEdit.i_Verify_The_Text_Under_Permissions_Data_Section();
	}
	
	@Then("^I clicked on Stamford Hospital from dropdown list of Health system Name$")
	public void i_Clicked_On_Stamford_Hospital_From_Dropdown_List_Of_Health_System_Name() throws Throwable{
		UserEdit.i_Clicked_On_Stamford_Hospital_From_Dropdown_List_Of_Health_System_Name();
	}
	
	@And("^I clicked on remove button of stamford hospital row under permission field$")
	public void i_Clicked_On_Remove_Button_Of_Stamford_Hospital_Row_Under_Permission_Field() throws Throwable{
		UserEdit.i_Clicked_On_Remove_Button_Of_Stamford_Hospital_Row_Under_Permission_Field();
	}
	
	@And("^I wait for popup to remove stamford hospital under permission field$")
	public void i_Wait_For_Popup_To_Remove_Stamford_Hospital_Under_Permission_Field() throws Throwable{
		UserEdit.i_Wait_For_Popup_To_Remove_Stamford_Hospital_Under_Permission_Field();
	}
	
	@And("^I wait for popup to remove Mountainside Hospital under permission field$")
	public void i_Wait_For_Popup_To_Remove_Mountainside_Hospital_Under_Permission_Field() throws Throwable{
		UserEdit.i_Wait_For_Popup_To_Remove_Mountainside_Hospital_Under_Permission_Field();
	}
	
	@And("^I clicked on remove button appearing on popup$")
	public void i_Clicked_On_Remove_Button_Appearing_On_Popup() throws Throwable{
		UserEdit.i_Clicked_On_Remove_Button_Appearing_On_Popup();
	}
	
	@And("^I clicked on remove button appearing on popup for Mountainside Hospital$")
	public void i_Clicked_On_Remove_Button_Appearing_On_Popup_For_Mountainside_Hospital() throws Throwable{
		UserEdit.i_Clicked_On_Remove_Button_Appearing_On_Popup_For_Mountainside_Hospital();
	}
	
	@Then("^I clicked ([^\"]*) under edit user role tab to edit the role$")
	public void iClickedUnderEditUserRoleTabToEditTheRole(String role) throws Throwable{
		UserEdit.iClickedUnderEditUserRoleTabToEditTheRole(role);
	}
	
	@Then("^I clicked on Save button under edit user role tab after editing$")
	public void iClickedOnSaveButtonUnderEditUserRoleTabAfterEditing() throws Throwable{
		UserEdit.iClickedOnSaveButtonUnderEditUserRoleTabAfterEditing();
	}
	
	@Then("^I clicked on Emblem Health from dropdown list of payer$")
	public void iClickedOnEmblemHealthFromDropdownListOfPayer() throws Throwable{
		UserEdit.iClickedOnEmblemHealthFromDropdownListOfPayer();
	}
	
	@Then("^I clicked on Medicare from dropdown list of payer$")
	public void iClickedOnMedicareFromDropdownListOfPayer() throws Throwable{
		UserEdit.iClickedOnMedicareFromDropdownListOfPayer();
	}
	
	@And("^I clicked on remove button of RP Payer Test A row under permission field$")
	public void iClickedOnRemoveButtonOfRPPayerTestARowUnderPermissionField() throws Throwable{
		UserEdit.iClickedOnRemoveButtonOfRPPayerTestARowUnderPermissionField();
	}
	
	@And("^I clicked on remove button of Mountainside Hospital row under permission field$")
	public void iClickedOnRemoveButtonOfMountainsideHospitalRowUnderPermissionField() throws Throwable{
		UserEdit.iClickedOnRemoveButtonOfMountainsideHospitalRowUnderPermissionField();
	}
	
	@And("^I wait for popup to remove RP Payer Test A under permission field$")
	public void iWaitForPopupToRemoveRPPayerTestAUnderPermissionField() throws Throwable{
		UserEdit.iWaitForPopupToRemoveRPPayerTestAUnderPermissionField();
	}
	
	@And("^I clicked on remove button appearing on popup for RP Payer Test A$")
	public void iClickedOnRemoveButtonAppearingOnPopupForRPPayerTestA() throws Throwable{
		UserEdit.iClickedOnRemoveButtonAppearingOnPopupForRPPayerTestA();
	}
}