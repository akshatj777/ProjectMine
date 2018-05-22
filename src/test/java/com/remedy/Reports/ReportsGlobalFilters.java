package com.remedy.Reports;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import com.remedy.baseClass.BaseClass;

public class ReportsGlobalFilters extends BaseClass{
	
	WebDriverWait wait = new WebDriverWait(driver, 600);
	
	public ReportsGlobalFilters(WebDriver driver){
		super(driver);
	}

	public void iVerifyReportHeaderInGlobalFilter(String text){
		verifyTextForElement(driver.findElement(By.cssSelector(".container.ng-binding")), text);
	}
	
	public void iSeeUnderGlobalFilterAppliedCount(String text){
		verifyTextForElement(driver.findElement(By.cssSelector(".container h5.ng-scope strong.ng-binding")), text);
	}
	
	public void iClickOnSummaryButtonUnderGlobalFilter(){
		clickElement(driver.findElement(By.cssSelector(".toggle-page-summary.ng-binding")));
	}
	
	public void iVerifyFilterAppearingUnderGlobalFilter(String text){
		verifyTextForElement(driver.findElement(By.xpath("//span[text()='"+text+"']")), text);
	}
	
	public void iSeeAppearingUnderFilterNameOfGlobalFilters(String text){
		verifyTextForElement(driver.findElement(By.xpath("//span[@class='ng-binding'][text()='"+text+"']")), text);
	}
	
	public void iClickOnCheckboxForAnchorFacilityGlobalFilters(String text){
		clickElement(driver.findElement(By.xpath("//div[input[contains(@id,'facility')]]//span[@class='ng-binding'][text()='"+text+"']")));
	}
	
	public void iClickOnCheckboxForEpisodeInitiatorGlobalFilters(String text){
		clickElement(driver.findElement(By.xpath("//div[input[contains(@id,'bpid')]]//span[@class='ng-binding'][text()='"+text+"']")));
	}
	
	public void iClickOnCheckboxForParticipantGlobalFilters(String text){
		clickElement(driver.findElement(By.xpath("//span[@class='ng-binding'][text()='"+text+"']")));
	}
	
	public void iShouldSeeUnderParticipantAppliedFilterOfGlobalFilter(String text){
		verifyTextForElementfromList(".margin-left.ng-binding", text);
	}
	
	public void iShouldSeeUnderEpisodeInitiatorAppliedFilterOfGlobalFilter(String text){
		verifyTextForElement(driver.findElement(By.xpath("//span[@class='margin-left ng-binding']")), text);
	}
	
	public void iShouldSeeUnderAnchorFacilityAppliedFilterOfGlobalFilter(String text){
		verifyTextForElement(driver.findElement(By.xpath("//span[@class='margin-left ng-binding']")), text);
	}
	
	public void iClickOnApplyFilterButton(){
		clickElement(driver.findElement(By.cssSelector(".btn.btn-primary")));
	}
	
	public void iClickOnReportTileOnTopOfReportPage(String report,String tile){
		clickElement(driver.findElement(By.xpath("//li[button[text()='"+tile+"']]//ul/li/a[span[text()='"+report+"']]")));
	}
	
	public void iMovetoElementToClickOnReportTileOnTopOfReportPage(String moveToElementLocator){
		moveToTheElement(driver.findElement(By.xpath(moveToElementLocator)));
	}
	
	public void iSeeReportTileOnTopOfReportPage(String report,String tile){
		isElementVisible(driver.findElement(By.xpath("//li[button[text()='"+tile+"']]//ul/li/a[span[text()='"+report+"']]")));
	}
	
