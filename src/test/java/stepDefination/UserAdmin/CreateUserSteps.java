package stepDefination.UserAdmin;

import com.remedy.resources.DriverScript;
import com.remedy.userAdmin.CreateUserPage;
import com.remedy.userAdmin.LandingPage;
import com.remedy.userAdmin.LoginPage;
import com.remedy.userAdmin.UserAdminHomePage;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

/**
 * Created by salam on 7/29/15.
 */
public class CreateUserSteps extends DriverScript {
	LoginPage loginPage = new LoginPage(driver);
	LandingPage landingPage = new LandingPage(driver);
	UserAdminHomePage userAdminPage = new UserAdminHomePage(driver);
	CreateUserPage createUser = new CreateUserPage(driver);

	@When("^I log in as super user$")
	public void ILoginWith() throws Throwable {
		loginPage.iLoginAsSupperUser(Config.getProperty("SuperUserEmail"), "Testing1");
	}

	@And("^I click on the \"([^\"]*)\" tile$")
	public void IClickOnApplicatioTile(String tile) throws Throwable {
		landingPage.iClickOnApplicateTile("//div[text()='"+tile+"']");
	}

	@Then("^I click on Add User button$")
	public void IClickCreateUserButton() throws Throwable {
		userAdminPage.clickCreateUserButton();
	}

	@Then("^I pick a Organizational ([^\"]*)$")
	public void IPickOrganizationalRole(String role) throws Throwable {
		createUser.selectOrganizationalRole(role);
	}

	@And("^I enter NPI field with \"([^\"]*)\" for role \"([^\"]*)\"$")
	public void IEnterNPIFieldWith_(String npi, String role) throws Throwable {
		createUser.iEnterNPI(npi,role);
	}

	@And("^I fill in First Name with \"([^\"]*)\"$")
	public void IFillFirstNameWith(String firstName) throws Throwable {
		createUser.iEnterFirstName(firstName);
	}

	@Then("^I fill in Last Name with ([^\"]*)$")
	public void iFillInLastName(String lastName) throws Throwable {
		createUser.iEnterLasttName(lastName);
	}

	@Then("^I Generate Email for ([^\"]*)$")
	public void iGenerateEmail(String email) throws Throwable {
		createUser.iGenerateEmail(email);
	}

	@Then("^I enter Email for ([^\"]*)$")
	public void iEnterEmail(String email) {
		createUser.iEnterEmail(email);
	}

	@Then("^I enter Phone field with ([^\"]*)$")
	public void iEnterPhone(String phone) throws Throwable {
		createUser.iEnterPhone(phone);
	}

	@And("^I enter email ([^\"]*) for login after password mail verification$")
	public void iEnterEmailForLoginAfterPasswordMailVerification(String email) throws Throwable {
		createUser.iEnterEmailForLoginAfterPasswordMailVerification(email);
	}

	@And("^I enter password field ([^\"]*) for Login after password verification$")
	public void iEnterPasswordFieldForLoginAfterPasswordVerification(String Password) throws Throwable {
		createUser.iEnterPasswordFieldForLoginAfterPasswordVerification(Password);
	}

	@When("^I enter the email ([^\"]*) to generate password$")
	public void iEnterTheEmailToGeneratePassword(String email) throws Throwable {
		createUser.iEnterTheEmailToGeneratePassword(email);
	}

	@Then("^I click on send email button$")
	public void iClickOnSendEmailButton() throws Throwable {
		createUser.iClickOnSendEmailButton();
	}

	@And("^I click on the email received to change your password$")
	public void iClickOnTheEmailReceivedToChangeYourPassword() throws Throwable {
		createUser.iClickOnTheEmailReceivedToChangeYourPassword();
	}

	@Then("^I click on change my password link$")
	public void iClickOnChangeMyPasswordLink() throws Throwable {
		createUser.iClickOnChangeMyPasswordLink();
	}

	@And("^I switch to frame under received mail content$")
	public void iSwitchToFrameUnderReceivedMailContent() throws Throwable {
		createUser.iSwitchToFrameUnderReceivedMailContent();
	}

	@Then("^I click on change my password link under recieved mail content$")
	public void iClickOnChangeMyPasswordLinkUnderRecievedMailContent() throws Throwable {
		createUser.iClickOnChangeMyPasswordLinkUnderRecievedMailContent();
	}

	@Then("^I pick payer type from data section ([^\"]*)$")
	public void IPickPayertypeFromDataSection(String payer) throws Throwable {
		createUser.selectPayerFromData(payer);
	}

	@Then("^I verify the first payer field added under permissions section$")
	public void iVerifyTheFirstPayerFieldAddedUnderPermissionsSection() throws Throwable {
		createUser.iVerifyTheFirstPayerFieldAddedUnderPermissionsSection();
	}

	@Then("^I verify the second payer field added under permissions section$")
	public void iVerifyTheSecondPayerFieldAddedUnderPermissionsSection() throws Throwable {
		createUser.iVerifyTheSecondPayerFieldAddedUnderPermissionsSection();
	}

