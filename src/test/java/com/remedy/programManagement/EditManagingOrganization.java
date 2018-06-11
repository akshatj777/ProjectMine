package com.remedy.programManagement;

import java.io.IOException;

import org.apache.commons.lang3.RandomStringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.remedy.baseClass.BaseClass;

public class EditManagingOrganization extends BaseClass {

	public EditManagingOrganization(WebDriver driver) {
		super(driver);
	}
	
	public void iClickFieldInSearchListOnOrganizationPage(String field) {
		if(field.contains("MONAME"))
		{
			if(CreateManagingOrganizationAPI.MONameList.get(0).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateManagingOrganizationAPI.MONameList.get(0)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateManagingOrganizationAPI.MONameList.get(0)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		else if(field.contains("ACHNAME - YES"))
		{
			if(CreateACHOrganizationAPI.ACHNameList.get(0).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(0)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(0)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		else if(field.contains("ACHNAME - NO"))
		{
			if(CreateACHOrganizationAPI.ACHNameList.get(1).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		else if(field.contains("PGPNAME - YES"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg.get("PGPNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg.get("PGPNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(field.contains("PGPNAME - NO"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg_noMO.get("PGPNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg_noMO.get("PGPNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(field.contains("PAYORNAME"))
		{
			if(CreatePayorOrganizationAPI.PayorNameList.get(0).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePayorOrganizationAPI.PayorNameList.get(0).substring(1, CreatePayorOrganizationAPI.PayorNameList.get(0).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreatePayorOrganizationAPI.PayorNameList.get(0).substring(1, CreatePayorOrganizationAPI.PayorNameList.get(0).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePayorOrganizationAPI.PayorNameList.get(0)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreatePayorOrganizationAPI.PayorNameList.get(0)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		else if(field.contains("SNFNAME - YES"))
		{
			if(CreateSNFOrganizationAPI.SNFNameList.get(0).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(0).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(0).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(0)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(0)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		else if(field.contains("SNFNAME - NO"))
		{
			if(CreateSNFOrganizationAPI.SNFNameList.get(1).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(1).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(1).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(1).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(1).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		else if(field.contains("HHANAME - YES"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreateHHAOrganization.HHAOrg.get("HHANAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateHHAOrganization.HHAOrg.get("HHANAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(field.contains("HHANAME - NO"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreateHHAOrganization.HHAOrg_noMO.get("HHANAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateHHAOrganization.HHAOrg_noMO.get("HHANAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(field.contains("PROGRAMNAME"))
		{
			if(CreateProgramAPI.PROGRAMNameList.get(0).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		else
		{
			iWillWaitToSee(By.xpath("//div[text()='"+field+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+field+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
	}
	
	public void iClickOnButtonOnParticularOrganization(String button) throws IOException 
	{
		iWillWaitToSee(By.xpath("//button[text()='"+button+"']"));
		clickElement(driver.findElement(By.xpath("//button[text()='"+button+"']")));
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
	}
	
	public void iEditAllFieldsOFOrganization(String field1, String field2) 
	{
		
		if(field2.contains("MONAME")){
			CreateManagingOrganization.moName = CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1);
			CreateManagingOrganization.tempMoOrg.put("MONAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateManagingOrganization.tempMoOrg.get("MONAME"));
		}
		else if(field2.equalsIgnoreCase("ACHNAME - YES")){
			CreateACHOrganization.oldACH_WithMO = CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1);
			CreateACHOrganization.tempAchOrg.put("ACHNAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateACHOrganization.tempAchOrg.get("ACHNAME"));
		}
		else if(field2.equalsIgnoreCase("ACHNAME - NO")){
			CreateACHOrganization.oldACH_WithoutMO = CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1);
			CreateACHOrganization.tempAchOrg.put("ACHNAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateACHOrganization.tempAchOrg.get("ACHNAME"));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_ACH - YES")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateACHOrganizationAPI.ACHNameList.get(0));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_ACH - NO")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateACHOrganizationAPI.ACHNameList.get(1));
		}
		else if(field2.contains("PGPNAME - YES")){
			CreatePGPOrganization.oldPGP_WithMO = CreatePGPOrganization.pgpOrg.get("PGPNAME");
			CreatePGPOrganization.tempPGPOrg.put("PGPNAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePGPOrganization.tempPGPOrg.get("PGPNAME"));
		}
		else if(field2.contains("PGPNAME - NO")){
			CreatePGPOrganization.oldPGP_WithoutMO = CreatePGPOrganization.pgpOrg_noMO.get("PGPNAME");
			CreatePGPOrganization.tempPGPOrg.put("PGPNAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePGPOrganization.tempPGPOrg.get("PGPNAME"));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_PGP - YES")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePGPOrganization.pgpOrg_noMO.get("PGPNAME"));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_PGP - NO")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePGPOrganization.pgpOrg.get("PGPNAME"));
		}
		else if(field2.equals("PAYORNAME")){
			CreatePayorOrganization.oldPayorOrg = CreatePayorOrganizationAPI.PayorNameList.get(0).substring(1, CreatePayorOrganizationAPI.PayorNameList.get(0).length()-1);
			CreatePayorOrganization.tempPayorOrg.put("PAYORNAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePayorOrganization.tempPayorOrg.get("PAYORNAME"));
			}
		else if(field2.equalsIgnoreCase("Duplicate_Payor")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePayorOrganization.payorOrg.get("PAYORNAME"));
		}
		else if(field2.equalsIgnoreCase("SNFNAME - YES")){
			CreateSNFOrganization.oldSNF_WithMO = CreateSNFOrganizationAPI.SNFNameList.get(0).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1);
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			CreateSNFOrganization.tempSNFOrg.put("SNFNAME",createRandomName(field2));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateSNFOrganization.tempSNFOrg.get("SNFNAME"));
		}
		else if(field2.equalsIgnoreCase("SNFNAME - NO")){
			CreateSNFOrganization.oldSNF_WithoutMO = CreateSNFOrganizationAPI.SNFNameList.get(1).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(1).length()-1);
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			CreateSNFOrganization.tempSNFOrg.put("SNFNAME",createRandomName(field2));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateSNFOrganization.tempSNFOrg.get("SNFNAME"));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_SNF - YES")){
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateSNFOrganizationAPI.SNFNameList.get(0));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_SNF - NO")){
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateSNFOrganizationAPI.SNFNameList.get(1));
		}
		else if(field2.contains("PROGRAMNAME")){
			CreatePrograms.programName = CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1);
			CreatePrograms.tempPrograms.put(1,createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePrograms.tempPrograms.get(1));
		}
		else if(field2.equalsIgnoreCase("equalsTo75Characters - NO")){
			if(field1.contains("Hospital"))
			{
				scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
				CreateACHOrganization.tempAchOrg.put("ACHNAME",RandomStringUtils.randomAlphabetic(75));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateACHOrganization.tempAchOrg.get("ACHNAME"));
			}
			else if(field1.contains("PGP"))
			{
				scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
				CreatePGPOrganization.tempPGPOrg.put("PGPNAME",RandomStringUtils.randomAlphabetic(75));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePGPOrganization.tempPGPOrg.get("PGPNAME"));
			}
			else if(field1.contains("SNF"))
			{
				scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
				CreateSNFOrganization.tempSNFOrg.put("SNFNAME",RandomStringUtils.randomAlphabetic(74));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateSNFOrganization.tempSNFOrg.get("SNFNAME"));
			}
			else if(field1.contains("HHA"))
			{
				scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
				CreateHHAOrganization.tempHHAOrg.put("HHANAME",RandomStringUtils.randomAlphabetic(75));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHHAOrganization.tempHHAOrg.get("HHANAME"));
			}
		}
		else if(field2.equalsIgnoreCase("AllowedCharatcters - NO")){
			String str="a~`@!#$%^&*()-+_={}|;'[]<>,.?/Testing120";
			if(field1.contains("Hospital"))
			{
				scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
				CreateACHOrganization.tempAchOrg.put("ACHNAME",str+RandomStringUtils.randomAlphabetic(7));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateACHOrganization.tempAchOrg.get("ACHNAME"));
			}
			else if(field1.contains("PGP"))
			{
				scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
				CreatePGPOrganization.tempPGPOrg.put("PGPNAME",str+RandomStringUtils.randomAlphabetic(7));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePGPOrganization.tempPGPOrg.get("PGPNAME"));
			}
			else if(field1.contains("SNF"))
			{
				scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
				CreateSNFOrganization.tempSNFOrg.put("SNFNAME",str+RandomStringUtils.randomAlphabetic(7));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateSNFOrganization.tempSNFOrg.get("SNFNAME"));
			}
			else if(field1.contains("HHA"))
			{
				scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
				CreateHHAOrganization.tempHHAOrg.put("HHANAME",str+RandomStringUtils.randomAlphabetic(7));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHHAOrganization.tempHHAOrg.get("HHANAME"));
			}
		}
		else if(field2.contains("equalsTo75Characters")){
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			CreatePayorOrganization.tempPayorOrg.put("PAYORNAME",RandomStringUtils.randomAlphabetic(75));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePayorOrganization.tempPayorOrg.get("PAYORNAME"));
		}
		else if(field2.contains("equalsTo75CharactersonMONAMEField")){
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			CreateManagingOrganization.tempMoOrg.put("MONAME",RandomStringUtils.randomAlphabetic(75));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateManagingOrganization.tempMoOrg.get("MONAME"));
		}
		else if(field2.contains("AllowedCharatctersForMONAMEField")){
			String str="a~`@!#$%^&*()-+_={}|;'[]<>,.?/Testing120";
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			CreateManagingOrganization.tempMoOrg.put("MONAME",str+RandomStringUtils.randomAlphabetic(15));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateManagingOrganization.tempMoOrg.get("MONAME"));
		}
		else if(field2.equals("AllowedCharatctersForPayorNAMEField")){
			String str="a~`@!#$%^&*()-+_={}|;'[]<>,.?/Testing120";
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			CreateManagingOrganization.tempMoOrg.put("PAYORNAME",str+RandomStringUtils.randomAlphabetic(5));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePayorOrganization.tempPayorOrg.get("PAYORNAME"));
		}
		else if(field2.equalsIgnoreCase("HHANAME - YES")){
			CreateHHAOrganization.oldHHA_WithMO = CreateHHAOrganization.HHAOrg.get("HHANAME");
			CreateHHAOrganization.tempHHAOrg.put("HHANAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHHAOrganization.tempHHAOrg.get("HHANAME"));
		}
		else if(field2.equalsIgnoreCase("HHANAME - NO")){
			CreateHHAOrganization.oldHHA_WithoutMO = CreateHHAOrganization.HHAOrg_noMO.get("HHANAME");
			CreateHHAOrganization.tempHHAOrg.put("HHANAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHHAOrganization.tempHHAOrg.get("HHANAME"));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_HHA - YES")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHHAOrganization.HHAOrg_noMO.get("HHANAME"));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_HHA - NO")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHHAOrganization.HHAOrg.get("HHANAME"));
		}
		else 
		{
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), field2);
		}
	}		
	
	public void iEditStateFieldForOrganization(String text) {
		if(!text.isEmpty())
		{
			if(driver.findElements(By.cssSelector(".Select.Select--single.is-clearable.is-searchable.has-value>input[name='address.stateSelection']")).size()>0){
				driver.findElement(By.xpath("//div[input[@name='address.stateSelection']]//span[@class='Select-clear']")).click();
			}
			driver.findElements(By.xpath("//div[text()='State']/preceding-sibling::div//input[@role='combobox']")).get(0).sendKeys(text);
	        clickSingleElementFromList(By.cssSelector(".VirtualizedSelectOption"),text);
		}
		else {
			if(driver.findElements(By.cssSelector(".Select.Select--single.is-clearable.is-searchable.has-value>input[name='address.stateSelection']")).size()>0){
				driver.findElement(By.xpath("//div[input[@name='address.stateSelection']]//span[@class='Select-clear']")).click();
			}
		}
	}
	
	public void clickStateClearButton() throws Throwable {
		driver.findElement(By.xpath("//span[@class='Select-clear']")).click();
    }
	
	public void iClickFieldInSearchListOnACHandSNFOrganizationPage(String field, String org){
		if(field.contains("ACHNAME - YES"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreateACHOrganization.achOrg.get("ACHNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateACHOrganization.achOrg.get("ACHNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(field.contains("ACHNAME - NO"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreateACHOrganization.achOrg_noMO.get("ACHNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateACHOrganization.achOrg_noMO.get("ACHNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(field.contains("SNFNAME - YES"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreateSNFOrganization.SNFOrg.get("SNFNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateSNFOrganization.SNFOrg.get("SNFNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(field.contains("SNFNAME - NO"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreateSNFOrganization.SNFOrg_noMO.get("SNFNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateSNFOrganization.SNFOrg_noMO.get("SNFNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
	}
}