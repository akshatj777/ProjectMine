package com.remedy.programManagement;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import com.remedy.baseClass.BaseClass;

public class EditProgram extends BaseClass{

	public EditProgram(WebDriver driver) {
		super(driver);
	}

	public void iVerifyMultipleBundleEpisodeCheckBoxIsNotEditable(String text){
		Assert.assertEquals("true",driver.findElement(By.xpath("//input[@name='multipleBundleEpisode']")).getAttribute("disabled"));
	}
	
	public void iVerifyTheEditedProgramNameOnEditBPCpage(String text){
		if(CreateProgramAPI.PROGRAMNameList.get(0).contains("\"")){
			isElementEnabled(driver.findElement(By.xpath("//span[text()='"+CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1)+"']")));
		}
		else
		{
			isElementEnabled(driver.findElement(By.xpath("//span[text()='"+CreateProgramAPI.PROGRAMNameList.get(0)+"']")));
		}
		//isElementEnabled(driver.findElement(By.xpath("//span[text()='"+CreateProgramAPI.PROGRAMNameList.get(0).substring(1, CreateProgramAPI.PROGRAMNameList.get(0).length()-1)+"']")));
	}
}
