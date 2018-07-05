package com.remedy.programManagement;

import java.util.HashMap;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import java.sql.*;

import com.remedy.baseClass.BaseClass;

public class ViewProfileManagingOrganization extends BaseClass{

	static HashMap<String, HashMap<String, String>> row = new HashMap<String,HashMap<String,String>>();
	
	public ViewProfileManagingOrganization(WebDriver driver) {
		super(driver);
	}
	
	public void iVerifyNameOnHeaderOnViewProfile(String text) {
		if(text.contains("MONAME")){
			isElementPresentOnPage(By.xpath("//a[@href='mailto:"+CreateManagingOrganization.moOrg.get("MONAME")+"']"));
		}
		else if(text.contains("ACHNAME")){
			if (text.contains("YES")){
				isElementPresentOnPage(By.xpath("//a[@href='mailto:"+CreateManagingOrganization.moOrg.get("MONAME")+"']"));
			}
			else if (text.contains("NO")){
				isElementPresentOnPage(By.xpath("//a[@href='mailto:"+CreateManagingOrganization.moOrg.get("MONAME")+"']"));
			}
		}
		else if(text.contains("PGPNAME")){
			if (text.contains("YES")){
				isElementPresentOnPage(By.xpath("//a[@href='mailto:"+CreateManagingOrganization.moOrg.get("MONAME")+"']"));
			}
			else if (text.contains("NO")){
				isElementPresentOnPage(By.xpath("//a[@href='mailto:"+CreateManagingOrganization.moOrg.get("MONAME")+"']"));
			}
		}
		else if(text.contains("PAYORNAME")){
			isElementPresentOnPage(By.xpath("//a[@href='mailto:"+CreatePayorOrganization.payorOrg.get("PAYORNAME")+"']"));
		}
		else if(text.contains("SNFNAME")){
			if (text.contains("YES")){
				isElementPresentOnPage(By.xpath("//a[@href='mailto:"+CreateManagingOrganization.moOrg.get("MONAME")+"']"));
			}
			else if (text.contains("NO")){
				isElementPresentOnPage(By.xpath("//a[@href='mailto:"+CreateManagingOrganization.moOrg.get("MONAME")+"']"));
			}
		}
		else if(text.contains("HHANAME")){
			if (text.contains("YES")){
				isElementPresentOnPage(By.xpath("//a[@href='mailto:"+CreateManagingOrganization.moOrg.get("MONAME")+"']"));
			}
			else if (text.contains("NO")){
				isElementPresentOnPage(By.xpath("//a[@href='mailto:"+CreateManagingOrganization.moOrg.get("MONAME")+"']"));
			}
		}
		else
		{
			isElementPresentOnPage(By.xpath("//a[@href='mailto:"+text+"']"));
		}
	}
	
	public void iVerifyParticipantIdOnVewProfileOfOrganization(String org) throws ClassNotFoundException, SQLException
	{
		if (org.contains("Managing")){
			String text = getTextForElement(driver.findElement(By.cssSelector(".participant-id")));
		    //String query = "SELECT participant_id from program_management.organization where name = '"+CreateManagingOrganization.moOrg.get("MONAME")+"'";
		    String pID = CreateManagingOrganizationAPI.participantidList.get(0);
		    longDelay();
			Assert.assertEquals("Participant Id: "+pID+"|", text);
		}
		else if (org.contains("Payor")){
			String text = getTextForElement(driver.findElement(By.cssSelector(".participant-id")));
		    String query = "SELECT participant_id from program_management.organization where name = '"+CreatePayorOrganization.payorOrg.get("PAYORNAME")+"'";
		    String pID = fetchParticipantID(query);
			Assert.assertEquals("Participant Id: "+pID+" |", text);
		}
	}
	
	public void iVerifyDetailsInFieldOnViewProfileOfOrganization(String text, String sel) {
		if(!text.isEmpty()) {
		String result = driver.findElement(By.cssSelector(".organization-"+sel)).getText();
		if(result.contains(","))
		{
			result = result.replace(",", "").trim();
		}
		if(result.contains("Organization Type:"))
		{
			result = result.substring(result.indexOf(":")+1, result.indexOf("|")).trim();
		}
		Assert.assertEquals(result.trim(), text.trim());
		}
	}
	
	public void iVerifyOrganizationPresentUnderManagingOrganization(String org, String org1) {
		verifyTextForElementfromList(".navLink.noselect", org);
	}
	
	public void iVerifyOrganizationByDefaultSelectedUnderManagingOrganization(String org) {
		Assert.assertTrue(driver.findElement(By.xpath("//a[@class='navLink noselect activeNavLink']")).getText().contains(org));
	}
	
	public void iVerifyHeaderLabelUnderSelectedOrganization(String header,String org) {
		iWillWaitToSee(By.cssSelector(".data-table-header-cell>a"));
		iVerifyTextFromListOfElement(By.cssSelector(".data-table-header-cell>a"), header);
	}
	
	public void iVerifytheCountFortheAssociatedorganization(String count) {
		iWillWaitToSee(By.cssSelector(".fixed-data-table.noselect>div"));
		iVerifyTextFromListOfElement(By.cssSelector(".fixed-data-table.noselect>div"), count);
	}
	
	public void iClickOnOrganizationUnderManagingOrganization(String org) {
		clickElement(driver.findElement(By.xpath("//a[text()='"+org+"']")));
		Assert.assertTrue(driver.findElement(By.xpath("//a[@class='navLink noselect activeNavLink']")).getText().contains(org));
	}
	
	public void iVerifyManagingOrganizationNameOnViewProfileOfOrganization(String name) {
		if(isElementPresentOnPage(By.cssSelector(".id.market-name"))) {
		String text = getTextForElement(driver.findElement(By.cssSelector(".managing-org-view>.id.market-name"))); 
        Assert.assertEquals("Managing Organization: "+name,text.replace("|","").trim());
	    }
    }
	
	public void iClickontheCrossButton() {
		clickElement(driver.findElement(By.cssSelector(".back-button.col-md-offset-11")));
	}
	
	public void userShouldGetRedirectedToTheManagingOrganizationTabPage() {
		iWillWaitToSee(By.cssSelector(".navLink.noselect.activeNavLink"));
		iVerifyTextFromListOfElement(By.cssSelector(".navLink.noselect.activeNavLink"), "Managing");
	}
	
	public void iVerifyTheEditButtonontheViewPage(String button) {
		iVerifyTextFromListOfElement(By.cssSelector(".col-md-offset-11"), button);
	}

	public void letnavigate(String url) {
		driver.navigate().to(url);
		longDelay();
		longDelay();
	}
	
	public void iClickOnCreateNewOrganizationlinkunderNoMatches(String link){
		clickElement(driver.findElement(By.cssSelector(".data-table-overlay-link>a")));
	}
	
	public void iVerifytheRespectiveManagingOrganizationShouldbePrefilledorSelectedontheCreateOrganizationPage(){
		iWillWaitToSee(By.xpath("//div[@class='Select-control']//span[contains(text(),'"+CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1)+"')]"));
		driver.findElement(By.xpath("//div[@class='Select-control']//span[contains(text(),'"+CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1)+"')]")).getText();
	}
	
	public void userShouldGetRedirectedToTheManagingOrganizationProfilePage(){
		iWillWaitToSee(By.xpath("//h3[text()='"+CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1)+"']"));
		isElementPresentOnPage(By.xpath("//h3[text()='"+CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1)+"']"));
	}
}