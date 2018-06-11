package com.remedy.programManagement;

import java.io.IOException;
import java.util.HashMap;

import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.remedy.baseClass.BaseClass;

public class CreateManagingOrganization extends BaseClass {
	public static HashMap<String, String> tempMoOrg = new HashMap<String, String>();
	public static HashMap<String, String> moOrg = new HashMap<String, String>();
	public static String moName;
	
	public CreateManagingOrganization(WebDriver driver) {
		super(driver);
	}
	
	public void iVerifyButtonUnderOrganizationTab(String text) {
		iWillWaitToSee(By.xpath("//button[text()='"+text+"']"));
	}
	
	public void iClickOnCreateNewOrgButton() {
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		clickElement(driver.findElement(By.cssSelector("button[name='createNewOrg']")));
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
	}
	
	public void iVerifyHeaderTextOnCreateOrganizationPage(String text) {
		delay();
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		iVerifyTextFromListOfElement(By.cssSelector(".row.headline"), text);
		longDelay();
	}
	
	public void iVerifyLabelFieldsOnCreateOrganizationPage(String text) {
		iVerifyTextFromListOfElement(By.cssSelector(".input-field-caption"), text);
	}
	
	public void iVerifyRadioButtonLabelOnCreateOrganizationPage(String text) {
		iVerifyTextFromListOfElement(By.cssSelector(".radio-button-text"), text);
	}
	
	public void iClickOnButtonOnCreateOrganizationPage(String text) {
		 delay();
		 WebElement element = driver.findElement(By.xpath("//button[text()='"+text+"']"));
		 JavascriptExecutor executor = (JavascriptExecutor)driver;
		 executor.executeScript("arguments[0].click();", element);
		 waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
	}

	public void iVerifyOnButtonOnCreateOrganizationPage(String text) {
		WebElement element = driver.findElement(By.xpath("//button[text()='"+text+"']"));
		scrollIntoViewByJS(element);
		isElementPresent(By.xpath("//button[text()='"+text+"']"));
	}
	
	public void userNavigatedToViewPage(String org) {
		driver.findElement(By.cssSelector(".navLink.noselect")).getText();
	}

	public void iVerifyManadtoryFieldValidationOnCreateOrganizationPage(String text) {
		if(!text.equals(""))
		{
			delay();
			iVerifyTextFromListOfElement(By.cssSelector(".error-message>span"), text);
		}
	}
	
