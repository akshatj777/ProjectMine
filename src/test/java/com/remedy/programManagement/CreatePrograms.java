package com.remedy.programManagement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

public class CreatePrograms extends BaseClass {
	
	public static HashMap<Integer, String> tempPrograms = new HashMap<Integer, String>();
	public static HashMap<Integer, String> programs = new HashMap<Integer, String>();
	public static String programName;

	public CreatePrograms(WebDriver driver) {
		super(driver);
	}
	
	public void iVerifyMessageAfterSubmittingCreateOrganizationPageUnderPayorOrganization(String msg, String org) {
		if(org.equals("FETCHFROMAPIFORProgramName"))
		{
			iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>div"));
			verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>div")), msg);
			if(!CreatePrograms.tempPrograms.isEmpty())
			{
				CreateProgramAPI.PROGRAMNameList.set(0, CreatePrograms.tempPrograms.get(1));
				CreatePrograms.tempPrograms.clear();
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		
		else if(org.contains("Programs")){
			iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>div"));
			verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>div")), msg);
			if(!CreatePrograms.tempPrograms.isEmpty())
			{
				CreatePrograms.programs.putAll(CreatePrograms.tempPrograms);
				CreatePrograms.tempPrograms.clear();
			}
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			}
		else if(org.contains("Contracts")){
			iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-success>div"));
			verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-success>div")), msg);
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		}
		else 
		   {
		    	iWillWaitToSee(By.cssSelector(".alert.alert-dismissible.alert-danger>div"));
		    	verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-dismissible.alert-danger>div")), msg);
		    	waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		    }	
		}

	public void iVerifyHeaderLabelUnderSelectedOrganization(String header,String org) 
	{
		iWillWaitToSee(By.cssSelector(".data-table-header-cell>a"));
		iVerifyTextFromListOfElement(By.cssSelector(".data-table-header-cell>a"), header);
	}

	public void iSelectProgramNameInCreateContractPageUnderPayorOrganization(int index, String text, String org) 
	{
		if(!text.equals(""))
		{
			driver.findElement(By.xpath("//div[text()='Select a Program']")).click();
			new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[text()='Select a Program']")), CreateProgramAPI.PROGRAMNameList.get(index-1).substring(1, CreateProgramAPI.PROGRAMNameList.get(index-1).length()-1)).build().perform();
			driver.findElement(By.cssSelector(".VirtualizedSelectOption.VirtualizedSelectFocusedOption")).click();
			delay();
		}
	}
	
	public void iVerifyContractHeaderOnCreateContractPageUnderPayorOrganization(String text, String act) {
		verifyTextForElement(driver.findElement(By.xpath("//div[@class='col-sm-11 row contract-indicator']//div[contains(text(),'Contract')]")), text);
	}
	
	public void iSelectOrganizationTypeOnCreateContratsPageUnderPayorOrganization(String text, int num, String field) 
	{
		if(!text.equals(""))
		{
			scrollIntoViewByJS(driver.findElement(By.xpath("//*[contains(@name,'orgType')]/../div")));
			driver.findElement(By.xpath("//*[contains(@name,'orgType')]/../div")).click();
			iWillWaitToSee(By.cssSelector(".VirtualizedSelectOption"));
			clickElement(driver.findElement(By.xpath("//div[text()='"+text+"']")));
			delay();
		}
	}
	
	public void iSelectOrganizationNameOnCreateContratsPageUnderPayorOrganization(String text, int num, String field) 
	{
		if(!text.equals(""))
		{
			scrollIntoViewByJS(driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")));
			if(text.contains("ACHNAME - NO"))
			{
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				longDelay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1));
				longDelay();
				driver.findElement(By.cssSelector(".org-name")).click();
			}
			else if(text.contains("ACHNAME - YES"))
			{
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				longDelay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1));
				delay();
				driver.findElement(By.cssSelector(".org-name")).click();
			}
			else if(text.contains("PGPNAME - NO"))
			{
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				longDelay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreatePGPOrganizationAPI.PGPNameList.get(1).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(1).length()-1));
				delay();
				driver.findElement(By.cssSelector(".org-name")).click();
			}
			else if(text.contains("PGPNAME - YES"))
			{
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				longDelay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreatePGPOrganizationAPI.PGPNameList.get(0).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(0).length()-1));
				delay();
				driver.findElement(By.cssSelector(".org-name")).click();
			}
			else if(text.contains("SNFNAME - NO"))
			{
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				longDelay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateSNFOrganizationAPI.SNFNameList.get(1).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(1).length()-1));
				delay();
				driver.findElement(By.cssSelector(".org-name")).click();
			}
			else if(text.contains("SNFNAME - YES"))
			{
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				longDelay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateSNFOrganizationAPI.SNFNameList.get(0).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1));
				delay();
				driver.findElement(By.cssSelector(".org-name")).click();
			}
			else if(text.contains("HHANAME - NO"))
			{
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				longDelay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateHHAOrganizationAPI.HHANameList.get(1).substring(1, CreateHHAOrganizationAPI.HHANameList.get(1).length()-1));
				delay();
				driver.findElement(By.cssSelector(".org-name")).click();
			}
			else if(text.contains("HHANAME - YES"))
			{
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				longDelay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateHHAOrganizationAPI.HHANameList.get(0).substring(1, CreateHHAOrganizationAPI.HHANameList.get(0).length()-1));
				delay();
				driver.findElement(By.cssSelector(".org-name")).click();
			}
			else
			{
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				longDelay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(text);
				delay();
				driver.findElement(By.cssSelector(".org-name")).click();
			}
		}
	}
	
	public void iEnterPriceOnCreateContractsPage(String text, int num, String field) 
	{
		iFillInText(driver.findElement(By.xpath("//input[@placeholder='Price of bundle']")), text);
	}
	public void iSelectBundleOnCreateContractsPageUnderPayorOrganization(int bundleNumber, String text, int num, String field)
	{
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		if(!text.equals("")){
		delay();
		scrollIntoViewByJS(driver.findElement(By.xpath("//div[text()='Select a Bundle']/parent::span/following-sibling::span[@class='Select-arrow-zone']")));
		driver.findElement(By.xpath("//div[text()='Select a Bundle']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
		iWillWaitToSee(By.xpath("//div[text()='Select a Bundle']/following-sibling::div/input"));
		if(text.equals("FETCHFROMAPI"))
		{
			driver.findElement(By.xpath("//div[text()='Select a Bundle']/following-sibling::div/input")).sendKeys(CreateBundleAPI.bundleNameList.get(bundleNumber-1).substring(1, CreateBundleAPI.bundleNameList.get(bundleNumber-1).length()-1));	
		}
		else
		{
			driver.findElement(By.xpath("//div[text()='Select a Bundle']/following-sibling::div/input")).sendKeys(text);
		}
		iWillWaitToSee(By.cssSelector(".react-select-option-row.highlight>div"));
		driver.findElement(By.cssSelector(".react-select-option-row.highlight>div")).click();
		delay();
		}
	}
	
	public void iEnterDetailsOnCreateContractPage(String text, String field, String act) 
	{
		if(field.equals("Contract Id")){
			if(text.equals("CID"))
			{
				tempPrograms.put(1, createRandomNumber(15));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), tempPrograms.get(1));
			}
			else if(text.equals("AllAlphabetsCID"))
			{
				tempPrograms.put(1, RandomStringUtils.randomAlphabetic(15));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), tempPrograms.get(1));
			}
			else if(text.equals("CID-"))
			{
				tempPrograms.put(1, createRandomNumber(11));
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), tempPrograms.get(1));
			}
			else if(text.equals("Duplicate_CID"))
			{
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1));
			}
			else{
				iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), text);
			}
		}
		else
		{
			if(act.equals("Bundle1 Price1")){
				iFillInText(driver.findElement(By.xpath("//input[@name='contracts[0].contractBundles[0].bundlePrices[0]."+field+"']")), text);
			}
			else if(act.equals("Bundle1 Price2")){
				iFillInText(driver.findElement(By.xpath("//input[@name='contracts[0].contractBundles[0].bundlePrices[1]."+field+"']")), text);
			}
			else if(act.equals("Bundle2 Price1")){
				iFillInText(driver.findElement(By.xpath("//input[@name='contracts[0].contractBundles[1].bundlePrices[0]."+field+"']")), text);
			}
			else{
				//iFillInText(driver.findElement(By.xpath("//input[@placeholder='"+field+"']")), text);
			}
		}
	}

	public static String currentdate(int days,String format) 
	{
		  DateTimeFormatter dtf = DateTimeFormatter.ofPattern(format);
		  LocalDate localDate = LocalDate.now();
		  LocalDate b = localDate.minus(Period.ofDays(days));
		  String date = dtf.format(b);
		  return date;
		 }
	
	public void setAttributevalue(WebElement element, String attName, String attValue) {
		  JavascriptExecutor js = (JavascriptExecutor) driver;
		  js.executeScript("arguments[0].setAttribute(arguments[1], arguments[2]);", 
		                element, attName, attValue);
		    }
	
	public String getLastnCharacters(String inputString, int subStringLength){
		int length = inputString.length();
		if(length <= subStringLength)
		{
			return inputString;
		}
     int startIndex = length-subStringLength;
     return inputString.substring(startIndex);
	}
	
	public void iVerifyCreateContractHeaderTextOnCreateContractsPage(String text){
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
		verifyTextForElement(driver.findElement(By.cssSelector(".row.headline")), text);
	}
	
	public void iVerifyFieldOnCreateContractsPage(String text){
		verifyTextForElement(driver.findElement(By.cssSelector(".select-field-caption.required")), text);
	}
	
	public void iClickOnCheckboxeForAttributionRulesOnCreatePrograms(String text)
	{
		WebElement element= driver.findElement(By.xpath("//li[text()='"+text+"']/child::input"));
		JavascriptExecutor executor = (JavascriptExecutor) driver;
		executor.executeScript("arguments[0].click();", element);
	}

	public void iVerifyPGPOrganizationNameOnNetworkContractPage(String text, String page){
		isElementPresentOnPage(By.xpath("//div[text()='"+CreatePGPOrganizationAPI.PGPNameList.get(1).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(1).length()-1)+"'"));
	}
	
	public void iVerifySearchBoxForHospitalOrganizationOnNetworkContractPage(String page){
		isElementPresent(By.xpath("//div[text()='Search Name or CCN']"));
	}
	
	public void iVerifyDateFieldOnNetworkContractPage(String field, String page){
		isElementPresentOnPage(By.xpath("//label[contains(text(),'"+field+"')]"));
	}
	
	public void iVerifyDefaultNetworkContractStartDateShouldBeTodayDate(){
		isElementPresent(By.xpath("//div[@class='react-datepicker-input-field-container start-date-picker ']//div[@class='react-datepicker__input-container']"));
	}
	
	public void iVerifyProgramOnCreateNetworkContractPage(String text){
		isElementPresent(By.xpath("//div[contains(text(),'*')]"));
	}
	
	public void iVerifyTheDetailsAfterSelectingContractNameOnCreateNetworkContractPage(String text, String field){
		String result= null;
		if(field.contains("Contract_ID"))
		{
			result = getTextForElement(driver.findElement(By.xpath("//div[@class='contract-id']")));
			result = result.substring(result.indexOf(":")+1);
			Assert.assertEquals(result,CreatePrograms.programs.get(1));
		}
		else if(field.contains("Start Date")){
			isElementPresent(By.xpath("//div[@class='start-date']"));
		}
		else if(field.contains("End Date")){
			isElementPresent(By.xpath("//div[@class='end-date']"));
		}
	}
	
	public void iVerifyDefaultNetworkContractStartDateShouldBeOfBundledPaymentContractStartDate(){
		isElementPresent(By.xpath("//div[@class='react-datepicker-input-field-container start-date-picker ']//label[@class='date-picker-input-label']"));
	}
	
	public void iVerifyDefaultNetworkContractEndDateShouldBeofBundledPaymentContractEndDate(){
		isElementPresent(By.xpath("//div[@class='react-datepicker-input-field-container end-date-picker ']//label[@class='date-picker-input-label']"));
	}
	
	public void enterDate(String date, String field, int index) throws ParseException 
	{
		if(!(date.equals("")))
		{
			if(date.equals("TodaysDate"))
			   {
			    Date todaysDate = new Date();
			    date= new SimpleDateFormat("yyyy/MM/dd").format(todaysDate);
			   }
			else if(date.equals("FutureDate"))
			   {
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			    Date futureDate = new Date();
			    Calendar c = Calendar.getInstance();
			    c.setTime(futureDate);
			    c.add(Calendar.DATE, 365);
			    date = sdf.format(c.getTime());
			   }
			else if(date.equals("BundleStartDate"))
			   {
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			    Date futureDate = new Date();
			    Calendar c = Calendar.getInstance();
			    c.setTime(futureDate);
			    c.add(Calendar.DATE, 50);
			    date = sdf.format(c.getTime());
			   }
			else if(date.equals("BundleEndDate"))
			   {
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			    Date futureDate = new Date();
			    Calendar c = Calendar.getInstance();
			    c.setTime(futureDate);
			    c.add(Calendar.DATE, 280);
			    date = sdf.format(c.getTime());
			   }
			else if(date.equals("PriceStartDate"))
			   {
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			    Date futureDate = new Date();
			    Calendar c = Calendar.getInstance();
			    c.setTime(futureDate);
			    c.add(Calendar.DATE, 90);
			    date = sdf.format(c.getTime());
			   }
			else if(date.equals("PriceEndDate"))
			   {
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			    Date futureDate = new Date();
			    Calendar c = Calendar.getInstance();
			    c.setTime(futureDate);
			    c.add(Calendar.DATE, 200);
			    date = sdf.format(c.getTime());
			   }
			else if(date.equals("BaselineStartDate"))
			   {
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			    Date futureDate = new Date();
			    Calendar c = Calendar.getInstance();
			    c.setTime(futureDate);
			    c.add(Calendar.DATE, 120);
			    date = sdf.format(c.getTime());
			   }
			else if(date.equals("BaselineEndDate"))
			   {
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			    Date futureDate = new Date();
			    Calendar c = Calendar.getInstance();
			    c.setTime(futureDate);
			    c.add(Calendar.DATE, 150);
			    date = sdf.format(c.getTime());
			   }
			String[] arrMonth = new String[]{"January","February","March","April","May","June","July","August","September","October","November","December"};
			Date date1=new SimpleDateFormat("yyyy/MM/dd").parse(date); 
			Calendar cal = Calendar.getInstance();
			cal.setTime(date1);
			int year = cal.get(Calendar.YEAR);
			int iMonth = cal.get(Calendar.MONTH);
			String month = arrMonth[iMonth];
			int day = cal.get(Calendar.DAY_OF_MONTH);
			List<WebElement> startDate = driver.findElements(By.xpath("//label[@class='date-picker-input-label']"));
			scrollIntoViewByJS(startDate.get(index));
			startDate.get(index).click();
			String displayYear = driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText();
			String displayMonth = driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText();
			String m = displayMonth.substring(0,displayMonth.indexOf(" ")).trim();
			String y = displayMonth.substring(displayMonth.indexOf(" ")).trim();
			if(displayYear.contains(Integer.toString(year)))
			{
				if(displayMonth.contains(month))
				{
					if(day<23)
					{
						driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
					}
					else
					{
						if(driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).size()>1)
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(1).click();
						}
						else
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
						}
					}
				}
				else if((Arrays.asList(arrMonth).indexOf(m))>iMonth)
				{
					while(!(driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText().contains(month)))
					{
						driver.findElement(By.xpath("//button[@class='react-datepicker__navigation react-datepicker__navigation--previous']")).click();
					}
					if(day<23)
					{
						driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
					}
					else
					{
						if(driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).size()>1)
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(1).click();
						}
						else
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
						}
					}
				}
				else if((Arrays.asList(arrMonth).indexOf(m))<iMonth)
				{
					while(!(driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText().contains(month)))
					{
						driver.findElement(By.xpath("//button[@class='react-datepicker__navigation react-datepicker__navigation--next']")).click();
					}
					if(day<23)
					{
						driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
					}
					else
					{
						if(driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).size()>1)
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(1).click();
						}
						else
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
						}
					}
				}
			}
			else if(Integer.parseInt(y)>year)
			{
				while(!(driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText().contains(Integer.toString(year))))
				{
					driver.findElement(By.xpath("//button[@class='react-datepicker__navigation react-datepicker__navigation--previous']")).click();
				}
				displayYear = driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText();
				displayMonth = driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText();
				m = displayMonth.substring(0,displayMonth.indexOf(" ")).trim();
				y = displayMonth.substring(displayMonth.indexOf(" ")).trim();
				if(displayMonth.contains(month))
				{
					if(day<23)
					{
						driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
					}
					else
					{
						if(driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).size()>1)
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(1).click();
						}
						else
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
						}
					}
				}
				else if((Arrays.asList(arrMonth).indexOf(m))>iMonth)
				{
					while(!(driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText().contains(month)))
					{
						driver.findElement(By.xpath("//button[@class='react-datepicker__navigation react-datepicker__navigation--previous']")).click();
					}
					if(day<23)
					{
						driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
					}
					else
					{
						if(driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).size()>1)
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(1).click();
						}
						else
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
						}
					}
				}
				else if((Arrays.asList(arrMonth).indexOf(m))<iMonth)
				{
					while(!(driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText().contains(month)))
					{
						driver.findElement(By.xpath("//button[@class='react-datepicker__navigation react-datepicker__navigation--next']")).click();
					}
					if(day<23)
					{
						driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
					}
					else
					{
						if(driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).size()>1)
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(1).click();
						}
						else
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
						}
					}
				}
			}
			else if(Integer.parseInt(y)<year)
			{
				while(!(driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText().contains(Integer.toString(year))))
				{
					driver.findElement(By.xpath("//button[@class='react-datepicker__navigation react-datepicker__navigation--next']")).click();
				}
				displayYear = driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText();
				displayMonth = driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText();
				m = displayMonth.substring(0,displayMonth.indexOf(" ")).trim();
				y = displayMonth.substring(displayMonth.indexOf(" ")).trim();
				if(displayMonth.contains(month))
				{
					if(day<23)
					{
						driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
					}
					else
					{
						if(driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).size()>1)
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(1).click();
						}
						else
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
						}
					}
				}
				else if((Arrays.asList(arrMonth).indexOf(m))>iMonth)
				{
					while(!(driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText().contains(month)))
					{
						driver.findElement(By.xpath("//button[@class='react-datepicker__navigation react-datepicker__navigation--previous']")).click();
					}
					if(day<23)
					{
						driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
					}
					else
					{
						if(driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).size()>1)
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(1).click();
						}
						else
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
						}
					}
				}
				else if((Arrays.asList(arrMonth).indexOf(m))<iMonth)
				{
					while(!(driver.findElement(By.xpath("//div[@class='react-datepicker__current-month']")).getText().contains(month)))
					{
						driver.findElement(By.xpath("//button[@class='react-datepicker__navigation react-datepicker__navigation--next']")).click();
					}
					if(day<23)
					{
						driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
					}
					else
					{
						if(driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).size()>1)
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(1).click();
						}
						else
						{
							driver.findElements(By.xpath("//div[@class='react-datepicker__month']/div/div[text()='"+day+"']")).get(0).click();
						}
					}
				}
			}
		}
	}
	
	public void iClickOnReactDatePickerCloseIconForDate(String field){
		if(field.equals("Start Date"))
		{
			delay();
			WebElement element = driver.findElement(By.xpath("//div//div[@class='react-datepicker-input-field-container start-date-picker ']//button[@class='react-datepicker__close-icon']"));
			JavascriptExecutor executor = (JavascriptExecutor)driver;
			executor.executeScript("arguments[0].click();", element);
			longDelay();
		}
		else if(field.equals("Contract_Start_Date"))
		{
			delay();
			WebElement element = driver.findElement(By.xpath("//div[@class='start-date-end-date-block col-sm-9']//button[@class='react-datepicker__close-icon']"));
			JavascriptExecutor executor = (JavascriptExecutor)driver;
			executor.executeScript("arguments[0].click();", element);
			longDelay();
		}
		else if(field.equals("Bundle_Start_Date"))
		{
			delay();
			WebElement element = driver.findElement(By.xpath("//div[@class='start-date-end-date-block col-sm-7']//button[@class='react-datepicker__close-icon']"));
			JavascriptExecutor executor = (JavascriptExecutor)driver;
			executor.executeScript("arguments[0].click();", element);
			longDelay();
		}
		else if(field.equals("Bundle_Price_Start_Date"))
		{
			delay();
			WebElement element = driver.findElement(By.xpath("//div[@class='start-date-end-date-block col-sm-6']//button[@class='react-datepicker__close-icon']"));
			JavascriptExecutor executor = (JavascriptExecutor)driver;
			executor.executeScript("arguments[0].click();", element);
			longDelay();
		}
		else
		{
			delay();
			WebElement element = driver.findElement(By.xpath("//div//div[@class='react-datepicker-input-field-container end-date-picker ']//button[@class='react-datepicker__close-icon']"));
			JavascriptExecutor executor = (JavascriptExecutor)driver;
			executor.executeScript("arguments[0].click();", element);
		}
	}
	
	public void iSearchWithSearchListOptionsOnDropdownBox(String searchParam, String org)
	{
		String value = searchParam;
		if(org.equals("Organization_Name")){
		if (value.equals("ACHNAME - YES")){
			driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			delay();
			driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1));
			delay();
			value = CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1);
		    Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-name")));
		}
		  else if (value.equals("ACHNAME - NO"))
		  {
			driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			delay();
			driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1));
			delay();
			value = CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1);
		    Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-name")));
		  }
		  else if (value.equals("CCN - YES"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateACHOrganizationAPI.CCNNameList.get(0).substring(1, CreateACHOrganizationAPI.CCNNameList.get(0).length()-1));
			  delay();
			  value = CreateACHOrganizationAPI.CCNNameList.get(0).substring(1, CreateACHOrganizationAPI.CCNNameList.get(0).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-main-id")));
		  }
		  else if (value.equals("CCN - NO"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateACHOrganizationAPI.CCNNameList.get(1).substring(1, CreateACHOrganizationAPI.CCNNameList.get(1).length()-1));
			  delay();
			  value = CreateACHOrganizationAPI.CCNNameList.get(1).substring(1, CreateACHOrganizationAPI.CCNNameList.get(1).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-main-id")));
		  }
		  else if (value.equals("PGPNAME - YES"))
		  {
			    driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				delay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreatePGPOrganizationAPI.PGPNameList.get(0).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(0).length()-1));
				delay();
				value = CreatePGPOrganizationAPI.PGPNameList.get(0).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(0).length()-1);
			    Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-name")));
		 }
		  else if (value.equals("PGPNAME - NO"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreatePGPOrganizationAPI.PGPNameList.get(1).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(1).length()-1));
			  delay();
			  value = CreatePGPOrganizationAPI.PGPNameList.get(1).substring(1, CreatePGPOrganizationAPI.PGPNameList.get(1).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-name")));
		  }
		  else if (value.equals("PGPNAMEEIN - YES"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreatePGPOrganizationAPI.EINNameList.get(0).substring(1, CreatePGPOrganizationAPI.EINNameList.get(0).length()-1));
			  delay();
			  value = CreatePGPOrganizationAPI.EINNameList.get(0).substring(1, CreatePGPOrganizationAPI.EINNameList.get(0).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-main-id")));
		  }
		  else if (value.equals("PGPNAMEEIN - NO"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreatePGPOrganizationAPI.EINNameList.get(1).substring(1, CreatePGPOrganizationAPI.EINNameList.get(1).length()-1));
			  delay();
			  value = CreatePGPOrganizationAPI.EINNameList.get(1).substring(1, CreatePGPOrganizationAPI.EINNameList.get(1).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-main-id")));
		  }
		  else if (value.equals("SNFNAME - YES"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateSNFOrganizationAPI.SNFNameList.get(0).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1));
			  delay();
			  value = CreateSNFOrganizationAPI.SNFNameList.get(0).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-name")));
		  }
		  else if (value.equals("SNFNAME - NO"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateSNFOrganizationAPI.SNFNameList.get(1).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(1).length()-1));
			  delay();
			  value = CreateSNFOrganizationAPI.SNFNameList.get(1).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(1).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-name")));
		  }
		  else if (value.equals("SNFNAMECCN - YES"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateSNFOrganizationAPI.CCNNameList.get(0).substring(1, CreateSNFOrganizationAPI.CCNNameList.get(0).length()-1));
			  delay();
			  value = CreateSNFOrganizationAPI.SNFNameList.get(0).substring(1, CreateSNFOrganizationAPI.SNFNameList.get(0).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-main-id")));
		  }
		  else if (value.equals("SNFNAMECCN - NO"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateSNFOrganizationAPI.CCNNameList.get(1).substring(1, CreateSNFOrganizationAPI.CCNNameList.get(1).length()-1));
			  delay();
			  value = CreateSNFOrganizationAPI.CCNNameList.get(1).substring(1, CreateSNFOrganizationAPI.CCNNameList.get(1).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-main-id")));
		  }
		  else if (value.equals("HHANAME - YES"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateHHAOrganizationAPI.HHANameList.get(0).substring(1, CreateHHAOrganizationAPI.HHANameList.get(0).length()-1));
			  delay();
			  value = CreateHHAOrganizationAPI.HHANameList.get(0).substring(1, CreateHHAOrganizationAPI.HHANameList.get(0).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-name")));
		  }
		  else if (value.equals("HHANAME - NO"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateHHAOrganizationAPI.HHANameList.get(1).substring(1, CreateHHAOrganizationAPI.HHANameList.get(1).length()-1));
			  delay();
			  value = CreateHHAOrganizationAPI.HHANameList.get(1).substring(1, CreateHHAOrganizationAPI.HHANameList.get(1).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-name")));
		  }
		  else if (value.equals("HHANAMECCN - YES"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateHHAOrganizationAPI.CCNNameList.get(0).substring(1, CreateHHAOrganizationAPI.CCNNameList.get(0).length()-1));
			  delay();
			  value = CreateHHAOrganizationAPI.CCNNameList.get(0).substring(1, CreateHHAOrganizationAPI.CCNNameList.get(0).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-main-id")));
		  }
		  else if (value.equals("HHANAMECCN - NO"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(CreateHHAOrganizationAPI.CCNNameList.get(1).substring(1, CreateHHAOrganizationAPI.CCNNameList.get(1).length()-1));
			  delay();
			  value = CreateHHAOrganizationAPI.CCNNameList.get(1).substring(1, CreateHHAOrganizationAPI.CCNNameList.get(1).length()-1);
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-main-id")));
		  }
		}
		else if(org.equals("Bundle"))
		{
			if(value.equals("FETCHFROMAPI")){
				driver.findElement(By.xpath("//div[text()='Select a Bundle']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				iWillWaitToSee(By.xpath("//div[text()='Select a Bundle']/following-sibling::div/input"));
				driver.findElement(By.xpath("//div[text()='Select a Bundle']/following-sibling::div/input")).sendKeys(CreateBundleAPI.bundleNameList.get(0).substring(1, CreateBundleAPI.bundleNameList.get(0).length()-1));
				iWillWaitToSee(By.cssSelector(".react-select-option-row.highlight>div"));
				Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".react-select-option-row.highlight>div")));
			}
			else if(value.equals("FETCHFROMAPIForBundleID")){
				driver.findElement(By.xpath("//div[text()='Select a Bundle']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				iWillWaitToSee(By.xpath("//div[text()='Select a Bundle']/following-sibling::div/input"));
				driver.findElement(By.xpath("//div[text()='Select a Bundle']/following-sibling::div/input")).sendKeys(CreateBundleAPI.idList.get(0).toString());
				iWillWaitToSee(By.cssSelector(".react-select-option-row.highlight>div"));
				Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".react-select-option-row.highlight>div")));
			}
			else{
				driver.findElement(By.xpath("//div[text()='Select a Bundle']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				iWillWaitToSee(By.xpath("//div[text()='Select a Bundle']/following-sibling::div/input"));
				driver.findElement(By.xpath("//div[text()='Select a Bundle']/following-sibling::div/input")).sendKeys(value);
				iWillWaitToSee(By.cssSelector(".react-select-option-row.highlight>div"));
				Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".react-select-option-row.highlight>div")));
			}
		}
	}
	
	public void iClickOnCancelSearchButton()
	{
		driver.findElement(By.xpath("//div[@class='select-field-container organization-list-dropdown ']//div//span[text()='×']")).click();
	}
	
	public void iVerifyTheSelectedHospitalOrganizationShouldNotBeDisplayedInTheSearchBox()
	{
		isElementNotPresentOnPage(By.xpath("//div[@class='react-select-value-row']"));
	}
	
	public void iVerifyTheErrorMessageForInvalidSearchInOrganizationNameDropdownBox(String text)
	{
		iWillWaitToSee(By.cssSelector(".Select-noresults"));
		Assert.assertEquals(text, driver.findElement(By.cssSelector(".Select-noresults")).getText());
	}
	public void iVerifyAttributionRulesOnCreateProgramPage(String text, String act)
	{
		verifyTextForElement(driver.findElement(By.xpath("//li[text()='"+text+"']")), text);
	}
	
	public void iDragandDroptheAttributionRulesOnCreateProgramPage(String act)
	{
		WebElement drag=driver.findElement(By.xpath("//li[text()='Attribute to the physician who has the highest claim allowed amount during the lookForward window']"));
		WebElement drop=driver.findElement(By.xpath("//li[text()='Attribute to the physician who admitted the patient']"));
		Actions act1=new Actions(driver);
		act1.dragAndDrop(drag, drop).build().perform();
	}
	
	public void iSearchAndVerifyWithSearchListOptionsOnProgramsSearchBox(String searchParam, String org) throws ClassNotFoundException, SQLException{
		String value = searchParam;
		if (org.equalsIgnoreCase("Programs"))
		{
			if (value.equals("PROGRAMNAME"))
			{
				 iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1));
				 waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				 value = CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1);
				 iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			}
			else if (value.equals("ID"))
			{
				String query = "SELECT id from program_management.program where name = '"+CreatePrograms.programs.get(1)+"'";
				value = fetchProgramID(query);
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), value);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			}
			else
			{
				iWillWaitToSee(By.cssSelector(".text-input-field-programFilterTerm"));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), value);
			}
		}
		else if (org.equalsIgnoreCase("Bundle Payment Contract"))
		{
			if (value.equals("PROGRAMNAME"))
			{
				 iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1));
				 waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				 value = CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1);
				 iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			}
			 else if (value.equals("ACHNAME")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("CID")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			else
			{
				iWillWaitToSee(By.cssSelector(".text-input-field-programFilterTerm"));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), value);
				iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			}
		}
		else if (org.equalsIgnoreCase("Network Contracts"))
		{
			if (value.equals("PROGRAMNAME"))
			{
				 iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1));
				 waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				 value = CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1);
				 iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			}
			  else if (value.equals("ACHNAME")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			  else if (value.equals("CCN")){
				  iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), CreateACHOrganizationAPI.CCNNameList.get(1).substring(1, CreateACHOrganizationAPI.CCNNameList.get(1).length()-1));
				  waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				  value = CreateACHOrganizationAPI.CCNNameList.get(1).substring(1, CreateACHOrganizationAPI.CCNNameList.get(1).length()-1);
				  iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				  Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			  }
			else
			{
				iWillWaitToSee(By.cssSelector(".text-input-field-programFilterTerm"));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), value);
				iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			}
		}
			else
			{
				iWillWaitToSee(By.cssSelector(".text-input-field-programFilterTerm"));
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), value);
			}
		}
	
	public void iClickonDatePickerCloseIcon(){
		longDelay();
		waitTo().until(ExpectedConditions.visibilityOfElementLocated(By.xpath("//a[@class='react-datepicker__close-icon']")));
		clickElement(driver.findElement(By.xpath("//a[@class='react-datepicker__close-icon']")));
	}
	
	public void iSelectOrganizationNameOnCreateNetworkContractPageUnderPayorOrganization(String text, int num, String field){
		if(!text.equals(""))
		{
			if(text.contains("ACHNAME - NO"))
			{
				driver.findElement(By.xpath("//div[text()='Search Name or CCN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				longDelay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN']/following-sibling::div/input")).sendKeys(CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1));
				longDelay();
				driver.findElement(By.cssSelector(".org-name")).click();
			}
			else if(text.contains("ACHNAME - YES"))
			{
				driver.findElement(By.xpath("//div[text()='Search Name or CCN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				longDelay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN']/following-sibling::div/input")).sendKeys(CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1));
				delay();
				driver.findElement(By.cssSelector(".org-name")).click();
			}
			else
			{
				driver.findElement(By.xpath("//div[text()='Search Name or CCN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
				longDelay();
				driver.findElement(By.xpath("//div[text()='Search Name or CCN']/following-sibling::div/input")).sendKeys(text);
				delay();
			}
		}
	}
	
	public void iSearchWithSearchListOptionsOnDropdownBoxinNetworkContractpage(String searchParam, String org){
		String value = searchParam;
		if(org.equals("Organization_Name")){
		if (value.equals("ACHNAME - YES")){
			driver.findElement(By.xpath("//div[text()='Search Name or CCN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			delay();
			driver.findElement(By.xpath("//div[text()='Search Name or CCN']/following-sibling::div/input")).sendKeys(CreateACHOrganizationAPI.ACHNameList.get(0).substring(1, CreateACHOrganizationAPI.ACHNameList.get(0).length()-1));
			delay();
			value = CreateACHOrganization.achOrg.get("ACHNAME");
		    Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-name")));
		}
		  else if (value.equals("ACHNAME - NO"))
		  {
			driver.findElement(By.xpath("//div[text()='Search Name or CCN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			delay();
			driver.findElement(By.xpath("//div[text()='Search Name or CCN']/following-sibling::div/input")).sendKeys(CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1));
			delay();
			value = CreateACHOrganization.achOrg_noMO.get("ACHNAME");
		    Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-name")));
		  }
		  else if (value.equals("CCN - YES"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN']/following-sibling::div/input")).sendKeys(CreateACHOrganizationAPI.CCNNameList.get(0).substring(1, CreateACHOrganizationAPI.CCNNameList.get(0).length()-1));
			  delay();
			  value = CreateACHOrganization.achOrg.get("CCN");
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-main-id")));
		  }
		  else if (value.equals("CCN - NO"))
		  {
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			  delay();
			  driver.findElement(By.xpath("//div[text()='Search Name or CCN']/following-sibling::div/input")).sendKeys(CreateACHOrganizationAPI.CCNNameList.get(1).substring(1, CreateACHOrganizationAPI.CCNNameList.get(1).length()-1));
			  delay();
			  value = CreateACHOrganization.achOrg_noMO.get("CCN");
			  Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".org-main-id")));
		  }
		}
	}
	
	String fetchProgramID(String query) throws ClassNotFoundException, SQLException{
		HashMap<String, HashMap<String, String>> row = new HashMap<String,HashMap<String,String>>();
	    Class.forName("com.mysql.jdbc.Driver");
	    String connectionString = "jdbc:mysql://"+DriverScript.Config.getProperty("MySQLServerName")+":3306"; 
	    Connection con=DriverManager.getConnection(connectionString,DriverScript.Config.getProperty("MySQLDBUserName"),DriverScript.Config.getProperty("MySQLPassword")); 
	    Statement stmt=con.createStatement();  
	    ResultSet rs=stmt.executeQuery(query);
	    ResultSetMetaData rsmd = (ResultSetMetaData) rs.getMetaData();
	    while(rs.next())
	    {
	     HashMap<String, String> column = new HashMap<String, String>();
	        for(int i=1;i<=rsmd.getColumnCount();i++)
	        {
	        column.put(rsmd.getColumnName(i),rs.getString(i));
	        }
	        String a = Integer.toString(rs.getRow());
	        row.put(a, column);
	     }
	    String pID = row.get("1").get("id");
	    con.close();
	    return pID;
	}
	
	public void iVerifyAutoIncrementedCID(String text){
		iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'80000')]"));
		isElementPresent(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'80000')]"));
	}
	
	public void iVerifyTheSubHeadlineOfAttributionRulesAndValidationRanksOnCreateProgramPage(String text){
		verifyTextForElement(driver.findElement(By.xpath("//div[text()='"+text+"']")), text);
	}
	
	public void iVerifyMultipleBundleEpisodeCheckBox(String text){
		verifyTextForElement(driver.findElement(By.xpath("//label[text()='"+text+"']")), text);
	}
}


