package stepDefination.UserAdmin;

import com.remedy.resources.DriverScript;
import com.remedy.userAdmin.BulkUserCreationPage;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

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
    
    @Then("^I verify header text \"([^\"]*)\"$")
    public void verifyHeaderText(String arg1) throws Throwable {
    	bulkUser.verifyHeaderText();
    }

    @Then("^I verify availability of cross button$")
    public void verifyCrossButton() throws Throwable {
    	bulkUser.verifyCrossButton();
    }

    @Then("^I verify availability of Download Log button$")
    public void verifyDownloadButton() throws Throwable {
    	bulkUser.verifyDownloadButton();
    }

    @Then("^I verify availability of Try Again button$")
    public void verifyTryAgainButton() throws Throwable {
    	bulkUser.verifyTryAgainButton();
    }

    @Then("^I verify availability of Hide button$")
    public void verifyHideButton() throws Throwable {
    	bulkUser.verifyHideButton();
    }

    @When("^I click on Hide button$")
    public void clickHideButton() throws Throwable {
    	bulkUser.clickHideButton();
    }
}
