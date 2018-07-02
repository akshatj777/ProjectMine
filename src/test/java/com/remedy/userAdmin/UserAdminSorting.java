package com.remedy.userAdmin;

import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.remedy.baseClass.BaseClass;

import cucumber.api.java.en.Then;

public class UserAdminSorting extends BaseClass {
	
	public UserAdminSorting(WebDriver driver) {

		super(driver);
	}
	
	public void iSeeSortByWordUnderProgramAdminHomePage(String Text){
		
        verifyTextForElement(driver.findElement(By.cssSelector(".sort-select-label")), Text);
	
	}
	
	public void iseeByDefaultTheSortFilterIsLastNameA_Z(String Text){
		
		verifyTextForElement(driver.findElement(By.cssSelector(".btn.btn-default.form-control.ui-select-toggle >span:nth-of-type(2)")), Text);
				
	}
	
	public void IShouldbeAbleToClickOnDropDownListForSortingNewestToOldest() throws Throwable{
		
		clickElement(driver.findElement(By.cssSelector(".btn.btn-default.form-control.ui-select-toggle")));
	}
	
    
    public void IVerifyTheFilterForNewestToOldest() throws Throwable{
    	isElementVisible(driver.findElement(By.cssSelector(".ui-select-choices-group")));
    }
	
	public void IShouldBeAbleToSortTheUsersWithNewestOldestSortingOption(){
		
		clickElement(driver.findElement(By.cssSelector(".ui-select-choices-group>div:nth-of-type(3)")));
	}
	
	public void Iverifyuserscardsunderuseradminpage(int Count) throws Throwable{
		verifyElementCount((".row.cards-mode.isotope>div"), Count);
	}
	
	public void IShouldbeAbleToClickOnDropDownListForSortingOldestToNewest() throws Throwable{
		
		clickElement(driver.findElement(By.cssSelector(".btn.btn-default.form-control.ui-select-toggle")));
	}
	    
    public void IVerifyTheFilterForOldestToNewest() throws Throwable{
    	isElementVisible(driver.findElement(By.cssSelector(".ui-select-choices-group")));
    }
	
	public void IShouldBeAbletoSortTheUsersWithOldestNewestSortingOption(){
		
		clickElement(driver.findElement(By.cssSelector(".ui-select-choices-group>div:nth-of-type(3)")));
	}
	
    public void IShouldbeAbleToClickOnDropDownListForSortingZToA() throws Throwable{
		
		clickElement(driver.findElement(By.cssSelector(".btn.btn-default.form-control.ui-select-toggle")));
	}
	    
    public void IVerifyTheFilterForZToA() throws Throwable{
    	isElementVisible(driver.findElement(By.cssSelector(".ui-select-choices-group")));
    }
	
	public void IShouldBeAbletoSortTheUsersWithZASortingOption(){
		
		clickElement(driver.findElement(By.cssSelector(".ui-select-choices-group>div:nth-of-type(4)")));
	}
		
	public void iVerifySortingOptionAppliedShouldWorkForTheUser(){
		
		isElementVisible(driver.findElement(By.cssSelector("div:nth-of-type(5)>div:nth-of-type(1)>div>div:nth-of-type(1)>div:nth-of-type(2)")));
	}
	
	public void iSeeTheRefreshIconPresentBesidesTheSortingFilter(){
		
		isElementVisible(driver.findElement(By.cssSelector(".btn.btn-reload")));
		
	}
	
	public void iVerifyRefreshButtonShouldWorkForTheUser(){
		
		clickElement(driver.findElement(By.cssSelector(".btn.btn-reload")));
				
	}
	
	public void IVerifythesortfilterforZtoAunderuseradminpage(){
		
		isElementVisible(driver.findElement(By.cssSelector(".btn.btn-default.form-control.ui-select-toggle")));
	}
	
	public void IClickedonCreateuserbuttonappearingunderuseradminpage(){
		clickElement(driver.findElement(By.cssSelector(".btn.btn-primary")));
	}
	
	public void IClickedonclosebuttonappearingoncreateuserpageunderuseradminpage(){
		
		clickElement(driver.findElement(By.cssSelector(".valentino-icon-x.pull-right")));
	}
	
	public void Iverifysortingappliedonuseradminpageisretaining(){
		
		isElementVisible(driver.findElement(By.cssSelector(".btn.btn-default.form-control.ui-select-toggle >span:nth-of-type(2)")));
	}
	
	public void Ienteredunderuseradminpage(String Text){
		
		iFillInText(driver.findElement(By.xpath("//input[@placeholder='Search Name or NPI']")), Text);
	}
	
	public void iVerifySortShouldWorkCorrectlyWhenSearchIsMadewithNewesttoOldestSortingIsAppliedOnTheFilteredResults(String Text){
		
	isElementVisible(driver.findElement(By.cssSelector("div:nth-of-type(5)>div:nth-of-type(1)>div>div:nth-of-type(1)>div:nth-of-type(2)")));
	
	}
	
	public void iVerifySortShouldWorkCorrectlyWhenSearchIsMadewithOldesttoNewestSortingIsAppliedOnTheFilteredResults(String Text){
		
	isElementVisible(driver.findElement(By.cssSelector("div:nth-of-type(5)>div:nth-of-type(1)>div>div:nth-of-type(1)>div:nth-of-type(2)")));
		
	}
	
	public void iVerifySortShouldWorkCorrectlyWhenSearchIsMadewithZtoASortingIsAppliedOnTheFilteredResults(String Text){

	isElementVisible(driver.findElement(By.cssSelector("div:nth-of-type(5)>div:nth-of-type(1)>div>div:nth-of-type(1)>div:nth-of-type(2)")));
		
	}
	
	public void Iverifythefavicononuseradminpage(){
		isElementVisible(driver.findElement(By.xpath("//link[@rel='shortcut icon']")));
	}
}