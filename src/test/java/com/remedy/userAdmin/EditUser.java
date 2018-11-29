package com.remedy.userAdmin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.remote.server.handler.ClickElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;
import com.remedy.userAdmin.CreateUserPage;

import net.sourceforge.htmlunit.corejs.javascript.ast.CatchClause;

public class EditUser extends BaseClass {
	DateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
	Date timestamp = new Date();
	String time = df.format(timestamp);
	String mail = "qaautomation";
	final String email = mail + "+" + time + "@remedypartners.com";
	CreateUserPage createUserPage = new CreateUserPage(driver);

	public EditUser(WebDriver driver) {

		super(driver);
	}

	public void iClickOnUser(String mail) {
		delay();
		if (mail.equalsIgnoreCase(mail)) {
			iWillWaitToSee(By.cssSelector("td.five.wide"));
			clickElement(driver.findElements(By.cssSelector("td.five.wide")).get(0));
		}
	}

	public void iClickOnEditButton() {
		iWillWaitToSee(By.cssSelector(".edit-controls"));
		clickElement(driver.findElement(By.cssSelector(".edit-controls")));
		iWillWaitToSee(By.cssSelector(".ui.primary.button"));
	}

	public void iEnterPhone(String number) {
		if(!(number.equals("")))
		{
			iWillWaitToSee(By.cssSelector("input[placeholder='Phone']"));
			driver.findElement(By.cssSelector("input[placeholder='Phone']")).clear();
			iFillInText(driver.findElement(By.cssSelector("input[placeholder='Phone']")), number);
		}
	}

	public void iVerifyThatEmailIsNonEditable() {
		iWillWaitToSee(By.xpath("//input[@placeholder='Email']"));
		Assert.assertFalse(driver.findElement(By.cssSelector("input[placeholder='Email']")).isEnabled());
	}

	public void iClickOnRoleFieldToEdit() {
		iWillWaitToSee(By.cssSelector(".ui.selection.dropdown"));
		clickElement(driver.findElement(By.cssSelector(".ui.selection.dropdown")));
	}

	public void iClickOnTab(String text) {
		iWillWaitToSee(By.xpath("//a[contains(text(),'" + text + "')]"));
		clickElement(driver.findElement(By.xpath("//a[contains(text(),'" + text + "')]")));
	}

	public void iVerifyThatApplicationsAreEditable(String app, String text) {
		delay();

		if (text.equalsIgnoreCase("Disabled")) {
			if (app.contains(",")) {
				String[] application = app.split(",\\s+");

				for (int i = 0; i < application.length; i++) {

					verifyTextForElementFromListByXpath("//*[contains(text(),'Disabled')]/preceding-sibling::td",
							application[i]);

				}
			} else {

				verifyTextForElementFromListByXpath("//*[contains(text(),'Disabled')]/preceding-sibling::td", app);

			}
		} else if (text.equalsIgnoreCase("Enabled")) {
			if (app.contains(",")) {
				String[] application = app.split(",\\s+");

				for (int i = 0; i < application.length; i++) {

					verifyTextForElementFromListByXpath("//*[contains(text(),'Enabled')]/preceding-sibling::td",
							application[i]);

				}
			} else {

				verifyTextForElementFromListByXpath("//*[contains(text(),'Enabled')]/preceding-sibling::td", app);

			}
		}
	}

	public void iClickOnDeleteOrganisation() {
		iWillWaitToSee(By.cssSelector(".remove.link.icon"));
		clickElement(driver.findElement(By.cssSelector(".remove.link.icon")));
	}

	public void iClickOnExisitingOrganisation(String text) {
		if (getElementCount(".component-participant-title") > 1) {
			if (text.contains("first")) {
				iWillWaitToSee(By.cssSelector(".component-participant-title"));
				clickElement(driver.findElements(By.cssSelector(".component-participant-title")).get(0));
			} else if (text.contains("second")) {
				iWillWaitToSee(By.cssSelector(".component-participant-title"));
				clickElement(driver.findElements(By.cssSelector(".component-participant-title")).get(1));
			} else if (text.contains("third")) {
				iWillWaitToSee(By.cssSelector(".component-participant-title"));
				clickElement(driver.findElements(By.cssSelector(".component-participant-title")).get(2));
			}
		} else {
			iWillWaitToSee(By.cssSelector(".component-participant-title"));
			clickElement(driver.findElement(By.cssSelector(".component-participant-title")));
		}
	}

