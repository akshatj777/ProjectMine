package stepDefination.UserAdmin;

import com.remedy.resources.DriverScript;
import com.remedy.userAdmin.MailCreateUser;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;

public class MailCreateUserSteps extends DriverScript {
	MailCreateUser mailcreateuser = new MailCreateUser(driver);
	
	@Given("^I am on mail login page$") 
	public void i_Am_Mail_Login_Page() throws Throwable {
		mailcreateuser.iAmOnMailLoginPage();
	}
	
	@Then("^I enter username \"([^\"]*)\" to login mail account$") 
	public void i_Enter_UserName_To_LoginMail(String username) throws Throwable {
		mailcreateuser.iEnterUserNameToLoginMailAccount(username);
	}
	
	@Then("^I enter username \"([^\"]*)\" to login mail account for bulk delete$") 
	public void i_Enter_UserName_To_LoginMailForBulkDelete(String username) throws Throwable {
		mailcreateuser.iEnterUserNameToLoginMailAccountForBulkDelete(username);
	}
	
	@Then("^I enter username \"([^\"]*)\" to login bulk mail account$") 
	public void i_Enter_UserName_To_LoginBulkMail(String username) throws Throwable {
		mailcreateuser.iEnterUserNameToLoginBulkMailAccount(username);
	}
	
	@Then("^I enter password \"([^\"]*)\" to login mail account$") 
	public void i_Enter_Password_To_LoginMail(String password) throws Throwable {
		mailcreateuser.iEnterPasswordToLoginMailAccount(password);
	}
	
	@Then("^I click on Inbox in mail$") 
	public void i_Click_On_Inbox_In_Mail() throws Throwable {
		mailcreateuser.iClickOnInboxUnderMail();
	}
	
	@Then("^I set new password for the user \"([^\"]*)\"$") 
	public void setNewPassword(String userRole) throws Throwable {
		mailcreateuser.setNewPassword(userRole);
	}
	
	@Then("^I click on Mail icon in my account$") 
	public void i_Click_On_Mail_Icon_In_My_Account() throws Throwable {
		mailcreateuser.iClickOnMailIconOnMyAccount();
	}
	
	@Then("^I click on select all checkbox in mail$") 
	public void i_Click_On_SelectAll_Checkbox_In_Mail() throws Throwable {
		mailcreateuser.iClickOnSelectAllCheckBoxInMail();
	}
	
	@Then("^I click on delete icon in mail$") 
	public void i_Click_On_Delete_Icon_In_Mail() throws Throwable {
		mailcreateuser.iClickOnDeleteIconInMail();
	}
	
	@Then("^I signout from mail account$") 
	public void i_SignOut_From_Mail_Account() throws Throwable {
		mailcreateuser.iSignOutFromMailAccount();
	}
	
	@Given("^I enter Email \"([^\"]*)\" to Create user$") 
	public void i_Enter_Email_To_CreateUser(String email) throws Throwable {
		mailcreateuser.iEnterEmailToCreateUser(email);			
	}
	
	@Then("^I verify Account Verification in Inbox in my account$") 
	public void i_Verify_AccountVerification_Mail_In_Inbox_In_MyAccount() throws Throwable {
		mailcreateuser.iVerifyAccountVerificationMailInInboxInMyAccount();
	}
	
	@Then("^I verify account for user \"([^\"]*)\"$") 
	public void verifyAccountUA(String role) throws Throwable {
		mailcreateuser.verifyAccountUA(role);
	}
	
	@Then("^I verify accounts for all the created users$") 
	public void verifyAccount() throws Throwable {
		mailcreateuser.verifyAccountForAllCreatedUsers();
	}
	
	@Then("^I verify the unread mail in inbox in my account$")
	public void i_Verify_The_Unread_Mail_In_Inbox_In_My_Account() throws Throwable{
		mailcreateuser.i_Verify_The_Unread_Mail_In_Inbox_In_My_Account();
	}
	
	@Then("^I verify Change Password mail in Inbox in my account$") 
	public void i_Verify_ChangePassword_Mail_In_Inbox_In_MyAccount() throws Throwable {
		mailcreateuser.iVerifyChangePasswordMailinInboxInMyAccount();
	}
	
	@Then("^I click on Account Verification mail in Inbox$") 
	public void i_Click_On_AccountVerification_Mail_In_Inbox() throws Throwable {
		mailcreateuser.iClickOnAccountVerificationMailInInboxInMyAccount();
	}
	
	@Then("^I verify \"([^\"]*)\" link in mail content$") 
	public void i_Verify_Link_In_Mail_Content(String link) throws Throwable {
		mailcreateuser.iVerifyLinkInMailContentInInboxInMyAccount(link);
	}
	
	@Then("^I click on \"([^\"]*)\" link in mail content$") 
	public void i_Click_On_Link_In_Mail_Content(String link) throws Throwable {
		mailcreateuser.iClickOnLinkInMailContentInInboxInMyAccount(link);
	}
	
	
	
	@Then("^I enter email to generate password link$") 
	public void i_Enter_Email_To_GeneratePassword_Link() throws Throwable {
		mailcreateuser.iEnterEmailToGeneratePasswordLink();
	}
	
	@Then("^I enter email \"([^\"]*)\" to generate password link for bulk users$") 
	public void i_Enter_Email_To_GeneratePassword_Link_ForBulkUsers(String bulkUserEmail) throws Throwable {
		mailcreateuser.iEnterEmailToGeneratePasswordLinkForBulkUsers(bulkUserEmail);
	}
	
	@And("^I click on send mail button$") 
	public void i_Click_On_Send_Mail_Button() throws Throwable {
		mailcreateuser.iClickOnSendEmailButton();
	}
	
	@Then("^I click on Change Password mail in Inbox$") 
	public void i_Click_On_ChangePassword_Mail_In_Inbox() throws Throwable {
		mailcreateuser.iClickOnChangePasswordMailInInboxInMyAccount();
	}
	
	@And("^I enter new password \"([^\"]*)\" to set new password$")
	public void i_Enter_New_Password_To_Set_New_Password(String text) throws Throwable {
		mailcreateuser.iEnterNewPasswordToSetNewPassword(text);
	}
	
	@And("^I enter confirm new password \"([^\"]*)\" to set new password$")
	public void i_Enter_Confirm_New_Password_To_Set_New_Password(String text) throws Throwable {
		mailcreateuser.iEnterConfirmNewPasswordToSetNewPassword(text);
	}
	
	@And("^I click on submit button to set new password$") 
	public void i_Click_On_Submit_Button_To_Set_New_Password() throws Throwable {
		mailcreateuser.iClickOnSendEmailButton();
	}
	
    @Then("^I enter newuser email for \"([^\"]*)\" login to Remedy$") 
		public void i_Enter_NewUser_EMail_For_Login_To_Remedy(String email) throws Throwable {
			mailcreateuser.iEnterNewUserEmailForLoginToRemedy(email);
	}   
	
    @Then("^I enter newuser password for login to Remedy$") 
		public void i_Enter_NewUser_Password_For_Login_To_Remedy() throws Throwable {
			mailcreateuser.iEnterNewPasswordForLoginToRemedy();
	}     
	
    @Then("^I clear the browser history$") 
	public void i_Open_NewTab_And_Close_The_Last_Tab() throws Throwable {
		mailcreateuser.iOpenNewTabAndCloseLastTab();
}
}