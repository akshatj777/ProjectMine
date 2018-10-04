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
			if(CreatePGPOrganizationAPI.PGPNameList.get(0).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(0).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(0).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(0).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(0).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(0)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(0)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		else if(field.contains("PGPNAME - NO"))
		{
			if(CreatePGPOrganizationAPI.PGPNameList.get(1).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(1).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(1).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(1).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(1).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
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
			if(CreateHHAOrganizationAPI.HHANameList.get(0).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateHHAOrganizationAPI.HHANameList.get(0).substring(1, CreateHHAOrganizationAPI.HHANameList.get(0).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateHHAOrganizationAPI.HHANameList.get(0).substring(1, CreateHHAOrganizationAPI.HHANameList.get(0).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateHHAOrganizationAPI.HHANameList.get(0)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateHHAOrganizationAPI.HHANameList.get(0)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		else if(field.contains("HHANAME - NO"))
		{
			if(CreateHHAOrganizationAPI.HHANameList.get(1).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateHHAOrganizationAPI.HHANameList.get(1).substring(1, CreateHHAOrganizationAPI.HHANameList.get(1).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateHHAOrganizationAPI.HHANameList.get(1).substring(1, CreateHHAOrganizationAPI.HHANameList.get(1).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateHHAOrganizationAPI.HHANameList.get(1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateHHAOrganizationAPI.HHANameList.get(1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		
		else if(field.contains("LTCHNAME - YES"))
		{
			if(CreateLTCHOrganizationAPI.LTCHNameList.get(0).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateLTCHOrganizationAPI.LTCHNameList.get(0).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(0).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateLTCHOrganizationAPI.LTCHNameList.get(0).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(0).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateLTCHOrganizationAPI.LTCHNameList.get(0)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateLTCHOrganizationAPI.LTCHNameList.get(0)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		else if(field.contains("LTCHNAME - NO"))
		{
			if(CreateLTCHOrganizationAPI.LTCHNameList.get(1).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateLTCHOrganizationAPI.LTCHNameList.get(1).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(1).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateLTCHOrganizationAPI.LTCHNameList.get(1).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(1).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateLTCHOrganizationAPI.LTCHNameList.get(1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateLTCHOrganizationAPI.LTCHNameList.get(1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		
		else if(field.contains("IRFNAME - YES"))
		{
			if(CreateIRFOrganizationAPI.IRFNameList.get(0).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateIRFOrganizationAPI.IRFNameList.get(0).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(0).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateIRFOrganizationAPI.IRFNameList.get(0).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(0).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateIRFOrganizationAPI.IRFNameList.get(0)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateIRFOrganizationAPI.IRFNameList.get(0)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		else if(field.contains("IRFNAME - NO"))
		{
			if(CreateIRFOrganizationAPI.IRFNameList.get(1).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateIRFOrganizationAPI.IRFNameList.get(1).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(1).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateIRFOrganizationAPI.IRFNameList.get(1).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(1).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateIRFOrganizationAPI.IRFNameList.get(1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateIRFOrganizationAPI.IRFNameList.get(1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		
		else if(field.contains("HOSPICENAME - YES"))
		{
			if(CreateHospiceOrganizationAPI.HospiceNameList.get(0).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateHospiceOrganizationAPI.HospiceNameList.get(0).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(0).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateHospiceOrganizationAPI.HospiceNameList.get(0).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(0).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateHospiceOrganizationAPI.HospiceNameList.get(0)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateHospiceOrganizationAPI.HospiceNameList.get(0)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		}
		else if(field.contains("HOSPICENAME - NO"))
		{
			if(CreateHospiceOrganizationAPI.HospiceNameList.get(1).contains("\""))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateHospiceOrganizationAPI.HospiceNameList.get(1).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(1).length()-1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateHospiceOrganizationAPI.HospiceNameList.get(1).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(1).length()-1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateHospiceOrganizationAPI.HospiceNameList.get(1)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateHospiceOrganizationAPI.HospiceNameList.get(1)+"']")));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
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
				iWillWaitToSee(By.xpath("//div[text()='"+CreateProgramAPI.PROGRAMNameList.get(0)+"']"));
				clickElement(driver.findElement(By.xpath("//div[text()='"+CreateProgramAPI.PROGRAMNameList.get(0)+"']")));
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
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateACHOrganizationAPI.ACHNameList.get(1));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_ACH - NO")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateACHOrganizationAPI.ACHNameList.get(0));
		}
		else if(field2.contains("PGPNAME - YES")){
			CreatePGPOrganization.oldPGP_WithMO = CreatePGPOrganizationAPI.PGPNameList.get(0).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(0).length()-1);
			CreatePGPOrganization.tempPGPOrg.put("PGPNAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePGPOrganization.tempPGPOrg.get("PGPNAME"));
		}
		else if(field2.contains("PGPNAME - NO")){
			CreatePGPOrganization.oldPGP_WithoutMO = CreatePGPOrganizationAPI.PGPNameList.get(1).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(1).length()-1);
			CreatePGPOrganization.tempPGPOrg.put("PGPNAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePGPOrganization.tempPGPOrg.get("PGPNAME"));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_PGP - YES")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePGPOrganizationAPI.PGPNameList.get(1));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_PGP - NO")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePGPOrganizationAPI.PGPNameList.get(0));
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
		
		else if(field2.equalsIgnoreCase("IRFNAME - YES")){
			CreateIRFOrganization.oldIRF_WithMO = CreateIRFOrganizationAPI.IRFNameList.get(0).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(0).length()-1);
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			CreateIRFOrganization.tempIRFOrg.put("IRFNAME",createRandomName(field2));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateIRFOrganization.tempIRFOrg.get("IRFNAME"));
		}
		else if(field2.equalsIgnoreCase("IRFNAME - NO")){
			CreateIRFOrganization.oldIRF_WithoutMO = CreateIRFOrganizationAPI.IRFNameList.get(1).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(1).length()-1);
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			CreateIRFOrganization.tempIRFOrg.put("IRFNAME",createRandomName(field2));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateIRFOrganization.tempIRFOrg.get("IRFNAME"));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_IRF - YES")){
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateIRFOrganizationAPI.IRFNameList.get(0));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_IRF - NO")){
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateIRFOrganizationAPI.IRFNameList.get(1));
		}
		
		else if(field2.equalsIgnoreCase("LTCHNAME - YES")){
			CreateLTCHOrganization.oldLTCH_WithMO = CreateLTCHOrganizationAPI.LTCHNameList.get(0).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(0).length()-1);
			CreateLTCHOrganization.tempLTCHOrg.put("LTCHNAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateLTCHOrganization.tempLTCHOrg.get("LTCHNAME"));
		}
		else if(field2.equalsIgnoreCase("LTCHNAME - NO")){
			CreateLTCHOrganization.oldLTCH_WithoutMO = CreateLTCHOrganizationAPI.LTCHNameList.get(1).substring(1, CreateLTCHOrganizationAPI.LTCHNameList .get(1).length()-1);
			CreateLTCHOrganization.tempLTCHOrg.put("LTCHNAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateLTCHOrganization.tempLTCHOrg.get("LTCHNAME"));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_LTCH - YES")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateLTCHOrganizationAPI.LTCHNameList.get(1));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_LTCH - NO")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateLTCHOrganizationAPI.LTCHNameList.get(0));
		}
		else if(field2.equals("PROGRAMNAME")){
			CreatePrograms.programName = CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1);
			CreatePrograms.tempPrograms.put(1,createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePrograms.tempPrograms.get(1));
		}
		else if(field2.contains("equalsTo45Characters")){
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			CreatePrograms.tempPrograms.put(1,RandomStringUtils.randomAlphabetic(45));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePrograms.tempPrograms.get(1));
		}
		else if(field2.contains("AllowedCharatcters")){
			String str="PName~@!#$%^&*()-+_={}|;[]<>,.?/120";
			scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			CreatePrograms.tempPrograms.put(1,str+RandomStringUtils.randomAlphabetic(5));
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreatePrograms.tempPrograms.get(1));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_PROGRAMNAME")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateProgramAPI.PROGRAMNameList.get(0).substring(0, CreateProgramAPI.PROGRAMNameList.get(0).length()-1));
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
			else if(field1.contains("Hospice"))
			{
				scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
				CreateHospiceOrganization.tempHospiceOrg.put("HOSPICENAME",RandomStringUtils.randomAlphabetic(75));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHospiceOrganization.tempHospiceOrg.get("HHANAME"));
			}
			else if(field1.contains("Long-Term Care Hospital"))
			{
				scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
				CreateLTCHOrganization.tempLTCHOrg.put("LTCHNAME",RandomStringUtils.randomAlphabetic(75));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateLTCHOrganization.tempLTCHOrg.get("LTCHNAME"));
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
			else if(field1.contains("LTCH"))
			{
				scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
				CreateLTCHOrganization.tempLTCHOrg.put("LTCHNAME",str+RandomStringUtils.randomAlphabetic(7));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateLTCHOrganization.tempLTCHOrg.get("LTCHNAME"));
			}
			else if(field1.contains("Hospice"))
			{
				scrollIntoViewByJS(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")));
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
				driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
				CreateHospiceOrganization.tempHospiceOrg.put("HOSPICENAME",str+RandomStringUtils.randomAlphabetic(7));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHospiceOrganization.tempHospiceOrg.get("HOSPICENAME"));
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
			CreateHHAOrganization.oldHHA_WithMO = CreateHHAOrganizationAPI.HHANameList.get(0).substring(1, CreateHHAOrganizationAPI.HHANameList.get(0).length()-1);
			CreateHHAOrganization.tempHHAOrg.put("HHANAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHHAOrganization.tempHHAOrg.get("HHANAME"));
		}
		else if(field2.equalsIgnoreCase("HHANAME - NO")){
			CreateHHAOrganization.oldHHA_WithoutMO = CreateHHAOrganizationAPI.HHANameList.get(1).substring(1, CreateHHAOrganizationAPI.HHANameList.get(1).length()-1);
			CreateHHAOrganization.tempHHAOrg.put("HHANAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHHAOrganization.tempHHAOrg.get("HHANAME"));
		}
		
		else if(field2.equalsIgnoreCase("HOSPICENAME - YES")){
			CreateHospiceOrganization.oldHospice_WithMO = CreateHospiceOrganizationAPI.HospiceNameList.get(0).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(0).length()-1);
			CreateHospiceOrganization.tempHospiceOrg.put("HOSPICENAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHospiceOrganization.tempHospiceOrg.get("HOSPICENAME"));
		}
		else if(field2.equalsIgnoreCase("HOSPICENAME - NO")){
			CreateHospiceOrganization.oldHospice_WithoutMO = CreateHospiceOrganizationAPI.HospiceNameList.get(1).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(1).length()-1);
			CreateHospiceOrganization.tempHospiceOrg.put("HOSPICENAME",createRandomName(field2));
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.CONTROL,"a");
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).sendKeys(Keys.DELETE);
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHospiceOrganization.tempHospiceOrg.get("HOSPICENAME"));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_HHA - YES")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")),CreateHHAOrganizationAPI.HHANameList.get(1).substring(1, CreateHHAOrganizationAPI.HHANameList.get(1).length()-1));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_HHA - NO")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHHAOrganizationAPI.HHANameList.get(0).substring(1, CreateHHAOrganizationAPI.HHANameList.get(0).length()-1));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_Hospice - YES")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")),CreateHospiceOrganizationAPI.HospiceNameList.get(1).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(1).length()-1));
		}
		else if(field2.equalsIgnoreCase("DUPLICATE_Hospice - NO")){
			driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field1+"']")), CreateHospiceOrganizationAPI.HospiceNameList.get(0).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(0).length()-1));
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
		else if(field.contains("LTCHNAME - YES"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreateLTCHOrganization.LTCHOrg.get("LTCHNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateLTCHOrganization.LTCHOrg.get("LTCHNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(field.contains("LTCHNAME - NO"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreateLTCHOrganization.LTCHOrg_noMO.get("LTCHNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateLTCHOrganization.LTCHOrg_noMO.get("LTCHNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(field.contains("IRFNAME - YES"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreateIRFOrganization.IRFOrg.get("IRFNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateIRFOrganization.IRFOrg.get("IRFNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(field.contains("IRFNAME - NO"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreateIRFOrganization.IRFOrg_noMO.get("IRFNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateIRFOrganization.IRFOrg_noMO.get("IRFNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
	}
}