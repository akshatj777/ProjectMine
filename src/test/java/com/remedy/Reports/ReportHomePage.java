package com.remedy.Reports;

import com.remedy.Analytics.ProgramPerformance;
import com.remedy.baseClass.BaseClass;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import java.text.ParseException;
import java.util.HashSet;
import java.util.Set;
import java.util.StringTokenizer;

/**
 * Created by salam on 5/6/16.
 */
public class ReportHomePage extends BaseClass {
	
	public static String episodes;
	WebDriverWait wait = new WebDriverWait(driver, 420);

    public ReportHomePage(WebDriver driver){
        super(driver);
    }

    public void iVerifyReportsTextforTiles(String text){
        delay();
        verifyTextForElementfromList(".dropdown-tile-label.ng-binding", text);
    }
    
    public void iVerifyReportsTextNotPresent(String text){
        delay();
        verifyTextNotPresentForElementFromList(".dropdown-tile-label.ng-binding", text);
    }

    public void iClickOnReportTileWithText(String tile){
        selectElementByDesc(".dropdown-tile-label.ng-binding", tile);
        delay();
    }

    public void iVerifyReportsTextForReportsTextName(String reportsTextName, String text){
        verifyTextForElementFromListByXpath("//div[label[text()='"+reportsTextName+"']]/following-sibling::div/a", text);
    }

    public void iClickOnReportTextForOverallProgramReportTile(String tile){
        selectElementByTextDescByXpath("//div[label[text()='Overall Program']]/following-sibling::div/a", tile);
        longDelay();
    }

    public void iVerifyReportsPageHeaderText(String tile){
        verifyTextForElement(driver.findElement(By.xpath("//h5[@class='ng-binding' and text()='Report']")), tile);
    }

    public void iSwitchToReportsPageFrameWithXpath(String frameXpath){
        swithToFrame(frameXpath);
        delay();
    }

    public void iVerifyPerformanceReportsColumnsTitleText(String text){
        delay();
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", text);
    }

    public void iClickReportFieldPanelIconButton(){
        clickElement(driver.findElement(By.xpath(".//div[@class='field-panel-icon']")));
    }
    
    public void iClickReportFieldLayoutIconButton(){
        clickElement(driver.findElement(By.xpath(".//div[@class='field-layout-icon']")));
    }

    public void iMoveToElementToPerform(String toElementLocator){
        moveToTheElement(driver.findElement(By.xpath(toElementLocator)));
    }

    public void iMoveToElementAndPerformRightClick(String filterField, String filterTitle){
    	WebElement element = driver.findElement(By.xpath(".//*[@id='fieldListTreeContent']//div[@formula='["+filterTitle+"].["+filterField+"]']"));
    	scrollIntoViewByJS(element);
    	clickElement(driver.findElement(By.xpath(".//*[@id='fieldListTreeContent']//div[@formula='["+filterTitle+"].["+filterField+"]']")));
    	clickElement(driver.findElement(By.xpath(".//*[@id='fieldListTreeContent']//div[@formula='["+filterTitle+"].["+filterField+"]']/div")));
    }

    public void iChooseOptionsFromFilterWithXpath(String toLocator){
        clickElement(driver.findElement(By.xpath(toLocator)));
    }

    public void iVerifyFilterModalHeaderText(String text){
        verifyTextForElement(driver.findElement(By.xpath("//*[@id='dialogTitleBar']/table/tbody/tr/td[1]")), text);
    }
    
    public void iVerifyFilterTitleHeaderText(String text){
        verifyTextForElement(driver.findElement(By.xpath(".//span[@class='dijitDialogTitle']")), text);
    }

    public void iVerifyFilterValueListModalText(String text){
    	iWillWaitToSee(By.xpath("//div[@id[starts-with(.,'FT_AVA_')]]"));
    	if (!text.isEmpty()){
        verifyTextForElementfromList("#FT_valueList div", text);
    	}
    }
    
    public void iSeeFilterValueListText(String text){
        delay();
        verifyTextForElementfromList("#dijit_form_MultiSelect_0>option", text);
    }

    public void iClickOnFilterTextFormFilterValueList(String filterText){
        clickElement(driver.findElement(By.xpath("//*[starts-with(@id,'FT_AVA') and text()='"+filterText+"']")));
    }
    
    public void iSelectFilterTextFormFilterValueList(String filterText){
        clickElement(driver.findElement(By.xpath("//div[@class='filterDialogPicklistContainer'] //option[text()='"+filterText+"']")));
    }

    public void iClickAddSelectedArrowFromFilterModal() {
        clickElement(driver.findElement(By.id("FT_select_add")));
    }
    
    public void iClickSelectedFromFilterModal(String text) {
        clickElement(driver.findElement(By.xpath("//img[@title='"+text+"']")));
    }

    public void iClickOkButtonFromFilterModal() {
        clickElement(driver.findElement(By.id("dlgBtnSave")));
    }
    
    public void iClickButtonFromFilterModalToSelectField(String text) {
        clickElement(driver.findElement(By.xpath(".//table[@class='button-panel'] //button[text()='"+text+"']")));
    }

    public void iClickCancelButtonFromFilterModal() {
        clickElement(driver.findElement(By.id("dlgBtnCancel")));
    }

    public void iClickOnCloseReportsCrossLink() {
        clickElement(driver.findElement(By.xpath("//a[@href='#/reports']")));
    }
    
    public void iClickOnReportsTabOnReportsPage() {
        clickElement(driver.findElement(By.xpath("//div[@href='#/']")));
    }

    public void iVerifyFilterResultInColumnFieldForReportFilterField(String text, String filterCol, String filterOption){
        verifyTextForElementFromListByXpath("//*[@class='pivotTableRowLabelSection']//*[@formula='["+filterOption+"].["+filterCol+"]']/div", text);
    }

    public void iVerifyFollowingReportsTextsForReportsTile(String reportsTextName, String text){
        verifyTextForElementFromListByXpath("//div[label[text()='"+reportsTextName+"']]/following-sibling::div/a", text);
    }

    public void iClickOnReportsTextForReportsTextName(String reportsTextName, String reportTile){
    	WebElement element = driver.findElement(By.xpath("//div[label[text()='"+reportsTextName+"']]/following-sibling::div/a"));
    	scrollIntoViewByJS(element);
        selectElementByTextDescByXpath("//div[label[text()='"+reportsTextName+"']]/following-sibling::div/a", reportTile);
        longDelay();
    }

    public void iVerifyOperationsDashboardReportPageHeader(String text){
        verifyTextForElement(driver.findElement(By.xpath("//*[@id='dashboardTitle']")), text);
    }

    public void iVerifyPerformanceOverallProgramReportPageHeader(String text){
        verifyTextForElement(driver.findElement(By.xpath("//*[@id='RPT001ReportName']")), text);
    }

    public void iVerifyInpatientEpisodeClearingIssuesPatientIDReportPageHeader(String text){
        verifyTextForElement(driver.findElement(By.xpath("//*[@id='RPT001ReportName']")), text);
    }
    
    public void iVerifyEpisodeDRGIssuesReportPageHeader(String text){
        verifyTextForElement(driver.findElement(By.xpath("//*[@id='RPT001ReportName']")), text);
    }

    public void iVerifySNFLOSDetailPostAcuteCareReportPageHeader(String text){
        verifyTextForElement(driver.findElement(By.xpath("//*[@id='rpt-report-header-label-0']")), text);
    }

    public void iVerifyPhysicianPerformancePhysicianReportPageHeader(String text){
        verifyTextForElement(driver.findElement(By.xpath("//*[@id='RPT001ReportName']")), text);
    }

    public void iVerifyCARLNSOCReportPageHeader(String text){
        verifyTextForElementWithMultipleSpaces(driver.findElement(By.xpath("//*[@id='RPT001ReportName']")), text);
    }
    
    public void iVerifyNextSiteOfCareDetailNSOCReportPageHeader(String text){
        verifyTextForElement(driver.findElement(By.xpath(".//*[@id='rpt-report-header-label-0']")), text);
    }

    public void iVerifyReadmissionsReadmissionReportPageHeader(String text){
        verifyTextForElement(driver.findElement(By.xpath("//*[@id='RPT001ReportName']")), text);
    }
    
    public void iVerifyPostAccuteCareReportPageHeader(String text){
        verifyTextForElement(driver.findElement(By.xpath("//*[@id='RPT001ReportName']")), text);
    }

    public void iVerifyHeaderTitleForColumnOperationsDashboardReport(String elementColumn, String elementText){
        verifyTextForElement(driver.findElement(By.id(elementColumn)), elementText);
    }

    public void iChooseOptionsFromFilterOperationsDashboardReport(String filterType,String filterOptions){
        clickElement(driver.findElement(By.xpath("//div[@id='"+filterType+"']//span[text()='All']")));
        delay();
        clickElement(driver.findElement(By.xpath("//li[text()='"+filterOptions+"']")));
    }


    public void iEnterAsTheValueOnTheTextboxInTheFilterModal(String value){
    	iFillInText(driver.findElement(By.cssSelector("input#FT_condOp1")), value);
    }

    public void iClickOnRangeFilterDropdownAndSelectedLessThanRangeInTheFilterModal(){
    	clickElement(driver.findElement(By.cssSelector("#FT_condOp")));
    	selectDropdownVisibleElement("#FT_condOp", "Less Than");
    }

    public void iClickOnForTheInTheFilterValueList(String month, String year){
    	clickElement(driver.findElement(By.cssSelector("[id='FT_AVA_[Anchor Begin Date].["+year+"].[2014Q1].["+month+"]']")));
    }

    public void iClickOnReportTextForReadmissionsReports(String text){
    	WebElement element = driver.findElement(By.xpath("//div[label[text()='Readmissions']]/following-sibling::div/a"));
    	scrollIntoViewByJS(element);
        selectElementByTextDescByXpath("//div[label[text()='Readmissions']]/following-sibling::div/a", text);
    }

    public void iShouldSeeReadmissionReportsColumnTileTextAs(String text) {
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", text);
    }

