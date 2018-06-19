package com.remedy.baseClass;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.junit.Assert;
import org.openqa.selenium.*;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.Wait;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.jayway.restassured.response.Response;
import com.remedy.RestCall.InsertDataIntoDataModels;
import com.remedy.programManagement.CreateACHOrganizationAPI;
import com.remedy.programManagement.CreateBundleAPI;
import com.remedy.programManagement.CreateBundlePaymentContractAPI;
import com.remedy.programManagement.CreateHHAOrganizationAPI;
import com.remedy.programManagement.CreateManagingOrganization;
import com.remedy.programManagement.CreateManagingOrganizationAPI;
import com.remedy.programManagement.CreatePGPOrganization;
import com.remedy.programManagement.CreatePGPOrganizationAPI;
import com.remedy.programManagement.CreatePayorOrganizationAPI;
import com.remedy.programManagement.CreatePractictionerAPI;
import com.remedy.programManagement.CreateProgramAPI;
import com.remedy.programManagement.CreateSNFOrganizationAPI;
import com.remedy.resources.DriverScript;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.Properties;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import static stepDefination.CommonSteps.actionEvent;

/**
 * Created by salam on 7/27/15.
 */
public class BaseClass {

	public WebDriver driver = null;
	protected static long Wait_Time = 1000L;
	protected static long delay_Time = 2000L;
	protected static long LongDelay_Time = 5000L;
	public static Properties Cache=new Properties();
	public static Properties properties=new Properties();
	static InputStream inPropFile = null;
	FileInputStream fisCache;
	OutputStream outPropFile;
	static protected String jsonString;
	public static String parentWindow = null;
	private static Gson gson = new Gson();
	protected static Response response;
	private static InsertDataIntoDataModels insertData = new InsertDataIntoDataModels();
	public BaseClass(final WebDriver driver) {
		this.driver = driver;
	}
	public WebDriverWait waitTo()
	{
		WebDriverWait wait = new WebDriverWait(driver, 300);
		return wait;
	}

	public void delay() {
		try {
			Thread.sleep(delay_Time);
		} catch (InterruptedException e) {
			e.printStackTrace();

		}
	}

	public void longDelay() {
		try {
			Thread.sleep(LongDelay_Time);
		} catch (InterruptedException e) {
			e.printStackTrace();

		}
	}

