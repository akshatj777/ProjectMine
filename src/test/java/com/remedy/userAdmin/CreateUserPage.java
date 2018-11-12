package com.remedy.userAdmin;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.concurrent.TimeUnit;

import org.apache.commons.lang3.RandomStringUtils;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import com.mysql.jdbc.Driver;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

/**
 * Created by salam on 7/30/15.
 */

public class CreateUserPage extends BaseClass{

	public final static DateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
	public final static Date timestamp = new Date();
	public final static String time = df.format(timestamp);
	static String userRole = null;
	static String userApplications = null;
	static String userNPI = "";
	public static HashMap<String,HashMap<String,String>> usersEmailPerRole=new HashMap<String,HashMap<String,String>>();
	public static HashMap<String,HashMap<String,String>> usersApplicationsPerRole=new HashMap<String,HashMap<String,String>>();
	public static HashMap<String,HashMap<String,String>> usersNPIPerRole=new HashMap<String,HashMap<String,String>>();
	LandingPage objLandingPage = new LandingPage(driver);
	Set<String> handles = null;
	
    public CreateUserPage(WebDriver driver){
        super(driver);
    }

    public void iClickOrganizationalField() 
    {

        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	iWillWaitToSee(By.xpath("//div[text()='Select Role']"));
        	((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[text()='Select Role']")));
        }
        else
        {
        	iWillWaitToSee(By.xpath("//div[text()='Select Role']"));
        	clickElement(driver.findElement(By.xpath("//div[text()='Select Role']")));
        }

    }
    
    public void verifyRoleDescription(String roleDescription, String role) 
    {
    	if(!(roleDescription.isEmpty()))
    	{
    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='"+role+"']/parent::div/span[text()='"+roleDescription+"']")));
    	}
    }
    
    public void iClickAlreadySelectedOrganizationalField() 
    {
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	iWillWaitToSee(By.xpath("//div[@class='ui selection dropdown']/div[@class='text']"));
        	((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='ui selection dropdown']/div[@class='text']")));
        }
        else
        {
        	iWillWaitToSee(By.xpath("//div[@class='ui selection dropdown']/div[@class='text']"));
        	clickElement(driver.findElement(By.xpath("//div[@class='ui selection dropdown']/div[@class='text']")));
        }
    }

    public void iTurnOffShareFile()
    {
   		if((isElementPresentOnPage(By.xpath("//div/label[@for='sharefile']"))))
   		{
   			clickElement(driver.findElement(By.xpath("//div/label[@for='sharefile']")));
   		}
   		else
   		{
   			return;
   		}
    }