    public void iClickOnReportTextForPhysicianReports(String text){
        selectElementByTextDescByXpath("//div[label[text()='Physician']]/following-sibling::div/a", text);
    }

    public void iShouldSeeVolumeReportsColumnTileTextAs(String text) {
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", text);
    }

    public void iClickOnReportTextForPostAcuteCareReportsTile(String text){
    	WebElement element = driver.findElement(By.xpath("//div[label[text()='Post Acute Care']]/following-sibling::div/a"));
    	scrollIntoViewByJS(element);
    	selectElementByTextDescByXpath("//div[label[text()='Post Acute Care']]/following-sibling::div/a", text);
    }

    public void iShouldSeePostAcuteCareClaimsReportsColumnTileTextAs(String tile) {
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", tile);
    }

    public void iShouldSeeSnfPerformanceReportsColumnTileTextAs(String tile){
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", tile);
    }

    public void iShouldSeeSpendingReportsColumnTileTextAs(String text) {
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", text);
    }
    
    public void iShouldSeeInitialSNFLengthOfStaySummaryReportsColumnTileTextAs(String tile){
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", tile);
    }
    
    public void iShouldSeeNextSiteOfCareDetailReportsColumnTileTextAs(String tile){
        verifyAttributeForElementFromListByXpath(".//tr[@id='column-dnd-target']/td", "title", tile);
    }
    
    public void iShouldSeeNextSiteOfCareReportsColumnTileTextAs(String tile){
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", tile);
    }
    
    public void iClickOnReportTextForNSoCReports(String text){
    	selectElementByTextDescByXpath("//div[label[text()='Next Site of Care']]/following-sibling::div/a", text);
    	longDelay();
    }
    
    public void iSelectFromTheDropdownListOnTheFilterPage(String range){
    	selectDropdownVisibleElement("#FT_rangeOp", range);
    }
    
    public void iShouldSeeNextSiteOfCareSummaryReportsColumnTileTextAs(String tile){
    	delay();
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", tile);
    }

    public void iClickOnReportTextForPatientIDReports(String text){
        selectElementByTextDescByXpath("//div[label[text()='Patient ID']]/following-sibling::div/a", text);
    }

    public void iShouldSeeEpisodeAvgDayToDRGReportsColumnTileTextAs(String tile){
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", tile);
    }
    
    public void iShouldSeeEpisodeDRGIssuesReportsColumnTileTextAs(String tile){
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", tile);
    }

    public void iShouldSeeEpisodeWithDRGIssueReportsColumnTileTextAs(String tile){
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", tile);
    }

    public void iShouldSeeReadmissionsReportsColumnTileTextAs(String tile){
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']/tbody/tr/td", "title", tile);
    }
    
    public void iVerifyTextUnderProgramOverviewReport(String text){
        verifyTextForElement(driver.findElement(By.xpath("//button[text()='"+text+"']")), text);
    }
    
    public void iShouldSeeUnderOverallProgram(String text){
    	isElementVisible(driver.findElement(By.xpath("//div[text()='"+text+"']")));
    }
    
    public void iVerifyTextProgramOverviewReport(String text){
       verifyTextForElement(driver.findElement(By.xpath("//button[text()='"+text+"']")), text);
    }
    
    public void iVerifySkilledNursingGraphUnderReport(){
    	isElementVisible(driver.findElement(By.cssSelector("#SNFChartObjprotovis")));
    }
    
    public void iVerifyLongTermAcuteGraphUnderReport(){
    	isElementVisible(driver.findElement(By.cssSelector("#LTCHChartObjprotovis")));
    }
    
    public void iVerifyInpatientRehabGraphUnderReport(){
    	isElementVisible(driver.findElement(By.cssSelector("#IRFChartObjprotovis")));
    }
    
    public void iVerifyHomeHealthGraphUnderReport(){
    	isElementVisible(driver.findElement(By.cssSelector("#HHAChartObjprotovis")));
    }
    
    public void iVerifyHomeGraphUnderReport(){
    	isElementVisible(driver.findElement(By.cssSelector("#homeChartObjprotovis")));
    }
    
    public void iVerifyOtherGraphUnderReport(){
    	isElementVisible(driver.findElement(By.cssSelector("#otherChartObjprotovis")));
    }
    
    public void iVerifyInitialSnfLengthOfStayGraphUnderReport(){
    	isElementVisible(driver.findElement(By.cssSelector("#initialSNFChartObjprotovis")));
    }
    
    public void iVerifySnfDaysGraphUnderReport(){
    	isElementVisible(driver.findElement(By.cssSelector("#daysSNFChartObjprotovis")));
    }
    
    public void iVerifyEpisodesWReadmitGraphUnderReport(){
    	isElementVisible(driver.findElement(By.cssSelector("#episodesReadmitsChartObjprotovis")));
    }
    
    public void iVerifyReadmitsPerEpisodeGraphUnderReport(){
    	isElementVisible(driver.findElement(By.cssSelector("#readmitsEpisodesChartObjprotovis")));
    }
    
    public void iVerifyEpisodesGraphUnderReport(){
    	isElementVisible(driver.findElement(By.cssSelector("#episodesChartObjprotovis")));
    }
    
    public void iVerifyNpraGraphUnderReport(){
    	isElementVisible(driver.findElement(By.cssSelector("#NPRAChartObjprotovis")));
    }
    
    public void iVerifyFilterOptions(String text){
    	verifyTextForElement(driver.findElement(By.cssSelector("#filterTitleObj")), text);
    }
    
    public void iVerifyParticipantFilter(){
    	isElementVisible(driver.findElement(By.cssSelector("#participantFilterObj")));
    }
    
    public void iClickOnProgramOverviewReports(String text) throws Throwable{
    	delay();
    	clickElement(driver.findElement(By.xpath("//button[text()='"+text+"']")));
    }
    
    public void iAgainClickOnPostAcuteUtilization() throws Throwable {
    	clickElement(driver.findElement(By.xpath("//*[@id='utilizationTitleButtonObj']/button")));
    }
    
    public void iAgainClickOnSNFLengthOfStay() throws Throwable {
    	WebElement element = driver.findElement(By.xpath("//*[@id='SNFTitleButtonObj']/button"));  
    	scrollIntoViewByJS(element);
    	clickElement(driver.findElement(By.xpath("//*[@id='SNFTitleButtonObj']/button")));
    }
    
    public void iAgainClickOnReadmissions() throws Throwable {
    	WebElement element = driver.findElement(By.xpath("//*[@id='readmissionsTitleButtonObj']/button"));  
    	scrollIntoViewByJS(element);
    	clickElement(driver.findElement(By.xpath("//*[@id='readmissionsTitleButtonObj']/button")));
    }
    
    public void iVerifyDateRangeFilter(){
    	isElementVisible(driver.findElement(By.cssSelector("#newDateRangeObj")));
    }
    
    public void iVerifyEpisodeInitiatorFilter(){
    	isElementVisible(driver.findElement(By.cssSelector("#initiatorFilterObj")));
    }
    
    public void iVerifyFacilityFilter(){
    	isElementVisible(driver.findElement(By.cssSelector("#facilityFilterObj")));
    }
    
    public void iVerifyBundleFilter(){
    	isElementVisible(driver.findElement(By.cssSelector("#bundleFilterObj")));
    }
    
    public void iVerifyBundleRiskFilter(){
    	isElementVisible(driver.findElement(By.cssSelector("#bundleRiskFilterObj")));
    }
    
    public void iVerifyViewFilter(){
    	isElementVisible(driver.findElement(By.cssSelector("#viewSelectorRow")));
    }
    
    public void iVerifyDataSourceFilter(){
    	isElementVisible(driver.findElement(By.cssSelector("#dataSourceRow")));
    }
    
    public void iClickOnTableOptionForViewFilter(String text) throws Throwable {
    	clickElement(driver.findElement(By.xpath("//button[@name='render_viewSelector'][text()='"+text+"']")));
    }
    
    public void iSelectEpisodeConnectRadioButton(String text) throws Throwable {
    	longDelay();
    	iWillWaitToSee(By.xpath("//button[@name='render_dataSourceSelector'][text()='"+text+"']"));
    	clickElement(driver.findElement(By.xpath("//button[@name='render_dataSourceSelector'][text()='"+text+"']")));
        delay();
    }
    
    public void iSeeOverallProgramReport(String text){
    	isElementVisible(driver.findElement(By.cssSelector("#episodesNPRATable"+text+"ObjTable")));
    }
    
    public void iSeeClaimsReportForPostAcuteUtlization(){
    	isElementVisible(driver.findElement(By.cssSelector("#utilizationTableObjTable")));
    }
    
    public void iSeeClaimsReportForSNFLengthofStay(){
    	isElementVisible(driver.findElement(By.cssSelector("#daysSNFTableObjTable")));
    }
    
    public void iSeeClaimsReportForReadmissions(){
    	isElementVisible(driver.findElement(By.cssSelector("#readmitionsTableObjTable")));
    }
    
    public void iSeePostAcuteUtilizationReport(String text){
    	isElementVisible(driver.findElement(By.cssSelector("#utilizationTable"+text+"ObjTable")));
    }
    
    public void iSeeSNFLengthofStayReport(String text){
    	isElementVisible(driver.findElement(By.cssSelector("#daysSNFTable"+text+"ObjTable")));
    }
    
    public void iSeeReadmissionsReport(String text){
    	isElementVisible(driver.findElement(By.cssSelector("#readmitionsTable"+text+"ObjTable")));
    }
    
    public void iClickOnSkilledNursingZoom(String text){
    	clickElement(driver.findElement(By.xpath("//*[@id='SFNChartButtonObj']/button")));
    }
    
    public void iClickOnInpatientRehabZoom(String text){
    	clickElement(driver.findElement(By.xpath("//*[@id='IRFChartButtonObj']/button")));
    }
    
    public void iClickOnLongTermAcuteCareZoom(String text){
    	clickElement(driver.findElement(By.xpath("//*[@id='LTCHChartButtonObj']/button")));
    }
    
