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
}