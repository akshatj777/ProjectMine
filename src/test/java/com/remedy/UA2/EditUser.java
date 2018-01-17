package com.remedy.UA2;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.server.handler.ClickElement;

import com.remedy.baseClass.BaseClass;

public class EditUser extends BaseClass {
	DateFormat df = new SimpleDateFormat("ddMMyyHHmmss");
	Date timestamp = new Date();
	String time = df.format(timestamp);
	String mail = "test.automatemail";
	final String email = mail + "+" + time + "@gmail.com";

	public EditUser(WebDriver driver) {

		super(driver);
	}

	public void iClickOnUser(String mail) {
		delay();
		if (mail.equalsIgnoreCase(mail)) {
			iWillWaitToSee(By.cssSelector("td.five.wide"));
			clickElement(driver.findElements(By.cssSelector("td.five.wide")).get(0));
		}
	}

	public void iverifyuserpage() {
		iWillWaitToSee(By.cssSelector(".two.column.row"));
		isElementVisible(driver.findElement(By.cssSelector(".two.column.row")));

	}

	public void iClickOnEditButton() {
		iWillWaitToSee(By.cssSelector(".edit-controls"));
		clickElement(driver.findElement(By.cssSelector(".edit-controls")));
		iWillWaitToSee(By.cssSelector(".ui.primary.button"));
	}

	

	public void iEnterPhone(String number) {
		
		iFillInText(driver.findElement(By.cssSelector("input[placeholder='Phone']")), number);
	}

	public void iVerifyFirstNameInUserPage(String field) {

		iWillWaitToSee(By.cssSelector("span.user-name-text"));
		Assert.assertTrue(
				driver.findElements(By.cssSelector("span.user-name-text>span")).get(1).getText().contains(field));
		// verifyTextForElement(driver.findElements(By.cssSelector("span.user-name-text>span")).get(1),
		// field);

	}
	public void iVerifyLastNameInUserPage(String field) {
		
		iWillWaitToSee(By.cssSelector("span.user-name-text"));
		Assert.assertTrue(
				driver.findElements(By.cssSelector("span.user-name-text>span")).get(0).getText().contains(field));
		// verifyTextForElement(driver.findElements(By.cssSelector("span.user-name-text>span")).get(0),
		// field);
		}
	public void iVerifyRoleInUserPage(String field) {
		String text = "Role:" + " " + field;
		iWillWaitToSee(By.xpath("//*[contains(text(), 'Role')]"));
		verifyTextForElement(driver.findElement(By.xpath("//*[contains(text(), 'Role')]")), text);

	}

	public void iVerifyPhoneInUserPage(String num) {
		
		String text = "Phone:" + " " + num;
		iWillWaitToSee(By.cssSelector(".info-row>span"));
		// System.out.println("text: "+text);
		// System.out.println("phone:
		// "+driver.findElement(By.xpath("//*[contains(text(),
		// 'Phone')]")).getText());
		verifyTextForElement(driver.findElement(By.xpath("//*[contains(text(), 'Phone')]")), text);
	
	}
	public void iVerifyThatEmailIsNonEditable() {
		iWillWaitToSee(By.xpath("//input[@placeholder='Email']"));
		// driver.findElement(By.xpath("//input[@placeholder='Email']"));
		Assert.assertFalse(driver.findElement(By.cssSelector("input[placeholder='Email']")).isEnabled());

	}

	public void iClickOnRoleFieldToEdit() {
		iWillWaitToSee(By.cssSelector(".ui.fluid.selection.dropdown"));
		clickElement(driver.findElement(By.cssSelector(".ui.fluid.selection.dropdown")));
	}

	public void iClickOnTab(String text) {
		iWillWaitToSee(By.xpath("//a[contains(text(),'" + text + "')]"));
		clickElement(driver.findElement(By.xpath("//a[contains(text(),'" + text + "')]")));
	}

	public void iVerifyThatApplicationsAreEditable(String app, String text) {
		delay();
		
		if (text.equalsIgnoreCase("Disabled")) {
			if (app.contains(",")) {
				String[] application = app.split(",\\s+");

				for (int i = 0; i < application.length; i++) {

					verifyTextForElementFromListByXpath("//*[contains(text(),'Disabled')]/preceding-sibling::td",application[i]);

				}
			} else {

				verifyTextForElementFromListByXpath(
						"//*[contains(text(),'Disabled')]/preceding-sibling::td", app);

			}
		} else if (text.equalsIgnoreCase("Enabled")) {
			if (app.contains(",")) {
				String[] application = app.split(",\\s+");

				for (int i = 0; i < application.length; i++) {

					verifyTextForElementFromListByXpath("//*[contains(text(),'Enabled')]/preceding-sibling::td",
							application[i]);

				}
			} else {

				verifyTextForElementFromListByXpath(
						"//*[contains(text(),'Enabled')]/preceding-sibling::td", app);

			}
		}
	}

