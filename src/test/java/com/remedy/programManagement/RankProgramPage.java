package com.remedy.programManagement;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Action;
import org.openqa.selenium.interactions.Actions;
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
	
	public void iVerifyProgramNameUnderProgramTab(int index, String text){
		String value=driver.findElement(By.xpath("//div[text()='"+CreateProgramAPI.PROGRAMNameList.get(index-1).substring(1, CreateProgramAPI.PROGRAMNameList.get(index-1).length()-1)+"']")).getText();
		String value1=CreateProgramAPI.PROGRAMNameList.get(index-1).substring(1, CreateProgramAPI.PROGRAMNameList.get(index-1).length()-1);
		Assert.assertEquals(value1, value);
	}
	
	public void iVerifyProgramRankForCreatedProgramUnderProgramTab(int index){
		String rankCount= driver.findElement(By.xpath("//div[@class='data-table-cell link-content' and text()='"+index+"']")).getText();
		Assert.assertTrue(rankCount, true);
	}
	
	public void iVerifyProgramNameOnRankProgramPage(int index, String text){
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//li[text()='"+CreateProgramAPI.PROGRAMNameList.get(index-1).substring(1, CreateProgramAPI.PROGRAMNameList.get(index-1).length()-1)+"']")));
	}
	
	public void iChangeTheRankingValuesUsingDragAndDropOnRankProgramPage(){
		WebElement fromElement = driver.findElement(By.xpath("//li[text()='"+CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1)+"']"));
		WebElement toElement = driver.findElement(By.xpath("//li[text()='"+CreateProgramAPI.PROGRAMNameList.get(1).substring(1, CreateProgramAPI.PROGRAMNameList.get(1).length()-1)+"']"));
		 
		Actions action = new Actions(driver);
		action.dragAndDrop(fromElement, toElement).build().perform();
		
		longDelay();
	}
}
