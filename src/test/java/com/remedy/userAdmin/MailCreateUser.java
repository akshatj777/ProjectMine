package com.remedy.userAdmin;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.event.KeyEvent;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;



import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Assert;
import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;



import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

public class MailCreateUser extends BaseClass{

	static DateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
	static Date timestamp = null;
	static String time = null;
	static String mail = "test.automatemail";
	static String email = null;

	public MailCreateUser(WebDriver driver) {
		super(driver);
	}

	public void iAmOnMailLoginPage() throws InterruptedException, AWTException {
		driver.navigate().to("https://accounts.google.com");
	}
	
	public void iEnterUserNameToLoginMailAccount(String username) {
		iWillWaitToSee(By.xpath("//input[@type='email']"));
		driver.findElement(By.xpath("//input[@type='email']")).sendKeys(username);
		clickElement(driver.findElement(By.xpath("//span[text()='Next']")));
	}
	
	public void iEnterPasswordToLoginMailAccount(String password) throws InterruptedException {	
		Thread.sleep(4000);
//		if(driver.findElement(By.xpath("//input[@type='email']")).isDisplayed())
//		{
//			driver.findElement(By.xpath("//input[@type='email']")).sendKeys("test.automatemail");
//			clickElement(driver.findElement(By.xpath("//span[text()='Next']")));
//			iWillWaitToSee(By.xpath("//input[@type='password']"));
//			driver.findElement(By.xpath("//input[@type='password']")).sendKeys(password);
//			clickElement(driver.findElement(By.xpath("//span[text()='Next']")));
//		}
//		else
//		{
			iWillWaitToSee(By.xpath("//input[@type='password']"));
			driver.findElement(By.xpath("//input[@type='password']")).sendKeys(password);
			if(driver.findElements(By.xpath("//span[text()='Next']")).size()>0)
			{
				clickElement(driver.findElement(By.xpath("//span[text()='Next']")));
			}
			else
			{
				clickElement(driver.findElement(By.xpath("//span[text()='Sign in']")));
			}
//		}
	}
	
	public void iClickOnMailIconOnMyAccount() {	
		iWillWaitToSee(By.xpath("//a[@aria-label='Mail']"));
		clickElement(driver.findElement(By.xpath("//a[@aria-label='Mail']")));
	}
	
	public void iClickOnInboxUnderMail() throws InterruptedException {
		Thread.sleep(4000);
		iWillWaitToSee(By.xpath("//a[contains(text(),'Inbox')]"));
		clickElement(driver.findElement(By.xpath("//a[contains(text(),'Inbox')]")));
		Thread.sleep(4000);
		clickElement(driver.findElement(By.xpath("//a[contains(text(),'Inbox')]")));
	}
	
	public void iClickOnSelectAllCheckBoxInMail() {
		iWillWaitToSee(By.xpath("//div[@class='T-Jo-auh' and @role='presentation']"));
		clickElement(driver.findElement(By.xpath("//div[@class='T-Jo-auh' and @role='presentation']")));
	}
	
	public void iClickOnDeleteIconInMail() {
		iWillWaitToSee(By.xpath("//div[@class='T-Jo-auh' and @role='presentation']"));
		clickElement(driver.findElement(By.xpath("//div[@class='T-Jo-auh' and @role='presentation']")));
		delay();
		boolean flag = driver.findElement(By.xpath("//div[@aria-label='Delete']")).isDisplayed();
		if(flag==true)
		{
			clickElement(driver.findElement(By.xpath("//div[@aria-label='Delete']")));
		}
	}
	
