package com.remedy.programManagement;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.remedy.baseClass.BaseClass;

public class RankProgramPage extends BaseClass{

	public RankProgramPage(WebDriver driver) {
		super(driver);
	}

	public void iVerifyHeaderTextOnRankProgramPage(String text){
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Rank Program']")));
	}
	
	public void iVerifyPayorNameOnRankProgramPage(String text){
		delay();
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		String beforeText= driver.findElement(By.xpath("//div[text()='Payor Organization Name: ']")).getText();
		String value=CreatePayorOrganizationAPI.PayorNameList.get(0).substring(1, CreatePayorOrganizationAPI.PayorNameList.get(0).length()-1);
		Assert.assertEquals("Payor Organization Name: "+value+"", beforeText);
	}
	
	public void iVerifyProgramsTextOnRankProgramPage(){
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Programs']")));
	}
	
	public void iVerifyValidationMessageAfterSubmittingRankProgramsPage(String msg, String org){
		iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-danger>div"));
		verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-danger>div")), msg);
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
	}
}
