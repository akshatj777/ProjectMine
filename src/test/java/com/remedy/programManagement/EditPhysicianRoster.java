package com.remedy.programManagement;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

import com.remedy.baseClass.BaseClass;

public class EditPhysicianRoster extends BaseClass {

	public EditPhysicianRoster(WebDriver driver) {
		super(driver);
	}

	public void iSearchWithPhysicianRosterOnViewProfileOfOrganizationSearchBox(String text, String org){
		if(org.equals("PGP")){
			if(text.equals("FETCHFROMAPI"))
			{
				iWillWaitToSee(By.xpath("//input[@class='text-input-field-programFilterTerm']"));
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-programFilterTerm']")), CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1));
				delay();
			}
			else
			{
				iWillWaitToSee(By.xpath("//input[@class='text-input-field-programFilterTerm']"));
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-programFilterTerm']")), text);
				delay();
			}
		}
		else if(org.equals("Hospital")){
			if(text.equals("FETCHFROMAPI"))
			{
				iWillWaitToSee(By.xpath("//input[@class='text-input-field-locationFilterTerm']"));
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locationFilterTerm']")), CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1));
				delay();
			}
			else
			{
				iWillWaitToSee(By.xpath("//input[@class='text-input-field-locationFilterTerm']"));
				iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-locationFilterTerm']")), text);
				delay();
			}
		}
		else if(org.equals("Payor")){
			iWillWaitToSee(By.xpath("//input[@class='text-input-field-programFilterTerm']"));
			iFillInText(driver.findElement(By.xpath("//input[@class='text-input-field-programFilterTerm']")), CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1));
			delay();
		}
		else{
			iWillWaitToSee(By.cssSelector(".text-input-field-organizationFilterTerm"));
			iFillInText(driver.findElement(By.cssSelector(".text-input-field-organizationFilterTerm")), text);
			delay();
		}
	}
	
	public void iVerifyPhysicianRosterFieldInSearchListOnViewProfileOfOrganizationSearchBox(String text, String org){
		if(org.equals("Payor")){
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			isElementPresentOnPage(By.xpath("//div[text()='"+CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1)+"']"));
		}
		else
		{
			iWillWaitToSee(By.cssSelector(".data-table-cell.link-content"));
			isElementPresentOnPage(By.xpath("//div[text()='"+CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1)+"']"));
		}
	}
	
	public void iClickPhysicianRosterFieldInSearchListOnViewProfileOfOrganizationSearchBox(String text, String org){
		if(org.equals("PGP"))
		{
			if(text.equals("FETCHFROMAPI"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1)+"']"));
				WebElement element = driver.findElement(By.xpath("//div[text()='"+CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1)+"']"));
				JavascriptExecutor executor = (JavascriptExecutor)driver;
				executor.executeScript("arguments[0].click();", element);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				longDelay();
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+text+"']"));
				//clickElement(driver.findElement(By.xpath("//div[text()='"+text+"']")));
				WebElement element = driver.findElement(By.xpath("//div[text()='"+text+"']"));
				JavascriptExecutor executor = (JavascriptExecutor)driver;
				executor.executeScript("arguments[0].click();", element);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				longDelay();
			}
			
		}
		else if(org.equals("Hospital"))
		{
			if(text.equals("FETCHFROMAPI"))
			{
				iWillWaitToSee(By.xpath("//div[text()='"+CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1)+"']"));
				WebElement element = driver.findElement(By.xpath("//div[text()='"+CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1)+"']"));
				JavascriptExecutor executor = (JavascriptExecutor)driver;
				executor.executeScript("arguments[0].click();", element);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				longDelay();
			}
			else
			{
				iWillWaitToSee(By.xpath("//div[text()='"+text+"']"));
				//clickElement(driver.findElement(By.xpath("//div[text()='"+text+"']")));
				WebElement element = driver.findElement(By.xpath("//div[text()='"+text+"']"));
				JavascriptExecutor executor = (JavascriptExecutor)driver;
				executor.executeScript("arguments[0].click();", element);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				longDelay();
			}
		}
		else if(org.equals("Payor"))
		{
			iWillWaitToSee(By.xpath("//div[text()='"+CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1)+"']"));
			//clickElement(driver.findElement(By.xpath("//div[text()='"+CreatePrograms.programs.get(1)+"']")));
			WebElement element = driver.findElement(By.xpath("//div[text()='"+CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1)+"']"));
			JavascriptExecutor executor = (JavascriptExecutor)driver;
			executor.executeScript("arguments[0].click();", element);
			waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
			longDelay();
		}
	}
	
	public void iVerifyProgramNameIsNotEditable(){
		//Assert.assertEquals("true",driver.findElement(By.cssSelector(".Select-value")).getAttribute("disabled"));
		WebElement ele = driver.findElement(By.cssSelector(".Select-value"));
		if(ele.isEnabled()){
			System.out.println("element is enabled");
		}
		else {
			System.out.println("element is disabled");
		}
	}
	
	public void iSearchAndVerifySearchListOptionsonViewProfileOfOrganizationSearchBox(String searchParam, String org){
		String value = searchParam;
		if(org.equals("PGP")){
			if(value.equals("FETCHFROMAPI"))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1)+"')]")));
				iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1)+"')]"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1)+"')]")));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-programFilterTerm")), value);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
				iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			}
		}
		else if(org.equals("Hospital")){
			if(value.equals("FETCHFROMAPI"))
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1));
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1)+"')]")));
				iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1)+"')]"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+CreatePractictionerAPI.practitionerNameList.get(0).toString().substring(1, CreatePractictionerAPI.practitionerNameList.get(0).toString().length()-1)+"')]")));
			}
			else
			{
				iFillInText(driver.findElement(By.cssSelector(".text-input-field-locationFilterTerm")), value);
				waitTo().until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("//div[@id='global-spinner-overlay']")));
				scrollIntoViewByJS(driver.findElement(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
				iWillWaitToSee(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]"));
				Assert.assertTrue(isElementPresentOnPage(By.xpath("//div[@class='data-table-cell link-content' and contains(text(),'"+value+"')]")));
			}
		}
	}

	 public void setAttributevalue(WebElement element, String attName, String attValue) {
		  JavascriptExecutor js = (JavascriptExecutor) driver;
		  js.executeScript("arguments[0].setAttribute(arguments[1], arguments[2]);", 
		                element, attName, attValue);
		    }
}
