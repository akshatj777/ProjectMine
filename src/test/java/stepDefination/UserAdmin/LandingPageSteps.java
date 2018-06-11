package stepDefination.UserAdmin;

import com.remedy.userAdmin.LandingPage;
import com.remedy.userAdmin.LoginPage;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

/**
 * Created by salam on 8/4/15.
 */
public class LandingPageSteps extends DriverScript{

    LandingPage landingPage = new LandingPage(driver);
    LoginPage loginPage = new LoginPage(driver);

    @And("^I click on the Tile with text ([^\"]*)$")
    public void IClickTileWithText(String tile) throws Throwable {
        landingPage.iClickOnApplicateTile(tile);
    }

    @And("^I click on the top user account link on remedy connect page$")
    public void IClickTopUserAccountLinkOnRemedyConnectPage() throws Throwable {
        landingPage.iClickOnTheTopUserAccountIconOnRemedyConnectPage();
    }

    @And("^I click on the top user account link$")
    public void IClickTopUserAccountLink() throws Throwable {
        landingPage.IClickTopUserAccountLink();
    }
    
    @And("^I select ([^\"]*) option from the dropdown$")
    public void ISelectLogoutOption(String link) throws Throwable {
        landingPage.iSelectFromTopUserAccountDropDown(link);
    }

    @Then("^I should see Tile text ([^\"]*)")
    public void iShouldSeeTile(String tileName) throws Throwable {
        landingPage.iVerifyTextforTiles(tileName);
    }

    @And("^I should see Jira Log in Page text \"([^\"]*)\"$")
    public void iShouldSeeJiraLogInPageText(String text) throws Throwable {
        landingPage.iVerifyTextForJiraLogInPage(text);
    }

    @And("^I should see logo text \"([^\"]*)\"$")
    public void iShouldSeeLogoText(String text) throws Throwable {
        landingPage.iVerifyPageLogoText(text);
    }

    @Then("^I should not see Tile text ([^\"]*)")
    public void iShouldNotSeeTileText(String tileName) throws Throwable {
        landingPage.iVerifyTextNotForTiles(tileName);
    }

    @Then("^I click on Hamburger menu on top left of homepage$")

    public void iClickOnHamburgurMenu()throws Throwable {
    	landingPage.iClickOnHamburgurMenuOnTop();
    }
    @Then("^I click on Okay on reset password confirmation box$")
    public void iConfirmOnResetPasswordBox(){
    	landingPage.iConfirmOnResetPasswordBox();
    }
    @Then("^I should see error message for password mismatch \"([^\"]*)\"$")
    public void PasswordMismachErrorMsg(String text){
    	landingPage.PasswordMismachErrorMsg(text);
    }
    @Then("^I should see password guidelines for a valid password$")
    public void passwordGuidelinesVerification(){
    	landingPage.passwordGuidelinesVerification();
    }
    @Then("^I click on forgot password link$")
    public void forgotPasswordLink(){
    	landingPage.forgotPasswordLink();
    }
    @Then("^I verify reset password message \"([^\"]*)\"$")
    public void resetPasswordMsg(String text){
    	landingPage.resetPasswordMsg(text);
    }
    
    @Then("^I verify Email textbox$")
    public void EmailFieldVerificationOnForgotPasswordPage(){
    	landingPage.EmailFieldVerificationOnForgotPasswordPage();
    }
    
    @Then("^I verify Send Email button$")
    public void sendEmailButtonVerification(){
    	landingPage.sendEmailButtonVerification();
    }
    @Then("^I verify back button on forgot password page$")
    public void backButtonOnForgotPasswordPageVerification(){
    	landingPage.backButtonOnForgotPasswordPageVerification();
    }
    @Then("^I click on back button on forgot password page$")
    public void iClickOnBackButtonOnForgotPassPage(){
    	landingPage.iClickOnBackButtonOnForgotPassPage();
    }
    @Then("^I enter email for \"([^\"]*)\" to generate password link$")
    public void iEnterEmailToCreatePass(String text){
    	landingPage.iEnterEmailToCreatePass(text);
    }
    @Then("^I should see a validation message for invalid email$")
    public void validationMsgForInvalidEmail() {
    	landingPage.validationMsgForInvalidEmail();
    }
    @Then("^I should see error message for invalid credentials \"([^\"]*)\"$")
public void errorMesgValidationForInvalidCreds(String text) {
    	landingPage.errorMesgValidationForInvalidCreds(text);
    }
    @Then("^I click on \"([^\"]*)\" button from top right corner icon$")
    public void clickResetPasswordButton(String text) throws Throwable{
    	landingPage.clickResetPasswordButton(text);
    }
    @Then("^I verify Remedy Connect page$")
    public void remedyConnectPageVerification(){
    	landingPage.remedyConnectPageVerification();
    }
    @Then("^I verify ghost text \"([^\"]*)\" in search box$")
    public void verifySearchGhostText(String text){
    	landingPage.verifySearchGhostText(text);
    }

}