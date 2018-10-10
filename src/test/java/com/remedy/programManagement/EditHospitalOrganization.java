package com.remedy.programManagement;

import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.remedy.baseClass.BaseClass;

public class EditHospitalOrganization extends BaseClass{

	public EditHospitalOrganization(WebDriver driver) {
		super(driver);
	}

	public void iVerifyManagingOrgFieldOnOrganizationPage(String org){
		if (org.contains("YES")){
			String actual = getTextForElement(driver.findElement(By.cssSelector(".display-managing-org")));
			actual = actual.substring((actual.indexOf(":"))+1).trim();
			Assert.assertEquals(CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1),actual);
		}
		else
		{
			String actual = getTextForElement(driver.findElement(By.cssSelector(".display-managing-org")));
			actual = actual.substring((actual.indexOf(":"))+1).trim();
			Assert.assertEquals("No Managing Organization Selected",actual);
		}
	}
	
	public void iEditLocationFieldsSelectedOrganization(String field1, String field2,int num){
		if(field1.equals("Location Name")){
			num = num-1;
			driver.findElements(By.xpath("//input[@placeholder='"+field1+"']")).get(num).clear();
			iFillInText(driver.findElements(By.xpath("//input[@placeholder='"+field1+"']")).get(num), field2);
		}
		else
		{
			num = num-1;
			driver.findElements(By.xpath("//input[@name='locations["+num+"].address."+field1+"']")).get(num).clear();
			iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].address."+field1+"']")), field2);
		}
	}
	
	public void iEditLocationStateForLocationsofSelectedOrganization(String text, int num){
		int loc_num = num-1;
		if(driver.findElements(By.cssSelector(".Select.Select--single.is-clearable.is-searchable.has-value>input[name='locations["+loc_num+"].address.stateSelection']")).size()>0){
			scrollIntoViewByJS(driver.findElement(By.xpath("//div//input[@name='locations["+loc_num+"].address.stateSelection']/following-sibling::div//span[@class='Select-clear-zone']/span")));
			iWillWaitToSee(By.xpath("//div//input[@name='locations["+loc_num+"].address.stateSelection']/following-sibling::div//span[@class='Select-clear-zone']/span"));
			clickElement(driver.findElement(By.xpath("//div//input[@name='locations["+loc_num+"].address.stateSelection']/following-sibling::div//span[@class='Select-clear-zone']/span")));
			
			if(!text.isEmpty()){
				driver.findElements(By.xpath("//div[text()='State']/preceding-sibling::div//input[@role='combobox']")).get(num).sendKeys(text);
		    	clickElement(driver.findElement(By.xpath("//div[(contains(@class,'VirtualizedSelectOption')) and text()='"+text+"']")));
			}
			}
		else if(!text.isEmpty()){
//			iFillInText(driver.findElement(By.xpath("//div//input[@name='locations["+num+"].address.stateSelection']/following-sibling::div//input[@role='combobox']")), text);
	    	driver.findElements(By.xpath("//div[text()='State']/preceding-sibling::div//input[@role='combobox']")).get(num).sendKeys(text);
			clickElement(driver.findElement(By.xpath("//div[(contains(@class,'VirtualizedSelectOption')) and text()='"+text+"']")));
		}
	}
	
	public void iEditLocationTypeForLocation(String text, int num) {
		if(!text.isEmpty())
		{
			num = num-1;
			scrollIntoViewByJS(driver.findElement(By.xpath("//div[input[@name='locations["+num+"].locationTypeSelector']]//span[@class='Select-clear']")));
			driver.findElement(By.xpath("//div[input[@name='locations["+num+"].locationTypeSelector']]//span[@class='Select-clear']")).click();
			driver.findElements(By.xpath("//div[text()='Location Type']/preceding-sibling::div//input[@role='combobox']")).get(num).sendKeys(text);
	    	delay();
	        WebElement element = driver.findElement(By.xpath("//div[(contains(@class,'VirtualizedSelectOption')) and text()='"+text+"']"));
	        scrollIntoViewByJS(element);
	        element.click();
		}
		else
		{
			num = num-1;
			delay();
	        if (isElementPresent(By.xpath("//div[@class='Select Select--single is-clearable is-searchable has-value'][input[@name='locations["+num+"].regionMarket.regionSelector']]"))){
		        WebElement element = driver.findElement(By.xpath("//div[@class='Select Select--single is-clearable is-searchable has-value'][input[@name='locations["+num+"].regionMarket.regionSelector']]//span[@class='Select-clear']"));
	        	scrollIntoViewByJS(element);
				element.click();
	        }
		}
	}
	
	public void iEditRegionForLocation(String text, int num) {
		if(!text.isEmpty())
		{
			num = num-1;
		    driver.findElements(By.xpath("//div[text()='Region']/preceding-sibling::div//input[@role='combobox']")).get(num).sendKeys(text);
		    delay();
		    clickSingleElementFromList(By.cssSelector(".VirtualizedSelectOption"),text);
		}
		else
		{
			num = num-1;
	        if (isElementPresent(By.xpath("//div[@class='Select Select--single is-clearable is-searchable has-value'][input[@name='locations["+num+"].regionMarket.regionSelector']]"))){
	        	WebElement element = driver.findElement(By.xpath("//div[@class='Select Select--single is-clearable is-searchable has-value'][input[@name='locations["+num+"].regionMarket.regionSelector']]//span[@class='Select-clear']"));
	        	scrollIntoViewByJS(element);
	        	delay();
				element.click();
	        }
		}
	}
	
    public void iEditMarketForLocation(String market, String region, int num) {
    	if(!region.isEmpty()){
    		if(!market.isEmpty())
        	{
        		num = num-1;
        	    driver.findElements(By.xpath("//div[text()='Market']/preceding-sibling::div//input[@role='combobox']")).get(num).sendKeys(market);
        	    delay();
        	    clickSingleElementFromList(By.cssSelector(".VirtualizedSelectOption"),market);
        	}
        	else
        	{
        		num = num-1;
        		if(isElementPresent(By.xpath("//div[@class='Select Select--single is-clearable is-searchable has-value'][input[@name='locations["+num+"].regionMarket.marketSelector']]"))){
        			WebElement element = driver.findElement(By.xpath("//div[@class='Select Select--single is-clearable is-searchable has-value'][input[@name='locations["+num+"].regionMarket.marketSelector']]//span[@class='Select-clear']"));
        	        scrollIntoViewByJS(element);
        	        delay();
        			element.click();
        		}
        	}
    	}
    }
	
	public void iVerifyIdentifierIsNotEditable(String id){
		Assert.assertEquals("true",driver.findElement(By.cssSelector(".text-input-field-"+id)).getAttribute("disabled"));
	}
	
	public void iVerifyManagingOrgRadioButtonsStatusOnOrganizationPage(String org){
		if(org.contains("YES"))
		{
			//Assert.assertEquals("true",driver.findElement(By.xpath("//input[@name='hasManagementOrg' and @value='true']")).getAttribute("checked"));
			List<WebElement> listItems = driver.findElements(By.cssSelector("span[aria-selected='true']"));
			for (WebElement item : listItems) 
			{
				  if (item.getText().trim().contains(CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1)))
				  {
					  Assert.assertTrue(item.getText().trim().contains(CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1)));  
				  } 
			}
		}
		else
		{
			Assert.assertEquals("true",driver.findElement(By.xpath("//input[@name='hasManagementOrg' and @value='false']")).getAttribute("checked"));
		}
	}

	public void iEditLocationIDFieldUnderLocationsSection(String field, int num, String org){
		num= num -1;
		driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")).clear();
		delay();
		if(org.equals("Hospital")){
			if(field.equals("LID")){
				CreateACHOrganizationAPI.tempAchOrg.put("LID", createRandomNumber(12));
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateACHOrganizationAPI.tempAchOrg.get("LID"));
			}
			else if(field.equals("LIDgreaterThan20")){
				CreateACHOrganizationAPI.tempAchOrg.put("LID", createRandomNumber(21));
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateACHOrganizationAPI.tempAchOrg.get("LID"));
			}
			else if(field.equals("SNFLID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateSNFOrganization.SNFOrg_noMO.get("LID"));
			}
			else if(field.equals("LTCHLID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateLTCHOrganization.LTCHOrg_noMO.get("LID"));
			}
			else if(field.equals("IRFLID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateIRFOrganization.IRFOrg_noMO.get("LID"));
			}
			else if(field.equals("Duplication_LID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateACHOrganization.achOrg_noMO.get("LID"));
			}
			else
			{
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), field);
			}
		}
		
		else if(org.equals("SNF")){
			if(field.equals("LID")){
				CreateSNFOrganizationAPI.tempSNFOrg.put("LID", createRandomNumber(12));
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateSNFOrganizationAPI.tempSNFOrg.get("LID"));
			}
			else if(field.equals("LIDgreaterthan20")){
				CreateSNFOrganizationAPI.tempSNFOrg.put("LID", createRandomNumber(21));
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateSNFOrganizationAPI.tempSNFOrg.get("LID"));
			}
			else if(field.equals("HospitalLID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateACHOrganization.achOrg_noMO.get("LID"));
			}
			else if(field.equals("LTCHLID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateLTCHOrganization.LTCHOrg_noMO.get("LID"));
			}
			else if(field.equals("IRFLID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateIRFOrganization.IRFOrg_noMO.get("LID"));
			}
			else if(field.equals("Duplication_LID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateSNFOrganization.SNFOrg_noMO.get("LID"));
			}
			else
			{
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), field);
			}
		}
		
		else if(org.equals("LTCH")){
			if(field.equals("LID")){
				CreateLTCHOrganizationAPI.tempLTCHOrg.put("LID", createRandomNumber(12));
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateLTCHOrganizationAPI.tempLTCHOrg.get("LID"));
			}
			else if(field.equals("LIDgreaterthan20")){
				CreateLTCHOrganizationAPI.tempLTCHOrg.put("LID", createRandomNumber(21));
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateLTCHOrganizationAPI.tempLTCHOrg.get("LID"));
			}
			else if(field.equals("HospitalLID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateACHOrganization.achOrg_noMO.get("LID"));
			}
			else if(field.equals("SNFLID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateSNFOrganization.SNFOrg_noMO.get("LID"));
			}
			else if(field.equals("IRFLID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateIRFOrganization.IRFOrg_noMO.get("LID"));
			}
			else if(field.equals("Duplication_LID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateLTCHOrganization.LTCHOrg_noMO.get("LID"));
			}
			else
			{
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), field);
			}
		}
		
		else if(org.equals("IRF")){
			if(field.equals("LID")){
				CreateIRFOrganizationAPI.tempIRFOrg.put("LID", createRandomNumber(12));
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateIRFOrganizationAPI.tempIRFOrg.get("LID"));
			}
			else if(field.equals("LIDgreaterthan20")){
				CreateIRFOrganizationAPI.tempIRFOrg.put("LID", createRandomNumber(21));
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateIRFOrganizationAPI.tempIRFOrg.get("LID"));
			}
			else if(field.equals("HospitalLID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateACHOrganization.achOrg_noMO.get("LID"));
			}
			else if(field.equals("SNFLID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateSNFOrganization.SNFOrg_noMO.get("LID"));
			}
			else if(field.equals("LTCHLID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateLTCHOrganization.tempLTCHOrg.get("LID"));
			}
			else if(field.equals("Duplication_LID")){
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), CreateIRFOrganization.IRFOrg_noMO.get("LID"));
			}
			else
			{
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), field);
			}
		}
		
		else
		{
			iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locations["+num+"].locationId']")), field);
		}
	}
}