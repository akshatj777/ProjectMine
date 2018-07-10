package com.remedy.userAdmin;

import java.awt.AWTException;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Assert;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

import stepDefination.CommonSteps;

public class MailCreateUser extends BaseClass{

	static DateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
	static Date timestamp = null;
	static String time = null;
	static String mail = "test.automatemail";
	static String email = null;
	Set<String> handles = null;

	public MailCreateUser(WebDriver driver) {
		super(driver);
	}

	public void iAmOnMailLoginPage() throws InterruptedException, AWTException {
		driver.navigate().to("https://accounts.google.com");
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			driver.manage().window().maximize();
		}
	}
	
	public void iEnterUserNameToLoginMailAccount(String role) {
		iWillWaitToSee(By.xpath("//input[@type='email']"));
		String emailVal = CreateUserPage.usersEmailPerRole.get(role).get(role.substring((role.indexOf("-")+1)).trim());
		driver.findElement(By.xpath("//input[@type='email']")).sendKeys(emailVal);
		clickElement(driver.findElement(By.xpath("//span[text()='Next']")));
	}
	
	public void iEnterUserNameToLoginMailAccountForBulkDelete(String username) {
		iWillWaitToSee(By.xpath("//input[@type='email']"));
		driver.findElement(By.xpath("//input[@type='email']")).sendKeys(username);
		clickElement(driver.findElement(By.xpath("//span[text()='Next']")));
	}
	
	public void iEnterUserNameToLoginBulkMailAccount(String username) {
		iWillWaitToSee(By.xpath("//input[@type='email']"));
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			 ((JavascriptExecutor)driver).executeScript("arguments[0].value='"+username+"';", driver.findElement(By.xpath("//input[@type='email']")));
			 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='Next']")));
		}
		else
		{
			driver.findElement(By.xpath("//input[@type='email']")).sendKeys(username);
			clickElement(driver.findElement(By.xpath("//span[text()='Next']")));
		}
	}
	
	public void iEnterPasswordToLoginMailAccount(String password) throws InterruptedException {	
		Thread.sleep(4000);
			iWillWaitToSee(By.xpath("//input[@type='password']"));
			
			if(DriverScript.Config.getProperty("Browser").equals("ie"))
			{
				driver.findElement(By.xpath("//input[@type='password']")).sendKeys(password);
				while(!(driver.findElement(By.xpath("//input[@type='password']")).getAttribute("data-initial-value").equals(password)))
				{
					driver.findElement(By.xpath("//input[@type='password']")).sendKeys(Keys.CONTROL,"a");
					driver.findElement(By.xpath("//input[@type='password']")).sendKeys(Keys.DELETE);
					driver.findElement(By.xpath("//input[@type='password']")).sendKeys(password);	
				}
				if(driver.findElements(By.xpath("//span[text()='Next']")).size()>0)
				{
					((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='Next']")));
				}
				else
				{
					((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='Sign in']")));
				}
			}
			else
			{
				driver.findElement(By.xpath("//input[@type='password']")).sendKeys(password);
				if(driver.findElements(By.xpath("//span[text()='Next']")).size()>0)
				{
					clickElement(driver.findElement(By.xpath("//span[text()='Next']")));
				}
				else
				{
					clickElement(driver.findElement(By.xpath("//span[text()='Sign in']")));
				}
			}
	}
	
	public void iClickOnMailIconOnMyAccount() {	
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			iWillWaitToSee(By.xpath("//a[@href='https://mail.google.com']"));
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[@href='https://mail.google.com']")));
		}
		else
		{
			iWillWaitToSee(By.xpath("//a[@aria-label='Mail']"));
			clickElement(driver.findElement(By.xpath("//a[@aria-label='Mail']")));
		}
	}
	
	public void iClickOnInboxUnderMail() throws InterruptedException {
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			Thread.sleep(4000);
			iWillWaitToSee(By.xpath("//a[contains(text(),'Inbox')]"));
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(text(),'Inbox')]")));
			Thread.sleep(4000);
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(text(),'Inbox')]")));
		}
		else
		{
			Thread.sleep(4000);
			iWillWaitToSee(By.xpath("//a[contains(text(),'Inbox')]"));
			clickElement(driver.findElement(By.xpath("//a[contains(text(),'Inbox')]")));
			Thread.sleep(4000);
			clickElement(driver.findElement(By.xpath("//a[contains(text(),'Inbox')]")));
		}
		
	}
	
	public void iClickOnSelectAllCheckBoxInMail() {
		iWillWaitToSee(By.xpath("//div[@class='T-Jo-auh' and @role='presentation']"));
		clickElement(driver.findElement(By.xpath("//div[@class='T-Jo-auh' and @role='presentation']")));
	}
	
	public void setNewPassword(String userRole) throws InterruptedException {
		boolean flag = false;
		do
		{
			if(flag)
			{
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
//		    			String parentWindow = driver.getWindowHandle();
//		                Set<String> handles = driver.getWindowHandles();
//		                if(!((String)handles.toArray()[0]).equals(parentWindow))
//		    			{
//		    				driver.switchTo().window((String)handles.toArray()[0]);
//		    			}
//		                delay();
		    		}
		    	}
		    	catch(Exception e)
		    	{
		    		System.out.println(e.toString());
		    	}
				driver.findElement(By.xpath("//div[@class=' G-atb D E']//div[@class='T-I J-J5-Ji W6eDmd nf T-I-ax7 L3']")).click();
				iWillWaitToSee(By.xpath("//div[text()='Mark as unread']"));
				driver.findElement(By.xpath("//div[text()='Mark as unread']")).click();
				
			}
			delay();
			driver.findElement(By.xpath("//a[contains(text(),'Inbox (')]")).click();
			iWillWaitToSee(By.xpath("//a[contains(text(),'Inbox (')]"));
			isElementPresentOnPage(By.xpath("//a[contains(text(),'Inbox (')]"));
			
			driver.findElement(By.xpath("//input[@id='gbqfq']")).sendKeys(email);
			delay();
			driver.findElement(By.xpath("//span[@class='gbqfi gb_hc']")).click();
			delay();
			iWillWaitToSee(By.xpath("//div[@class='BltHke nH oy8Mbf' and @role='main']//span/b[text()='Remedy Partners - Change Your Password']"));
	    	Assert.assertTrue(isElementPresentOnPage((By.xpath("//div[@class='BltHke nH oy8Mbf' and @role='main']//span/b[text()='Remedy Partners - Change Your Password']"))));
	    	iWillWaitToSee(By.xpath("//div[@class='BltHke nH oy8Mbf' and @role='main']//span/b[text()='Remedy Partners - Change Your Password']"));
			Thread.sleep(3000);
			if(driver.findElement(By.xpath("//div[@class='BltHke nH oy8Mbf' and @role='main']//span/b[text()='Remedy Partners - Change Your Password']")).isEnabled())
			{
				if(DriverScript.Config.getProperty("Browser").equals("ie"))
				{
					((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='BltHke nH oy8Mbf' and @role='main']//span/b[text()='Remedy Partners - Change Your Password']")));
				}
				else
				{
					driver.findElement(By.xpath("//div[@class='BltHke nH oy8Mbf' and @role='main']//span/b[text()='Remedy Partners - Change Your Password']")).click();
				}
			}
			iWillWaitToSee(By.xpath("//a[contains(text(),'"+"Change My Password"+"')]"));
			Assert.assertTrue(isElementPresentOnPage((By.xpath("//a[contains(text(),'"+"Change My Password"+"')]"))));
			if(DriverScript.Config.getProperty("Browser").equals("ie"))
			{
				iWillWaitToSee(By.xpath("//a[contains(text(),'"+"Change My Password"+"')]"));
				((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(text(),'"+"Change My Password"+"')]")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//a[contains(text(),'"+"Change My Password"+"')]"));
				clickElement(driver.findElement((By.xpath("//a[contains(text(),'"+"Change My Password"+"')]"))));
			}
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
//					Thread.sleep(3000);
//					if(!((String)handles.toArray()[handles.size()-1]).equals(parentWindow))
//					{
//						Thread.sleep(3000);
//						while(!(driver.getWindowHandle().equals((String)handles.toArray()[handles.size()-1])))
//						{
//							Thread.sleep(3000);
//							driver.switchTo().window((String)handles.toArray()[handles.size()-1]);
//						}
//					}
//					Thread.sleep(3000);
//					System.out.println(driver.getTitle());
					handles=driver.getWindowHandles();
					driver.manage().window().maximize();
					Thread.sleep(3000);
				}
			}
			catch(Exception e)
			{
				System.out.println(e.toString());
			}
			System.out.println(CreateUserPage.usersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim()).toLowerCase());
			if(driver.findElements(By.xpath("//span[text()='"+CreateUserPage.usersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim()).toLowerCase()+"']")).size()==0)
			{
				flag=true;
			}
		}
		while(driver.findElements(By.xpath("//span[text()='"+CreateUserPage.usersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim()).toLowerCase()+"']")).size()==0);
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			Thread.sleep(3000);
			iWillWaitToSee(By.name("password"));
			System.out.println("Hello");
			new Actions(driver).sendKeys(driver.findElement(By.xpath("//input[@placeholder='your new password']")), "Testing1@").build().perform();
		}
		else
		{
			iWillWaitToSee(By.name("password"));
			iFillInText(driver.findElement(By.name("password")), "Testing1@");
		}
		
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			iWillWaitToSee(By.xpath("//input[@placeholder='confirm your new password']"));
			new Actions(driver).sendKeys(driver.findElement(By.xpath("//input[@placeholder='confirm your new password']")), "Testing1@").build().perform();
		}
		else
		{
			iWillWaitToSee(By.xpath("//input[@placeholder='confirm your new password']"));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='confirm your new password']")), "Testing1@");
		}
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			iWillWaitToSee(By.xpath("//button[@type='submit']"));
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//button[@type='submit']")));
		}
		else
		{
			iWillWaitToSee(By.xpath("//button[@type='submit']"));
			clickElement(driver.findElement(By.xpath("//button[@type='submit']")));
		}
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
//	    			String parentWindow = driver.getWindowHandle();
//	                Set<String> handles = driver.getWindowHandles();
//	                if(!((String)handles.toArray()[0]).equals(parentWindow))
//	    			{
//	    				driver.switchTo().window((String)handles.toArray()[0]);
//	    			}
//	                delay();
	    		}
	    	}
	    	catch(Exception e)
	    	{
	    		System.out.println(e.toString());
	    	}
			driver.findElement(By.xpath("//div[@class=' G-atb D E']//div[@class='T-I J-J5-Ji nX T-I-ax7 T-I-Js-Gs  W6eDmd']")).click();
