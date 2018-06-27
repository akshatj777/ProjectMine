package com.remedy.userAdmin;


import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

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

    public void iVerifyTextforTiles(String text){
    	//iWillWaitToSee(By.cssSelector(".title>p"));
    	delay();
       	if(text.isEmpty()!=true){
    		verifyTextForElementfromList(".description", text);
    	}
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
//				Thread.sleep(3000);
//				if(!((String)handles.toArray()[handles.size()-1]).equals(parentWindow))
//				{
//					Thread.sleep(3000);
//					while(!(driver.getWindowHandle().equals((String)handles.toArray()[handles.size()-1])))
//					{
//						Thread.sleep(3000);
//						driver.switchTo().window((String)handles.toArray()[handles.size()-1]);
//					}
//				}
//				Thread.sleep(3000);
//				System.out.println(driver.getTitle());
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
//    			String parentWindow = driver.getWindowHandle();
//                Set<String> handles = driver.getWindowHandles();
//                if(!((String)handles.toArray()[0]).equals(parentWindow))
//    			{
//    				driver.switchTo().window((String)handles.toArray()[0]);
//    			}
//                delay();
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
    		iWillWaitToSee(By.xpath("//i[@class='btn btn-menu valentino-icon-profile']"));
    		clickElement(driver.findElement(By.xpath("//i[@class='btn btn-menu valentino-icon-profile']")));
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
    	iWillWaitToSee(By.xpath("//i[@class='btn btn-menu valentino-icon-profile']"));
	      driver.findElement(By.xpath("//i[@class='btn btn-menu valentino-icon-profile']")).click();
	      Thread.sleep(3000);
	      if(link.equals("Log Out"))
	      {
	    	  if(DriverScript.Config.getProperty("Browser").equals("ie"))
	    	  {
	    		  ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[@ng-click='user.logout()']")));  
	    	  }
	    	  else
	    	  {
	    		  driver.findElement(By.xpath("//a[@ng-click='user.logout()']")).click();
	    	  }
	      }
	      else if(link.equals("Reset Password"))
	      {
	    	  if(DriverScript.Config.getProperty("Browser").equals("ie"))
	    	  {
	    		  ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(@ng-click,'valentino.reset-password')]")));
	    	  }
	    	  else
	    	  {
	    		  driver.findElement(By.xpath("//a[contains(@ng-click,'valentino.reset-password')]")).click();
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
}