	public void iVerifyParticipantIDAppearingInSelectedFilter(String participantid){
		verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Episode Initiator].[Participant ID]']/span")),participantid);
	}
	
	public void iVerifyBPIDAppearingInSelectedFilter(String bpid){
		verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Episode Initiator].[BPID]']/span")),bpid);
	}
	
	public void iVerifyCCNAppearingInSelectedFilter(String ccn){
		verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Dashboard - Anchor Facility].[CCN]']/span")),ccn);
	}
	
	public void iClickOnReportTileOnTheTopOfReportsPage(){
		clickElement(driver.findElement(By.cssSelector(".flex-item.order-2.btn.logo.valentino-icon-reports")));
	}
	
	public void iClickOnCrossMarkForSelectedParticipantFilter(String participant){
		clickElement(driver.findElement(By.xpath("//span[text()='Participant: "+participant+"']/preceding-sibling::i")));
	}
	
	public void iClickOnCrossMarkForSelectedEpisodeInitiatorFilter(String episodeinitiator){
		clickElement(driver.findElement(By.xpath("//span[text()='Episode Initiator: "+episodeinitiator+"']/preceding-sibling::i")));
	}
	
	public void iClickOnCrossMarkForSelectedAnchorFacilityFilter(String anchorfacility){
		clickElement(driver.findElement(By.xpath("//span[text()='Anchor Facility: "+anchorfacility+"']/preceding-sibling::i")));
	}
	
	public void iClickOnClearButtonToClearSelectedFilter(){
		clickElement(driver.findElement(By.xpath("//button[text()='Clear']")));
	}
	
	public void iClickOnSearchIconForGlobalFilter(String text){
		clickElement(driver.findElement(By.xpath("//div[h5[span[text()='"+text+"']]]//div[@class='elastic-input-wrapper']")));
	}
	
	public void iSearchUnderFilterOnGlobalFilter(String search,String filter){
		iFillInText(driver.findElement(By.xpath("//div[h5[span[text()='"+filter+"']]] //input[@placeholder='Search "+filter+"']")), search);
	}
	
	public void iClickOnTileOnTheTopNavigationOfReportsPage(String tile){
		clickElement(driver.findElement(By.xpath("//button[text()='"+tile+"']")));
	}
	
	public void iVerifyEpisodeInitiatorUnderFilterOptions(String text){
		verifyTextForElementWithMultipleSpaces(driver.findElement(By.xpath("//div[@id='initiatorFilterObj']//span[@class='selectorValue']")),text);
	}
	
	public void iVerifyAnchorFacilityUnderFilterOptions(String text){
		verifyTextForElementWithMultipleSpaces(driver.findElement(By.xpath("//div[@id='facilityFilterObj']//span[@class='selectorValue']")),text);
	}
	
	public void iVerifyBpidsUnderSelectedFilters(String bpid1,String bpid2){
		String toVerify = "BPID includes "+bpid2+" and "+bpid1+"";
		verifyTextForElement(driver.findElement(By.xpath("//div[@class='filterItem'][@formula='[Episode Initiator].[BPID]']/span")), toVerify);
	}
	
	public void iVerifyCCNsUnderSelectedFilters(String ccn1,String ccn2){
		String ccn="Dashboard - Anchor CCN includes "+ccn2+" and "+ccn1+"";
		verifyTextForElement(driver.findElement(By.xpath("//div[@class='filterItem'][@formula='[Dashboard - Anchor Facility].[CCN]']/span")), ccn);
	}
		
	public void iVerifyCCNFilterUnderSelectedFilters(String ccn){
		verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Anchor Facility].[CCN]']/span")),ccn);
	}
	
	public void iVerifyParticipantAppearingInSelectedFilter(String participant){
		verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Episode Initiator].[Participant]']/span")),participant);
	}
	
	public void iClickOnCheckboxForPayerGlobalFilters(String text){
		clickElement(driver.findElement(By.xpath("//div[input[contains(@id,'payer')]]//span[@class='ng-binding'][text()='"+text+"']")));
	}
	
	public void iShouldSeeUnderPayerAppliedFilterOfGlobalFilter(String text){
		verifyTextForElementfromList(".margin-left.ng-binding", text);
	}
	
	public void iVerifyPayerAppearingInSelectedFilter(String ccn){
		verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Episode Initiator].[Payer]']/span")),ccn);
	}
	
	public void iClickOnCrossMarkForSelectedPayerFilter(String participant){
		clickElement(driver.findElement(By.xpath("//span[text()='Payer: "+participant+"']/preceding-sibling::i")));
	}
	
	public void iSeePayerNameAppearingUnderFilterNameOfGlobalFilters(String text){
		if (!text.isEmpty()){
			verifyTextForElementFromListByXpath("//div[h5[span[text()='Payer']]]/div//span[@class='ng-binding']",text);
		}
	}
	
	public void iVerifyPayerUnderFilterOptions(String text){
		verifyTextForElementWithMultipleSpaces(driver.findElement(By.cssSelector("#payerFilterObj .selectorValue")),text);
	}
	
	public void iVerifyParticipantUnderFilterOptions(String text){
		verifyTextForElementWithMultipleSpaces(driver.findElement(By.cssSelector("#participantFilterObj .selectorValue")),text);
	}
	
	public void iVerifyApplyFilterButtonUnderGlobalFilters(){
		isElementVisible(driver.findElement(By.cssSelector(".btn.btn-primary")));
	}
	
	public void iShouldNotSeeHideSummaryAppearingInGlobalFilters(String text){
		verifyTextNotPresentForElementFromList(".toggle-page-summary.ng-binding",text);
	}
	
	public void iWaitUntillTheFieldIsAppearingInTheReport(String text){
		wait.until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath("//div[@class='gem dojoDndItem']/div[text()='"+text+"']"))));
	}
}