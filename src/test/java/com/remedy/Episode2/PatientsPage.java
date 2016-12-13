package com.remedy.Episode2;

import com.remedy.baseClass.BaseClass;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * Created by ashish.ranjan on 24-11-2016.
 */
public class PatientsPage extends BaseClass{

    public PatientsPage(WebDriver driver){
        super(driver);
    }

    public void iVerifyTabInFilterBarOnPatientsPage(String elementText){
        verifyTextForElement(driver.findElement(By.xpath("//button[span[span[contains(text(),'"+elementText+"')]]]")), elementText);
    }

    public void iClickTabInFilterBarOnPatientsPage(String elementTextXpath){
        clickElement(driver.findElement(By.xpath("//button[span[span[contains(text(),'"+elementTextXpath+"')]]]")));
    }

    public void iVerifyViewSectionOnPatientsPage(String elementText) {
        verifyTextForElement(driver.findElement(By.xpath("//span[text()='View:']")), elementText);
    }

    public void iVerifyViewAsActiveViewOnPatientsPage(By element) {
        verifyElementAttributeContainsValue(driver.findElement(element),"class","active");
    }

    public void iVerifyToHaveViewOptionOnPatientsPage(By element , String viewOptions) {
        verifyElementAttributeContainsValue(driver.findElement(element),"ng-click", viewOptions);
    }

    public void iClickViewOnPatientsPage(String viewElement) {
        clickElement(driver.findElement(By.cssSelector(viewElement)));
    }

    public void iEnterInPatientSearchFieldOnPatientsPage(String patientName){
        iFillInText(driver.findElement(By.xpath("//div[@placeholder='Search Name']/div/input")), patientName);
    }

    public void iVerifyPatientSearchedResultContainsTextOnPatientPage(String patientNameText){
        verifyTextForElementFromListByXpath("//div[@class='card-header-content']/div/h3", patientNameText);
    }

    public void iVerifyFilterButtonOnPatientPage(String elementText) {
        verifyTextForElement(driver.findElement(By.xpath("//button[span[span[contains(text(),'Filters')]]]")), elementText);
    }

    public void iVerifySeeAsPlaceholderForSearchOnPatientPage(String elementText) {
        verifyElementAttributeContainsValue(driver.findElement(By.cssSelector("i.valentino-icon-search ~ input")), "placeholder", elementText);
    }

    public void iVerifyTheTotalPatientCountOnPatientPage(){
        isElementVisible(driver.findElement(By.cssSelector("div.ng-scope>div>strong.ng-binding")));
    }

    public void i_should_see_link(String ExportText){
        verifyTextForElement(driver.findElement(By.cssSelector(".export-link>a")), ExportText);
    }

    public void i_should_see_text_is_present(String SortByText){
        verifyTextForElement(driver.findElement(By.xpath("//strong[@class='sort-select-label']")), SortByText);
    }

    public void i_should_see_Refresh_button_is_present(){
        isElementVisible(driver.findElement(By.cssSelector("button.btn-reload")));
    }

