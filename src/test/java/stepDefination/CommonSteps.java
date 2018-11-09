package stepDefination;

import com.remedy.Analytics.ProgramPerformance;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.Constants;
import com.remedy.userAdmin.LandingPage;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import stepDefination.Hooks.InitialSetup;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import java.io.File;
import java.util.concurrent.TimeUnit;

import javax.imageio.ImageIO;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.Point;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

/**
 * Created by salam on 8/5/15.
 */
public class CommonSteps extends DriverScript {


    LandingPage landingPage = new LandingPage(driver);
    BaseClass baseClass = new BaseClass(driver);

    public static Actions actionEvent = new Actions(driver);

    @Given("I am on the login page$")
    public void setup() throws Throwable {
    	try{
        driver.navigate().to(Config.getProperty("BaseUrl"));
        driver.manage().timeouts().pageLoadTimeout(240, TimeUnit.SECONDS);
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	driver.manage().window().maximize();
        }}
    	catch(Exception e){
    		throw e;
    	}
    }

    @Then("^I go to mail verification page$")
    public void IGoToMailVerificationpage() throws Throwable {
    	Robot r = new Robot();        
        r.keyPress(KeyEvent.VK_CONTROL);
        r.keyPress(KeyEvent.VK_T);
        r.keyRelease(KeyEvent.VK_CONTROL);
        r.keyRelease(KeyEvent.VK_T);
        iSwitchBackToOLDWindow();
        driver.navigate().to("https://www.mailinator.com/");
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        driver.manage().window().maximize();
    }

    @And("^I close current Window$")
    public void ICoseCurrentWindow() throws Throwable {
        driver.close();
    }

    @And("^I click on button with text \"([^\"]*)\" on page$")
    public void iClickOnButtonWithTextOnPage(String textToBeClicked) throws Throwable {
        driver.findElement(By.xpath("//*[text()='"+textToBeClicked+"']")).click();
    }

    @And("^I navigate back$")
    public void I_nevigate_back() throws Throwable {
        driver.navigate().back();
    }

    @And("^I switch to new window$")
    public void iSwitchoNewWindow() {
        landingPage.iSwitchToNewWindow();
    }

    @And("^I switch back to old window$")
    public void iSwitchBackToOLDWindow(){
        landingPage.iSwitchBackToOldWindow();
    }

    @And("^I verify current page \"([^\"]*)\" title$")
    public void iVerifyCurrentPageTitle(String pageTitle) {
    	 WebDriverWait wait = new WebDriverWait(driver, 120);
    	 wait.until(ExpectedConditions.titleContains(pageTitle));
         Assert.assertEquals(driver.getTitle(), pageTitle);
    }

    @And("^I wait for ([^\"]*) milli seconds$")
    public void iWaitForMillisSeconds(Long waitTimeInMillis) {
        try {
            Thread.sleep(waitTimeInMillis);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    @And("^I switch to default window from iframe$")
    public void iSwitchDefaultWindowFromIframe(){
        driver.switchTo().defaultContent();
    }

    @And("^I double click on current mouse location element$")
    public void iDoubleClickCurrentMouseLocationElement(){
        actionEvent.doubleClick().perform();
    }

    @And("^I go to \"([^\"]*)\" page$")
    public void visit(String page)
    {
        driver.navigate().to(page);
    }
    
    @Then("^I drag and drop \"([^\"]*)\" from available fields to rows under layout$")
    public void iDragAndDropFieldsToLayout(String text) throws AWTException, InterruptedException{
    	Thread.sleep(3000);
    	WebElement From = driver.findElement(By.xpath("//div[contains(text(),'BPID')]"));
    	WebElement To = driver.findElement(By.xpath("//div[@class='propPanel_gemBar string propPanelItem']"));
    	Actions builder = new Actions(driver);
    	/*Action dragAndDrop = builder.clickAndHold(From)
    	.moveToElement(To)
    	.release(To)
    	.build();
    	dragAndDrop.perform();*/
    	
    	System.out.println(From.getText());
    	System.out.println(To.getText());
    	System.out.println("starting dragdrop");
    	if(From.isDisplayed() && To.isDisplayed())
    	{
    		System.out.println("Entered loop");
        	//builder.dragAndDrop(From, To).build().perform();
    		builder.keyDown(Keys.CONTROL)
            .click(From)
            .dragAndDrop(From, To)
            .keyUp(Keys.CONTROL);

            Action selected = builder.build();
            selected.perform();
    	}
    }
    
    @And("^I switch back to old window in reports$")
    public void iSwitchBackToOLDWindowInReports(){
    	baseClass.switchBacktoOldWindow();
    }
    
    @Given("^I am on Analytics Tableau login page$")
	public void i_am_on_analytics_tableau_login_page() throws Throwable{
		driver.navigate().to(Config.getProperty("AnalyticsURL"));
        driver.manage().timeouts().pageLoadTimeout(240, TimeUnit.SECONDS);
        driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	driver.manage().window().maximize();
        }
	}
}