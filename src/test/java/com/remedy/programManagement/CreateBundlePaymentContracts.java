package com.remedy.programManagement;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import com.remedy.baseClass.BaseClass;

public class CreateBundlePaymentContracts extends BaseClass{

	public CreateBundlePaymentContracts(WebDriver driver) {
		super(driver);
	}
	
	public void iVerifyContractsFieldOnCreateContractsPageUnderPayorOrganiztion(String text){
		if(text.contains("Price")){
			isElementPresent(By.xpath("//label[@class='input-field-caption required']"));
		}
		else
		{
			verifyTextForElement(driver.findElement(By.xpath("//label[text()='"+text+"']")), text);
		}
	}
	
	public void iVerifyDateFieldsOnCreateContractsPage(String text, String action){
		if(text.contains("Start Date"))
		{
			isElementPresent(By.xpath("//div[@class='react-datepicker-input-field-container start-date-picker ']"));
		}
		else if(action.equals("Baseline_Start_Date"))
		{
			verifyTextForElement(driver.findElement(By.xpath("//label[@class='false react-datepicker-field-caption']")), text);
		}
		else if(action.equals("Baseline_End_Date"))
		{
			verifyTextForElement(driver.findElement(By.xpath("//label[text()='Baseline End']")), text);
		}
		else
		{
			verifyTextForElement(driver.findElement(By.cssSelector(".undefined.react-datepicker-field-caption")), text);
		}
	}
	
	public void iClickandSearchWithInvalidNameonDropdownBox(String text){
		if(text.equalsIgnoreCase("InvalidSearchOrganizationName"))
		{
			driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			longDelay();
			driver.findElement(By.xpath("//div[text()='Search Name or CCN/EIN']/following-sibling::div/input")).sendKeys(text);
			longDelay();
		}
		else if(text.equalsIgnoreCase("InvalidSearch"))
		{
			delay();
			scrollIntoViewByJS(driver.findElement(By.xpath("//div[text()='Select a Bundle']/parent::span/following-sibling::span[@class='Select-arrow-zone']")));
			driver.findElement(By.xpath("//div[text()='Select a Bundle']/parent::span/following-sibling::span[@class='Select-arrow-zone']")).click();
			delay();
			iWillWaitToSee(By.xpath("//div[text()='Select a Bundle']/following-sibling::div/input"));
			driver.findElement(By.xpath("//div[text()='Select a Bundle']/following-sibling::div/input")).sendKeys(text);
			longDelay();
		}
	}

	public void iVerifyBundleDropdownBoxIsAppearingonCreateContractPage(String text, String act){
		isElementPresent(By.xpath("//div[text()='Select a Bundle']"));
	}
}