	public boolean isElementVisible(final WebElement ele) {
		long start = System.currentTimeMillis();
		while (true) {
			if (ele.isDisplayed()) {
				return true;
			} else {
				if (System.currentTimeMillis() - start >= Wait_Time) {
					throw new Error("Timeout reached element not visiblie");
				} else {
					try {
						synchronized (this) {
							wait(200);
						}
					} catch (final InterruptedException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public List<String> getTextForElementfromList(String element) {
		List<WebElement> listItems = driver.findElements(By.cssSelector(element));
		List<String> listtexts = new ArrayList<String>();
		for (WebElement item : listItems) {

			item.getText();
			listtexts.add(item.getText());
		}
		return listtexts;
	}

	public List<WebElement> getElementsList(String element) {
		List<WebElement> listItems = driver.findElements(By.cssSelector(element));
		return listItems;
	}

	public WebElement waitFindElement(WebElement parentElement, By by) {
		WebElement ele = null;
		if (parentElement == null) {
			ele = driver.findElement(by);
		} else {
			ele = parentElement.findElement(by);
		}
		isElementVisible(ele);
		return ele;
	}

	public List<WebElement> waitFindElements(WebElement parentElement, By by) {
		if (parentElement == null) {
			return driver.findElements(by);
		}
		return parentElement.findElements(by);
	}

	public WebElement findVisibleElement(WebDriver driver, By by) {
		WebElement ele = driver.findElement(by);
		isElementVisible(ele);
		return ele;
	}

	public WebElement findVisibleElement(WebElement wEle, By by) {
		WebElement ele = wEle.findElement(by);
		isElementVisible(ele);
		return ele;
	}

	public List<WebElement> waitFindElements(WebDriver driver, By by) {
		return driver.findElements(by);
	}

	public boolean isElementEnabled(WebElement ele) {
		boolean clickable = true;
		String attr = ele.getAttribute("class");
		if ((attr != null) && (attr.indexOf("disabled") > -1)) {
			clickable = false;
		}
		return clickable;
	}

	public WebElement getVisibleDropDownParentElement(String parent) {
		List<WebElement> comboListParentElements = waitFindElements(driver, By.cssSelector(parent));
		for (WebElement el : comboListParentElements) {
			if (el.isDisplayed()) {
				return el;
			}
		}
		return null;
	}

	public void selectElementByIndex(String element, int idx) {
		List<WebElement> listItems = driver.findElements(By.cssSelector(element));
		listItems.get(idx).click();
	}

	public void selectElementByDesc(String element, String desc) {
		List<WebElement> listItems = driver.findElements(By.cssSelector(element));
		for (WebElement item : listItems) {

			if (item.getText().equalsIgnoreCase(desc)) {
				item.click();
				delay();
				return;
			}
		}
	}

	public void verifyTextForElementfromList(String element, String itemtext) {
		List<WebElement> listItems = driver.findElements(By.cssSelector(element));
		for (WebElement item : listItems) {
			item.getText().equalsIgnoreCase(itemtext);
		}
	}

	public void selectDropdownVisibleElement(String selectElement, String desc) {
		Select select = new Select(driver.findElement(By.cssSelector(selectElement)));
		select.selectByVisibleText(desc);
	}

	public void iFillInText(WebElement obj, String text) {
		if (!isElementVisible(obj)) {
			return;
		}
		obj.clear();
		
		if ("".equals(text)) {
			return;
		}
		obj.sendKeys(text);
	}

	public void clickElement(WebElement element) {
		if (isElementVisible(element)) {
			element.click();
		}
		/*
		 * WebDriverWait wait = new WebDriverWait(driver,10);
		 * wait.until(ExpectedConditions.visibilityOfElementLocated(by));
		 * driver.findElement(by).click();
		 */
	}

	public void iWillWaitToSeeElement(WebElement element, String text) {
		if (isElementVisible(element)) {
			Assert.assertTrue(element.isDisplayed());
		}
	}

	public void verifyTextForElement(WebElement ele, String text) {
		if (isElementVisible(ele)) {
			Assert.assertEquals(ele.getText(), text);
		}
	}

	public String getTextForElement(WebElement ele) {
		if (isElementVisible(ele)) {
			ele.getText();
		}
		return ele.getText();
    }

    public void verifyElementCount(String element, int count) {
        List<WebElement> listItems = driver.findElements(By.cssSelector(element));
        int countelement = listItems.size();
        delay();
        Assert.assertEquals(countelement, count);
    }

    public int getElementCount(String element) {
        List<WebElement> listItems = driver.findElements(By.cssSelector(element));
        int countelement = listItems.size();
        return countelement;
    }

    public void swithToFrame(String element) {
        driver.switchTo().frame(driver.findElement(By.xpath(element)));
    }

    public void switchBacktoOldWindow() {
    	try
    	{
    		String parentWindow1 = driver.getWindowHandle();
            Set<String> handles = driver.getWindowHandles();
            driver.close();
            for (String windowHandle : handles) {
                if (!windowHandle.equals(parentWindow1)) {
                    driver.switchTo().window(windowHandle);
                }
            }
            delay();
    	}
    	catch(Exception e)
    	{
    		//driver.switchTo().window(parentWindow);
    	}
    	
    }

    public void verifyTextNotPresentForElementFromList(String element, String itemtext) {
        List<WebElement> listItems = driver.findElements(By.cssSelector(element));
        for (WebElement item : listItems) {
            Assert.assertFalse(item.getText().equalsIgnoreCase(itemtext));
        }
    }
        
	public void verifyTextForElementWithMultipleSpaces(WebElement ele, String text) {
		if (isElementVisible(ele)) {
			Assert.assertEquals(ele.getText().replaceAll("\\s+", " "), text);
		}
	}

	public void elementInformation(WebElement ele) {
		System.out.println("  ");
		System.out.println("************************************");
		System.out.println("tagname " + ele.getTagName());
		System.out.println("text " + ele.getText());
		System.out.println("isdisplayed " + ele.isDisplayed());
		System.out.println("isenabled " + ele.isEnabled());
		System.out.println("value " + ele.getAttribute("value"));
		System.out.println("color " + ele.getAttribute("color"));
		System.out.println("text-align" + ele.getAttribute("text-align"));
		System.out.println("class" + ele.getAttribute("class"));
		System.out.println("class" + ele.getAttribute("style"));
		System.out.println("************************************");
	}

	public void switchToNewWindow() {
		try
		{
			parentWindow = driver.getWindowHandle();
			System.out.println(parentWindow);
			Set<String> handles = driver.getWindowHandles();
			for (String windowHandle : handles) {
				if (!windowHandle.equals(parentWindow)) {
					driver.switchTo().window(windowHandle);
				}
			}
		}
		catch(Exception e)
		{
			driver.switchTo().window(parentWindow);
		}
		
	}

	public void verifyTextForElementFromListByXpath(String element, String itemtext) {
		List<WebElement> listItems = driver.findElements(By.xpath(element));
		for (WebElement item : listItems) {
			item.getText().equalsIgnoreCase(itemtext);
			/*
			 * if (item.getText().equalsIgnoreCase(itemtext)) { try {
			 * Assert.assertTrue(item.getText().equalsIgnoreCase(itemtext)); }
			 * catch (Exception e) {
			 * 
			 * } }
			 */
		}
	}

	public void selectElementByTextDescByXpath(String element, String desc) {
		List<WebElement> listItems = driver.findElements(By.xpath(element));
		for (WebElement item : listItems) {
			if (item.getText().equalsIgnoreCase(desc)) {
				item.click();
				delay();
				return;
			}
		}
	}

	public void verifyAttributeForElementFromListByXpath(String element, String attribute, String itemtext) {
		List<WebElement> listItems = driver.findElements(By.xpath(element));
		for (WebElement item : listItems) {
			item.getAttribute(attribute).equalsIgnoreCase(itemtext);
		}
	}

	public void moveToTheElement(WebElement toElement) {
		actionEvent.moveToElement(toElement).perform();
	}

	public void moveToTheElementAndClick(WebElement moveToElement, WebElement clickToElement) {
		actionEvent.moveToElement(moveToElement).perform();
		clickToElement.click();
	}

	public void moveToTheElementAndRightClick(WebElement moveToElementToRightClick) {
		actionEvent.contextClick(moveToElementToRightClick).build().perform();
	}

	public void clickAllElementofAlistbyXpath(String xpathElement) {
		List<WebElement> listItems = driver.findElements(By.xpath(xpathElement));
		for (WebElement item : listItems) {
			item.click();
		}
	}

	public void verifyElementAttributeContainsValue(WebElement element, String attribute, String contains) {
		String attr = element.getAttribute(attribute);
		Assert.assertTrue(attr.contains(contains));
	}
	public boolean isElementPresentOnPage(By locatorKey) {
		boolean value = true;
		try {
			driver.findElement(locatorKey);

		} catch (org.openqa.selenium.NoSuchElementException e) {
			value = false;
		}
		return value;
	}

	public boolean isElementNotPresentOnPage(String ele) {
		boolean value = false;
		try {
			driver.findElement(By.cssSelector(ele));
		} catch (Exception e) {
			value = true;
		}
		return value;
	}
	
	public boolean isElementNotPresentOnPage(By locator) {
		try {
			driver.findElement(locator);
	        return true;
		} catch (Exception e) {
			return false;
		}
	}

	public void verifyarraylist(List<String> requiredcombolisttext, List<String> actualcombolisttext) {
		Assert.assertEquals(requiredcombolisttext, actualcombolisttext);
	}

	public boolean existsElement(String element) {
		try {
			driver.findElement(By.cssSelector(element));
		} catch (NoSuchElementException e) {
			return false;
		}
		return true;
	}

	public void switchToFrameByNameOrId(String nameOrId) {
		driver.switchTo().frame(nameOrId);
	}

	public void switchToParentFrame() {
		driver.switchTo().parentFrame();
	}

	public void iWillWaitToSee(By locator) {
		try {
			waitTo().until(ExpectedConditions.visibilityOfElementLocated(locator));
		} catch (NoSuchElementException e) {
			e.printStackTrace();
		}
	}
	
	public void iVerifyTextFromListOfElement(By locator, String text) {
		
		List<WebElement> listItems = driver.findElements(locator);
		String value = null;
		for (WebElement item : listItems) {
			System.out.println(item.getText());
			  if (item.getText().trim().equals(text)) {
				  value=item.getText().trim();  
			  } 
		}
		Assert.assertEquals(text.trim(),value.trim());
	}	
	
	public void clickSingleElementFromList(By locator, String text) {
		
	    List <WebElement> element = driver.findElements(locator);
	    for(WebElement ele: element) {
	    	if (ele.getText().trim().equals(text)) {
	    		ele.click();
	    	}
	    }
	}  
	
	public boolean isElementPresent(By by) {
	    try {
	      driver.findElement(by);
	      return true;
	    } catch (org.openqa.selenium.NoSuchElementException e) {
	      return false;
	    }
	}

	public void VerifyElementCssProperty(By by,String property){
		WebElement ele = driver.findElement(by);
    	String allignment=ele.getCssValue(property);
    	Assert.assertEquals("center", allignment);
	}


	public void isSelected(WebElement element){
		boolean flag = element.isSelected();
    	Assert.assertEquals(true, flag);
	}
	
	public void isNotSelected(WebElement element){
		boolean flag = element.isSelected();
    	Assert.assertEquals(false, flag);
	}

	public String createRandomName(String name){
		return name+RandomStringUtils.randomAlphabetic(8);
	}
	
	public String createRandomNumber(int num){
		return RandomStringUtils.randomNumeric(num);
	}
	
	public String fetchParticipantID(String query) throws ClassNotFoundException, SQLException  {
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
	    String pID = row.get("1").get("participant_id");
	    con.close();
	    return pID;
}
    public void validateDateFormat(String format,String dateToValdate) throws ParseException {
    	SimpleDateFormat formatter = new SimpleDateFormat(format);
	    formatter.setLenient(false);
	    formatter.parse(dateToValdate);
    }	
	public void scrollIntoViewByJS(WebElement element){
		((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", element);
	}
	
	public String getTheCurrentUrl(){
		return driver.getCurrentUrl();
	}
	
	public void verifyTextNotPresentForElementFromListByXpath(String element, String itemtext) {
        List<WebElement> listItems = driver.findElements(By.xpath(element));
        for (WebElement item : listItems) {
            Assert.assertFalse(item.getText().equalsIgnoreCase(itemtext));
        }
    }
	
	public String getLastnCharacters(String inputString, int subStringLength) {
  	  int length = inputString.length();
  	  if (length <= subStringLength) {
  	   return inputString;
  	  }
  	  int startIndex = length - subStringLength;
  	  return inputString.substring(startIndex);
  	 }
	
	public void scrollToTopOfThePage(){
		((JavascriptExecutor)driver).executeScript("window.scrollTo(0, -document.body.scrollHeight)");	
	}
	
	public static String generateJson(Object object) {
        return gson.toJson(object).toString();
    }
	
	public JsonObject getJsonObject(String jsonString) {
		  JsonParser jsonParser = new JsonParser();
		  JsonElement element = jsonParser.parse(jsonString);
		  return element.getAsJsonObject();
		 }
	
	public static List<Long> getId(String type) {

		List<Long> idList = new ArrayList<>();

//		if (type.equals("snf") || type.equals("hospital") || type.equals("ltch")) {
//			idList.addAll(CreateSnfOrgStepDef.returnIdList());
//		} 
//		else if (type.equals("pgp")) {
//			idList.addAll(PM77CreatePGPOrgStepDef.returnIdList());
		 if (type.equals("management"))
		 {
			idList.addAll(CreateManagingOrganizationAPI.idList);
			CreateManagingOrganizationAPI.managingOrgID=CreateManagingOrganizationAPI.idList.get(0);
			CreateManagingOrganizationAPI.idList.clear();
		 } 
		 else if (type.equals("hospital")) {
				idList.addAll(CreateACHOrganizationAPI.idList);
				Long a = CreateACHOrganizationAPI.idList.get(0);
				CreateACHOrganizationAPI.copyIDList.add(a);
				CreateACHOrganizationAPI.idList.clear();
		 }
		 else if (type.equals("snf")) 
		 {
				idList.addAll(CreateSNFOrganizationAPI.idList);
				Long s = CreateSNFOrganizationAPI.idList.get(0);
				CreateSNFOrganizationAPI.SNFcopyIDList.add(s);
				CreateSNFOrganizationAPI.idList.clear();
		 }
		 else if (type.equals("pgp")) 
		 {
				idList.addAll(CreatePGPOrganizationAPI.idList);
				Long p = CreatePGPOrganizationAPI.idList.get(0);
				CreatePGPOrganizationAPI.PGPcopyIDList.add(p);
				CreatePGPOrganizationAPI.idList.clear();
		 }
		else if (type.equals("payor")) {
			idList.addAll(CreatePayorOrganizationAPI.idList);
			CreatePayorOrganizationAPI.payorID = CreatePayorOrganizationAPI.idList.get(0);
			CreatePayorOrganizationAPI.idList.clear();
		}
		else if (type.equals("program")) {
			idList.addAll(CreateProgramAPI.idList);
			CreateProgramAPI.PROGRAMIDList.addAll(CreateProgramAPI.idList);
			CreateProgramAPI.idList.clear();
		}
		else if (type.equals("hha")) {
			idList.addAll(CreateHHAOrganizationAPI.idList);
			Long h = CreateHHAOrganizationAPI.idList.get(0);
			CreateHHAOrganizationAPI.HHAcopyIDList.add(h);
			CreateHHAOrganizationAPI.idList.clear();
		}
		 else if (type.equals("bundle")) {
			idList.addAll(CreateBundleAPI.idList);
			CreateBundleAPI.bundleIDList.addAll(CreateBundleAPI.idList);
			CreateBundleAPI.idList.clear();
		 }
		else if (type.equals("bundlePayment")) {
			idList.addAll(CreateBundlePaymentContractAPI.idList);
			Long b = CreateBundlePaymentContractAPI.idList.get(0);
			CreateBundlePaymentContractAPI.BPCIDcopyList.add(b);
			CreateBundlePaymentContractAPI.idList.clear();
		} 
//		} else if (type.equals("attributionrule")) {
//			idList.addAll(PM621PostAttributionRulesStepDef.returnIdList());
//		} else if (type.equals("classification")) {
//			idList.addAll(PM487CreateProviderTaxForClassGroupSpecilizationStepDef.returnClassificationIdList());
//		} else if (type.equals("grouping")) {
//			idList.addAll(PM487CreateProviderTaxForClassGroupSpecilizationStepDef.returnGroupingIdList());
//		} else if (type.equals("specialization")) {
//			idList.addAll(PM487CreateProviderTaxForClassGroupSpecilizationStepDef.returnSpecializationIdList());
//		} else if (type.equals("providertaxonomy")) {
//			idList.addAll(PM429CreateProviderTaxonomyStepDef.returnIdList());
		 else if (type.equals("practitioner")) {
			idList.addAll(CreatePractictionerAPI.idList);
			Long p = CreatePractictionerAPI.idList.get(0);
			CreatePractictionerAPI.practitionerIDList.add(p);
			CreatePractictionerAPI.idList.clear();
		}
		return idList;
	}
	
	public static void storeName(String type, JsonObject jsonObject) {
		if(type.equals("practitioner"))
		{
			CreatePractictionerAPI.practitionerNameList.add((((JsonObject) jsonObject.get("data")).get("npi")).toString());
		}
		else if(type.equals("bundle"))
		{
			CreateBundleAPI.bundleNameList.add((((JsonObject) jsonObject.get("data")).get("name")).toString());
		}
		else if(type.equals("management"))
		{
			CreateManagingOrganizationAPI.MONameList.add((((JsonObject) jsonObject.get("data")).get("name")).toString());
			CreateManagingOrganizationAPI.participantidList.add((((JsonObject) jsonObject.get("data")).get("participantId")).toString());
		}
		else if(type.equals("hospital"))
		{
			CreateACHOrganizationAPI.ACHNameList.add((((JsonObject) jsonObject.get("data")).get("name")).toString());
			CreateACHOrganizationAPI.CCNNameList.add((((JsonObject) jsonObject.get("data")).get("ccn")).toString());
			CreateACHOrganizationAPI.EINNameList.add((((JsonObject) jsonObject.get("data")).get("ein")).toString());
			CreateACHOrganizationAPI.NPINameList.add((((JsonObject) jsonObject.get("data")).get("npi")).toString());
		}
		else if(type.equals("snf"))
		{
			CreateSNFOrganizationAPI.SNFNameList.add((((JsonObject) jsonObject.get("data")).get("name")).toString());
			CreateSNFOrganizationAPI.CCNNameList.add((((JsonObject) jsonObject.get("data")).get("ccn")).toString());
			CreateSNFOrganizationAPI.EINNameList.add((((JsonObject) jsonObject.get("data")).get("ein")).toString());
			CreateSNFOrganizationAPI.NPINameList.add((((JsonObject) jsonObject.get("data")).get("npi")).toString());
		}
		else if(type.equals("pgp"))
		{
			CreatePGPOrganizationAPI.PGPNameList.add((((JsonObject) jsonObject.get("data")).get("name")).toString());
			CreatePGPOrganizationAPI.EINNameList.add((((JsonObject) jsonObject.get("data")).get("ein")).toString());
			CreatePGPOrganizationAPI.NPINameList.add((((JsonObject) jsonObject.get("data")).get("npi")).toString());
		}
		else if(type.equals("payor"))
		{
			CreatePayorOrganizationAPI.PayorNameList.add((((JsonObject) jsonObject.get("data")).get("name")).toString());
			CreatePayorOrganizationAPI.participantidList.add((((JsonObject) jsonObject.get("data")).get("participantId")).toString());
		}
		else if(type.equals("program"))
		{
			CreateProgramAPI.PROGRAMNameList.add((((JsonObject) jsonObject.get("data")).get("name")).toString());
		}
		else if(type.equals("hha"))
		{
			CreateHHAOrganizationAPI.HHANameList.add((((JsonObject) jsonObject.get("data")).get("name")).toString());
			CreateHHAOrganizationAPI.CCNNameList.add((((JsonObject) jsonObject.get("data")).get("ccn")).toString());
			CreateHHAOrganizationAPI.EINNameList.add((((JsonObject) jsonObject.get("data")).get("ein")).toString());
			CreateHHAOrganizationAPI.NPINameList.add((((JsonObject) jsonObject.get("data")).get("npi")).toString());
		}
		else if(type.equals("bundlePayment"))
		{
			CreateBundlePaymentContractAPI.BPCCIDList.add((((JsonObject) jsonObject.get("data")).get("contractId")).toString());
		}
	}
	
	public static List<String> generateLocationId(String cLocationId, String cCCN){
        List<String> cucLocationIdList = insertData.splitList(cLocationId);
        List<String> locationIdList = new ArrayList<>();
        int cucLocationIdListSize = cucLocationIdList.size();
        String ccn = cCCN;
        String timeStamp = generateTimeStamp();
        for(int i=0; i< cucLocationIdListSize ;i++) {

            if (StringUtils.isNotBlank(cucLocationIdList.get(i))) {
                locationIdList.add(cucLocationIdList.get(i)+ timeStamp.substring(10, 14));
            }else{
                locationIdList.add(null);
            }
        }
        return locationIdList;
    }
	
	public static String generateTimeStamp(){
        DateFormat df = new SimpleDateFormat("MMddyyyyHHmmss");
        Date date = new Date();
        String timeStamp = df.format(date);
        return timeStamp;
    }
	
	public static Integer generateMarketId(String cMarketId) {
        Integer marketId = null;
        if (StringUtils.isNotBlank(cMarketId)) 
        {
            marketId = Integer.parseInt(cMarketId);
        }
        return marketId;
    }
	
	public static String selectManagingOrg(String cMOrgID) {
        String mOrgID = null;
        if (StringUtils.isNotBlank(cMOrgID)) {
            if (cMOrgID.equals("hasChild"))
            {
                mOrgID = String.valueOf(CreateManagingOrganizationAPI.managingOrgID);
            } 
            else 
            {
                mOrgID = cMOrgID;
            }
        }
        return mOrgID;
    }
	
	public static String genearateOrgId(String cOrgId) {
        String orgId = null;
        String timeStamp = generateTimeStamp();
        if (StringUtils.isNotBlank(cOrgId)) {
            if (cOrgId.length() > 2 && cOrgId.length() <= 7) {
                orgId = cOrgId + timeStamp.substring(10, 14);
            } else if (cOrgId.length() == 2) {
                orgId = cOrgId + timeStamp.substring(8, 14);
            } else {
                orgId = cOrgId;
            }
        }
        return orgId;
    }
	
	public static void deleteNamesList(String type)
	{
		if(type.equals("MO"))
		{
			CreateManagingOrganizationAPI.MONameList.clear();
			CreateManagingOrganizationAPI.participantidList.clear();
		}
		else if(type.equals("ACH"))
		{
			CreateACHOrganizationAPI.ACHNameList.clear();
			CreateACHOrganizationAPI.CCNNameList.clear();
			CreateACHOrganizationAPI.EINNameList.clear();
			CreateACHOrganizationAPI.NPINameList.clear();
			CreateACHOrganizationAPI.copyIDList.clear();
		}
		else if(type.equals("PGP"))
		{
			CreatePGPOrganizationAPI.PGPNameList.clear();
			CreatePGPOrganizationAPI.EINNameList.clear();
			CreatePGPOrganizationAPI.NPINameList.clear();
			CreatePGPOrganizationAPI.PGPcopyIDList.clear();
		}
		else if(type.equals("HHA"))
		{
			CreateHHAOrganizationAPI.HHANameList.clear();
			CreateHHAOrganizationAPI.CCNNameList.clear();
			CreateHHAOrganizationAPI.EINNameList.clear();
			CreateHHAOrganizationAPI.NPINameList.clear();
			CreateHHAOrganizationAPI.HHAcopyIDList.clear();
		}
		else if(type.equals("SNF"))
		{
			CreateSNFOrganizationAPI.SNFNameList.clear();
			CreateSNFOrganizationAPI.CCNNameList.clear();
			CreateSNFOrganizationAPI.EINNameList.clear();
			CreateSNFOrganizationAPI.NPINameList.clear();
			CreateSNFOrganizationAPI.SNFcopyIDList.clear();
		}
		else if(type.equals("Payor"))
		{
			CreatePayorOrganizationAPI.PayorNameList.clear();
			CreatePayorOrganizationAPI.participantidList.clear();
		}
		else if(type.equals("Program"))
		{
			CreateProgramAPI.PROGRAMNameList.clear();
			CreateProgramAPI.PROGRAMIDList.clear();
		}
		else if(type.equals("Bundle"))
		{
			CreateBundleAPI.bundleNameList.clear();
			CreateBundleAPI.bundleIDList.clear();
		}
		else if(type.equals("Contract"))
		{
			
		}
		else if(type.equals("Network Contract"))
		{
			
		}
		else if(type.equals("practitioner")){
			CreatePractictionerAPI.practitionerNameList.clear();
			CreatePractictionerAPI.practitionerIDList.clear();
		}
		else if(type.equals("Physician Roster"))
		{
			
		}
	}
}