	@Then("^I select a ([^\"]*)$")
	public void iSelectHealthSystem(String healthSystem) throws Throwable {
		createUser.iSelectHealthSystem(healthSystem);
	}

	@Then("^I should see different tiles for different user role ([^\"]*)$")
	public void iShouldSeeDifferentTilesForDifferentUserRole(String role) throws Throwable {
		createUser.iShouldSeeDifferentTilesForDifferentUserRole(role);
	}

	@And("^I click on Episodes tile under specific user login page ([^\"]*)$")
	public void iClickOnEpisodesTileUnderSpecificUserLoginPage(String tile) throws Throwable {
		createUser.iClickOnEpisodesTileUnderSpecificUserLoginPage(tile);
	}

	@And("^I click on EC two tile under specific user login page ([^\"]*) for ([^\"]*)$")
	public void iClickOnECTwoTileUnderSpecificUserLoginPage(String text, String role) throws Throwable {
		createUser.iClickOnECTwoTileUnderSpecificUserLoginPage(text, role);
	}

	@And("^I verify the dropdown list for user$")
	public void iVerifyTheDropdownListForUser() throws Throwable {
		createUser.iVerifyTheDropdownListForUser();
	}

	@Then("^I click on Create button$")
	public void iClickCreateButton() throws Throwable {
		createUser.iClickCreateButton();
	}

	@And("^I search for health system with ([^\"]*)$")
	public void ISearchHealthSystem(String text) throws Throwable {
		createUser.iEnterHealthSystemSerachText(text);
	}

	@When("^I click the Organizational Role Field$")
	public void IClickOrganizationalRoleField() throws Throwable {
		createUser.iClickOrganizationalField();
	}

	@When("^I click the already selected Organizational Role Field$")
	public void IClickAlreadySelectedOrganizationalRoleField() throws Throwable {
		createUser.iClickAlreadySelectedOrganizationalField();
	}
	
	@When("^I click the payer Field under data$")
	public void IClickPayerFieldUnderData() throws Throwable {
		createUser.iClickPayerField();
	}

	@And("^I click on Health System field$")
	public void IClickHealthSystemField() throws Throwable {
		createUser.iClickHealthSystemField();
	}

	@Then("^I verify First Name Required Message \"([^\"]*)\"$")
	public void IVerifyFirstNameRequiredMessage(String message) throws Throwable {
		createUser.iVerifyFirstNameRequiredText(message);
	}

	@And("^I verify Last Name Required Message \"([^\"]*)\"$")
	public void IVerifyNameRequiredMessage(String message) throws Throwable {
		createUser.iVerifyLastNameRequiredText(message);
	}

	@And("^I verify email required message \"([^\"]*)\"$")
	public void IVerifyEemailRequiredMessage(String message) throws Throwable {
		createUser.iVerifyEmailRequiredText(message);
	}

	@And("^I click Try Again Button$")
	public void IClickTryAgainButton() throws Throwable {
		createUser.iClickTryAgainButton();
	}

	@And("^Verify Phone validation message \"([^\"]*)\"$")
	public void VerifyPhoneValidationMessage(String message) throws Throwable {
		createUser.iVerifyPhoneValidationMessageText(message);
	}

	@And("^I fill in Last Name with text \"([^\"]*)\"$")
	public void IFillLastNameWithText(String lastName) throws Throwable {
		createUser.iEnterLasttName(lastName);
	}

	@Then("^I verify Organizational Role Required Message \"([^\"]*)\"$")
	public void IVerifyOrganizationalRoleRequiredMessage(String text) throws Throwable {
		createUser.iVerifyOrganizationalRoleRequiredMessageText(text);
	}

	@Then("^I should see \"([^\"]*)\" on the user creation page$")
	public void iShouldSeeOnTheUserCreationPage(String header) throws Throwable {
		createUser.iverifyCreateUserPageHeader(header);
	}

	@When("^I enter ([^\"]*) search text$")
	public void iEnterHealthSystemSearchText(String provider) throws Throwable {
		createUser.iEnterProviderSerachText(provider);
	}

	@Then("^I click the select all Facilites checkbox for the provider$")
	public void iSelectAndFacilitesForTheHealthSystem() throws Throwable {
		createUser.iCheckAllProviderForTheHealthSystem();
	}

	@Then("^I select the facility ([^\"]*) checkbox for the ([^\"]*)$")
	public void iSelectTheFacilityForTheHealthSystem(String facility, String provider) throws Throwable {
		createUser.iCheckTheProviderForTheHealthSystem(facility, provider);
	}

	@Then("^I select all the application for the role$")
	public void iSelectAllTheApplicationForTheRole() throws Throwable {
		createUser.iclickAllAppsfortheRole();
	}

