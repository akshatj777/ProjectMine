package com.remedy.programManagement;

import junit.framework.Assert;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.remedy.baseClass.BaseClass;

public class PhysicianRoster extends BaseClass{

	public PhysicianRoster(WebDriver driver) {
		super(driver);
	}
	
	public void iVerifyPGPOrganizationNameOnPhysicianRosterPage(String text, String page)
	{
		if(text.contains("PGPNAME - YES"))
		{
			isElementPresentOnPage(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg.get("PGPNAME")+"'"));
		}
		else if(text.contains("PGPNAME - NO"))
		{
			isElementPresentOnPage(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg_noMO.get("PGPNAME")+"'"));
		}
		else if(text.contains("ACHNAME - YES"))
		{
			isElementPresentOnPage(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1)+"'"));
		}
		else if(text.contains("ACHNAME - NO"))
		{
			isElementPresentOnPage(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1)+"'"));
		}
	}
	
	public void iVerifyProgramDropdownOnPhysicianRosterPage(String text,String page){
		isElementPresentOnPage(By.xpath("//div[contains(text(),'"+text+"')]"));
		longDelay();
	}
	
	public void iVerifyTextOnPhysicianRosterPage(String text,String page){
		isElementPresentOnPage(By.xpath("//div[text()='"+text+"']"));
	}
	
	public void iVerifyPractionerDropdownOnCreatePhysicianRosterPage(String text,String page){
		isElementPresentOnPage(By.cssSelector(".Select."+text+"-selector"));
	}
	
	public void iVerifyButtonOnPhysicianRosterPage(String text,String page){
		isElementPresentOnPage(By.xpath("//button[text()='"+text+"']"));
	}
	
	public void iVerifyOnButtonOnCreatePhysicianosterPage(String text) {
		WebElement element = driver.findElement(By.xpath("//button[text()='"+text+"']"));
		scrollIntoViewByJS(element);
		isElementPresent(By.xpath("//button[text()='"+text+"']"));
	}
	
	public void iSelectProgramInProgramDropDownOnPhysicianRosterPage(String text, String page){
		if(!text.equals(""))
		{
			driver.findElement(By.xpath("//div[text()='Select a Program']")).click();
			new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[text()='Select a Program']")), CreatePrograms.programs.get(1)).build().perform();
			driver.findElement(By.cssSelector(".VirtualizedSelectOption.VirtualizedSelectFocusedOption")).click();
			delay();
		}
	}
	
	public void iVerifytextAfterSelectingProgramFromDropdownOnPhysicianRosterPage(String text){
		isElementPresentOnPage(By.cssSelector("."+text+""));
		delay();
	}
	
	public void iSelectaPhysicianonCreatePhysicianRosterPage(int numberOfPractitioners, String text, String act){
		WebElement element = driver.findElement(By.xpath("//div[text()='Select...']"));
		JavascriptExecutor executor = (JavascriptExecutor)driver;
		executor.executeScript("arguments[0].click();", element);
		longDelay();
			if(text.equals("FETCHFROMAPI"))
			{
				driver.findElement(By.xpath("//div[text()='Select...']/following-sibling::div/input")).sendKeys(CreatePractictionerAPI.practitionerNameList.get(numberOfPractitioners-1).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(numberOfPractitioners-1).toString().length()-1));
				longDelay();
				driver.findElements(By.cssSelector(".practitioner-field.npi")).get(numberOfPractitioners-1).click();
				longDelay();
			}
			else
			{
				driver.findElement(By.xpath("//div[text()='Select...']/following-sibling::div/input")).sendKeys(text);
				longDelay();
				driver.findElement(By.cssSelector(".practitioner-field.npi")).click();
				longDelay();
			}
	}
	
	public void iClickOnAddPhysicianButton(String text, String act){
		 delay();
		 WebElement element = driver.findElement(By.xpath("//button[text()='"+text+"']"));
		 scrollIntoViewByJS(element);
		 JavascriptExecutor executor = (JavascriptExecutor)driver;
		 executor.executeScript("arguments[0].click();", element);
	}
	
	public void iVerifyDetailsAfterAddingPhysicianFromDropdownonCreatePhysicianRosterPage(String text){
			iWillWaitToSee(By.xpath("//div[text()='"+text+"']"));
			verifyTextForElement(driver.findElement(By.xpath("//div[text()='"+text+"']")), text);
	}
	
	public void iVerifyNPIDetailsAfterAddingPhysicianFromDropdownonCreatePhysicianRosterPage(int numberOfPractitioner, String text){
		if(text.equals("FETCHFROMAPI"))
		{
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePractictionerAPI.practitionerNameList.get(numberOfPractitioner-1).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(numberOfPractitioner-1).toString().length()-1)+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreatePractictionerAPI.practitionerNameList.get(numberOfPractitioner-1).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(numberOfPractitioner-1).toString().length()-1)+"']")));
		}
		else
		{
			iWillWaitToSee(By.xpath("//div[text()='"+text+"']"));
			verifyTextForElement(driver.findElement(By.xpath("//div[text()='"+text+"']")), text);
		}
	}
	
	public void iVerifyDateAfterAddingPhysicianFromDropdownonCreatePhysicianRosterPage(String text){
		verifyTextForElement(driver.findElement(By.xpath("//label[text()='"+text+"']")), text);
	}
	
	public void iSearchWithSearchListOptionsOnSelectAPhysicianDropdownBox(String searchParam){
		String value = searchParam;
		if(value.equals("FETCHFROMAPI"))
		{
			driver.findElement(By.xpath("//div[text()='Select...']")).click();
			longDelay();
			driver.findElement(By.xpath("//div[text()='Select...']/following-sibling::div/input")).sendKeys(CreatePractictionerAPI.practitionerNameList.get(0).toString());
			longDelay();
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreatePractictionerAPI.practitionerNameList.get(0).toString()+"']")));
		}
		else
		{
			driver.findElement(By.xpath("//div[text()='Select...']")).click();
			longDelay();
			driver.findElement(By.xpath("//div[text()='Select...']/following-sibling::div/input")).sendKeys(value);
			longDelay();
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+value+"']")));
		}
	}
	
	public void iVerifyTheErrorMessageForInvalidSearchInSelectaPhysicianDropdownBox(String text)
	{
		iWillWaitToSee(By.cssSelector(".Select-noresults"));
		Assert.assertEquals(text, driver.findElement(By.cssSelector(".Select-noresults")).getText());
	}
	
	public void iVerifyValidationMessageMessageonCreatePhysicianRosterPage(String msg, String act){
		iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-danger>div"));
		verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-danger>div")), msg);
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
	}
}
