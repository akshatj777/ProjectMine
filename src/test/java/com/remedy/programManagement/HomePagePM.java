package com.remedy.programManagement;

import static org.junit.Assert.assertEquals;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.remedy.baseClass.BaseClass;

public class HomePagePM extends BaseClass {

	 public HomePagePM (WebDriver driver ){
	        super( driver);
	    }
	 
	 public void iVerifyThePageHeaderOnProgramManagementPage(String text) {
		 iWillWaitToSee(By.cssSelector("h1"));
		 String value = getTextForElement(driver.findElement(By.cssSelector("h1")));
		 assertEquals(value, text);
	 }

	 public void iClickOnOrganizationalLinkOnProgramManagementPage() {
		 if(!(isElementPresentOnPage(By.xpath("//a[text()='Organization']"))))
		  {
		   driver.navigate().refresh();
		   iWillWaitToSee(By.xpath("//a[text()='Organization']"));
		  }
		 
		 iWillWaitToSee(By.xpath("//a[text()='Organization']"));
		 WebElement element = driver.findElement(By.xpath("//a[text()='Organization']"));
		 JavascriptExecutor executor = (JavascriptExecutor)driver;
		 executor.executeScript("arguments[0].click();", element);
		 waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
	 }
	 
	 public void iVerifyDefaultTabOrganizationSelectedOnHomepage(String text) {
		 iWillWaitToSee(By.cssSelector(".navLink.noselect.activeNavLink"));
		 iVerifyTextFromListOfElement(By.cssSelector(".navLink.noselect.activeNavLink"), text);
		}
	 
	 public void iVerifyOrganizationTypeOnHomepage(String text) {
		 iWillWaitToSee(By.xpath("//a[text()='"+text+"']"));
	 } 
}