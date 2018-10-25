package com.remedy.programManagement;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.remedy.baseClass.BaseClass;

public class SearchOrganization extends BaseClass{
	
	List<Long> orgId= new ArrayList<>();
	List<String> LocIndexIdList= new ArrayList<>();

	public SearchOrganization(WebDriver driver) {
		super(driver);
	}
	
	public void iSearchFieldOnOrganizationInSearchBox(String text) {
		if(text.contains("MONAME"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			if(CreateManagingOrganizationAPI.MONameList.get(0).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateManagingOrganizationAPI.MONameList.get(0));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("ACHNAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			//iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg.get("ACHNAME"));
			if(CreateACHOrganizationAPI.ACHNameList.get(0).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganizationAPI.ACHNameList.get(0));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("ACHNAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			//iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg_noMO.get("ACHNAME"));
			if(CreateACHOrganizationAPI.ACHNameList.get(1).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganizationAPI.ACHNameList.get(1));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("PGPNAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			//iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg.get("ACHNAME"));
			if(CreatePGPOrganizationAPI.PGPNameList.get(0).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganizationAPI.PGPNameList.get(0).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(0).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganizationAPI.PGPNameList.get(0));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("PGPNAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			//iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg_noMO.get("ACHNAME"));
			if(CreatePGPOrganizationAPI.PGPNameList.get(1).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganizationAPI.PGPNameList.get(1).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(1).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganizationAPI.PGPNameList.get(1));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("PAYORNAME"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			if(CreatePayorOrganizationAPI.PayorNameList.get(0).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePayorOrganizationAPI.PayorNameList.get(0).substring(1, CreatePayorOrganizationAPI.PayorNameList.get(0).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePayorOrganizationAPI.PayorNameList.get(0));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("SNFNAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			//iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg.get("ACHNAME"));
			if(CreateSNFOrganizationAPI.SNFNameList.get(0).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganizationAPI.SNFNameList.get(0).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganizationAPI.SNFNameList.get(0));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("SNFNAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			//iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg_noMO.get("ACHNAME"));
			if(CreateSNFOrganizationAPI.SNFNameList.get(1).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganizationAPI.SNFNameList.get(1).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(1).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganizationAPI.SNFNameList.get(1));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("HHANAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			//iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg.get("ACHNAME"));
			if(CreateHHAOrganizationAPI.HHANameList.get(0).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganizationAPI.HHANameList.get(0).substring(1, CreateHHAOrganizationAPI.HHANameList.get(0).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganizationAPI.HHANameList.get(0));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("HHANAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			//iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg_noMO.get("ACHNAME"));
			if(CreateHHAOrganizationAPI.HHANameList.get(1).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganizationAPI.HHANameList.get(1).substring(1, CreateHHAOrganizationAPI.HHANameList.get(1).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganizationAPI.HHANameList.get(1));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		
		else if(text.contains("HOSPICENAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			//iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg.get("ACHNAME"));
			if(CreateHospiceOrganizationAPI.HospiceNameList.get(0).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganizationAPI.HospiceNameList.get(0).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(0).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganizationAPI.HospiceNameList.get(0));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("HOSPICENAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			//iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg_noMO.get("ACHNAME"));
			if(CreateHospiceOrganizationAPI.HospiceNameList.get(1).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganizationAPI.HospiceNameList.get(1).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(1).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganizationAPI.HospiceNameList.get(1));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		
		else if(text.contains("LTCHNAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			//iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg.get("ACHNAME"));
			if(CreateLTCHOrganizationAPI.LTCHNameList.get(0).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganizationAPI.LTCHNameList.get(0).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(0).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganizationAPI.LTCHNameList.get(0));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("LTCHNAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			//iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg_noMO.get("ACHNAME"));
			if(CreateLTCHOrganizationAPI.LTCHNameList.get(1).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganizationAPI.LTCHNameList.get(1).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(1).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganizationAPI.LTCHNameList.get(1));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		
		else if(text.contains("IRFNAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			if(CreateIRFOrganizationAPI.IRFNameList.get(0).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganizationAPI.IRFNameList.get(0).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(0).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganizationAPI.IRFNameList.get(0));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("IRFNAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			if(CreateIRFOrganizationAPI.IRFNameList.get(1).contains("\""))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganizationAPI.IRFNameList.get(1).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(1).length()-1));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganizationAPI.IRFNameList.get(1));
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		
		else if(text.contains("PROGRAMNAME"))
		{
			if(text.contains("PROGRAMNAME"))
			{
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				//iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1));
				if(CreateProgramAPI.PROGRAMNameList.get(0).contains("\""))
				{
					iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1));
				}
				else
				{
					iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), CreateProgramAPI.PROGRAMNameList.get(0));
				}
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
			else
			{
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), text);
			}
		}
		else
		{	
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), text);
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}	
	}
	
	public void iSearchWithSearchListFieldOnOrganizationInSearchBox(String searchParam, String org) throws ClassNotFoundException, SQLException{
		String value = searchParam;
		if (org.equalsIgnoreCase("Managing")){
			if (value.equals("MONAME")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("PID")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateManagingOrganizationAPI.participantidList.get(0).substring(1, CreateManagingOrganizationAPI.participantidList.get(0).length()-1));
				  value=CreateManagingOrganizationAPI.participantidList.get(0).substring(1, CreateManagingOrganizationAPI.participantidList.get(0).length()-1);
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("MO_ID")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateManagingOrganizationAPI.managingOrgID.toString());
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateManagingOrganizationAPI.managingOrgID+"')]")));
			  }
			  else
			  {
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), value.replace("-", "").trim());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]")));
			  }
			}
		  else if (org.equalsIgnoreCase("Hospital")){
			  if (value.equals("ACHNAME - YES")){
				  if(CreateACHOrganizationAPI.ACHNameList.get(0).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1));
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganizationAPI.ACHNameList.get(0).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("ACHNAME - NO")){
				  if(CreateACHOrganizationAPI.ACHNameList.get(1).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1)); 
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganizationAPI.ACHNameList.get(1).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  
			  else if (value.equals("Hosp_Id - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganizationAPI.copyIDList.get(0).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateACHOrganizationAPI.copyIDList.get(0)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateACHOrganizationAPI.copyIDList.get(0)+"')]")));
			  }
			  else if (value.equals("Hosp_Id - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganizationAPI.copyIDList.get(1).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateACHOrganizationAPI.copyIDList.get(1)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateACHOrganizationAPI.copyIDList.get(1)+"')]")));
			  }
			  
			  else if (value.equals("CCN - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganizationAPI.CCNNameList.get(0).substring(1, CreateACHOrganizationAPI.CCNNameList.get(0).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateACHOrganizationAPI.CCNNameList.get(0).substring(1, CreateACHOrganizationAPI.CCNNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("CCN - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganizationAPI.CCNNameList.get(1).substring(1, CreateACHOrganizationAPI.CCNNameList.get(1).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateACHOrganizationAPI.CCNNameList.get(1).substring(1, CreateACHOrganizationAPI.CCNNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else
			  {
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), value.replace("-", "").trim());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]")));
			  }
	     }
		  else if (org.equalsIgnoreCase("PGP")){
			  if (value.equals("PGPNAME - YES")){
				  if(CreatePGPOrganizationAPI.PGPNameList.get(0).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganizationAPI.PGPNameList.get(0).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(0).length()-1));
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganizationAPI.PGPNameList.get(0).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreatePGPOrganizationAPI.PGPNameList.get(0).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("PGPNAME - NO")){
				  if(CreatePGPOrganizationAPI.PGPNameList.get(1).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganizationAPI.PGPNameList.get(1).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(1).length()-1)); 
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganizationAPI.PGPNameList.get(1).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreatePGPOrganizationAPI.PGPNameList.get(1).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  
			  else if (value.equals("PGP_Id - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganizationAPI.PGPcopyIDList.get(0).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreatePGPOrganizationAPI.PGPcopyIDList.get(0)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreatePGPOrganizationAPI.PGPcopyIDList.get(0)+"')]")));
			  }
			  else if (value.equals("PGP_Id - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganizationAPI.PGPcopyIDList.get(1).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreatePGPOrganizationAPI.PGPcopyIDList.get(1)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreatePGPOrganizationAPI.PGPcopyIDList.get(1)+"')]")));
			  }
			  
			  else if (value.equals("EIN - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganizationAPI.EINNameList.get(0).substring(1, CreatePGPOrganizationAPI.EINNameList.get(0).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreatePGPOrganizationAPI.EINNameList.get(0).substring(1, CreatePGPOrganizationAPI.EINNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("EIN - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganizationAPI.EINNameList.get(1).substring(1, CreatePGPOrganizationAPI.EINNameList.get(1).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreatePGPOrganizationAPI.EINNameList.get(1).substring(1, CreatePGPOrganizationAPI.EINNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else
			  {
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), value.replace("-", "").trim());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]")));
			  }
	     }
		  else if (org.equalsIgnoreCase("Payor")){
			  if (value.equals("PAYORNAME"))
			  {
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePayorOrganizationAPI.PayorNameList.get(0).substring(1, CreatePayorOrganizationAPI.PayorNameList.get(0).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreatePayorOrganizationAPI.PayorNameList.get(0).substring(1, CreatePayorOrganizationAPI.PayorNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("PID")){
				  //String query = "SELECT participant_id from program_management.organization where name = '"+CreatePayorOrganization.payorOrg.get("PAYORNAME")+"'";
				  value = CreatePayorOrganizationAPI.participantidList.get(0).substring(1, CreatePayorOrganizationAPI.participantidList.get(0).length()-1);
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), value);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else
			  {
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), value.replace("-", "").trim());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]")));
			  }
		  }
		  else if (org.equalsIgnoreCase("SNF")){
			  if (value.equals("SNFNAME - YES")){
				  if(CreateSNFOrganizationAPI.SNFNameList.get(0).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganizationAPI.SNFNameList.get(0).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1));
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganizationAPI.SNFNameList.get(0).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateSNFOrganizationAPI.SNFNameList.get(0).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("SNFNAME - NO")){
				  if(CreateSNFOrganizationAPI.SNFNameList.get(1).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganizationAPI.SNFNameList.get(1).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(1).length()-1)); 
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganizationAPI.SNFNameList.get(1).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateSNFOrganizationAPI.SNFNameList.get(1).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("SNF_Id - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganizationAPI.SNFcopyIDList.get(0).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateSNFOrganizationAPI.SNFcopyIDList.get(0)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateSNFOrganizationAPI.SNFcopyIDList.get(0)+"')]")));
			  }
			  else if (value.equals("SNF_Id - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganizationAPI.SNFcopyIDList.get(1).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateSNFOrganizationAPI.SNFcopyIDList.get(1)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateSNFOrganizationAPI.SNFcopyIDList.get(1)+"')]")));
			  }
			  else if (value.equals("CCN - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganizationAPI.CCNNameList.get(0).substring(1, CreateSNFOrganizationAPI.CCNNameList.get(0).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateSNFOrganizationAPI.CCNNameList.get(0).substring(1, CreateSNFOrganizationAPI.CCNNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("CCN - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganizationAPI.CCNNameList.get(1).substring(1, CreateSNFOrganizationAPI.CCNNameList.get(1).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateSNFOrganizationAPI.CCNNameList.get(1).substring(1, CreateSNFOrganizationAPI.CCNNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else
			  {
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), value.replace("-", "").trim());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]")));
			  }
		  }
		
		  else if (org.equalsIgnoreCase("IRF")){
			  if (value.equals("IRFNAME - YES")){
				  if(CreateIRFOrganizationAPI.IRFNameList.get(0).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganizationAPI.IRFNameList.get(0).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(0).length()-1));
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganizationAPI.IRFNameList.get(0).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateIRFOrganizationAPI.IRFNameList.get(0).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("IRFNAME - NO")){
				  if(CreateIRFOrganizationAPI.IRFNameList.get(1).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganizationAPI.IRFNameList.get(1).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(1).length()-1)); 
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganizationAPI.IRFNameList.get(1).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateIRFOrganizationAPI.IRFNameList.get(1).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("IRF_Id - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganizationAPI.IRFcopyIDList.get(0).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateIRFOrganizationAPI.IRFcopyIDList.get(0)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateIRFOrganizationAPI.IRFcopyIDList.get(0)+"')]")));
			  }
			  else if (value.equals("IRF_Id - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganizationAPI.IRFcopyIDList.get(1).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateIRFOrganizationAPI.IRFcopyIDList.get(1)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateIRFOrganizationAPI.IRFcopyIDList.get(1)+"')]")));
			  }
			  else if (value.equals("CCN - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganizationAPI.CCNNameList.get(0).substring(1, CreateIRFOrganizationAPI.CCNNameList.get(0).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateIRFOrganizationAPI.CCNNameList.get(0).substring(1, CreateIRFOrganizationAPI.CCNNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("CCN - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganizationAPI.CCNNameList.get(1).substring(1, CreateIRFOrganizationAPI.CCNNameList.get(1).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateIRFOrganizationAPI.CCNNameList.get(1).substring(1, CreateIRFOrganizationAPI.CCNNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else
			  {
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), value.replace("-", "").trim());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]")));
			  }
		  }
		
		  else if (org.equalsIgnoreCase("HHA")){
			  if (value.equals("HHANAME - YES")){
				  if(CreateHHAOrganizationAPI.HHANameList.get(0).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganizationAPI.HHANameList.get(0).substring(1, CreateHHAOrganizationAPI.HHANameList.get(0).length()-1));
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganizationAPI.HHANameList.get(0).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateHHAOrganizationAPI.HHANameList.get(0).substring(1, CreateHHAOrganizationAPI.HHANameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("HHANAME - NO")){
				  if(CreateHHAOrganizationAPI.HHANameList.get(1).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganizationAPI.HHANameList.get(1).substring(1, CreateHHAOrganizationAPI.HHANameList.get(1).length()-1)); 
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganizationAPI.HHANameList.get(1).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateHHAOrganizationAPI.HHANameList.get(1).substring(1, CreateHHAOrganizationAPI.HHANameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("HHA_Id - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganizationAPI.HHAcopyIDList.get(0).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateHHAOrganizationAPI.HHAcopyIDList.get(0)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateHHAOrganizationAPI.HHAcopyIDList.get(0)+"')]")));
			  }
			  else if (value.equals("HHA_Id - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganizationAPI.HHAcopyIDList.get(1).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateHHAOrganizationAPI.HHAcopyIDList.get(1)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateHHAOrganizationAPI.HHAcopyIDList.get(1)+"')]")));
			  }
			  else if (value.equals("CCN - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganizationAPI.CCNNameList.get(0).substring(1, CreateHHAOrganizationAPI.CCNNameList.get(0).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateHHAOrganizationAPI.CCNNameList.get(0).substring(1, CreateHHAOrganizationAPI.CCNNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("CCN - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganizationAPI.CCNNameList.get(1).substring(1, CreateHHAOrganizationAPI.CCNNameList.get(1).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateHHAOrganizationAPI.CCNNameList.get(1).substring(1, CreateHHAOrganizationAPI.CCNNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else
			  {
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), value.replace("-", "").trim());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]")));
			  }
		  }
		
		  else if (org.equalsIgnoreCase("Hospice")){
			  if (value.equals("HOSPICENAME - YES")){
				  if(CreateHospiceOrganizationAPI.HospiceNameList.get(0).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganizationAPI.HospiceNameList.get(0).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(0).length()-1));
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganizationAPI.HospiceNameList.get(0).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateHospiceOrganizationAPI.HospiceNameList.get(0).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("HOSPICENAME - NO")){
				  if(CreateHospiceOrganizationAPI.HospiceNameList.get(1).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganizationAPI.HospiceNameList.get(1).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(1).length()-1)); 
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganizationAPI.HospiceNameList.get(1).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateHospiceOrganizationAPI.HospiceNameList.get(1).substring(1, CreateHospiceOrganizationAPI.HospiceNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("Hospice_Id - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganizationAPI.HospicecopyIDList.get(0).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateHospiceOrganizationAPI.HospicecopyIDList.get(0)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateHospiceOrganizationAPI.HospicecopyIDList.get(0)+"')]")));
			  }
			  else if (value.equals("Hospice_Id - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganizationAPI.HospicecopyIDList.get(1).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateHospiceOrganizationAPI.HospicecopyIDList.get(1)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateHospiceOrganizationAPI.HospicecopyIDList.get(1)+"')]")));
			  }
			  else if (value.equals("CCN - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganizationAPI.CCNNameList.get(0).substring(1, CreateHospiceOrganizationAPI.CCNNameList.get(0).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateHospiceOrganizationAPI.CCNNameList.get(0).substring(1, CreateHospiceOrganizationAPI.CCNNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("CCN - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganizationAPI.CCNNameList.get(1).substring(1, CreateHospiceOrganizationAPI.CCNNameList.get(1).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateHospiceOrganizationAPI.CCNNameList.get(1).substring(1, CreateHospiceOrganizationAPI.CCNNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else
			  {
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), value.replace("-", "").trim());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]")));
			  }
		  }
		
		  else if (org.equalsIgnoreCase("LTCH")){
			  if (value.equals("LTCHNAME - YES")){
				  if(CreateLTCHOrganizationAPI.LTCHNameList.get(0).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganizationAPI.LTCHNameList.get(0).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(0).length()-1));
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganizationAPI.LTCHNameList.get(0).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateLTCHOrganizationAPI.LTCHNameList.get(0).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("LTCHNAME - NO")){
				  if(CreateLTCHOrganizationAPI.LTCHNameList.get(1).contains("\""))
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganizationAPI.LTCHNameList.get(1).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(1).length()-1)); 
				  }
				  else
				  {
					  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganizationAPI.LTCHNameList.get(1).toString());
				  }
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateLTCHOrganizationAPI.LTCHNameList.get(1).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("LTCH_Id - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganizationAPI.LTCHcopyIDList.get(0).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateLTCHOrganizationAPI.LTCHcopyIDList.get(0)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateLTCHOrganizationAPI.LTCHcopyIDList.get(0)+"')]")));
			  }
			  else if (value.equals("LTCH_Id - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganizationAPI.LTCHcopyIDList.get(1).toString());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateLTCHOrganizationAPI.LTCHcopyIDList.get(1)+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreateLTCHOrganizationAPI.LTCHcopyIDList.get(1)+"')]")));
			  }
			  else if (value.equals("CCN - YES")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganizationAPI.CCNNameList.get(0).substring(1, CreateLTCHOrganizationAPI.CCNNameList.get(0).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateLTCHOrganizationAPI.CCNNameList.get(0).substring(1, CreateLTCHOrganizationAPI.CCNNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("CCN - NO")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganizationAPI.CCNNameList.get(1).substring(1, CreateLTCHOrganizationAPI.CCNNameList.get(1).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateLTCHOrganizationAPI.CCNNameList.get(1).substring(1, CreateLTCHOrganizationAPI.CCNNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else
			  {
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), value.replace("-", "").trim());
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+(value.replace("-", "").trim())+"')]")));
			  }
	     }
	}	
	
	public void iVerifySearchBarOnOrganizationPage(String text) {
		iWillWaitToSee(By.cssSelector(".text-input-field-organizationFilterTerm"));
		Assert.assertTrue(isElementPresent(By.cssSelector(".text-input-field-organizationFilterTerm")));
	}
	
	public void iVerifytheNewMatchesMessage(String text) {
		scrollIntoViewByJS(driver.findElement(By.cssSelector(".data-table-overlay-message")));
		iWillWaitToSee(By.cssSelector(".data-table-overlay-message"));
		Assert.assertEquals(text, driver.findElement(By.cssSelector(".data-table-overlay-message")).getText().trim());
	}
	
	public void iVerifytheCreateNewOrganizationLinkUnderNoMatches(String link) {
		Assert.assertEquals(link, driver.findElement(By.cssSelector(".data-table-overlay-link>a")).getText().trim());
	}

	public void iVerifyFieldInSearchListOnOrganizationHomepage(String text) {
		if(text.contains("MONAME"))
		{
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			if(CreateManagingOrganizationAPI.MONameList.get(0).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateManagingOrganizationAPI.MONameList.get(0).substring(0, CreateManagingOrganizationAPI.MONameList.get(0).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateManagingOrganizationAPI.MONameList.get(0)+"']"));
			}
		}
		else if(text.contains("ACHNAME - YES")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			//isElementPresentOnPage(By.xpath("//div[text()='"+CreateACHOrganization.achOrg.get("ACHNAME")+"']"));
			if(CreateACHOrganizationAPI.ACHNameList.get(0).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(0).substring(0, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(0)+"']"));
			}
		}
		else if(text.contains("ACHNAME - NO")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			//isElementPresentOnPage(By.xpath("//div[text()='"+CreateACHOrganization.achOrg_noMO.get("ACHNAME")+"']"));
			if(CreateACHOrganizationAPI.ACHNameList.get(1).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(1).substring(0, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateACHOrganizationAPI.ACHNameList.get(1)+"']"));
			}
		}
		else if(text.contains("PAYORNAME"))
		{
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			if(CreatePayorOrganizationAPI.PayorNameList.get(0).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreatePayorOrganizationAPI.PayorNameList.get(0).substring(0, CreatePayorOrganizationAPI.PayorNameList.get(0).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreatePayorOrganizationAPI.PayorNameList.get(0)+"']"));
			}
		}
		else if(text.contains("SNFNAME - YES")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			if(CreateSNFOrganizationAPI.SNFNameList.get(0).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(0).substring(0, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(0)+"']"));
			}
		}
		else if(text.contains("SNFNAME - NO")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			if(CreateSNFOrganizationAPI.SNFNameList.get(1).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(1).substring(0, CreateSNFOrganizationAPI.SNFNameList.get(1).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateSNFOrganizationAPI.SNFNameList.get(1)+"']"));
			}
		}
		else if(text.contains("PGPNAME - YES")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			//isElementPresentOnPage(By.xpath("//div[text()='"+CreateACHOrganization.achOrg.get("ACHNAME")+"']"));
			if(CreatePGPOrganizationAPI.PGPNameList.get(0).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(0).substring(0, CreatePGPOrganizationAPI.PGPNameList.get(0).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(0)+"']"));
			}
		}
		else if(text.contains("PGPNAME - NO")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			//isElementPresentOnPage(By.xpath("//div[text()='"+CreateACHOrganization.achOrg_noMO.get("ACHNAME")+"']"));
			if(CreatePGPOrganizationAPI.PGPNameList.get(1).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(1).substring(0, CreatePGPOrganizationAPI.PGPNameList.get(1).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(1)+"']"));
			}
		}
		else if(text.contains("LTCHNAME - YES")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			if(CreateLTCHOrganizationAPI.LTCHNameList.get(0).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateLTCHOrganizationAPI.LTCHNameList.get(0).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(0).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateLTCHOrganizationAPI.LTCHNameList.get(0)+"']"));
			}
		}
		else if(text.contains("LTCHNAME - NO")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			if(CreateLTCHOrganizationAPI.LTCHNameList.get(1).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateLTCHOrganizationAPI.LTCHNameList.get(1).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(1).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateLTCHOrganizationAPI.LTCHNameList.get(1)+"']"));
			}
		}
		
		else if(text.contains("IRFNAME - YES")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			if(CreateIRFOrganizationAPI.IRFNameList.get(0).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateIRFOrganizationAPI.IRFNameList.get(0).substring(0, CreateIRFOrganizationAPI.IRFNameList.get(0).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateIRFOrganizationAPI.IRFNameList.get(0)+"']"));
			}
		}
		else if(text.contains("IRFNAME - NO")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			if(CreateIRFOrganizationAPI.IRFNameList.get(1).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateIRFOrganizationAPI.IRFNameList.get(1).substring(0, CreateIRFOrganizationAPI.IRFNameList.get(1).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateIRFOrganizationAPI.IRFNameList.get(1)+"']"));
			}
		}
		
		else if(text.contains("HOSPICENAME - YES")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			if(CreateHospiceOrganizationAPI.HospiceNameList.get(0).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateHospiceOrganizationAPI.HospiceNameList.get(0).substring(0, CreateHospiceOrganizationAPI.HospiceNameList.get(0).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateHospiceOrganizationAPI.HospiceNameList.get(0)+"']"));
			}
		}
		else if(text.contains("HOSPICENAME - NO")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			if(CreateHospiceOrganizationAPI.HospiceNameList.get(1).contains("\""))
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateHospiceOrganizationAPI.HospiceNameList.get(1).substring(0, CreateHospiceOrganizationAPI.HospiceNameList.get(1).length()-1)+"']"));
			}
			else
			{
				isElementPresentOnPage(By.xpath("//div[text()='"+CreateHospiceOrganizationAPI.HospiceNameList.get(1)+"']"));
			}
		}
		else if(text.contains("PROGRAMNAME")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			isElementPresentOnPage(By.xpath("//div[text()='"+CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1)+"']"));
		}
		else
		{
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			isElementPresentOnPage(By.xpath("//div[text()='"+text+"']"));
		}	
	}
	
	public void iSearchWithOldNameInOrganizationSerachBox(String org){
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")).clear();
		if (org.equals("MONAME"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateManagingOrganization.moName);
		}
		else if(org.equals("ACHNAME - YES"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.oldACH_WithMO);
		}
		else if (org.equals("ACHNAME - NO"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.oldACH_WithoutMO);
		}
		else if(org.equals("PGPNAME - YES"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganization.oldPGP_WithMO);
		}
		else if (org.equals("PGPNAME - NO"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganization.oldPGP_WithoutMO);
		}
		else if (org.equals("PAYORNAME"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePayorOrganization.oldPayorOrg);
		}
		else if(org.equals("SNFNAME - YES"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganization.oldSNF_WithMO);
		}
		else if (org.equals("SNFNAME - NO"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganization.oldSNF_WithoutMO);
		}
		else if(org.equals("HHANAME - YES"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganization.oldHHA_WithMO );
		}
		else if (org.equals("HHANAME - NO"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganization.oldHHA_WithoutMO);
		}
		else if(org.equals("LTCHNAME - YES"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganization.oldLTCH_WithMO);
		}
		else if (org.equals("LTCHNAME - NO"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganization.oldLTCH_WithoutMO);
		}
		else if(org.equals("IRFNAME - YES"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganization.oldIRF_WithMO);
		}
		else if (org.equals("IRFNAME - NO"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganization.oldIRF_WithoutMO);
		}
		else if(org.equals("HOSPICENAME - YES"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganization.oldHospice_WithMO);
		}
		else if (org.equals("HOSPICENAME - NO"))
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganization.oldHospice_WithoutMO);
		}
	}
	
	public void iSearchWithSearchListFieldOnLocationInOrganizationProfilePage(String searchParam, String org) throws ClassNotFoundException, SQLException{ 
		String value = searchParam;
		if(org.equals("ACHNAME - YES"))
		{
			if(value.equals("LocIndexId")){
				String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1)+"')and address_type_id=2";
				LocIndexIdList.addAll(fetchLocationIndexID(query));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), LocIndexIdList.get(0));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+LocIndexIdList.get(0)+"')]")));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), value);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+value+"')]")));	
			}
		}
		else if(org.equals("ACHNAME - NO"))
		{
			if(value.equals("LocIndexId")){
				String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1)+"')and address_type_id=2";
				LocIndexIdList.addAll(fetchLocationIndexID(query));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), LocIndexIdList.get(0));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+LocIndexIdList.get(0)+"')]")));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), value);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+value+"')]")));	
			}
		}
		else if(org.equals("SNFNAME - YES"))
		{
			if(value.equals("LocIndexId")){
				String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateSNFOrganizationAPI.SNFNameList.get(0).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1)+"')and address_type_id=2";
				LocIndexIdList.addAll(fetchLocationIndexID(query));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), LocIndexIdList.get(0));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+LocIndexIdList.get(0)+"')]")));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), value);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+value+"')]")));	
			}
		}
		else if(org.equals("SNFNAME - NO"))
		{
			if(value.equals("LocIndexId")){
				String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateSNFOrganizationAPI.SNFNameList.get(1).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(1).length()-1)+"')and address_type_id=2";
				LocIndexIdList.addAll(fetchLocationIndexID(query));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), LocIndexIdList.get(0));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+LocIndexIdList.get(0)+"')]")));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), value);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+value+"')]")));	
			}
		}
		
		else if(org.equals("LTCHNAME - YES"))
		{
			if(value.equals("LocIndexId")){
				String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateLTCHOrganizationAPI.LTCHNameList.get(0).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(0).length()-1)+"')and address_type_id=2";
				LocIndexIdList.addAll(fetchLocationIndexID(query));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), LocIndexIdList.get(0));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+LocIndexIdList.get(0)+"')]")));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), value);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+value+"')]")));	
			}
		}
		else if(org.equals("LTCHNAME - NO"))
		{
			if(value.equals("LocIndexId")){
				String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateLTCHOrganizationAPI.LTCHNameList.get(1).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(1).length()-1)+"')and address_type_id=2";
				LocIndexIdList.addAll(fetchLocationIndexID(query));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), LocIndexIdList.get(0));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+LocIndexIdList.get(0)+"')]")));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), value);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+value+"')]")));	
			}
		}
		
		else if(org.equals("IRFNAME - YES"))
		{
			if(value.equals("LocIndexId")){
				String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateIRFOrganizationAPI.IRFNameList.get(0).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(0).length()-1)+"')and address_type_id=2";
				LocIndexIdList.addAll(fetchLocationIndexID(query));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), LocIndexIdList.get(0));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+LocIndexIdList.get(0)+"')]")));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), value);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+value+"')]")));	
			}
		}
		else if(org.equals("IRFNAME - NO"))
		{
			if(value.equals("LocIndexId")){
				String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateIRFOrganizationAPI.IRFNameList.get(1).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(1).length()-1)+"')and address_type_id=2";
				LocIndexIdList.addAll(fetchLocationIndexID(query));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), LocIndexIdList.get(0));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+LocIndexIdList.get(0)+"')]")));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), value);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+value+"')]")));	
			}
		}
		
		else
		{
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), value);
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+value+"')]")));
		}
	}
	
	public void iSearchFieldOnLocationParametersonViewProfilePage(String text, String org) {
		iWillWaitToSee(By.cssSelector(".text-input-field-locationFilterTerm"));
		iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), text);
	}
	
	public void iSearchFieldOnACHandSNFOrganizationInSearchBox(String text, String org){
		if(text.contains("ACHNAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg.get("ACHNAME"));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("ACHNAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateACHOrganization.achOrg_noMO.get("ACHNAME"));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("SNFNAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganization.SNFOrg.get("SNFNAME"));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("SNFNAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateSNFOrganization.SNFOrg_noMO.get("SNFNAME"));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("LTCHNAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganization.LTCHOrg.get("LTCHNAME"));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("LTCHNAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateLTCHOrganization.LTCHOrg_noMO.get("LTCHNAME"));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("IRFNAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganization.IRFOrg.get("IRFNAME"));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("IRFNAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateIRFOrganization.IRFOrg_noMO.get("IRFNAME"));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
	}
}