package com.remedy.Analytics;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;

import com.remedy.baseClass.BaseClass;

public class PhysicianScorecard extends BaseClass{
	Actions act=new Actions(driver);
	public PhysicianScorecard(WebDriver driver) {
		super(driver);
	}
	
	public void iVerifyTitleAppearingOnDashboard(String title, String dashboard){
		Assert.assertTrue(isElementPresent(By.xpath("//span[text()='"+title+"']")));
	}
	
	public void iVerifyToolTipForBarGrapOnDashboard(String text){
		if(!(driver.findElements(By.xpath("//div[@class='tab-ubertipTooltip']//span")).size()>0)){
			WebElement element = driver.findElement(By.xpath("//div[@style='background-color: rgb(255, 255, 255); left: 248px; top: 22px; width: 727px; height: 527px;']//div[@class='tvimagesContainer']/canvas"));
			act.moveToElement(element).click().build().perform();
			iWillWaitToSee(By.xpath("//div[@class='tab-ubertipTooltip']//span"));
		}
		Assert.assertTrue(isElementPresent(By.xpath("//div[@class='tab-ubertipTooltip']//span[text()='"+text+"']")));
	}

}
