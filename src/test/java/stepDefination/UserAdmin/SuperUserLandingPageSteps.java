package stepDefination.UserAdmin;


import com.remedy.resources.DriverScript;
import com.remedy.userAdmin.SuperUserLandingPage;

import cucumber.api.java.en.Then;

public class SuperUserLandingPageSteps extends DriverScript {
	SuperUserLandingPage ua2LandingPage = new SuperUserLandingPage(driver);

	@Then("^I should see \"([^\"]*)\" link$")
	public void i_should_see_link(String text) throws Throwable {
		ua2LandingPage.iVerifyUsersLink(text);
	}

	@Then("^I click on \"([^\"]*)\" Button$")
	public void i_click_on_Button(String arg1) throws Throwable {
		ua2LandingPage.iClickOnAddUserButton();
	}

	@Then("^I am navigated to user creation page$")
	public void i_am_navigated_to_user_creation_page() throws Throwable {
		ua2LandingPage.iVerifyAddUserPage();
	}

	@Then("^I should see \"([^\"]*)\" Button in landing page$")
	public void i_should_see_Button_in_landing_page(String arg1) throws Throwable {
		ua2LandingPage.iverifyAddUserButton();
	}

	@Then("^I click on close icon from user creation page$")
	public void i_click_on_close_icon_from_user_creation_page() throws Throwable {
		ua2LandingPage.iClickOnCloseIconFromAddUserPage();
	}

	@Then("^I click on Last Page Icon on landing page$")
	public void clickLastPageOnLandingPage() throws Throwable {
	   ua2LandingPage.clickLastPageIconOnLandingPage();
	}
	
	@Then("^I click on First Page Icon on landing page$")
	public void clickFirstPageOnLandingPage() throws Throwable {
	   ua2LandingPage.clickFirstPageIconOnLandingPage();
	}
	
	@Then("^I verify \"([^\"]*)\" on landing page$")
	public void i_verify_on_landing_page(String text) throws Throwable {
	   ua2LandingPage.iVerifyLandingPageUI(text);
	}

	@Then("^I verify \"([^\"]*)\" value for users on landing page$")
	public void i_verify_for_all_users_on_landing_page(String arg1) throws Throwable {
	  ua2LandingPage.verifyUserInformation(arg1);
	}

	@Then("^I click on the top user link$")
	public void i_click_on_the_top_user_link() throws Throwable {
		ua2LandingPage.iClickOnTopUserDropDown();
	}

	@Then("^I select \"([^\"]*)\" option from the dropdown list$")
	public void i_select_option_from_the_dropdown_list(String text) throws Throwable {
		ua2LandingPage.iSelectOptionFromDropdown(text);
	}

	@Then("^I \"([^\"]*)\" user$")
	public void iLockUnlockUser(String action) throws Throwable {
		ua2LandingPage.iLockUnlockUser(action);
	}
	
	@Then("^I verify user is \"([^\"]*)\"$")
	public void verifyLockedUser(String action) throws Throwable {
		ua2LandingPage.verifyLockedUser(action);
	}

	@Then("^I should see an alert with \"([^\"]*)\"$")
	public void i_should_see_an_alert_with(String text) throws Throwable {
		ua2LandingPage.iVerifyTextfromUnlockPopup(text);
	}
	
	@Then("^I click on \"([^\"]*)\" button from the unlock alert$")
	public void i_click_on_button_from_the_alert(String arg1) throws Throwable {
		ua2LandingPage.iClickOnButtonFromPopup(arg1);
	}

	@Then("^I click on \"([^\"]*)\" link$")
	public void i_click_on_link(String arg1) throws Throwable {
		ua2LandingPage.iClickOnUsersLink();
	}

   @Then ("^I enter \"([^\"]*)\" in search box for \"([^\"]*)\"$")
   public void enterTextInSearchBox(String text, String userRole) throws Throwable {
	   ua2LandingPage.SearchUserWithText(text,userRole);
   }
   
   @Then ("^I verify availability of \"([^\"]*)\" for \"([^\"]*)\"$")
   public void verifySearchParameter(String searchParam, String userRole) throws Throwable {
	   ua2LandingPage.verifySearch(searchParam, userRole);
   }

	@Then("^I should see \"([^\"]*)\" as \"([^\"]*)\" in search result$")
	public void iVerifySeachedElement(String result, String searchBy) throws Throwable {
		ua2LandingPage.iVerifySearchResult(result, searchBy, "");
	}
	@Then("^I should see \"([^\"]*)\" as \"([^\"]*)\" in search result for \"([^\"]*)\"$")
	public void i_should_see_for_in_landing_page(String result, String searchBy, String role) throws Throwable {
		ua2LandingPage.iVerifySearchResult(result, searchBy, role);
	}

	@Then("^I should see User is Blocked$")
	public void verifyUserBlockedMessage() throws Throwable {
		ua2LandingPage.verifyUserBlockedMessageOnLandingPage();
	}