	@Then("^I unselect \"([^\"]*)\" product$")
	@And("^I select \"([^\"]*)\" product$")
	public void iSelectTileForTheRole(String appList) throws Throwable {
		createUser.iSelectTileForTheRole(appList);
	}
	
	@Then("^I verify \"([^\"]*)\" is not visible on Applications tab$")
	public void verifyProductNotPresentOnApplicationsTab(String products) throws Throwable {
		createUser.verifyProductNotPresentOnAppTab(products);
	}

	@And("^I turn off the share file application$")
	public void iTurnOffTheShareFileApplication() throws Throwable {
		createUser.iTurnOffShareFile();
	}

//	@And("^I fill in NPI Field with \"([^\"]*)\"$")
//	public void iFillInNPIFieldWith(String text) throws Throwable {
//		createUser.iEnterNPI(text);
//	}

	@Then("^I verify NPI Required Message \"([^\"]*)\"$")
	public void iVerifyNPIRequiredMessage(String text) throws Throwable {
		createUser.iVerifyNPIValidationMessageText(text);
	}

	@And("^I click on continue to dashboard$")
	public void iClickOnContinueToDashboard() throws Throwable {
		createUser.iClickOnContinueToDashboardMessage();
	}

	@And("^I verify the header after clicking the episodes tile$")
	public void iVerifyTheHeaderAfterClickingTheEpisodesTile() throws Throwable {
		createUser.iVerifyTheHeaderAfterClickingTheEpisodesTile();
	}

	@And("^I click on Episodes 2 tile for \"([^\"]*)\" user$")
	public void iClickOnEpisodesTwoTileUnderSpecificUserLoginPage(String role) throws Throwable {
		createUser.iClickOnEpisodesTwoTileUnderSpecificUserLoginPage(role);
	}
	
	@And("^I verify \"([^\"]*)\" user navigated to Episodes 2 homepage$")
	public void iVerifyUserNavigatedToEpisodes2(String role) throws Throwable {
		createUser.iVerifyNavigationOnEpisodes2HomePage(role);
	}
	
	@And("^I verify patient card appearing on Episode 2 for \"([^\"]*)\" user$")
	public void iVerifyPatientCardOnEpisodes2(String role) throws Throwable {
		createUser.iVerifyPatientCardOnEpisodes2HomePage(role);
	}

	@And("^I Verify the header after clicking the episodes 2 tile$")
	public void iVerifyTheHeaderAfterClickingTheEpisodes2Tile() throws Throwable {
		createUser.iVerifyTheHeaderAfterClickingTheEpisodes2Tile();
	}

	@And("^I turn off the lessons tile application$")
	public void iTurnOffTheLessonsTileApplication() throws Throwable {
		createUser.iTurnOffTheLessonsTileApplication();
	}

	@And("^I click on Episode1 tile for \"([^\"]*)\" user$")
	public void iClickOnEpisode1TileUnderSpecificUserLoginPage(String role) throws Throwable {
		createUser.iClickOnEpisode1TileUnderSpecificUserLoginPage(role);
	}
	
	@And("^I click on Gainsharing Physician Survey tile for \"([^\"]*)\" user$")
	public void iClickOnPhysicianTileUnderSpecificUserLoginPage(String role) throws Throwable {
		createUser.iClickOnPhysicianTileUnderSpecificUserLoginPage(role);
	}
	
	@And("^I verify \"([^\"]*)\" user navigated to Gainsharing Physician Survey homepage$")
	public void iVerifyUserNavigatedToPhysician(String role) throws Throwable {
		createUser.iVerifyNavigationOnPhysicianHomePage(role);
	}
	
	@And("^I click on User Admin tile for \"([^\"]*)\" user$")
	public void iClickOnUSerAdminTileUnderSpecificUserLoginPage(String role) throws Throwable {
		createUser.iClickOnUserAdminTileUnderSpecificUserLoginPage(role);
	}
	
	@And("^I verify \"([^\"]*)\" user navigated to User Admin homepage$")
	public void iVerifyUserNavigatedToUserAdmin(String role) throws Throwable {
		createUser.iVerifyNavigationOnUserAdminHomePage(role);
	}
	
	@And("^I verify \"([^\"]*)\" after redirection to EC1 for \"([^\"]*)\" user$")
	public void veifyDashboardOnEC1(String text, String role) throws Throwable {
		createUser.verifyDashboardOnEC1(role);
	}
	
	@And("^I click on username icon on right top corner \"([^\"]*)\" and open user profile on EC1$")
	public void iClickOnUserNameIconOnEC1AndOpenUserProfile(String role) throws Throwable {
		createUser.iClickOnUserNameIconOnEC1AndOpenUserProfile(role);
	}
	
	@And("^I click on PatientList on SideMenu bar Episode1 for \"([^\"]*)\" user$")
	public void iClickOnPatinetListOnSideMenuBarOnEpisode1(String role) throws Throwable {
		createUser.iClickOnPatientListOnSideMenuBarInEC1(role);
	}
	
