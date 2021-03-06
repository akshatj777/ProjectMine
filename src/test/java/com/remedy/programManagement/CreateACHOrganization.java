package com.remedy.programManagement;

import java.util.HashMap;
import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.remedy.baseClass.BaseClass;

public class CreateACHOrganization extends BaseClass{
	public static HashMap<String, String> tempAchOrg = new HashMap<String, String>();
	public static HashMap<String, String> achOrg = new HashMap<String, String>();
	public static HashMap<String, String> achOrg_noMO = new HashMap<String, String>();
	public static String oldACH_WithoutMO;
	public static String oldACH_WithMO;
	public static String location_Id;
	public static int loc_Id;

	public CreateACHOrganization(WebDriver driver) {
		super(driver);
	}
	
	public void iVerifyLabelDropDownFieldOnCreateOrganizationPage(String text) {
		iVerifyTextFromListOfElement(By.cssSelector(".select-field-caption"), text);
	}
	
	public void iClickOnParticularOrganizationTabOrganizationDashboard(String text) {
		longDelay();
//		iWillWaitToSee(By.cssSelector(".navLink.noselect"));
//				
//		List<WebElement> element = driver.findElements(By.cssSelector(".navLink.noselect"));
//		for (WebElement ele : element) {
//			if(ele.getText().equals(text)){
//				ele.click();
//				delay();
//			}
//		}
		iWillWaitToSee(By.xpath("//a[text()='"+text+"']"));
		clickElement(driver.findElement(By.xpath("//a[text()='"+text+"']")));
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
	}
	
