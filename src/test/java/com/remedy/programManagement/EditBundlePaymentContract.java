package com.remedy.programManagement;

import java.util.List;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.remedy.baseClass.BaseClass;

public class EditBundlePaymentContract extends BaseClass {

	public EditBundlePaymentContract(WebDriver driver) {
		super(driver);
	}
	
	public void iVerifyPriceFieldisEditable(String text){
		isElementEnabled(driver.findElement(By.xpath("//input[@placeholder='"+text+"']")));
	}
	
	public void iVerifyDropdownBoxisnotEditable(String text){
		if(text.equals("ACHNAME")){
			isElementEnabled(driver.findElement(By.xpath("//div[contains(text(),'"+CreateACHOrganizationAPI.ACHNameList.get(1).substring(1, CreateACHOrganizationAPI.ACHNameList.get(1).length()-1)+"')]")));
		}
		else if(text.equals("FETCHFROMAPI")){
			isElementEnabled(driver.findElement(By.xpath("//span[contains(text(),'"+CreateBundleAPI.bundleNameList.get(0).substring(1, CreateBundleAPI.bundleNameList.get(0).length()-1)+"')]")));
		}
		else{
			isElementEnabled(driver.findElement(By.xpath("//span[contains(text(),'"+text+"')]")));
		}
	}
	
	public void iVerifyProgramDropdownBoxisnotEditable(String text){
		isElementEnabled(driver.findElement(By.xpath("//span[text()='"+CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1)+"']")));
	}
	
	public void iVerifyContractIdFieldisnotEditable(String text){
		Assert.assertEquals("true",driver.findElement(By.xpath("//input[@class='text-input-field-contracts[0].contractId']")).getAttribute("disabled"));
	}

	public void iEditPriceFieldonEditContarctPage(String text, String field, String field1){
		if(field1.equals("Bundle1 Price1")){
			driver.findElement(By.xpath("//input[@name='contracts[0].contractBundles[0].bundlePrices[0]."+field+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@name='contracts[0].contractBundles[0].bundlePrices[0]."+field+"']")), text);
		}
		else if(field1.equals("Bundle1 Price2")){
			driver.findElement(By.xpath("//input[@name='contracts[0].contractBundles[0].bundlePrices[1]."+field+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@name='contracts[0].contractBundles[0].bundlePrices[1]."+field+"']")), text);
		}
		else if(field1.equals("Bundle2 Price1")){
			driver.findElement(By.xpath("//input[@name='contracts[0].contractBundles[1].bundlePrices[0]."+field+"']")).clear();
			iFillInText(driver.findElement(By.xpath("//input[@name='contracts[0].contractBundles[1].bundlePrices[0]."+field+"']")), text);
		}
	}
	
	public void iClickonReactDatePickerIcononEditContarctPage(String field, int index){
		List<WebElement> datepickericons= driver.findElements(By.xpath("//div[@class='react-datepicker-input-field-container start-date-picker ']//button[@class='react-datepicker__close-icon']"));
		scrollIntoViewByJS(datepickericons.get(index));
		datepickericons.get(index).click();
	}
}
