package com.remedy.userAdmin;

import java.util.StringTokenizer;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.interactions.Actions;

import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.Then;

public class ViewUserPage extends BaseClass {

	public ViewUserPage(WebDriver driver) {
		super(driver);
	}

	public void searchForUserRole(String userRole) throws Throwable {
		driver.navigate().refresh();
		iWillWaitToSee(By.xpath("//tr[@class='component-user-table-row']"));
		Thread.sleep(3000);
		String email = CreateUserPage.usersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim());
		iFillInText(driver.findElement(By.xpath("//input[@placeholder='Search']")), email);
		Thread.sleep(3000);
	}

	public void selectUserRole(String userRole) throws Throwable {
		String email = CreateUserPage.usersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim());
		iWillWaitToSee(By.xpath("//tr[@class='component-user-table-row']"));
		clickElement(driver.findElement(By.xpath("//tr[@class='component-user-table-row']")));
		Thread.sleep(3000);
	}

	public void verifyNavigationToViewUserPage() throws Throwable {
		iWillWaitToSee(By.xpath("//h3[text()='Applications']"));
		isElementPresentOnPage(By.xpath("//h3[text()='Applications']"));
	}

	public void verifyFirstName(String field) throws Throwable {
		isElementPresentOnPage(By.xpath("//span[text()=', "+field+"']"));
	}
	
	public void verifyLastName(String field) throws Throwable {
		isElementPresentOnPage(By.xpath("//span[text()='"+field+"']"));
	}
	
	public void verifyRole(String field) throws Throwable {
		if(!(field.equals("")))
		{
			if(field.equals("NPI"))
			{
				iWillWaitToSee(By.xpath("//*[text()[contains(.,'"+CreateUserPage.userNPI+"')]]"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//*[text()[contains(.,'"+CreateUserPage.userNPI+"')]]")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//*[text()[contains(.,'"+field+"')]]"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//*[text()[contains(.,'"+field+"')]]")));
			}
		}
	}
	
	public void verifyEmail(String email, String userRole) throws Throwable {
		String emailUser = CreateUserPage.usersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim());
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[@title='"+emailUser+"']")));
	}

	public void verifyHealthSystem(String healthSystem) throws Throwable {
		
		if(!(healthSystem.equals("")))
		{
			if(healthSystem.contains(","))
			{
				StringTokenizer st = new StringTokenizer(healthSystem, ",");
				while(st.hasMoreTokens())
				{
					String app = st.nextToken().trim();
					iWillWaitToSee(By.xpath("//span[contains(text(),'"+app+"')]"));
					Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[contains(text(),'"+app+"')]")));
				}
			}
			else
			{
				iWillWaitToSee(By.xpath("//span[contains(text(),'"+healthSystem+"')]"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[contains(text(),'"+healthSystem+"')]")));
			}
		}
	}
	
	public void verifyPrograms(String programs) throws Throwable {
		if(!(programs.equals("")))
		{
			if(programs.contains(","))
			{
				StringTokenizer st = new StringTokenizer(programs, ",");
				while(st.hasMoreTokens())
				{
					String token = st.nextToken().trim();
			    	String program = token.substring(token.indexOf("--")+2, token.length());
			    	String healthSystem = token.substring(0, token.indexOf("--"));
			    	iWillWaitToSee(By.xpath("//div[@class='title accordion-title']//span[contains(text(),'"+healthSystem+"')]//span[contains(text(),'"+program+"')]"));
			    	Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='title accordion-title']//span[contains(text(),'"+healthSystem+"')]//span[contains(text(),'"+program+"')]")));
				}
			}
			else
			{
				String program = programs.substring(programs.indexOf("--")+2, programs.length());
		    	String healthSystem = programs.substring(0, programs.indexOf("--"));
		    	iWillWaitToSee(By.xpath("//div[@class='title accordion-title']//span[contains(text(),'"+healthSystem+"')]//span[contains(text(),'"+program+"')]"));
		    	Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='title accordion-title']//span[contains(text(),'"+healthSystem+"')]//span[contains(text(),'"+program+"')]")));
			}
		}
	}
	
	public void verifyHealthSystemLocation(String locations) throws Throwable {
		if(!(locations.equals("")))
		{
			if(locations.contains(","))
			{
				StringTokenizer st = new StringTokenizer(locations, ",");
				while(st.hasMoreTokens())
				{
					String token = st.nextToken().trim();
					String healthSystem = token.substring(0, token.indexOf("--"));
					String BPID = token.substring(token.indexOf("--")+2, token.lastIndexOf("--"));
					String location = token.substring(token.lastIndexOf("--")+2, token.length());
			    	if(DriverScript.Config.getProperty("Browser").equals("ie"))
			    	{
			    		((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[contains(text(),'"+healthSystem+"')]")));
			    		Thread.sleep(3000);
			    		if(driver.findElement(By.xpath("//div[@class='content active data-permissions-content']//input")).isDisplayed())
			    		{
			    			new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active data-permissions-content']//input")), location).build().perform();
			    			while(!(driver.findElement(By.xpath("//div[@class='content active data-permissions-content']//input")).getAttribute("value")).equals(location))
			    			{
			    				((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
			    				new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active data-permissions-content']//input")), location).build().perform();
			    			}
			    			iWillWaitToSee(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(text(),\""+location+"\")]"));
				    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(text(),\""+location+"\")]")));
				    		Thread.sleep(3000);
				    		((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[contains(text(),'"+healthSystem+"')]")));
			    		}
			    	}
			    	else
			    	{
			    		driver.findElement(By.xpath("//span[contains(text(),'"+healthSystem+"')]")).click();
				    	Thread.sleep(3000);
				    	if(driver.findElement(By.xpath("//div[@class='content active data-permissions-content']//input")).isDisplayed())
				    	{
				    		driver.findElement(By.xpath("//div[@class='content active data-permissions-content']//input")).sendKeys(location);
				    		Thread.sleep(3000);
				    		iWillWaitToSee(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(text(),\""+location+"\")]"));
				    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(text(),\""+location+"\")]")));
				    		Thread.sleep(3000);
				    		driver.findElement(By.xpath("//span[contains(text(),'"+healthSystem+"')]")).click();
				    	}
			    	}
				}
			}
			else
			{
				String healthSystem = locations.substring(0, locations.indexOf("--"));
				String BPID = locations.substring(locations.indexOf("--")+2, locations.lastIndexOf("--"));
				String location = locations.substring(locations.lastIndexOf("--")+2, locations.length());
				if(DriverScript.Config.getProperty("Browser").equals("ie"))
				{
					((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[contains(text(),'"+healthSystem+"')]")));
		    		Thread.sleep(3000);
		    		if(driver.findElement(By.xpath("//div[@class='content active data-permissions-content']//input")).isDisplayed())
		    		{
		    			new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active data-permissions-content']//input")), location).build().perform();
		    			while(!(driver.findElement(By.xpath("//div[@class='content active data-permissions-content']//input")).getAttribute("value")).equals(location))
		    			{
		    				((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
		    				new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active data-permissions-content']//input")), location).build().perform();
		    			}
		    			iWillWaitToSee(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(text(),\""+location+"\")]"));
			    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(text(),\""+location+"\")]")));
			    		Thread.sleep(3000);
			    		((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[contains(text(),'"+healthSystem+"')]")));
		    		}
				}
				else
				{
					driver.findElement(By.xpath("//span[contains(text(),'"+healthSystem+"')]")).click();
					Thread.sleep(3000);
					if(driver.findElement(By.xpath("//div[@class='content active data-permissions-content']//input")).isDisplayed())
			    	{
			    		driver.findElement(By.xpath("//div[@class='content active data-permissions-content']//input")).sendKeys(location);
			    		Thread.sleep(3000);
			    		iWillWaitToSee(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(text(),\""+location+"\")]"));
			    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(text(),\""+location+"\")]")));
			    		Thread.sleep(3000);
			    	}
				}
			}
		}
	}
	
	public void verifyEditIcon() throws Throwable {
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[@class='edit-controls']")));
	}
	
	public void verifyDeleteUserButton() throws Throwable {
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[text()='Delete User']")));
	}
	
	public void clickCrossButton() throws Throwable {
		driver.findElement(By.xpath("//*[name()='svg' and @fill='#48677b']//*[name()='g' and @id='iCons']")).click();
	}
	
	public void clickEditIcon() throws Throwable {
		driver.findElement(By.xpath("//a[@class='edit-controls']")).click();
	}
	
	public void verifyAllUsersButton() throws Throwable {
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[contains(text(),'All Users /')]")));
	}
	
	public void clickAllUserButton() {
		driver.findElement(By.xpath("//a[contains(text(),'All Users /')]")).click();
	}
	
	public void verifyLockUnlockIcon() throws Throwable {
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//*[name()='svg'][@height='23px']")));
	}
	
	public void verifyEnabledApplications(String applicationsEnabled) throws Throwable {
		if(!(applicationsEnabled.equals("")))
		{
			if(applicationsEnabled.contains(","))
			{
				   StringTokenizer st = new StringTokenizer(applicationsEnabled, ",");
				   while(st.hasMoreTokens())
				   {
					   isElementPresentOnPage(By.xpath("//tr/td[text()='"+st.nextToken().trim()+"']/parent::tr/td[text()='Enabled']"));   
				   }
			}
			else
			{
				isElementPresentOnPage(By.xpath("//tr/td[text()='"+applicationsEnabled+"']/parent::tr/td[text()='Enabled']"));
			}
			
		}
		
	}
	
	public void verifyLearningPathway(String learningPathway) throws Throwable {
		if(!(learningPathway.equals("")))
		{
			if(learningPathway.contains(","))
			{
				StringTokenizer st = new StringTokenizer(learningPathway, ",");
				   while(st.hasMoreTokens())
				   {
					   Assert.assertTrue(isElementPresentOnPage(By.xpath("//li[text()='"+st.nextToken().trim()+"']")));   
				   }
			}
			else
			{
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//li[text()='"+learningPathway+"']")));
			}
		}
	}
	
	public void verifyDisabledApplications(String applicationsDisabled) throws Throwable {
		if(!(applicationsDisabled.equals("")))
		{
			if(applicationsDisabled.contains(","))
			{
				//String applicationDisabled = CreateUserPage.usersApplicationsPerRole.get(applicationsDisabled).get(applicationsDisabled.substring((applicationsDisabled.indexOf("-")+1)));
				   StringTokenizer st = new StringTokenizer(applicationsDisabled, ",");
				   while(st.hasMoreTokens())
				   {
					   isElementPresentOnPage(By.xpath("//tr/td[text()='"+st.nextToken().trim()+"']/parent::tr/td[text()='Disabled']"));   
				   }
			}
			else
			{
				isElementPresentOnPage(By.xpath("//tr/td[text()='"+applicationsDisabled+"']/parent::tr/td[text()='Disabled']"));
			}
		}
	}
public void iRefreshViewUserPage() {
	driver.navigate().refresh();
	}
}