//			iWillWaitToSee(By.xpath("//div[@role='menuitem']/div[text()='Trash']"));
//			driver.findElement(By.xpath("//div[@role='menuitem']/div[text()='Trash']")).click();
		}
	
	public void verifyAccountUA(String role) throws InterruptedException
	{
		scrollIntoViewByJS(driver.findElement(By.xpath("//span/b[contains(text(),'Verify your account')]")));
		Assert.assertTrue(isElementPresentOnPage((By.xpath("//span/b[contains(text(),'Verify your account')]"))));
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			iWillWaitToSee(By.xpath("//span/b[contains(text(),'Verify your account')]"));
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span/b[contains(text(),'Verify your account')]")));
		}
		else
		{
			iWillWaitToSee(By.xpath("//span/b[contains(text(),'Verify your account')]"));
			clickElement(driver.findElement(By.xpath("//span/b[contains(text(),'Verify your account')]")));
		}
		iWillWaitToSee(By.xpath("//a[contains(text(),'"+"Confirm My Account!"+"')]"));
		Assert.assertTrue(isElementPresentOnPage((By.xpath("//a[contains(text(),'"+"Confirm My Account!"+"')]"))));
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			iWillWaitToSee(By.xpath("//a[contains(text(),'"+"Confirm My Account!"+"')]"));
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(text(),'"+"Confirm My Account!"+"')]")));
		}
		else
		{
			iWillWaitToSee(By.xpath("//a[contains(text(),'"+"Confirm My Account!"+"')]"));
			clickElement(driver.findElement((By.xpath("//a[contains(text(),'"+"Confirm My Account!"+"')]"))));
		}
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
		Thread.sleep(2000);
		
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			iWillWaitToSee(By.xpath("//input[@name='email']"));
			driver.findElement(By.xpath("//input[@name='email']")).sendKeys(email);
			while(!(driver.findElement(By.xpath("//input[@name='email']")).getAttribute("value").equals(email)))
			{
				driver.findElement(By.xpath("//input[@name='email']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@name='email']")).sendKeys(Keys.DELETE);
				driver.findElement(By.xpath("//input[@name='email']")).sendKeys(email);
			}
			iWillWaitToSee(By.xpath("//button[@type='submit']"));
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//button[@type='submit']")));
			Thread.sleep(3000);
		}
		else
		{
			iWillWaitToSee(By.xpath("//input[@name='email']"));
			driver.findElement(By.xpath("//input[@name='email']")).sendKeys(email);
			iWillWaitToSee(By.xpath("//button[@type='submit']"));
			clickElement(driver.findElement(By.xpath("//button[@type='submit']")));
			Thread.sleep(3000);
		}
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
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			driver.findElements(By.xpath("//div[@class='T-I J-J5-Ji T-I-Js-IF W6eDmd ns T-I-ax7 L3']")).get(1).click();
			iWillWaitToSee(By.xpath("//div[@role='menuitem']/div[text()='Trash']"));
			driver.findElement(By.xpath("//div[@role='menuitem']/div[text()='Trash']")).click();
			Thread.sleep(4000);
			iWillWaitToSee(By.xpath("//a[contains(text(),'Inbox')]"));
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(text(),'Inbox')]")));
			Thread.sleep(4000);
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(text(),'Inbox')]")));
		}
		else
		{
			driver.findElements(By.xpath("//div[@class='T-I J-J5-Ji T-I-Js-IF W6eDmd ns T-I-ax7 L3']")).get(1).click();
			iWillWaitToSee(By.xpath("//div[@role='menuitem']/div[text()='Trash']"));
			driver.findElement(By.xpath("//div[@role='menuitem']/div[text()='Trash']")).click();
			Thread.sleep(4000);
			iWillWaitToSee(By.xpath("//a[contains(text(),'Inbox')]"));
			clickElement(driver.findElement(By.xpath("//a[contains(text(),'Inbox')]")));
			Thread.sleep(4000);
			clickElement(driver.findElement(By.xpath("//a[contains(text(),'Inbox')]")));
		}
	}
	
	public void iClickOnDeleteIconInMail() {
		iWillWaitToSee(By.xpath("//div[@class='T-Jo-auh' and @role='presentation']"));
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='T-Jo-auh' and @role='presentation']")));
		}
		else
		{
			clickElement(driver.findElement(By.xpath("//div[@class='T-Jo-auh' and @role='presentation']")));
		}
		delay();
		boolean flag = driver.findElement(By.xpath("//div[@aria-label='Delete']")).isDisplayed();
		if(flag==true)
		{
			if(DriverScript.Config.getProperty("Browser").equals("ie"))
			{
				((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@aria-label='Delete']")));
			}
			else
			{
				clickElement(driver.findElement(By.xpath("//div[@aria-label='Delete']")));
			}
		}
	}
	
	public void iSignOutFromMailAccount() {
		try
		{
			iWillWaitToSee(By.cssSelector("div>div>a[role=button]>span"));
			if(DriverScript.Config.getProperty("Browser").equals("ie"))
			{
				((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.cssSelector("div>div>a[role=button]>span")));
				delay();
				((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.cssSelector("#gb_71")));
				delay();
			}
			else
			{
				clickElement(driver.findElement(By.cssSelector("div>div>a[role=button]>span")));
				delay();
				clickElement(driver.findElement(By.cssSelector("#gb_71")));
				delay();
			}
			if(!(new WebDriverWait(driver,10).until(ExpectedConditions.alertIsPresent())==null))
			{
				Alert alt = driver.switchTo().alert();
				  alt.accept();
			}
			iWillWaitToSee(By.id("headingText"));
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	public void iEnterEmailToCreateUser(String emailName) {
		if(emailName.equalsIgnoreCase("test.automatemail"))
			{
			email = emailName+"+"+RandomStringUtils.randomAlphabetic(8)+"@gmail.com";
			iWillWaitToSee(By.xpath("//input[@placeholder='Email']"));
			driver.findElement(By.xpath("//input[@placeholder='Email']")).sendKeys(email);
			}
		else if(emailName.equalsIgnoreCase("test.automatemail2"))
		{
				email = emailName+"+"+RandomStringUtils.randomAlphabetic(8)+"@gmail.com";
				iWillWaitToSee(By.xpath("//input[@placeholder='Email']"));
				driver.findElement(By.xpath("//input[@placeholder='Email']")).sendKeys(email);
		}
		else if(emailName.equalsIgnoreCase("test.automatemail3"))
		{
				email = emailName+"+"+RandomStringUtils.randomAlphabetic(8)+"@gmail.com";
				iWillWaitToSee(By.xpath("//input[@placeholder='Email']"));
				driver.findElement(By.xpath("//input[@placeholder='Email']")).sendKeys(email);
		}
		else if(emailName.contains("qaautomation"))
		{
				email = "qaautomation"+"+"+RandomStringUtils.randomAlphabetic(8)+"@remedypartners.com";
				iWillWaitToSee(By.xpath("//input[@placeholder='Email']"));
				driver.findElement(By.xpath("//input[@placeholder='Email']")).sendKeys(email);
		}
		else if(emailName.equals("EqualsTo76Char"))
		{
			email = "test.automatemail"+"+"+RandomStringUtils.randomAlphabetic(48)+"@gmail.com";
			iWillWaitToSee(By.xpath("//input[@placeholder='Email']"));
			driver.findElement(By.xpath("//input[@placeholder='Email']")).sendKeys(email);
		}
		else
			{
			iWillWaitToSee(By.xpath("//input[@placeholder='Email']"));
			driver.findElement(By.xpath("//input[@placeholder='Email']")).sendKeys(emailName);
			}
	}
	
	public void iVerifyAccountVerificationMailInInboxInMyAccount() throws InterruptedException {
		scrollIntoViewByJS(driver.findElement(By.xpath("//span/b[contains(text(),'Verify your account')]")));
		Assert.assertTrue(isElementPresentOnPage((By.xpath("//span/b[contains(text(),'Verify your account')]"))));
	}
	
	public void verifyAccountForAllCreatedUsers() throws InterruptedException {
		List<String> keyList = new ArrayList<String>(CreateUserPage.usersEmailPerRole.keySet());
		for(int i=0;i<keyList.size();i++)
		{
			Assert.assertTrue(isElementPresentOnPage((By.xpath("//span/b[contains(text(),'Verify your account')]"))));
			iWillWaitToSee(By.xpath("//span/b[contains(text(),'Verify your account')]"));
			clickElement(driver.findElement(By.xpath("//span/b[contains(text(),'Verify your account')]")));
			iWillWaitToSee(By.xpath("//a[contains(text(),'Confirm my account!')]"));
			Assert.assertTrue(isElementPresentOnPage((By.xpath("//a[contains(text(),'Confirm my account!')]"))));
			iWillWaitToSee(By.xpath("//a[contains(text(),'Confirm my account!')]"));
			clickElement(driver.findElement((By.xpath("//a[contains(text(),'Confirm my account!')]"))));
			new CommonSteps().iSwitchoNewWindow();
			String key1 = keyList.get(i);
		    String value = CreateUserPage.usersEmailPerRole.get(key1).get(key1.substring((key1.indexOf("-")+1)).trim());
		    iWillWaitToSee(By.xpath("//input[@name='email']"));
			driver.findElement(By.xpath("//input[@name='email']")).sendKeys(value);
			iWillWaitToSee(By.xpath("//button[@type='submit']"));
			clickElement(driver.findElement(By.xpath("//button[@type='submit']")));
			Thread.sleep(3000);
			new CommonSteps().iSwitchBackToOLDWindow();
			Thread.sleep(4000);
			iWillWaitToSee(By.xpath("//a[contains(text(),'Inbox')]"));
			clickElement(driver.findElement(By.xpath("//a[contains(text(),'Inbox')]")));
			Thread.sleep(4000);
			clickElement(driver.findElement(By.xpath("//a[contains(text(),'Inbox')]")));
			iWillWaitToSee(By.xpath("//a[contains(text(),'Inbox (')]"));
			isElementPresentOnPage(By.xpath("//a[contains(text(),'Inbox (')]"));
			iWillWaitToSee(By.xpath("//span[contains(text(),'Remedy Partners - Change Your Password We recently received a request to create')]"));
	    	Assert.assertTrue(isElementPresentOnPage((By.xpath("//span[contains(text(),'Remedy Partners - Change Your Password We recently received a request to create')]"))));
	    	iWillWaitToSee(By.xpath("//span[contains(text(),'Remedy Partners - Change Your Password')]"));
			Thread.sleep(3000);
			if(driver.findElement(By.xpath("//span[contains(text(),'Remedy Partners - Change Your Password')]")).isEnabled())
			{
				clickElement(driver.findElement(By.xpath("//span[contains(text(),'Remedy Partners - Change Your Password')]")));
			}
			iWillWaitToSee(By.xpath("//a[contains(text(),'Change my password')]"));
			Assert.assertTrue(isElementPresentOnPage((By.xpath("//a[contains(text(),'Change my password')]"))));
			iWillWaitToSee(By.xpath("//a[contains(text(),'Change my password')]')]"));
			clickElement(driver.findElement((By.xpath("//a[contains(text(),'Change my password')]')]"))));
			new CommonSteps().iSwitchoNewWindow();
			iWillWaitToSee(By.name("password"));
			iFillInText(driver.findElement(By.name("password")), "Testing1");
			iWillWaitToSee(By.xpath("//input[@placeholder='confirm your new password']"));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='confirm your new password']")), "Testing1");
			iWillWaitToSee(By.xpath("//button[@type='submit']"));
			clickElement(driver.findElement(By.xpath("//button[@type='submit']")));
			Thread.sleep(3000);
		}
	}
	
	public void iClickOnAccountVerificationMailInInboxInMyAccount() {
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			iWillWaitToSee(By.xpath("//span/b[contains(text(),'Verify your account')]"));
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span/b[contains(text(),'Verify your account')]")));
		}
		else
		{
			iWillWaitToSee(By.xpath("//span/b[contains(text(),'Verify your account')]"));
			clickElement(driver.findElement(By.xpath("//span/b[contains(text(),'Verify your account')]")));
		}
	}
	
	public void iVerifyLinkInMailContentInInboxInMyAccount(String text) {
		iWillWaitToSee(By.xpath("//a[contains(text(),'"+text+"')]"));
		Assert.assertTrue(isElementPresentOnPage((By.xpath("//a[contains(text(),'"+text+"')]"))));
	}
	
	public void iClickOnLinkInMailContentInInboxInMyAccount(String text) {
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			iWillWaitToSee(By.xpath("//a[contains(text(),'"+text+"')]"));
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(text(),'"+text+"')]")));
		}
		else
		{
			iWillWaitToSee(By.xpath("//a[contains(text(),'"+text+"')]"));
			clickElement(driver.findElement((By.xpath("//a[contains(text(),'"+text+"')]"))));
		}
	}
	
	public void iEnterEmailToGeneratePasswordLinkForBulkUsers(String role) {
		String emailVal = CreateUserPage.usersEmailPerRole.get(role).get(role.substring((role.indexOf("-")+1)).trim());
		iWillWaitToSee(By.xpath("//input[@name='email']"));
		driver.findElement(By.xpath("//input[@name='email']")).sendKeys(emailVal);
	}
	

	public void iEnterEmailToGeneratePasswordLink() throws InterruptedException {
			Thread.sleep(2000);
			iWillWaitToSee(By.xpath("//input[@name='email']"));
			driver.findElement(By.xpath("//input[@name='email']")).sendKeys(email);
	}
	
	public void iClickOnSendEmailButton() throws InterruptedException {
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			iWillWaitToSee(By.xpath("//button[@type='submit']"));
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//button[@type='submit']")));
			Thread.sleep(3000);
		}
		else
		{
			iWillWaitToSee(By.xpath("//button[@type='submit']"));
			clickElement(driver.findElement(By.xpath("//button[@type='submit']")));
			Thread.sleep(3000);
		}

	}
	
	public void i_Verify_The_Unread_Mail_In_Inbox_In_My_Account(){
		iWillWaitToSee(By.xpath("//a[contains(text(),'Inbox (')]"));

		isElementPresentOnPage(By.xpath("//a[contains(text(),'Inbox (')]"));

	}
	
	public void iVerifyChangePasswordMailinInboxInMyAccount() {
		iWillWaitToSee(By.xpath("//span/b[text()='Remedy Partners - Change Your Password']"));
    	Assert.assertTrue(isElementPresentOnPage((By.xpath("//span/b[text()='Remedy Partners - Change Your Password']"))));
	}
	
	public void iClickOnChangePasswordMailInInboxInMyAccount() throws InterruptedException {
		iWillWaitToSee(By.xpath("//span/b[text()='Remedy Partners - Change Your Password']"));
		Thread.sleep(3000);
		if(driver.findElement(By.xpath("//span/b[text()='Remedy Partners - Change Your Password']")).isEnabled())
		{
			if(DriverScript.Config.getProperty("Browser").equals("ie"))
			{
				((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span/b[text()='Remedy Partners - Change Your Password']")));
			}
			else
			{
				clickElement(driver.findElement(By.xpath("//span/b[text()='Remedy Partners - Change Your Password']")));
			}
		}
	}
	
	public void iEnterNewPasswordToSetNewPassword(String text) throws InterruptedException {
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			Thread.sleep(3000);
			iWillWaitToSee(By.name("password"));
			System.out.println("Hello");
			new Actions(driver).sendKeys(driver.findElement(By.xpath("//input[@placeholder='your new password']")), text).build().perform();
		}
		else
		{
			iWillWaitToSee(By.name("password"));
			iFillInText(driver.findElement(By.name("password")), text);
		}
	}
	
	public void iEnterConfirmNewPasswordToSetNewPassword(String text) {
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			iWillWaitToSee(By.xpath("//input[@placeholder='confirm your new password']"));
			new Actions(driver).sendKeys(driver.findElement(By.xpath("//input[@placeholder='confirm your new password']")), text).build().perform();
		}
		else
		{
			iWillWaitToSee(By.xpath("//input[@placeholder='confirm your new password']"));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='confirm your new password']")), text);
		}
		
	}
	
	public void iEnterNewUserEmailForLoginToRemedy(String role) {
		String emailVal = CreateUserPage.usersEmailPerRole.get(role).get(role.substring((role.indexOf("-")+1)).trim());
		iWillWaitToSee(By.xpath("//input[@name='email']"));
		iFillInText(driver.findElement(By.xpath("//input[@name='email']")), emailVal);
	}
	
	public void iEnterNewPasswordForLoginToRemedy() {
		iWillWaitToSee(By.xpath("//input[@name='password']"));
		iFillInText(driver.findElement(By.xpath("//input[@name='password']")), "Testing1@");
	}
	
	public void iOpenNewTabAndCloseLastTab() throws AWTException, InterruptedException, IOException {		

	    if(DriverScript.Config.getProperty("Browser").equals("chrome"))
	    {
	    	driver.get("chrome://settings/clearBrowserData");
		    Thread.sleep(10000);
		    driver.findElement(By.cssSelector("* /deep/ #clearBrowsingDataConfirm")).click();
		    Thread.sleep(10000);
	    }
	}
}