	@And("^I verify Patient card appearing on Active Patients page for \"([^\"]*)\" user$")
	public void iVerifyPatientCardAppearingOnActivePatientPage(String role) throws Throwable {
		createUser.iVerifyPatientCardOnActivePatientPage(role);
	}
	
	@And("^I verify NPI on ECI for \"([^\"]*)\" user$")
	public void iVerifyNPIOnEC1(String role) throws Throwable {
		createUser.iVerifyNPIOnEC1(role);
	}
	
	@And("^I verify \"([^\"]*)\" facility on user profile for \"([^\"]*)\" user$")
	public void iVerifyFacilityOnUserProfileForUser(String facility, String role) throws Throwable {
		createUser.iVerifyFacilityAppearingOnUserProfile(facility, role);
	}
	
	@And("^I verify \"([^\"]*)\" payer on user profile for \"([^\"]*)\" user$")
	public void iVerifyPayersOnUserProfileForUser(String payer, String role) throws Throwable {
		createUser.iVerifyPayerAppearingOnUserProfile(payer, role);
	}
	
	@And("^I should not see \"([^\"]*)\" payer on user profile for \"([^\"]*)\" user$")
	public void verifyEmblemNotAppearingOnUserProfileForUser(String payer, String role) throws Throwable {
		createUser.verifyEmblemNotAppearingOnUserProfile(payer, role);
	}
	
	@And("^I click on gear menu and then click on Add Note and verify user role \"([^\"]*)\" for \"([^\"]*)\" user$")
	public void iClickOnAddNoteAndVerifyUserRoleForUser(String userrole, String role) throws Throwable {
		createUser.iClickOnAddNoteAndVerifyRole(userrole, role);
	}

	@And("^I click on Institute tile for \"([^\"]*)\" user$")
	public void iClickOnInstituteTileUnderSpecificUserLoginPage(String role) throws Throwable {
		createUser.iClickOnInstituteTileUnderSpecificUserLoginPage(role);
	}
	
	@And("^I verify \"([^\"]*)\" user navigated to Institute homepage$")
	public void iVerifyUserNavigatedToInstitute(String role) throws Throwable {
		createUser.iVerifyNavigationOnInstituteHomePage(role);
	}
	
	@And("^I verify \"([^\"]*)\" on the reports main page for \"([^\"]*)\" user$")
	public void iVerifyReportOnReportMainPage(String reportName, String role) throws Throwable {
		createUser.iVerifyRepOnReportsMainPage(reportName, role);
	}

	@And("^I click on Reports tile for \"([^\"]*)\" user$")
	public void iClickOnReportsTileUnderSpecificUserLoginPage(String role) throws Throwable {
		createUser.iClickOnReportsTileUnderSpecificUserLoginPage(role);
	}
	
	@And("^I verify \"([^\"]*)\" user navigated to Reports homepage$")
	public void iVerifuUserNavigatedToReports(String role) throws Throwable {
		createUser.iVerifyNavigationOnReportsHomePage(role);
	}

	@And("^I click on RemedyU tile for \"([^\"]*)\" user$")
	public void iClickOnRemedyUTileUnderSpecificUserLoginPage(String role) throws Throwable {
		createUser.iClickOnRemedyUTileUnderSpecificUserLoginPage(role);
	}
	
	@And("^I verify \"([^\"]*)\" user navigated to RemedyU homepage$")
	public void iVerifuUserNavigatedToRemedyU(String role) throws Throwable {
		createUser.iVerifyNavigationOnRemedyUHomePage(role);
	}
	
	@And("^I verify details \"([^\"]*)\" for \"([^\"]*)\" user on RemedyU dashboard$")
	 public void i_Verify_Details_For_User_On_RemedyU_Dashboard(String details, String user){
		 createUser.iVerifyDetailsForUserOnRemedyUDashBoard(details, user);
	 }
	
	@And("^I verify learning pathway \"([^\"]*)\" appearing for \"([^\"]*)\" user on RemedyU dashboard$")
	 public void i_Verify_LearningPathWay_Appearing_For_User_On_RemedyU_Dashboard(String pathway, String user){
		 createUser.iVerifyPathWayForUserOnRemedyUDashBoard(pathway, user);
	 }

	@And("^I click on Physican connect tile for \"([^\"]*)\" user$")
	public void iClickOnPhysicanConnectTileUnderSpecificUserLoginPage(String role) throws Throwable {
		createUser.iClickOnPhysicanConnectTileUnderSpecificUserLoginPage(role);
	}

	@And("^I click on Internal Support option from dropdown under specific user login page ([^\"]*)$")
	public void iClickOnInternalSupportOptionFromDropdownUnderSpecificUserLoginPage(String text) throws Throwable {
		createUser.iClickOnInternalSupportOptionFromDropdownUnderSpecificUserLoginPage(text);
	}

