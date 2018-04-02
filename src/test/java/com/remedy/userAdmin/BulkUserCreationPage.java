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
    	iWillWaitToSee(By.xpath("//div[@class='ui green right floated buttons add-user-button']/div[@role='listbox']"));
    	clickElement(driver.findElement(By.xpath("//div[@class='ui green right floated buttons add-user-button']/div[@role='listbox']")));
        iWillWaitToSee(By.xpath("//div[@class='ui green right floated buttons add-user-button']//span[text()='Import Users']"));
        clickElement(driver.findElement(By.xpath("//div[@class='ui green right floated buttons add-user-button']//span[text()='Import Users']")));
    }
    
    public void clickTryAgain()
    {
    	iWillWaitToSee(By.xpath("//button[text()='Try Again']"));
    	clickElement(driver.findElement(By.xpath("//button[text()='Try Again']")));
    }

    public void enterData()
    {
    	String strUserData = "ExecutiveFirstName | ExecutiveLastName | test.automatemail.executive@gmail.com | | Executive | NA | 776109:2070-005:HUMC,441364:3056-k60:365973,441364:3056-k61:365860,439241:2070-a07:ALL_FACILITIES,439241:3056-a53:ALL_FACILITIES | | | False | True | False | True | False |  |  | | False"
+"\nManagerFirstName | ManagerLastName | test.automatemail.manager@gmail.com | 9876545678 | Manager | NA | 809047:2053-000:450058-1,809047:2053-000:450058-2,809047:2053-000:450058,626076:3056-x52:315182,439245:2070-a12:160047,439245:2070-a12:280129,439245:2070-a12:280003,439245:2070-a12:280040,439245:3056-a58:160028,439245:3056-a58:280133 | | | False | False | False | True | False |  | False | | False"
+"\nCaseManagerFirstName | CaseManagerLastName | test.automatemail.casemanager@gmail.com |9879800980 | Case Manager | NA | 776109:2070-005:HUMC,626076:3056-x52:315182, | | | False | False | False | False | True |  | False | | False"
+"\nPhysiciansFirstName | PhysiciansLastName | test.automatemail.phys@gmail.com | | Physicians | NPI | 776109:2070-005:HUMC,809047:2053-000:450058-1,809047:2053-000:450058-2,809047:2053-000:450058 | | | False | True | False | False | False |  |  | | True"
+"\nRTCSFirstName | RTCSLastName | test.automatemail.rtcs@gmail.com | 5465465655| Remedy TCS | NA | 809047:2053-000:450058-1,809047:2053-000:450058-2,809047:2053-000:450058,441364:3056-k60:365973,441364:3056-k61:365860 | | | False | True | True | False | False | True | False | |False" 
+"\nRLPNFirstName | RLPNLastName | test.automatemail.rlpn@gmail.com | 9898989898| Remedy LPN | NA | 439180:3056-370:525441 | | | False | False | True | True | True | False | False | | False"
+"\nRRNFirstName | RRNLastName | test.automatemail.rrn@gmail.com | 9878909878| Remedy RN | NA | 441444:2070-g15:ALL_FACILITIES,441444:3056-q91:441310,441444:3056-q91:181318 || | False | False | False | True | True | True | False | | False"
+"\nRFRNFirstName | RFRNLastName | test.automatemail.rfrn@gmail.com | | Remedy Field RN | NA | 441321:2070-c80:190064,441321:2070-c80:190065,441321:2070-c80:190266,441321:2070-c80:300003,441321:3056-c86:ALL_FACILITIES | | | False | False | False | True | False | True | False | | False"
+"\nRPMFirstName | RPMLastName | test.automatemail.remedypm@gmail.com | | Remedy PM | NA | 439241:2070-a07:ALL_FACILITIES,439241:3056-a53:100062,439241:3056-a53:100113,439241:3056-a53:100122,439241:3056-a53:100209 | | | False | True | False | False | False | True | False | | False"
+"\nRSTFirstName | RSTLastName | test.automatemail.rst@gmail.com | 8989898787| Remedy Sales Team | NA | 439245:2070-a12:160047,439245:2070-a12:280129,439245:2070-a12:280003,439245:2070-a12:280040,439245:3056-a58:160028,439245:3056-a58:280133 | | | False | False | False | False | True | False | False | | False"
+"\nREFirstName | RELastName | test.automatemail.re@gmail.com | | Remedy Executive | NA | 514022:ALL_BPIDS:ALL_FACILITIES | | | False | True | True | False | False | False | False | | False"
+"\nPPEFirstName | PPELastName | test.automatemail.ppe@gmail.com | | Prospective Partner Executive | NA | 441447:ALL_BPIDS:ALL_FACILITIES | | | False | False | False | True | False | False | False | | False"
+"\nROFirstName | ROLastName | test.automatemail.ro@gmail.com | 7676878998| Remedy Other | NA | 441364:3056-k60:365973,441364:3056-k61:365860 | | | False | True | False | False | False | False | False | | False"
+"\nPPAFirstName | PPALastName | test.automatemail.ppa@gmail.com | | Partner Program Administrator | NA | 809047:2053-000:450058-1,809047:2053-000:450058-2,809047:2053-000:450058 | | | False | True | False | False | False | False | False | | True"
+"\nRPAFirstName | RPALastName | test.automatemail.rpa@gmail.com | 9877766666| Remedy Program Administrator | NA | 626076:3056-x52:315182 | | | False | False | True | False | False | True | False | | False"
+"\nPTAFirstName | PTALastName | test.automatemail.pta@gmail.com | | Partner Technical Administrator | NA | 776109:2070-005:HUMC | | | False | False | False | True | False | False | True | | False"
+"\nRTAFirstName | RTALastName | test.automatemail.rta@gmail.com | 3456765432| Remedy Technical Administrator | NA | 441372:3056-m78:385072 | | | False | False | False | False | False | True | True | | True"
+"\nTCMFirstName | TCMLastName | test.automatemail.tcm@gmail.com | | Transitional Case Manager | NA | 441324:6005-080:490005-1 | | | False | False | False | True | False | False | False | | False"
+"\nDPFirstName | DPLastName | test.automatemail.dp@gmail.com | 9998887770| Downstream Provider | NA | 555469 | | | False | True | False | False | False | False | False | | False";
    	
    	String randomString = RandomStringUtils.randomAlphabetic(8);
    	String randomNPI = RandomStringUtils.randomNumeric(10);
    	strUserData = strUserData.replace("test.automatemail.executive@gmail.com", "test.automatemail.executive+"+randomString+"@gmail.com");
    	HashMap<String,String> bulkEmailPerRole=new HashMap<String,String>();
    	HashMap<String,String> applicationsList = new HashMap<String,String>();
    	applicationsList.put("Executive", "Episodes, Lessons, TCI");
    	bulkEmailPerRole.put("Executive", "test.automatemail.executive+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Executive", applicationsList);
    	strUserData = strUserData.replace("test.automatemail.manager@gmail.com", "test.automatemail.manager+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Manager", "Lessons, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Manager", "test.automatemail.manager+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
    	strUserData = strUserData.replace("test.automatemail.casemanager@gmail.com", "test.automatemail.casemanager+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Case Manager", "Reports, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Case Manager", "test.automatemail.casemanager+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Case Manager", applicationsList);
    	strUserData = strUserData.replace("test.automatemail.phys@gmail.com", "test.automatemail.phys+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Physicians", "Episodes, Physician Connect, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Physicians", "test.automatemail.phys+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
    	strUserData = strUserData.replace("test.automatemail.rtcs@gmail.com", "test.automatemail.rtcs+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy TCS", "Episodes, Episodes 2.0");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy TCS", "test.automatemail.rtcs+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
    	strUserData = strUserData.replace("test.automatemail.rlpn@gmail.com", "test.automatemail.rlpn+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy LPN", "Episodes 2.0, Reports, Lessons");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy LPN", "test.automatemail.rlpn+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy LPN", applicationsList);
    	strUserData = strUserData.replace("test.automatemail.rrn@gmail.com", "test.automatemail.rrn+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy RN", "Reports, TCI, Lessons");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy RN", "test.automatemail.rrn+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy RN", applicationsList);
    	strUserData = strUserData.replace("test.automatemail.rfrn@gmail.com", "test.automatemail.rfrn+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy Field RN", "TCI, Lessons");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy Field RN", "test.automatemail.rfrn+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Field RN", applicationsList);
    	strUserData = strUserData.replace("test.automatemail.remedypm@gmail.com", "test.automatemail.remedypm+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy PM", "Episodes, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy PM", "test.automatemail.remedypm+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy PM", applicationsList);
    	strUserData = strUserData.replace("test.automatemail.rst@gmail.com", "test.automatemail.rst+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy Sales Team", "Reports");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy Sales Team", "test.automatemail.rst+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Sales Team", applicationsList);
    	
    	
    	strUserData = strUserData.replace("test.automatemail.re@gmail.com", "test.automatemail.re+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy Executive", "Episodes, Episodes 2.0");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy Executive", "test.automatemail.re+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Executive", applicationsList);
    	
    	strUserData = strUserData.replace("test.automatemail.ppe@gmail.com", "test.automatemail.ppe+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Prospective Partner Executive", "Lessons, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Prospective Partner Executive", "test.automatemail.ppe+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Prospective Partner Executive", applicationsList);
    	
    	strUserData = strUserData.replace("test.automatemail.ro@gmail.com", "test.automatemail.ro+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy Other", "Episodes");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy Other", "test.automatemail.ro+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Other", applicationsList);
    	
    	strUserData = strUserData.replace("test.automatemail.ppa@gmail.com", "test.automatemail.ppa+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Partner Program Administrator", "Episodes, Physician Connect, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Partner Program Administrator", "test.automatemail.ppa+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Program Administrator", applicationsList);
    	
    	strUserData = strUserData.replace("test.automatemail.rpa@gmail.com", "test.automatemail.rpa+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy Program Administrator", "Episodes 2.0");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy Program Administrator", "test.automatemail.rpa+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Program Administrator", applicationsList);
    	
    	strUserData = strUserData.replace("test.automatemail.pta@gmail.com", "test.automatemail.pta+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Partner Technical Administrator", "Administration, Lessons, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Partner Technical Administrator", "test.automatemail.pta+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Technical Administrator", applicationsList);
    	
    	strUserData = strUserData.replace("test.automatemail.rta@gmail.com", "test.automatemail.rta+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Remedy Technical Administrator", "Physician Connect, Administration, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Remedy Technical Administrator", "test.automatemail.rta+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Technical Administrator", applicationsList);
    	
    	strUserData = strUserData.replace("test.automatemail.tcm@gmail.com", "test.automatemail.tcm+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Transitional Case Manager", "Lessons");
    	bulkEmailPerRole=new HashMap<String,String>();
    	bulkEmailPerRole.put("Transitional Case Manager", "test.automatemail.tcm+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Transitional Case Manager", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Transitional Case Manager", applicationsList);
    	
    	strUserData = strUserData.replace("test.automatemail.dp@gmail.com", "test.automatemail.dp+"+randomString+"@gmail.com");
    	applicationsList = new HashMap<String,String>();
    	applicationsList.put("Downstream Provider", "Episodes 2.0, TCI");
    	bulkEmailPerRole=new HashMap<String,String>();    	
    	bulkEmailPerRole.put("Downstream Provider", "test.automatemail.dp+"+randomString+"@gmail.com");
    	bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
    	CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
    	
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