    public void iClickPayerField() 
    {
    	boolean value= isElementPresentOnPage(By.xpath("//div[@placeholder='Select']/span"));
    	if(value==true)
    	{
    		if(DriverScript.Config.getProperty("Browser").equals("ie"))
    		{
    			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@placeholder='Select']/span")));
    		}
    		else
    		{
    			clickElement(driver.findElement(By.xpath("//div[@placeholder='Select']/span")));
    		}
    	
    	}
    }

    public void selectOrganizationalRole(String desc) throws InterruptedException
    {
    	if(!(desc.equals("")))
    	{
    		if(!(driver.findElements(By.xpath("//div[@class='ui selection dropdown']/div[text()='"+desc+"']")).size()>0))
    		{
    			WebElement element = driver.findElement(By.xpath("//span[text()='"+desc+"']"));
            	scrollIntoViewByJS(element);
            	if(DriverScript.Config.getProperty("Browser").equals("ie"))
            	{
            		((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='"+desc+"']")));
            	}
            	else
            	{
            		element.click();
            	}
            	userRole = desc;
    		}
    	}
    }
    
    public void selectPayerFromData(String desc)
    {
    	boolean value= isElementPresentOnPage(By.cssSelector(".ui-select-choices-row-inner"));
    	if(value==true)
    	{
        selectElementByDesc(".ui-select-choices-row-inner", desc);
    	}
    }
    
    public void iVerifyTheFirstPayerFieldAddedUnderPermissionsSection()
    {
    	Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//label[text()='Stamford Hospital']"))));
    }
    
    public void iVerifyTheSecondPayerFieldAddedUnderPermissionsSection()
    {
    	Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//label[text()='RP Payer Test A']"))));
    }

    public void iEnterNPI(String npi, String role)
    {
    	if(role.equals("Physicians"))
		{
			if(npi.equals("NPI"))
			{
				userNPI = RandomStringUtils.randomNumeric(10);
				if(DriverScript.Config.getProperty("Browser").equals("ie"))
				{
					iWillWaitToSee(By.xpath("//input[@placeholder='NPI']"));
					((JavascriptExecutor) driver).executeScript("arguments[0].value=''", driver.findElement(By.xpath("//input[@placeholder='NPI']")));
					delay();
					new Actions(driver).sendKeys(driver.findElement(By.xpath("//input[@placeholder='NPI']")), userNPI).build().perform();
					while(!(driver.findElement(By.xpath("//input[@placeholder='NPI']")).getAttribute("value").equals(userNPI)))
					{
						((JavascriptExecutor) driver).executeScript("arguments[0].value=''", driver.findElement(By.xpath("//input[@placeholder='NPI']")));
						delay();
						new Actions(driver).sendKeys(driver.findElement(By.xpath("//input[@placeholder='NPI']")), userNPI).build().perform();
					}
				}
				else
				{
					iWillWaitToSee(By.xpath("//input[@placeholder='NPI']"));
					driver.findElement(By.xpath("//input[@placeholder='NPI']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
					iFillInText(driver.findElement(By.xpath("//input[@placeholder='NPI']")),userNPI);
				}
			}
			else
			{
				if(DriverScript.Config.getProperty("Browser").equals("ie"))
				{
					iWillWaitToSee(By.xpath("//input[@placeholder='NPI']"));
					driver.findElement(By.xpath("//input[@placeholder='NPI']")).sendKeys(Keys.CONTROL,"a");
					driver.findElement(By.xpath("//input[@placeholder='NPI']")).sendKeys(Keys.DELETE);
					new Actions(driver).sendKeys(driver.findElement(By.xpath("//input[@placeholder='NPI']")), npi).build().perform();
				}
				else
				{
					iWillWaitToSee(By.xpath("//input[@placeholder='NPI']"));
					driver.findElement(By.xpath("//input[@placeholder='NPI']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
					iFillInText(driver.findElement(By.xpath("//input[@placeholder='NPI']")), npi);				
				}
			}
		}
    }

    public void iEnterFirstName(String text)
    {
    		if(DriverScript.Config.getProperty("Browser").equals("ie"))
    		{
    			iWillWaitToSee(By.xpath("//input[@placeholder='First Name']"));
    			driver.findElement(By.xpath("//input[@placeholder='First Name']")).sendKeys(Keys.CONTROL,"a");
    			driver.findElement(By.xpath("//input[@placeholder='First Name']")).sendKeys(Keys.DELETE);
    			new Actions(driver).sendKeys(driver.findElement(By.xpath("//input[@placeholder='First Name']")), text).build().perform();
    		}
    		else
    		{
    			iWillWaitToSee(By.xpath("//input[@placeholder='First Name']"));
            	driver.findElement(By.xpath("//input[@placeholder='First Name']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
            	iFillInText(driver.findElement(By.xpath("//input[@placeholder='First Name']")), text);
    		}
    }

    public void iEnterLasttName(String text) 
    {
    	if(DriverScript.Config.getProperty("Browser").equals("ie"))
    	{
    		iWillWaitToSee(By.xpath("//input[@placeholder='Last Name']"));
    		driver.findElement(By.xpath("//input[@placeholder='Last Name']")).sendKeys(Keys.CONTROL,"a");
    		driver.findElement(By.xpath("//input[@placeholder='Last Name']")).sendKeys(Keys.DELETE);
            new Actions(driver).sendKeys(driver.findElement(By.xpath("//input[@placeholder='Last Name']")), text).build().perform();
    	}
    	else
    	{
    		iWillWaitToSee(By.xpath("//input[@placeholder='Last Name']"));
            driver.findElement(By.xpath("//input[@placeholder='Last Name']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
        	iFillInText(driver.findElement(By.xpath("//input[@placeholder='Last Name']")), text);
    	}
    }

    public final static String iGenerateEmail(String text) 
    {
        final String mail = text + time;
        final String email = "user" + mail + "@mailinator.com";
        return email;
    }

    public void iEnterEmail(String text) 
    {
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].value='"+iGenerateEmail(text)+"';", driver.findElement(By.xpath("//input[@placeholder='Email']")));
        }
        else
        {
        	iFillInText(driver.findElement(By.xpath("//input[@placeholder='Email']")), iGenerateEmail(text));
        }
    }

    public void iEnterEmailForLoginAfterPasswordMailVerification(String text) 
    {
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].value='"+iGenerateEmail(text)+"';", driver.findElement(By.xpath("//input[@type='email']")));
        }
        else
        {
        	iFillInText(driver.findElement(By.xpath("//input[@type='email']")), iGenerateEmail(text));
        }
    }

    public void iEnterPasswordFieldForLoginAfterPasswordVerification(String Password) 
    {
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].value='"+Password+"';", driver.findElement(By.name("password")));
        }
        else
        {
        	iFillInText(driver.findElement(By.name("password")), Password);
        }
    }

    public void iEnterPhone(String text) 
    {
    	if(!(text.isEmpty()))
    	{
    	iWillWaitToSee(By.xpath("//input[@placeholder='Phone']"));
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor) driver).executeScript("arguments[0].value=''", driver.findElement(By.xpath("//input[@placeholder='Phone']")));
        	new Actions(driver).sendKeys(driver.findElement(By.xpath("//input[@placeholder='Phone']")), text).build().perform();
        }
        else
        {
        	iFillInText(driver.findElement(By.xpath("//input[@placeholder='Phone']")), text);
        }
    	}
    }

    public void iEnterTheEmailToGeneratePassword(String text) 
    {
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].value='"+iGenerateEmail(text)+"';", driver.findElement(By.xpath("//input[@type='email']")));
        }
        else
        {
        	iFillInText(driver.findElement(By.xpath("//input[@type='email']")), iGenerateEmail(text));
        }
    }

    public void iClickOnSendEmailButton() 
    {
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//button[@type='submit']")));
        }
        else
        {
        	clickElement(driver.findElement(By.xpath("//button[@type='submit']")));
        }
    	
    }

    public void iClickOnTheEmailReceivedToChangeYourPassword() 
    {
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[contains(text(),' Remedy QA')]")));
        }
        else
        {
        	clickElement(driver.findElement(By.xpath("//div[contains(text(),' Remedy QA')]")));
        }
    }

    public void iClickOnChangeMyPasswordLink() 
    {
        driver.switchTo().frame(driver.findElement(By.xpath("//*[@id='publicshowmaildivcontent']")));
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(text(),'Change my password')]")));
        }
        else
        {
        	clickElement(driver.findElement(By.xpath("//a[contains(text(),'Change my password')]")));
        }
    }

    public void iSwitchToFrameUnderReceivedMailContent()
    {
    	driver.switchTo().frame(driver.findElement(By.xpath("//*[@id='publicshowmaildivcontent']")));
    }

    public void iClickOnChangeMyPasswordLinkUnderRecievedMailContent() 
    {
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[contains(text(),'Change my password')]")));
        }
        else
        {
        	clickElement(driver.findElement(By.xpath("//a[contains(text(),'Change my password')]")));
        }
    }

    public void iClickHealthSystemField() 
    {
    	delay();
    	boolean value = isElementPresentOnPage(By.xpath("//div[@name='participantSelect']/div[@placeholder='Search']/span"));
    	if(value==true){
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@name='participantSelect']/div[@placeholder='Search']/span")));
        }
        else
        {
        	clickElement(driver.findElement(By.xpath("//div[@name='participantSelect']/div[@placeholder='Search']/span")));
        }
    	}
    }

    public void iEnterHealthSystemSerachText(String text) throws InterruptedException 
    {
        	if(!text.equals(""))
        	{
    		iWillWaitToSee(By.xpath("//div[text()='Select']"));
    		
    		if(DriverScript.Config.getProperty("Browser").equals("ie"))
    		{
    			Thread.sleep(3000);
    			waitTo().until(ExpectedConditions.elementToBeClickable(By.xpath("//div[text()='Select']")));
    			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[text()='Select']")));
    			iWillWaitToSee(By.xpath("//div[text()='Select']/parent::div/div[@class='menu transition visible']//input"));
    			Thread.sleep(3000);
    			new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[text()='Select']/parent::div/div[@class='menu transition visible']//input")), text).build().perform();
    			while(!(driver.findElement(By.xpath("//div[text()='Select']/parent::div/div[@class='menu transition visible']//input")).getAttribute("value").equals(text)))
    			{
    				((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
    				new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[text()='Select']/parent::div/div[@class='menu transition visible']//input")), text).build().perform();
    			}
    		}
    		else
    		{
    			iWillWaitToSee(By.xpath("//div[text()='Select']"));
    			driver.findElement(By.xpath("//div[text()='Select']")).click();
    			iWillWaitToSee(By.xpath("//div[text()='Select']/parent::div/div[@class='menu transition visible']//input"));
    			delay();
    			driver.findElement(By.xpath("//div[text()='Select']/parent::div/div[@class='menu transition visible']//input")).sendKeys(text);
    		}
            Thread.sleep(4000);
    	}
    }
    	

    public void iSelectHealthSystem(String desc) throws InterruptedException 
    {
    	if(!(desc.equals("")))
    	{
    	iWillWaitToSee(By.xpath("//div[contains(@class,'item')]/span[translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='"+desc.toLowerCase()+"']"));
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[contains(@class,'item')]/span[translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='"+desc.toLowerCase()+"']")));
        }
        else
        {
        	clickElement(driver.findElement(By.xpath("//div[contains(@class,'item')]/span[translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')='"+desc.toLowerCase()+"']")));
        }
        Thread.sleep(3000);
    	}
    }

    public void iShouldSeeDifferentTilesForDifferentUserRole(String role) 
    {
        Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector(".title>p"))));
    }

    public void iClickOnECTwoTileUnderSpecificUserLoginPage(String text,String role)
    {
    	if(text.isEmpty()!=true){
    		Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='title']/p[text()='"+text+"']")));
    	 	if(DriverScript.Config.getProperty("Browser").equals("ie"))
    	 	{
    	 		((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='title']/p[text()='"+text+"']")));
    	 	}
    	 	else
    	 	{
    	 		clickElement(driver.findElement(By.xpath("//div[@class='title']/p[text()='"+text+"']")));
    	 	}
    	 	  delay();
    	 	  if(DriverScript.Config.getProperty("Browser").equals("ie"))
    	 	  {
    	 		 ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.cssSelector(".btn.valentino-icon-table")));
    	 	  }
    	 	  else
    	 	  {
    	 		 clickElement(driver.findElement(By.cssSelector(".btn.valentino-icon-table"))); 
    	 	  }
    	 	  driver.navigate().back();
    	}
    }

    public void iClickCreateButton() 
    {
    	iWillWaitToSee(By.cssSelector(".btn.btn-primary"));
        clickElement(driver.findElement(By.cssSelector(".btn.btn-primary")));
        delay();
    }

    public void iVerifyOrganizationalRoleRequiredMessageText(String text) 
    {
        verifyTextForElement(driver.findElement(By.xpath("//form/fieldset/div/div[1]/div[2]/span/span")), text);
    }

    public void iVerifyFirstNameRequiredText(String text) 
    {
        verifyTextForElement(driver.findElement(By.xpath("//form/fieldset/div/div[3]/div/span/span")), text);
    }

    public void iVerifyLastNameRequiredText(String text) 
    {
        verifyTextForElement(driver.findElement(By.xpath("//form/fieldset/div/div[4]/div/span/span")), text);
    }

    public void iVerifyEmailRequiredText(String text) 
    {
        verifyTextForElement(driver.findElement(By.xpath("//form/fieldset/div/div[2]/div/span/span")), text);
    }

    public void iVerifyPhoneValidationMessageText(String text) 
    {
        verifyTextForElement(driver.findElement(By.xpath("//form/fieldset/div/div[5]/div/span/span")), text);
    }

    public void iVerifyNPIValidationMessageText(String text) 
    {
        verifyTextForElement(driver.findElement(By.xpath("//form/fieldset[1]/div/div[6]/div/span/span")), text);
    }

    public void iClickTryAgainButton() 
    {
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.cssSelector(".btn.btn-secondary")));
        }
        else
        {
        	clickElement(driver.findElement(By.cssSelector(".btn.btn-secondary")));
        }
    	
    }

    public void iverifyCreateUserPageHeader(String header) 
    {
    	iWillWaitToSee(By.xpath("//h2/span[text()='"+header+"']"));
        Assert.assertTrue(isElementPresentOnPage(By.xpath("//h2/span[text()='"+header+"']")));
    }

    public void iVerifyTheDropdownListForUser() 
    {
        Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector(".align-right>ul"))));
    }

    public void iEnterProviderSerachText(String text) 
    {
    	iWillWaitToSee(By.xpath("//div[@class='table-select-search']//input"));
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='table-select-search']//input")));
        	((JavascriptExecutor)driver).executeScript("arguments[0].value='"+text+"';", driver.findElement(By.xpath("//div[@class='table-select-search']//input")));
        }
        else
        {
        	clickElement(driver.findElement(By.xpath("//div[@class='table-select-search']//input")));
            iFillInText(driver.findElement(By.xpath("//div[@class='table-select-search']//input")), text);
        }
    }

   public void iClickOnEpisodesTileUnderSpecificUserLoginPage(String text) throws InterruptedException
   {
	   	if(driver.findElements(By.xpath("//div[@class='title']/p[text()='"+text+"']")).contains(text))
	   	{
		   Thread.sleep(3000);
		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
		   {
			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//p[text()='Episodes']"))); 
		   }
		   else
		   {
			   clickElement(driver.findElement(By.xpath("//p[text()='Episodes']")));  
		   }
		   switchToNewWindow();
		   Thread.sleep(6000);
		   isElementVisible(driver.findElement(By.cssSelector(".page-title.row")));
		   switchBacktoOldWindow();
   		}
	   	else
	   	{
   		return;
   		}
   }
   
   public void iCheckAllProviderForTheHealthSystem() 
   {
	   iWillWaitToSee(By.cssSelector(".select-all-master>.checkbox"));
   		delay();
       if(DriverScript.Config.getProperty("Browser").equals("ie"))
       {
    	   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.cssSelector(".select-all-master>.checkbox")));
       }
       else
       {
    	   clickElement(driver.findElement(By.cssSelector(".select-all-master>.checkbox")));  
       }
   }	

    public void iCheckTheProviderForTheHealthSystem(String facility,String provider) {
    	delay();
    	if(provider.contains("*")){
    	iWillWaitToSee(By.cssSelector(".select-all-master>.checkbox"));
        if(DriverScript.Config.getProperty("Browser").equals("ie"))
        {
        	((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.cssSelector(".select-all-master>.checkbox")));
        }
        else
        {
        	clickElement(driver.findElement(By.cssSelector(".select-all-master>.checkbox")));
        }
    	}
    	else {
    		delay();
    	iWillWaitToSee(By.xpath("//label//span[contains(text(),'"+facility+"')]"));
    	if(DriverScript.Config.getProperty("Browser").equals("ie"))
    	{
    		((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//label//span[contains(text(),'"+facility+"')]")));
    	}
    	else
    	{
    		clickElement(driver.findElement(By.xpath("//label//span[contains(text(),'"+facility+"')]")));
    	}
    		
    	}
    }

    public void iclickAllAppsfortheRole() {
    	iWillWaitToSee(By.xpath("//div[@class='row']/div/ul/li/div/label"));
        clickAllElementofAlistbyXpath("//div[@class='row']/div/ul/li/div/label");
    }
    
    public void iSelectTileForTheRole(String appList){
    	String apps = "";
    	if(!(appList.equals("")))
    	{
    		if(appList.contains(","))
        	{
        		StringTokenizer st = new StringTokenizer(appList,",");
                while (st.hasMoreTokens()) {
                	String a = st.nextToken().trim();
                	iWillWaitToSee(By.xpath("//label[.='"+a+"']"));
                	if(DriverScript.Config.getProperty("Browser").equals("ie"))
                	{
                		((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//label[.='"+a+"']")));
                	}
                	else
                	{
                		clickElement(driver.findElement(By.xpath("//label[.='"+a+"']")));
                	}
                }
        	}
        	else
        	{
        		iWillWaitToSee(By.xpath("//label[.='"+appList+"']"));
        		clickElement(driver.findElement(By.xpath("//label[.='"+appList+"']")));
        	}
    	}
    	for(int i=1; i<=(driver.findElements(By.xpath("//div[@class='column padding']")).size());i++)
    	{
    		if(driver.findElements(By.xpath("//div[@class='column padding']["+i+"]/div[@class='ui checked checkbox' or @class='ui checked disabled checkbox']")).size()>0)
    		{
    			apps = apps.concat(driver.findElement(By.xpath("//div[@class='column padding']["+i+"]/div[@class='ui checked checkbox' or @class='ui checked disabled checkbox']/label")).getText());
    			apps = apps.concat(",");
    		}
    	}
    	apps = apps.substring(0, apps.length()-1);
    	userApplications = apps;
    }
public void iUnselectAllSelectedApps(){
	
	if(isElementPresentOnPage(By.xpath("//div[@class='ui checked checkbox']"))==true){
	
		iWillWaitToSee(By.xpath("//div[@class='ui checked checkbox']"));
			clickAllElementofAlistbyXpath("//div[@class='ui checked checkbox']");
	}
	
	}
    public void iClickOnContinueToDashboardMessage() {
        clickElement(driver.findElement(By.xpath("//button[text()='Continue to my dashboard']")));
    }

   public void iVerifyTheHeaderAfterClickingTheEpisodesTile(){
	   Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector(".page-title.row"))));
   }
   
   public void iClickOnEpisodesTwoTileUnderSpecificUserLoginPage(String role){
	   delay();
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Episode Connect for Post-acute Care"))
		   {
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Episodes Post Acute']")));
			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
			   {
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[text()='Episodes Post Acute']"))); 
			   }
			   else
			   {
				   clickElement(driver.findElement(By.xpath("//div[text()='Episodes Post Acute']")));
			   }
		   }  
	   }
   }
   
   public void iVerifyNavigationOnEpisodes2HomePage(String role)
   {
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Episode Connect for Post-acute Care"))
		   {
			   if(!isElementPresentOnPage(By.xpath("//div[@class='ui text loader']")));
			   {
				   driver.navigate().refresh();
			   }
			   new WebDriverWait(driver, 240).until(ExpectedConditions.invisibilityOf(driver.findElement(By.xpath("//div[@class='ui text loader']"))));
			   if(!(driver.findElements(By.xpath("//div[text()='Episode Connect']")).size()>0))
			   {
				   driver.navigate().refresh();
				   iWillWaitToSee(By.xpath("//div[text()='Episode Connect']"));
			   }
				   iWillWaitToSee(By.xpath("//div[@class='patient-card']"));
				   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='patient-card']")));
			   }
		   }
	   }   
   
   public void iVerifyNavigationOnPhysicianHomePage(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Physician Connect")){
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//h1[text()='My Surveys']")));
		   }
	   }   
   }
   
   public void iVerifyNavigationOnUserAdminHomePage(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Administration"))
			{
				iWillWaitToSee(By.xpath("//h1[text()='Users']"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//h1[text()='Users']")));
			}  
	   }
	   
   }
   
   public void iVerifyPatientCardOnEpisodes2HomePage(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Episode Connect for Post-acute Care"))
		   {
				   iWillWaitToSee(By.xpath("//div[@class='patient-card']"));
				   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='patient-card']")));
				   driver.navigate().back();
		   }
	   }   
   }
  
   public void iVerifyTheHeaderAfterClickingTheEpisodes2Tile(){
	   clickElement(driver.findElement(By.xpath("//h1[text()='Patients']")));
   }
   
   public void iTurnOffTheLessonsTileApplication(){
	   clickElement(driver.findElement(By.xpath("//div/label[@for='lessons']")));
   }
   
   public void iClickOnUserNameIconOnEC1AndOpenUserProfile(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Episode Connect Classic"))
		   {
			   iWillWaitToSee(By.cssSelector(".username"));
			   WebElement element = driver.findElement(By.xpath("//i[@class='fa fa-angle-down']"));
			   String javaScript = "var evObj = document.createEvent('MouseEvents');" +
               "evObj.initMouseEvent(\"mouseover\",true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);" +
               "arguments[0].dispatchEvent(evObj);";
			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
			   {
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", element);
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", element);
				   ((JavascriptExecutor)driver).executeScript(javaScript, element);
				   iWillWaitToSee(By.cssSelector("#navbar-dropdown-menu-myprofile"));
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.cssSelector("#navbar-dropdown-menu-myprofile")));
			   }
			   else
			   {
				   element.click();
				   element.click();
				   ((JavascriptExecutor)driver).executeScript(javaScript, element);
				   iWillWaitToSee(By.cssSelector("#navbar-dropdown-menu-myprofile"));
				   clickElement(driver.findElement(By.cssSelector("#navbar-dropdown-menu-myprofile")));  
			   }
		   }
	   }
   }
   
   public void iClickOnEpisode1TileUnderSpecificUserLoginPage(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Episode Connect Classic"))
		   {
			   iWillWaitToSee(By.xpath("//div[text()='Episodes Classic']"));
			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
			   {
				   longDelay();
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[text()='Episodes Classic']")));
			   }
			   else
			   {
				   longDelay();
				   clickElement(driver.findElement(By.xpath("//div[text()='Episodes Classic']")));  
			   }
		   }   
	   }
   }
   
   public void iClickOnPhysicianTileUnderSpecificUserLoginPage(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
			   if(st.nextToken().trim().equals("Physician Connect")){
				   iWillWaitToSee(By.xpath("//div[text()='Gainsharing Physician Survey']"));
				   clickElement(driver.findElement(By.xpath("//div[text()='Gainsharing Physician Survey']")));
		   }   
	   }
   }
   
   public void iClickOnUserAdminTileUnderSpecificUserLoginPage(String role)
   {
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Administration"))
		   {
			   iWillWaitToSee(By.xpath("//div[text()='Users']"));
			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
			   {
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[text()='Users']")));
			   }
			   else
			   {
				   clickElement(driver.findElement(By.xpath("//div[text()='Users']")));  
			   }
		   }  
	   }
   }
   
   public void verifyDashboardOnEC1(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Episode Connect Classic"))
		   {
			   iWillWaitToSee(By.cssSelector(".username"));
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//h3/span[contains(text(),'Dashboard')]")));
		   }   
	   }
   }
   
   public void iClickOnPatientListOnSideMenuBarInEC1(String role) {
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Episode Connect Classic")){
			   iWillWaitToSee(By.cssSelector("#patientsListOpenClose"));
			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
			   {
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.cssSelector("#patientsListOpenClose")));
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[@href='/secure/pn/patientslist']")));
				   longDelay();
			   }
			   else
			   {
				   clickElement(driver.findElement(By.cssSelector("#patientsListOpenClose")));
				   clickElement(driver.findElement(By.xpath("//a[@href='/secure/pn/patientslist']")));
				   longDelay();			   
			   }
		   }   
	   }
   }
   
   public void iVerifyFacilityAppearingOnUserProfile(String facility, String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Episode Connect Classic"))
		   {
			   if(facility.contains(","))
			   {
				   StringTokenizer st1 = new StringTokenizer(facility,",");
		            while (st1.hasMoreTokens()) {  
		            	String token = st1.nextToken().trim();
		            	Boolean flag = false;
		            	List<WebElement> listItems = driver.findElements(By.xpath("//label[text()='Facilities']/parent::div//ul/li"));
		        		for (WebElement item : listItems) {
		        			flag = item.getText().toLowerCase().contains(token.toLowerCase());
		        			if(flag==true)
		        			{
		        				break;
		        			}
		        		}
		        		Assert.assertTrue(flag);
		            }
			   }
			   else
			   {
				   iWillWaitToSee(By.xpath("//li[contains(text(),\""+facility+"\")]"));
				   Assert.assertTrue(isElementPresentOnPage(By.xpath("//li[contains(text(),\""+facility+"\")]")));
			   }
		   }   
	   }
   }
   
   public void iVerifyPayerAppearingOnUserProfile(String payer, String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Episode Connect Classic"))
		   {
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[label[text()='Payers']]//li[text()='"+payer+"']")));
		   }   
	   }
   }
   
   public void verifyEmblemNotAppearingOnUserProfile(String payer, String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Episode Connect Classic"))
		   {
			   Assert.assertFalse(isElementNotPresentOnPage(By.xpath("//div[label[text()='Payers']]//li[text()='"+payer+"']")));;
		   }   
	   }
   }
   
   public void iClickOnAddNoteAndVerifyRole(String userrole, String role) throws InterruptedException
   {
	   if(!(userrole.isEmpty()))
	   {
	   try
	   {
		   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
		   StringTokenizer st = new StringTokenizer(application, ",");
		   while(st.hasMoreTokens())
		   {
			   if(st.nextToken().trim().equals("Episode Connect Classic"))
			   {
				   iWillWaitToSee(By.xpath("//div[@class='row body']//a[@class='btn btn-default dropdown-toggle']"));
				   if(DriverScript.Config.getProperty("Browser").equals("ie"))
				   {
					   longDelay();
					   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@ng-repeat='element in patientsList'][1]//a[@class='btn btn-default dropdown-toggle']")));
					   delay();
					   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElements(By.xpath("//a[contains(text(),'Add Note')]")).get(0));
					   delay();
					   iWillWaitToSee(By.xpath("//textarea[contains(text(),'"+userrole+"')]"));
					   Assert.assertTrue(isElementPresentOnPage(By.xpath("//textarea[contains(text(),'"+userrole+"')]")));
					   delay();
					   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//button[@class='close']")));
				   }
				   else
				   {
					   longDelay();
					   driver.findElement(By.xpath("//div[@ng-repeat='element in patientsList'][1]//a[@class='btn btn-default dropdown-toggle']")).click();
					   delay();
					   driver.findElements(By.xpath("//a[contains(text(),'Add Note')]")).get(0).click();
					   delay();
					   iWillWaitToSee(By.xpath("//textarea[contains(text(),'"+userrole+"')]"));
					   Assert.assertTrue(isElementPresentOnPage(By.xpath("//textarea[contains(text(),'"+userrole+"')]")));
					   delay();
					   driver.findElement(By.xpath("//button[@class='close']")).click();
				   }
			   }   
		   }  
	   }
	   catch(Exception e)
	   {
		   System.out.println(e.toString());
	   }
	   }
   }
   
   public void iVerifyPatientCardOnActivePatientPage(String role){
	   driver.manage().timeouts().pageLoadTimeout(600, TimeUnit.SECONDS);
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Episode Connect Classic"))
		   {
			   iWillWaitToSee(By.id("filterTab_custom"));
			   driver.findElement(By.id("filterTab_custom")).click();
			   new WebDriverWait(driver, 240).until(ExpectedConditions.invisibilityOfElementLocated(By.id("tblPatients_processing")));
			   iWillWaitToSee(By.xpath("//div[@ng-repeat='element in patientsList']"));
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@ng-repeat='element in patientsList']")));
		   } 
	   }   
   }
   
   public void iVerifyNPIOnEC1(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Episode Connect Classic")){
			   if(role.substring((role.indexOf("-")+1)).equals("Physicians"))
			   {
				   if(DriverScript.Config.getProperty("Browser").equals("ie"))
				   {
					   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='Admin Center']")));
					   delay();
					   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[@href='/secure/admin/clinician/']")));
					   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//h1[text()='Clinicians List']"))));
					   String emailForEC1 = CreateUserPage.usersEmailPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
					   new Actions(driver).sendKeys(driver.findElement(By.id("filters_bpprovider_email")), emailForEC1.substring(emailForEC1.indexOf("+")+1)).build().perform();
					   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//button[@class='btn btn-sm btn-primary']")));
					   longDelay();
					   String NPI = CreateUserPage.usersNPIPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
					   Assert.assertEquals(NPI, driver.findElement(By.xpath("//td[@class='td_string td_npi']")).getText().trim());
				   }
				   else
				   {
					   driver.findElement(By.xpath("//span[text()='Admin Center']")).click();
					   delay();
					   driver.findElement(By.xpath("//a[@href='/secure/admin/clinician/']")).click();
					   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//h1[text()='Clinicians List']"))));
					   String emailForEC1 = CreateUserPage.usersEmailPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
					   driver.findElement(By.id("filters_bpprovider_email")).sendKeys(emailForEC1.substring(emailForEC1.indexOf("+")+1));
					   driver.findElement(By.xpath("//button[@class='btn btn-sm btn-primary']")).click();
					   longDelay();
					   String NPI = CreateUserPage.usersNPIPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
					   Assert.assertEquals(NPI, driver.findElement(By.xpath("//td[@class='td_string td_npi']")).getText().trim());				   
				   }
			   }
		   } 
	   }   
   }

   public void iClickOnInstituteTileUnderSpecificUserLoginPage(String role){
		iWillWaitToSee(By.xpath("//div[text()='Institute']"));   
	   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Institute']")));
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[text()='Institute']")));
			delay();
		}
		else
		{
			clickElement(driver.findElement(By.xpath("//div[text()='Institute']")));
			delay();
		}
		
		try
		{
			if(DriverScript.Config.getProperty("Browser").equals("chrome"))
			{
				Thread.sleep(5000);
				String parentWindow = driver.getWindowHandle();
				Set<String> handles = driver.getWindowHandles();
				if(!((String)handles.toArray()[handles.size()-1]).equals(parentWindow))
				{
					driver.switchTo().window((String)handles.toArray()[handles.size()-1]);
				}
			}
			else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
			{
				Thread.sleep(5000);
				String parentWindow = driver.getWindowHandle();
				Set<String> handles = driver.getWindowHandles();
				Object[] array = handles.toArray();
				Arrays.sort(array);
				System.out.println("Windows : "+Arrays.toString(array));
				if(!(array[array.length-1].toString().equals(parentWindow)))
				{
					driver.switchTo().window(array[array.length-1].toString());
					new WebDriverWait(driver, 180).until(
					          webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
					System.out.println("Hello : "+driver.getTitle());
					System.out.println("After Switching Window Handle : "+driver.getWindowHandle());
				}
			}
			else if(DriverScript.Config.getProperty("Browser").equals("ie"))
			{
				parentWindow = driver.getWindowHandle();
				if(driver.getWindowHandles().size()==2)
				{
					handles = driver.getWindowHandles();
					handles.remove(parentWindow);
					driver.switchTo().window((String)handles.toArray()[0]);
				}
				else if(driver.getWindowHandles().size()>2)
				{
					Set<String> newHandles = driver.getWindowHandles();
					newHandles.removeAll(handles);
					driver.switchTo().window((String)newHandles.toArray()[0]);
				}
				handles=driver.getWindowHandles();
				driver.manage().window().maximize();
				Thread.sleep(3000);
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
   }
   
   public void iVerifyNavigationOnInstituteHomePage(String role){
	   driver.manage().timeouts().pageLoadTimeout(600, TimeUnit.SECONDS);
	   Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[@href='http://02-wpress-qa-ue1a.remedypartners.com/index.php/contact-us/']")));
	   
	   try
   	{
   		if(DriverScript.Config.getProperty("Browser").equals("chrome"))
   		{
   			String parentWindow = driver.getWindowHandle();
               Set<String> handles = driver.getWindowHandles();
               if(!((String)handles.toArray()[0]).equals(parentWindow))
   			{
   				driver.switchTo().window((String)handles.toArray()[0]);
   			}
               delay();
   		}
   		else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
   		{
   			String parentWindow = driver.getWindowHandle();
               Set<String> handles = driver.getWindowHandles();
               Object[] array = handles.toArray();
				Arrays.sort(array);
               if(!(array[0].toString().equals(parentWindow)))
   			{
   				driver.switchTo().window(array[0].toString());
   			}
               delay();
   		}
   		else if(DriverScript.Config.getProperty("Browser").equals("ie"))
   		{
   			driver.switchTo().window(parentWindow);
   		}
   	}
   	catch(Exception e)
   	{
   		System.out.println(e.toString());
   	}
   }
   
   public void iVerifyRepOnReportsMainPage(String reportName, String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Reporting Classic"))
		   {
			   longDelay();
		       iWillWaitToSee(By.xpath("//iframe[@class='embedded-iframe ng-scope']"));
		       swithToFrame("//iframe[@class='embedded-iframe ng-scope']");
		       delay();
			   iWillWaitToSee(By.xpath("//div[text()=\""+reportName+"\"]"));
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()=\""+reportName+"\"]")));
		   }
	   }
   }
   
   public void iClickOnReportsTileUnderSpecificUserLoginPage(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application,",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Reporting Classic"))
		   {
			   iWillWaitToSee(By.xpath("//div[text()='Reporting Classic']"));
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Reporting Classic']")));
			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
			   {
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[text()='Reporting Classic']")));
			   }
			   else
			   {
				   clickElement(driver.findElement(By.xpath("//div[text()='Reporting Classic']")));  
			   }
		   }  
	   }
    }
   
   public void clickOnReportingTile(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   String[] apps = application.split(",");
	   boolean flag = false;
	   for(int i=0;i<apps.length;i++)
	   {
		   if(apps[i].trim().equals("Reporting"))
		   {
			   flag = true;
			   break;
		   }
	   }
	   if(flag)
	   {
		   iWillWaitToSee(By.xpath("//div[text()='Reporting']"));
		   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Reporting']")));
		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
		   {
			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[text()='Reporting']")));
		   }
		   else
		   {
			   clickElement(driver.findElement(By.xpath("//div[text()='Reporting']")));  
		   }
	   }
    }
   
   public void clickOnPMTile(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Program Management"))
		   {
			   iWillWaitToSee(By.xpath("//div[text()='Program Management']"));
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Program Management']")));
			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
			   {
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[text()='Program Management']")));
			   }
			   else
			   {
				   clickElement(driver.findElement(By.xpath("//div[text()='Program Management']")));  
			   }
		   } 
	   }
    }
   
   public void clickOnCareConnectTile(String role)
   {
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application,",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Care Connect"))
		   {
			   iWillWaitToSee(By.xpath("//div[text()='Care Connect']"));
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Care Connect']")));
			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
			   {
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[text()='Care Connect']")));
			   }
			   else
			   {
				   clickElement(driver.findElement(By.xpath("//div[text()='Care Connect']")));  
			   }
			   
			   try
				{
					if(DriverScript.Config.getProperty("Browser").equals("chrome"))
					{
						Thread.sleep(5000);
						String parentWindow = driver.getWindowHandle();
						Set<String> handles = driver.getWindowHandles();
						if(!((String)handles.toArray()[handles.size()-1]).equals(parentWindow))
						{
							driver.switchTo().window((String)handles.toArray()[handles.size()-1]);
						}
					}
					else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
					{
						Thread.sleep(5000);
						String parentWindow = driver.getWindowHandle();
						Set<String> handles = driver.getWindowHandles();
						Object[] array = handles.toArray();
						Arrays.sort(array);
						System.out.println("Windows : "+Arrays.toString(array));
						if(!(array[array.length-1].toString().equals(parentWindow)))
						{
							driver.switchTo().window(array[array.length-1].toString());
							new WebDriverWait(driver, 180).until(
							          webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
							System.out.println("Hello : "+driver.getTitle());
							System.out.println("After Switching Window Handle : "+driver.getWindowHandle());
						}
					}
					else if(DriverScript.Config.getProperty("Browser").equals("ie"))
					{
						parentWindow = driver.getWindowHandle();
						if(driver.getWindowHandles().size()==2)
						{
							handles = driver.getWindowHandles();
							handles.remove(parentWindow);
							driver.switchTo().window((String)handles.toArray()[0]);
						}
						else if(driver.getWindowHandles().size()>2)
						{
							Set<String> newHandles = driver.getWindowHandles();
							newHandles.removeAll(handles);
							driver.switchTo().window((String)newHandles.toArray()[0]);
						}
						handles=driver.getWindowHandles();
						driver.manage().window().maximize();
						Thread.sleep(3000);
					}
				}
				catch(Exception e)
				{
					System.out.println(e.toString());
				}
	   }
	   }
    }
   
   public void clickOnCommunityConnectTile(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Community Connect"))
		   {
			   iWillWaitToSee(By.xpath("//div[text()='Community Connect']"));
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='Community Connect']")));
			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
			   {
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[text()='Community Connect']")));
			   }
			   else
			   {
				   clickElement(driver.findElement(By.xpath("//div[text()='Community Connect']")));  
			   }
			   
			   try
				{
					if(DriverScript.Config.getProperty("Browser").equals("chrome"))
					{
						Thread.sleep(5000);
						String parentWindow = driver.getWindowHandle();
						Set<String> handles = driver.getWindowHandles();
						if(!((String)handles.toArray()[handles.size()-1]).equals(parentWindow))
						{
							driver.switchTo().window((String)handles.toArray()[handles.size()-1]);
						}
					}
					else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
					{
						Thread.sleep(5000);
						String parentWindow = driver.getWindowHandle();
						Set<String> handles = driver.getWindowHandles();
						Object[] array = handles.toArray();
						Arrays.sort(array);
						System.out.println("Windows : "+Arrays.toString(array));
						if(!(array[array.length-1].toString().equals(parentWindow)))
						{
							driver.switchTo().window(array[array.length-1].toString());
							new WebDriverWait(driver, 180).until(
							          webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
							System.out.println("Hello : "+driver.getTitle());
							System.out.println("After Switching Window Handle : "+driver.getWindowHandle());
						}
					}
					else if(DriverScript.Config.getProperty("Browser").equals("ie"))
					{
						parentWindow = driver.getWindowHandle();
						if(driver.getWindowHandles().size()==2)
						{
							handles = driver.getWindowHandles();
							handles.remove(parentWindow);
							driver.switchTo().window((String)handles.toArray()[0]);
						}
						else if(driver.getWindowHandles().size()>2)
						{
							Set<String> newHandles = driver.getWindowHandles();
							newHandles.removeAll(handles);
							driver.switchTo().window((String)newHandles.toArray()[0]);
						}
						handles=driver.getWindowHandles();
						driver.manage().window().maximize();
						Thread.sleep(3000);
					}
				}
				catch(Exception e)
				{
					System.out.println(e.toString());
				}
		   }
	   }
    }
   
   public void iVerifyNavigationOnReportsHomePage(String role)
   {
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Reporting Classic"))
		   {
			   iWillWaitToSee(By.cssSelector(".dropdown-tile-label.ng-binding"));
			   Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".dropdown-tile-label.ng-binding")));
		   }  
	   }
   }
   
   public void verifyUserNavigatedToReporting(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   String[] apps = application.split(",");
	   boolean flag = false;
	   for(int i=0;i<apps.length;i++)
	   {
		   if(apps[i].trim().equals("Reporting"))
		   {
			   flag = true;
			   break;
		   }
	   }
	   if(flag)
	   {
		   iWillWaitToSee(By.cssSelector(".report-title"));
		   Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".report-title")));
	   }
   }
   
   public void verifyUserNavigatedToPM(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Program Management"))
		   {
			   iWillWaitToSee(By.xpath("//a[text()='Organization']"));
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[text()='Organization']")));
		   }  
	   }
   }
   
   public void verifyUserNavigatedToCareConnect(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Care Connect")){
			   iWillWaitToSee(By.xpath("//label[contains(text(),'Please enter your ')]/em[text()='client code']"));
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//label[contains(text(),'Please enter your ')]/em[text()='client code']")));
			   
			   try
		    	{
		    		if(DriverScript.Config.getProperty("Browser").equals("chrome"))
		    		{
		    			String parentWindow = driver.getWindowHandle();
		                Set<String> handles = driver.getWindowHandles();
		                if(!((String)handles.toArray()[0]).equals(parentWindow))
		    			{
		    				driver.switchTo().window((String)handles.toArray()[0]);
		    			}
		                delay();
		    		}
		    		else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
		    		{
		    			String parentWindow = driver.getWindowHandle();
		                Set<String> handles = driver.getWindowHandles();
		                Object[] array = handles.toArray();
						Arrays.sort(array);
		                if(!(array[0].toString().equals(parentWindow)))
		    			{
		    				driver.switchTo().window(array[0].toString());
		    			}
		                delay();
		    		}
		    		else if(DriverScript.Config.getProperty("Browser").equals("ie"))
		    		{
		    			driver.switchTo().window(parentWindow);
		    		}
		    	}
		    	catch(Exception e)
		    	{
		    		System.out.println(e.toString());
		    	}
		   }
	   }
   }
   
   public void verifyUserNavigatedToCommunityConnect(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Community Connect"))
		   {
			   delay();
			   if(driver.findElements(By.xpath("//h1[text()='Forbidden']")).size()>0)
			   {
				   iWillWaitToSee(By.xpath("//h1[text()='Forbidden']"));
				   Assert.assertTrue(isElementPresentOnPage(By.xpath("//h1[text()='Forbidden']")));  
			   }
			   else if(driver.findElements(By.xpath("//img[@alt='Aunt Bertha Home']")).size()>0)
			   {
				   iWillWaitToSee(By.xpath("//img[@alt='Aunt Bertha Home']"));
				   Assert.assertTrue(isElementPresentOnPage(By.xpath("//img[@alt='Aunt Bertha Home']")));
			   }
			   
			   try
		    	{
		    		if(DriverScript.Config.getProperty("Browser").equals("chrome"))
		    		{
		    			String parentWindow = driver.getWindowHandle();
		                Set<String> handles = driver.getWindowHandles();
		                if(!((String)handles.toArray()[0]).equals(parentWindow))
		    			{
		    				driver.switchTo().window((String)handles.toArray()[0]);
		    			}
		                delay();
		    		}
		    		else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
		    		{
		    			String parentWindow = driver.getWindowHandle();
		                Set<String> handles = driver.getWindowHandles();
		                Object[] array = handles.toArray();
						Arrays.sort(array);
		                if(!(array[0].toString().equals(parentWindow)))
		    			{
		    				driver.switchTo().window(array[0].toString());
		    			}
		                delay();
		    		}
		    		else if(DriverScript.Config.getProperty("Browser").equals("ie"))
		    		{
		    			driver.switchTo().window(parentWindow);
		    		}
		    	}
		    	catch(Exception e)
		    	{
		    		System.out.println(e.toString());
		    	}
		   } 
	   }
   }
   
   public void iClickOnRemedyUTileUnderSpecificUserLoginPage(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Remedy University"))
		   {
			   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='RemedyU']")));
			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
			   {
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[text()='RemedyU']")));
			   }
			   else
			   {
				   clickElement(driver.findElement(By.xpath("//div[text()='RemedyU']")));
			   }
			   
			   try
				{
					if(DriverScript.Config.getProperty("Browser").equals("chrome"))
					{
						Thread.sleep(5000);
						String parentWindow = driver.getWindowHandle();
						Set<String> handles = driver.getWindowHandles();
						if(!((String)handles.toArray()[handles.size()-1]).equals(parentWindow))
						{
							driver.switchTo().window((String)handles.toArray()[handles.size()-1]);
						}
					}
					else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
					{
						Thread.sleep(5000);
						String parentWindow = driver.getWindowHandle();
						Set<String> handles = driver.getWindowHandles();
						Object[] array = handles.toArray();
						Arrays.sort(array);
						System.out.println("Windows : "+Arrays.toString(array));
						if(!(array[array.length-1].toString().equals(parentWindow)))
						{
							driver.switchTo().window(array[array.length-1].toString());
							new WebDriverWait(driver, 180).until(
							          webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
							System.out.println("Hello : "+driver.getTitle());
							System.out.println("After Switching Window Handle : "+driver.getWindowHandle());
						}
					}
					else if(DriverScript.Config.getProperty("Browser").equals("ie"))
					{
						parentWindow = driver.getWindowHandle();
						if(driver.getWindowHandles().size()==2)
						{
							handles = driver.getWindowHandles();
							handles.remove(parentWindow);
							driver.switchTo().window((String)handles.toArray()[0]);
						}
						else if(driver.getWindowHandles().size()>2)
						{
							Set<String> newHandles = driver.getWindowHandles();
							newHandles.removeAll(handles);
							driver.switchTo().window((String)newHandles.toArray()[0]);
						}
						handles=driver.getWindowHandles();
						driver.manage().window().maximize();
						Thread.sleep(3000);
					}
				}
				catch(Exception e)
				{
					System.out.println(e.toString());
				}  
	   }
   	}
   }
   
   public void iVerifyNavigationOnRemedyUHomePage(String role){
	   driver.manage().timeouts().pageLoadTimeout(600, TimeUnit.SECONDS);
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Remedy University"))
		   {
			   String user = role.substring(role.indexOf("-")+1);
			   if(user.equalsIgnoreCase("Remedy Technical Administrator")||user.equalsIgnoreCase("Partner Program Administrator")||user.equalsIgnoreCase("Remedy Program Administrator"))
			   {
				   iWillWaitToSee(By.cssSelector(".col-sm-6.col-md-3"));
				   Assert.assertTrue(driver.findElement(By.cssSelector(".col-sm-6.col-md-3")).isDisplayed());
			   }
			   else
			   {
				   iWillWaitToSee(By.cssSelector(".btn.btn-primary"));
				   driver.findElement(By.cssSelector(".btn.btn-primary")).click();
				   Assert.assertTrue(driver.findElement(By.cssSelector(".nav.litmos-sub-nav")).isDisplayed());
			   }
		   }  
	   }
   }
   
   public void iVerifyDetailsForUserOnRemedyUDashBoard(String details, String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   if(st.nextToken().trim().equals("Remedy University"))
		   {
			   String user = role.substring(role.indexOf("-")+1);
			   if(user.equalsIgnoreCase("Remedy Technical Administrator")||user.equalsIgnoreCase("Partner Program Administrator")||user.equalsIgnoreCase("Remedy Program Administrator"))
			   {
				   clickElement(driver.findElement(By.cssSelector("li[id='user_dropdown']")));
				   iWillWaitToSee(By.xpath("//a[contains(text(),'My Profile & Settings')]"));
				   clickElement(driver.findElement(By.xpath("//a[contains(text(),'My Profile & Settings')]")));
				   iWillWaitToSee(By.xpath("//li[contains(text(),'My Profile & Settings')]"));
				   iWillWaitToSee(By.xpath("//h1[@class='litmos-larger-header' and text()='"+details+"']"));
				   Assert.assertTrue(isElementPresentOnPage(By.xpath("//h1[@class='litmos-larger-header' and text()='"+details+"']")));
			   }
			   else
			   {
				   String actual = driver.findElement(By.cssSelector(".litmos-small-header.mt-0")).getText();
				   actual = actual.substring(actual.indexOf(",")+1).trim();
				   Assert.assertEquals(details, actual);
			   }  
	   }
	   }
   }
   
   public void iVerifyPathWayForUserOnRemedyUDashBoard(String pathway, String role){
	   if(!(pathway.equals("")))
	   {
		   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
		   StringTokenizer st1 = new StringTokenizer(application, ",");
		   while(st1.hasMoreTokens())
		   {
			   if(st1.nextToken().trim().equals("Remedy University"))
			   {
				   if(pathway.contains(","))
				   {
					   String user = role.substring(role.indexOf("-")+1);
					   if(user.equalsIgnoreCase("Remedy Technical Administrator")||user.equalsIgnoreCase("Partner Program Administrator")||user.equalsIgnoreCase("Remedy Program Administrator"))
					   {
						   clickElement(driver.findElement(By.xpath("//span[text()='Courses']")));
						   iWillWaitToSee(By.xpath("//h1[text()='Courses']"));
						   clickElement(driver.findElement(By.xpath("//a[text()='Learning Paths']")));
						   iWillWaitToSee(By.cssSelector(".active a[title='Learning Paths']"));
						   StringTokenizer st = new StringTokenizer(pathway, ",");
						   while(st.hasMoreTokens())
						   {
							   String a = st.nextToken().trim();
							   Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[contains(text(),\""+a+"\")]")));
						   }
					   }
					   else{
						   StringTokenizer st = new StringTokenizer(pathway, ",");
						   while(st.hasMoreTokens())
						   {
							   String a = st.nextToken().trim();
							   iWillWaitToSee(By.xpath("//p[contains(text(),\""+a+"\")]"));
							   Assert.assertTrue(isElementPresentOnPage(By.xpath("//p[contains(text(),\""+a+"\")]")));
						   }
					   }
				   }
				   else
				   {
					   Assert.assertTrue(isElementPresentOnPage(By.xpath("//p[contains(text(),\""+pathway+"\")]")));
				   }
				   
				   try
			    	{
			    		if(DriverScript.Config.getProperty("Browser").equals("chrome"))
			    		{
			    			String parentWindow = driver.getWindowHandle();
			                Set<String> handles = driver.getWindowHandles();
			                if(!((String)handles.toArray()[0]).equals(parentWindow))
			    			{
			    				driver.switchTo().window((String)handles.toArray()[0]);
			    			}
			                delay();
			    		}
			    		else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
			    		{
			    			String parentWindow = driver.getWindowHandle();
			                Set<String> handles = driver.getWindowHandles();
			                Object[] array = handles.toArray();
							Arrays.sort(array);
			                if(!(array[0].toString().equals(parentWindow)))
			    			{
			    				driver.switchTo().window(array[0].toString());
			    			}
			                delay();
			    		}
			    		else if(DriverScript.Config.getProperty("Browser").equals("ie"))
			    		{
			    			driver.switchTo().window(parentWindow);
			    		}
			    	}
			    	catch(Exception e)
			    	{
			    		System.out.println(e.toString());
			    	}
		   }
		   }  
	   }
   }
   
   public void iClickOnPhysicanConnectTileUnderSpecificUserLoginPage(String role){
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   if(application.contains("Physician Connect")){
		   Assert.assertTrue(isElementPresentOnPage(By.xpath("//p[text()='Gainsharing Physician Survey']")));
		   clickElement(driver.findElement(By.xpath("//p[text()='Gainsharing Physician Survey']")));
		   delay();
		   driver.navigate().back(); 
	   }
   }
    
   public void iClickOnInternalSupportOptionFromDropdownUnderSpecificUserLoginPage(String text){
	   clickElement(driver.findElement(By.cssSelector(".valentino-icon-profile")));
	   if(text.isEmpty()!=true){
		     
		   Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[contains(text(),'"+text+"')]")));
		   clickElement(driver.findElement(By.xpath("//a[contains(text(),'"+text+"')]")));
		   switchToNewWindow();
		   delay();
		   iWillWaitToSee(By.cssSelector("#cv-content"));
		   Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector("#cv-content"))));
		   switchBacktoOldWindow(); 
   	}
   }
   
   public void iSelectSupportOptionFromTheDropdownUnderSpecificUserLoginPage(String text){
	   if(text.isEmpty()!=true){
		   iWillWaitToSee(By.xpath("//a[contains(text(),'"+text+"')]"));
		   Assert.assertTrue(isElementPresentOnPage(By.xpath("//a[contains(text(),'"+text+"')]")));
		   clickElement(driver.findElement(By.xpath("//a[contains(text(),'"+text+"')]")));
		   switchToNewWindow();
		   delay();
		   iWillWaitToSee(By.cssSelector("#cv-content"));
		   Assert.assertTrue(isElementVisible(driver.findElement(By.cssSelector("#cv-content"))));
		   switchBacktoOldWindow(); 
   	}  
   }
   
   public void iNavigateBackToSpecificUserLoginPage(){
	   driver.navigate().back();
   }
   
   public void iVerifyTheInternalSupportProductTileForSelectedUserRole(String text) {
	 	if(text.isEmpty()!=true){
   		verifyTextForElementfromList(".checkbox.checkbox-single.ng-not-empty.ng-valid>label>span", text);
    	}
   }
  
   
   public void iVerifyTheUserroleUnderEc1DashboardPageAfterSpecificUserLogin(){
	   Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".username")));
	   clickElement(driver.findElement(By.cssSelector("#patientsListOpenClose")));
	   clickElement(driver.findElement(By.xpath("//a[@href='/secure/pn/patientslist']")));
	   delay();
	   clickElement(driver.findElement(By.xpath("//div[1]/div[2]/div[4]/a[1]")));
	   clickElement(driver.findElement(By.xpath("//div[1]/div[2]/div[4]/ul/li[5]/a")));
	   delay();
	   Assert.assertTrue(isElementPresentOnPage(By.xpath("//textarea[contains(text(),'ROLE_ADMIN')]")));
   }
   
   public void iVerifyTheInstituteDashboardPageAfterClickingOnInstituteTileUnderSpecificUserLoginPage(){
	   Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".navbar-header")));
   }
   public void verifyFieldNames(String fieldName)
   {
	   iWillWaitToSee(By.xpath("//label[text()='"+fieldName+"']"));
	   Assert.assertTrue(isElementPresentOnPage(By.xpath("//label[text()='"+fieldName+"']")));
   }
   
   public void verifyMandatoryFieldNames(String fieldName)
   {
	   iVerifyTextFromListOfElement(By.xpath("//label[@class='required']"), fieldName);
   }
   
   public void verifyRoleNames(String fieldName)
   {
	   WebElement element = driver.findElement(By.xpath("//span[text()='"+fieldName+"']"));
   	   ((JavascriptExecutor) driver).executeScript("arguments[0].scrollIntoView(true);", element);
	   iVerifyTextFromListOfElement(By.xpath("//div[@class='menu transition visible']/div"), fieldName);
   }
   
   public void clickOnFieldButton(String fieldName)
   {
	   if(fieldName.equalsIgnoreCase("Role"))
	   {
		   clickElement(driver.findElement(By.xpath("//div[text()='Select Role']")));
	   }
	   else
	   {
		   clickElement(driver.findElement(By.xpath("//input[@placeholder='"+fieldName+"']")));
	   }
   }
   
   public void switchFocus()
   {
	   driver.findElement(By.xpath("//button[text()='Cancel']")).sendKeys(Keys.TAB);
   }
   
   public void ValidateMessage(String validationMessage)
   {
	     iVerifyTextFromListOfElement(By.xpath("//label[contains(@class,'error')]"), validationMessage);
   }
   
   public void clickNextButton() throws Throwable {
	   delay();
	   if(DriverScript.Config.getProperty("Browser").equals("ie"))
	   {
		   iWillWaitToSee(By.xpath("//button[text()='Next ']"));
		   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//button[text()='Next ']")));
	   }
	   else
	   {
		   iWillWaitToSee(By.xpath("//button[text()='Next ']"));
		   clickElement(driver.findElement(By.xpath("//button[text()='Next ']")));
	   }
   }
   
   public void clickBackButton() throws Throwable {
	   clickElement(driver.findElement(By.xpath("//button[text()=' Back']")));  
}
   
   public void clickTab(String text) throws Throwable {
	   iWillWaitToSee(By.xpath("//a[contains(text(),'"+text+"')]"));	
	   clickElement(driver.findElement(By.xpath("//a[contains(text(),'"+text+"')]")));
	   }
   
   public void verifyHeader(String text) throws Throwable 
   {
	   iWillWaitToSee(By.xpath("//h3[text()='"+text+"']"));
	   	Assert.assertTrue(isElementPresentOnPage(By.xpath("//h3[text()='"+text+"']")));
   }
   
   public void clickAlreadySelectedHealthSystem(String text) throws Throwable {
	   	driver.findElement(By.xpath("//span[@class='component-participant-title'][text()='"+text+"']")).click();
	   }

   public void clickSelectAllLocationsButton() throws Throwable {
	   iWillWaitToSee(By.xpath("//label[.='All Locations']"));
	   clickElement(driver.findElement(By.xpath("//label[.='All Locations']")));   
   }

   public void clickSubmitButtonForEdit(String user) throws Throwable {
	   if(user.indexOf("-")==user.lastIndexOf("-"))
	   {
		   iWillWaitToSee(By.xpath("//button[.='Submit']"));
			waitTo().until(ExpectedConditions.elementToBeClickable(By.xpath("//button[.='Submit']")));
		   clickElement(driver.findElement(By.xpath("//button[.='Submit']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".ui.modal.transition.visible.active.component-add-user-form")));
			HashMap<String,String> emailList = new HashMap<String,String>();
			HashMap<String,String> applicationsList = new HashMap<String,String>();
			HashMap<String,String> NPIList = new HashMap<String,String>();
			if(user.contains("--"))
			{
				String newRole = user.substring(user.indexOf("-")+1, user.lastIndexOf("-")-1);
				String oldRole = user.substring(user.lastIndexOf("-")+1,user.length());
				String userL = user.substring(0,user.indexOf("-")); 
				emailList.put(newRole, CreateUserPage.usersEmailPerRole.get(userL+"-"+oldRole).get(oldRole).trim());
				applicationsList.put(newRole, userApplications);
				if(newRole.equals("Physicians"))
				{
					NPIList.put(newRole, userNPI);
				}
				else
				{
					NPIList.put(newRole, "");
				}
				userNPI = "";
				if(user.contains("Super Admin"))
				{
					usersEmailPerRole.put(userL+"-"+newRole, emailList);
					usersApplicationsPerRole.put(userL+"-"+newRole, applicationsList);
					usersNPIPerRole.put(userL+"-"+newRole, NPIList);
				}
				else if(user.contains("Partner Technical Administrator"))
				{
					usersEmailPerRole.put(userL+"-"+newRole, emailList);
					usersApplicationsPerRole.put(userL+"-"+newRole, applicationsList);
					usersNPIPerRole.put(userL+"-"+newRole, NPIList);
				}
			}
			else
			{
				emailList.put(user.substring(user.indexOf("-")+1), CreateUserPage.usersEmailPerRole.get(user).get(user.substring((user.indexOf("-")+1)).trim()));
				applicationsList.put(user.substring(user.indexOf("-")+1), userApplications);
				if(user.contains("Physicians"))
				{
					NPIList.put(user.substring(user.indexOf("-")+1), userNPI);
				}
				else
				{
					NPIList.put(user.substring(user.indexOf("-")+1), "");
				}
				userNPI = "";
				if(user.contains("Super Admin"))
				{
					usersEmailPerRole.put(user.trim(), emailList);
					usersApplicationsPerRole.put(user.trim(), applicationsList);
					usersNPIPerRole.put(user.trim(), NPIList);
				}
				else if(user.contains("Partner Technical Administrator"))
				{
					usersEmailPerRole.put(user.trim(), emailList);
					usersApplicationsPerRole.put(user.trim(), applicationsList);
					usersNPIPerRole.put(user.trim(), NPIList);
				}
			} 
	   }
	   else
	   {
		   String firstKey = user.substring(0,user.indexOf("-"));
			String secondKey = user.substring(user.indexOf("-")+1, user.lastIndexOf("-"));
			String thirdKey = user.substring(user.lastIndexOf("-")+1, user.length());
		   iWillWaitToSee(By.xpath("//button[.='Submit']"));
			waitTo().until(ExpectedConditions.elementToBeClickable(By.xpath("//button[.='Submit']")));
		   clickElement(driver.findElement(By.xpath("//button[.='Submit']")));
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".ui.modal.transition.visible.active.component-add-user-form")));
			HashMap<String,String> emailList = new HashMap<String,String>();
			HashMap<String,String> applicationsList = new HashMap<String,String>();
			HashMap<String,String> NPIList = new HashMap<String,String>();
			if(!(secondKey.equals("")))
			{
				String newRole = thirdKey;
				String oldRole = secondKey;
				String userL = firstKey; 
				emailList.put(newRole, CreateUserPage.usersEmailPerRole.get(userL+"-"+oldRole).get(oldRole).trim());
				applicationsList.put(newRole, userApplications);
				if(newRole.equals("Physicians"))
				{
					NPIList.put(newRole, userNPI);
				}
				else
				{
					NPIList.put(newRole, "");
				}
				userNPI = "";
				if(user.contains("Super Admin"))
				{
					usersEmailPerRole.put(userL+"-"+newRole, emailList);
					usersApplicationsPerRole.put(userL+"-"+newRole, applicationsList);
					usersNPIPerRole.put(userL+"-"+newRole, NPIList);
				}
				else if(user.contains("Partner Technical Administrator"))
				{
					usersEmailPerRole.put(userL+"-"+newRole, emailList);
					usersApplicationsPerRole.put(userL+"-"+newRole, applicationsList);
					usersNPIPerRole.put(userL+"-"+newRole, NPIList);
				}
			}
			else
			{
				emailList.put(thirdKey, CreateUserPage.usersEmailPerRole.get(firstKey+"-"+thirdKey).get(thirdKey));
				applicationsList.put(thirdKey, userApplications);
				if(thirdKey.contains("Physicians"))
				{
					NPIList.put(user.substring(user.indexOf("-")+1), userNPI);
				}
				else
				{
					NPIList.put(user.substring(user.indexOf("-")+1), "");
				}
				userNPI = "";
				if(firstKey.contains("Super Admin"))
				{
					usersEmailPerRole.put(firstKey+"-"+thirdKey, emailList);
					usersApplicationsPerRole.put(firstKey+"-"+thirdKey, applicationsList);
					usersNPIPerRole.put(firstKey+"-"+thirdKey, NPIList);
				}
				else if(firstKey.contains("Partner Technical Administrator"))
				{
					usersEmailPerRole.put(firstKey+"-"+thirdKey, emailList);
					usersApplicationsPerRole.put(firstKey+"-"+thirdKey, applicationsList);
					usersNPIPerRole.put(firstKey+"-"+thirdKey, NPIList);
				}
			} 
	   }
   }
   
   public void clickSubmitButtonToCheckErrorMessage() throws Throwable {
	   iWillWaitToSee(By.xpath("//button[.='Submit']"));
		clickElement(driver.findElement(By.xpath("//button[.='Submit']")));
   }
   
	public void clickSubmitButtonForDifferentUsers(String user) throws Throwable {
		iWillWaitToSee(By.xpath("//button[.='Submit']"));
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//button[.='Submit']")));
		}
		else
		{
			clickElement(driver.findElement(By.xpath("//button[.='Submit']")));
		}
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".ui.modal.transition.visible.active.component-add-user-form")));
		HashMap<String,String> emailList = new HashMap<String,String>();
		HashMap<String,String> applicationsList = new HashMap<String,String>();
		HashMap<String,String> NPIList = new HashMap<String,String>();
		emailList.put(userRole.trim(), MailCreateUser.email.trim());
		applicationsList.put(userRole.trim(), userApplications);
		NPIList.put(userRole.trim(), userNPI);
		userNPI = "";
		if(user.contains("Super Admin"))
		{
			usersEmailPerRole.put(user.trim()+"-"+userRole.trim(), emailList);
			usersApplicationsPerRole.put(user.trim()+"-"+userRole.trim(), applicationsList);
			usersNPIPerRole.put(user.trim()+"-"+userRole.trim(), NPIList);
			System.out.println(usersEmailPerRole.toString());
		}
		else if(user.contains("Remedy Technical Administrator"))
		{
			usersEmailPerRole.put(user.trim()+"-"+userRole.trim(), emailList);
			usersApplicationsPerRole.put(user.trim()+"-"+userRole.trim(), applicationsList);
			usersNPIPerRole.put(user.trim()+"-"+userRole.trim(), NPIList);
		}
		else if(user.contains("Partner Technical Administrator"))
		{
			usersEmailPerRole.put(user.trim()+"-"+userRole.trim(), emailList);
			usersApplicationsPerRole.put(user.trim()+"-"+userRole.trim(), applicationsList);
			usersNPIPerRole.put(user.trim()+"-"+userRole.trim(), NPIList);
			System.out.println(usersEmailPerRole.toString());
		}
	}
	public void clickSubmitButton() throws Throwable {
		iWillWaitToSee(By.xpath("//button[.='Submit']"));
		clickElement(driver.findElement(By.xpath("//button[.='Submit']")));
		waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".ui.modal.transition.visible.active.component-add-user-form")));
	}
	
   public void verifyAppUnchecked(String fieldName) throws Throwable 
   {
	 if(!(fieldName.isEmpty())) 
	   {
		 iWillWaitToSee(By.xpath("//div[@class='ui checkbox']"));
		 if(fieldName.contains(","))
		 {
		   StringTokenizer st = new StringTokenizer(fieldName,",");
	       while (st.hasMoreTokens()) 
	       {  
	    	   Assert.assertTrue(isElementPresent(By.xpath("//label[text()='"+st.nextToken().trim()+"']/parent::div[@class='ui checkbox']")));
	       }  
		 }
		 else
		 {
		   Assert.assertTrue(isElementPresent(By.xpath("//label[text()='"+fieldName+"']/parent::div[@class='ui checkbox']")));
		 }
	   }
   	}

	public void verifyAppChecked(String fieldName) throws Throwable 
	{
	 if(!(fieldName.isEmpty()))
	 {
		 iWillWaitToSee(By.xpath("//div[@class='ui checked disabled checkbox']"));
		 if(fieldName.contains(","))
		 {
		   StringTokenizer st = new StringTokenizer(fieldName,",");
	       while (st.hasMoreTokens()) 
	       { 
	    	   Assert.assertTrue(isElementPresent(By.xpath("//label[text()='"+st.nextToken().trim()+"']/parent::div[contains(@class,'ui checked')]")));
	       }
		 }  
		 else
		 {
			 Assert.assertTrue(isElementPresent(By.xpath("//label[text()='"+fieldName+"']/parent::div[contains(@class,'ui checked')]")));
		 } 
	 }
	}
   
   public void verifyApplicationList(String appList) throws Throwable {
       if(appList.contains(","))
       {
    	   StringTokenizer st = new StringTokenizer(appList,",");
           while (st.hasMoreTokens()) {  
               
            Assert.assertTrue(isElementPresentOnPage(By.xpath("//label[.='"+st.nextToken().trim()+"']")));
           }   
       }
       else
       {
    	   Assert.assertTrue(isElementPresentOnPage(By.xpath("//label[.='"+appList+"']")));
       }
   } 
   
   public void verifyLearningPathwayNotAvailable() throws Throwable {
	   Assert.assertFalse(isElementPresentOnPage(By.xpath(".column.padding>.component-learning-pathway-dropdown")));
   }
   
   public void verifyLearningPathwayAvailable() throws Throwable 
   {
	   if(userApplications.contains("Remedy University"))
       {
		   Assert.assertTrue(isElementPresentOnPage(By.cssSelector(".column.padding>.component-learning-pathway-dropdown")));
       }
   }
   
   public void clickLessonsSelectButton() throws Throwable {
       if(userApplications.contains("Remedy University"))
       {
    	   if(DriverScript.Config.getProperty("Browser").equals("ie"))
    	   {
    		   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='Select']")));
    	   }
    	   else
    	   {
    		   iWillWaitToSee(By.xpath("//span[text()='Select']"));
        	   clickElement(driver.findElement(By.xpath("//span[text()='Select']")));  
    	   }
       }
   }
   
   public void clickCancelButton() throws Throwable {
       clickElement(driver.findElement(By.xpath("//button[text()='Cancel']")));
   }

   public void EditLearningPathway(String searchParam) throws Throwable {
       if(!(searchParam.isEmpty()))
       {
    	   iWillWaitToSee(By.xpath("//div[@class='ui selection dropdown']"));
    	   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='ui selection dropdown']")));
    	   if(!(searchParam.equals("")))
           {
        	   if(searchParam.contains(","))
        	   {
        		   StringTokenizer st = new StringTokenizer(searchParam, ",");
        		   while (st.hasMoreTokens()) {
        			   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']"))));
        			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")));
        			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
        			   {
            			   String a = st.nextToken().trim();
            			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), a).build().perform();
            			   delay();
            			   while(!(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")).getAttribute("value").equals(a)))
            			   {
            				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
            				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), a).build().perform();
            			   }
            			   iWillWaitToSee(By.xpath("//section[@class='component-learning-pathway-dropdown']//div[@class='ui checkbox' or @class='ui checked checkbox']/label[contains(text(),\""+a+"\")]"));
            			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//section[@class='component-learning-pathway-dropdown']//div[@class='ui checkbox' or @class='ui checked checkbox']/label[contains(text(),\""+a+"\")]")));
        			   }
        			   else
        			   {
        				   driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
            			   String a = st.nextToken().trim();
            			   iFillInText(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), a);
            			   iWillWaitToSee(By.xpath("//section[@class='component-learning-pathway-dropdown']//div[@class='ui checkbox' or @class='ui checked checkbox']/label[contains(text(),\""+a+"\")]"));
            			   clickElement(driver.findElement(By.xpath("//section[@class='component-learning-pathway-dropdown']//div[@class='ui checkbox' or @class='ui checked checkbox']/label[contains(text(),\""+a+"\")]"))); 
        			   }
        		   }
        		   driver.findElement(By.xpath("//a[contains(text(),'Applications')]")).click();
        	   }
        	   else
        	   {
        		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
        		   {
        			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")));
        			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), searchParam).build().perform();
        			   delay();
        			   while(!(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")).getAttribute("value").equals(searchParam)))
        			   {
        				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
        				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), searchParam).build().perform();
        			   }
        			   iWillWaitToSee(By.xpath("//section[@class='component-learning-pathway-dropdown']//div[@class='ui checkbox' or @class='ui checked checkbox']/label[contains(text(),\""+searchParam+"\")]"));
        			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//section[@class='component-learning-pathway-dropdown']//div[@class='ui checkbox' or @class='ui checked checkbox']/label[contains(text(),\""+searchParam+"\")]")));
        		   }
        		   else
        		   {
        			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")));
            		   driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
            		   iFillInText(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), searchParam.trim());
        			   iWillWaitToSee(By.xpath("//section[@class='component-learning-pathway-dropdown']//div[@class='ui checkbox' or @class='ui checked checkbox']/label[contains(text(),\""+searchParam+"\")]"));
            		   clickElement(driver.findElement(By.xpath("//section[@class='component-learning-pathway-dropdown']//div[@class='ui checkbox' or @class='ui checked checkbox']/label[contains(text(),\""+searchParam+"\")]")));
            		   driver.findElement(By.xpath("//a[contains(text(),'Applications')]")).click();
        		   }
        	   }
           } 
       }
       }
   

   public void selectLearningPath(String searchParam) throws Throwable {
       if(userApplications.contains("Remedy University"))
       {
    	   if(!(searchParam.equals("")))
           {
        	   if(searchParam.contains(","))
        	   {
        		   StringTokenizer st = new StringTokenizer(searchParam, ",");
        		   while (st.hasMoreTokens()) {
        			   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']"))));
        			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")));
        			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
        			   {
            			   String a = st.nextToken().trim();
            			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), a).build().perform();
            			   delay();
            			   while(!(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")).getAttribute("value").equals(a)))
            			   {
            				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
            				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), a).build().perform();
            			   }
            			   iWillWaitToSee(By.xpath("//div[@class='ui checkbox']/label[contains(text(),\""+a+"\")]"));
            			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='ui checkbox']/label[contains(text(),\""+a+"\")]")));
        			   }
        			   else
        			   {
        				   driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
            			   String a = st.nextToken().trim();
            			   iFillInText(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), a);
            			   iWillWaitToSee(By.xpath("//div[@class='ui checkbox']/label[contains(text(),\""+a+"\")]"));
            			   clickElement(driver.findElement(By.xpath("//div[@class='ui checkbox']/label[contains(text(),\""+a+"\")]"))); 
        			   }
        		   }
        		   driver.findElement(By.xpath("//a[contains(text(),'Applications')]")).click();
        	   }
        	   else
        	   {
        		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
        		   {
        			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")));
        			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), searchParam).build().perform();
        			   delay();
        			   while(!(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")).getAttribute("value").equals(searchParam)))
        			   {
        				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
        				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), searchParam).build().perform();
        			   }
        			   iWillWaitToSee(By.xpath("//div[@class='ui checkbox']/label[contains(text(),\""+searchParam+"\")]"));
        			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='ui checkbox']/label[contains(text(),\""+searchParam+"\")]")));
        		   }
        		   else
        		   {
        			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")));
            		   driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
            		   iFillInText(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), searchParam);
        			   iWillWaitToSee(By.xpath("//div[@class='ui checkbox']/label[contains(text(),\""+searchParam+"\")]"));
            		   clickElement(driver.findElement(By.xpath("//div[@class='ui checkbox']/label[contains(text(),\""+searchParam+"\")]")));
            		   driver.findElement(By.xpath("//a[contains(text(),'Applications')]")).click();
        		   }
        	   }
           } 
       }
   }
   
   public void clearLearningPathwaySearchBox() throws Throwable {
	   driver.findElement(By.xpath("//input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
   }
   
   public void verifyLoginButton() throws Throwable {
	   Assert.assertTrue(isElementPresentOnPage(By.xpath("//*[contains(text(),'Log In')]")));
   }
   public void iVerifyModel(String text){
	   delay();
	   driver.findElement(By.cssSelector(".ui.selection.dropdown")).click();
	   iWillWaitToSee(By.xpath("//label[contains(text(),'BPCI-Model')]"));
	  Assert.assertFalse( isElementNotPresentOnPage(By.xpath("//label[text()='"+text+"']")));
	  driver.findElement(By.cssSelector(".ui.selection.dropdown")).click();
	}
   public void selectPrograms(String programList) throws Throwable {
	   if(!(programList.equals("")))
   	{
		   delay();
	   if(!(driver.findElements(By.xpath("//span[text()='Select']")).size()>0))
		 {
			return;
		 }

	   if(programList.contains(","))
	   {
		   StringTokenizer st = new StringTokenizer(programList,",");
		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
		   {
			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='Select']")));
		   }
		   else
		   {
			   driver.findElement(By.xpath("//span[text()='Select']")).click();
		   }
		   while (st.hasMoreTokens()) {
	    	   String programs = st.nextToken().trim();
	    	   iWillWaitToSee(By.xpath("//label[text()='"+programs+"']"));
	    	   if(DriverScript.Config.getProperty("Browser").equals("ie"))
			   {
				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//label[text()='"+programs+"']")));
			   }
	    	   else
	    	   {
	    		   driver.findElement(By.xpath("//label[text()='"+programs+"']")).click();
	    	   }
	       }   
	   }
	   else
	   {
		   longDelay();
		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
		   {
			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='Select']")));
		   }
		   else
		   {
			   driver.findElement(By.xpath("//span[text()='Select']")).click();  
		   }
		   longDelay();
		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
		   {
			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//label[text()='"+programList+"']")));
		   }
		   else
		   {
			   driver.findElement(By.xpath("//label[text()='"+programList+"']")).click();  
		   }
		   
		   longDelay();
	   }
   	}
   }
   public void deselectPrograms(String programList) throws Throwable {
		if (!(programList.equals(""))) {
			longDelay();
			
			if (programList.contains(",")) {
				StringTokenizer st = new StringTokenizer(programList, ",");
				driver.findElement(By.cssSelector(".ui.selection.dropdown")).click();
				while (st.hasMoreTokens()) {
					String programs = st.nextToken().trim();
					iWillWaitToSee(By.xpath("//label[text()='" + programs + "']"));
					driver.findElement(By.xpath("//label[text()='" + programs + "']")).click();
					Thread.sleep(2000);
				}
			} else {

				longDelay();
				driver.findElement(By.cssSelector(".ui.selection.dropdown")).click();
				longDelay();
				driver.findElement(By.xpath("//label[text()='" + programList + "']")).click();
				longDelay();
			}
			driver.findElement(By.cssSelector(".ui.selection.dropdown")).click();
		}
	}

   public void selectLocations(String locationList) throws Throwable {
	   if(!(locationList.equals("")))
	   	{
	   if(locationList.equalsIgnoreCase("All Locations")){
		  delay();
		  if(DriverScript.Config.getProperty("Browser").equals("ie"))
		   {
			  iWillWaitToSee(By.xpath("//div[@class='content active']//label[text()='All Locations']"));
			  ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//label[text()='All Locations']")));
			  delay();
		   }
		  else
		  {
			  iWillWaitToSee(By.xpath("//div[@class='content active']//label[text()='All Locations']"));
			   clickElement(driver.findElement(By.xpath("//div[@class='content active']//label[text()='All Locations']")));
			   delay();  
		  }
	   }
	   
	   else if (locationList.contains(","))
	   {
		   StringTokenizer st = new StringTokenizer(locationList,",");
	       while (st.hasMoreTokens()) {
	    	   String token = st.nextToken().trim();
	    	   String location = token.substring(token.indexOf("--")+2, token.length());
	    	   String BPID = token.substring(0, token.indexOf("--"));
	    	   if(location.contains(BPID))
	    	   {
		    	   delay();
	    		   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']"))));
	    		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
	    		   {
	    			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")));
	    			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), BPID).build().perform();
	    			   while(!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getAttribute("value").equals(BPID)))
	    			   {
	    				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//i[@class='remove link icon remove-icon']")));
	    				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), BPID).build().perform();  
	    			   }
	    		   }
	    		   else
	    		   {
	    			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")));
		    		   iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), BPID); 
		    		   while(!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getAttribute("value").equals(BPID)))
	    			   {
	    				   driver.findElement(By.xpath("//div[@class='content active']//i[@class='remove link icon remove-icon']")).click();
	    				   iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), BPID);  
	    			   }
	    		   }
		    	   iWillWaitToSee(By.xpath("//div[@class='content active']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
		    	   Thread.sleep(3000);
		    	   if(DriverScript.Config.getProperty("Browser").equals("ie"))
		    	   {
		    		   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"))); 
		    	   }
		    	   else
		    	   {
		    		   driver.findElement(By.xpath("//div[@class='content active']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")).click();  
		    	   }
		    	   Thread.sleep(3000);
	    	   }
	    	   else
	    	   {
		    	   delay();
	    		   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']"))));
	    		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
	    		   {
	    			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")));
	    			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), location).build().perform();
	    			   while(!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getAttribute("value").equals(location)))
	    			   {
	    				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//i[@class='remove link icon remove-icon']")));
	    				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), location).build().perform(); 
	    			   }
	    		   }
	    		   else
	    		   {
	    			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")));
		    		   iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), location);
		    		   while(!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getAttribute("value").equals(location)))
	    			   {
	    				   driver.findElement(By.xpath("//div[@class='content active']//i[@class='remove link icon remove-icon']")).click();
	    				   iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), location); 
	    			   }
	    		   }
		    	   iWillWaitToSee(By.xpath("//div[@class='content active']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
		    	   Thread.sleep(3000);
		    	   if(DriverScript.Config.getProperty("Browser").equals("ie"))
		    	   {
		    		   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")));
		    	   }
		    	   else
		    	   {
		    		   driver.findElement(By.xpath("//div[@class='content active']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")).click();  
		    	   }
		    	   Thread.sleep(3000); 
	    	   }
	       }   
	   }
	   else if(locationList.contains("--"))
	   {
		   String token = locationList;
    	   String location = token.substring(token.indexOf("--")+2, token.length());
    	   String BPID = token.substring(0, token.indexOf("--"));
    	   if(location.contains(BPID))
    	   {
        	   delay();
    		   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']"))));
    		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
    		   {
    			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")));
    			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), BPID).build().perform();
    			   while(!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getAttribute("value").equals(BPID)))
    			   {
    				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//i[@class='remove link icon remove-icon']")));
    				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), BPID).build().perform();
    			   }
    		   }
    		   else
    		   {
    			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")));
        		   iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), BPID);
        		   while(!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getAttribute("value").equals(BPID)))
    			   {
    				   driver.findElement(By.xpath("//div[@class='content active']//i[@class='remove link icon remove-icon']")).click();
    				   iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), BPID);
    			   }
    		   }
        	   iWillWaitToSee(By.xpath("//div[@class='content active']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
        	   Thread.sleep(3000);
        	   if(DriverScript.Config.getProperty("Browser").equals("ie"))
        	   {
        		   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")));
        	   }
        	   else
        	   {
        		   driver.findElement(By.xpath("//div[@class='content active']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")).click();  
        	   }
        	   Thread.sleep(3000);
    	   }
    	   else
    	   {
        	   delay();
    		   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']"))));
    		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
    		   {
    			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")));
    			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), location).build().perform();
    			   while(!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getAttribute("value").equals(location)))
    			   {
    				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//i[@class='remove link icon remove-icon']")));
    				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), location).build().perform();
    			   }
    		   }
    		   else
    		   {
    			   scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")));
        		   iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), location);
        		   while(!(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")).getAttribute("value").equals(location)))
    			   {
    				   driver.findElement(By.xpath("//div[@class='content active']//i[@class='remove link icon remove-icon']")).click();
    				   iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), location);
    			   }
    		   }
        	   iWillWaitToSee(By.xpath("//div[@class='content active']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
        	   Thread.sleep(3000);
        	   if(DriverScript.Config.getProperty("Browser").equals("ie"))
        	   {
        		   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='content active']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")));
        	   }
        	   else
        	   {
        		   driver.findElement(By.xpath("//div[@class='content active']//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")).click();  
        	   }
        	   Thread.sleep(3000);   
    	   }
	   	    }
	   }else{
		   return;
	   }
   }
   
   public void selectLocationsForDownstreamProvider(String locationList) throws Throwable 
   {
	   if(!(locationList.equals("")))
	   	{
			   StringTokenizer st = new StringTokenizer(locationList,",");
		       while (st.hasMoreTokens()) 
		       {
		    	   if(DriverScript.Config.getProperty("Browser").equals("ie"))
		    	   {
		    		   String token = st.nextToken().trim();
			    	   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
			    	   new Actions(driver).sendKeys(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), token).build().perform();
			    	   while(!(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).getAttribute("value")).equals(token))
			    	   {
			    		   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
			    		   new Actions(driver).sendKeys(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), token).build().perform();
			    	   }
			    	   iWillWaitToSee(By.xpath("//tr[@class='component-bpid-row']//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+token.toLowerCase()+"\")]"));
			    	   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//tr[@class='component-bpid-row']//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+token.toLowerCase()+"\")]")));
		    	   }
		    	   else
		    	   {
		    		   String token = st.nextToken().trim();
			    	   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
			    	   driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
			    	   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), token);
			    	   while(!(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).getAttribute("value")).equals(token))
			    	   {
			    		   driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")).click();
			    		   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), token);
			    	   }
			    	   iWillWaitToSee(By.xpath("//tr[@class='component-bpid-row']//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+token.toLowerCase()+"\")]"));
			    	   delay();
			    	   driver.findElement(By.xpath("//tr[@class='component-bpid-row']//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+token.toLowerCase()+"\")]")).click();  
		    	   }
		   		}
		   	}
	   	}
   public void iSearchDPLocations(String locationList)
   {
	   if(!(locationList.equals("")))
	   	{
		   if(locationList.contains(","))
		   {
			   StringTokenizer st = new StringTokenizer(locationList,",");
		       while (st.hasMoreTokens()) 
		       {
		    	   String token = st.nextToken().trim();
		    	   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
		    	   driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
		    	   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), token);
		       }
		   }
		   else
		   {
			   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
	    	   driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
	    	   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), locationList);
		   }
	   	}
   }
   public void selectLocationsForPTAUser(String locationList) throws Throwable {
	   if(!(locationList.equals("")))
	   	{
		   if(locationList.equalsIgnoreCase("All Locations"))
		   {
			   clickElement(driver.findElement(By.xpath("//label[text()='All Locations']")));
		   }
		   else if (locationList.contains(","))
		   {
			   StringTokenizer st = new StringTokenizer(locationList,",");
		       while (st.hasMoreTokens()) {
		    	   String token = st.nextToken().trim();
		    	   String location = token.substring(token.indexOf("--")+2, token.length());
		    	   String BPID = token.substring(0, token.indexOf("--"));
		    	   if(location.contains(BPID))
		    	   {
		    		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
		    		   {
		    			   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
		    			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), BPID).build().perform();
		    			   while(!(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).getAttribute("value").equals(BPID)))
		    			   {
		    				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
		    				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), BPID).build().perform();
		    			   }
		    			   iWillWaitToSee(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
		    			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")));
		    		   }
		    		   else
		    		   {
		    			   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
			    		   driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
			    		   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), BPID);
			    		   while(!(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).getAttribute("value").equals(BPID)))
		    			   {
		    				   driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")).click();
		    				   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), BPID);
		    			   }
			    		   iWillWaitToSee(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
				    	   driver.findElement(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")).click();  
		    		   }
		    	   }
		    	   else
		    	   {
		    		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
		    		   {
		    			   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
		    			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), location).build().perform();
		    			   while(!(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).getAttribute("value").equals(location)))
		    			   {
		    				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
		    				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), location).build().perform();
		    			   }
		    			   iWillWaitToSee(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
		    			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")));
		    		   }
		    		   else
		    		   {
		    			   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
			    		   driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
			    		   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), location);
			    		   while(!(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).getAttribute("value").equals(location)))
		    			   {
		    				   driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")).click();
		    				   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), location);
		    			   }
			    		   iWillWaitToSee(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
				    	   driver.findElement(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")).click(); 
		    		   }
		    	   }
		       }   
		   }
		   else if(locationList.contains("--"))
		   {
			   String token = locationList;
	    	   String location = token.substring(token.indexOf("--")+2, token.length());
	    	   String BPID = token.substring(0, token.indexOf("--"));
	    	   if(location.contains(BPID))
	    	   {
	    		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
	    		   {
	    			   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
	    			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), location).build().perform();
	    			   while(!(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).getAttribute("value").equals(location)))
	    			   {
	    				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
	    				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), location).build().perform();
	    			   }
	    			   iWillWaitToSee(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
	    			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")));
	    		   }
	    		   else
	    		   {
	    			   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
		    		   driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
		    		   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), location);
		    		   while(!(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).getAttribute("value").equals(location)))
	    			   {
	    				   driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")).click();
	    				   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), location);
	    			   }
		    		   iWillWaitToSee(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
			    	   driver.findElement(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")).click();  
	    		   }
	    	   }
	    	   else
	    	   {
	    		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
	    		   {
	    			   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
	    			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), location).build().perform();
	    			   while(!(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).getAttribute("value").equals(location)))
	    			   {
	    				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
	    				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), location).build().perform();
	    			   }
	    			   iWillWaitToSee(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
	    			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")));
	    		   }
	    		   else
	    		   {
	    			   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
		    		   driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
		    		   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), location);
		    		   while(!(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).getAttribute("value").equals(location)))
	    			   {
	    				   driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")).click();
	    				   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), location);
	    			   }
		    		   iWillWaitToSee(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]"));
			    	   driver.findElement(By.xpath("//th[contains(text(),\""+BPID+"\")]/../../following-sibling::tbody//label[contains(translate(text(),'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz'),\""+location.toLowerCase()+"\")]")).click();  
	    		   }
	    	   }
		   	}
		   else
		   {
			   if(DriverScript.Config.getProperty("Browser").equals("ie"))
    		   {
				   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
    			   new Actions(driver).sendKeys(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), locationList).build().perform();
    			   while(!(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).getAttribute("value").equals(locationList)))
    			   {
    				   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")));
    				   new Actions(driver).sendKeys(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), locationList).build().perform();
    			   }
    		   }
			   else
			   {
				   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']"))));
	    		   driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
	    		   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), locationList);
	    		   while(!(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")).getAttribute("value").equals(locationList)))
    			   {
    				   driver.findElement(By.xpath("//i[@class='remove link icon remove-icon']")).click();
    				   iFillInText(driver.findElement(By.xpath("//section[@class='component-remedy-facility-select']/div/div/input[@placeholder='Search']")), locationList);
    			   }
			   }
		   }
	   	}
	   	}
	   
   public void clickAddHealthSystemButton(String flag) throws Throwable {
       if(flag.equals("Yes"))
       {
    	   if(DriverScript.Config.getProperty("Browser").equals("ie"))
    	   {
    		   scrollIntoViewByJS(driver.findElement(By.xpath("//button[text()='Add Another Organization']")));
        	   iWillWaitToSee(By.xpath("//button[text()='Add Another Organization']"));
        	   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//button[text()='Add Another Organization']")));
    	   }
    	   else
    	   {
    		   scrollIntoViewByJS(driver.findElement(By.xpath("//button[text()='Add Another Organization']")));
        	   iWillWaitToSee(By.xpath("//button[text()='Add Another Organization']"));
        	   driver.findElement(By.xpath("//button[text()='Add Another Organization']")).click(); 
    	   }
       }
   }
   
   public void clickAddHealthSystemButtonForDownstremProvider(String flag) throws Throwable {
       if(flag.equals("Yes"))
       {
    	   scrollIntoViewByJS(driver.findElement(By.xpath("//button[text()='Add Model 3 Organization(s)']")));
    	   iWillWaitToSee(By.xpath("//button[text()='Add Model 3 Organization(s)']"));
    	   driver.findElement(By.xpath("//button[text()='Add Model 3 Organization(s)']")).click();
    	   longDelay();
       }
   }
   
   public void verifyDefaultProgramOrganization(String programName) throws Throwable {
	   
	   iWillWaitToSee(By.xpath("//span[text()='"+programName+"']"));
	   Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='"+programName+"']")));
   }
   
 
   
   public void searchLocation(String location) throws Throwable {
       iFillInText(driver.findElement(By.xpath("//input[@placeholder='Search']")), location);
   }
   public void selectLocation(String location) throws Throwable {
	   clickElement(driver.findElement(By.xpath("//label[text()='"+location+"']")));
   }
   
   public void clickGeneralInformationTab() throws Throwable {
       clickElement(driver.findElement(By.xpath("//a[text()='1. General Information']")));
   }
   public void verifyAvailabilityOrganizationDropDown() throws Throwable {
	   Assert.assertTrue(isElementPresentOnPage(By.xpath("")));
   }
   
   public void clickLogOutButton(String arg1) throws Throwable {
	   if(DriverScript.Config.getProperty("Browser").equals("ie"))
	   {
		   iWillWaitToSee(By.xpath("//span[text()='Log Out']"));
		   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='Log Out']")));  
	   }
	   else
	   {
		   iWillWaitToSee(By.xpath("//span[text()='Log Out']"));
	       clickElement(driver.findElement(By.xpath("//span[text()='Log Out']")));  
	   }
   }
   
   public void clickLogOutButtonAgain(String arg1) throws Throwable {
	   Thread.sleep(2000);
	   if(driver.findElements(By.xpath("//div[text()='Remedy Connect']")).size()>0)
	   {
		   if(DriverScript.Config.getProperty("Browser").equals("ie"))
		   {
			   iWillWaitToSee(By.xpath("//div[@class='ui dropdown menu-profile-btn']//i[@class='dropdown icon']"));
			   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//div[@class='ui dropdown menu-profile-btn']//i[@class='dropdown icon']")));
			      delay();
			      ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//span[text()='Log Out']")));
		   }
		   else
		   {
			   iWillWaitToSee(By.xpath("//div[@class='ui dropdown menu-profile-btn']//i[@class='dropdown icon']"));
			      driver.findElement(By.xpath("//div[@class='ui dropdown menu-profile-btn']//i[@class='dropdown icon']")).click();
			      delay();
			      driver.findElement(By.xpath("//span[text()='Log Out']")).click();  
		   }
	   }
   }
   
   public void verifyProductTiles(String products) throws Throwable {
	   StringTokenizer st = new StringTokenizer(products,",");
	   String token = null;
       while (st.hasMoreTokens()) {
    	   String newToken = st.nextToken().trim();
    	   if(newToken.equals("Remedy University"))
    	   {
    		   token = "RemedyU";
    	   }
    	   else if(newToken.equals("Administration"))
    	   {
    		   token = "Users";
    	   }
    	   else if(newToken.equals("Episode Connect for Post-acute Care"))
    	   {
    		   token = "Episodes Post Acute";
    	   }
    	   else if(newToken.equals("Episode Connect Classic"))
    	   {
    		   token = "Episodes Classic";
    	   }
    	   else
    	   {
    		   token = newToken;   
    	   }
    	   iWillWaitToSee(By.xpath("//div[text()='"+token.trim()+"']"));
    	   Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+token.trim()+"']")));
       } 
   }
   
   public void verifyProductTilesNotPresent(String products) throws Throwable {
	   StringTokenizer st = new StringTokenizer(products,",");
	   String token = null;
       while (st.hasMoreTokens()) 
       {
    	   String newToken = st.nextToken();
    	   if(newToken.equals("Remedy University"))
    	   {
    		   token = "RemedyU";
    	   }
    	   else if(newToken.equals("Administration"))
    	   {
    		   token = "Users";
    	   }
    	   else if(newToken.equals("Episode Connect for Post-acute Care"))
    	   {
    		   token = "Episodes Post Acute";
    	   }
    	   else if(newToken.equals("Episode Connect Classic"))
    	   {
    		   token = "Episodes Classic";
    	   }
    	   else
    	   {
    		   token = newToken;   
    	   }
    		Assert.assertFalse(isElementNotPresentOnPage(By.xpath("//div[text()='"+token.trim()+"']")));
       } 
   }
   
   public void verifyProductNotPresentOnAppTab(String products) throws Throwable {
	   StringTokenizer st = new StringTokenizer(products,",");
       while (st.hasMoreTokens()) 
       {
    	   String newToken = st.nextToken().trim();
    	   Assert.assertFalse(isElementNotPresentOnPage(By.xpath("//label[.='"+newToken+"']")));
       } 
   }
   
   public void clickAddAnotherOrganization() throws Throwable {
		clickElement(driver.findElement(By.xpath("//button[text()='Add Another Organization']")));
   }
   
   public void enterCharacterInLocationSearch(String text) throws Throwable {
	   if(!text.equalsIgnoreCase("All locations")){

		   iFillInText(driver.findElement(By.xpath("//div[@class='content active']//input[@placeholder='Search']")), text);
	   }
   }
   
   public void verifyTextPresentInLocationSearchLabel(String text) throws Throwable {
	   String Actual = driver.findElements(By.xpath("//section[@class='component-remedy-facility-select']//div[@class='ui checkbox']")).get(1).getText();
	   Assert.assertTrue(Actual.contains(text));
	   
   }
   
   public void shouldNotSeeFieldWithLabel(String text) throws Throwable {
	   boolean val = isElementPresentOnPage(By.xpath("//label[text()='All Location']"));
	   Assert.assertFalse(val);
   }
   
   public void iVerifyValueInProductDropDownMenu(String products) {
		iWillWaitToSee(By.xpath("//menu-dropdown[@class='flex-item order-0']//a[@class='btn btn-flyout-nav']"));
		StringTokenizer st = new StringTokenizer(products,",");
		String token = null;
		while (st.hasMoreTokens()) 
	       {
			String newToken = st.nextToken().trim();
			if(newToken.contains("Remedy University"))
	    	   {
	    		   token = "RemedyU";
	    	   }
	    	   else if(newToken.contains("Episode Connect Classic"))
	    	   {
	    		   token = "Episodes Classic";
	    	   }
	    	   else if(newToken.contains("Episode Connect for Post-acute Care"))
	    	   {
	    		   token = "Episodes Post Acute";
	    	   }
	    	   else if(newToken.contains("Administration"))
	    	   {
	    		   token = "Users";
	    	   }
	    	   else
	    	   {
	    		   token = newToken;   
	    	   }
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[text()='"+token.trim()+"']")));
	       } 
	}
   
   public void iVerifyValueIsNotPresentInProductDropDownMenu(String products) {
	   StringTokenizer st = new StringTokenizer(products,",");
	   String token = null;
	   List<WebElement> listItems = driver.findElements(By.xpath("//menu-dropdown[@class='flex-item order-0']//a[contains(@class,'btn btn-flyout-nav')]"));
	   while (st.hasMoreTokens())
	   {
		   String newToken = st.nextToken();
		   if(newToken.contains("Remedy University"))
    	   {
    		   token = "RemedyU";
    	   }
    	   else if(newToken.contains("Episode Connect Classic"))
    	   {
    		   token = "Episodes Classic";
    	   }
    	   else if(newToken.contains("Episode Connect for Post-acute Care"))
    	   {
    		   token = "Episodes Post Acute";
    	   }
    	   else if(newToken.contains("Administration"))
    	   {
    		   token = "Users";
    	   }
    	   else
    	   {
    		   token = newToken;   
    	   }
		   for (WebElement item : listItems) {
	            Assert.assertFalse(item.getText().trim().equalsIgnoreCase(token.trim()));
	        } 
	   }
	}
   
   public void iRedirectToRemedyConnectPage() {
		driver.get(DriverScript.Config.getProperty("BaseUrl"));
		delay();
	}
   
   public void iVerifyDropDownValueFromProfileIcon(String text, String role) {
		if(text.equals("Internal Support"))
		{
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Internal Support']")));
			delay();
		}
		else if(text.equals("Support"))
		{
			String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
			StringTokenizer st = new StringTokenizer(application, ",");
			while(st.hasMoreTokens())
			{
				String a = st.nextToken().trim();
				if(a.equals("Episode Connect Classic") || a.equals("Episode Connect for Post-acute Care"))
				{
					Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Support']")));
					delay();
				}
			}
		}
		else if(text.equals("Reset Password"))
		{
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Reset Password']")));
			delay();
		}
		else if(text.equals("Log Out"))
		{
			Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Log Out']")));
			delay();
		}
 	}
   
   public void iClickOnFiledInDropdownOnProfileIcon(String text, String role) {
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
		if(application.contains("Episode Connect Classic"))
		{
			if(!(role.substring((role.indexOf("-")+1)).equals("Remedy Sales Team") || role.substring((role.indexOf("-")+1)).equals("Prospective Partner Executive")))
			   {
					  driver.findElement(By.xpath("//span[text()='Support']")).click();
				      delay();
				      try
						{
							if(DriverScript.Config.getProperty("Browser").equals("chrome"))
							{
								Thread.sleep(5000);
								String parentWindow = driver.getWindowHandle();
								Set<String> handles = driver.getWindowHandles();
								if(!((String)handles.toArray()[handles.size()-1]).equals(parentWindow))
								{
									driver.switchTo().window((String)handles.toArray()[handles.size()-1]);
								}
							}
							else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
							{
								Thread.sleep(5000);
								String parentWindow = driver.getWindowHandle();
								Set<String> handles = driver.getWindowHandles();
								Object[] array = handles.toArray();
								Arrays.sort(array);
								System.out.println("Windows : "+Arrays.toString(array));
								if(!(array[array.length-1].toString().equals(parentWindow)))
								{
									driver.switchTo().window(array[array.length-1].toString());
									new WebDriverWait(driver, 180).until(
									          webDriver -> ((JavascriptExecutor) webDriver).executeScript("return document.readyState").equals("complete"));
									System.out.println("Hello : "+driver.getTitle());
									System.out.println("After Switching Window Handle : "+driver.getWindowHandle());
								}
							}
							else if(DriverScript.Config.getProperty("Browser").equals("ie"))
							{
								parentWindow = driver.getWindowHandle();
								if(driver.getWindowHandles().size()==2)
								{
									handles = driver.getWindowHandles();
									handles.remove(parentWindow);
									driver.switchTo().window((String)handles.toArray()[0]);
								}
								else if(driver.getWindowHandles().size()>2)
								{
									Set<String> newHandles = driver.getWindowHandles();
									newHandles.removeAll(handles);
									driver.switchTo().window((String)newHandles.toArray()[0]);
								}
								handles=driver.getWindowHandles();
								driver.manage().window().maximize();
								Thread.sleep(3000);
							}
						}
						catch(Exception e)
						{
							System.out.println(e.toString());
						}
			   }
		}
	}
   
   public void iVerifyPageHeaderForPageOnRemedyConnect(String title, String role ) throws InterruptedException {
	   String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
	   StringTokenizer st = new StringTokenizer(application, ",");
	   while(st.hasMoreTokens())
	   {
		   String a = st.nextToken().trim();
		   if(a.equals("Episode Connect Classic") || a.equals("Episode Connect for Post-acute Care"))
			{
				try
				   {
					iWillWaitToSee(By.xpath("//h1[text()='Login']"));
					Assert.assertTrue(isElementPresentOnPage(By.xpath("//h1[text()='Login']")));
					delay();
					try
			    	{
			    		if(DriverScript.Config.getProperty("Browser").equals("chrome"))
			    		{
			    			String parentWindow = driver.getWindowHandle();
			                Set<String> handles = driver.getWindowHandles();
			                if(!((String)handles.toArray()[0]).equals(parentWindow))
			    			{
			    				driver.switchTo().window((String)handles.toArray()[0]);
			    			}
			                delay();
			    		}
			    		else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
			    		{
			    			String parentWindow = driver.getWindowHandle();
			                Set<String> handles = driver.getWindowHandles();
			                Object[] array = handles.toArray();
							Arrays.sort(array);
			                if(!(array[0].toString().equals(parentWindow)))
			    			{
			    				driver.switchTo().window(array[0].toString());
			    			}
			                delay();
			    		}
			    		else if(DriverScript.Config.getProperty("Browser").equals("ie"))
			    		{
			    			driver.switchTo().window(parentWindow);
			    		}
			    	}
			    	catch(Exception e)
			    	{
			    		System.out.println(e.toString());
			    	}
				   }	
				   catch(Exception e)
				   {
					   try
				    	{
				    		if(DriverScript.Config.getProperty("Browser").equals("chrome"))
				    		{
				    			String parentWindow = driver.getWindowHandle();
				                Set<String> handles = driver.getWindowHandles();
				                if(!((String)handles.toArray()[0]).equals(parentWindow))
				    			{
				    				driver.switchTo().window((String)handles.toArray()[0]);
				    			}
				                delay();
				    		}
				    		else if(DriverScript.Config.getProperty("Browser").equals("firefox"))
				    		{
				    			String parentWindow = driver.getWindowHandle();
				                Set<String> handles = driver.getWindowHandles();
				                Object[] array = handles.toArray();
								Arrays.sort(array);
				                if(!(array[0].toString().equals(parentWindow)))
				    			{
				    				driver.switchTo().window(array[0].toString());
				    			}
				                delay();
				    		}
				    		else if(DriverScript.Config.getProperty("Browser").equals("ie"))
				    		{
				    			driver.switchTo().window(parentWindow);
				    		}
				    	}
				    	catch(Exception e1)
				    	{
				    		System.out.println(e1.toString());
				    	}
				   }
			}  
	   }
	}
   
   public void iVerifyNoResultsFoundUnderLearningPathWaySearch() throws InterruptedException {
		Thread.sleep(3000);
	   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.cssSelector(".message.empty>div"))));
		String actual = getTextForElement(driver.findElement(By.cssSelector(".message.empty>div")));
		Assert.assertEquals("No results found.",actual.trim());
	}
   
	 public void iclickontheReportsTilewithtextforuser(String text, String role) throws Throwable 
	 {
		 String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
		 StringTokenizer st = new StringTokenizer(application, ",");
		   while(st.hasMoreTokens())
		   {
			   if(st.nextToken().trim().equals("Reporting Classic"))
			   {
				   iWillWaitToSee(By.xpath("//label[@class='dropdown-tile-label ng-binding'][text()='"+text+"']"));
				   selectElementByDesc(".dropdown-tile-label.ng-binding", text);
				   delay();
			   }
		   }
	 }

	 public void iclickonreporttextforOverallProgramReportsforuser(String text, String role) throws Throwable {
		 String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
		   StringTokenizer st = new StringTokenizer(application, ",");
		   while(st.hasMoreTokens())
		   {
			   if(st.nextToken().trim().equals("Reporting Classic"))
			   {
				   if(DriverScript.Config.getProperty("Browser").equals("ie"))
				   {
					   ((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//a[text()=\""+text+"\"]")));
				   }
				   else
				   {
					   driver.findElement(By.xpath("//a[text()=\""+text+"\"]")).click(); 
					   longDelay();  
				   }
				   
			   }
		   }
	 }

	 public void iclickonfieldpaneliconbuttonforuser(String role) throws Throwable {
		 String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
		   StringTokenizer st = new StringTokenizer(application, ",");
		   while(st.hasMoreTokens())
		   {
			   if(st.nextToken().trim().equals("Reporting Classic"))
			   {
				   iWillWaitToSee(By.xpath(".//div[@class='field-panel-icon']"));
				   clickElement(driver.findElement(By.xpath(".//div[@class='field-panel-icon']")));
			   }
		   }
	 }
	 
	 public void iclicktofieldfilterunderfilterfieldforuser(String filterField, String filterTitle, String role) throws Throwable {
		 String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
		   StringTokenizer st = new StringTokenizer(application, ",");
		   while(st.hasMoreTokens())
		   {
			   if(st.nextToken().trim().equals("Reporting Classic"))
			   {
				   iWillWaitToSee(By.xpath(".//*[@id='fieldListTreeContent']//div[@formula='["+filterTitle+"].["+filterField+"]']"));
				   clickElement(driver.findElement(By.xpath(".//*[@id='fieldListTreeContent']//div[@formula='["+filterTitle+"].["+filterField+"]']")));
				   iWillWaitToSee(By.xpath(".//*[@id='fieldListTreeContent']//div[@formula='["+filterTitle+"].["+filterField+"]']/div"));
				   clickElement(driver.findElement(By.xpath(".//*[@id='fieldListTreeContent']//div[@formula='["+filterTitle+"].["+filterField+"]']/div")));
			   }
		   }
	 }

	 public void ichooseoptionfromselectoptionsoffilterfieldforuser(String toLocator, String role) throws Throwable {
		 String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
		   StringTokenizer st = new StringTokenizer(application, ",");
		   while(st.hasMoreTokens())
		   {
			   if(st.nextToken().trim().equals("Reporting Classic"))
			   {
				   clickElement(driver.findElement(By.xpath(toLocator)));
			   }
		   }
	 }

	 public void ishouldseeinthefiltervaluelistforuser(String text, String role) throws Throwable {
		 String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
		   StringTokenizer st = new StringTokenizer(application, ",");
		   while(st.hasMoreTokens())
		   {
			   if(st.nextToken().trim().equals("Reporting Classic"))
			   {
				   if(text.contains(","))
				   {
					   StringTokenizer st1 = new StringTokenizer(text, ",");
					   while(st1.hasMoreTokens())
					   {
						   verifyTextForElement(driver.findElement(By.xpath("//*[@id='dialogTitleBar']/table/tbody/tr/td[1]")), "Filter on BPID");
						   iWillWaitToSee(By.xpath("//div[@id[starts-with(.,'FT_AVA_')]]"));
						   verifyTextForElementfromList("#FT_valueList div", st1.nextToken().trim());
					   }
				   }
				   else
				   {
					   verifyTextForElement(driver.findElement(By.xpath("//*[@id='dialogTitleBar']/table/tbody/tr/td[1]")), "Filter on BPID");
					   iWillWaitToSee(By.xpath("//div[@id[starts-with(.,'FT_AVA_')]]"));
					   verifyTextForElementfromList("#FT_valueList div", text);  
				   }
			   }
		   }
	 }

	 public void iclickoncancelbuttonfromfilterforuser(String role) throws Throwable {
		 String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
		   StringTokenizer st = new StringTokenizer(application, ",");
		   while(st.hasMoreTokens())
		   {
			   if(st.nextToken().trim().equals("Reporting Classic"))
			   {
				   iWillWaitToSee(By.id("dlgBtnCancel"));
				   clickElement(driver.findElement(By.id("dlgBtnCancel")));
			   }
		   }
	 }
	 
	 public void iclickOnReportButton(String role) throws Throwable {
		 String application = CreateUserPage.usersApplicationsPerRole.get(role).get(role.substring((role.indexOf("-")+1)));
		   StringTokenizer st = new StringTokenizer(application, ",");
		   while(st.hasMoreTokens())
		   {
			   if(st.nextToken().trim().equals("Reporting Classic"))
			   {
				   iWillWaitToSee(By.xpath("//div[@class='flex-item order-2 btn logo valentino-icon-reports']"));
				   clickElement(driver.findElement(By.xpath("//div[@class='flex-item order-2 btn logo valentino-icon-reports']")));
			   }
		   }
	 }
	 
	 public void clickCrossButton() throws Throwable {
		 driver.findElement(By.xpath("//*[name()='svg' and @fill='#48677b']//*[name()='g' and @id='iCons']")).click();
	 }
	 
	 public void removeAlreadySelectedRole() throws Throwable {
		 driver.findElement(By.xpath("//i[@class='close icon']")).click();
	 }
	 public void iVerifyTheLocationsAreNotPresentInSelectLocationsSection (String text){
		 longDelay();
		 if(!(text.isEmpty())){
			 if(isElementPresentOnPage(By.xpath("//h5[text()='Selected Locations:']"))==true){
		 if(text.contains(",")){
			 StringTokenizer st = new StringTokenizer(text, ",");
			   while(st.hasMoreTokens())
			   {
				   Assert.assertFalse(isElementPresentOnPage(By.xpath("//h5[text()='Selected Locations:']/..//td[contains(text(),\""+st.nextToken().trim()+"\")]")));
				  
		 }}
		 else{

		 	Assert.assertFalse(isElementPresentOnPage(By.xpath("//h5[text()='Selected Locations:']/..//td[contains(text(),\""+text+"\")]")));
	 } 
	 }
		 }
	 }
	 public void iVerifyTheSelectedLocationsInTheSelectLocationsSection(String text){
		 if(text.contains(",")){
			 StringTokenizer st = new StringTokenizer(text, ",");
			   while(st.hasMoreTokens())
			   {
				   waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//h5[text()='Selected Locations:']/..//td[contains(text(),\""+st.nextToken().trim()+"\")]"))));
				 	Assert.assertTrue(isElementPresentOnPage(By.xpath("//h5[text()='Selected Locations:']/..//td[contains(text(),\""+st.nextToken().trim()+"\")]")));   
		 }}
		 else{
		 	waitTo().until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//h5[text()='Selected Locations:']/..//td[contains(text(),\""+text+"\")]"))));
		 	Assert.assertTrue(isElementPresentOnPage(By.xpath("//h5[text()='Selected Locations:']/..//td[contains(text(),\""+text+"\")]")));
	 }
	 }
	 public void iSearchTheSelectedLocationsInTheSelectLocationsSection(String locationList){
		 iFillInText(driver.findElement(By.xpath("//*[text()='Selected Locations:']//following::input")), locationList);
		 Assert.assertTrue(isElementPresent(By.xpath("//*[text()='Selected Locations:']//following::input")));
	 }
	 
	 public void iClickOnRemoveLinkIconforSelectedLocationsSelectLocationsSection(){
		 iWillWaitToSee(By.cssSelector(".remove.link.icon"));
		 clickElement(driver.findElement(By.cssSelector(".remove.link.icon")));
	 }
	 
	 public void iVerifySelectedLocationsSectionAfterClickOnRemoveLinkIcon(){
		 Assert.assertTrue(isElementNotPresentOnPage(By.xpath("//*[text()='Selected Locations:']")));
	 }
	 
	 public void iVerifyTextonpopupWindowAfterClickonRemovelinkIcon(){
		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//span[text()='Are you sure you want to remove']")));
	 }
	 
	 public void iClickonCancelLinkPopUpWindow(String text){
		 clickElement(driver.findElement(By.xpath("//div[@class='actions']//a[text()='Cancel']")));
	 }
	 
	 public void iClickonRemoveButtonPopUpWindow(String text){
		 clickElement(driver.findElement(By.xpath("//div[@class='actions']//button[text()='Remove']")));
	 }
	 
	 public void iVerifyPagetextOnLandingPage(String text){
		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='paginator-text']/div[text()='"+text+"']/../div[contains(text(),'of ')]")));
	 }
	 
	 public void iClickonArrowButtonsonLandingPage(String text){
		 iWillWaitToSee(By.xpath("//div[@class='single-chevron']//i[@class='"+text+"']"));
		 clickElement(driver.findElement(By.xpath("//div[@class='single-chevron']//i[@class='"+text+"']")));
		 longDelay();
	 }

	 public void iEnterExistingNPI(String userRole){	
	String npi=CreateUserPage.usersNPIPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim());
	iWillWaitToSee(By.xpath("//input[@placeholder='NPI']"));
	driver.findElement(By.xpath("//input[@placeholder='NPI']")).sendKeys(Keys.CONTROL,"a",Keys.DELETE);
	iFillInText(driver.findElement(By.xpath("//input[@placeholder='NPI']")),npi);
	 }
	 public void duplicateNPIMsg(String text){
		 iWillWaitToSee(By.cssSelector("div.ui.text.loader"));
		 Assert.assertTrue(driver.findElement(By.cssSelector("div.ui.text.loader")).getAttribute("innerText").contains(text));
	 }
	 public void iEnterExistingEmail(String userRole){
		 String email=CreateUserPage.usersEmailPerRole.get(userRole).get(userRole.substring((userRole.indexOf("-")+1)).trim());
		 iWillWaitToSee(By.xpath("//input[@placeholder='Email']"));
			driver.findElement(By.xpath("//input[@placeholder='Email']")).sendKeys(email);
	 }
 public void iVerifyAllLocationsPresence(String text) {
	 delay();
	Assert.assertFalse(driver.findElements(By.cssSelector("tr.component-bpid-row")).get(0).getAttribute("innerText").toString().contains(text));
	 }
 public void iNavigateToNextLocationsPage(String text){
	 if(text.equals("creating")){
	 isElementVisible(driver.findElement(By.xpath("//div[@class='content']//div[@class='single-chevron']/i[@class='icon chevron right']")));
	 clickElement(driver.findElement(By.xpath("//div[@class='content']//div[@class='single-chevron']/i[@class='icon chevron right']")));
	 }
	 else{
		 isElementVisible(driver.findElement(By.cssSelector(".icon.chevron.right")));
		 clickElement(driver.findElement(By.cssSelector(".icon.chevron.right")));
		 
	 }
		 
 }
 public void iShouldNotSeeAnyErrorMessageForDPLocations(){
	 iWillWaitToSee(By.xpath("//tr[@class='component-bpid-row']"));
	 Assert.assertTrue(driver.findElements(By.xpath("//tr[@class='component-bpid-row']")).size()>0);
 }
 public void validateErrorMsg(String text){
	 Assert.assertFalse(isElementPresentOnPage(By.xpath("//*[contains(text(),'"+text+"')]")));
 }
 public void iSelectCreatedUser() throws InterruptedException{
	 iWillWaitToSee(By.xpath("//tr[@class='component-user-table-row']"));
		clickElement(driver.findElement(By.xpath("//tr[@class='component-user-table-row']")));
		Thread.sleep(3000);
 }
 public void iVerifyRolesAsPerUser(String user){
	 if(user.equalsIgnoreCase("Super Admin")){
		Assert.assertTrue(driver.findElements(By.xpath("//div[@class='scrolling menu transition']/div[@class='item']/span")).size()>=10);
	 }
	 else if (user.equalsIgnoreCase("PTA")){
		 String text;
		 
		 int size =driver.findElements(By.xpath("//span[@class='dropDownOptionValue']")).size();
		 Assert.assertTrue(size==4);
		 for(int i=0;i<size;i++){
			text=driver.findElements(By.xpath("//span[@class='dropDownOptionValue']")).get(i).getAttribute("outerText").toString().trim();
			 Assert.assertTrue(text.contains("Leader")|| text.contains("Manager") || text.contains("Advanced Operator") ||text.contains("Operator"));
		
	 }
		 
	 }
 }
 public void enterTextLearningPathwaySearchBox(String searchParam) throws Throwable {
     if(!(searchParam.equals("")))
     {
  	   iFillInText(driver.findElement(By.xpath("//div[@class='select-checkbox-dropdown-menu menu']//input[@placeholder='Search']")), searchParam);  
     }
 }
}