    public void iClickOnHomeHealthZoom(String text){
    	WebElement element = driver.findElement(By.xpath("//*[@id='HHAChartButtonObj']/button"));
    	scrollIntoViewByJS(element);
    	clickElement(driver.findElement(By.xpath("//*[@id='HHAChartButtonObj']/button")));
    }
    
    public void iClickOnHomeZoom(String text){
    	clickElement(driver.findElement(By.xpath("//*[@id='homeChartButtonObj']/button")));
    }
    
    public void iClickOnOtherZoom(String text){
    	clickElement(driver.findElement(By.xpath("//*[@id='otherChartButtonObj']/button")));
    }
    
    public void iVerifyZoomOutText(String text,String graph){
    	verifyTextForElement(driver.findElement(By.xpath("//button[text()='"+text+"']")), text);
    }
    
    public void iClickOnExportSymbol(String export){
     	clickElement(driver.findElement(By.xpath("//*[@id='"+export+"ExportObj']/div")));
    	longDelay();
    }
    
    public void iVerifyAppearingClickingExport(String text,String Graph){
    	iWillWaitToSee(By.xpath("//div[@class='popupComponent exportOptions south ui-draggable']/div[text()='"+text+"']"));
    	verifyTextForElement(driver.findElement(By.xpath("//div[@class='popupComponent exportOptions south ui-draggable']/div[text()='"+text+"']")), text);
    }
    
    public void iClickOnOptionUnderExportSymbol(String text,String Graph){
    	clickElement(driver.findElement(By.xpath("//div[@class='popupComponent exportOptions south ui-draggable']/div[text()='"+text+"']")));
    	delay();
    }
    
    public void iVerifyUnderExportOptions(String text,String Grpah){
    	iWillWaitToSee(By.xpath("//div[@class='exportChartPopupButtons']/div[text()='"+text+"']"));
    	verifyTextForElement(driver.findElement(By.xpath("//div[@class='exportChartPopupButtons']/div[text()='"+text+"']")), text);
    }
    
    public void iClickOnExportOption(String text,String Graph){
    	iWillWaitToSee(By.xpath("//div[@class='exportChartPopupButtons']/div[text()='"+text+"']"));
    	clickElement(driver.findElement(By.xpath("//div[@class='exportChartPopupButtons']/div[text()='"+text+"']")));
    }
    
    public void iVerifyGraphUnderExportOptionsPopUp(){
    	iWillWaitToSee(By.xpath("//div[@class='exportChartImageDiv']/img"));
    	isElementVisible(driver.findElement(By.xpath("//div[@class='exportChartImageDiv']/img")));
    }
    
    public void iCloseTheExportOptionsPopUp(){
    	iWillWaitToSee(By.xpath("//*[@id='fancybox-close']"));
    	clickElement(driver.findElement(By.xpath("//*[@id='fancybox-close']")));
    	longDelay();
    }
    
    public void iClickOnXLSCSVOptionUnderExportSymbol(String text,String Graph){
    	iWillWaitToSee(By.xpath("//div[@class='popupComponent exportOptions ui-draggable south']/div[text()='"+text+"']"));
    	clickElement(driver.findElement(By.xpath("//div[@class='popupComponent exportOptions ui-draggable south']/div[text()='"+text+"']")));
    }
    
    public void iShouldSeeAppearingClickingExport(String text,String Graph){
    	verifyTextForElement(driver.findElement(By.xpath("//div[@class='popupComponent exportOptions ui-draggable south']/div[text()='"+text+"']")), text);
    }
    
    public void iScrollPageToBottom(String text){
    	JavascriptExecutor js = ((JavascriptExecutor)driver);
    	js.executeScript("scroll(0, "+text+")");
    }
    
    public void iClickOnAdjustHistoricButton(String text){
    	clickElement(driver.findElement(By.xpath("//button[text()='"+text+"']")));
    }
    
    public void IVerifyURLAfterClickingAdjustedHistoricButton(){
    	Assert.assertEquals(getTheCurrentUrl(), "https://cdn-qa.remedypartners.com/reports/index.html#/reports/dashboards/program-overview" );
    }
    
    public void iSelectFilterInFilterOptions(String filter){
    	clickElement(driver.findElement(By.cssSelector("#"+filter+"FilterObj .filter-root-header.all-selected")));
    	clickElement(driver.findElement(By.cssSelector("#"+filter+"FilterObj .filter-root-selection-label")));
    }
    
    public void iClickOnDateRangeFilter(){
    	clickElement(driver.findElement(By.cssSelector(".range-display")));
    }
    
    public void ISelectStartDateRangeDates(){
    	clickElement(driver.findElement(By.cssSelector(".start-calendar-dialog>div")));
    }
    
    public void ISelectEndDateRangeDates(){
    	clickElement(driver.findElement(By.cssSelector(".end-calendar-dialog>div")));
    }
    
    public void iSelectMonthInDateRange(String month,String range){
    	clickElement(driver.findElement(By.xpath("//div[text()='"+month+"']")));
    }
    
    public void iClickOnApplyButtonForDateRangeFilter(){
    	clickElement(driver.findElement(By.cssSelector(".apply-button")));
    }
    
    public void iClickOnEndMonthDate(String enddate){
    	WebElement element = driver.findElement(By.xpath("//div[text()='"+enddate+"']"));
    	scrollIntoViewByJS(element);
    	clickElement(driver.findElement(By.xpath("//div[text()='"+enddate+"']")));
    }
    
    public void iClickOnShowAllFiltersIcon(){
    	clickElement(driver.findElement(By.xpath(".//div[@class='pentaho-filterbutton']")));
    }
    
    public void iClickOnFiltersCountLabel(){
    	WebElement element = driver.findElement(By.cssSelector("#RPT001FilterCountLabel"));
    	scrollIntoViewByJS(element);
    	clickElement(driver.findElement(By.cssSelector("#RPT001FilterCountLabel")));
    }
    
    public void iVerifyPreselectedModelFilter(String text){
    	isElementVisible(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='["+text+"].["+text+"]']/span")));
    }
    