	public void iEnterCNNorNPIorEINIdOnCreateOrganizationPage(String id, String field) throws InterruptedException {
		if (id.contains("ACH")){
			if((id.substring(id.indexOf("-")+1).trim()).equals("CCN")){
				tempAchOrg.put("CCN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), tempAchOrg.get("CCN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("EIN")){
				tempAchOrg.put("EIN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), tempAchOrg.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("NPI")){
				tempAchOrg.put("NPI", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), tempAchOrg.get("NPI"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_CCN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), achOrg.get("CCN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_EIN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), achOrg.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_NPI")){
					iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), achOrg.get("NPI"));
			}
			else if(id.contains("lessThan4")){
				String value = createRandomNumber(3);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), value);
			}
			else if(id.contains("greaterThan10")){
				String value = createRandomNumber(11);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), value);
			}
			else {
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), id.substring(id.indexOf("-")+1).trim());
				delay();
			}
		}
		if (id.contains("PGP")){
			if((id.substring(id.indexOf("-")+1).trim()).equals("EIN")){
				CreatePGPOrganization.tempPGPOrg.put("EIN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePGPOrganization.tempPGPOrg.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("NPI")){
				CreatePGPOrganization.tempPGPOrg.put("NPI", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePGPOrganization.tempPGPOrg.get("NPI"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_EIN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePGPOrganization.pgpOrg.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_NPI")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePGPOrganization.pgpOrg.get("NPI"));
			}
			else if(id.contains("greaterThan10")){
				String value = createRandomNumber(11);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), value);
			}
			else {
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), id.substring(id.indexOf("-")+1).trim());
				delay();
			}
		}
		if (id.contains("Payor"))
		{
			if((id.substring(id.indexOf("-")+1).trim()).equals("EIN"))
			{
				CreatePayorOrganization.tempPayorOrg.put("EIN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePayorOrganization.tempPayorOrg.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_EIN"))
			{
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreatePayorOrganization.payorOrg.get("EIN"));
			}
			else if(id.contains("greaterThan10"))
			{
				String value = createRandomNumber(11);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), value);
			}
			else 
			{
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), id.substring(id.indexOf("-")+1).trim());
				delay();
			}
		}
		if (id.contains("SNF")){
			if((id.substring(id.indexOf("-")+1).trim()).equals("CCN")){
				CreateSNFOrganization.tempSNFOrg.put("CCN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateSNFOrganization.tempSNFOrg.get("CCN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("EIN")){
				CreateSNFOrganization.tempSNFOrg.put("EIN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateSNFOrganization.tempSNFOrg.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("NPI")){
				CreateSNFOrganization.tempSNFOrg.put("NPI", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateSNFOrganization.tempSNFOrg.get("NPI"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_CCN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateSNFOrganization.SNFOrg.get("CCN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_EIN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateSNFOrganization.SNFOrg.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_NPI")){
					iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateSNFOrganization.SNFOrg.get("NPI"));
			}
			else if(id.contains("lessThan4")){
				String value = createRandomNumber(3);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), value);
			}
			else if(id.contains("greaterThan10")){
				String value = createRandomNumber(11);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), value);
			}
			else 
			{
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), id.substring(id.indexOf("-")+1).trim());
				delay();
			}
		}
		
		if (id.contains("IRF")){
			if((id.substring(id.indexOf("-")+1).trim()).equals("CCN")){
				CreateIRFOrganization.tempIRFOrg.put("CCN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateIRFOrganization.tempIRFOrg.get("CCN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("EIN")){
				CreateIRFOrganization.tempIRFOrg.put("EIN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateIRFOrganization.tempIRFOrg.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("NPI")){
				CreateIRFOrganization.tempIRFOrg.put("NPI", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateIRFOrganization.tempIRFOrg.get("NPI"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_CCN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateIRFOrganization.IRFOrg.get("CCN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_EIN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateIRFOrganization.IRFOrg.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_NPI")){
					iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateIRFOrganization.IRFOrg.get("NPI"));
			}
			else if(id.contains("lessThan4")){
				String value = createRandomNumber(3);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), value);
			}
			else if(id.contains("greaterThan10")){
				String value = createRandomNumber(11);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), value);
			}
			else 
			{
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), id.substring(id.indexOf("-")+1).trim());
				delay();
			}
		}
		if (id.contains("HHA")){
			if((id.substring(id.indexOf("-")+1).trim()).equals("CCN")){
				CreateHHAOrganization.tempHHAOrg.put("CCN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHHAOrganization.tempHHAOrg.get("CCN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("EIN")){
				CreateHHAOrganization.tempHHAOrg.put("EIN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHHAOrganization.tempHHAOrg.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("NPI")){
				CreateHHAOrganization.tempHHAOrg.put("NPI", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHHAOrganization.tempHHAOrg.get("NPI"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_CCN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHHAOrganization.HHAOrg_noMO.get("CCN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_EIN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHHAOrganization.HHAOrg_noMO.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_NPI")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHHAOrganization.HHAOrg_noMO.get("NPI"));
			}
			else if(id.contains("lessThan4")){
				String value = createRandomNumber(3);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), value);
			}
			
			else {
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), id.substring(id.indexOf("-")+1).trim());
				delay();
			}
		}
		if (id.contains("Hospice")){
			if((id.substring(id.indexOf("-")+1).trim()).equals("CCN")){
				CreateHospiceOrganization.tempHospiceOrg.put("CCN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHospiceOrganization.tempHospiceOrg.get("CCN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("EIN")){
				CreateHospiceOrganization.tempHospiceOrg.put("EIN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHospiceOrganization.tempHospiceOrg.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("NPI")){
				CreateHospiceOrganization.tempHospiceOrg.put("NPI", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHospiceOrganization.tempHospiceOrg.get("NPI"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_CCN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHospiceOrganization.HospiceOrg_noMO.get("CCN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_EIN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHospiceOrganization.HospiceOrg_noMO.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_NPI")){
					iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateHospiceOrganization.HospiceOrg_noMO.get("NPI"));
			}
			else if(id.contains("lessThan4")){
				String value = createRandomNumber(3);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), value);
			}
			
			else {
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), id.substring(id.indexOf("-")+1).trim());
				delay();
			}
		}
		if (id.contains("LTCH")){
			if((id.substring(id.indexOf("-")+1).trim()).equals("CCN")){
				CreateLTCHOrganization.tempLTCHOrg.put("CCN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateLTCHOrganization.tempLTCHOrg.get("CCN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("EIN")){
				CreateLTCHOrganization.tempLTCHOrg.put("EIN", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateLTCHOrganization.tempLTCHOrg.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("NPI")){
				CreateLTCHOrganization.tempLTCHOrg.put("NPI", createRandomNumber(10));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateLTCHOrganization.tempLTCHOrg.get("NPI"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_CCN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateLTCHOrganization.LTCHOrg_noMO.get("CCN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_EIN")){
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateLTCHOrganization.LTCHOrg_noMO.get("EIN"));
			}
			else if((id.substring(id.indexOf("-")+1).trim()).equals("DUPLICATE_NPI")){
					iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateLTCHOrganization.LTCHOrg_noMO.get("NPI"));
			}
			else if(id.contains("lessThan4")){
				String value = createRandomNumber(3);
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), value);
			}
			
			else {
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), id.substring(id.indexOf("-")+1).trim());
				delay();
			}
		}
	}
	
	public void iEnterLocationNameForLocationOnACHOrg(String text, int num) {
    	num = num-1;
    	iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationName']")), text);
    }
    
    public void iEnterAddress1ForLocationOnACHOrg(String add1, int num) {
    	num = num-1;
    	iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].address.address1']")), add1);
    }
    
    public void iEnterLocationTypeForLocationOnACHOrg(String text, int num) {
//    	if(!text.isEmpty()){
//    		num = num-1;
//    		driver.findElements(By.xpath("//div[text()='Location Type']/preceding-sibling::div//input[@role='combobox']")).get(num).sendKeys(text);
//    		delay();
//    		clickElement(driver.findElement(By.xpath("//div[(contains(@class,'VirtualizedSelectOption')) and text()='"+text+"']")));
//    	}	
    }	
    
    public void iEnterAddress2ForLocationOnACHOrg(String add2, int num) {
    	num = num-1;
    	iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].address.address2']")), add2);
    }
    
    public void iEnterRegionForLocationOnACHOrg(String text, int num) {
    	if(!text.isEmpty())
    	{
    		num = num-1;
    	    driver.findElements(By.xpath("//div[text()='Region']/preceding-sibling::div//input[@role='combobox']")).get(num).sendKeys(text);
    	    clickElement(driver.findElement(By.xpath("//div[(contains(@class,'VirtualizedSelectOption')) and text()='"+text+"']")));
    	}
    }
    
    public void iEnterCityForLocationOnACHOrg(String text, int num) {
    	num = num-1;
    	iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].address.city']")), text);
    }
    
    public void iEnterMarketForLocationOnACHOrg(String market, String region, int num) {
    	if(!region.isEmpty())
    	{
    		if(!market.isEmpty())
    		{
        		num = num-1;
        	    driver.findElements(By.xpath("//div[text()='Market']/preceding-sibling::div//input[@role='combobox']")).get(num).sendKeys(market);
        	    clickElement(driver.findElement(By.xpath("//div[(contains(@class,'VirtualizedSelectOption')) and text()='"+market+"']")));
        	}	
    	}
    }
    
    public void iEnterStateForLocationOnACHOrg(String text, int num) 
    {
    	driver.findElements(By.xpath("//div[text()='State']/preceding-sibling::div//input[@role='combobox']")).get(num).sendKeys(text);
    	if(!text.isEmpty())
    	{
    		clickElement(driver.findElement(By.xpath("//div[(contains(@class,'VirtualizedSelectOption')) and text()='"+text+"']")));
    	}
    }
    
    public void iEnterZipForLocationOnACHOrg(String text, int num) 
    {
    	num = num-1;
    	iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].address.postalCode']")), text);
    }

	public void iSelectRadioButtonForManagingOrganization(String text) 
	{ 
		if(text.equalsIgnoreCase("YES"))
		{
			waitTo().until(ExpectedConditions.elementToBeClickable(By.cssSelector(".radio-button->input[value='true']")));
			clickElement(driver.findElement(By.cssSelector(".radio-button->input[value='true']")));
		}
		else if (text.equalsIgnoreCase("NO"))
		{
			waitTo().until(ExpectedConditions.elementToBeClickable(By.cssSelector(".radio-button->input[value='false']")));
			clickElement(driver.findElement(By.cssSelector(".radio-button->input[value='false']")));
		}
	}
	
	public void iSelectManagingOrgNameInHasAManagingOrganizationDropDown(String managingOrg, String text) 
	{
		if(text.equalsIgnoreCase("YES"))
		{
			if(managingOrg.equalsIgnoreCase("BLANK"))
			{
				iFillInText(driver.findElement(By.xpath("//div[@class='radio-button-']/following-sibling::div//input[@role='combobox']")), "");	
			}
			else if (managingOrg.contains("Invalid")){
				iFillInText(driver.findElement(By.xpath("//div[@class='radio-button-']/following-sibling::div//input[@role='combobox']")), managingOrg);
				delay();
			}
			else if(managingOrg.equals("MO_Name2")){
				longDelay();
				iWillWaitToSee(By.xpath("//div[@class='radio-button-']/following-sibling::div//input[@role='combobox']"));
				iFillInText(driver.findElement(By.xpath("//div[@class='radio-button-']/following-sibling::div//input[@role='combobox']")), CreateManagingOrganizationAPI.MONameList.get(1).substring(1, CreateManagingOrganizationAPI.MONameList.get(1).length()-1));
				iWillWaitToSee(By.cssSelector(".VirtualizedSelectOption.VirtualizedSelectFocusedOption"));
				clickElement(driver.findElement(By.cssSelector(".VirtualizedSelectOption.VirtualizedSelectFocusedOption")));
				delay();
			}
			else 
			{
				iWillWaitToSee(By.xpath("//div[@class='radio-button-']/following-sibling::div//input[@role='combobox']"));
				iFillInText(driver.findElement(By.xpath("//div[@class='radio-button-']/following-sibling::div//input[@role='combobox']")), CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1));
				iWillWaitToSee(By.cssSelector(".VirtualizedSelectOption.VirtualizedSelectFocusedOption"));
				clickElement(driver.findElement(By.cssSelector(".VirtualizedSelectOption.VirtualizedSelectFocusedOption")));
				delay();
			}
		}
	}
	
	public void iSearhandverifyManagingOrgNameInHasAManagingOrganizationDropDown(String text, String act) 
	{
		iWillWaitToSee(By.xpath("//div[@class='radio-button-']/following-sibling::div//input[@role='combobox']"));
		iFillInText(driver.findElement(By.xpath("//div[@class='radio-button-']/following-sibling::div//input[@role='combobox']")), CreateManagingOrganizationAPI.MONameList.get(0).substring(1, CreateManagingOrganizationAPI.MONameList.get(0).length()-1));
		iWillWaitToSee(By.cssSelector(".VirtualizedSelectOption.VirtualizedSelectFocusedOption"));
		Assert.assertTrue(isElementPresent(By.cssSelector(".VirtualizedSelectOption.VirtualizedSelectFocusedOption")));
		delay();
	}
	
	public void iVerifyLocationHeaderOnOrganizationPage(String location) 
	{
		String actual = null;
		List <WebElement> element = driver.findElements(By.cssSelector(".col-md-11.location-indcator"));
	    for(WebElement ele: element) 
	    {
	    	if (ele.getText().replace("-", "").trim().equals(location)) 
	    	{
	    		actual = ele.getText().replace("-", "").trim();
	    	}
	    }
	    Assert.assertEquals(actual,location);
	}
	
    public void iVerifyLocationCountOnViewOrganizationPage(int count) 
    {
    	iWillWaitToSee(By.cssSelector(".fixedDataTableRowLayout_rowWrapper"));
    	List<WebElement> element = driver.findElements(By.cssSelector(".fixedDataTableRowLayout_rowWrapper"));
    	int actual = (element.size())-1;
    	Assert.assertEquals(count, actual);
    }
    
    public void iVerifyMessageInHasAManagementOrganization(String text) 
    {
    	iWillWaitToSee(By.cssSelector(".Select-noresults"));
    	verifyTextForElement(driver.findElement(By.cssSelector(".Select-noresults")), text);
    }
    
    public void iEnterLocationIDForLocationOnACHOrg(String text, int num, String field) {
    	num = num-1;
    	if (field.contains("Hospital")){
    		if(text.equals("LID"))
        	{
    			tempAchOrg.put("LID", createRandomNumber(12));
    			iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), tempAchOrg.get("LID"));
    		}
    		else if(text.equals("LIDmorethan20characters"))
        	{
    			tempAchOrg.put("LID", createRandomNumber(21));
    			iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), tempAchOrg.get("LID"));
    		}
        	else if(text.equals("DUPLICATE_LID"))
        	{
        		iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), achOrg_noMO.get("LID"));
        	}
        	else if(text.equals("greaterthan20"))
        	{
        		String value = createRandomNumber(22);
    			iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), value);
        	}
    	}
    	else if(field.contains("SNF"))
    	{
    		if(text.equals("LID"))
        	{
    			CreateSNFOrganization.tempSNFOrg.put("LID", createRandomNumber(20));
    			iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), CreateSNFOrganization.tempSNFOrg.get("LID"));
    		}
        	else if(text.equals("DUPLICATE_LID"))
        	{
        		iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), CreateSNFOrganization.tempSNFOrg.get("LID"));
        	}
        	else if(text.equals("LIDmorethan20characters"))
        	{
    			CreateSNFOrganization.tempSNFOrg.put("LID", createRandomNumber(21));
    			iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), CreateSNFOrganization.tempSNFOrg.get("LID"));
    		}
        	else if(text.equals("Hospital_LID"))
        	{
        		iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), achOrg_noMO.get("LID"));
        	}
    	}
    	else if(field.contains("LTCH"))
    	{
    		if(text.equals("LID"))
        	{
    			CreateLTCHOrganization.tempLTCHOrg.put("LID", createRandomNumber(15));
    			iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), CreateLTCHOrganization.tempLTCHOrg.get("LID"));
    		}
        	else if(text.equals("DUPLICATE_LID"))
        	{
        		iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), CreateLTCHOrganization.tempLTCHOrg.get("LID"));
        	}
        	else if(text.equals("LIDmorethan20characters"))
        	{
    			CreateLTCHOrganization.tempLTCHOrg.put("LID", createRandomNumber(21));
    			iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), CreateLTCHOrganization.tempLTCHOrg.get("LID"));
    		}
    	}
    	else if(field.contains("IRF"))
    	{
    		if(text.equals("LID"))
        	{
    			CreateIRFOrganization.tempIRFOrg.put("LID", createRandomNumber(15));
    			iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), CreateIRFOrganization.tempIRFOrg.get("LID"));
    		}
        	else if(text.equals("DUPLICATE_LID"))
        	{
        		iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), CreateIRFOrganization.IRFOrg_noMO.get("LID"));
        	}
        	else if(text.equals("LIDmorethan20characters"))
        	{
    			CreateIRFOrganization.tempIRFOrg.put("LID", createRandomNumber(21));
    			iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), CreateIRFOrganization.tempIRFOrg.get("LID"));
    		}
        	else if(text.equals("Hospital_LID"))
        	{
        		iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), achOrg_noMO.get("LID"));
        	}
    	}
        else
        {
        	delay();
        	iFillInText(driver.findElement(By.xpath("//input[@name='locations["+num+"].locationId']")), text);
        }
    }
    
    public void iVerifyLocationIDShouldbeSameasOrganizationCCN(String text)
    {
    	if(text.contains("Hospital")){
    		delay();
        	iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), CreateACHOrganization.achOrg_noMO.get("CCN"));
    		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+CreateACHOrganization.achOrg_noMO.get("CCN")+"')]")));
    	}
    	else if(text.contains("SNF")){
    		delay();
        	iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), CreateSNFOrganization.SNFOrg_noMO.get("CCN"));
    		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+CreateSNFOrganization.SNFOrg_noMO.get("CCN")+"')]")));
    	}
    	else if(text.contains("IRF")){
    		delay();
        	iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), CreateIRFOrganization.IRFOrg_noMO.get("CCN"));
    		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(),'"+CreateIRFOrganization.IRFOrg_noMO.get("CCN")+"')]")));
    	}
    } 
    
    public void iVerifyLocationIdShouldBeGreater(int value)
    {
    	delay();
    	location_Id =driver.findElement(By.xpath("//div[@class='public_fixedDataTableCell_cellContent' and contains(text(), '10')]")).getText();
    	loc_Id = Integer.parseInt(location_Id);
    	Assert.assertTrue(value<loc_Id);
    }
    
    public void iProvideFromLastCreatedIdOnCreateOrganizationPage(String id,String field) throws InterruptedException {
    	if(id.equalsIgnoreCase("CCN")){
    		//iFillInText(driver.findElement(By.xpath("//input[@placeholder='CCN']")), location_Id);
    		driver.findElement(By.xpath("//input[@placeholder='CCN']")).sendKeys(location_Id.valueOf(loc_Id));
    	}
    	else if(id.equalsIgnoreCase("Location_Id")){
    		iFillInText(driver.findElement(By.xpath("//input[@name='locations[0].locationId']")), location_Id);
    	}
    	else if(id.equals("SNF_LID"))
    	{
    		iFillInText(driver.findElement(By.xpath("//input[@placeholder='CCN']")), CreateSNFOrganization.SNFOrg_noMO.get("LID"));
    	}
    }
    
    public void iVerifyDuplicateLocationMessage(String text){
    	iWillWaitToSee(By.xpath("//div[text()='Duplicate Location']"));
    	verifyTextForElement(driver.findElement(By.xpath("//div[text()='Duplicate Location']")), text);
    }
    
    public void iVerifyTheRadioButtonsShouldGetHighlightedAsRedonCreateOrganizationpage(){
    	WebElement element = driver.findElement(By.xpath("//span[text()='Has a Managing Organization']"));
        ((JavascriptExecutor) driver).executeScript(
                "arguments[0].scrollIntoView();", element);
    	String color = driver.findElement(By.xpath("//span[text()='Has a Managing Organization']")).getCssValue("color");
    	
    	String[] hexValue = color.replace("rgba(", "").replace(")", "").split(",");
    	 
    	int hexValue1=Integer.parseInt(hexValue[0]);
    	hexValue[1] = hexValue[1].trim();
    	int hexValue2=Integer.parseInt(hexValue[1]);
    	hexValue[2] = hexValue[2].trim();
    	int hexValue3=Integer.parseInt(hexValue[2]);
    	 
    	String actualColor = String.format("#%02x%02x%02x", hexValue1, hexValue2, hexValue3);
    	
    	Assert.assertEquals("#df3a31", actualColor);
    }
}