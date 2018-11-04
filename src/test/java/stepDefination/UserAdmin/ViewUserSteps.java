package stepDefination.UserAdmin;

import com.remedy.resources.DriverScript;
import com.remedy.userAdmin.ViewUserPage;

import cucumber.api.java.en.Then;

public class ViewUserSteps extends DriverScript{
	
	ViewUserPage objViewUserPage = new ViewUserPage(driver);

	@Then("^I search for user with role \"([^\"]*)\"$")
	public void i_search_for_user_with_role(String userRole) throws Throwable {
		objViewUserPage.searchForUserRole(userRole);
	}

	@Then("^I search for bulk user with role \"([^\"]*)\"$")
	public void i_search_for_bulk_user_with_role(String userRole) throws Throwable {
		objViewUserPage.searchForBulkUserRole(userRole);
	}
	
	@Then("^I select user with role \"([^\"]*)\"$")
	public void i_select_user_with_role(String userRole) throws Throwable {
		objViewUserPage.selectUserRole(userRole);
	}

	@Then("^I verify that I am navigated to user page$")
	public void i_verify_that_I_am_navigated_to_user_page() throws Throwable {
		objViewUserPage.verifyNavigationToViewUserPage();
	}

	@Then("^I verify Edit Icon$")
	public void i_verify_EditIcon() throws Throwable {
		objViewUserPage.verifyEditIcon();
	}
	
	@Then("^I click on Edit Icon$")
	public void clickEditIcon() throws Throwable {
		objViewUserPage.clickEditIcon();
	}
	
	@Then("^I verify Delete User button$")
	public void verifyDeleteUserButton() throws Throwable {
		objViewUserPage.verifyDeleteUserButton();
	}
	
	@Then("^I click on cross button on Edit User Page$")
	public void clickCrossButton() throws Throwable {
		objViewUserPage.clickCrossButton();
	}
	
	@Then("^I verify All Users button$")
	public void verifyAllUsersButton() throws Throwable {
		objViewUserPage.verifyAllUsersButton();
	}
	
	@Then("^I click on All Users button$")
	public void clickAllUsersButton() throws Throwable {
		objViewUserPage.clickAllUserButton();
	}
	
	@Then("^I verify Lock/Unlock Icon$")
	public void i_verify_LockUnlockIcon() throws Throwable {
		objViewUserPage.verifyLockUnlockIcon();
	}
	
	@Then("^I verify first name \"([^\"]*)\"$")
	public void i_verify_First_Name(String field) throws Throwable {
		objViewUserPage.verifyFirstName(field);
	}
	
	@Then("^I verify last name \"([^\"]*)\"$")
	public void i_verify_Last_Name(String field) throws Throwable {
		objViewUserPage.verifyLastName(field);
	}
	
	@Then("^I verify role \"([^\"]*)\"$")
	public void i_verify_Role(String field) throws Throwable {
		objViewUserPage.verifyRole(field);
	}
	
	@Then("^I verify email \"([^\"]*)\" for \"([^\"]*)\"$")
	public void i_verify_Email(String email, String userRole) throws Throwable {
		objViewUserPage.verifyEmail(email, userRole);
	}
	
	@Then("^I verify last login date for \"([^\"]*)\"$")
	public void verifyLastLoginDate(String role) throws Throwable {
		objViewUserPage.verifyLastLoginDate(role);
	}
	
	@Then("^I verify bulk email for \"([^\"]*)\"$")
	public void i_verify_Bulk_Email(String userRole) throws Throwable {
		objViewUserPage.verifyBulkEmail(userRole);
	}
	@Then("^I verify bulk NPI \"([^\"]*)\"$")
public void verifyBulkNPI(String field) throws Throwable {
	objViewUserPage.verifyBulkNPI(field);
}
	@Then("^I verify phone \"([^\"]*)\"$")
	public void i_verify_Phone(String field) throws Throwable {
		objViewUserPage.verifyPhone(field);
	}
	
	@Then("^I verify NPI \"([^\"]*)\"$")
	public void i_verify_NPI(String field) throws Throwable {
		objViewUserPage.verifyRole(field);
	}
	
	@Then("^I verify health system \"([^\"]*)\"$")
	public void i_verify_HealthSystem(String field) throws Throwable {
		objViewUserPage.verifyHealthSystem(field);
	}
	
	@Then("^I verify programs \"([^\"]*)\"$")
	public void i_verify_Programs(String field) throws Throwable {
		objViewUserPage.verifyPrograms(field);
	}
	
	@Then("^I verify location \"([^\"]*)\"$")
	public void i_verify_HealthSystemLocation(String locations) throws Throwable {
		objViewUserPage.verifyHealthSystemLocation(locations);
	}
	@Then("^I verify location \"([^\"]*)\" is not present on view page$")
	public void i_verify_HealthSystemLocationNotPresent(String locations) throws Throwable {
		objViewUserPage.i_verify_HealthSystemLocationNotPresent(locations);
	}
	@Then("^I verify enabled \"([^\"]*)\"$")
	public void i_verify_enabled(String applicationsEnabled) throws Throwable {
		objViewUserPage.verifyEnabledApplications(applicationsEnabled);
	}
	
	@Then("^I verify \"([^\"]*)\" not visible on view user page$")
	public void verifyAppsNotPresentOnViewUserPage(String applicationsNotVisible) throws Throwable {
		objViewUserPage.verifyAppsNotVisibleOnViewUserPage(applicationsNotVisible);
	}
	
	@Then("^I verify learning pathway \"([^\"]*)\"$")
	public void verifyLearningPathway(String learningPathway) throws Throwable {
		objViewUserPage.verifyLearningPathway(learningPathway);
	}

	@Then("^I verify disabled \"([^\"]*)\"$")
	public void i_verify_disabled(String applicationsDisabled) throws Throwable {
		objViewUserPage.verifyDisabledApplications(applicationsDisabled);
	}
	@Then("^I refresh the view user page$")
	public void iRefreshViewUserPage() {
		objViewUserPage.iRefreshViewUserPage();
	}

	@Then("^I verify Program \"([^\"]*)\" is not present in view user page$")
	public void iVerifyRemovedProgramInViewPage(String programs){
		objViewUserPage.iVerifyRemovedProgramInViewPage(programs);
	}

	@Then("^I click on \"([^\"]*)\" icon on view user page$")
	public void iClickOnLockUnlockIcon(String text){
		objViewUserPage.iClickOnLockUnlockIcon(text);
	}
	@Then("^I verify that user is \"([^\"]*)\" on view user page$")
	public void iVerifyLockedAndUnlockedUsers(String text){
		objViewUserPage.iVerifyLockedAndUnlockedUsers(text);
	}


}