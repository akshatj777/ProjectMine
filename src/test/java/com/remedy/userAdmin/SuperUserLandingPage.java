package com.remedy.userAdmin;

import java.util.concurrent.TimeUnit;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.openqa.selenium.JavascriptExecutor;

import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;
import com.remedy.userAdmin.CreateUserPage;

public class SuperUserLandingPage extends BaseClass {
	static String mail = "test.automatemail";
	static String email = null;
	WebDriverWait wait = new WebDriverWait(driver, 60);
	
	public SuperUserLandingPage(WebDriver driver) 
	{
		super(driver);
	}

	public void iVerifyUsersLink(String text) {
		verifyTextForElement(driver.findElement(By.cssSelector("a[href^='https://user-admin']")), text);
	}
	
	public void clickLastPageIconOnLandingPage() 
	{
		iWillWaitToSee(By.xpath("//div[@class='double-chevron right']"));
		driver.findElement(By.xpath("//div[@class='double-chevron right']")).click();
	}
	
	public void clickFirstPageIconOnLandingPage() 
	{
		iWillWaitToSee(By.xpath("//div[@class='double-chevron left']"));
		driver.findElement(By.xpath("//div[@class='double-chevron left']")).click();
	}

	public void iVerifyLandingPageUI(String text) {
		driver.manage().timeouts().pageLoadTimeout(600, TimeUnit.SECONDS);
		iWillWaitToSee(By.cssSelector("table.ui.celled.sortable.striped.table tbody"));
		if (text.contains("User table"))
			Assert.assertTrue(isElementPresentOnPage(By.cssSelector("table.ui.celled.sortable.striped.table tbody")));
		else if(text.equals("SearchBox"))
		{
			iWillWaitToSee(By.xpath("//input[@placeholder='Search']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//input[@placeholder='Search']")));
		}
		else if(text.equals("UsersTabOnLeftPane"))
		{
			iWillWaitToSee(By.xpath("//a[@href='https://user-admin-qa.remedypartners.com']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[@href='https://user-admin-qa.remedypartners.com']")));
		}
		else if(text.equals("EmailOnTopRight"))
		{
			iWillWaitToSee(By.xpath("//div[text()='Leonid']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Leonid']")));
		}
		else if(text.equals("User Admin Footer"))
		{
			iWillWaitToSee(By.xpath("//*[contains(text(),'� 2018 Remedy Partners, Inc. All rights reserved.')]"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//*[contains(text(),'� 2018 Remedy Partners, Inc. All rights reserved.')]")));
		}
		else if(text.equals("Next Page Icon"))
		{
			iWillWaitToSee(By.xpath("//div[@class='single-chevron']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='single-chevron']")));
		}
		else if(text.equals("LoggedInUserNamePTA"))
		{
			iWillWaitToSee(By.xpath("//div[text()='Firstname']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Firstname']")));
		}
		else if(text.equals("LoggedInUserOptionsPTA"))
		{
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Support']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Reset Password']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Log Out']")));
		}
		else if(text.equals("UsersApplicationsDropdownPTA"))
		{
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Users']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Episode Connect']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Episodes Classic']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='RemedyU']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Reporting']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Reporting Classic']")));
		}
		else if(text.equals("LoggedInUserNameSA"))
		{
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Firstname']")));
		}
		else if(text.equals("LoggedInUserOptionsSA"))
		{
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Support']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Internal Support']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Reset Password']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Log Out']")));
		}
		else if(text.equals("UsersApplicationsDropdownSA"))
		{
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Users']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Care Connect']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Care Innovation Institute']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Community Connect']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Episode Connect']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Episodes Classic']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Episodes Post Acute']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Program Management']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='RemedyU']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Reporting']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Reporting Classic']")));
		}
		else if(text.equals("Last Page Icon"))
		{
			iWillWaitToSee(By.xpath("//div[@class='double-chevron right']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='double-chevron right']")));
		}
		else if(text.equals("Previous Page Icon"))
		{
			iWillWaitToSee(By.xpath("//div[@class='single-chevron']/i[@class='icon chevron left']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='single-chevron']/i[@class='icon chevron left']")));
		}
		else if(text.equals("First Page Icon"))
		{
			iWillWaitToSee(By.xpath("//div[@class='double-chevron left']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='double-chevron left']")));
		}
		else if (text.contains("Lock"))
		{
			iWillWaitToSee(By.cssSelector("th#auth0State"));
			Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector("th#auth0State"))));
		}
		else if (text.contains("User Name"))
		{
			iWillWaitToSee(By.cssSelector("th#lastName"));
			Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector("th#lastName"))));
		}
		else if (text.contains("Role"))
		{
			iWillWaitToSee(By.cssSelector("th#logicalRoleId"));
			Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector("th#logicalRoleId"))));
		}
		else if (text.contains("User Email"))
		{
			iWillWaitToSee(By.cssSelector("th#email"));
			Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector("th#email"))));
		}
		else if (text.contains("Date Created Column"))
		{
			iWillWaitToSee(By.cssSelector("th#insertedDate"));
			Assert.assertTrue(isElementPresent(By.cssSelector("th#insertedDate")));
		}
		else if (text.contains("Pagination")) {
			iWillWaitToSee(By.cssSelector("div.paginator-text"));
			Assert.assertTrue(isElementPresentOnPage(By.cssSelector("div.paginator-text")));
			verifyTextForElement(driver.findElement(By.cssSelector(".current-page")), "1");
			Assert.assertTrue(driver.findElement(By.cssSelector(".number-of-pages")).getText().contains("of"));
		} else if (text.contains("Pagination retention")) {
			if (isElementPresentOnPage(By.cssSelector(".icon.chevron.right")) == true) {
				clickElement(driver.findElement(By.cssSelector(".icon.chevron.right")));
				iWillWaitToSee(By.cssSelector("div.chevron-group"));
				String s = driver.findElement(By.cssSelector(".current-page")).getText();
				iClickOnAddUserButton();
				iClickOnCloseIconFromAddUserPage();
				verifyTextForElement(driver.findElement(By.cssSelector(".current-page")), s);
				
			}else{return;}
		} else if (text.contains("next icons")) {
			if (isElementPresentOnPage(By.cssSelector("div.double-chevron.right")) == true) {
				Assert.assertFalse(isElementNotPresentOnPage(By.cssSelector(".icon.chevron.left")));
				Assert.assertFalse(isElementNotPresentOnPage(By.cssSelector("div.double-chevron.left")));
				Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector("div.double-chevron.right"))));
				clickElement(driver.findElement(By.cssSelector("div.double-chevron.right")));
				iWillWaitToSee(By.cssSelector("div.chevron-group"));
				String s = driver.findElement(By.cssSelector(".current-page")).getText();
				s = "of " + s;
				verifyTextForElement(driver.findElement(By.cssSelector(".number-of-pages")), s);
				Assert.assertFalse(isElementNotPresentOnPage(By.cssSelector(".icon.chevron.right")));
				Assert.assertFalse(isElementNotPresentOnPage(By.cssSelector("div.double-chevron.right")));
				Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector(".icon.chevron.left"))));
				clickElement(driver.findElement(By.cssSelector("div.double-chevron.left")));
				iWillWaitToSee(By.cssSelector("div.chevron-group"));
				verifyTextForElement(driver.findElement(By.cssSelector(".number-of-pages")), s);
			}
		}

		else if (text.contains("Users Count")) {
					verifyElementCount(".five.wide", 30);
				}
		 else if (text.contains("rows allignment")) {
			
				if (isElementPresentOnPage(By.cssSelector("div.double-chevron.right")) == true) {
					verifyElementCount("tr.component-user-table-row", 30);
					clickElement(driver.findElement(By.cssSelector("div.double-chevron.right")));
					iWillWaitToSee(By.cssSelector("div.chevron-group"));
				} else {
					int size = driver.findElements(By.cssSelector(".five.wide")).size();
					verifyElementCount("tr.component-user-table-row", size);
					if(isElementVisible(driver.findElement(By.cssSelector("div.double-chevron.left")))==true){
					clickElement(driver.findElement(By.cssSelector("div.double-chevron.left")));
					iWillWaitToSee(By.cssSelector("div.chevron-group"));
					}
				
				}
		} else if (text.contains("Long email")) {
			
				if (isElementPresentOnPage(By.cssSelector("div.double-chevron.right")) == true) {
					for (int i = 0; i < 90; i++) {
						String name = driver.findElements(By.cssSelector("td.four.wide")).get(i).getText();
						Assert.assertTrue(name.contains(" "));
						i = i + 2;
					}
					for (int j = 0; j < 30; j++) {
						String mail = driver.findElements(By.cssSelector("td.five.wide")).get(j).getText();
						Assert.assertTrue(mail.contains(".com"));
					}
					clickElement(driver.findElement(By.cssSelector("div.double-chevron.right")));
					iWillWaitToSee(By.cssSelector("div.chevron-group"));
					int size = driver.findElements(By.cssSelector(".five.wide")).size();
					for (int i = 0; i < size * 3; i++) {
						String name = driver.findElements(By.cssSelector("td.four.wide")).get(i).getText();
						Assert.assertTrue(name.contains(" "));
						i = i + 2;
					}
					for (int j = 0; j < size; j++) {
						String mail = driver.findElements(By.cssSelector("td.five.wide")).get(j).getText();
						Assert.assertTrue(mail.contains("@")&&mail.contains(".com"));
					}
				} else {
					int size = driver.findElements(By.cssSelector(".five.wide")).size();
					for (int i = 0; i < size * 3; i++) {
						String name = driver.findElements(By.cssSelector("td.four.wide")).get(i).getText();
						Assert.assertTrue(name.contains(" "));
						i = i + 2;
					}
					for (int j = 0; j < size; j++) {
						String mail = driver.findElements(By.cssSelector("td.five.wide")).get(j).getText();
						Assert.assertTrue(mail.contains(".com"));
					}
				}
				clickElement(driver.findElement(By.cssSelector("div.double-chevron.left")));
				iWillWaitToSee(By.cssSelector("div.chevron-group"));
			}
		
		}

	public void verifyUserInformation(String text) {
		iWillWaitToSee(By.cssSelector("td.five.wide"));
		do {
			int size = driver.findElements(By.cssSelector(".five.wide")).size();
			for (int i = 0; i < size; i++) {
				if (text.contains("Account Status")) 
				{
					Assert.assertTrue(isElementVisible(driver.findElements(By.cssSelector("td.center.aligned.one.wide")).get(i)));
				}
				if (text.contains("Email")) 
				{
					Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector("td.five.wide"))));
				}
			}
			int size1 = driver.findElements(By.cssSelector("td.four.wide")).size();
			for (int n = 0; n < size1; n++) 
			{
				if (text.contains("Name")) 
				{
					Assert.assertTrue(isElementVisible(driver.findElements(By.cssSelector("td.four.wide")).get(n)));
				}
				n = n + 1;
				if (text.contains("Role")) 
				{
					Assert.assertTrue(isElementVisible(driver.findElements(By.cssSelector("td.four.wide")).get(n)));
				}
				n = n + 1;
				if (text.contains("Date")) 
				{
					Assert.assertTrue(isElementVisible(driver.findElements(By.cssSelector("td.four.wide")).get(n)));
				}
			}
			if (isElementPresentOnPage(By.cssSelector("div.double-chevron.right")) == true) {
				clickElement(driver.findElement(By.cssSelector("div.double-chevron.right")));
				iWillWaitToSee(By.cssSelector("div.chevron-group"));
			} else
				break;
		}

		while (isElementPresentOnPage(By.cssSelector("div.chevron-group")) == true);
	}

	public void SearchUserWithText(String searchParam, String userRole) {
		if(searchParam.equals("FetchFromHM"))
		{
			String email = CreateUserPage.usersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim());
			if(DriverScript.Config.getProperty("Browser").equals("ie"))
			{
				new Actions(driver).sendKeys(driver.findElement(By.xpath("//input[@placeholder='Search']")), email).build().perform();
				while(!(driver.findElement(By.xpath("//input[@placeholder='Search']")).getAttribute("value").equals(email)))
				{
					((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
					new Actions(driver).sendKeys(driver.findElement(By.xpath("//input[@placeholder='Search']")), email).build().perform();
				}
			}
			else
			{
				driver.findElement(By.xpath("//input[@placeholder='Search']")).sendKeys(email);
			}
			longDelay();
		}
		else
		{
			driver.findElement(By.xpath("//input[@placeholder='Search']")).sendKeys(searchParam);
			longDelay();
		}
	}
	
	public void verifySearch(String searchParam, String userRole) 
	{
		if(searchParam.equals("FetchFromHM"))
		{
			String email = CreateUserPage.usersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim());
			iWillWaitToSee(By.xpath("//tr[@class='component-user-table-row']/td[contains(text(),'"+email.toLowerCase()+"')]"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//tr[@class='component-user-table-row']/td[contains(text(),'"+email.toLowerCase()+"')]")));
		}
		else
		{
			iWillWaitToSee(By.xpath("//tr[@class='component-user-table-row']/td[contains(text(),'"+searchParam+"')]"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//tr[@class='component-user-table-row']/td[contains(text(),'"+searchParam+"')]")));
		}
		
	}

	public void iVerifySearchResult(String result, String searchBy, String role) {
		iWillWaitToSee(By.cssSelector("td.four.wide"));
		if(result.contains(",")){
			return;
		}
		if (searchBy.contains("Name")) {
			if (driver.findElements(By.cssSelector("td.four.wide")).get(0).getText().contains(result))
				Assert.assertTrue(driver.findElements(By.cssSelector("td.four.wide")).get(0).getText().contains(result));
		} else if (searchBy.equalsIgnoreCase("Email")) {
			if(result.equals(mail)){
			String email = CreateUserPage.usersEmailPerRole.get(role).get(role.substring((role.indexOf("-")+1)).trim());
			System.out.println("Email value-------" + email);
			verifyTextForElement(driver.findElements(By.cssSelector("td.five.wide")).get(0), email);
			}
			else{
				verifyTextForElement(driver.findElements(By.cssSelector("td.five.wide")).get(0), result);
			}
		}
	}

	public void iClickOnTopUserDropDown() {
		iWillWaitToSee(By.id("lastName"));
		iWillWaitToSee(By.cssSelector("i.dropdown.icon"));
		clickElement(driver.findElements(By.cssSelector("i.dropdown.icon")).get(1));
	}

	public void iSelectOptionFromDropdown(String text) {
		selectElementByDesc(".item", text);
	}

	public void iLockUnlockUser(String action) {
		if(action.equals("lock"))
		{
			iWillWaitToSee(By.xpath("//span[@class='component-lock-icon unlocked']"));
			driver.findElement(By.xpath("//span[@class='component-lock-icon unlocked']")).click();
			delay();
		}
		else if(action.equals("unlock"))
		{
			iWillWaitToSee(By.xpath("//span[@class='component-lock-icon locked']"));
			driver.findElement(By.xpath("//span[@class='component-lock-icon locked']")).click();
			delay();
		}
	}
	
	public void verifyLockedUser(String action) {
		if(action.equals("Locked"))
		{
			iWillWaitToSee(By.xpath("//span[@class='component-lock-icon locked']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[@class='component-lock-icon locked']")));
		}
		else if(action.equals("Unlocked"))
		{
			iWillWaitToSee(By.xpath("//span[@class='component-lock-icon unlocked']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[@class='component-lock-icon unlocked']")));
		}
	}

	public void iVerifyTextfromUnlockPopup(String text) {
		iWillWaitToSee(By.xpath("//*[contains(text(),'"+text+"')]"));
		verifyTextForElement(driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]")), text);
	}

	public void iClickOnUnlockButtonFromPopup() {
		clickElement(driver.findElement(By.cssSelector("button.ui.green.inverted.button")));
		delay();
	}

	public void iClickOnButtonFromPopup(String text) {
		iWillWaitToSee(By.xpath("//*[contains(text(),'"+text+"')]"));
		clickElement(driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]")));
		longDelay();
	}

	public void iClickOnUsersLink() {
		iWillWaitToSee(By.xpath("//a[@href='https://user-admin-dev.remedypartners.com']"));
		clickElement(driver.findElement(By.xpath("//a[@href='https://user-admin-dev.remedypartners.com']")));
		longDelay();
	}

	public void iClickOnAddUserButton() {
		scrollToTopOfThePage();
		iWillWaitToSee(By.xpath("//button[text()='Add User']"));
		clickElement(driver.findElement(By.xpath("//button[text()='Add User']")));
	}

	public void iverifyAddUserButton() {
		scrollToTopOfThePage();
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//button[text()='Add User']")));
	}

	public void iVerifyAddUserPage() {
		iWillWaitToSee(By.cssSelector("div.add-user-form-content"));
		Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector("div.add-user-form-content"))));
	}

	public void iClickOnCloseIconFromAddUserPage() {
		iWillWaitToSee(By.xpath("//*[name()='svg'][@fill='#48677b']"));
		clickElement(driver.findElement(By.xpath("//*[name()='svg'][@fill='#48677b']")));
	}

	public void verifyUserBlockedMessageOnLandingPage() {
		iWillWaitToSee(By.xpath("//span[text()='User is blocked']"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='User is blocked']")));
	}
	
	public void verifyWrongEmailMessage() {
		iWillWaitToSee(By.xpath("//span[text()='Wrong email or password.']"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Wrong email or password.']")));
	}

	public void iEnterNewUserName(String text) {
		if (text.equalsIgnoreCase(mail)) 
		{
			iFillInText(driver.findElement(By.name("email")), email);
		}
	}

	public void iShouldNotSeeSearchResults(){
		verifyElementCount(".five.wide", 0);
	}
	public void iSeeCrossIconForSearch(){
		Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector(".remove.link.icon.remove-icon"))));
	}
	
	public void verifyNoResultFoundOnLandingPage(){
		iWillWaitToSee(By.xpath("//h3[text()=' No Results Found ']"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//h3[text()=' No Results Found ']")));
	}
	public void iClickCrossIconForSearch(){
		clickElement(driver.findElement(By.cssSelector(".remove.link.icon.remove-icon")));
	}
public void iSeeUsersBackOnClosingSearch(){
	iWillWaitToSee(By.cssSelector("th#lastName"));
	if (isElementPresentOnPage(By.cssSelector("div.double-chevron.right")) == true)
	verifyElementCount(".five.wide", 30);
	else{
		int countRow = driver.findElements(By.cssSelector(".five.wide")).size();
		verifyElementCount(".five.wide", countRow);
	}
}

public void iVerifyRowCountForSearchByEmail(){
	iWillWaitToSee(By.cssSelector("td.four.wide"));
	Assert.assertEquals(driver.findElements(By.cssSelector(".five.wide")).size(), 1);
}
public void iSelectAUser(){
	scrollToTopOfThePage();
	iWillWaitToSee(By.cssSelector("td.five.wide"));
	clickElement(driver.findElements(By.cssSelector("td.five.wide")).get(0));
	
}
public void iVerifyViewUserPage()
{
	iWillWaitToSee(By.xpath("//a[contains(text(),'All Users /')]"));
	Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[contains(text(),'All Users /')]")));
}
public void iShouldNotSeeErrorMsgOnUsersPage(String text){
	Assert.assertFalse(isElementNotPresentOnPage(By.xpath("//*[contains(text(),'"+text+"')]")));
}
public void verifyRowsAlignmentWhenCountIsNotMultipleOfThree(){
	if (isElementPresentOnPage(By.cssSelector("div.double-chevron.right")) == true) {
		clickElement(driver.findElement(By.cssSelector(".icon.chevron.right")));
		iWillWaitToSee(By.cssSelector("div.chevron-group"));
		
		int size = driver.findElements(By.cssSelector(".five.wide")).size();
		if(size%3!=0){
		verifyElementCount("tr.component-user-table-row", size);
		}
		if(isElementVisible(driver.findElement(By.cssSelector("div.double-chevron.left")))==true){
		clickElement(driver.findElement(By.cssSelector("div.double-chevron.left")));
		iWillWaitToSee(By.cssSelector("div.chevron-group"));
		}
	}else{
		int size = driver.findElements(By.cssSelector(".five.wide")).size();
		if(size%3!=0){
		verifyElementCount("tr.component-user-table-row", size);
		}
		if(isElementVisible(driver.findElement(By.cssSelector("div.double-chevron.left")))==true){
			clickElement(driver.findElement(By.cssSelector("div.double-chevron.left")));
			iWillWaitToSee(By.cssSelector("div.chevron-group"));
			}
	}
}

public void iVerifyThatEmailIsDisplayedInSameCase(String role){
	if(role.isEmpty()==false){
	String email = CreateUserPage.usersEmailPerRole.get(role).get(role.substring((role.indexOf("-")+1)).trim());
	verifyTextForElement(driver.findElements(By.cssSelector("td.five.wide")).get(0), email);
	}
}

public void iVerifyProductListInTopNavigationBarIsClosed(){
	Assert.assertTrue(isElementNotPresentOnPage(".ui.active.visible.dropdown.remedy-connect-title"));
}

public void iVerifyEmailForPTAExecutiveRole(String text, String Role){
	Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='FirstName']")));
}
public void iVerifyDeleteUserLink(String text){
	iWillWaitToSee(By.xpath("//*[contains(text(),'"+text+"')]/parent::div//div[text()='Deleting this user will prevent their email address from being used in the future']"));
	Assert.assertTrue(isElementPresentOnPage(By.xpath("//*[contains(text(),'"+text+"')]/parent::div//div[text()='Deleting this user will prevent their email address from being used in the future']")));
}
public void iClickOnDeleteUser(String text){
	iWillWaitToSee(By.xpath("//*[contains(text(),'"+text+"')]"));
	clickElement(driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]")));
}
public void iVerifyTextWhileDeletingUser(String text){
	iWillWaitToSee(By.xpath("//*[contains(text(),'"+text+"')]"));
	Assert.assertTrue(isElementPresentOnPage(By.xpath("//*[contains(text(),'"+text+"')]")));
}
public void iVerifyCancelButtonWhileDeletingUser(String text){
	iWillWaitToSee(By.xpath("//a[contains(text(),'"+text+"')]"));
	Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[contains(text(),'"+text+"')]")));
}
public void iClickCancelButtonWhileDeletingUser(String text){
	clickElement(driver.findElement(By.xpath("//a[contains(text(),'"+text+"')]")));
}
public void iVerifyDeleteButtonWhileDeletingUser(String text){
	iWillWaitToSee(By.xpath("//button[contains(text(),'"+text+"')]"));
	Assert.assertTrue(isElementPresentOnPage(By.xpath("//button[contains(text(),'"+text+"')]")));
}
public void iClickDeleteButtonToDeleteUser(String text){
	iWillWaitToSee(By.xpath("//button[contains(text(),'"+text+"')]"));
	clickElement(driver.findElement(By.xpath("//button[contains(text(),'"+text+"')]")));
	wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".ui.modal.transition.visible.active.component-add-user-form")));
}
public void iClickOnTileFromEC(String text){
	iWillWaitToSee(By.xpath("//i[@class='btn btn-menu valentino-icon-spoe']"));
	clickElement(driver.findElement(By.xpath("//i[@class='btn btn-menu valentino-icon-spoe']")));
	driver.findElement(By.xpath("//li[@feature='app.user-admin-1']")).click();
	
}
public void iSelectTileFromManagementDropDown(String text){

	clickElement(driver.findElement(By.cssSelector(".ui.dropdown.remedy-connect-title"))); 	
iWillWaitToSee(By.xpath("//span[contains(text(),'"+text+"')]"));
clickElement(driver.findElement(By.xpath("//span[contains(text(),'"+text+"')]")));
		clickSingleElementFromList(By.xpath("//a"), text);		
}
public void iVerifyReportsPage(){
	iWillWaitToSee(By.cssSelector(".dropdown-tile-head"));
	Assert.assertTrue(driver.getCurrentUrl().contains("reports"));
}	
public void iVerifyEmailCase(String userRole) {
	String email = CreateUserPage.usersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim());
	iWillWaitToSee(By.cssSelector(".five.wide"));
	Assert.assertTrue(driver.findElements(By.cssSelector(".five.wide")).get(0).getAttribute("innerText").toString().trim().equals(email));
}
}