	public void iClickOnExisitingOrganisationByName(String text) {

		if(!(text.equals("")))
		{
			iWillWaitToSee(By.xpath("//*[contains(text(),'" + text + "')]"));
			clickElement(driver.findElement(By.xpath("//span[contains(@class, 'component-participant-title') and contains(text(),'" + text + "')]")));
		}
	}

	public void iRemoveHealthSystemByName(String org) {
		if(!(org.equals("")))
		{
			if(org.contains(","))
			{
				StringTokenizer st = new StringTokenizer(org, ",");
				while(st.hasMoreTokens())
				{
					String token = st.nextToken().trim();
					iWillWaitToSee(By.xpath("//span[contains(@class, 'component-participant-title') and contains(text(),'" + token + "')]/i[contains(@class,'remove link icon')]"));
					clickElement(driver.findElement(By.xpath("//span[contains(@class, 'component-participant-title') and contains(text(),'"+ token + "')]/i[contains(@class,'remove link icon')]")));
					
					if (isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + "Remove" + "')]"))) == true)
						clickElement(driver.findElement(By.xpath("//*[contains(text(),'" + "Remove" + "')]")));
				}
			}
			else
			{
				iWillWaitToSee(By.xpath("//span[contains(@class, 'component-participant-title') and contains(text(),'" + org.trim()+ "')]/i[contains(@class,'remove link icon')]"));
				clickElement(driver.findElement(By.xpath("//span[contains(@class, 'component-participant-title') and contains(text(),'"+ org.trim() + "')]/i[contains(@class,'remove link icon')]")));
				if (isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + "Remove" + "')]"))) == true)
				{
					clickElement(driver.findElement(By.xpath("//*[contains(text(),'" + "Remove" + "')]")));
				}
			}
		}
	}

	public void clickAllLocationsButton(String arg) throws Throwable {

		if (arg.equals("Second")) {
			delay();
			clickElement(driver.findElements(By.xpath("//label[.='All Locations']")).get(1));
		} else if (arg.equals("Third")) {
			delay();
			clickElement(driver.findElements(By.xpath("//label[.='All Locations']")).get(2));
		}
		else {
			iWillWaitToSee(By.xpath("//label[.='All Locations']"));
			clickElement(driver.findElement(By.xpath("//label[.='All Locations']")));
		}
		delay();
	}

	public void iVerifyProductAsPerRole(String appList, String text) {
		delay();
		iWillWaitToSee(By.cssSelector(".title.one.column.row.no-padding"));
		if (text.contains("Present")) {
			if (appList.contains(",")) {
				String[] app = appList.split(",\\s+");

				for (int i = 0; i < app.length; i++) {
					Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + app[i] + "')]"))));
				}
			}

			else {
				Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + appList + "')]"))));
			}
		} else if (text.contains("Not Present")) {

			if (appList.contains(",")) {
				String[] app = appList.split(",\\s+");

				for (int i = 0; i < app.length; i++) {
					Assert.assertTrue(isElementNotPresentOnPage(By.xpath("//*[contains(text(),'" + app[i] + "')]")));
				}
			}

			else {
				Assert.assertTrue(isElementNotPresentOnPage(By.xpath("//*[contains(text(),'" + appList + "')]")));
			}
		}
	}

	public void iVerifyDownstreamProviderPermission(String text, String role) {
		if(role.equals("Downstream Provider")){
			iWillWaitToSee(By.xpath("//*[contains(text(),'" + text + "')]"));
			Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + text + "')]"))));
		}
		}
	

	public void iSeeNoResults(String text) {
		if (text.contains(".")) {
			Assert.assertTrue(isElementVisible(driver.findElements(By.cssSelector(".header")).get(1)));
			clickElement(driver.findElement(By.xpath("//div[text()='Select']")));
		} else {
			iWillWaitToSee(By.xpath("//*[contains(text(),'" + text + "')]"));
			Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + text + "')]"))));
			clickElement(driver.findElement(By.cssSelector(".remove.link.icon.remove-icon")));
			delay();
		}
	}

	public void iVerifyDisabledNextButton(String text) {
		WebElement el = driver.findElement(By.xpath("//*[contains(text(),'" + text + "')]"));
		Assert.assertFalse(el.isEnabled());
	}

	public void iVerifyNextButtonStatus(String text) 
	{
		WebElement el = driver.findElement(By.xpath("//button[contains(text(),'Next')]"));
		if (text.equalsIgnoreCase("enabled")) {
			Assert.assertTrue(el.isEnabled());
		} else {
			delay();
			Assert.assertFalse(el.isEnabled());
		}
	}

	public void iVerifySubmitButtonStatus(String text) {
		WebElement el = driver.findElement(By.xpath("//*[contains(text(),'Submit')]"));
		if (text.equalsIgnoreCase("enabled")) {
			Assert.assertTrue(el.isEnabled());
		} else {
			Assert.assertFalse(el.isEnabled());
		}
	}

	public void iVerifyleftMenuStatus(String text1, String text2) 
	{
		iWillWaitToSee(By.xpath("//a[contains(text(),'" + text1 + "')]"));
		WebElement el = driver.findElement(By.xpath("//a[contains(text(),'" + text1 + "')]"));
		

			if (text2.equalsIgnoreCase("enabled"))
			{
				Assert.assertFalse(el.getAttribute("className").toString().contains("disabled"));
			}
			else 
			{
				Assert.assertTrue(el.getAttribute("className").toString().contains("disabled"));
			}
	}

	public void iVerifyErrorMessage(String text) {
		iWillWaitToSee(By.xpath("//*[contains(text(),'" + text + "')]"));
		Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + text + "')]"))));
	}

	public void iClickOnCloseIcon() {
		clickElement(driver.findElement(By.cssSelector(".close.icon")));
	}

	public void iValidateNPI(String npi, String text) {
		iWillWaitToSee(By.xpath("//*[contains(text(),'Role:')]"));
		if (text.contains("not")) {
			Assert.assertFalse(isElementNotPresentOnPage(By.xpath("//*[contains(text(),'" + npi + "')]")));
		} else {
			Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + npi + "')]"))));
		}
	}

	public void iValidateAlertText(String text) {
		iWillWaitToSee(By.xpath("//*[contains(text(),'" + text + "')]"));
		Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + text + "')]"))));
	}

	public void iValidateCancelButton(String text) 
	{
		iWillWaitToSee(By.xpath("//*[contains(text(),'" + text + "')]"));
		Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + text + "')]"))));
	}

	public void iVerifyProductsCount(String text, int count) {
		iWillWaitToSee(By.cssSelector(".ui.checkbox"));
		int countActual = getElementCount(".ui.checkbox");
		if (text.contains("Less")) {
			Assert.assertTrue(countActual < count);
		} else {
			Assert.assertTrue(countActual > count);
		}
	}

	public void iClickOnAddAnotherOrganisation(String text) {
		if (isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + text + "')]"))) == true)
			clickElement(driver.findElement(By.xpath("//*[contains(text(),'" + text + "')]")));
	}

	public void iSearchLocByBPID(String locationList) throws InterruptedException {

		if (locationList.contains(",")) 
		{
			StringTokenizer st = new StringTokenizer(locationList, ",");
			while (st.hasMoreTokens()) 
			{
				String token = st.nextToken().trim();
				String location = token.substring(token.indexOf("--") + 2, token.length());
				String BPID = token.substring(0, token.indexOf("--"));

				delay();
				if(DriverScript.Config.getProperty("Browser").equals("ie"))
				{
					new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), BPID).build().perform();
					while(!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getAttribute("value").equals(BPID)))
					{
						((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
						new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), BPID).build().perform();
					}
					iWillWaitToSee(By.xpath("//div[@class='content active']//th[contains(text(),\"" + BPID+ "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location + "\")]"));
					((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//th[contains(text(),\"" + BPID+ "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location + "\")]")));
					Thread.sleep(3000);
				}
				else
				{
					while (!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getText().equals(""))) 
					{
						driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).clear();
					}
					delay();
					iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")),BPID);
					iWillWaitToSee(By.xpath("//div[@class='content active']//th[contains(text(),\"" + BPID+ "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location + "\")]"));
					driver.findElement(By.xpath("//div[@class='content active']//th[contains(text(),\"" + BPID+ "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location + "\")]")).click();
					Thread.sleep(3000);
				}
			}
		} 
		else 
		{
			String token = locationList;
			String location = token.substring(token.indexOf("--") + 2, token.length());
			String BPID = token.substring(0, token.indexOf("--"));
			delay();
			if(DriverScript.Config.getProperty("Browser").equals("ie"))
			{
				new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), BPID).build().perform();
				while(!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getAttribute("value").equals(BPID)))
				{
					((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
					new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), BPID).build().perform();
				}
				iWillWaitToSee(By.xpath("//div[@class='content active']//th[contains(text(),\"" + BPID+ "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location + "\")]"));
				((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//th[contains(text(),\"" + BPID+ "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location + "\")]")));
				Thread.sleep(3000);
			}
			else
			{
				while (!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getText().equals(""))) 
				{
					driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).clear();
				}
				delay();
				iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")),BPID);
				iWillWaitToSee(By.xpath("//div[@class='content active']//th[contains(text(),\"" + BPID+ "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location + "\")]"));
				driver.findElement(By.xpath("//div[@class='content active']//th[contains(text(),\"" + BPID+ "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location + "\")]")).click();
				Thread.sleep(3000);
			}
		}
	}

	public void iSearchLocByBPIDForPTA(String locationList) throws InterruptedException {

		if (locationList.contains(",")) 
		{
			StringTokenizer st = new StringTokenizer(locationList, ",");
			while (st.hasMoreTokens()) 
			{
				String token = st.nextToken().trim();
				String location = token.substring(token.indexOf("--") + 2, token.length());
				String BPID = token.substring(0, token.indexOf("--"));
				delay();
				if(DriverScript.Config.getProperty("Browser").equals("ie"))
				{
					new Actions(driver).sendKeys(driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")), BPID).build().perform();
					while(!(driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")).getAttribute("value").equals(BPID)))
					{
						((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
						new Actions(driver).sendKeys(driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")), BPID).build().perform();
					}
					iWillWaitToSee(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//th[contains(text(),\""+ BPID + "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location+ "\")]"));
					((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//th[contains(text(),\""+ BPID + "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location+ "\")]")));
					Thread.sleep(3000);
				}
				else
				{
					while (!(driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")).getText().equals("")))
					{
						driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")).clear();
					}
					delay();
					iFillInText(driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")),BPID);
					iWillWaitToSee(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//th[contains(text(),\""+ BPID + "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location+ "\")]"));
					driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//th[contains(text(),\""+ BPID + "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location+ "\")]")).click();
					Thread.sleep(3000);
				}
			}
		} 
		else 
		{
			String token = locationList;
			String location = token.substring(token.indexOf("--") + 2, token.length());
			String BPID = token.substring(0, token.indexOf("--"));
			delay();
			if(DriverScript.Config.getProperty("Browser").equals("ie"))
			{
				new Actions(driver).sendKeys(driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")), BPID).build().perform();
				while(!(driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")).getAttribute("value").equals(BPID)))
				{
					((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
					new Actions(driver).sendKeys(driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")), BPID).build().perform();
				}
				iWillWaitToSee(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//th[contains(text(),\""+ BPID + "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location+ "\")]"));
				((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//th[contains(text(),\""+ BPID + "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location+ "\")]")));
				Thread.sleep(3000);
			}
			else
			{
				while (!(driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")).getText().equals(""))) 
				{
					driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")).clear();
				}
				delay();
				iFillInText(driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")),BPID);
				iWillWaitToSee(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//th[contains(text(),\""+ BPID + "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location+ "\")]"));
				driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//th[contains(text(),\""+ BPID + "\")]/../../following-sibling::tbody//label[contains(text(),\"" + location+ "\")]")).click();
				Thread.sleep(3000);
			}
		}
	}

	public void iVerifyFacilityKey(String key) {
		if (key.contains(",")) {
			StringTokenizer st = new StringTokenizer(key, ",");
			while (st.hasMoreTokens()) {
				String tok = st.nextToken().trim();
				String token = "(" + tok + ")";
				iWillWaitToSee(By.xpath("//*[contains(text(),'" + token + "')]"));
				Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + token + "')]"))));
			}
		} else {
			String token = "(" + key + ")";
			iWillWaitToSee(By.xpath("//*[contains(text(),'" + token + "')]"));
			Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + token + "')]"))));
		}
	}

	public void iSelectLocByFacilityKey(String key) throws InterruptedException {
		if (key.contains(",")) {
			StringTokenizer st = new StringTokenizer(key, ",");

			while (st.hasMoreTokens()) {
				String token = st.nextToken().trim();
				String facToken = "(" + token + ")";
				if(DriverScript.Config.getProperty("Browser").equals("ie"))
				{
					new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), token).build().perform();
					while(!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getAttribute("value").equals("")))
					{
						((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//i[@class='remove link icon remove-icon']")));
						new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), token).build().perform();
					}
					iWillWaitToSee(By.xpath("//div[@class='content active']//label[contains(text(),\"" + facToken + "\")]"));
					((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//label[contains(text(),\"" + facToken + "\")]")));
					Thread.sleep(3000);
				}
				else
				{
					while (!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getText().equals(""))) 
					{
						driver.findElement(By.xpath("//div[@class='content active']//i[@class='remove link icon remove-icon']")).click();
					}
					delay();
					iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")),token);
					iWillWaitToSee(By.xpath("//div[@class='content active']//label[contains(text(),\"" + facToken + "\")]"));
					driver.findElement(By.xpath("//div[@class='content active']//label[contains(text(),\"" + facToken + "\")]")).click();
					Thread.sleep(3000);
				}
			}
		} 
		else 
		{
			String facilityKey = "(" + key + ")";
			if(DriverScript.Config.getProperty("Browser").equals("ie"))
			{
				new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), key).build().perform();
				while(!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getAttribute("value").equals("")))
				{
					((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//i[@class='remove link icon remove-icon']")));
					new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), key).build().perform();
				}
				iWillWaitToSee(By.xpath("//div[@class='content active']//label[contains(text(),\"" + facilityKey + "\")]"));
				((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//label[contains(text(),\"" + facilityKey + "\")]")));
				Thread.sleep(3000);
			}
			else
			{
				while (!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getText().equals(""))) 
				{
					driver.findElement(By.xpath("//div[@class='content active']//i[@class='remove link icon remove-icon']")).click();
				}
				delay();
				iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")),key);
				iWillWaitToSee(By.xpath("//div[@class='content active']//label[contains(text(),\"" + facilityKey + "\")]"));
				driver.findElement(By.xpath("//div[@class='content active']//label[contains(text(),\"" + facilityKey + "\")]")).click();
				Thread.sleep(3000);
			}
		}
	}

	public void iVerifyLearningPathwayIDIsNotPresentOnEditPage(String text) {
		Assert.assertFalse(isElementNotPresentOnPage(By.xpath("//*[contains(text(),'" + text + "']")));
	}

	public void iVerifyPTAProvisionedRoleOnEditPage() {
		String[] Roles = { "Executive", "Manager", "Case Manager", "Physicians", "Transitional Case Manager" };
		for (int i = 0; i < Roles.length; i++) {
			Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + Roles[i] + "')]"))));
		}
	}

	public void unselectLearningPath(String searchParam) throws Throwable {
		iWillWaitToSee(By.cssSelector(".ui.selection.dropdown"));
		clickElement(driver.findElement(By.cssSelector(".ui.selection.dropdown")));
		createUserPage.selectLearningPath(searchParam);
	}

	public void iVerifydataPermissionsField(String field) {
		if (field.contains(",")) {
			StringTokenizer st = new StringTokenizer(field, ",");
			while (st.hasMoreTokens()) {
				String token = st.nextToken().trim();
				iWillWaitToSee(By.xpath("//*[contains(text(),'" + token + "')]"));
				Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + token + "')]"))));
			}
		} else {
			iWillWaitToSee(By.xpath("//*[contains(text(),'" + field + "')]"));
			Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + field + "')]"))));
		}
	}

	public void selectProgramsForExistingOrg(String programList) throws Throwable 
	{
		if (!(programList.equals(""))) 
		{
			longDelay();
			if(programList.contains(","))
			{
				StringTokenizer st = new StringTokenizer(programList, ",");
				driver.findElement(By.xpath("//div[@class='content active' or @class='content']//div[@class='ui selection dropdown']")).click();
				while (st.hasMoreTokens()) 
				{
					String programs = st.nextToken().trim();
					iWillWaitToSee(By.xpath("//label[text()='" + programs + "']"));
					driver.findElement(By.xpath("//label[text()='" + programs + "']")).click();
					Thread.sleep(2000);
				}
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[@class='content active' or @class='content']//div[@class='ui selection dropdown']"));
				driver.findElement(By.xpath("//div[@class='content active' or @class='content']//div[@class='ui selection dropdown']")).click();
				iWillWaitToSee(By.xpath("//label[text()='" + programList + "']"));
				driver.findElement(By.xpath("//label[text()='" + programList + "']")).click();
				iWillWaitToSee(By.xpath("//table[@class='ui table component-bpid-table']"));
			}
		}
	}
			
	public void VerifyNPIFieldForPhysicians(String role) {
		if (role.equals("Physicians"))
			Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector("input[placeholder='NPI']"))));
	}

	public void iClickOnLearningPathwayDropdown() {
		iWillWaitToSee(By.xpath("//i[@class='select-dropdown-icon']"));
		clickElement(driver.findElement(By.xpath("//i[@class='select-dropdown-icon']")));
	}

	public void iVerifyMessageForInvalidHealthSystem() throws InterruptedException {
		Thread.sleep(3000);
		iWillWaitToSee(By.xpath("//div[text()='0 Results']/following-sibling::span[text()='Try refining your search criteria']"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='0 Results']/following-sibling::span[text()='Try refining your search criteria']")));
	}

	public void iVerifyMessageForInvalidLocation(String text) throws InterruptedException {
		if (text.equalsIgnoreCase("second")) {
			iWillWaitToSee(By.xpath("//div[text()='0 Results']"));
			Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//div[text()='0 Results']"))));
		} else if (text.equalsIgnoreCase("first")) {
			iWillWaitToSee(By.xpath("//div[text()='0 Results']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='0 Results']")));
		}
	}
	
	public void VerifyMessageForInvalidLocations() throws InterruptedException {
			iWillWaitToSee(By.xpath("//div[@class='content active']//h3[text()=' No Results Found ']"));
			Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//div[@class='content active']//h3[text()=' No Results Found ']"))));
	}
	
	public void VerifyMessageForInvalidLocationsPTAUser(String text) throws InterruptedException {
		iWillWaitToSee(By.xpath("//h3[text()=' No Results Found ']"));
		Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//h3[text()=' No Results Found ']"))));
}

	public void iVerifyIncompleteOrganisation() {
		iWillWaitToSee(By.cssSelector("span.participant-title-status"));
		String actual = getTextForElement(driver.findElement(By.cssSelector("span.participant-title-status")));
		Assert.assertEquals("(incomplete)", actual.trim());
	}
