package com.remedy.programManagement;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.remedy.baseClass.BaseClass;

public class ViewPayorOrganization extends BaseClass {

	public ViewPayorOrganization(WebDriver driver) {
		super(driver);
	}
	
	public void iVerifyProgramsTabOnViewProfileOfPayorOrganization(String tab, String org) {
		iVerifyTextFromListOfElement(By.cssSelector(".navLink.noselect.activeNavLink"), tab);	
	}
	
	public void iVerifyContractsTabOnViewProfileOfPayorOrganization(String tab, String org) {
		iVerifyTextFromListOfElement(By.cssSelector(".navLink.noselect"), tab);	
	}
	
	public void iVerifybuttonOnViewProfileOfPayorOrganization(String text, String org) {
		iWillWaitToSee(By.xpath("//button[text()='"+text+"']"));
		iVerifyTextFromListOfElement(By.xpath("//button[text()='"+text+"']"), text);
	}
	
	public void iClickOnTabOnViewProfileOfPayorOrganization(String tab, String org) {
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		clickElement(driver.findElement(By.xpath("//a[text()='"+tab+"']")));
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		delay();
	}
}