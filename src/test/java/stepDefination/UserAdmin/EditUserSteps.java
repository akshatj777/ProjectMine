package stepDefination.UserAdmin;

import com.remedy.userAdmin.EditUser;
import com.remedy.resources.DriverScript;
import com.remedy.userAdmin.CreateUserPage;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class EditUserSteps extends DriverScript {
EditUser editUser= new EditUser(driver);
CreateUserPage createUserPage=new CreateUserPage(driver);
	@Then("^I select user with email \"([^\"]*)\"$")
	public void i_select_user(String email) throws Throwable {
	 editUser.iClickOnUser(email);
	}

	@Then("^I click on Edit button$")
	public void i_click_on_Edit_button() throws Throwable {
	   editUser.iClickOnEditButton();
	}

	@Then("^I verify the availability of field NPI for \"([^\"]*)\"$")
	public void i_verify_the_availability_of_fields_for_Physicians(String role) throws Throwable {
		editUser.VerifyNPIFieldForPhysicians(role);
	}	
	
	@And("^I fill in Phone with([^\"]*)$")
	public void iFillInPhone(String number) throws Throwable {
		editUser.iEnterPhone(number);
	}
	
	@When ("^I click the Organizational Role Field to edit$")
	public void iClickOnRoleFieldToEdit(){
		editUser.iClickOnRoleFieldToEdit();
	}
	
	@Then("^I select \"([^\"]*)\" tab$")
	public void iSelectApplicationTab(String tab) throws Throwable {
		editUser.iClickOnTab(tab);
	}

	@Then("^I verify that \"([^\"]*)\" are \"([^\"]*)\"$")
	public void i_verify_that_Episodes_Reports_Lessons_are(String apps, String select) throws Throwable {
	    editUser.iVerifyThatApplicationsAreEditable(apps, select);
	}
	
	@Then("^I click on delete organisation icon$")
	public void iDeleteOrganisation() throws Throwable {
	    editUser.iClickOnDeleteOrganisation();
	}
	@Then("^I should not be able to edit Email$")
	public void i_should_not_be_able_to_edit_Email() throws Throwable {
	   editUser.iVerifyThatEmailIsNonEditable();
	}
	
	@Then("^I click on \"([^\"]*)\" existing organisation$")
	public void iClickOnExistingOrganisation(String text) throws Throwable {
	   editUser.iClickOnExisitingOrganisation(text);
	}
	
	@Then("^I click on existing organisation \"([^\"]*)\"$")
	public void iClickOnExistingOrganisationByName(String text) throws Throwable {
	   editUser.iClickOnExisitingOrganisationByName(text);
	}

	@Then("^I click on \"([^\"]*)\" button on permissions tab$")
		public void iClickOnAddAnotherOrganisation(String text){
			editUser.iClickOnAddAnotherOrganisation(text);
		}	

	@Then("^I click on Select All Locations button for \"([^\"]*)\" Organisation$")
	public void i_click_on_Select_All_Locations_button_for_Organisation(String arg1) throws Throwable {
		editUser.clickAllLocationsButton(arg1);
	}

	@Then("^I verify that \"([^\"]*)\" are \"([^\"]*)\" in Applications tab$")
	public void i_verify_that_are_in_Applications_tab(String appList, String text) throws Throwable {
		editUser.iVerifyProductAsPerRole(appList, text);
	}
	@Then("^I verify text \"([^\"]*)\" is \"([^\"]*)\" in Permission tab$")
	public void iVerifyDownstreamProviderPermission(String text, String present){
		editUser.iVerifyDownstreamProviderPermission(text,present);
	}
	@Then("^I should see text \"([^\"]*)\"$")
	public void iSeeNoResults(String text){
		editUser.iSeeNoResults(text);
	}
	@Then("^I verify that \"([^\"]*)\" button is disabled when no application is selected$")
	public void iVerifyDisabledNextButton(String text){
		editUser.iVerifyDisabledNextButton(text);
	}
	@Then("^I verify that Next button is \"([^\"]*)\"$")
	public void iVerifyNextButtonStatus(String text){
		editUser.iVerifyNextButtonStatus(text);
	}
	@Then("^I verify that Submit button is \"([^\"]*)\"$")
	public void iVerifySubmitButtonStatus(String text){
		editUser.iVerifySubmitButtonStatus(text);
	}
	@Then("^I verify that \"([^\"]*)\" menu is \"([^\"]*)\"$")
	public void iVerifyleftMenuStatus(String text1, String text2){
		editUser.iVerifyleftMenuStatus(text1, text2);
	}
	@Then("^I should see error message \"([^\"]*)\"$")
	public void iVerifyErrorMessage(String text){
		editUser.iVerifyErrorMessage(text);
	}
	@Then("^I unselect \"([^\"]*)\" from the results$")
	public void unselectLearningPath(String searchParam) throws Throwable {
		editUser.unselectLearningPath(searchParam);
	}
	@Then("^I click on Close icon$")
	public void i_click_on_Close_icon() throws Throwable {
	  editUser.iClickOnCloseIcon();
	}
	@Then("^I verify that \"([^\"]*)\" is \"([^\"]*)\" on page$")
	public void iValidateNPI(String npi, String text){
		editUser.iValidateNPI(npi, text);
	}
	@Then("^I should see an alert with text \"([^\"]*)\"$")
	public void iValidateAlertText(String text){
		editUser.iValidateAlertText(text);
	}
	@Then("^I should see \"([^\"]*)\" button$")
	public void iValidateCancelButton(String text){
		editUser.iValidateCancelButton(text);
	}
	@Then("^I verify that \"([^\"]*)\" products are shown in Applications tab as compared to \"([^\"]*)\"$")
	public void iVerifyProductsCount(String text, int count){
		editUser.iVerifyProductsCount(text,count);
	}
	@Then("^I select location by BPID \"([^\"]*)\"$")
	public void iSelectLocByBPID(String location) throws InterruptedException{
		editUser.iSearchLocByBPID(location);
	}
	@Then("^I deselect location by BPID \"([^\"]*)\"$")
	public void iDeSelectLocByBPID(String location) throws InterruptedException{
		editUser.iSearchLocByBPID(location);
	}
	@Then("^I select location by BPID \"([^\"]*)\" for PTA$")
	public void iSelectLocByBPIDForPTA(String location) throws InterruptedException{
		editUser.iSearchLocByBPIDForPTA(location);
	}
	@Then("^I deselect location by BPID \"([^\"]*)\" for PTA$")
	public void iDeselectLocByBPIDForPTA(String location) throws InterruptedException{
		editUser.iSearchLocByBPIDForPTA(location);
	}
	@Then("^I should see \"([^\"]*)\" for locations under data permissions$")
	public void iVerifyFacilityKey(String key){
		editUser.iVerifyFacilityKey(key);
	}
	@Then("^I select location by facility key \"([^\"]*)\"$")
	public void iSelectLocByFacilityKey(String key) throws InterruptedException{
		editUser.iSelectLocByFacilityKey(key);
	}
	
	@Then("^I verify that \"([^\"]*)\" is not shown in edit page$")
	public void iVerifyLearningPathwayIDIsNotPresentOnEditPage(String text){
		editUser.iVerifyLearningPathwayIDIsNotPresentOnEditPage(text);
	}
	@Then("^I verify that provisioned roles of PTA are present on edit page$")
	public void iVerifyPTAProvisionedRoleOnEditPage(){
		editUser.iVerifyPTAProvisionedRoleOnEditPage();
	}
	
	@Then("^I should see \"([^\"]*)\" under data permissions$")
	public void iVerifydataPermissionsField(String field){
		editUser.iVerifydataPermissionsField(field);
	}
	@Then("^I select \"([^\"]*)\" programs for existing organisation$")
	public void iSelectProgForExistingOrg(String programList) throws Throwable{
		editUser.selectProgramsForExistingOrg(programList);
	}
	@Then("^I remove health system \"([^\"]*)\"$")
	public void iRemoveHealthSystemByName(String org){
		editUser.iRemoveHealthSystemByName(org);
	}
	@Then("^I click on learning pathway dropdown$")
	public void iClickOnLearningPathwayDropdown(){
		editUser.iClickOnLearningPathwayDropdown();
	}
	@Then("^I verify No results found for invalid health system$")
	public void iVerifyMessageForInvalidHealthSystem() throws InterruptedException{
		editUser.iVerifyMessageForInvalidHealthSystem();
	}
	@Then("^I verify No results found for invalid Location for \"([^\"]*)\" organisation$")
	public void iVerifyMessageForInvalidLocation(String text) throws InterruptedException{
		editUser.iVerifyMessageForInvalidLocation(text);
	}
	@Then("^I click on Select dropdown$")
	public void iClickOnSelectOrgDropdown(){
		editUser.iClickOnSelectOrgDropdown();
	}
	@Then("^I select \"([^\"]*)\" invalid locations$")
	public void iSelectInvalidLoc(String location) throws InterruptedException{
		editUser.iSelectInvalidLoc(location);
	}
	@Then("^I select \"([^\"]*)\" invalid locations for PTA$")
	public void iSelectInvalidLocForPTA(String location) throws InterruptedException{
		editUser.iSelectInvalidLocForPTA(location);
	}
	@Then("^I verify incomplete status for health system$")
	public void iVerifyIncompleteOrganisation(){
		editUser.iVerifyIncompleteOrganisation();
	}
	@Then("^I verify incomplete status is not shown for health system$")
	public void iVerifyIncompleteStatusNotShown(){
		editUser.iVerifyIncompleteStatusNotShown();
	}
	
	@Then("^I verify facility key \"([^\"]*)\" is displayed with location name \"([^\"]*)\"$")
	public void iVerifyLocationDisplayedWithFacilityKey(String key, String text){
		editUser.iVerifyLocationDisplayedWithFacilityKey(key, text);
	}
	@Then("^I verify facility key \"([^\"]*)\" is not displayed with location name \"([^\"]*)\"$")
	public void iVerifyLocationNotDisplayedWithFacilityKey(String key, String text){
		editUser.iVerifyLocationNotDisplayedWithFacilityKey(key, text);
	}
	@Then("^I verify that Learning Pathway ID \"([^\"]*)\" is not displayed for the enabled Learning Pathway$")
	public void iVerifyLearningPathwayIDIsNotDisplayed(String id){
		editUser.iVerifyLearningPathwayIDIsNotDisplayed(id);
	}
	@Then("^I verify error message \"([^\"]*)\" is not displayed$")
	public void iCheckErrMsgIsNotShown(String text){
		editUser.iCheckErrMsgIsNotShown(text);
	}
	@Then("^I enter \"([^\"]*)\" in Learning Pathway$")
	public void iEnterLearningPathway(String text){
		editUser.iEnterLearningPathway(text);
	}
	@Then("^I verify \"([^\"]*)\" while editing the user$")
	public void validateLearningPathwayWhileEdit(String pathways){
		editUser.validateLearningPathwayWhileEdit(pathways);
	}
	@Then("^I verify cross icon$")
		public void iVerifyCrossIcon(){
		editUser.iVerifyCrossIcon();
		
	}
	@Then("^I verify that submit button is disabled when data permission is not selected$")
	public void verifySubmitButtonStatus() {
		editUser.verifySubmitButtonStatus();
	}
	@Then("^I verify that \"([^\"]*)\" is not reflected as selected in edit user page$")
	public void iVerifyRemovedProgramInEditPage(String program){
		editUser.iVerifyRemovedProgramInEditPage(program);
	}
	@Then("^I verify that pagination is not displayed for selected locations$")
	public void verifyPaginationForSelectedLoc(){
		editUser.verifyPaginationForSelectedLoc();
	}
	@Then("^I verify that All Locations checkbox is checked$")
	public void verifyAllLocationBoxSelection() {
		editUser.verifyAllLocationBoxSelection();
	}
}