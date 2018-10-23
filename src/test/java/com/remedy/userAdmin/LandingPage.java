package com.remedy.userAdmin;


import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.Assert;
//import org.apache.commons.collections.set.SynchronizedSet;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.WebDriverWait;

/**
 * Created by salam on 7/29/15.
 */
public class LandingPage extends BaseClass{

	String parentWindow = null;
	Set<String> handles = null;
	public static String parentWindowTitle = null;
    public LandingPage(WebDriver driver){

        super(driver);}

    public void iVerifyTextforTiles(String text)
    {
    	iWillWaitToSee(By.xpath("//div[text()='"+text+"']"));
    	Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+text+"']")));
    }
    public void iClickOnApplicateTile(String tile){
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	iWillWaitToSee(By.xpath(tile));
        	((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath(tile)));
        }
        else
        {
        	iWillWaitToSee(By.xpath(tile));
            clickElement(driver.findElement(By.xpath(tile)));
        }
        longDelay();
    }

    public void iSwitchToNewWindow(){
    	try
		{
			if(DriverScript.Config.getProperty("Browser").equals("chrome"))
			{
				Thread.sleep(5000);
				String parentWindow = driver.getWindowHandle();
				Set<String> handles = driver.getWindowHandles();
				if(!((String)handles.toArray()[handles.size()-1]).equals(parentWindow))
				{
					driver.switchTo().window((String)handles.toArray()[handles.size()-1]);
				}
			}
			else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
			{
				Thread.sleep(5000);
				String parentWindow = driver.getWindowHandle();
				Set<String> handles = driver.getWindowHandles();
				Object[] array = handles.toArray();
				Arrays.sort(array);
				System.out.println("Windows : "+Arrays.toString(array));
				if(!(array[array.length-1].toString().equals(parentWindow)))
				{
					driver.switchTo().window(array[array.length-1].toString());
					new WebDriverWait(driver, 180).until(
					          webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
					System.out.println("Hello : "+driver.getTitle());
					System.out.println("After Switching Window Handle : "+driver.getWindowHandle());
				}
			}
			else if(DriverScript.Config.getProperty("Browser").equals("ie"))
			{
				parentWindow = driver.getWindowHandle();
				if(driver.getWindowHandles().size()==2)
				{
					handles = driver.getWindowHandles();
					handles.remove(parentWindow);
					driver.switchTo().window((String)handles.toArray()[0]);
				}
				else if(driver.getWindowHandles().size()>2)
				{
					Set<String> newHandles = driver.getWindowHandles();
					newHandles.removeAll(handles);
					driver.switchTo().window((String)newHandles.toArray()[0]);
				}
				handles=driver.getWindowHandles();
				driver.manage().window().maximize();
				Thread.sleep(3000);
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
    }

    public void iSwitchBackToOldWindow(){
    	try
    	{
    		if(DriverScript.Config.getProperty("Browser").equals("chrome"))
    		{
    			String parentWindow = driver.getWindowHandle();
                Set<String> handles = driver.getWindowHandles();
                if(!((String)handles.toArray()[0]).equals(parentWindow))
    			{
    				driver.switchTo().window((String)handles.toArray()[0]);
    			}
                delay();
    		}
    		else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
    		{
    			String parentWindow = driver.getWindowHandle();
                Set<String> handles = driver.getWindowHandles();
                Object[] array = handles.toArray();
				Arrays.sort(array);
                if(!(array[0].toString().equals(parentWindow)))
    			{
    				driver.switchTo().window(array[0].toString());
    			}
                delay();
    		}
    		else if(DriverScript.Config.getProperty("Browser").equals("ie"))
    		{
    			driver.switchTo().window(parentWindow);
    		}
    	}
    	catch(Exception e)
    	{
    		System.out.println(e.toString());
    	}
    }


    public void iClickOnTheTopUserAccountIcon (){
    	delay();
    	if (driver.findElements(By.xpath("//div[@class='ui dropdown menu-profile-btn']")).size()>0){
    		clickElement(driver.findElement(By.xpath("//div[@class='ui dropdown menu-profile-btn']")));
    	}
    	else{
        	clickElement(driver.findElement(By.xpath("//menu-dropdown[contains(@class,'flex-item item-dropdown-right')]")));
    	}
    }
    public void iClickOnTheTopUserAccountIconOnRemedyConnectPage (){
    		iWillWaitToSee(By.xpath("//i[@class='dropdown icon']"));
    		clickElement(driver.findElement(By.xpath("//i[@class='dropdown icon']")));
    }
    
    public void IClickTopUserAccountLink() {
    	if(DriverScript.Config.getProperty("Browser").equals("ie"))
    	{
    		iWillWaitToSee(By.xpath("//div[@class='ui dropdown menu-profile-btn']//i[@class='dropdown icon']"));
    		((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='ui dropdown menu-profile-btn']//i[@class='dropdown icon']")));
    	}
    	else
    	{
    		iWillWaitToSee(By.xpath("//div[@class='ui dropdown menu-profile-btn']//i[@class='dropdown icon']"));
    		clickElement(driver.findElement(By.xpath("//div[@class='ui dropdown menu-profile-btn']//i[@class='dropdown icon']")));
    	}
    }

    public void iSelectFromTopUserAccountDropDown(String link) throws InterruptedException{
    	driver.navigate().refresh();
    	Thread.sleep(3000);
    	iWillWaitToSee(By.xpath("//div[@class='ui dropdown menu-profile-btn']//i[@class='dropdown icon']"));
	      driver.findElement(By.xpath("//div[@class='ui dropdown menu-profile-btn']//i[@class='dropdown icon']")).click();
	      Thread.sleep(3000);
	      if(link.equals("Log Out"))
	      {
	    	  if(DriverScript.Config.getProperty("Browser").equals("ie"))
	    	  {
	    		  ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='Log Out']")));  
	    	  }
	    	  else
	    	  {
	    		  driver.findElement(By.xpath("//span[text()='Log Out']")).click();
	    	  }
	      }
	      else if(link.equals("Reset Password"))
	      {
	    	  if(DriverScript.Config.getProperty("Browser").equals("ie"))
	    	  {
	    		  ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='Reset Password']")));
	    	  }
	    	  else
	    	  {
	    		  driver.findElement(By.xpath("//span[text()='Reset Password']")).click();
	    	  }
	      }
    }

    public void iVerifyTextForJiraLogInPage(String text){
        verifyTextForElement(driver.findElement(By.xpath("//*[@id='footer']/div/section/ul/li[1]/a")), text);
    }

    public void iVerifyPageLogoText(String text){
        verifyTextForElement(driver.findElement(By.cssSelector(".logo.valentino-icon-reports")), text);
    }

    public void iVerifyTextNotForTiles( String text){
        verifyTextNotPresentForElementFromList(".title>p", text);
    }
    
    public void iClickOnHamburgurMenuOnTop(){
    		iWillWaitToSee(By.xpath("//i[@class='btn btn-menu valentino-icon-spoe']"));
        	clickElement(driver.findElement(By.xpath("//i[@class='btn btn-menu valentino-icon-spoe']")));
    }
    public void iConfirmOnResetPasswordBox(){
    	delay();
    	iWillWaitToSee(By.xpath("//button[contains(text(),'Okay')]"));
    	clickElement(driver.findElement(By.xpath("//button[contains(text(),'Okay')]")));
    	
    }
public void ValidationMsgForRestPass(String text){
	if(text.equals("Please ensure the password and the confirmation are the same")){
    	iWillWaitToSee(By.cssSelector(".auth0-global-message.auth0-global-message-error"));
    	Assert.assertTrue(driver.findElement(By.cssSelector(".auth0-global-message.auth0-global-message-error")).getAttribute("innerText").toString().trim().contains(text));
	}
	else if (text.equals("Remedy Connect")){
		iWillWaitToSee(By.xpath("//div[@class='remedy-connect-title' and text()='Remedy Connect']"));
		Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//div[@class='remedy-connect-title' and text()='Remedy Connect']"))));
	}
	}

public void forgotPasswordLink(){
	iWillWaitToSee(By.cssSelector("a.auth0-lock-alternative-link"));
	clickElement(driver.findElement(By.cssSelector("a.auth0-lock-alternative-link")));
}
public void resetPasswordMsg(String text){
	iWillWaitToSee(By.xpath("//*[contains(text(),'"+text+"')]"));
	Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]"))));
}


public void EmailFieldVerificationOnForgotPasswordPage(){
	Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//input[@name='email']"))));
}


public void sendEmailButtonVerification(){
	Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//button[@type='submit']"))));
}
public void backButtonOnForgotPasswordPageVerification(){
	Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector(".auth0-lock-back-button"))));
}
public void iClickOnBackButtonOnForgotPassPage(){
	clickElement(driver.findElement(By.cssSelector(".auth0-lock-back-button")));
}
public void iEnterEmailToCreatePass(String userRole){
	iWillWaitToSee(By.xpath("//input[@name='email']"));
	driver.findElement(By.xpath("//input[@name='email']")).clear();
	if(userRole.contains("Super Admin")){
	String email = CreateUserPage.usersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim());
	driver.findElement(By.xpath("//input[@name='email']")).sendKeys(email);
	}
	else{
		driver.findElement(By.xpath("//input[@name='email']")).sendKeys(userRole);
	}
}
public void validationMsgForInvalidEmail() {
	Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//button[@type='submit']"))));
}
public void errorMesgValidationForInvalidCreds(String text) {
	iWillWaitToSee(By.xpath("//*[contains(text(),'"+text+"')]"));
	Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]"))));
	
}
public void clickResetPasswordButton(String arg1) throws Throwable {
	iWillWaitToSee(By.xpath("//i[@class='dropdown icon']"));
	clickElement(driver.findElement(By.xpath("//i[@class='dropdown icon']")));
	   iWillWaitToSee(By.xpath("//*[contains(text(),'"+arg1+"')]"));
	      driver.findElement(By.xpath("//*[contains(text(),'"+arg1+"')]")).click();
	  
}
public void remedyConnectPageVerification(){
	iWillWaitToSee(By.cssSelector(".flex-item.order-2.btn.logo.valentino-icon-remedy-connect"));
	Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector(".flex-item.order-2.btn.logo.valentino-icon-remedy-connect"))));
}
public void verifySearchGhostText(String text){
	Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//input[@placeholder='Search']"))));
}

}