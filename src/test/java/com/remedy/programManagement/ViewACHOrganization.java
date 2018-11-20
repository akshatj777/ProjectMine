package com.remedy.programManagement;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.remedy.baseClass.BaseClass;

public class ViewACHOrganization  extends BaseClass{

	public static String orgCount;
	List<String> LocIndexIdList= new ArrayList<>();
	
	public ViewACHOrganization(WebDriver driver) {
		super(driver);
	}
	
	public void iVerifyHeaderNameUnderSelectedOrganization(String tab) {
		iVerifyTextFromListOfElement(By.cssSelector(".data-table-header-cell>a"), tab);	
	}
	
	public void iVerifyCCNOnViewProfileOfSelectedOrganization(String text, String org) {
		if (org.contains("Hospital"))
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateACHOrganizationAPI.CCNNameList.get(0).substring(1, CreateACHOrganizationAPI.CCNNameList.get(0).length()-1),actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateACHOrganizationAPI.CCNNameList.get(1).substring(1, CreateACHOrganizationAPI.CCNNameList.get(1).length()-1),actual.replace("|", ""));
			}
		}
		else if (org.contains("SNF"))
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
				Assert.assertEquals("CCN: "+CreateSNFOrganizationAPI.CCNNameList.get(0).substring(1, CreateSNFOrganizationAPI.CCNNameList.get(0).length()-1),actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
				Assert.assertEquals("CCN: "+CreateSNFOrganizationAPI.CCNNameList.get(1).substring(1, CreateSNFOrganizationAPI.CCNNameList.get(1).length()-1),actual.replace("|", ""));
			}
		}
		else if (org.contains("HHA"))
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
				Assert.assertEquals("CCN: "+CreateHHAOrganizationAPI.CCNNameList.get(0).substring(1, CreateHHAOrganizationAPI.CCNNameList.get(0).length()-1),actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
				Assert.assertEquals("CCN: "+CreateHHAOrganizationAPI.CCNNameList.get(1).substring(1, CreateHHAOrganizationAPI.CCNNameList.get(1).length()-1),actual.replace("|", ""));
			}
		}
		else if (org.contains("Hospice"))
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
				Assert.assertEquals("CCN: "+CreateHospiceOrganizationAPI.CCNNameList.get(0).substring(1, CreateHospiceOrganizationAPI.CCNNameList.get(0).length()-1),actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
				Assert.assertEquals("CCN: "+CreateHospiceOrganizationAPI.CCNNameList.get(1).substring(1, CreateHospiceOrganizationAPI.CCNNameList.get(1).length()-1),actual.replace("|", ""));
			}
		}
		else if (org.contains("LTCH"))
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
				Assert.assertEquals("CCN: "+CreateLTCHOrganizationAPI.CCNNameList.get(0).substring(1, CreateLTCHOrganizationAPI.CCNNameList.get(0).length()-1),actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
				Assert.assertEquals("CCN: "+CreateLTCHOrganizationAPI.CCNNameList.get(1).substring(1, CreateLTCHOrganizationAPI.CCNNameList.get(1).length()-1),actual.replace("|", ""));
			}
		}
		else if (org.contains("IRF"))
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
				Assert.assertEquals("CCN: "+CreateIRFOrganizationAPI.CCNNameList.get(0).substring(1, CreateIRFOrganizationAPI.CCNNameList.get(0).length()-1),actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
				Assert.assertEquals("CCN: "+CreateIRFOrganizationAPI.CCNNameList.get(1).substring(1, CreateIRFOrganizationAPI.CCNNameList.get(1).length()-1),actual.replace("|", ""));
			}
		}
		else
		{
			String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
		    Assert.assertEquals("CCN: "+text,actual.replace("|", ""));
		}
	}
	
	public void iVerifyEINTINIdOnViewProfileOrganization(String text, String org) {
		if (org.contains("Hospital"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateACHOrganizationAPI.EINNameList.get(0).substring(1, CreateACHOrganizationAPI.EINNameList.get(0).length()-1),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateACHOrganizationAPI.EINNameList.get(1).substring(1, CreateACHOrganizationAPI.EINNameList.get(1).length()-1),actual);
			}
		}
		else if (org.contains("PGP"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreatePGPOrganizationAPI.EINNameList.get(0).substring(1, CreatePGPOrganizationAPI.EINNameList.get(0).length()-1),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreatePGPOrganizationAPI.EINNameList.get(1).substring(1, CreatePGPOrganizationAPI.EINNameList.get(1).length()-1),actual);
			}
		}
		else if (org.contains("SNF"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateSNFOrganizationAPI.EINNameList.get(0).substring(1, CreateSNFOrganizationAPI.EINNameList.get(0).length()-1),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateSNFOrganizationAPI.EINNameList.get(1).substring(1, CreateSNFOrganizationAPI.EINNameList.get(1).length()-1),actual);
			}
		}
		else if (org.contains("HHA"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHHAOrganizationAPI.EINNameList.get(0).substring(1, CreateHHAOrganizationAPI.EINNameList.get(0).length()-1),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHHAOrganizationAPI.EINNameList.get(1).substring(1, CreateHHAOrganizationAPI.EINNameList.get(1).length()-1),actual);
			}
		}
		else if (org.contains("LTCH"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateLTCHOrganizationAPI.EINNameList.get(0).substring(1, CreateLTCHOrganizationAPI.EINNameList.get(0).length()-1),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateLTCHOrganizationAPI.EINNameList.get(1).substring(1, CreateLTCHOrganizationAPI.EINNameList.get(1).length()-1),actual);
			}
		}
		else if (org.contains("IRF"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateIRFOrganizationAPI.EINNameList.get(0).substring(1, CreateIRFOrganizationAPI.EINNameList.get(0).length()-1),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateIRFOrganizationAPI.EINNameList.get(1).substring(1, CreateIRFOrganizationAPI.EINNameList.get(1).length()-1),actual);
			}
		}
		else if (org.contains("Hospice"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHospiceOrganizationAPI.EINNameList.get(0).substring(1, CreateHospiceOrganizationAPI.EINNameList.get(0).length()-1),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHospiceOrganizationAPI.EINNameList.get(1).substring(1, CreateHospiceOrganizationAPI.EINNameList.get(1).length()-1),actual);
			}
		}
		else 
		{
			String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
			actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
			Assert.assertEquals(text,actual);
		}
	}
	
	public void iVerifyRegionNameInVeiwProfileOfSelectedOrganization(String region)
	{
		if(isElementPresentOnPage(By.cssSelector(".region-name"))) 
		{	
			String actual = getTextForElement(driver.findElement(By.cssSelector(".region-name"))); 
			actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
		    Assert.assertEquals(region,actual);
		}
	}
	
	public void iVerifyMarketNameInVeiwProfileOfSelectedOrganization(String market) 
	{
		if(isElementPresentOnPage(By.cssSelector(".region-market-view>.id.market-name"))) 
		{	
			String actual = getTextForElement(driver.findElement(By.cssSelector(".region-market-view>.id.market-name"))); 
			actual = actual.substring((actual.indexOf(":"))+1).trim();
		    Assert.assertEquals(market,actual);
		}
	}
	
	public void iVerifyNPIOnViewProfileOrganization(String text, String org) {
		if(org.contains("Hospital"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateACHOrganizationAPI.NPINameList.get(0).substring(1, CreateACHOrganizationAPI.NPINameList.get(0).length()-1),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateACHOrganizationAPI.NPINameList.get(1).substring(1, CreateACHOrganizationAPI.NPINameList.get(1).length()-1),actual);	
			}
		}
		else if(org.contains("PGP"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreatePGPOrganizationAPI.NPINameList.get(0).substring(1, CreatePGPOrganizationAPI.NPINameList.get(0).length()-1),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreatePGPOrganizationAPI.NPINameList.get(1).substring(1, CreatePGPOrganizationAPI.NPINameList.get(1).length()-1),actual);	
			}
		}
		else if(org.contains("SNF"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateSNFOrganizationAPI.NPINameList.get(0).substring(1, CreateSNFOrganizationAPI.NPINameList.get(0).length()-1),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateSNFOrganizationAPI.NPINameList.get(1).substring(1, CreateSNFOrganizationAPI.NPINameList.get(1).length()-1),actual);	
			}
		}
		else if(org.contains("HHA"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHHAOrganizationAPI.NPINameList.get(0).substring(1, CreateHHAOrganizationAPI.NPINameList.get(0).length()-1),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHHAOrganizationAPI.NPINameList.get(1).substring(1, CreateHHAOrganizationAPI.NPINameList.get(1).length()-1),actual);	
			}
		}
		else if(org.contains("LTCH"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateLTCHOrganizationAPI.NPINameList.get(0).substring(1, CreateLTCHOrganizationAPI.NPINameList.get(0).length()-1),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateLTCHOrganizationAPI.NPINameList.get(1).substring(1, CreateLTCHOrganizationAPI.NPINameList.get(1).length()-1),actual);	
			}
		}

		else if(org.contains("IRF"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateIRFOrganizationAPI.NPINameList.get(0).substring(1, CreateIRFOrganizationAPI.NPINameList.get(0).length()-1),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateIRFOrganizationAPI.NPINameList.get(1).substring(1, CreateIRFOrganizationAPI.NPINameList.get(1).length()-1),actual);	
			}
		}
		else if(org.contains("Hospice"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHospiceOrganizationAPI.NPINameList.get(0).substring(1, CreateHospiceOrganizationAPI.NPINameList.get(0).length()-1),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHospiceOrganizationAPI.NPINameList.get(1).substring(1, CreateHospiceOrganizationAPI.NPINameList.get(1).length()-1),actual);	
			}
		}
		else
		{
			String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi")));
			actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
			Assert.assertEquals(text,actual);	
		}
	}
	
	public void iVerifytheCountOftheLoaction(String text){
		verifyTextForElement(driver.findElement(By.cssSelector(".fixed-data-table.ach-snf-location-data-table>div")), text);
	}
	
	public void iClickonAddNewLocationButton(String button){
		clickElement(driver.findElement(By.cssSelector(".row.col-md-11>button")));
	}
	
	public void iVerifytheSaerchBarinLocationonProfilePage(String text){
		isElementPresent(By.cssSelector(".text-input-field-locationFilterTerm"));
	}
	
	public void userShouldGetRedirectedToTheOrganizationTabPage(String text){
		iWillWaitToSee(By.cssSelector(".navLink.noselect"));
		iVerifyTextFromListOfElement(By.cssSelector(".navLink.noselect"), text);
	}
	
	public void iVerifyMONameInVeiwProfileOfSelectedOrganization(String name, String org){
		iWillWaitToSee(By.cssSelector(".navLink.noselect"));
		iVerifyTextFromListOfElement(By.cssSelector("..navLink.noselect"), name);
	}

	public void iVerifyParticipantIDInVeiwProfileOfSelectedOrganization(String name, String org){
		iWillWaitToSee(By.cssSelector(".navLink.noselect"));
		iVerifyTextFromListOfElement(By.cssSelector("..navLink.noselect"), name);
	}
	
	public void iVerifyManagingOrganizationOnViewProfileOfOrganizationPage(String text, String org) throws ClassNotFoundException, SQLException{
		String result = null;	
		if(text.contains("YES"))
			{
				if(text.contains("Managing Organization"))
				{
					delay();
					result = getTextForElement(driver.findElement(By.xpath("//span[contains(text(),'Managing Organization:')]")));
					result = result.substring(result.indexOf(":")+1, result.indexOf("|")).trim();
					Assert.assertEquals(result,CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1));
				}
				else if(text.contains("Participant Id"))
				{
					//String query = "SELECT participant_id from program_management.organization where name = '"+CreateManagingOrganization.moOrg.get("MONAME")+"'";
					result = getTextForElement(driver.findElement(By.cssSelector(".id.participant-id")));
					result = result.substring(result.indexOf(":")+1).trim();
					String result1 = CreateManagingOrganizationAPI.participantidList.get(0);
					Assert.assertEquals(result,result1);
				}
			}
			else
			{
				result = getTextForElement(driver.findElement(By.cssSelector(".managing-org-view"))).trim();
				Assert.assertEquals(result,"This Organization does not have a Managing Organization");
			}
	}
	
	public void iVerifyMORadioButtonChecked(String name)
	{
		if(name.contains("Has"))
		{
			boolean bol = driver.findElement(By.cssSelector(".radio-button->input[value='true']")).isSelected();
			Assert.assertTrue(bol);		
		}
		else
		{
			boolean bol = driver.findElement(By.cssSelector(".radio-button->input[value='false']")).isSelected();
			Assert.assertTrue(bol);
		}
	}
	
	public void iVerifyManagingOrganizationOnAutoFilledOnOrganizationPage(String org)
	{
//		List<WebElement> listItems = driver.findElements(By.cssSelector("span[aria-selected='true']"));
//		for (WebElement item : listItems) 
//		{
//			  if (item.getText().trim().contains(CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1)))
//			  {
//				  Assert.assertTrue(item.getText().trim().contains(CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1)));  
//			  } 
//		}
		Assert.assertTrue(driver.findElement(By.xpath("//span[text()='Has a Managing Organization']/parent::div/parent::div//span[@class='Select-value-label']")).getText().trim().contains(CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1).trim()));
		
	}
	
	public void iVerifyDetailsOfOrgAssociatedWithMO(String name, String org){
		if(org.contains("Hospital"))
		{
			if(name.contains("ACHNAME"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateACHOrganization.achOrg.get("ACHNAME")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreateACHOrganization.achOrg.get("ACHNAME")+"']")));
			}
			else if(name.contains("CCN"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateACHOrganization.achOrg.get("CCN")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreateACHOrganization.achOrg.get("CCN")+"']")));
			}
		}
		else if(org.contains("PGP"))
		{
			if(name.contains("PGPNAME"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(0).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(0).length()-1)+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(0).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(0).length()-1)+"']")));
			}
			else if(name.contains("EIN"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.EINNameList.get(0).substring(1, CreatePGPOrganizationAPI.EINNameList.get(0).length()-1)+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.EINNameList.get(0).substring(1, CreatePGPOrganizationAPI.EINNameList.get(0).length()-1)+"']")));
			}
		}
		else if(org.contains("SNF"))
		{
			if(name.contains("SNFNAME"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateSNFOrganization.SNFOrg.get("SNFNAME")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreateSNFOrganization.SNFOrg.get("SNFNAME")+"']")));
			}
			else if(name.contains("CCN"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateSNFOrganization.SNFOrg.get("CCN")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreateSNFOrganization.SNFOrg.get("CCN")+"']")));
			}
		}
		else if(org.contains("HHA"))
		{
			if(name.contains("HHANAME"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateHHAOrganization.HHAOrg.get("HHANAME")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreateHHAOrganization.HHAOrg.get("HHANAME")+"']")));
			}
			else if(name.contains("CCN"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateHHAOrganization.HHAOrg.get("CCN")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreateHHAOrganization.HHAOrg.get("CCN")+"']")));
			}
		}
		
		else if(org.contains("LTCH"))
		{
			if(name.contains("LTCHNAME"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateLTCHOrganization.LTCHOrg.get("LTCHNAME")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreateLTCHOrganization.LTCHOrg.get("LTCHNAME")+"']")));
			}
			else if(name.contains("CCN"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateLTCHOrganization.LTCHOrg.get("CCN")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreateLTCHOrganization.LTCHOrg.get("CCN")+"']")));
			}
		}
		
		else if(org.contains("IRF"))
		{
			if(name.contains("IRFNAME"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateIRFOrganization.IRFOrg.get("IRFNAME")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreateIRFOrganization.IRFOrg.get("IRFNAME")+"']")));
			}
			else if(name.contains("CCN"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateIRFOrganization.IRFOrg.get("CCN")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreateIRFOrganization.IRFOrg.get("CCN")+"']")));
			}
		}
		else if(org.contains("Hospice"))
		{
			if(name.contains("HOSPICENAME"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateHospiceOrganization.HospiceOrg.get("HOSPICENAME")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreateHospiceOrganization.HospiceOrg.get("HOSPICENAME")+"']")));
			}
			else if(name.contains("CCN"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreateHospiceOrganization.HospiceOrg.get("CCN")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreateHospiceOrganization.HospiceOrg.get("CCN")+"']")));
			}
		}
		else
		{
			iWillWaitToSee(By.xpath("//div[text()='"+name+"']"));
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+name+"']")));
		}
	}
	
	public void iGetCountOfAssociatedOrganization(String org)
	{
		iWillWaitToSee(By.cssSelector(".fixed-data-table.noselect>div"));
		orgCount = getTextForElement(driver.findElement(By.cssSelector(".fixed-data-table.noselect>div")));
		orgCount = orgCount.replaceAll("Organization|s", "").trim();
	}
	
	public void iVerifyCountOfAssociatedOrgIncreasedBy2(String org)
	{
		iWillWaitToSee(By.cssSelector(".fixed-data-table.noselect>div"));
		String count= getTextForElement(driver.findElement(By.cssSelector(".fixed-data-table.noselect>div")));
		count = count.replaceAll("Organization|s", "").trim();
		orgCount = Integer.toString(Integer.parseInt(orgCount)+1);
		Assert.assertEquals(orgCount,count);
	}
	
	public void iSearchWithOrgNameonViewProfileOfManagingOrganizationSearchBox(String text){
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
		else if(text.contains("HHANAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganization.HHAOrg.get("HHANAME"));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("HHANAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHHAOrganization.HHAOrg_noMO.get("HHANAME"));
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
		else if(text.contains("HOSPICENAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganization.HospiceOrg.get("HOSPICENAME"));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("HOSPICENAME - NO"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreateHospiceOrganization.HospiceOrg_noMO.get("HOSPICENAME"));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		
		else if(text.contains("PGPNAME - YES"))
		{
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), CreatePGPOrganization.pgpOrg.get("PGPNAME"));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
	}
	
	public void iClickOnOrgNameonViewProfileOfManagingOrganizationSearchBox(String text, String org){
		if(text.contains("ACHNAME - YES"))
		{
			scrollIntoViewByJS(driver.findElement(By.xpath("//div[text()='"+CreateACHOrganization.achOrg.get("ACHNAME")+"']")));
			iWillWaitToSee(By.xpath("//div[text()='"+CreateACHOrganization.achOrg.get("ACHNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateACHOrganization.achOrg.get("ACHNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("ACHNAME - NO"))
		{
			scrollIntoViewByJS(driver.findElement(By.xpath("//div[text()='"+CreateACHOrganization.achOrg.get("ACHNAME")+"']")));
			iWillWaitToSee(By.xpath("//div[text()='"+CreateACHOrganization.achOrg_noMO.get("ACHNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateACHOrganization.achOrg_noMO.get("ACHNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("IRFNAME - YES"))
		{
			scrollIntoViewByJS(driver.findElement(By.xpath("//div[text()='"+CreateIRFOrganization.IRFOrg.get("IRFNAME")+"']")));
			iWillWaitToSee(By.xpath("//div[text()='"+CreateIRFOrganization.IRFOrg.get("IRFNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateIRFOrganization.IRFOrg.get("IRFNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("SNFNAME - YES"))
		{
			scrollIntoViewByJS(driver.findElement(By.xpath("//div[text()='"+CreateSNFOrganization.SNFOrg.get("SNFNAME")+"']")));
			iWillWaitToSee(By.xpath("//div[text()='"+CreateSNFOrganization.SNFOrg.get("SNFNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateSNFOrganization.SNFOrg.get("SNFNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else if(text.contains("LTCHNAME - YES"))
		{
			scrollIntoViewByJS(driver.findElement(By.xpath("//div[text()='"+CreateLTCHOrganization.LTCHOrg.get("LTCHNAME")+"']")));
			iWillWaitToSee(By.xpath("//div[text()='"+CreateLTCHOrganization.LTCHOrg.get("LTCHNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateLTCHOrganization.LTCHOrg.get("LTCHNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		
		else if(text.contains("HOSPICENAME - YES"))
		{
			scrollIntoViewByJS(driver.findElement(By.xpath("//div[text()='"+CreateHospiceOrganization.HospiceOrg.get("HOSPICENAME")+"']")));
			iWillWaitToSee(By.xpath("//div[text()='"+CreateHospiceOrganization.HospiceOrg.get("HOSPICENAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateHospiceOrganization.HospiceOrg.get("HOSPICENAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		
		else if(text.contains("HHANAME - YES"))
		{
			scrollIntoViewByJS(driver.findElement(By.xpath("//div[text()='"+CreateHHAOrganization.HHAOrg.get("HHANAME")+"']")));
			iWillWaitToSee(By.xpath("//div[text()='"+CreateHHAOrganization.HHAOrg.get("HHANAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreateHHAOrganization.HHAOrg.get("HHANAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		
		else if(text.contains("PGPNAME - YES"))
		{
			scrollIntoViewByJS(driver.findElement(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg.get("PGPNAME")+"']")));
			iWillWaitToSee(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg.get("PGPNAME")+"']"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg.get("PGPNAME")+"']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
	}
	
	public void iVerifyLocationDetailsonVeiwProfileOfSelectedOrganization(String text, String org){
		//verifyTextForElement(driver.findElement(By.xpath("//div[contains(text(),'"+text+"')]")), text);
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[contains(text(),'"+text+"')]")));
	}
	
	public void iVerifyLocationIndexIdonVeiwProfileOfSelectedOrganization(String LId, String org) throws ClassNotFoundException, SQLException{
		if(org.contains("ACHNAME - YES")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1)+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		else if(org.contains("ACHNAME - NO")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1)+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		if(org.contains("SNFNAME - YES")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateSNFOrganizationAPI.SNFNameList.get(0).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1)+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		else if(org.contains("SNFNAME - NO")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateSNFOrganizationAPI.SNFNameList.get(1).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(1).length()-1)+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		if(org.contains("LTCHNAME - YES")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateLTCHOrganizationAPI.LTCHNameList.get(0).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(0).length()-1)+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		else if(org.contains("LTCHNAME - NO")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateLTCHOrganizationAPI.LTCHNameList.get(1).substring(1, CreateLTCHOrganizationAPI.LTCHNameList.get(1).length()-1)+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		if(org.contains("IRFNAME - YES")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateIRFOrganizationAPI.IRFNameList.get(0).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(0).length()-1)+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		else if(org.contains("IRFNAME - NO")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateIRFOrganizationAPI.IRFNameList.get(1).substring(1, CreateIRFOrganizationAPI.IRFNameList.get(1).length()-1)+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
	}
	
	
	public void iVerifyCCNIdentifierOnViewProfileOfSelectedOrganization(String text, String org) {
		if (org.contains("Hospital"))
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateACHOrganization.achOrg.get("CCN"),actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateACHOrganization.achOrg_noMO.get("CCN"),actual.replace("|", ""));
			}
		}
		else if (org.contains("SNF"))
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateSNFOrganization.SNFOrg.get("CCN"),actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateSNFOrganization.SNFOrg_noMO.get("CCN"),actual.replace("|", ""));
			}
		}
		else if (org.contains("HHA"))
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateHHAOrganization.HHAOrg.get("CCN"),actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateHHAOrganization.HHAOrg_noMO.get("CCN"),actual.replace("|", ""));
			}
		}
		else if (org.contains("LTCH"))
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateLTCHOrganization.LTCHOrg.get("CCN"),actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateLTCHOrganization.LTCHOrg_noMO.get("CCN"),actual.replace("|", ""));
			}
		}
		else if (org.contains("IRF"))
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateIRFOrganization.IRFOrg.get("CCN"),actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateIRFOrganization.IRFOrg_noMO.get("CCN"),actual.replace("|", ""));
			}
		}
		else if (org.contains("Hospice"))
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateHospiceOrganization.HospiceOrg.get("CCN"),actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+CreateHospiceOrganization.HospiceOrg_noMO.get("CCN"),actual.replace("|", ""));
			}
		}
		else
		{
			if (text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+text,actual.replace("|", ""));
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
			    Assert.assertEquals("CCN: "+text,actual.replace("|", ""));
			}
		}
	}
	
	public void iVerifyEINIdentifierOnViewProfileOrganization(String text, String org) {
		if (org.contains("Hospital"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateACHOrganization.achOrg.get("EIN"),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateACHOrganization.achOrg.get("EIN"),actual);
			}
		}
		else if (org.contains("SNF"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateSNFOrganization.SNFOrg.get("EIN"),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateSNFOrganization.SNFOrg_noMO.get("EIN"),actual);
			}
		}
		
		else if (org.contains("PGP"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreatePGPOrganization.pgpOrg.get("EIN"),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreatePGPOrganization.pgpOrg_noMO.get("EIN"),actual);
			}
		}
		
		else if (org.contains("HHA"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHHAOrganization.HHAOrg.get("EIN"),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHHAOrganization.HHAOrg_noMO.get("EIN"),actual);
			}
		}
		else if (org.contains("LTCH"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateLTCHOrganization.LTCHOrg.get("EIN"),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateLTCHOrganization.LTCHOrg_noMO.get("EIN"),actual);
			}
		}
		else if (org.contains("IRF"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateIRFOrganization.IRFOrg.get("EIN"),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateIRFOrganization.IRFOrg_noMO.get("EIN"),actual);
			}
		}
		else if (org.contains("Hospice"))
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHospiceOrganization.HospiceOrg.get("EIN"),actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHospiceOrganization.HospiceOrg_noMO.get("EIN"),actual);
			}
		}
		else
		{
			if (text.contains("YES"))
			{	
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(text,actual);
			}
			else if (text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ein"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(text,actual);
			}
		}
	}
	
	public void iVerifyNPIIdentifierOnViewProfileOrganization(String text, String org) {
		if(org.contains("Hospital"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateACHOrganization.achOrg.get("NPI"),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateACHOrganization.achOrg.get("NPI"),actual);	
			}
		}
		else if(org.contains("SNF"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateSNFOrganization.SNFOrg.get("NPI"),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateSNFOrganization.SNFOrg_noMO.get("NPI"),actual);	
			}
		}
		
		else if(org.contains("PGP"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreatePGPOrganization.pgpOrg.get("NPI"),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreatePGPOrganization.pgpOrg_noMO.get("NPI"),actual);	
			}
		}
		
		else if(org.contains("HHA"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHHAOrganization.HHAOrg.get("NPI"),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHHAOrganization.HHAOrg_noMO.get("NPI"),actual);	
			}
		}
		else if(org.contains("LTCH"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateLTCHOrganization.LTCHOrg.get("NPI"),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateLTCHOrganization.LTCHOrg_noMO.get("NPI"),actual);	
			}
		}
		else if(org.contains("IRF"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateIRFOrganization.IRFOrg.get("NPI"),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateIRFOrganization.IRFOrg_noMO.get("NPI"),actual);	
			}
		}
		else if(org.contains("Hospice"))
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHospiceOrganization.HospiceOrg.get("NPI"),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateHospiceOrganization.HospiceOrg_noMO.get("NPI"),actual);	
			}
		}
		else
		{
			if(text.contains("YES"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(text,actual);
			}
			else
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(text,actual);	
			}
		}
	}
	
	public void iVerifyLocationIndexIdForSelectedOrganization(String org) throws ClassNotFoundException, SQLException{
		if(org.contains("ACHNAME - YES")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateACHOrganization.achOrg.get("ACHNAME")+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		else if(org.contains("ACHNAME - NO")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateACHOrganization.achOrg_noMO.get("ACHNAME")+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		else if(org.contains("SNFNAME - YES")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateSNFOrganization.SNFOrg.get("SNFNAME")+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		else if(org.contains("SNFNAME - NO")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateSNFOrganization.SNFOrg_noMO.get("SNFNAME")+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		else if(org.contains("LTCHNAME - YES")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateLTCHOrganization.LTCHOrg.get("LTCHNAME")+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		else if(org.contains("LTCHNAME - NO")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateLTCHOrganization.LTCHOrg_noMO.get("LTCHNAME")+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		if(org.contains("IRFNAME - YES")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateIRFOrganization.IRFOrg.get("IRFNAME")+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		else if(org.contains("IRFNAME - NO")){
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+CreateIRFOrganization.IRFOrg_noMO.get("IRFNAME")+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
		else
		{
			String query = "select id from program_management.location where organization_id = (select id from program_management.organization where name='"+org+"')and address_type_id=2";
			LocIndexIdList=fetchLocationIndexID(query);
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+LocIndexIdList.get(0)+"']")));
		}
	}
}