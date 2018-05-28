package com.remedy.programManagement;

import java.sql.SQLException;
import java.util.List;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.remedy.baseClass.BaseClass;

public class ViewACHOrganization  extends BaseClass{

	public static String orgCount;
	
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
		else{
			String actual = getTextForElement(driver.findElement(By.cssSelector(".id-ccn"))); 
		    Assert.assertEquals("CCN: "+text,actual.replace("|", ""));
			}
		}
	}
	
	public void iVerifyEINTINIdOnViewProfileOrganization(String text, String org) {
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
				Assert.assertEquals(CreateACHOrganization.achOrg_noMO.get("EIN"),actual);
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
				Assert.assertEquals(CreateACHOrganization.achOrg.get("NPI"),actual);
			}
			else if(text.contains("NO"))
			{
				String actual = getTextForElement(driver.findElement(By.cssSelector(".id.id-npi"))); 
				actual = actual.substring((actual.indexOf(":"))+1,(actual.indexOf("|"))).trim();
				Assert.assertEquals(CreateACHOrganization.achOrg_noMO.get("NPI"),actual);	
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
					result = getTextForElement(driver.findElement(By.xpath("//span[contains(text(),'Managing Organization:')]")));
					result = result.substring(result.indexOf(":")+1, result.indexOf("|")).trim();
					Assert.assertEquals(result,CreateManagingOrganization.moOrg.get("MONAME"));
				}
				else if(text.contains("Participant Id"))
				{
					String query = "SELECT participant_id from program_management.organization where name = '"+CreateManagingOrganization.moOrg.get("MONAME")+"'";
					result = getTextForElement(driver.findElement(By.cssSelector(".id.participant-id")));
					result = result.substring(result.indexOf(":")+1).trim();
					String queryResult = fetchParticipantID(query);
					Assert.assertEquals(result,queryResult);
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
		List<WebElement> listItems = driver.findElements(By.cssSelector("span[aria-selected='true']"));
		for (WebElement item : listItems) 
		{
			  if (item.getText().trim().contains(CreateManagingOrganization.moOrg.get("MONAME")))
			  {
				  Assert.assertTrue(item.getText().trim().contains(CreateManagingOrganization.moOrg.get("MONAME")));  
			  } 
		}
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
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg.get("PGPNAME")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg.get("PGPNAME")+"']")));
			}
			else if(name.contains("EIN"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg.get("EIN")+"']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+CreatePGPOrganization.pgpOrg.get("EIN")+"']")));
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
	
	public void iVerifyCountOfAssociatedOrgIncreasedBy1(String org)
	{
		iWillWaitToSee(By.cssSelector(".fixed-data-table.noselect>div"));
		String count= getTextForElement(driver.findElement(By.cssSelector(".fixed-data-table.noselect>div")));
		count = count.replaceAll("Organization|s", "").trim();
		orgCount = Integer.toString(Integer.parseInt(orgCount)+1);
		Assert.assertEquals(orgCount,count);
	}
}