	@Then("^I select Support option from the dropdown under specific user login page ([^\"]*)$")
	public void iSelectSupportOptionFromTheDropdownUnderSpecificUserLoginPage(String text) throws Throwable {
		createUser.iSelectSupportOptionFromTheDropdownUnderSpecificUserLoginPage(text);
	}

	@And("^I navigate back to specific user login page$")
	public void iNavigateBackToSpecificUserLoginPage() throws Throwable {
		createUser.iNavigateBackToSpecificUserLoginPage();
	}

	@Then("^I verify the ([^\"]*) tile for selected user role$")
	public void i_Verify_The_Internal_Support_Tile_For_The_Selected_UserRole(String tile) throws Throwable {
		createUser.iVerifyTheInternalSupportProductTileForSelectedUserRole(tile);
	}

	@Then("^I verify the userrole under ec1 dashboard page after specific user login$")
	public void iVerifyTheUserroleUnderEc1DashboardPageAfterSpecificUserLogin() throws Throwable {
		createUser.iVerifyTheUserroleUnderEc1DashboardPageAfterSpecificUserLogin();
	}

	@Then("^I verify the institute dashboard page after clicking on Institute tile under specific user login page$")
	public void iVerifyTheInstituteDashboardPageAfterClickingOnInstituteTileUnderSpecificUserLoginPage()
			throws Throwable {
		createUser.iVerifyTheInstituteDashboardPageAfterClickingOnInstituteTileUnderSpecificUserLoginPage();
	}

	@Then("^I verify the availability of fields \"([^\"]*)\"$")
	public void verifyFields(String fieldName) throws Throwable {
		createUser.verifyFieldNames(fieldName);

	}

	@Then("^I verify the availability of mandatory fields \"([^\"]*)\"$")
	public void verifyMandatoryFields(String fieldName) throws Throwable {
		createUser.verifyMandatoryFieldNames(fieldName);
	}

	@Then("^I verify the availability of role \"([^\"]*)\"$")
	public void verifyRoles(String roleName) throws Throwable {
		createUser.verifyRoleNames(roleName);
	}

	@Then("^I click on \"([^\"]*)\"$")
	public void clickOnField(String fieldName) throws Throwable {
		createUser.clickOnFieldButton(fieldName);
	}

	@Then("^I switch the focus to Next button$")
	public void switchFocus() throws Throwable {
		createUser.switchFocus();
	}

	@Then("^I verify the validation message \"([^\"]*)\" on Create User Page$")
	public void verifyValidationMessage(String validationMessage) throws Throwable {
		createUser.ValidateMessage(validationMessage);
	}

	@Then("^I click on Next button$")
	public void click_Next_Button() throws Throwable {
		createUser.clickNextButton();
	}
	
	@Then("^I click on Back button$")
	public void click_Back_Button() throws Throwable {
		createUser.clickBackButton();
	}
	
	@Then("^I click on \"([^\"]*)\" tab on the left$")
	public void clickTab(String text) throws Throwable {
		createUser.clickTab(text);
	}
	
	@Then("^I verify the header \"([^\"]*)\"$")
	public void verifyHeader(String text) throws Throwable {
		createUser.verifyHeader(text);
	}
	
	@Then("^I select already selected \"([^\"]*)\"$")
	public void selectAlreadySelectedHealthSystem(String text) throws Throwable {
		createUser.clickAlreadySelectedHealthSystem(text);
	}

	@Then("^I click on Select All Locations button$")
	public void clickSelectAllLocationsButton() throws Throwable {
		createUser.clickSelectAllLocationsButton();
	}

	@Then("^I click on Submit button while edit for \"([^\"]*)\"$")
	public void clickSubmitButtonForEdit(String user) throws Throwable {
		createUser.clickSubmitButtonForEdit(user);
	}
	
	@Then("^I click on Submit button for \"([^\"]*)\"$")
	public void clickSubmitButtonForDifferentUsers(String user) throws Throwable {
		createUser.clickSubmitButtonForDifferentUsers(user);
	}


	
	@Then("^I click on Submit button to check for error message$")
	public void clickSubmitButtonToCheckError() throws Throwable {
		createUser.clickSubmitButtonToCheckErrorMessage();

	}

	@Then("^I verify applications \"([^\"]*)\" are unchecked$")
	public void verifyAppUnchecked(String appName) throws Throwable {
		createUser.verifyAppUnchecked(appName);
	}

	@Then("^I verify applications \"([^\"]*)\" are checked$")
	public void verifyAppChecked(String appName) throws Throwable {
		createUser.verifyAppChecked(appName);
	}

	@Then("^I verify the list of applications \"([^\"]*)\"$")
	public void verifyApplicationList(String appList) throws Throwable {
		createUser.verifyApplicationList(appList);
	}

	@Then("^I verify Learning Pathway search box is not available$")
	public void verifyLearningPathwayNotAvailable() throws Throwable {
		createUser.verifyLearningPathwayNotAvailable();
	}

