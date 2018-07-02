package stepDefination.UserAdmin;

import com.remedy.userAdmin.CreateUserPage;
import com.remedy.userAdmin.EmailVarificationPage;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;

import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

/**
 * Created by salam on 8/6/15.
 */
public class EmailVerificationSteps extends DriverScript{
    
   EmailVarificationPage popMail = new EmailVarificationPage(driver);
   CreateUserPage createUser = new CreateUserPage(driver);

    @And("^I enter the email for verification for ([^\"]*)$")
    public void ISearchFacilityWith(String email) throws Throwable {
    	popMail.iEnterVerificationEmai(createUser.iGenerateEmail(email));
     }

    @And("^I click on Go button$")
    public void IClickGoButton() throws Throwable {
        popMail.iClickGoButton();
    }

    @And("^I select the email to check$")
    public void ISelectEmailToCheck() throws Throwable {
      popMail.SelectNewEmail();
    }

    @And("^I click on the confirm account link$")
    public void I_click_on_the_confirm_account_link() throws Throwable {
    	popMail.switchToFrame("//*[@id='publicshowmaildivcontent']");
    	popMail.clickConfirmAccountLink();
    }

    @And("^I delete all emails$")
    public void IDeleteAllEmails() throws Throwable {
       popMail.switchToFrame("//*[@id='ifinbox']");
       popMail.deleteAllEmails();
    }

    @Then("^I click check for new mails button$")
    public void IClickCheckForNewNailsButton() throws Throwable {
        popMail.iClickCheckForNewMail();
    }

    @And("^I click on Confirm Password Link$")
    public void IClickConfirmPasswordLink() throws Throwable {
    	popMail.iClickOnConfirmPasswordLink();
    }
}