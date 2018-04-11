package com.remedy.userAdmin;

import com.remedy.baseClass.BaseClass;

import junit.framework.Assert;

import java.util.HashMap;

import org.apache.commons.lang3.RandomStringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.LocalFileDetector;
import org.openqa.selenium.remote.RemoteWebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;


/**
 * Created by salam on 10/30/16.
 */
public class BulkUserCreationPage extends BaseClass{
	public static HashMap<String,HashMap<String,String>> bulkUsersEmailPerRole=new HashMap<String,HashMap<String,String>>();
    public BulkUserCreationPage (WebDriver driver ){
        super( driver);

    }


    public void iUplaodFile(){


        String filepath =  (System.getProperty("user.dir") + "/src/test/java/com/remedy/resources/bulkUserCreation.txt");
        WebElement elem = driver.findElement(By.cssSelector(".button-import>button"));
        elem.sendKeys(filepath);


    }

    public void iVerifySuccssfulUserCreationMessage(String text){

        verifyTextForElement(driver.findElement(By.xpath("//div[5]/div/div/div/div[2]/div/div[2]/div/span[2]")), text);
    }

    public void clickImportButton (){
    	iWillWaitToSee(By.xpath("//div[@class='ui positive right floated buttons add-user-button']/div[@role='listbox']"));
    	clickElement(driver.findElement(By.xpath("//div[@class='ui positive right floated buttons add-user-button']/div[@role='listbox']")));
        iWillWaitToSee(By.xpath("//div[@class='ui positive right floated buttons add-user-button']//span[text()='Import Users']"));
        clickElement(driver.findElement(By.xpath("//div[@class='ui positive right floated buttons add-user-button']//span[text()='Import Users']")));
    }
    
    public void clickTryAgain()
    {
    	iWillWaitToSee(By.xpath("//button[text()='Try Again']"));
    	clickElement(driver.findElement(By.xpath("//button[text()='Try Again']")));
    }

