package com.remedy.userAdmin;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
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
		if(userRole.lastIndexOf("-") == userRole.indexOf("-"))
		{
			driver.navigate().refresh();
			iWillWaitToSee(By.xpath("//tr[@class='component-user-table-row']"));
			Thread.sleep(3000);
			String email = CreateUserPage.usersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim());
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='Search']")), email);
			Thread.sleep(3000);
		}
		else
		{
			String firstKey = userRole.substring(0,userRole.indexOf("-"));
			String secondKey = userRole.substring(userRole.indexOf("-")+1, userRole.lastIndexOf("-"));
			String thirdKey = userRole.substring(userRole.lastIndexOf("-")+1, userRole.length());
			if(secondKey.equals(""))
			{
				driver.navigate().refresh();
				iWillWaitToSee(By.xpath("//tr[@class='component-user-table-row']"));
				Thread.sleep(3000);
				String email = CreateUserPage.usersEmailPerRole.get(firstKey+"-"+thirdKey).get(thirdKey);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='Search']")), email);
				Thread.sleep(3000);
			}
			else
			{
				driver.navigate().refresh();
				iWillWaitToSee(By.xpath("//tr[@class='component-user-table-row']"));
				Thread.sleep(3000);
				String email = CreateUserPage.usersEmailPerRole.get(firstKey+"-"+secondKey).get(secondKey);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='Search']")), email);
				Thread.sleep(3000);
			}
		}
	}
	
	public void searchForBulkUserRole(String userRole) throws Throwable {
		driver.navigate().refresh();
		iWillWaitToSee(By.xpath("//tr[@class='component-user-table-row']"));
		Thread.sleep(3000);
		String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim());
		iFillInText(driver.findElement(By.xpath("//input[@placeholder='Search']")), email);
		Thread.sleep(3000);
	}

	public void selectUserRole(String userRole) throws Throwable {

		iWillWaitToSee(By.xpath("//tr[@class='component-user-table-row']"));
		clickElement(driver.findElement(By.xpath("//tr[@class='component-user-table-row']")));
		Thread.sleep(3000);
	}

	public void verifyNavigationToViewUserPage() throws Throwable {
		if(!isElementPresentOnPage(By.xpath("//h3[text()='Applications']")))
		{
			driver.navigate().refresh();
		}
		iWillWaitToSee(By.xpath("//h3[text()='Applications']"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//h3[text()='Applications']")));
	}

	public void verifyFirstName(String field) throws Throwable {
		iWillWaitToSee(By.xpath("//span[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+field.toLowerCase()+"\")]"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+field.toLowerCase()+"\")]")));
	}
	
	public void verifyLastName(String field) throws Throwable {
		iWillWaitToSee(By.xpath("//span[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+field.toLowerCase()+"\")]"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+field.toLowerCase()+"\")]")));
	}
	
	public void verifyPhone(String field) throws Throwable 
	{
		if(!(field.equals("")))
		{
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//*[text()[contains(.,'"+field+"')]]")));
		}
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
	public void verifyBulkNPI(String field) throws Throwable {
		if(!(field.equals("")))
		{
			if(field.equals("NPI"))
			{
				iWillWaitToSee(By.xpath("//*[text()[contains(.,'"+BulkUserCreationPage.bulkUsersNPIPerRole+"')]]"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//*[text()[contains(.,'"+BulkUserCreationPage.bulkUsersNPIPerRole+"')]]")));
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
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[@title='"+emailUser.toLowerCase()+"']")));
	}
	
	public void verifyLastLoginDate(String role) throws Throwable 
	{
		if(!(role.trim().equals("Prospective Partner Executive")))
		{
			DateTimeFormatter globalFormat = DateTimeFormatter.ofPattern("MM/dd/yyyy");
			ZoneId etZoneId = ZoneId.of("America/New_York");
			ZoneId istZoneId = ZoneId.of("Asia/Kolkata");
			LocalDateTime currentDateTime = LocalDateTime.now();
			ZonedDateTime currentISTime = currentDateTime.atZone(istZoneId);
			ZonedDateTime currentETime = currentISTime.withZoneSameInstant(etZoneId);
			System.out.println(globalFormat.format(currentISTime));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//*[text()[contains(.,'"+globalFormat.format(currentISTime)+"')]]")));
		}
	}
	
	public void verifyBulkEmail(String userRole) throws Throwable {
		String emailUser = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim());
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[@title=\""+emailUser.toLowerCase()+"\"]")));
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
			    			iWillWaitToSee(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
				    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")));
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
				    		iWillWaitToSee(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
				    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")));
				    		Thread.sleep(3000);
				    		scrollIntoViewByJS(driver.findElement(By.xpath("//h3[text()='Data Permissions']")));
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
		    			iWillWaitToSee(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
			    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")));
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
			    		iWillWaitToSee(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
			    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")));
			    		Thread.sleep(3000);
			    		scrollIntoViewByJS(driver.findElement(By.xpath("//h3[text()='Data Permissions']")));
			    		driver.findElement(By.xpath("//span[contains(text(),'"+healthSystem+"')]")).click();
			    	}
				}
			}
		}
	}

	public void i_verify_HealthSystemLocationNotPresent(String locations) throws Throwable {
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
			    			Thread.sleep(3000);
			    			Assert.assertFalse(isElementPresentOnPage(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(text(),\""+location+"\")]")));
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
				    		Assert.assertFalse(isElementPresentOnPage(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(text(),\""+location+"\")]")));
				    		Thread.sleep(3000);
				    		scrollIntoViewByJS(driver.findElement(By.xpath("//h3[text()='Data Permissions']")));
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
		    			Thread.sleep(3000);
		    			Assert.assertFalse(isElementPresentOnPage(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(text(),\""+location+"\")]")));
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
			    		Assert.assertFalse(isElementPresentOnPage(By.xpath("//div[@class='content active data-permissions-content']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//td[contains(text(),\""+location+"\")]")));
			    		Thread.sleep(3000);
			    	}
				}
			}
		}
	}
	public void verifyEditIcon() throws Throwable {
		iWillWaitToSee(By.xpath("//a[@class='edit-controls']"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[@class='edit-controls']")));
	}
	
	public void verifyDeleteUserButton() throws Throwable {
		iWillWaitToSee(By.xpath("//a[text()='Delete User']"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[text()='Delete User']")));
	}
	
	public void clickCrossButton() throws Throwable {
		driver.findElement(By.xpath("//*[name()='svg' and @fill='#48677b']//*[name()='g' and @id='iCons']")).click();
	}
	
	public void clickEditIcon() throws Throwable {
		driver.findElement(By.xpath("//a[@class='edit-controls']")).click();
	}
	
	public void verifyAllUsersButton() throws Throwable {
		iWillWaitToSee(By.xpath("//a[contains(text(),'All Users /')]"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[contains(text(),'All Users /')]")));
	}
	
	public void clickAllUserButton() {
		driver.findElement(By.xpath("//a[contains(text(),'All Users /')]")).click();
	}
	
	public void verifyLockUnlockIcon() throws Throwable {
		iWillWaitToSee(By.xpath("//*[name()='svg'][@height='23px']"));
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
					   Assert.assertTrue(isElementPresentOnPage(By.xpath("//tr/td[text()='"+st.nextToken().trim()+"']/parent::tr//span[text()='Enabled']")));   
				   }
			}
			else
			{
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//tr/td[text()='"+applicationsEnabled+"']/parent::tr//span[text()='Enabled']")));
			}
			
		}
		
	}
	
	public void verifyAppsNotVisibleOnViewUserPage(String applicationsNotVisible) throws Throwable {
		if(!(applicationsNotVisible.equals("")))
		{
			if(applicationsNotVisible.contains(","))
			{
				   StringTokenizer st = new StringTokenizer(applicationsNotVisible, ",");
				   while(st.hasMoreTokens())
				   {
					   Assert.assertFalse(isElementNotPresentOnPage(By.xpath("//td[text()='"+st.nextToken().trim()+"']")));   
				   }
			}
			else
			{
				Assert.assertFalse(isElementNotPresentOnPage(By.xpath("//td[text()='"+applicationsNotVisible+"']")));
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
				   StringTokenizer st = new StringTokenizer(applicationsDisabled, ",");
				   while(st.hasMoreTokens())
				   {
					   Assert.assertTrue(isElementPresentOnPage(By.xpath("//tr/td[text()='"+st.nextToken().trim()+"']/parent::tr/td/span[text()='Disabled']")));   
				   }
			}
			else
			{
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//tr/td[text()='"+applicationsDisabled+"']/parent::tr/td/span[text()='Disabled']")));
			}
		}
	}
public void iRefreshViewUserPage() {
	driver.navigate().refresh();
	}

public void iVerifyRemovedProgramInViewPage(String programs){
	if(!(programs.isEmpty())) {
	if(programs.contains(","))
	{
		StringTokenizer st = new StringTokenizer(programs, ",");
		while(st.hasMoreTokens())
		{
			String token = st.nextToken().trim();
	    	String program = token.substring(token.indexOf("--")+2, token.length());
	    	String healthSystem = token.substring(0, token.indexOf("--"));
	    	iWillWaitToSee(By.xpath("//div[@class='title accordion-title']"));
	    	Assert.assertFalse(isElementPresentOnPage(By.xpath("//div[@class='title accordion-title']//span[contains(text(),'"+healthSystem+"')]//span[contains(text(),'"+program+"')]")));
		}
	}
	else
	{
		String program = programs.substring(programs.indexOf("--")+2, programs.length());
    	String healthSystem = programs.substring(0, programs.indexOf("--"));
    	iWillWaitToSee(By.xpath("//div[@class='title accordion-title']"));
    	Assert.assertFalse(isElementPresentOnPage(By.xpath("//div[@class='title accordion-title']//span[contains(text(),'"+healthSystem+"')]//span[contains(text(),'"+program+"')]")));
	}
}
}

public void iClickOnLockUnlockIcon(String text){
	if(text.equals("Lock"))
	clickElement(driver.findElement(By.cssSelector(".component-lock-icon.unlocked")));
else
clickElement(driver.findElement(By.cssSelector(".component-lock-icon.locked")));
}

public void iVerifyLockedAndUnlockedUsers(String text)
{
	if(text.equals("Locked"))
	{
		iWillWaitToSee(By.xpath("//span[@class='component-lock-icon locked']"));
		Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".component-lock-icon.locked")));
	}
	else
	{
		iWillWaitToSee(By.xpath("//span[@class='component-lock-icon unlocked']"));
		Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".component-lock-icon.unlocked")));
	}
}
}

