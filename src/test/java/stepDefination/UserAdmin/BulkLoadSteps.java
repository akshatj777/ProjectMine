package stepDefination.UserAdmin;

import com.remedy.resources.DriverScript;
import com.remedy.userAdmin.BulkUserCreationPage;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

/**
 * Created by salam on 10/30/16.
 */
public class BulkLoadSteps extends DriverScript{

    BulkUserCreationPage bulkUser = new BulkUserCreationPage (driver);


    @And("^I upload file for bulk load users$")
    public void iUploadFileForBulkLoadUsers() throws Throwable {

        bulkUser.iUplaodFile();
    }


    @And("^I verify the Success Message$")
    public void iVerifyTheSucessMessage() throws Throwable {
        bulkUser.iVerifySuccssfulUserCreationMessage("1 user(s) successfully created");
    }
    
    @Then("^I click on Import User button$")
    public void clickImportUserButton() throws Throwable {
        bulkUser.clickImportButton();
    }
    
    @Then("^I click on Try Again button$")
    public void clickTryAgainButton() throws Throwable {
        bulkUser.clickTryAgain();
    }
    
    @Then("^I enter user data$")
    public void enterUserData() throws Throwable {
        bulkUser.enterData();
    }
    
    @Then("^I enter user data for all application access$")
    public void enterUserDataForAllApp() throws Throwable {
        bulkUser.enterDataForAllApp();
    }
    
    @Then("^I click on submit button on bulk user upload page$")
    public void clickSubmitButtonOnBulkUpload() throws Throwable {
        bulkUser.clickSubmit();
    }
    
    @Then("^I verify \"([^\"]*)\" message$")
    public void verifyMessage(String text) throws Throwable {
        bulkUser.verifySuccessfulMessage(text);
    }
}