    public void iSeeModelFilterPreselected(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Model].[Model]']/span")),text);
    }
    
    public void iSeeParticipantIDFilterPreselected(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Episode Initiator].[Participant ID]']/span")),text);
    }
    public void iSeePostAcuteCategoryFilterPreselected(String text){
    	verifyTextForElement(driver.findElement(By.xpath("//div[@formula='[Post Acute Category.Post Acute Type].[Post Acute Category]']/span")),text);
    }
    
    public void iSeeBPIDFilterPreselected(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Episode Initiator].[BPID]']/span")),text);
    }
    
    public void iSeeBundleCodeFilterPreselected(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Bundle].[Bundle Code]']/span")),text);
    }
    
    public void iSeeDashboardAnchorCCNFilterPreselected(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Dashboard - Anchor Facility].[CCN]']/span")),text);
    }
    
    public void iSeeAnchorMonthFilterPreselected(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Anchor Month].[Anchor Month]']/span")),text);
    }
    
    public void iSeeUnderMeasuresField(String text,String field){
    	verifyTextForElement(driver.findElement(By.xpath(".//*[@class='gem-label'][text()='"+text+"']")),text);
    }
    
    public void iSeeUnderLevelTimeField(String text,String field){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@id='fieldListTreeContent'] //div[text()='"+text+"']")),text);
    }
    
    public void iSeeUnderNSOCLevelTimeField(String text,String field){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@id='fieldListTreeContent'] //div[@title='"+text+"']")),text);
    }
    
    public void iClickOnFirstNumberUnderEpisodesColumn(){
    	clickElement(driver.findElement(By.xpath("(//tbody/tr/td[1]/div/a)[1]")));
    }
    
    public void iClickOnEpisodeNumberUnderEpisodesColumnofSpendingClaimsReport(){
    	WebElement element = driver.findElement(By.cssSelector("a[href*='javascript:drill(0,164)']"));
    	scrollIntoViewByJS(element);
    	clickElement(driver.findElement(By.cssSelector("a[href*='javascript:drill(0,164)']")));
    }
    
    public void iClickOnEpisodesColumnNumberForEpisodewithDRGIssues(){
    	clickElement(driver.findElement(By.cssSelector("a[href*='javascript:drill(0,1)']")));
    }
    
    public void iShouldVerifyInEpisodesTable(String text){
    	WebElement element = driver.findElement(By.xpath(".//tr[@class='x-grid3-hd-row']/td/div[text()='"+text+"']"));
    	scrollIntoViewByJS(element);
    	isElementVisible(driver.findElement(By.xpath(".//tr[@class='x-grid3-hd-row']/td/div[contains(text(),'"+text+"')]")));
    }
    
    public void iRemoveDeefaultFilters(String field,String title){
    	clickElement(driver.findElement(By.xpath(".//div[@id='filter_["+title+"].["+field+"]'] //i[@class='filterAction pentaho-deletebutton']")));
    	wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector("#progressTooltipDiv")));
    }
    
    public void iSelectCurrentMonthInAnchorDischargeMonth(String text){
    	clickElement(driver.findElement(By.xpath(".//*[@id='FT_"+text+"_TIME']")));
    }
    
    public void iClickOnFiltersToggleButton(){
    	clickElement(driver.findElement(By.xpath("//*[@id='filterToolbarIndicator']")));
    }
    
    public void iClickOnLayoutToggleButton(){
    	clickElement(driver.findElement(By.xpath(".//*[@id='toolbar1.layoutToggle']")));
    }
    
    public void iClickOnEditToggleButton(){
    	clickElement(driver.findElement(By.xpath(".//*[@id='toolbar1.edit']")));
    }
    
    public void iSeePreselectedFilters(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//*[@class='gem-label'][text()='"+text+"']")),text);
    }
    
    public void iVerifyInitialSNFLengthOfStaySummaryReportsColumnTextAs(String tile){
        verifyAttributeForElementFromListByXpath("//table[@class='ZONE_columnAttributes'] //div[text()='"+tile+"']", "title", tile);
    }
    
    public void iSelectRadioButtonOfSelectFromList() {
        clickElement(driver.findElement(By.xpath("//div[@data-dojo-attach-point='typePicklistContainer']/input")));
    }

    public void iClickOnAnchorAdmissionMonth(String month){
    	clickElement(driver.findElement(By.xpath(".//*[@id='FT_"+month+"_TIME']")));
    }
    
    public void iShouldNotSeeReportName(String report){
    	verifyTextNotPresentForElementFromList(".ng-binding.ng-scope", report);
    }
    
    public void iSelectFromListOnFilterPage(){
    	clickElement(driver.findElement(By.cssSelector("#FT_filterTypeSelect")));
    }
    
    public void iClickOnNPRAGraphPoint(String npra){
    	String nprapath=".//*[@id='"+npra+"ChartObjprotovis']//*[name()='svg']/*[name()='g']/*[name()='g']/*[name()='g']/*[name()='g'][5]/*[name()='g']/*[name()='g'][3]/*[name()='circle'][1]";
    	clickElement(driver.findElement(By.xpath(nprapath)));
    }
    
    public void iVerifyInTheNewWindowAfterClickingOnGraph(String text){
    	delay();
    	iWillWaitToSee(By.xpath("//*[@id='RPT001ReportName']"));
    	verifyTextForElement(driver.findElement(By.xpath("//*[@id='RPT001ReportName']")), text);
    }
    
    public void iClickOnGrpahPointForPostAcuteUtilization(String text){
    	delay();
    	String path=".//*[@id='"+text+"ChartObjprotovis']//*[name()='svg']/*[name()='g']/*[name()='g']/*[name()='g']/*[name()='g'][6]/*[name()='g']/*[name()='g']/*[name()='g'][3]/*[name()='circle'][1]";
    	iWillWaitToSee(By.xpath(path));
    	clickElement(driver.findElement(By.xpath(path)));
    	delay();
    }
    
    public void iClickOnPostAcuteUtilizationGraphPoint(String text){
    	String path=".//*[@id='"+text+"ChartObjprotovis']//*[name()='svg']/*[name()='g']/*[name()='g']/*[name()='g']/*[name()='g'][6]/*[name()='g']/*[name()='g']/*[name()='g'][3]/*[name()='circle'][1]";
    	clickElement(driver.findElement(By.xpath(path)));
    }
    
    public void iClickOnOtherGraphPostAcuteUtilizationGraphPoint(String text){
    	String path=".//*[@id='"+text+"ChartObjprotovis']//*[name()='svg']/*[name()='g']/*[name()='g']/*[name()='g']/*[name()='g'][6]/*[name()='g']/*[name()='g']/*[name()='g'][3]/*[name()='circle'][1]";
    	clickElement(driver.findElement(By.xpath(path)));
    }
    
    public void iClickOnGrpahPointForSNFLengthOfStay(String text){
    	String path=".//*[@id='"+text+"ChartObjprotovis']//*[name()='svg']/*[name()='g']/*[name()='g']/*[name()='g']/*[name()='g'][6]/*[name()='g']/*[name()='g']/*[name()='g'][3]/*[name()='circle'][1]";
    	clickElement(driver.findElement(By.xpath(path)));
    }
    
    public void iClickOnGrpahPointForReadmissions(String text){
    	String path=".//*[@id='"+text+"ChartObjprotovis']//*[name()='svg']/*[name()='g']/*[name()='g']/*[name()='g']/*[name()='g'][6]/*[name()='g']/*[name()='g'][3]/*[name()='circle'][1]";
    	clickElement(driver.findElement(By.xpath(path)));
    }
    
    public void iClickOnGrpahPointForHome(String text){
    	String path=".//*[@id='"+text+"ChartObjprotovis']//*[name()='svg']/*[name()='g']/*[name()='g']/*[name()='g']/*[name()='g'][6]/*[name()='g']/*[name()='g']/*[name()='g'][3]/*[name()='circle'][3]";
    	clickElement(driver.findElement(By.xpath(path)));
    }
    
    public void iClickOnGrpahPointForreadmitperepisodeunderReadmissions(String text){
    	String path=".//*[@id='"+text+"ChartObjprotovis']//*[name()='svg']/*[name()='g']/*[name()='g']/*[name()='g']/*[name()='g'][6]/*[name()='g']/*[name()='g'][3]/*[name()='circle'][2]";
    	clickElement(driver.findElement(By.xpath(path)));
    }
    
    public void iEnterAnchorAdmissionQuarterInSearchField(String text){
    	iFillInText(driver.findElement(By.cssSelector("#FT_searchText")), text);
    }
    
    public void iClickOnFindButtonAfterEnteringAnchorAdmissionQuarter(){
    	clickElement(driver.findElement(By.cssSelector("#FT_searchBy")));
    }
    
    public void iVerifyAnchorAdmissionYearPreSelectedFilter(String text){
    	verifyTextForElement(driver.findElement(By.xpath("//div[@class='filterItem'][@formula='[Anchor Hospital Admit Date].[Anchor Hospital Admit Date]']/span")),text);
    }
    
    public void iClickOnFacilityFilterUnderFilterOptions(String facility){
    	delay();
    	iWillWaitToSee(By.cssSelector("#"+facility+"FilterObj .filter-root-header.all-selected"));
    	clickElement(driver.findElement(By.cssSelector("#"+facility+"FilterObj .filter-root-header.all-selected")));
    }
    
    public void iUncheckAllOptionForFacilityFilter(String text){
    	clickElement(driver.findElement(By.cssSelector("#"+text+"FilterObj .filter-root-selection-label")));
    }
    
    public void iSelectFaciltyFromFacilityFilterUnderProgramOverviewReport(String text){
    	iWillWaitToSee(By.xpath("//div[@id='facilityFilterObj']//div[@title='"+text+"']"));
    	clickElement(driver.findElement(By.xpath("//div[@id='facilityFilterObj']//div[@title='"+text+"']")));
    }
    
    public void iClickOnApplyButtonUnderFaciltyFilterOptions(){
    	clickElement(driver.findElement(By.cssSelector(".filter-btn-apply.dirty")));
    	delay();
    }
    
    public void iClickOnTableViewOptionUnderViewFilter(String text){
    	delay();
    	clickElement(driver.findElement(By.xpath("//button[text()='"+text+"']")));
    	delay();
    }
    
    public void iVerifyClaimsandeEcTextUnderOverallProgram(String text){
    	iWillWaitToSee(By.cssSelector("#episodesTitleClaimsECObj"));
    	verifyTextForElement(driver.findElement(By.cssSelector("#episodesTitleClaimsECObj")),text);
    }
    
    public void iShouldSeeEcandClaimsDatawithColorForEpisodesColumnUnderOverallProgram(String color){
    	isElementVisible(driver.findElement(By.xpath("//table[@id='episodesNPRATableClaimsECObjTable']//tbody/tr/td/font[@color='"+color+"']")));
    }
    
    public void iVerifyClaimsandEcTextUnderPostAcuteUtilization(String text){
    	verifyTextForElement(driver.findElement(By.cssSelector("#utilizationTitleClaimsECObj")),text);
    }
    
    public void iShouldSeeEcandClaimsDatawithColorForEpisodesColumnUnderPostAcuteUtilization(String color){
    	isElementVisible(driver.findElement(By.xpath("//table[@id='utilizationTableClaimsECObjTable']//tbody/tr/td/font[@color='"+color+"']")));
    }
    
    public void iVerifyClaimsandEcTextUnderSnfLengthOfStay(String text){
    	verifyTextForElement(driver.findElement(By.cssSelector("#daysSNFTitleClaimsECObj")),text);
    }
    
    public void iShouldSeeEcandClaimsDatawithColorForEpisodesColumnUnderSnfLengthOfStay(String color){
    	isElementVisible(driver.findElement(By.xpath("//table[@id='daysSNFClaimsECTableObjTable']//tbody/tr/td/font[@color='"+color+"']")));
    }
    
    public void iVerifyClaimsandEcTextUnderReadmissions(String text){
    	verifyTextForElement(driver.findElement(By.cssSelector("#readmitionsTitleClaimsECObj")),text);
    }
    
    public void iShouldSeeEcandClaimsDatawithColorForEpisodesColumnUnderReadmissions(String color){
    	isElementVisible(driver.findElement(By.xpath("//table[@id='readmitionsClaimsECTableObjTable']//tbody/tr/td/font[@color='"+color+"']")));
    }
    
    public void iVerifyDOBColumnValueFormat(String format,String text) throws ParseException{
        String DOB=getTextForElement(driver.findElement(By.xpath("(//*[@class='pivotTableRowLabelSection']//*[@formula='["+text+"].[DOB]']/div)[1]")));
        validateDateFormat(format,DOB);
    }
        
    public void iEnterInTheSearchFieldForFilters(String dob){
    	iFillInText(driver.findElement(By.cssSelector("#searchField")), dob);
    }    

    public void iVerifyDateRangeFilterInFilterOptions(String range){
    	verifyTextForElementWithMultipleSpaces(driver.findElement(By.cssSelector(".range-display>span")),range);
    }
    
    public void iClickOnYearTextBoxInsideDateRangeFilter(String year){
    	clickElement(driver.findElement(By.cssSelector(".precision-button-label")));
    	clickElement(driver.findElement(By.xpath("//tbody[@class='calendar-body']//td/div[normalize-space(.) = '"+year+"']")));
    }
    
    public void iClickOnParticiapntFieldFilterUnderFilterOptions(String participant,String text){
    	clickElement(driver.findElement(By.xpath("//div[@id='"+text+"FilterObj'] //div[text()='"+participant+"']")));
    }
    
    public void iVerifyParticipantFieldAfterApplyingFilter(String participant,String text) {
    	verifyTextForElementWithMultipleSpaces(driver.findElement(By.cssSelector("#"+text+"FilterObj .filter-root-info-selected-items")),participant);
    }
    
    public void iClickOnApplyButtonForFilterInFilterOptions(){
    	longDelay();
    	clickElement(driver.findElement(By.cssSelector(".filter-btn-apply.dirty")));
    }
    
    public void iEnterTheValueInSearchField(String part,String text){
    	iFillInText(driver.findElement(By.cssSelector("#"+text+"FilterObj .filter-filter-input")), part);
    }
    
    public void iClickOnAppearingFacilityAfterSearching(String text) {
    	clickElement(driver.findElement(By.xpath("//div[@id='facilityFilterObj']//div[@title='"+text+"']")));
    }
    
    public void iClickOnFilterUnderFilterOptions(String text){
    	WebElement element = driver.findElement(By.cssSelector("#"+text+"FilterObj .filter-root-header-label"));
    	scrollIntoViewByJS(element);
    	clickElement(driver.findElement(By.cssSelector("#"+text+"FilterObj .filter-root-header-label")));
    }
    
    public void iWaitforTheReportsEmbeddedIframeToLoad(){
    	iWillWaitToSee(By.xpath("//iframe[@class='embedded-iframe ng-scope']"));
    }
    
    public void iWillWaitToSeeReportNameInsideIframe(String reportname){
    	delay();
    	longDelay();
    	iWillWaitToSee(By.xpath("//*[@id='RPT001ReportName'][text()='"+reportname+"']"));
    	wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector("#progressTooltipDiv")));
    }
    
    public void iWaitToseeTile(String tile){
    	try{
    	iWillWaitToSee(By.xpath("//div[text()='"+tile+"']"));
    	}catch(Exception e){
	    	 ProgramPerformance.writer.print(System.lineSeparator());
	     }
    }
    
    public void iWaitToSeeUnderReportsTileText(String report){
    	iWillWaitToSee(By.xpath("//label[@class='dropdown-tile-label ng-binding'][text()='"+report+"']"));
    }
    
    public void iWaitForElementsToLoadInNewWindow(){
    	iWillWaitToSee(By.cssSelector(".x-grid3-header-inner"));
    }
    
    public void iWaitUntillRefreshButtonDisappeared(){
    	wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector("#progressTooltipDiv")));
    }
    
    public void iWaitUntillLoadingIconDisappears(){
    	longDelay();
    	wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector(".img.blockUIDefaultImg")));
    	delay();
    	longDelay();
    }
    
    public void iWaitToSeeOverallProgramUnderDashboardReport(String text){
    	iWillWaitToSee(By.xpath("//button[text()='"+text+"']"));
    	delay();
    }
    
    public void iWillWaitToSeeReportNameAfterClickingGraph(String reportname){
    	iWillWaitToSee(By.xpath("//*[@id='RPT001ReportName'][text()='"+reportname+"']"));
    }
    
    public void iWaitUntillLoadingMessageDisappearsIndideFrameInReports(){
    	wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector("#pageLoadingMessage")));
    }
    
    public void iClickOnAnchorFacilityTextFromFilterValueListSingleQuotes(String filterText){
        clickElement(driver.findElement(By.xpath("//*[starts-with(@id,'FT_AVA') and text()=\""+filterText+"\"]")));
    }
    
    public void iClickOnSelectColumnInNewWindowAfterClikingDrillThrough(String text){
    	clickElement(driver.findElement(By.xpath("//a[text()='"+text+"']")));
    }
    
    public void iVerifyTitleOnPopupAfterClickingSelectColumns(String text){
    	verifyTextForElement(driver.findElement(By.xpath("//td[text()='"+text+"']")),text);
    }
    
    public void iClickOnCheckBoxInEpisodeDrillThroughPopUp(String text,String type){
    	clickElement(driver.findElement(By.xpath("//div[@formula='["+type+"].["+text+"]']/input")));
    }
    
    public void iEnterValueInTextBoxUnderSelectDrillThroughColumns(String text){
    	iFillInText(driver.findElement(By.cssSelector("#searchFieldDrill")), text);
    }
    
    public void iVerifyTextUnderPhysicianDashboardReport(String text){
    	iWillWaitToSee(By.xpath("//div[contains(text(),'"+text+"')]"));
        verifyTextForElement(driver.findElement(By.cssSelector("#tableTitleObj")), text);
        longDelay();
    }
    
    public void iClickOnFirstNameUnderAttributedPhysicianColumn(){
    	delay();
    	longDelay();
    	clickElement(driver.findElement(By.cssSelector("#performanceTableObjTable>tbody>tr:first-child>td:first-child")));
    }
    
    public void iWillWaitToSeeAfterClickingAttributedPhysicianName(String text){
    	iWillWaitToSee(By.xpath("//div[contains(text(),'"+text+"')]"));
    }
    
    public void iVerifyScorecardsUnderPerformanceScoreCardDashboard(){
    	isElementVisible(driver.findElement(By.cssSelector("#topKPIRow>div")));
    }
    
    public void iVerifyScorecardUnderPerformanceScorecard(String text){
    	isElementVisible(driver.findElement(By.xpath("//div[contains(text(),'"+text+"')]/ancestor::div[@class='templateRow']")));
    	longDelay();
    }
    
    public void iVerifyInitiallyTop100PhysiciansLoaded(String text){
    	longDelay();
    	isElementVisible(driver.findElement(By.xpath("//div[contains(@class,'pentaho-toggle-button-horizontal-first')]/button[text()='"+text+"']")));
    }
    
    public void iVerifyPhysicianCountUnderAttributedPhysicians(int count){
    	verifyElementCount(("td.column0"), count);
    }
    
    public void iVerifyDiffernetCountButtonsOnDashboardPhyisician(String text){
    	verifyTextForElementFromListByXpath("//button[@name='render_phyRangeSelectorButton']", text);
    }
    
    public void iVerifyPaginationIsPresentAboveOnDashboardPhysicianPage(){
    	isElementVisible(driver.findElement(By.cssSelector("#performanceTableObjTable_paginate")));
    }
    
    public void iVerifyTabsAppearingUnderPaginationOnAbovePagination(String text){
    	verifyTextForElementfromList(".paginate_button", text);
    }
    
    public void iVerifyPaginationIsPresentBottomOnDashboardPhysicianPage(){
    	isElementVisible(driver.findElement(By.cssSelector(".col-sm-7>div")));
    }
    
    public void iVerifyTabsAppearingUnderPaginationOnBelowPagination(String text){
    	verifyTextForElementfromList(".col-sm-7>div>a", text);
    }
    
    public void iVerifyOneToHundreadAbovePhysicians(String text){
    	verifyTextForElement(driver.findElement(By.cssSelector("#performanceTableObjTable_info")),text);
    }
    
    public void iVerifyOneToHundreadBelowPhysicians(String text){
    	verifyTextForElement(driver.findElement(By.xpath("(//div[@class='dataTables_info'])[2]")),text);
    }
    
    public void iVerifyFilternameAppearingInScorecardPage(String text){
    	verifyTextForElementFromListByXpath("//div[@class='filter-title']", text);
    }
    
    public void iVerifyFilterBoxAppearingInScorecardPage(String text){
    	isElementVisible(driver.findElement(By.cssSelector("#"+text+"FilterObj .filter-root-header.all-selected")));
    }
    
    public void iVerifySpotlightColorBesideAttributedPhysicians(String text){
    	isElementVisible(driver.findElement(By.cssSelector(".circle."+text+"")));
    }
    
    public void iShouldVerifySpotlightsNotAppearingOnPhysicianDashboard(){
    	isElementNotPresentOnPage(".circle.green");
    }
    
    public void iShouldVerifySymbolInTheColumn(String symbol,String text){
    	isElementVisible(driver.findElement(By.xpath("//table[thead[tr[th[text()='"+text+"']]]] //td[contains(text(),'"+symbol+"')]")));
    }
    
    public void iVerifyTableIsAppearingAfterSelectingTableUnderPhysicianDashboardReport(String text){
    	isElementVisible(driver.findElement(By.xpath(".//*[@id='"+text+"TableObjTable']")));
    }
    
    public void iVerifySectionUnderPerformanceScorecardDashboard(String text){
    	iVerifyTextFromListOfElement(By.cssSelector(".groupTitlePhy"),text);
    }
    
    public void iVerifyTop5PerformanceTableOnPerformanceScorecardDashbaord(String text){
    	isElementVisible(driver.findElement(By.cssSelector("#top5"+text+"TableObjTable")));
    }
    
    public void iVerifyBarContainersUnderPostAcuteCareDischargeDisposition(){
    	isElementVisible(driver.findElement(By.cssSelector(".dataBarContainer>svg")));
    }
    
    public void iClickOnKpiBoxOnPerformanceScoreCardForDrillThrough(String text){
    	clickElement(driver.findElement(By.xpath("//div[div[contains(text(),'"+text+"')]]")));
    }
    
    public void iClickOnTop5TableUnderPerformanceScorecardDashboard(String text){
    	clickElement(driver.findElement(By.cssSelector("#top5"+text+"TableObjTable>tbody>tr:nth-child(1)")));
    }
    
    public void iClickOnBarGraphUnderPostAcuteDischargeDispositionSection(){
    	clickElement(driver.findElement(By.cssSelector("#postAcuteTableObjTable>tbody>tr:nth-child(1)")));
    }
    
    public void iVerifyActualValueInKpiBox(String text){
    	isElementVisible(driver.findElement(By.xpath("//div[contains(text(),'"+text+"')]/following-sibling::div[@class='value']")));
    }
    
    public void iVerifyAdjustedValueInKpiBox(String text){
    	isElementVisible(driver.findElement(By.xpath("//div[div[contains(text(),'"+text+"')]] //div[starts-with(@class,'var')]")));
    }
    
    public void iVerifyColumnUnderTop5PerformanceTable(String column,String text){
    	verifyTextForElement(driver.findElement(By.xpath("//table[@id='key"+text+"TableObjTable']//th[contains(text(),'"+column+"')]")),column);
    }
    
    public void iVerifySymbolOnKPIBox(String symbol,String kpibox){
    	isElementVisible(driver.findElement(By.xpath("//div[contains(text(),'"+kpibox+"')]/following-sibling::div[contains(text(),'"+symbol+"')]")));
    }
    
    public void iVerifySymbolForAdjustedValueOnKPIBox(String symbol,String kpibox){
    	isElementVisible(driver.findElement(By.xpath("//div[div[contains(text(),'"+kpibox+"')]] //div[starts-with(@class,'var')][contains(text(),'"+symbol+"')]")));
    }
    
    public void iVerifySymbolAppearingUnderAvgEpisodeCostInBundleTable(String symbol,String text){
    	isElementVisible(driver.findElement(By.xpath("//table[@id='key"+text+"TableObjTable']/tbody/tr/td[contains(text(),'"+symbol+"')]")));
    }
    
    public void iVerifyAttributedPhysicianColumnValuesCenterAlligned(){
    	VerifyElementCssProperty(By.cssSelector("#performanceTableObjTable>tbody>tr>td.column0"),"text-align");
    }
    
    public void iVerifyEpisodesColumnValuesCenterAlligned(){
    	VerifyElementCssProperty(By.cssSelector("#performanceTableObjTable>tbody>tr>td.column1"),"text-align");
    }
    
    public void iVerifyAvgEpisodeCostValuesCenterAlligned(){
    	VerifyElementCssProperty(By.cssSelector("#performanceTableObjTable>tbody>tr>td.column2"),"text-align");
    }
    
    public void iVerifyDischToSnfValuesCenterAlligned(){
    	VerifyElementCssProperty(By.cssSelector("#performanceTableObjTable>tbody>tr>td.column5"),"text-align");
    }
    
    public void iVerifySnfDaysValuesCenterAlligned(){
    	VerifyElementCssProperty(By.cssSelector("#performanceTableObjTable>tbody>tr>td.column8"),"text-align");
    }
    
    public void iVerifyEpsWithReadmitValuesCenterAlligned(){
    	VerifyElementCssProperty(By.cssSelector("#performanceTableObjTable>tbody>tr>td.column11"),"text-align");
    }
    
    public void iVerifyKPIBoxesValuesCenterAlligned(){
    	VerifyElementCssProperty(By.cssSelector(".value"),"text-align");
    }
    
    public void iVerifyEpsiodeVolumeColumnUnderPerformanceTable(String text){
    	VerifyElementCssProperty(By.cssSelector("#key"+text+"TableObjTable>tbody>tr>td.column1"),"text-align");
    }
    
    public void iVerifyAvgEpisodeCostColumnUnderPerformanceTable(String text){
    	VerifyElementCssProperty(By.cssSelector("#key"+text+"TableObjTable>tbody>tr>td.column2"),"text-align");
    }
    
    public  void iVerifyAvgTargetPriceColumnUnderPerformanceTable(String text){
    	VerifyElementCssProperty(By.cssSelector("#key"+text+"TableObjTable>tbody>tr>td.column3"),"text-align");
    }
    
    public void iVerifyAdjustedHistoricButtonOnPhysicianDashboardReport(){
    	isElementVisible(driver.findElement(By.xpath("//button[@name='render_benchmarkSelector']")));
    }
    
    public void iVerifyClaimsUnderDataSourceUnderPhysicianReport(String text){
    	isElementVisible(driver.findElement(By.xpath("//button[text()='"+text+"']")));
    }
    
    public void iVerifyFilterFieldAfterSearching(String text){
    	verifyTextForElement(driver.findElement(By.xpath("//div[@class='field measure dojoDndItem uncommon']")),text);
    }
    
    public void iVerifyInAvailableFieldsAfterSearchingUnderNextSiteOfCareSummary(String text){
    	verifyTextForElementFromListByXpath("//div[@class='field attribute dojoDndItem uncommon']",text);
    }
    
    public void IClickOnCloseToClearTextBox(){
    	clickElement(driver.findElement(By.cssSelector("#clearSearchField")));
    }
    
    public void iVerifyTextNotAppearingInDefaultMeasure(String text){
    	verifyTextNotPresentForElementFromList("div[type='measure']>div:nth-child(1)",text);
    }
    
    public void iShouldNotSeeUnderSearchedMeasuresResults(String text){
    	verifyTextNotPresentForElementFromList("#GROUP0DIV>div",text);
    }
    
    public void iVerifyHeaderNameCenterAlligned(String text){
    	delay();
    	VerifyElementCssProperty(By.xpath("//th[text()='"+text+"']"),"text-align");
    }
    
    public void iShouldNotSeeElementInTheFilterValueList(String text){
    	verifyTextNotPresentForElementFromList("#FT_valueList div",text);
    }
    
    public void iShouldSeeColumnAfterClickingAddToReport(String text){
    	WebElement element = driver.findElement(By.xpath("//td[@title='"+text+"']"));
    	scrollIntoViewByJS(element);
    	isElementVisible(driver.findElement(By.xpath("//td[@title='"+text+"']")));
    }
    
    public void iVerifyRowsNameUnderDRG(String text){
    	verifyTextForElementFromListByXpath("//td[@class='inner'][@formula='[DRG].[DRG]']",text);
    }
    
    public void iClickOnEpisodeNumberUnderEpisodesColumnofNextSiteOfCareSummaryReport(){
    	clickElement(driver.findElement(By.cssSelector("a[href*='javascript:drill(0,3)']")));
    }
    
    public void iClickOnEpisodeNumberUnderEpisodesColumnofInitialSNFLengthOfStaySummaryReport(){
    	clickElement(driver.findElement(By.cssSelector("a[href*='javascript:drill(0,2)']")));
    }
    
    public void iVerifyCheckboxIsCheckedForDrillThrough(String text,String type){
    	if ( driver.findElement(By.xpath("//div[@formula='["+type+"].["+text+"]']/input")).isSelected()){
    		clickElement(driver.findElement(By.id("dlgBtnSave")));
    	}
    }
    
    public void iSeeAnchorPostAcuteAdmissionYearFilterPreselected(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@formula='[Anchor Post Acute Admit Date].[Anchor Post Acute Admission Year]']/span")),text);
    }
    
    public void iSeeIsAnchorAdmissionFilterPreselected(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@formula='[isAnchorAdmission].[isAnchorAdmission]']/span")),text);
    }
    
    public void iVerifyReportTextNotPresent(String text){
        delay();
        verifyTextNotPresentForElementFromList("a.ng-binding.ng-scope", text);
    }
    
    public void iClickOnNumberOfEpisodesColumnUnderNsocModel3Report(){
    	clickElement(driver.findElement(By.cssSelector("a[href*='javascript:drill(0,0)']")));
    }
    
    public void iVerifyReportNameIsStillAppearingAfterWaitingForSomeTime(String text){
    	isElementVisible(driver.findElement(By.xpath("//*[@id='RPT001ReportName'][text()='"+text+"']")));
    }
    
    public void iVerifyColumnAfterClikingOnAddToReport(String text){
    	WebElement element = driver.findElement(By.xpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']//div[text()='"+text+"']"));
    	scrollIntoViewByJS(element);
    	isElementVisible(driver.findElement(By.xpath("//table[@class='ZONE_rowAttributes rowLabelHeaders']//div[text()='"+text+"']")));
    }
    
    public void iVerifyPayerFilterTextInPreselectedFilters(String text){
    	verifyTextForElement(driver.findElement(By.xpath("//div[@formula='[Episode Initiator].[Payer]']/span")),text);
    }
    
    public void iShouldNotSeePayerPreselectedTextInFilterList(String text){
    	verifyTextNotPresentForElementFromList("#RPT001filters>div>div>span", text);
    }
    
    public void iRemovePayerFieldFilterFromDefaultFilters(String text){
    	clickElement(driver.findElement(By.xpath("//div[@formula='[Episode Initiator].[Payer]']//i[@title='Remove filter']")));
    	wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector("#progressTooltipDiv")));
    }
    
    public void iVerifyNoDeafultFiltersAfterRemovingFilters(){
    	isElementNotPresentOnPage(".filters.dojoDndItem>div");
    }
    
    public void iVerifyPostAcuteTypeFilterTextInSelectedFilters(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Post Acute Category.Post Acute Type].[Post Acute Type]']/span")),text);
    }
    
    public void iVerifyNetworkTierTextInSelectedFilter(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Network Tier].[Network Tier]']/span")),text);
    }
    
    public void iVerifyDataInTheColumnsInsideReports(String data,String column){
    	verifyTextForElementFromListByXpath(("//td[@member='["+column+"].["+data+"]']/div"),data);
    }
    
    public void iVerifyFieldInTheLayoutSectionAfterAddToReport(String text){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='gem dojoDndItem']/div[text()='"+text+"']")));
    }
    
    public void iClickOnAvatarSymbolToClickOnMenu(){
    	clickElement(driver.findElement(By.cssSelector(".btn.btn-menu.valentino-icon-profile")));
    }
    
    public void iShouldNotSeeTextInListAfterClickingOnAvatar(String text){
    	verifyTextNotPresentForElementFromList("a.btn.btn-flyout-nav[type='submit']",text);
    }
    
    public void iClickOnTabUnderAvatar(String text){
    	clickElement(driver.findElement(By.xpath("//a[@class='btn btn-flyout-nav'][contains(text(),'"+text+"')]")));
    }
    
    public void iVerifyTextInTheAvatarList(String text){
    	verifyTextForElementWithMultipleSpaces(driver.findElement(By.xpath("//a[@class='btn btn-flyout-nav'][contains(text(),'"+text+"')]")),text);
    }
    
    public void iWillWaitToSeeAfterClickingHelpCenter(String text){
    	iWillWaitToSee(By.xpath("//h1[text()='"+text+"']"));
    }
    
    public void iShouldNotSeeLoginWidget(){
    	isElementNotPresentOnPage(".auth0-lock-widget-container");
    }
    
    public void iVerifyTabIsAppearingInTheReportingHomePage(String text){
    	verifyTextForElementfromList(".navigation.clearfix>li>a",text);
    }
    
    public void iClickOnTabOnReportingHelpCenter(String text){
    	clickElement(driver.findElement(By.xpath("//div[@class='navigation-wrapper nocontent'] //li/a[text()='"+text+"']")));
    }
    
    public void iVerifyTextUnderFieldsInReportingHelpCenter(String reportsTab,String text){
        verifyTextForElementFromListByXpath("//div[@id='contentBody'] //li[a[text()='"+reportsTab+"']]/ul/li/a", text);
    }
    
    public void iVerifyTextOnTheGlossaryPage(String text){
    	verifyTextForElementWithMultipleSpaces(driver.findElement(By.cssSelector(".row.collapse>p:nth-of-type(1)")),text);
    }
    
    public void iShouldSeeTermsAndConditionsListOnGlossaryPage(){
    	isElementVisible(driver.findElement(By.cssSelector(".GlossaryPageLink")));
    }
    
    public void iVerifyTitleOnTheReportingHelpCenterPage(String text){
    	verifyTextForElement(driver.findElement(By.cssSelector(".row.collapse>h1")),text);
    }
    
    public void iVerifyInFilterValueListAfterSelectingFilterOption(String text){
    	StringTokenizer st = new StringTokenizer(text,",");
    	while(st.hasMoreTokens()){
    		String verify=st.nextToken();
			verifyTextForElementfromList("#FT_valueList div", verify);
    	}		
    }
    
    public void iVerifyFieldUnderLayoutAfterAddingToReport(String text){
    	isElementVisible(driver.findElement(By.xpath(".//*[@class='gem-label'][text()='"+text+"']")));
    }
    
    public void iClickOnNumberUnderEpisodesColumnToVerifyDrillThrough(){
    	clickElement(driver.findElement(By.xpath("(//tbody/tr/td[1]/div/a)[1]")));
    }
    
    public void iVerifyTheEpisodeCountWithDrillThrough(){
    	String count=getTextForElement(driver.findElement(By.xpath("(//tbody/tr/td[1]/div/a)[1]")));
    	clickElement(driver.findElement(By.xpath("(//tbody/tr/td[1]/div/a)[1]")));
    	switchToNewWindow();
    	iWillWaitToSee(By.cssSelector(".x-grid3-header-inner"));
    	String number=getTextForElement(driver.findElement(By.cssSelector(".x-paging-info")));
    	number=number.substring(number.indexOf("of")+2).trim();
    	Assert.assertEquals(number, count);
    }
    
    public void iVerifyAnchorDischargeMonthFormat(String format) throws ParseException{
    	String Anchormonth=getTextForElement(driver.findElement(By.xpath("(//*[@class='pivotTableRowLabelSection']//*[@formula='[Anchor Post Acute Discharge Date].[Anchor Post Acute Discharge Month]']/div)[1]")));
    	validateDateFormat(format,Anchormonth);
    }
    
    public void iClickOnFieldUnderAvailableFieldsInReports(String text,String filter){
    	WebElement element = driver.findElement(By.xpath("//div[contains(@class,'field attribute dojoDndItem uncommon') and text() = '"+text+"']"));
    	scrollIntoViewByJS(element);
    	clickElement(driver.findElement(By.xpath("//div[contains(@class,'field attribute dojoDndItem uncommon') and text() = '"+text+"']")));
    	clickElement(driver.findElement(By.xpath("//div[contains(@class,'field attribute dojoDndItem uncommon') and text() = '"+text+"']/div")));
    }
    
    public void iVerifyNoDuplicateValuesInEligilityFilterFieldList(){
    	int count=getElementCount("#FT_valueList div");
    	Set list = new HashSet();
    	for(int i=1;i<=count;i++)
    	{
    		String eligible=getTextForElement(driver.findElement(By.cssSelector("#FT_valueList>div:nth-of-type("+i+")")));
   		    list.add(eligible);
    	}
    	Assert.assertEquals(count,list.size());
    }
    
    public void iVerifyAnchorDischrgeCareSettingFilterTextInSelectedFilters(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Dim Anchor Discharge Care Setting].[Anchor Hospital Discharge Care Setting]']/span")),text);
    }
    
    public void iVerifyNetworkTierAnchorDischargeTextInSelectedFilter(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Network Tier (Anchor Hospital Discharge)].[Network Tier (Anchor Hospital Discharge)]']/span")),text);
    }
    
    public void iClickOnDashboardAnchorCCNFilterField(String text){
    	WebElement element = driver.findElement(By.xpath("//div[@formula='[Dashboard - Anchor Facility].[CCN]']"));
    	scrollIntoViewByJS(element);
    	clickElement(driver.findElement(By.xpath("//div[@formula='[Dashboard - Anchor Facility].[CCN]']")));
    	clickElement(driver.findElement(By.xpath("//div[@formula='[Dashboard - Anchor Facility].[CCN]']/div")));
    }
    
    public void iClickOnFieldInLayoutSectionToOpenList(String text){
    	clickElement(driver.findElement(By.xpath("//div[@formula='[Episode Initiator].[Episode Initiator]']/div[@class='gemMenuHandle scalable']")));
    }
    
    public void iClickOnRemoveFromReportInTheList(){
    	clickElement(driver.findElement(By.xpath(".//td[@id='PM:removeAttr_text']")));
    }
    
    public void iVerifyTextNotPresentInTheReportsTable(String text){
    	isElementNotPresentOnPage(By.xpath("//div[@class='resize'] //div[text()='"+text+"']"));
    }
    
    public void iSeeAnchorHospitalAdmissionYearFilterPreselected(String text){
    	verifyTextForElement(driver.findElement(By.xpath("//div[@formula='[Anchor Hospital Admit Date].[Anchor Hospital Admission Year]']/span")),text);
    }
    
    public void iSeeAnchorDischargeDateKeyFilterPreselected(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@formula='[anchor Discharge Date Key].[anchor Discharge Date Key]']/span")),text);
    }
    
    public void iClickonEpisodesFieldUnderDefaultMeasuresToOpenList(){
    	clickElement(driver.findElement(By.xpath("//div[@formula='[Measures].[# Episodes]'][@type='measure'] //div[@class='gemMenuHandle scalable']")));
    }
    
    public void iShouldVerifyInEpisodesDrillThroughColumnsPopUp(String text){
    	WebElement element = driver.findElement(By.xpath("//div[@class='fieldDrill attribute uncommon'][text()='"+text+"']"));
    	scrollIntoViewByJS(element);
    	isElementVisible(driver.findElement(By.xpath("//div[@class='fieldDrill attribute uncommon'][text()='"+text+"']")));
    }

	public void ichooseremovereportoptionfromselectoptionoffilterfield() {
		WebElement element = driver.findElement(By.xpath("//*[@id='PM:removeAttr_text']"));
    	scrollIntoViewByJS(element);
		clickElement(driver.findElement(By.xpath("//*[@id='PM:removeAttr_text']")));
	}

	public void isearchforthefieldfromavailablefield(String text) {
		iFillInText(driver.findElement(By.cssSelector("#searchField")),text);
	}

	public void iclickfilterfieldinlayoutsection(String filterTitle,String filterField) {
		clickElement(driver.findElement(By.xpath("//div[contains(@id,'gem_["+filterField+"].["+filterTitle+"]')]/div[@class='gemMenuHandle scalable']")));
		delay();
		delay();
    }

    public void iVerifyTextOnTheFAQPage(String text){
    	verifyTextForElementWithMultipleSpaces(driver.findElement(By.cssSelector(".row.collapse>h1:nth-of-type(1)")),text);
    }
    
    public void iShouldSeeFAQListOnFAQPage(){
    	isElementVisible(driver.findElement(By.cssSelector(".row.collapse>ul>li>a")));
    }
    
    public void iWillWaitUntillLoadingMessageDisappears(){
    	wait.until(ExpectedConditions.invisibilityOfElementLocated(By.cssSelector("#pageLoadingMessage")));
    }
    

    public void iVerifySeachFieldOnPerformanceEvaluationByPhysicianPage(){
    	isElementVisible(driver.findElement(By.cssSelector("#performanceTableObjTable_filter>label>input")));
    }
    
    public void iVerifyAttributedPhysicianFilterOnPhysicianPage(){
    	longDelay();
    	isElementVisible(driver.findElement(By.cssSelector("#physicianFilterObj")));
    }
    
    public void iVerifyFilterNotHavingTheTextOnScoreCardPage(String filter,String text){
    	verifyTextNotPresentForElementFromList("#"+filter+"FilterObj .filter-root-info-selected-item",text);
    }
    
    public void iClickOnAttributedPhyisicanCorrespondingToColor(String color){
    	clickElement(driver.findElement(By.xpath("(//div[@class='circle "+color+"']/../../preceding-sibling::td[contains(@class, 'linkToScorecard')])[1]")));
    }
    
    public void iVerifyTextColorOnScorecardsOnPerformanceScorecardPage(String color){
    	isElementVisible(driver.findElement(By.xpath("//div[@class='var "+color+"']")));
    }
    
    public void iVerifyMessageAsPerColorOnScorecards(String message,String color){
    	verifyTextForElementFromListByXpath("//div[@class='var "+color+"']/following-sibling::div[text()='"+message+"']",message);
    }
    
    public void iVerifyTextBesideTheSearchBoxOnPhysicianDashboardReport(String text){
    	isElementVisible(driver.findElement(By.xpath("//label/span[text()='"+text+"']")));
    }
    
    public void iVerifyTextNotAppearingUnderPhysicianScoreCard(String text){
    	isElementNotPresentOnPage(By.xpath("//*[text()='"+text+"']"));
    }
    
    public void iVerifyTextNotPresentInFilterSections(String text){
    	isElementNotPresentOnPage(By.xpath("//*[text()='"+text+"']"));
    }
    
    public void iVerifyApPlyButtonIsNotClickableAfterDesectingAll(String text){
    	driver.findElement(By.cssSelector("#"+text+"FilterObj .filter-btn-apply.pristine")).isEnabled();
    }
    
    public void iSelectNameInFilterAndVerifySmeNameOnScoreCardPage(String text){
    	String physician=getTextForElement(driver.findElement(By.xpath("(//div[@id='"+text+"FilterObj'] //div[@class='filter-item-label'])[1]")));
    	clickElement(driver.findElement(By.xpath("(//div[@id='"+text+"FilterObj'] //div[@class='filter-item-label'])[1]")));
    	delay();
    	verifyTextForElementWithMultipleSpaces(driver.findElement(By.xpath(".//*[@id='tableTitleObj']")), "Performance Scorecard : "+physician+" 2016Q4 - 2017Q3");
    }
    
    public void iClickOnLinkUnderPerformanceScoreCardPage(String text){
    	clickElement(driver.findElement(By.xpath("//button[text()='"+text+"']")));
    }
     
    public void iVerifyToggleButtonOnPhysicianDashboard(String text,String value){
    	isElementVisible(driver.findElement(By.xpath("//button[text()='"+text+"']")));
    	driver.findElement(By.xpath("//button[text()='"+text+"']")).isSelected();
    }
    
    public void iClickOnRadioButtonOnPhysicianDashboard(String text,String value){
    	clickElement(driver.findElement(By.xpath("//button[text()='"+text+"']")));
    	longDelay();
    }
    
    public void iVerifyColumnNameOnScoreCardPage(String text){
    	WebElement element = driver.findElement(By.xpath("//td[text()='"+text+"']"));
    	scrollIntoViewByJS(element);
    	verifyTextForElementFromListByXpath("//td[text()='"+text+"']",text);
    }
    
    public void iVerifyColumnAppearingUnderQuaterlyPerformanceTable(String text){
    	isElementVisible(driver.findElement(By.xpath("//table[@id='qtrPerfTableObjTable']//th[text()='"+text+"']")));
    }
    
    public void iverifyColumnNameAppearingUnderEpisodesVolume(String text){
    	isElementVisible(driver.findElement(By.xpath("//table[@id='dummyTableObjTable']//th[text()='"+text+"']")));
    }
    
    public void iVerifyColumnNotPresentOnThePerformanceScoreCardPage(String text){
    	isElementNotPresentOnPage(By.xpath("//th[text()='"+text+"']"));
    }
    
    public void iVerifyColumnUnderTableOnScoreCardPage(String text,String table){
    	isElementVisible(driver.findElement(By.xpath("//table[@id='"+table+"ObjTable'] //th[text()='"+text+"']")));
    }
    
    public void iVerifyElementOnNewWindowOnClickingLMJLink(String text){
    	isElementVisible(driver.findElement(By.xpath("//div[contains(text(),'"+text+"')]")));
    }
    
    public void iVerifySectionOnOverallPerformancePage(String text){
    	verifyTextForElementWithMultipleSpaces(driver.findElement(By.cssSelector("#qtrPerfTitleColumn")),text);
    }
    
    public void iVerifyIsAppearingOnOverallPerformancePage(String text){
    	isElementVisible(driver.findElement(By.xpath("//th[text()='"+text+"']")));
    }
    
    public void iVerifyTextInPerformanceComaprisonTable(String text,String drg){
    	verifyTextForElementFromListByXpath("//table[@id='qtrPerf"+drg+"TableObjTable'] //th[text()='"+text+"']",text);
    }
    
    public void iVerifyNamesOnPerformanceComparisonTable(String text,String drg){
    	WebElement element = driver.findElement(By.xpath("//table[@id='qtrPerf"+drg+"TableObjTable'] //td[text()='"+text+"']"));
    	scrollIntoViewByJS(element);
    	isElementVisible(driver.findElement(By.xpath("//table[@id='qtrPerf"+drg+"TableObjTable'] //td[text()='"+text+"']")));
    }
    
    public void iVerifyTheNamesInsideTheComaprisonTables(String text,String drg){
    	WebElement element = driver.findElement(By.xpath("//div[@id='qtrPerf"+drg+"Column'] //th[text()='"+text+"']"));
    	scrollIntoViewByJS(element);
    	isElementVisible(driver.findElement(By.xpath("//div[@id='qtrPerf"+drg+"Column'] //th[text()='"+text+"']")));
    }
    
    public void iVerifyCurrentAndSystemInsidePerformanceComparison(String text,String drg){
    	WebElement element = driver.findElement(By.xpath("//table[@id='qtrPerf"+drg+"TableObjTable'] //th[text()='"+text+"']"));
    	scrollIntoViewByJS(element);
    	isElementVisible(driver.findElement(By.xpath("//table[@id='qtrPerf"+drg+"TableObjTable'] //th[text()='"+text+"']")));
    }
    
    public void iVerifyDataUnderFractureAndNonFractureColumns(String text,String drg){
    	for(int i=1;i<=10;i++){
    		for(int j=2;j<=5;j++){
    			verifyTextForElementFromListByXpath(".//*[@id='qtrPerf"+drg+"TableObjTable']/tbody/tr["+i+"]/td["+j+"]",text);
    		}
    	}
    }
    
    public void iFetchValueOfEpisodesFromFirstPhysician(){
    	episodes=getTextForElement(driver.findElement(By.xpath("(//td[contains(@class,'numeric')])[1]")));
    }
    
    public void iVerifyFetchedEpisodeIsSameInEpisodesKPIBox(){
    	verifyTextForElementFromListByXpath("//div[text()=' Episodes (Eps) ']/following-sibling::div[@class='value']",episodes);
    }
    
    public void iVerifySameEpisodesDataIsAppearingUnderOverallPerformanceInQuaterlyPerformanceTable(){
    	verifyTextForElementFromListByXpath("//td[text()='Episodes (Eps)']/following-sibling::td[contains(@class,'column5')]",episodes);
    }
    
    public void iClickOnReportUnderModuleInReports(String report,String module){
    	selectElementByTextDescByXpath("//div[label[text()='"+module+"']]/following-sibling::div/a", report);
    }
    
    public void iVerifyNotAppearingInsideColumnsInReports(String value,String field){
    	WebElement element = driver.findElement(By.xpath("//td[@class='pivotTableRowLabelSection']//td[contains(@formula,'"+field+"')]/div"));
    	scrollIntoViewByJS(element);
    	verifyTextNotPresentForElementFromListByXpath("//td[@class='pivotTableRowLabelSection']//td[contains(@formula,'"+field+"')]/div",value);
    }
    
    public void iVerifyDRGCodeTextInSelectedFilter(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[contains(@class,'filterItem')][@formula='[DRG].[DRG Code]']/span")),text);
    }
    
    public void iRemoveTheTheFieldFromReportColumn(String text){
    	WebElement element = driver.findElement(By.xpath("//td[@title='"+text+"']"));
    	scrollIntoViewByJS(element);
    	new Actions(driver).contextClick(driver.findElement(By.xpath("//td[@title='"+text+"']"))).build().perform();
    	longDelay();
    	clickElement(driver.findElement(By.xpath(".//*[@id='PM:removeMetric_text']")));
    	longDelay();
    }
    
    public void iVerifyIsNoTAppearinGInTheAddedField(String text,String field){
    	String content=getTextForElement(driver.findElement(By.cssSelector("#RPT001StatusBar")));
    	String count=getLastnCharacters(content,2);
    	System.out.println(count);
    	int result=Integer.parseInt(count);
    	System.out.println(result);
    	int originalnumber=result-1;
    	System.out.println(originalnumber);
    	WebElement element = driver.findElement(By.xpath("//td[@title='"+field+"']"));
    	scrollIntoViewByJS(element);
    	verifyTextNotPresentForElementFromListByXpath("//div[@class='cells pivotTableDataContainer'] //tbody/tr/td[@colindex='"+originalnumber+"']",text);
    }
    
    public void iVerifyColumnAfterClickingAddToReport(String text){
    	WebElement element = driver.findElement(By.xpath("//div[@title='"+text+"']"));
    	scrollIntoViewByJS(element);
    	isElementVisible(driver.findElement(By.xpath("//div[@title='"+text+"']")));
    }
    
    public void iVerifyAnchorDischrgeCareSettingFilterTextInSelectedFiltersInSNFLOSReport(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Dim Anchor Discharge Care Setting].[Anchor Discharge Care Setting]']/span")),text);
    }
    
    public void iVerifyNetworkTierAnchorDischargeTextInSelectedFilterUnderSNFLOSReport(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@class='filterItem'][@formula='[Network Tier (Anchor Discharge)].[Network Tier (Anchor Discharge)]']/span")),text);
    }
    
    public void iClickOnFilterTextFormFilterValueListForAnchorHospitalFacility(String filterText){
        clickElement(driver.findElement(By.xpath("//*[starts-with(@id,'FT_AVA') and text()=\""+filterText+"\"]")));
    }
    
    public void iClickOnApplyButtonUnderFilterNameInFilterOptions(String button,String text){
    	longDelay();
    	clickElement(driver.findElement(By.xpath(".//*[@id='"+text+"FilterObj'] //button[contains(text(),'"+button+"')]")));
    }
    
    public void iVerifyDataAppearingAfterOpeningReport(){
    	isElementVisible(driver.findElement(By.xpath("//td[@class='pivotTableRowLabelSection']/div/table/tbody/tr")));
    	isElementVisible(driver.findElement(By.xpath("//td[@class='pivotTableRowLabelSection']/div/table/tbody/tr")));
    }
    
    public void iVerifyAnchorAdmissionYearDefaultFilter(String text){
    	verifyTextForElement(driver.findElement(By.xpath("//div[@class='filterItem'][@formula='[Anchor Hospital Admit Date].[Anchor Hospital Admission Year]']/span")),text);
    }
    
    public void iSeeAnchorPostAcuteAdmissionYearFilterPreselectedUnderEpisodeDrgIssuesReport(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@formula='[Anchor Post Acute Admit Date].[Anchor Post Acute Admission Year]']/span")),text);
    }
    
    public void iSeeAnchorPostAcuteAdmissionYearFilterPreselectedInIPECModel3(String text){
    	verifyTextForElement(driver.findElement(By.xpath(".//div[@formula='[Anchor Post Acute Admit Date].[Anchor Post Acute Admit Date]']/span")),text);
    }
}