    public void iVerifyAddPatientButtonIsPresentOnPatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[contains(text(),'Add Patient')]")));
    }

    public void iVerifyAddPatientButtonIsClickableOnPatientsPage(){
        isElementEnabled(driver.findElement(By.xpath("//button[contains(text(),'Add Patient')]")));
    }

    public void iVerifyCountOFPatientCardsArePresentOnPatientsPage(int Count){
        verifyElementCount(".row.cards-mode.isotope>div", Count);

    }
    public void iVerifyTotalNumberOfPagesIsPresentOnPatientsPage(){
        isElementVisible(driver.findElement(By.cssSelector(".page-selector.ng-binding")));
    }

    public void iClickOnInpatientWorkistSubBarOptionOnThePatientsPage(){
        clickElement(driver.findElement(By.xpath("//button[span[span[contains(text(),'Inpatient')]]]")));
    }

    public void iShouldVerifyNeedsReviewIsPresentOnSubBarOptionOnThePatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[span[span[contains(text(),'Needs Review')]]]")));
    }

    public void iShouldVerifyConfirmPredictedIsPresentOnSubBarOptionOnThePatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[span[span[contains(text(),'Confirm Predicted')]]]")));
    }

    public void iShouldVerifyInpatientCareIsPresentOnSubBarOptionOnThePatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[span[span[contains(text(),'Inpatient Care')]]]")));
    }

    public void iShouldVerifyReadmissionsIsPresentOnSubBarOptionOnThePatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[span[span[contains(text(),'Readmissions')]]]")));
    }

    public void iShouldVerifyPostAcuteOnboardingIsPresentOnInpatientSubBarOptionOnThePatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[span[span[contains(text(),'Post-Acute Onboarding')]]]")));
    }

    public void iClickOnPostAcuteWorkListSubBarOptionOnThePatientsPage(){
        clickElement(driver.findElement(By.xpath("//button[span[span[contains(text(),'Post Acute')]]]")));
    }

    public void iShouldVerifyPostAcuteOnboardingIsPresentOnPostAccuteSubBarOptionOnThePatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[span[span[contains(text(),'Post-Acute Onboarding')]]]")));
    }

    public void iShouldVerifyReadmissionDischargesIsPresentOnPostAccuteSubBarOptionOnThePatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[span[span[contains(text(),'Readmission Discharges')]]]")));
    }

    public void iShouldVerifyExceededSNFLOSIsPresentOnPostAccuteSubBarOptionOnThePatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[span[span[contains(text(),'Exceeded SNF LOS')]]]")));
    }

    public void iShouldVerifyPostAcuteFacilityIsPresentOnPostAccuteSubBarOptionOnThePatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[span[span[contains(text(),'Post-Acute Facility')]]]")));
    }

    public void iShouldVerifyHomeHealthIsPresentOnPostAccuteSubBarOptionOnThePatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[span[span[contains(text(),'Home Health')]]]")));
    }

    public void iShouldVerifyHomeWithLimitedServicesIsPresentOnPostAccuteSubBarOptionOnThePatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[span[span[contains(text(),'Home With Limited Services')]]]")));
    }

    public void iShouldVerifyOtherIsPresentOnPostAccuteSubBarOptionOnThePatientsPage(){
        isElementVisible(driver.findElement(By.xpath("//button[span[span[contains(text(),'Other')]]]")));
    }
    
    public void iClickOnFilterButtonPresentOnPatientPage(){
    	clickElement(driver.findElement(By.xpath("//button[span[span[contains(text(),'Filters')]]]")));
    }
    
    public void iVerifyDateRangeIsSelectedAsDefaultFilterUnderFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//span[text()='Date Range']")));
    }
    
    public void iVerifyCareSettingIsSelectedAsDefaultFilterUnderFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//span[text()='Care Setting']")));
    }
    
    public void iVerifyInitiatorIsSelectedAsDefaultFilterUnderFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//span[text()='Initiator']")));
    }
    
    public void iClickOnFiltersButtonPresentOnFilterPage(){
    	clickElement(driver.findElement(By.cssSelector("div.row-controls>a")));
    }
    
    public void iVerifyAdmitReasonFilterIsDisplayedUnderListofFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Admit Reason')]")));
    }
    
    public void iVerifyAnchorDischargeFacilityFilterIsDisplayedUnderListofFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Anchor Discharge Facility')]")));
    }
    
    public void iVerifyAnchorFacilityFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Anchor Facility')]")));
    }
    
    public void iVerifyCarePlanFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Care Plan')]")));
    }
    
    public void iVerifyCareSettingFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Care Setting')]")));
    }
    
    public void iVerifyCooperationMetricFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Cooperation Metric')]")));
    }
    
    public void iVerifyCurrentFacilityFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Current Facility')]")));
    }
    
    public void iVerifyDailyReportFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Daily Report')]")));
    }
    
    public void iVerifyDateRangeFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Date Range')]")));
    }
    
    public void iVerifyDRGTypeFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'DRG Type')]")));
    }
    
    public void iVerifyEligibilityFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Eligibility')]")));
    }
    
    public void iVerifyEpisodeDRGFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Episode DRG')]")));
    }
    
    public void iVerifyEpisodeStatusFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Episode Status')]")));
    }
    
    public void iVerifyFirstNameFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'First Name')]")));
    }
    
    public void iVerifyGenderFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Gender')]")));
    }
    
    public void iVerifyInitiatorFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Initiator')]")));
    }
    
    public void iVerifyInpatientLocationFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Inpatient Location')]")));
    }
    
    public void iVerifyLastNameFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Last Name')]")));
    }
    
    public void iVerifyMedicareIDFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Medicare ID')]")));
    }
    
    public void iVerifyPayerFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Payer')]")));
    }
    
    public void iVerifyQualityMetricFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Quality Metric')]")));
    }
    
    public void iVerifyReadmissionCountFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Readmission Count')]")));
    }
    
    public void iVerifyRiskAssessmentFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Risk Assessment')]")));
    }
    public void iVerifySSNFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'SSN')]")));
    }
    
    public void iVerifyTagFilterIsDisplayedUnderListOfFilterOptions(){
    	isElementVisible(driver.findElement(By.xpath("//ul[@class='list-unstyled']/li[contains(text(),'Tags')]")));	
    }
    
    public void iVerifyPatientNameIsPresentInThePatientCardHeaderOnPatientPage(){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='row cards-mode isotope']/div[1]/div/div[1]//h3")));	
    }
    
    public void iVerifyDOBIsPresentInThePatientCardHeaderOnPatientPage(){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='row cards-mode isotope']/div[1]/div/div[1]//h5/span[1]")));	
    }
    
    public void iVerifyAgeIsPresentInThePatientCardHeaderOnPatientPage(){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='row cards-mode isotope']/div[1]/div/div[1]//h5/span[2]")));	
    }
    
    public void iVerifyGenderIsPresentInThePatientCardHeaderOnPatientPage(){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='row cards-mode isotope']/div[1]/div/div[1]//h5/span[3]")));
    }
    
    public void iVerifySSNIsPresentInThePatientCardHeaderOnPatientPage(){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='row cards-mode isotope']/div[1]/div/div[1]//h5/span[4]")));
    }
    public void iVerifyExpandButtonIsPresentInThePatientCardHeaderOnPatientPage(){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='row cards-mode isotope']/div[1]/div/div[1]/button")));
    }
    
    public void iVerifyRiskStatusIsPresentOnThePatientCardOnPatientPage(){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='row cards-mode isotope']/div[1]//div[contains(@class,'card-triangle')]")));
    }
    
    public void iVerifyCurrentLocationIsPresentOnThePatientCardOnPatientPage(){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='row cards-mode isotope']/div[1]//div[h5[text()='Current Location']]")));
    }
    
    public void iVerifyAnchorFacilityIsPresentOnThePatientCardOnPatientPage(){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='row cards-mode isotope']/div[1]//div[h5[text()='Anchor Facility']]")));
    }
    
    public void iVerifyTagsIsPresentOnThePatientCardOnPatientPage(){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='row cards-mode isotope']/div[1]//div[@class='card-tags-selected']/h5[text()='Tags']")));
    }
    
    public void iVerifyQuickActionsIsPresentOnThePatientCardOnPatientPage(){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='row cards-mode isotope']/div[1]//div[button[contains(@ng-click,'quickAction')]]")));
    }
}