	@Then("^I verify Learning Pathway search box is available$")
	public void verifyLearningPathwayAvailable() throws Throwable {
		createUser.verifyLearningPathwayNotAvailable();
	}

	@Then("^I click on Select button$")
	public void clickLessonsSelectButton() throws Throwable {
		createUser.clickLessonsSelectButton();
	}
	
	@Then("^I click on Cancel button$")
	public void clickCancelButton() throws Throwable {
		createUser.clickCancelButton();
	}

	@Then("^I enter \"([^\"]*)\" in Learning Pathway search box$")
	public void enterTextLearningPathwaySearchBox(String searchParam) throws Throwable {
		createUser.enterTextLearningPathwaySearchBox(searchParam);
	}
	@Then("^I remove \"([^\"]*)\" from the results$")
	public void removeLearningPath(String searchParam) throws Throwable {
		createUser.selectLearningPath(searchParam);
	}
	@Then("^I select \"([^\"]*)\" from the results$")
	public void selectLearningPath(String searchParam) throws Throwable {
		createUser.selectLearningPath(searchParam);
	}

	@Then("^I clear the Learning Pathway search box$")
	public void clearLearningPathwaySearchBox() throws Throwable {
		createUser.clearLearningPathwaySearchBox();
	}

	@Then("^I verify login button$")
	public void verifyLoginButton() throws Throwable {
		createUser.verifyLoginButton();
	}

	@Then("^I select \"([^\"]*)\" programs$")
	public void selectPrograms(String programList) throws Throwable {
		createUser.selectPrograms(programList);
	}
	
	@Then("^I select \"([^\"]*)\" locations$")
	public void selectLocations(String locationList) throws Throwable {
		createUser.selectLocations(locationList);
	}
	
	@Then("^I select \"([^\"]*)\" locations for Downstream Provider role$")
	public void selectLocationsForDownstreamProvider(String locationList) throws Throwable {
		createUser.selectLocationsForDownstreamProvider(locationList);
	}
	@Then("^I deselect \"([^\"]*)\" locations for Downstream Provider role$")
	public void deselectLocationsForDownstreamProvider(String locationList) throws Throwable {
		createUser.selectLocationsForDownstreamProvider(locationList);
	}
	
	@When("^I deselect \"([^\"]*)\" locations for PTA user$")
	@Then("^I select \"([^\"]*)\" locations for PTA user$")
	public void selectLocationsForPTAUser(String locationList) throws Throwable {
		createUser.selectLocationsForPTAUser(locationList);
	}
	
	@Then("^I click Add Organization button for \"([^\"]*)\" flag$")
	public void clickAddOrgButton(String flag) throws Throwable {
		createUser.clickAddHealthSystemButton(flag);
	}
	
	@Then("^I click Add Model3 Organization button for \"([^\"]*)\" flag for Downstream Provider role$")
	public void clickAddOrgButtonForDownstreamProvider(String flag) throws Throwable {
		createUser.clickAddHealthSystemButtonForDownstremProvider(flag);
	}

	@Then("^I verify default program \"([^\"]*)\" associated with organization$")
	public void verifyDefaultProgramOrganization(String programName) throws Throwable {
		createUser.verifyDefaultProgramOrganization(programName);
	}

	@Then("^I verify unavailability of organization drop down$")
	public void verifyUnavailabilityOrganizationDropDown() throws Throwable {
		createUser.verifyUnavailabilityOrganizationDropDown();
	}

	@Then("^I search for \"([^\"]*)\"$")
	public void searchLocation(String location) throws Throwable {
		createUser.searchLocation(location);
	}

	@Then("^I select the \"([^\"]*)\"$")
	public void selectLocation(String location) throws Throwable {
		createUser.selectLocation(location);
	}

	@Then("^I click on General Information tab$")
	public void clickGeneralInformationTab() throws Throwable {
		createUser.clickGeneralInformationTab();
	}

	@Then("^I verify availability of organization drop down$")
	public void verifyAvailabilityOrganizationDropDown() throws Throwable {
		createUser.verifyAvailabilityOrganizationDropDown();
	}

	@Then("^I click on \"([^\"]*)\" button$")
	public void click_LogOut_Button(String arg1) throws Throwable {
		createUser.clickLogOutButton(arg1);
	}

	@Then("^I click on \"([^\"]*)\" button again$")
	public void click_LogOut_ButtonAgain(String arg1) throws Throwable {
		createUser.clickLogOutButtonAgain(arg1);
	}
	
	@Then("^I verify \"([^\"]*)\" product on SPOE page$")
	public void verifyProductTiles(String products) throws Throwable {
		createUser.verifyProductTiles(products);
	}
	
	@Then("^I verify \"([^\"]*)\" product is not visible on SPOE page$")
	public void verifyProductTilesNotPresent(String products) throws Throwable {
		createUser.verifyProductTilesNotPresent(products);
	}

