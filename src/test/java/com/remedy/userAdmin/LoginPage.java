package com.remedy.userAdmin;


import com.remedy.Analytics.ProgramPerformance;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

import java.util.concurrent.TimeUnit;

import stepDefination.Hooks.InitialSetup;



import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import com.remedy.baseClass.BaseClass;

/**
 * Created by salam on 7/29/15.
 */
public class LoginPage extends BaseClass {

	public LoginPage(WebDriver driver) {
		super(driver);
	}

	public void iLoginAsSupperUser(String userName, String passWord) {
		driver.manage().timeouts().implicitlyWait(10,TimeUnit.MILLISECONDS);
		iEnteruserEmail(userName);
		iEnterPassword(passWord);
		iClickLogInButton();
		}

	public void iClickForgotPassword() {
		clickElement(driver.findElement(By.xpath("//*[text()='Forgot password?']")));
	}

	public void iEnterEmailForResetPssword(String text) {
		iFillInText(driver.findElement(By.name("email")), text);
	}

	public void iEnterNewPasswordForResetPassword(String text) {
		iFillInText(driver.findElement(By.name("password")), text);
	}

	public void iEnterPasswordToSetNewPassword(String text) {
		iFillInText(driver.findElement(By.name("password")), text);
	}

	public void iEnterConfirmPasswordForResetPassword(String text) {
		iFillInText(driver.findElement(By.xpath("//input[@placeholder='confirm your new password']")), text);
	}

	public void iReenterNewPasswordToSetNewPassword(String text) {
		iFillInText(driver.findElement(By.xpath("//input[@placeholder='confirm your new password']")), text);
	}

	public void iClickChangePasswordButton() {
		clickElement(driver.findElement(By.xpath("//button[@type='submit']")));
	}

	public void iClickOnChangePasswordButtonToSetNewPassword() {
		clickElement(driver.findElement(By.xpath("//button[@type='submit']")));
	}

	public void iClickChangePasswordCancleButton() {
		clickElement(driver.findElement(By.linkText("Return to Login")));
	}

	public void iVerifyChagePasswordConfirmation(String text) {
		verifyTextForElement(driver.findElement(By.cssSelector(".a0-success")), text);
	}

	public void iVerifyResetPasswordText(String text) {

		iWillWaitToSee(By.xpath("//div[text()=\"We've just sent you an email to reset your password.\"]"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()=\"We've just sent you an email to reset your password.\"]")));
	}

	public void iClickOkayButtonForResetPasswordPopupFromAccountLink() {
		iWillWaitToSee(By.xpath("//button[text()='Okay']"));

		WebElement element = driver.findElement(By.xpath("//button[text()='Okay']"));
		((JavascriptExecutor) driver).executeScript("arguments[0].click();", element);
		delay();
	}

	public void iEnteruserEmail(String userName) {
if(!(userName.isEmpty())){
		if(userName.equals("Remedy Technical Administrator"))
		{
			iWillWaitToSee(By.name("email"));
			iFillInText(driver.findElement(By.name("email")), CreateUserPage.usersEmailPerRole.get("Super Admin-Remedy Technical Administrator").get(userName));
		}
		else if(userName.equals("Partner Technical Administrator"))
		{
			iWillWaitToSee(By.name("email"));
			iFillInText(driver.findElement(By.name("email")), CreateUserPage.usersEmailPerRole.get("Super Admin-Partner Technical Administrator").get(userName));
		}
		else if(userName.equals("Downstream Provider"))
		{
			iWillWaitToSee(By.name("email"));
			iFillInText(driver.findElement(By.name("email")), CreateUserPage.usersEmailPerRole.get("Super Admin-Downstream Provider").get(userName));
		}
		else
		{ 
			     try{
				iWillWaitToSee(By.name("email"));
				iFillInText(driver.findElement(By.name("email")), userName);
			     }catch(Exception e){
			    	 ProgramPerformance.writer.print(System.lineSeparator());
			    		String flag="1";
			    		Assert.assertEquals("2", flag);
			     }
		}
	}
	}
	public void iEnterPassword(String passWord) {
		try{
		if(!(passWord.isEmpty())){
			iWillWaitToSee(By.name("password"));
			iFillInText(driver.findElement(By.name("password")), passWord);
		}}catch(Exception e){
	    	 ProgramPerformance.writer.print(System.lineSeparator());
	    		String flag="1";
	    		Assert.assertEquals("2", flag);
	     }
	}

	public void iEnterPasswordFieldForLoginAfterMailVerification(String passWord) {
		iFillInText(driver.findElement(By.name("password")), passWord);
	}

	public void iClickLogInButton() {
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			iWillWaitToSee(By.xpath("//*[contains(text(),'Log In')]"));
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//*[contains(text(),'Log In')]")));
		}
		else
		{
			try{
			iWillWaitToSee(By.xpath("//*[contains(text(),'Log In')]"));
			clickElement(driver.findElement(By.xpath("//*[contains(text(),'Log In')]")));
			}catch(Exception e){
		    	 ProgramPerformance.writer.print(System.lineSeparator());
		    		String flag="1";
		    		Assert.assertEquals("2", flag);
		     }
		}
	}

	public void iVerifyLogInWidget() {
		if((isElementNotPresentOnPage(By.xpath("//div[@class='auth0-lock-body-content']"))))
		{
			driver.navigate().refresh();
			iWillWaitToSee(By.xpath("//div[@class='auth0-lock-body-content']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='auth0-lock-body-content']")));
		}
	}
	
	public void iLogInAsRTAUser(String userName, String passWord){
		iEnteruserEmail(userName);
		iEnterPassword(passWord);
		iClickLogInButton();
	}
	
	public void iLogInAsPTAUser(String userName, String passWord){
		iEnteruserEmail(userName);
		iEnterPassword(passWord);
		iClickLogInButton();
	}
	
	public void iShouldSeeEmailTextboxField(){
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//input[@name='email']")));
	}
	
	public void iShouldVerifyWatermarkTextAppearingUnderEmailTextboxField(){
		Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//input[@placeholder='yours@example.com']"))));
	}
	
	public void iShouldSeePasswordTextboxField(){
		Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//input[@name='password']"))));
	}
	
	public void iShouldVerifyWatermarkTextAppearingUnderPasswordTextboxField(){
		Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//input[@placeholder='your password']"))));
	}
	
	public void iShouldSeeForgotPasswordLink(){
		Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector(".auth0-lock-alternative-link"))));
	}
	
	public void iShouldSeeLogInButton(){
		Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector(".auth0-lock-submit"))));
	}
	
	public void iVerifyTheValidationMessage(String text){
		if(text.equals("Can't be blank"))
		verifyTextForElement(driver.findElement(By.cssSelector(".auth0-lock-error-msg>span")), text);
		else if (text.equals("Remedy Connect"))
			Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]"))));
		else if(text.equals("WRONG EMAIL OR PASSWORD"))
			verifyTextForElement(driver.findElement(By.xpath("//span[@class='animated fadeInUp']")), text);
	}
	
	public void IRefreshThePage(){
		 driver.navigate().refresh();
	 }
	public void iEnterEmailForLogin(String userName){
		iFillInText(driver.findElement(By.name("email")), userName);
	}
	
	public void iVerifyTheErrorMessage(String text){
		verifyTextForElement(driver.findElement(By.xpath("//span[@class='animated fadeInUp']")), text);
	}
}