public void iVerifyIncompleteStatusNotShown() {
		
		Assert.assertFalse(isElementPresentOnPage((By.xpath("//span[@class='participant-title-status' and text()='(incomplete)']"))));
	}
	public void iClickOnSelectOrgDropdown() {
		clickElement(driver.findElement(By.cssSelector("div.ui.selection.dropdown")));
	}

	public void iSelectInvalidLoc(String location) throws InterruptedException {

		while (!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getText()
				.equals(""))) {
			driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).clear();
		}
		delay();
		iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")),
				location);
		Thread.sleep(3000);

	}

	public void iSelectInvalidLocForPTA(String location) throws InterruptedException {

		delay();
		while (!(driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")).getText().equals(""))) {
			driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")).clear();
		}
		delay();
		iFillInText(driver.findElement(By.xpath("//h5[text()='Which location(s) does this user have access to?']//../..//input[@placeholder='Search']")),location);
		Thread.sleep(3000);

	}

public void iVerifyLearningPathwayIDIsNotDisplayed(String id){
	if(!(id.isEmpty())){

		Assert.assertFalse(driver.findElements(By.cssSelector("div.ui.label")).get(0).getAttribute("innerText").toString().contains(id));
	}
}
public void iVerifyLocationDisplayedWithFacilityKey(String key, String text){
 	waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//h5[text()='Selected Locations:']/..//td[contains(text(),\""+text+"\")]"))));
 	Assert.assertTrue(driver.findElement(By.xpath("//h5[text()='Selected Locations:']/..//td[contains(text(),\""+text+"\")]")).getText().contains(key));
}
public void iVerifyLocationNotDisplayedWithFacilityKey(String key, String text){
 	waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//h5[text()='Selected Locations:']/..//td[contains(text(),\""+text+"\")]"))));
 	Assert.assertFalse(driver.findElement(By.xpath("//h5[text()='Selected Locations:']/..//td[contains(text(),\""+text+"\")]")).getText().contains(key));
}
public void iCheckErrMsgIsNotShown(String text){
	Assert.assertTrue(isElementNotPresentOnPage(text));
}
public void iEnterLearningPathway(String text){
	clickElement(driver.findElement(By.cssSelector("div.ui.selection.dropdown")));
	 iFillInText(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), text);
}
public void validateLearningPathwayWhileEdit(String pathways){
	if (pathways.contains(",")) {
		StringTokenizer st = new StringTokenizer(pathways, ",");
		while(st.hasMoreTokens())
		{
			String pathway = st.nextToken().trim();
			iWillWaitToSee(By.xpath("//span[contains(text(),'"+pathway+"')]"));
		Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//span[contains(text(),'"+pathway+"')]"))));
		}
	}
	else{
		iWillWaitToSee(By.xpath("//span[contains(text(),'"+pathways+"')]"));
		Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//span[contains(text(),'"+pathways+"')]"))));
	}
}
public void iVerifyCrossIcon(){
	Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[name()='svg' and @fill='#48677b']//*[name()='g' and @id='iCons']"))));
	
}
public void verifySubmitButtonStatus() {
	WebElement el = driver.findElement(By.xpath("//button[.='Submit']"));
	
		Assert.assertFalse(el.isEnabled());
	
}
public void iVerifyRemovedProgramInEditPage(String program){
	Assert.assertFalse(driver.findElement(By.xpath("//div[@class='ui label']/span")).getAttribute("innerText").toString().trim().equals(program));
}
public void verifyPaginationForSelectedLoc(){
	try{
	Assert.assertFalse(driver.findElement(By.xpath("//div[@class='component-selected-facility-options']")).getAttribute("nextSibling").toString().contains("paginator"));

}catch(NullPointerException e){
	Assert.assertFalse(false);
}
}
public void verifyAllLocationBoxSelection() {
	Assert.assertTrue(isElementPresent(By.xpath("//div[@class='ui checked checkbox']/label[text()='All Locations']")));
}
public void enterInvalidLearningPathway(String text){
	if(isElementPresentOnPage(By.cssSelector(".column.padding>.component-learning-pathway-dropdown"))==true){
    
	iFillInText(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), text);
	   	}
}
}