    public void enterData()
    {
    	String strUserData = "ExecutiveFirstName | ExecutiveLastName | EXECUTIVEMAIL | | Executive | NA | 776109:2070-005:HUMC,441364:3056-k60:365973,441364:3056-k61:365860,439241:2070-a07:ALL_FACILITIES,439241:3056-a53:ALL_FACILITIES | | | False | True | False | True | False |  |  | | False"
+"\nManagerFirstName | ManagerLastName | MANAGERMAIL | 9876545678 | Manager | NA | 809047:2053-000:450058-1,809047:2053-000:450058-2,809047:2053-000:450058,626076:3056-x52:315182,439245:2070-a12:160047,439245:2070-a12:280129,439245:2070-a12:280003,439245:2070-a12:280040,439245:3056-a58:160028,439245:3056-a58:280133 | | | False | False | False | True | False |  | False | | False"
+"\nCaseManagerFirstName | CaseManagerLastName | CASEMGRMAIL |9879800980 | Case Manager | NA | 776109:2070-005:HUMC,626076:3056-x52:315182, | | | False | False | False | False | True |  | False | | False"
+"\nPhysiciansFirstName | PhysiciansLastName | PHYSICIANSMAIL | | Physicians | NPI | 776109:2070-005:HUMC,809047:2053-000:450058-1,809047:2053-000:450058-2,809047:2053-000:450058 | | | False | True | False | False | False |  |  | | True"
+"\nRTCSFirstName | RTCSLastName | RTCSMAIL | 5465465655| Remedy TCS | NA | 809047:2053-000:450058-1,809047:2053-000:450058-2,809047:2053-000:450058,441364:3056-k60:365973,441364:3056-k61:365860 | | | False | True | True | False | False | True | False | |False" 
+"\nRLPNFirstName | RLPNLastName | RLPNMAIL | 9898989898| Remedy LPN | NA | 439180:3056-370:525441 | | | False | False | True | True | True | False | False | | False"
+"\nRRNFirstName | RRNLastName | RRNMAIL | 9878909878| Remedy RN | NA | 441444:2070-g15:ALL_FACILITIES,441444:3056-q91:441310,441444:3056-q91:181318 || | False | False | False | True | True | True | False | | False"
+"\nRFRNFirstName | RFRNLastName | RFRNMAIL | | Remedy Field RN | NA | 441321:2070-c80:190064,441321:2070-c80:190065,441321:2070-c80:190266,441321:2070-c80:300003,441321:3056-c86:ALL_FACILITIES | | | False | False | False | True | False | True | False | | False"
+"\nRPMFirstName | RPMLastName | RPMMAIL | | Remedy PM | NA | 439241:2070-a07:ALL_FACILITIES,439241:3056-a53:100062,439241:3056-a53:100113,439241:3056-a53:100122,439241:3056-a53:100209 | | | False | True | False | False | False | True | False | | False"
+"\nRSTFirstName | RSTLastName | RSTMAIL | 8989898787| Remedy Sales Team | NA | 439245:2070-a12:160047,439245:2070-a12:280129,439245:2070-a12:280003,439245:2070-a12:280040,439245:3056-a58:160028,439245:3056-a58:280133 | | | False | False | False | False | True | False | False | | False"
+"\nREFirstName | RELastName | REMAIL | | Remedy Executive | NA | 514022:ALL_BPIDS:ALL_FACILITIES | | | False | True | True | False | False | False | False | | False"
+"\nPPEFirstName | PPELastName | PPEMAIL | | Prospective Partner Executive | NA | 441447:ALL_BPIDS:ALL_FACILITIES | | | False | False | False | True | False | False | False | | False"
+"\nROFirstName | ROLastName | ROMAIL | 7676878998| Remedy Other | NA | 441364:3056-k60:365973,441364:3056-k61:365860 | | | False | True | False | False | False | False | False | | False"
+"\nPPAFirstName | PPALastName | PPAMAIL | | Partner Program Administrator | NA | 809047:2053-000:450058-1,809047:2053-000:450058-2,809047:2053-000:450058 | | | False | True | False | False | False | False | False | | True"
+"\nRPAFirstName | RPALastName | RPAMAIL | 9877766666| Remedy Program Administrator | NA | 626076:3056-x52:315182 | | | False | False | True | False | False | True | False | | False"
+"\nPTAFirstName | PTALastName | PTAMAIL | | Partner Technical Administrator | NA | 776109:2070-005:HUMC | | | False | False | False | True | False | False | True | | False"
+"\nRTAFirstName | RTALastName | RTAMAIL | 3456765432| Remedy Technical Administrator | NA | 441372:3056-m78:385072 | | | False | False | False | False | False | True | True | | True"
+"\nTCMFirstName | TCMLastName | TCMMAIL | | Transitional Case Manager | NA | 441324:6005-080:490005-1 | | | False | False | False | True | False | False | False | | False"
+"\nDPFirstName | DPLastName | DPMAIL | 9998887770| Downstream Provider | NA | 555469 | | | False | True | False | False | False | False | False | | False";
    	
    	String randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("EXECUTIVEMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	HashMap<String,String> bulkEmailPerRole=new HashMap<String,String>();
    	HashMap<String,String> applicationsList = new HashMap<String,String>();
    	applicationsList.put("Executive", "Episodes, Lessons, TCI");
    	bulkEmailPerRole.put("Executive", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Executive", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("MANAGERMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Manager", "Lessons, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Manager", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("CASEMGRMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Case Manager", "Reports, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Case Manager", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Case Manager", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("PHYSICIANSMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Physicians", "Episodes, Physician Connect, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Physicians", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("RTCSMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy TCS", "Episodes, Episodes 2.0, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy TCS", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("RLPNMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy LPN", "Episodes 2.0, Reports, Lessons, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy LPN", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy LPN", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("RRNMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy RN", "Reports, TCI, Lessons");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy RN", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy RN", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("RFRNMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy Field RN", "TCI, Lessons");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy Field RN", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Field RN", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("RPMMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy PM", "Episodes, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy PM", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy PM", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("RSTMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy Sales Team", "Reports, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy Sales Team", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Sales Team", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("REMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy Executive", "Episodes, Episodes 2.0, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy Executive", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Executive", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("PPEMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Prospective Partner Executive", "Lessons, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Prospective Partner Executive", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Prospective Partner Executive", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("ROMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy Other", "Episodes, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy Other", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Other", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("PPAMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Partner Program Administrator", "Episodes, Physician Connect, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Partner Program Administrator", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Program Administrator", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("RPAMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy Program Administrator", "Episodes 2.0, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy Program Administrator", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Program Administrator", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("PTAMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Partner Technical Administrator", "Administration, Lessons, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Partner Technical Administrator", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Technical Administrator", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("RTAMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy Technical Administrator", "Physician Connect, Administration, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy Technical Administrator", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Technical Administrator", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("TCMMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Transitional Case Manager", "Lessons, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Transitional Case Manager", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Transitional Case Manager", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Transitional Case Manager", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Transitional Case Manager", bulkEmailPerRole);
    	
    	randomString = RandomStringUtils.randomAlphabetic(8);
    	strUserData = strUserData.replace("DPMAIL", "test.automatemail+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Downstream Provider", "Episodes, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();    	
    	bulkEmailPerRole.put("Downstream Provider", "test.automatemail+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
    	CreateUserPage.usersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
    	
    	String randomNPI = RandomStringUtils.randomNumeric(10);
    	strUserData = strUserData.replace("NPI", randomNPI);
    	iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
    	iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
    }

    public void clickSubmit()
    {
    	iWillWaitToSee(By.xpath("//button[text()='Submit']"));
    	clickElement(driver.findElement(By.xpath("//button[text()='Submit']")));
    }
    
    public void verifySuccessfulMessage(String text)
    {
    	iWillWaitToSee(By.xpath("//div[@class='ui text loader']"));
    	waitTo().until(ExpectedConditions.invisibilityOf(driver.findElement(By.xpath("//div[@class='ui text loader']"))));
    	Assert.assertTrue(isElementPresentOnPage(By.xpath("//p[@class='successCountLabel'][text()='"+text+"']")));
    }
}