	@Then("^I click on Add Another Organization button$")
	public void clickAddAnotherOrganization() throws Throwable {
		createUser.clickAddAnotherOrganization();
	}

	@Then("^I enter characters \"([^\"]*)\" in location search$")
	public void enterCharacterInLocationSearch(String text) throws Throwable {
		createUser.enterCharacterInLocationSearch(text);
	}
	
	@Then("^I verify text present in location \"([^\"]*)\" field label$")
	public void verifyTextPresentInLocationSearchLabel(String text) throws Throwable {
		createUser.verifyTextPresentInLocationSearchLabel(text);
	}
	
	@Then("^I should not see \"([^\"]*)\" field$")
	public void shouldNotSeeFieldWithLabel(String text) throws Throwable {
		createUser.shouldNotSeeFieldWithLabel(text);
	}
	
	@Then("^I verify \"([^\"]*)\" in product menu dropdown$")
	 public void i_Verify_Value_In_ProductDropDown_Menu(String applications){
		createUser.iVerifyValueInProductDropDownMenu(applications);
	 }
	
	@Then("^I verify \"([^\"]*)\" is not present in product menu dropdown$")
	 public void i_Verify_Value_Is_Not_Present_In_ProductDropDown_Menu(String text){
		createUser.iVerifyValueIsNotPresentInProductDropDownMenu(text);
	 }
	
	//Added Steps
	
	 @Then("^I redirect to Remedy connect page$")
	 public void i_Redirect_To_RemedyConnect_Page() throws Throwable {
		 createUser.iRedirectToRemedyConnectPage();
	 }
    
	 @Then("^I verify \"([^\"]*)\" in dropdown on profile icon for \"([^\"]*)\" user$")
	 public void i_Verify_Value_In_DropDown_On_ProfileIcon(String text, String role){
		 createUser.iVerifyDropDownValueFromProfileIcon(text, role);
	 }
	 
	 @Then("^I click on \"([^\"]*)\" in dropdown on profile icon for \"([^\"]*)\" user$")
	 public void i_Click_On_Field_InDropdown_On_Profile_Icon(String text, String role){
		 createUser.iClickOnFiledInDropdownOnProfileIcon(text,role);
	 }
	 
	 @Then("^I verify page header \"([^\"]*)\" for \"([^\"]*)\" on Remedy Connect for \"([^\"]*)\" user$")
	 public void i_Verify_PageHeader_For_Page_On_RemedyConnect(String text, String page, String role) throws InterruptedException{
		 createUser.iVerifyPageHeaderForPageOnRemedyConnect(text, role);
	 }
	 
	 @And("^I verify No results found under Learning Pathway search box$")
	 public void i_Verify_NoResultsfound_Under_LearningPathway_Search() throws InterruptedException{
		 createUser.iVerifyNoResultsFoundUnderLearningPathWaySearch();
	 }
	 
	 @Then("^I click on the Reports Tile with text \"([^\"]*)\" for \"([^\"]*)\" user$")
	 public void i_click_on_the_Reports_Tile_with_text_for_user(String text, String role) throws Throwable {
	     createUser.iclickontheReportsTilewithtextforuser(text,role);
	 }

	 @Then("^I click on \"([^\"]*)\" report text for Overall Program Reports for \"([^\"]*)\" user$")
	 public void i_click_on_report_text_for_Overall_Program_Reports_for_user(String text, String role) throws Throwable {
		 createUser.iclickonreporttextforOverallProgramReportsforuser(text,role);
	 }

	 @When("^I click on field-panel-icon button for \"([^\"]*)\" user$")
	 public void i_click_on_field_panel_icon_button_for_user(String role) throws Throwable {
		 createUser.iclickonfieldpaneliconbuttonforuser(role);
	 }

	 @When("^I click to \"([^\"]*)\" field filter under \"([^\"]*)\" filter field for \"([^\"]*)\" user$")
	 public void i_click_to_field_filter_under_filter_field_for_user(String filterField, String filterTitle, String role) throws Throwable {
		 createUser.iclicktofieldfilterunderfilterfieldforuser(filterField,filterTitle,role);
	 }

	 @When("^I choose \"([^\"]*)\" option from select options of filter field for \"([^\"]*)\" user$")
	 public void i_choose_option_from_select_options_of_filter_field_for_user(String text, String role) throws Throwable {
		 createUser.ichooseoptionfromselectoptionsoffilterfieldforuser("//td[@id='cmdField"+text+"_text']",role);
	 }

	 @When("^I should see \"([^\"]*)\" in the filter value list for \"([^\"]*)\" user$")
	 public void i_should_see_in_the_filter_value_list_for_user(String text, String role) throws Throwable {
		 createUser.ishouldseeinthefiltervaluelistforuser(text,role);
	 }

	 @When("^I click on cancel button from filter for \"([^\"]*)\" user$")
	 public void i_click_on_cancel_button_from_filter_for_user(String role) throws Throwable {
		 createUser.iclickoncancelbuttonfromfilterforuser(role);
	 }
	 
