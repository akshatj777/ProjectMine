package com.remedy.programManagement;

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
}