	@Then("^I should not see search results")
	public void i_should_see_error_message() throws Throwable {
		ua2LandingPage.iShouldNotSeeSearchResults();
	}
	@Then("^I should see cross icon to exit search$")
	public void iSeeCrossIconForSearch(){
		ua2LandingPage.iSeeCrossIconForSearch();
	}
	
	@Then("^I verify No Results Found is displayed$")
	public void VerifyNoResultFound(){
		ua2LandingPage.verifyNoResultFoundOnLandingPage();
	}
	
	@Then("^I click on cross icon$")
	public void iClickCrossIconForSearch(){
		ua2LandingPage.iClickCrossIconForSearch();
	}
	@Then("^I should see all users back in page$")
	public void iSeeUsersBackOnClosingSearch(){
		ua2LandingPage.iSeeUsersBackOnClosingSearch();
	}
	
	@Then("^I should see single user row in search result$")
	public void iVerifyRowCountForSearchByEmail(){
		ua2LandingPage.iVerifyRowCountForSearchByEmail();
	}
	
	@Then("^I select any user$")
	public void iSelectAUser(){
		ua2LandingPage.iSelectAUser();
	}
	@Then("^I verify that I am navigated to view user page$")
	public void iVerifyViewUserPage(){
		ua2LandingPage.iVerifyViewUserPage();
	}
	@Then("^I should not see text \"([^\"]*)\" on Users page$")
	public void iShouldNotSeeErrorMsgOnUsersPage(String text){
		ua2LandingPage.iShouldNotSeeErrorMsgOnUsersPage(text);
	}
	@Then("^I verify rows allignment on landing page when the count of users is not a multiple of three$")
	public void verifyRowsAlignmentWhenCountIsNotMultipleOfThree(){
		ua2LandingPage.verifyRowsAlignmentWhenCountIsNotMultipleOfThree();
	}
	
	@Then("^I verify that email is displayed in same case for \"([^\"]*)\"$")
	public void iVerifyThatEmailIsDisplayedInSameCase(String role){
		ua2LandingPage.iVerifyThatEmailIsDisplayedInSameCase(role);
	}
	
	@Then("^I verify that Product list on the top navigation bar is not opened$")
	public void iVerifyProductListInTopNavigationBarIsClosed(){
		ua2LandingPage.iVerifyProductListInTopNavigationBarIsClosed();
	}
	
	@Then("^I verify \"([^\"]*)\" on landing page for \"([^\"]*)\"$")
	public void i_Verify_Email_For_PTA_Executive_Role(String text, String Role){
		ua2LandingPage.iVerifyEmailForPTAExecutiveRole(text, Role);
	}
	@Then("^I verify availability of link \"([^\"]*)\"$")
	public void iVerifyDeleteUserLink(String text){
	ua2LandingPage.iVerifyDeleteUserLink(text);
	}

	@Then("^I click on \"([^\"]*)\" link on general information tab$")
	public void i_click_on_link_on_general_information_tab(String arg1) throws Throwable {
		ua2LandingPage.iClickOnDeleteUser(arg1);
	}
	@Then("^I verify text \"([^\"]*)\"$")
	public void iVerifyTextWhileDeletingUser(String text){
		ua2LandingPage.iVerifyTextWhileDeletingUser(text);
	}
	@Then("^I verify \"([^\"]*)\" button on deletion alert$")
	public void iVerifyCancelButtonWhileDeletingUser(String text){
		ua2LandingPage.iVerifyCancelButtonWhileDeletingUser(text);
	}
	@Then("^I click on \"([^\"]*)\" button on deletion alert$")
	public void iClickCancelButtonWhileDeletingUser(String text){
		ua2LandingPage.iClickCancelButtonWhileDeletingUser(text);
	}
	@Then("^I verify availability of \"([^\"]*)\" button on deletion alert$")
	public void iVerifyDeleteButtonWhileDeletingUser(String text){
		ua2LandingPage.iVerifyDeleteButtonWhileDeletingUser(text);
	}
	@Then("^I click on \"([^\"]*)\" button to delete user$")
	public void iClickDeleteButtonToDeleteUser(String text){
		ua2LandingPage.iClickDeleteButtonToDeleteUser(text);
	}
	
	
	@Then("^I click on \"([^\"]*)\" tile from menu$")
	public void iClickOnTileFromEC(String text){
		ua2LandingPage.iClickOnTileFromEC(text);
	}
	@Then("^I click on \"([^\"]*)\" from Management dropdown$")
	public void iSelectTileFromManagementDropDown(String text){
		ua2LandingPage.iSelectTileFromManagementDropDown(text);
	}
	@Then("^I verify page tile for reports page$")
	public void iVerifyReportsPage(){
	ua2LandingPage.iVerifyReportsPage();
	}
}