	public void iSignOutFromMailAccount() {
		try
		{
			iWillWaitToSee(By.cssSelector("div>div>a[role=button]>span"));
			clickElement(driver.findElement(By.cssSelector("div>div>a[role=button]>span")));
			delay();
			clickElement(driver.findElement(By.cssSelector("#gb_71")));
			delay();
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
		Assert.assertTrue(isElementPresentOnPage((By.xpath("//span/b[contains(text(),'Verify your account')]"))));
	}
	
	public void iClickOnAccountVerificationMailInInboxInMyAccount() {
		iWillWaitToSee(By.xpath("//span/b[contains(text(),'Verify your account')]"));
		clickElement(driver.findElement(By.xpath("//span/b[contains(text(),'Verify your account')]")));
	}
	
	public void iVerifyLinkInMailContentInInboxInMyAccount(String text) {
		iWillWaitToSee(By.xpath("//a[contains(text(),'"+text+"')]"));
		Assert.assertTrue(isElementPresentOnPage((By.xpath("//a[contains(text(),'"+text+"')]"))));
	}
	
	public void iClickOnLinkInMailContentInInboxInMyAccount(String text) {
		iWillWaitToSee(By.xpath("//a[contains(text(),'"+text+"')]"));
		clickElement(driver.findElement((By.xpath("//a[contains(text(),'"+text+"')]"))));
	}
	
	public void iEnterEmailToGeneratePasswordLink() {
		iWillWaitToSee(By.xpath("//input[@name='email']"));
		driver.findElement(By.xpath("//input[@name='email']")).sendKeys(email);
	}
	
	public void iClickOnSendEmailButton() throws InterruptedException {
		iWillWaitToSee(By.xpath("//button[@type='submit']"));
		clickElement(driver.findElement(By.xpath("//button[@type='submit']")));
		Thread.sleep(3000);
	}
	
	public void i_Verify_The_Unread_Mail_In_Inbox_In_My_Account(){
		iWillWaitToSee(By.xpath("//a[contains(text(),'Inbox (')]"));

		isElementPresentOnPage(By.xpath("//a[contains(text(),'Inbox (')]"));

	}
	
	public void iVerifyChangePasswordMailinInboxInMyAccount() {
		iWillWaitToSee(By.xpath("//span[contains(text(),'Remedy Partners - Change Your Password We recently received a request to create')]"));
    	Assert.assertTrue(isElementPresentOnPage((By.xpath("//span[contains(text(),'Remedy Partners - Change Your Password We recently received a request to create')]"))));
	}
	
	public void iClickOnChangePasswordMailInInboxInMyAccount() throws InterruptedException {
		iWillWaitToSee(By.xpath("//span[contains(text(),'Remedy Partners - Change Your Password')]"));
		Thread.sleep(3000);
		if(driver.findElement(By.xpath("//span[contains(text(),'Remedy Partners - Change Your Password')]")).isEnabled())
		{
			clickElement(driver.findElement(By.xpath("//span[contains(text(),'Remedy Partners - Change Your Password')]")));
		}
	}
	
	public void iEnterNewPasswordToSetNewPassword(String text) {
		iWillWaitToSee(By.name("password"));
		iFillInText(driver.findElement(By.name("password")), text);
	}
	
	public void iEnterConfirmNewPasswordToSetNewPassword(String text) {
		iWillWaitToSee(By.xpath("//input[@placeholder='confirm your new password']"));
		iFillInText(driver.findElement(By.xpath("//input[@placeholder='confirm your new password']")), text);
	}
	
	public void iEnterNewUserEmailForLoginToRemedy(String role) {
		String emailVal = CreateUserPage.usersEmailPerRole.get(role).get(role.substring((role.indexOf("-")+1)).trim());


		iWillWaitToSee(By.xpath("//input[@name='email']"));
		iFillInText(driver.findElement(By.xpath("//input[@name='email']")), emailVal);
	}
	
	public void iEnterNewPasswordForLoginToRemedy() {
		iWillWaitToSee(By.xpath("//input[@name='password']"));
		iFillInText(driver.findElement(By.xpath("//input[@name='password']")), "Testing1");
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
	public void iEnterEmailWithApostropheAndUnderscore(String emailName) {
		if(emailName.equalsIgnoreCase("test.automatemail"))
			{
			email = emailName+"+_'"+RandomStringUtils.randomAlphabetic(8)+"@gmail.com";
			iWillWaitToSee(By.xpath("//input[@placeholder='Email']"));
			driver.findElement(By.xpath("//input[@placeholder='Email']")).sendKeys(email);
			delay();
			}
	
	}
}