	public void iVerifyCreateOrganizationwithDuplicatenameerrormsg(String text) {
		if(!text.equals(""))
		{
			Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".alert.alert-dismissible.alert-danger")));
		}
	}
	
	public void iEnterDetailsInFieldsOnCreateOrganizationPage(String text, String field) throws IOException {
		if(text.equals("MONAME")) 
		{
			tempMoOrg.put("MONAME",createRandomName(text));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), tempMoOrg.get("MONAME"));
		}
		else if(text.equals("DUPLICATE_MO"))
		{
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), moOrg.get("MONAME"));
		}
		else if(text.equals("ACHNAME")) {
			CreateACHOrganization.tempAchOrg.put("ACHNAME", createRandomName(text));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateACHOrganization.tempAchOrg.get("ACHNAME"));
		}
		else if(text.equals("DUPLICATE_ACH"))
		{
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateACHOrganization.achOrg.get("ACHNAME"));
		}
		else if(text.equals("PGPNAME")) {
			CreatePGPOrganization.tempPGPOrg.put("PGPNAME", createRandomName(text));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePGPOrganization.tempPGPOrg.get("PGPNAME"));
		}
		else if(text.equals("DUPLICATE_PGP"))
		{
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePGPOrganization.pgpOrg.get("PGPNAME"));
		}
		else if(text.equals("PAYORNAME")) 
		{
			CreatePayorOrganization.tempPayorOrg.put("PAYORNAME", createRandomName(text));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePayorOrganization.tempPayorOrg.get("PAYORNAME"));
		}
		else if(text.equals("DUPLICATE_PAYORNAME"))
		{
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePayorOrganization.payorOrg.get("PAYORNAME"));
		}
		else if(text.equals("SNFNAME")) {
			CreateSNFOrganization.tempSNFOrg.put("SNFNAME", createRandomName(text));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateSNFOrganization.tempSNFOrg.get("SNFNAME"));
		}
		else if(text.equals("DUPLICATE_SNF"))
		{
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateSNFOrganization.SNFOrg.get("SNFNAME"));
		}
		else if(text.equals("HHANAME")) {
			CreateHHAOrganization.tempHHAOrg.put("HHANAME", createRandomName(text));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHHAOrganization.tempHHAOrg.get("HHANAME"));
		}
		else if(text.equals("DUPLICATE_hha"))
		{
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHHAOrganization.HHAOrg.get("HHANAME"));
		}
		else if(text.equals("PROGRAMNAME")) {
			CreatePrograms.tempPrograms.put(1, createRandomName(text));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePrograms.tempPrograms.get(1));
		}
		else if(text.equals("equalsTo45Characters")){
				CreatePrograms.tempPrograms.put(1,RandomStringUtils.randomAlphabetic(45));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePrograms.tempPrograms.get(1));
		}
		else if(text.equals("DUPLICATE_PROGRAMNAME"))
		{
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePrograms.programs.get(1));
		}
		else if(text.equals("equalsTo75Characters")){
			if(field.contains("Managing"))
			{
				CreateManagingOrganization.tempMoOrg.put("MONAME",RandomStringUtils.randomAlphabetic(75));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateManagingOrganization.tempMoOrg.get("MONAME"));
			}
			else if(field.contains("Hospital"))
			{
				CreateACHOrganization.tempAchOrg.put("ACHNAME",RandomStringUtils.randomAlphabetic(75));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateACHOrganization.tempAchOrg.get("ACHNAME"));
			}
			else if(field.contains("PGP"))
			{
				CreatePGPOrganization.tempPGPOrg.put("PGPNAME",RandomStringUtils.randomAlphabetic(75));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePGPOrganization.tempPGPOrg.get("PGPNAME"));
			}
			else if(field.contains("Payor"))
			{
				CreatePayorOrganization.tempPayorOrg.put("PAYORNAME",RandomStringUtils.randomAlphabetic(75));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePayorOrganization.tempPayorOrg.get("PAYORNAME"));
			}
			else if(field.contains("SNF"))
			{
				CreateSNFOrganization.tempSNFOrg.put("SNFNAME",RandomStringUtils.randomAlphabetic(75));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateSNFOrganization.tempSNFOrg.get("SNFNAME"));
			}
			else if(field.contains("HHA"))
			{
				CreateHHAOrganization.tempHHAOrg.put("HHANAME",RandomStringUtils.randomAlphabetic(75));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHHAOrganization.tempHHAOrg.get("HHANAME"));
			}
		}
		else if(text.equals("AllowedCharatcters")){
			String str="a~`@!#$%^&*()-+_={}|;'[]<>,.?/Test120";
			if(field.contains("Managing")){
			CreateManagingOrganization.tempMoOrg.put("MONAME",str+RandomStringUtils.randomAlphabetic(7));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateManagingOrganization.tempMoOrg.get("MONAME"));
			}
			else if(field.contains("Hospital"))
			{
				CreateACHOrganization.tempAchOrg.put("ACHNAME",str+RandomStringUtils.randomAlphabetic(7));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateACHOrganization.tempAchOrg.get("ACHNAME"));
			}
			else if(field.contains("PGP"))
			{
				CreatePGPOrganization.tempPGPOrg.put("PGPNAME",str+RandomStringUtils.randomAlphabetic(7));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePGPOrganization.tempPGPOrg.get("PGPNAME"));
			}
			else if(field.contains("Payor"))
			{
				CreatePayorOrganization.tempPayorOrg.put("PAYORNAME",str+RandomStringUtils.randomAlphabetic(7));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePayorOrganization.tempPayorOrg.get("PAYORNAME"));
			}
			else if(field.contains("SNF"))
			{
				CreateSNFOrganization.tempSNFOrg.put("SNFNAME",str+RandomStringUtils.randomAlphabetic(7));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateSNFOrganization.tempSNFOrg.get("SNFNAME"));
			}
			else if(field.contains("HHA"))
			{
				CreateHHAOrganization.tempHHAOrg.put("HHANAME",str+RandomStringUtils.randomAlphabetic(7));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHHAOrganization.tempHHAOrg.get("HHANAME"));
			}
			else if(field.contains("Program"))
			{
				CreatePrograms.tempPrograms.put(1,str+RandomStringUtils.randomAlphabetic(7));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePrograms.tempPrograms.get(1));
			}
		}
		else 	
		{
	    	iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), text);	
		}
	}

	public void iSelectStateFromDropDownOnCreateOrganizationPage(String text) {
		if(!text.equals("")){
			iFillInText(driver.findElement(By.xpath("//div[text()='State']/preceding-sibling::div//input[@role='combobox']")), text);
			waitTo().until(ExpectedConditions.visibilityOfElementLocated(By.cssSelector(".VirtualizedSelectOption")));
			clickSingleElementFromList(By.cssSelector(".VirtualizedSelectOption"),text);
		}
	}
	
	public void iVerifyMessageAfterSubmittingCreateOrganizationPage(String msg, String org) 
	{
//		if(driver.findElements(By.cssSelector(".alert.alert-dismissible.alert-success>a")).size()>0)	
//		{
		if(org.equals("FETCHFROMAPI"))
		{
			iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
			verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
			CreateManagingOrganizationAPI.MONameList.clear();
			CreateManagingOrganizationAPI.MONameList.add(tempMoOrg.get("MONAME"));
		}
		else if(org.equals("FETCHFROMAPIFORPAYOR"))
		{
			iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
			verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
			CreatePayorOrganizationAPI.PayorNameList.clear();
			CreatePayorOrganizationAPI.PayorNameList.add(CreatePayorOrganization.tempPayorOrg.get("PAYORNAME"));
		}
		else if(org.equals("FETCHFROMAPIForACHNAME - YES")){
			iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
			verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
			
			if(!CreateACHOrganization.tempAchOrg.isEmpty())
				{
					CreateACHOrganizationAPI.ACHNameList.set(0, CreateACHOrganization.tempAchOrg.get("ACHNAME"));
					CreateACHOrganizationAPI.tempAchOrg.clear();
				}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(org.equals("FETCHFROMAPIForACHNAME - NO")){
			iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
			verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
			
			if(!CreateACHOrganization.tempAchOrg.isEmpty())
			{
				CreateACHOrganizationAPI.ACHNameList.set(1, CreateACHOrganization.tempAchOrg.get("ACHNAME"));
				CreateACHOrganizationAPI.tempAchOrg.clear();
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(org.equals("FETCHFROMAPIForSNFNAME - YES")){
			iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
			verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
			
			if(!CreateSNFOrganization.tempSNFOrg.isEmpty())
				{
					CreateSNFOrganizationAPI.SNFNameList.set(0, CreateSNFOrganization.tempSNFOrg.get("SNFNAME"));
					CreateSNFOrganizationAPI.tempSNFOrg.clear();
				}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(org.equals("FETCHFROMAPIForSNFNAME - NO")){
			iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
			verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
			
			if(!CreateSNFOrganization.tempSNFOrg.isEmpty())
			{
				CreateSNFOrganizationAPI.SNFNameList.set(1, CreateSNFOrganization.tempSNFOrg.get("SNFNAME"));
				CreateSNFOrganizationAPI.tempSNFOrg.clear();
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(org.contains("MO"))
			{
				iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
				verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
				moOrg.clear();
				moOrg.putAll(tempMoOrg);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
				else if(org.contains("ACH - YES"))
				{
					iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
					verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
					
					if(!CreateACHOrganization.tempAchOrg.isEmpty())
						{
							CreateACHOrganization.achOrg.putAll(CreateACHOrganization.tempAchOrg);
							CreateACHOrganization.tempAchOrg.clear();
						}
					waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				}
				else if(org.contains("ACH - NO"))
				{
					iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
					verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
					
					if(!CreateACHOrganization.tempAchOrg.isEmpty())
					{
						CreateACHOrganization.achOrg_noMO.putAll(CreateACHOrganization.tempAchOrg);
						CreateACHOrganization.tempAchOrg.clear();
					}
					waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				}
				else if(org.contains("PGP - YES"))
				{
					iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
					verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
					if(!CreatePGPOrganization.tempPGPOrg.isEmpty())
						{
						CreatePGPOrganization.pgpOrg.putAll(CreatePGPOrganization.tempPGPOrg);
						CreatePGPOrganization.tempPGPOrg.clear();
						}
					waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				}
				else if(org.contains("PGP - NO"))
				{
					iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
					verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
					if(!CreatePGPOrganization.tempPGPOrg.isEmpty())
					{
						CreatePGPOrganization.pgpOrg_noMO.putAll(CreatePGPOrganization.tempPGPOrg);
						CreatePGPOrganization.tempPGPOrg.clear();
					}
					waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
					}
				else if(org.contains("Payor"))
				{
					
					iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
					verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
					if(!CreatePayorOrganization.tempPayorOrg.isEmpty())
					{
						CreatePayorOrganization.payorOrg.putAll(CreatePayorOrganization.tempPayorOrg);
						CreatePayorOrganization.tempPayorOrg.clear();
					}
					waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				}
				else if(org.contains("SNF - YES"))
				{
					iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
					verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
					
					if(!CreateSNFOrganization.tempSNFOrg.isEmpty())
						{
							CreateSNFOrganization.SNFOrg.putAll(CreateSNFOrganization.tempSNFOrg);
							CreateSNFOrganization.tempSNFOrg.clear();
						}
					waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				}
				else if(org.contains("SNF - NO"))
				{
					iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
					verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
					
					if(!CreateSNFOrganization.tempSNFOrg.isEmpty())
					{
						CreateSNFOrganization.SNFOrg_noMO.putAll(CreateSNFOrganization.tempSNFOrg);
						CreateSNFOrganization.tempSNFOrg.clear();
					}
					waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				}
				else if(org.contains("HHA - YES"))
				{
					iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
					verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
					
					if(!CreateHHAOrganization.tempHHAOrg.isEmpty())
						{
							CreateHHAOrganization.HHAOrg.putAll(CreateHHAOrganization.tempHHAOrg);
							CreateHHAOrganization.tempHHAOrg.clear();
						}
					waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				}
				else if(org.contains("HHA - NO"))
				{
					iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>a"));
					verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>a")), msg);
					
					if(!CreateHHAOrganization.tempHHAOrg.isEmpty())
					{
						CreateHHAOrganization.HHAOrg_noMO.putAll(CreateHHAOrganization.tempHHAOrg);
						CreateHHAOrganization.tempHHAOrg.clear();
					}
					waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				}
				else if(org.contains("Programs"))
				{
					iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>div"));
					verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>div")), msg);
					if(!CreatePrograms.tempPrograms.isEmpty())
					{
						CreatePrograms.programs.putAll(CreatePrograms.tempPrograms);
						CreatePrograms.tempPrograms.clear();
					}
					waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				}
			//}
	    	else 
	    	{
	    		iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-danger>div"));
	    		verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-danger>div")), msg);
	    		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
	    	}	
	}
	
	public void iVerifyDuplicateMessageAfterSubmittingCreateOrganizationPage(String msg, String org)
	{
		if(org.equals("Create_Network_Contract")){
			iWillWaitToSee(By.xpath("//div[@class='alert alert-dismissible alert-danger']//div[contains(text(),'"+msg+"')]"));
			Assert.assertTrue(isElementPresent(By.cssSelector(".alert.alert-dismissible.alert-danger>div")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else{
			iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-danger>div"));
			verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-danger>div")), msg);
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
	}
	
	public void iSwitchFocusToButton(String text) {
		driver.findElement(By.xpath("//button[@type='"+text+"']")).sendKeys(Keys.TAB);
		delay();
	}
	
	
}