	 @Then("^I click on Reports to navigate back to reports dashboard for \"([^\"]*)\" user$")
	 public void i_click_on_Report_Button(String role) throws Throwable {
		 createUser.iclickoncancelbuttonfromfilterforuser(role);
	 }
	 
	 @Then("^I click on Cross button$")
	 public void i_click_on_cross_button() throws Throwable {
		 createUser.clickCrossButton();
	 }
	 
	 @Then("^I removed the already selected role$")
	 public void i_remove_Already_Selected_Role() throws Throwable {
		 createUser.removeAlreadySelectedRole();
	 }


	 @Then("^I deselect \"([^\"]*)\" programs$")
		public void deselectPrograms(String programList) throws Throwable {
			createUser.deselectPrograms(programList);
		}
	 @Then("^I deselect \"([^\"]*)\" locations$")
		public void deselectLocations(String locationList) throws Throwable {
			createUser.selectLocations(locationList);
		}

	 @And("^I verify selected Location \"([^\"]*)\" are not shown in selected Locations section$")
	 public void i_verify_The_Selected_Locations_Not_Present_In_The_selectLocations_Section(String text) throws Throwable {
			createUser.iVerifyTheSelectedLocationsAreNotPresentInSelectLocationsSection(text);
		}
	 
	 @And("^I verify selected Location \"([^\"]*)\" in the selected Locations section$")
		public void i_verify_The_Selected_Locations_In_The_selectLocations_Section(String text) throws Throwable {
			createUser.iVerifyTheSelectedLocationsInTheSelectLocationsSection(text);
		}
	 
	 @Then("^I search the \"([^\"]*)\" in the Selected Locations section$")
		public void i_Search_The_Selected_Locations_In_The_selectLocations_Section(String locationList) throws Throwable {
			createUser.iSearchTheSelectedLocationsInTheSelectLocationsSection(locationList);
		}
	 
	 @And("^I click on remove link icon for selected Locations on selected Locations section$")
		public void i_Click_On_Remove_Link_Icon_for_Selected_Locations_selectLocations_Section() throws Throwable {
			createUser.iClickOnRemoveLinkIconforSelectedLocationsSelectLocationsSection();
		}
	 
	 @And("^I verify Selected Locations section after click on remove link icon$")
		public void i_Verify_Selected_Locations_Section_After_click_on_remove_link_icon() throws Throwable {
			createUser.iVerifySelectedLocationsSectionAfterClickOnRemoveLinkIcon();
		}
	 
	 @And("^I click on remove link icon for selected Health system$")
		public void i_Click_on_Remove_Link_Icon_For_Selected_Health_System() throws Throwable {
		 createUser.iClickOnRemoveLinkIconforSelectedLocationsSelectLocationsSection();
	 }
	 
	 @And("^I verify text on pop up window after click on remove link icon$")
		public void i_Verifytext_on_pop_up_Window_After_Click_on_Remove_link_Icon() throws Throwable {
		 createUser.iVerifyTextonpopupWindowAfterClickonRemovelinkIcon();
	 }
	 
	 @And("^I click \"([^\"]*)\" link on pop up window$")
		public void i_Click_on_Cancel_Link_Pop_Up_Window(String text) throws Throwable {
		 createUser.iClickonCancelLinkPopUpWindow(text);
	 }
	 
	 @And("^I click \"([^\"]*)\" button on pop up window$")
		public void i_Click_on_Remove_Button_Pop_Up_Window(String text) throws Throwable {
		 createUser.iClickonRemoveButtonPopUpWindow(text);
	 }
	 
	 @Then("^I verify \"([^\"]*)\" text on landing page$")
		public void i_Verify_Page_text_On_Landing_Page(String text) throws Throwable {
		 createUser.iVerifyPagetextOnLandingPage(text);
	 }
	 
	 @And("^I click on \"([^\"]*)\" on landing page$")
		public void i_Click_on_Arrow_Buttons_on_Landing_Page(String text) throws Throwable {
		 createUser.iClickonArrowButtonsonLandingPage(text);
	 }
	 @Then("^I enter NPI field with existing NPI for \"([^\"]*)\"$")
	 public void iEnterExistingNPI(String userRole){
		 createUser.iEnterExistingNPI(userRole);
	 }
	 @Then("^I should see error message for duplicate value \"([^\"]*)\"$")
	 public void duplicateNPIMsg(String text){
		 createUser.duplicateNPIMsg(text);
	 }
	
	 @Then("^I enter existing Email to Create user for \"([^\"]*)\"$")
	 public void iEnterExistingEmail(String userRole){
		 createUser.iEnterExistingEmail(userRole);
	 }
	 @Then("^I verify that \\\"([^\\\"]*)\\\" is not present under the bpid$")
	 public void iVerifyAllLocationsPresence(String text) {
		 createUser.iVerifyAllLocationsPresence(text);
	 }
}