	public void iClickOnDeleteOrganisation() {
		iWillWaitToSee(By.cssSelector(".remove.link.icon"));
		clickElement(driver.findElement(By.cssSelector(".remove.link.icon")));
	}
	public void iClickOnExisitingOrganisation() {
		iWillWaitToSee(By.cssSelector(".component-participant-title"));
		clickElement(driver.findElement(By.cssSelector(".component-participant-title")));
	}
	public void iVerifyDataPermission(String arg){
		longDelay();
		iWillWaitToSee(By.xpath("//*[contains(text(),'Data Permissions')]"));
		if (arg.contains(",")) {
			
			String[] org = arg.split(",\\s+");

			for (int i = 0; i < org.length; i++) {
				isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+org[i]+"')]")));
			}
	}
		else{
			isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+arg+"')]")));
		}
	}
	   public void clickAllLocationsButton(String arg) throws Throwable {
		   
		   if(arg.equals("Second")){
			   System.out.println("Secondffgfd");
			  delay();
		   clickElement(driver.findElements(By.xpath("//label[.='All Locations']")).get(1)); 
		   } 
		   else if(arg.equals("Third")){
			   delay();
			   clickElement(driver.findElements(By.xpath("//label[.='All Locations']")).get(2)); } 
	   
	   else{
		   iWillWaitToSee(By.xpath("//label[.='All Locations']"));
		   clickElement(driver.findElement(By.xpath("//label[.='All Locations']"))); 
		   }
		   delay();
	   }
	   public void iVerifyProductAsPerRole(String appList, String text){
		   delay();
		   iWillWaitToSee(By.cssSelector(".title.one.column.row.no-padding"));
		   if(text.contains("Present")){
		   if (appList.contains(",")) {
				String[] app = appList.split(",\\s+");

				for (int i = 0; i < app.length; i++) {
					isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+app[i]+"')]")));	
				}
				}
				
				else{
					isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+appList+"')]")));	
				}}
		   else if(text.contains("Not Present")){
			   
			   if (appList.contains(",")) {
					String[] app = appList.split(",\\s+");

					for (int i = 0; i < app.length; i++) {
						isElementNotPresentOnPage(By.xpath("//*[contains(text(),'"+app[i]+"')]"));	
					}
					}
					
					else{
						isElementNotPresentOnPage(By.xpath("//*[contains(text(),'"+appList+"')]"));	
					} 
		   }
	   } 
	   public void iVerifyDownstreamProviderPermission(String text, String present){
		   if(present.equals("Present")){
		   iWillWaitToSee(By.xpath("//*[contains(text(),'"+text+"')]"));
		   isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]")));
	   }
	   else if(present.equals("Not Present")){
		   isElementNotPresentOnPage(By.xpath("//*[contains(text(),'"+text+"')]"));
	   }
	   }
	   public void iSeeNoResults(String text){
		   if(text.equals("No results found.")){
			   iWillWaitToSee(By.xpath("//*[contains(text(),'"+text+"')]"));
			   isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]")));
		   }
	   }
	   public void iVerifyDisabledNextButton(String text){
		   WebElement el = driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]"));
		   Assert.assertTrue(el.isDisplayed ());
		   
	   }
	   public void iVerifyErrorMessage(String text){
		   iWillWaitToSee(By.xpath("//*[contains(text(),'"+text+"')]"));
		   isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]")));
	   }
	   public void removeLearningPathway(){
		   iWillWaitToSee(By.cssSelector(".delete.icon"));
		   clickElement(driver.findElement(By.cssSelector(".delete.icon")));
	   }
	   public void iClickOnCloseIcon(){
		   clickElement(driver.findElement(By.cssSelector(".close.icon")));
	   }
	   public void iValidateNPI(String npi, String text){
		   iWillWaitToSee(By.xpath("//*[contains(text(),'Role:')]"));
		   if (text.contains("not")){
			   Assert.assertFalse(isElementNotPresentOnPage(By.xpath("//*[contains(text(),'"+npi+"')]")));
		   }
		   else {
			   Assert.assertTrue(isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+npi+"')]"))));
		   }
	   }
	   public void iValidateAlertText(String text){
		   iWillWaitToSee(By.xpath("//*[contains(text(),'"+text+"')]"));
		   isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]")));
	   }
	   public void iValidateCancelButton(String text){
		   
		   isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]")));
	   }
	   public void iVerifyProductsCount(String text, int count){
		   iWillWaitToSee(By.cssSelector(".ui.checkbox"));
		   int countActual=getElementCount(".ui.checkbox");
		   System.out.println("Actual count "+countActual);
		   if(text.contains("Less")){
			Assert.assertTrue(countActual<count);
		   }
		   else{
			   Assert.assertTrue(countActual>count);
		   }
	   }
	   
	   public void iClickOnAddAnotherOrganisation(String text){
		   iWillWaitToSee(By.xpath("//*[contains(text(),'"+text+"')]"));
		   clickElement(driver.findElement(By.xpath("//*[contains(text(),'"+text+"')]")));
	   }
	   public void iSearchLocByBPID(String bpid, String loc) throws InterruptedException{
		   
		   if (bpid.contains(",") && loc.contains(",")){
		   StringTokenizer st1 = new StringTokenizer(bpid,",");
		   StringTokenizer st2 = new StringTokenizer(loc,",");
	       while (st1.hasMoreTokens()&&st2.hasMoreTokens()) {
	    	   String tokenBpid = st1.nextToken().trim();
	    	   String tokenLoc = st2.nextToken().trim();
	    	   driver.findElement(By.xpath("//p[text()='Which location(s) does this user have access to?']/..//input[@placeholder='Search']")).clear();
	    	   iFillInText(driver.findElement(By.xpath("//p[text()='Which location(s) does this user have access to?']/..//input[@placeholder='Search']")), tokenBpid);
	    	   
	    	   iWillWaitToSee(By.xpath("//th[text()='"+tokenBpid+"']/parent::tr/parent::thead/parent::table//label[contains(text(),\""+tokenLoc+"\")]"));
	    	   
	    	   driver.findElement(By.xpath("//th[text()='"+tokenBpid+"']/parent::tr/parent::thead/parent::table//label[contains(text(),\""+tokenLoc+"\")]")).click();
	    	   Thread.sleep(3000);
	       		}
	       
		   }
		   else{
			   driver.findElement(By.xpath("//p[text()='Which location(s) does this user have access to?']/..//input[@placeholder='Search']")).clear();
	    	   iFillInText(driver.findElement(By.xpath("//p[text()='Which location(s) does this user have access to?']/..//input[@placeholder='Search']")), bpid);
	    	   
	    	   iWillWaitToSee(By.xpath("//th[text()='"+bpid+"']/parent::tr/parent::thead/parent::table//label[contains(text(),\""+loc+"\")]"));
	    	   
	    	   driver.findElement(By.xpath("//th[text()='"+bpid+"']/parent::tr/parent::thead/parent::table//label[contains(text(),\""+loc+"\")]")).click();
	    	   Thread.sleep(3000); 
		   }
}
	   public void iVerifyFacilityKey(String key){
		   if (key.contains(",")){
			   StringTokenizer st = new StringTokenizer(key,",");
			   while (st.hasMoreTokens()){
				   String token = st.nextToken().trim();
				   iWillWaitToSee(By.xpath("//*[contains(text(),'-')]"));
				   isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+token+"')]")));
			   }
		   }
		   else{
		   iWillWaitToSee(By.xpath("//*[contains(text(),'-')]"));
		   isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+key+"')]")));
		   }
	   }
	   public void iSelectLocByFacilityKey(String key) throws InterruptedException{
		   if (key.contains(",")){
			   StringTokenizer st = new StringTokenizer(key,",");
			   
		       while (st.hasMoreTokens()) {
		    	   String token = st.nextToken().trim();
		    	   String facToken="("+token+")";
		    	   driver.findElement(By.xpath("//p[text()='Which location(s) does this user have access to?']/..//input[@placeholder='Search']")).clear();
		    	   iFillInText(driver.findElement(By.xpath("//p[text()='Which location(s) does this user have access to?']/..//input[@placeholder='Search']")), token);
		    	   
		    	   iWillWaitToSee(By.xpath("//*[contains(text(),'"+facToken+"')]"));
		    	   
		    	   driver.findElement(By.xpath("//*[contains(text(),'"+facToken+"')]")).click();
		    	   Thread.sleep(3000);
		       		}
		       
			   }
			   else{
				   String facilityKey="("+key+")";
				   driver.findElement(By.xpath("//p[text()='Which location(s) does this user have access to?']/..//input[@placeholder='Search']")).clear();
		    	   iFillInText(driver.findElement(By.xpath("//p[text()='Which location(s) does this user have access to?']/..//input[@placeholder='Search']")), key);
		    	   
		    	   iWillWaitToSee(By.xpath("//*[contains(text(),'"+facilityKey+"')]"));
		    	   
		    	   driver.findElement(By.xpath("//*[contains(text(),'"+facilityKey+"')]")).click();
		    	   Thread.sleep(3000); 
			   }
		}
	   public void iVerifyLearningPathwayIDIsNotPresentOnEditPage(String text){
			Assert.assertFalse(isElementNotPresentOnPage(By.xpath("//*[contains(text(),'"+text+"']")));
		}
	   public void iVerifyPTAProvisionedRoleOnEditPage(){
			String []Roles={"Executive", "Manager", "Case Manager", "Physicians", "Transitional Case Manager"};
			for(int i=0;i<Roles.length;i++){
				isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'"+Roles[i]+"')]")));
			}
		}
}
