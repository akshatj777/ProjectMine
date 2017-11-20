package com.remedy.programManagement;

import java.util.HashMap;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import java.sql.*;
import com.remedy.baseClass.BaseClass;

public class ViewProfileManagingOrganization extends BaseClass{

	HashMap<String, HashMap<String, String>> row = new HashMap<String,HashMap<String,String>>();
	public ViewProfileManagingOrganization(WebDriver driver) {
		super(driver);
	}
	
	public void iVerifyNameOnHeaderOnViewProfile(String text) {
		if(text.contains("MONAME")){
			isElementPresentOnPage(By.xpath("//a[@href='mailto:"+CreateManagingOrganization.orgMOName+"']"));
		}
		else {
			isElementPresentOnPage(By.xpath("//a[@href='mailto:"+text+"']"));
		}
	}

	public void iVerifyParticipantIdOnVewProfileOfOrganization() throws ClassNotFoundException, SQLException
	{
		String text = getTextForElement(driver.findElement(By.cssSelector(".participant-id")));
	    String query = "SELECT participant_id from program_management.organization where name = '"+CreateManagingOrganization.orgMOName+"'";
	    String pID = fetchParticipantID(query);
		Assert.assertEquals("Participant Id: "+pID+"|", text);
	}
	
	public void iVerifyDetailsInFieldOnViewProfileOfOrganization(String text, String sel) {
		if(!text.isEmpty()) {
		String result = driver.findElement(By.cssSelector(".organization-"+sel+"")).getText();
		Assert.assertEquals(result.replace(",", "").trim(), text);
		}
	}
	
	public void iVerifyOrganizationPresentUnderManagingOrganization(String org, String org1) {
		verifyTextForElementfromList(".navLink.noselect", org);
	}
	
	public void iVerifyOrganizationByDefaultSelectedUnderManagingOrganization(String org) {
		Assert.assertTrue(driver.findElement(By.xpath("//a[@class='navLink noselect activeNavLink']")).getText().contains(org));
	}
	
	public void iVerifyHeaderLabelUnderSelectedOrganizationInManagingOrganization(String header,String org) {
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
	
}
