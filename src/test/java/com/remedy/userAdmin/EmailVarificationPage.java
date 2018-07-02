package com.remedy.userAdmin;

import com.remedy.baseClass.BaseClass;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

/**
 * Created by salam on 8/6/15.
 */
public class EmailVarificationPage extends BaseClass {

	public EmailVarificationPage(WebDriver driver) {
		super(driver);
	}

	public void iEnterVerificationEmai(String email) {
		iFillInText(driver.findElement(By.cssSelector("#inboxfield")), email);
	}

	public void iClickGoButton() {
		clickElement(driver.findElement(By.cssSelector(".input-group-btn .btn.btn-dark")));
	}

	public void switchToFrame(String element) {
		swithToFrame(element);
	}

	public void SelectNewEmail() {
		driver.navigate().refresh();
		clickElement(driver.findElement(By.xpath("//div[contains(text(),'Remedy Partners - Verify your account')]")));
	}

	public void clickConfirmAccountLink() {
		clickElement(driver.findElement(By.xpath("//a[text()='Confirm my account!']")));
	}

	public void deleteAllEmails() {
		clickElement(driver.findElement(By.cssSelector(".igif.lmenudelall")));
		clickElement(driver.findElement(By.xpath("//*[@id='delmenu']/ul/li[3]/a")));
	}

	public void iClickCheckForNewMail() {
		for (int i = 0; i <= 20; i++) {
			clickElement(driver.findElement(By.xpath("//button[@title='Go!']")));
		}
		isElementVisible(driver.findElement(By.xpath("//div[contains(text(),' Remedy QA')]")));
		driver.navigate().refresh();
	}

	public void iClickOnConfirmPasswordLink() {
		clickElement(driver.findElement(By.xpath("//div[contains(text(),'Password Confirmation')]")));
		driver.switchTo().frame(driver.findElement(By.xpath("//*[@id='publicshowmaildivcontent']")));
		driver.findElement(By.xpath("//a[text()='click here']")).click();
	}
}