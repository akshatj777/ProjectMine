package com.remedy.programManagement;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.remedy.baseClass.BaseClass;

public class EditPGPOrganization extends BaseClass {
	
	public EditPGPOrganization(WebDriver driver) {
		super(driver);
	}

	public void iEditRegionForSelectedOrganization(String text, String org){
		driver.findElement(By.xpath("//div[text()='Region']/preceding-sibling::div//input[@role='combobox']")).sendKeys(text);
	    delay();
	    clickSingleElementFromList(By.cssSelector(".VirtualizedSelectOption"),text);
	}

	public void iEditMarketForSelectedOrganization(String market, String region){
		
		if(!region.isEmpty()){
    		if(!market.isEmpty())
        	{
    			driver.findElement(By.xpath("//div[text()='Market']/preceding-sibling::div//input[@role='combobox']")).sendKeys(market);
    			delay();
    		    clickSingleElementFromList(By.cssSelector(".VirtualizedSelectOption"),market);
        	}
        	else
        	{
        		if(isElementPresent(By.xpath("//div[text()='Market']/preceding-sibling::div//input[@role='combobox']"))){
        			WebElement element = driver.findElement(By.xpath("//div[text()='Market']/preceding-sibling::div//input[@role='combobox']"));
        	        scrollIntoViewByJS(element);
        	        delay();
        			element.click();
        		}
        	}
    	}
	}
}