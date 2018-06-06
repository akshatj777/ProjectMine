package com.remedy.userAdmin;

import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

/**
 * Created by salam on 7/29/15.
 */
public class UserAdminHomePage extends BaseClass {
WebDriverWait wait= new WebDriverWait(driver, 30);
	public UserAdminHomePage(WebDriver driver) {

		super(driver);
	}

	public void clickCreateUserButton() throws InterruptedException {
		if(DriverScript.Config.getProperty("Browser").equals("ie"))
		{
			delay();
			Thread.sleep(5000);
			iWillWaitToSee(By.xpath("//button[text()='Add User']"));
			((JavascriptExecutor)driver).executeScript("arguments[0].click();", driver.findElement(By.xpath("//button[text()='Add User']")));
		}
		else
		{
			delay();
			Thread.sleep(5000);
			iWillWaitToSee(By.xpath("//button[text()='Add User']"));
			clickElement(driver.findElement(By.xpath("//button[text()='Add User']")));
		}
	}

	public void clickImportUsers() {
		clickElement(driver.findElement(By.cssSelector(".btn.btn-primary.dark.margin-right-10")));
	}

	public void enterSerchUserText(String user) {
		iFillInText(driver.findElement(By.cssSelector(".elastic-input")), user);
		delay();
	}

	public void iClickOnSearchFilterField() {
		clickElement(driver.findElement(By.cssSelector(".ui-select-toggle")));
	}

	public void iSelectFacilityForFilter(String facility) {
		selectElementByDesc(".ui-select-choices-row", facility);
	}

	public void iClickonCardViewIcon() {
		clickElement(driver.findElement(By.cssSelector(".btn btn-secondary.rp-icon-card-view")));
	}

	public void iClickonTableViewIcon() {
		clickElement(driver.findElement(By.cssSelector(".btn.btn-secondary.rp-icon-table-view")));
	}

	public void iClickOnViewProfileIcon(int inx) {
		clickElement(driver.findElements(By.cssSelector(".rp-icon-expand")).get(inx));
	}

	public void iClickViewProfileLinkByIndex(int ind) {
		clickElement(driver.findElements(By.linkText("View Profile")).get(ind));
	}

	public void iClickCancelButton() {
		clickElement(driver.findElement(By.cssSelector(".btn.btn-secondary.pull-right")));
	}

	public void iSeeUserAdminPageHeader(String pageHeader) {

		iWillWaitToSee(By.xpath("//h1[text()='Users']"));
		isElementPresentOnPage(By.xpath("//h1[text()='Users']"));
	}

	public void iSeeCreateUserText(String createUser) {
		verifyTextForElement(driver.findElement(By.xpath("//button[@class='ui green right floated button add-user-button']")), createUser);
	}
	
	public void iSeeUserAdminPageLogo() {
		isElementVisible(driver.findElement(By.cssSelector(".flex-item.order-2.btn.logo.valentino-icon-program-admin")));
	
	}

	public void iSelectSortOption(String desc) {
		clickElement(driver.findElement(By.cssSelector(".sort-select")));
		selectElementByDesc(".ui-select-choices-row", desc);
	}

	public void iSeeSortOrderDefaultOption(String defaultoption) {
		verifyTextForElement(driver.findElement(By.cssSelector(".sort-select")), defaultoption);
	}

	public void iSeeRefreshIcon() {
		isElementVisible(driver.findElement(By.cssSelector(".btn.btn-reload")));
	}
	
	public void iSeeUsersCount() {
		isElementVisible(driver.findElement(By.xpath("//strong[@ng-hide='search.total == -1']")));
	}
	
	public void iVerifyUserCardCount(int cardCount) {
		verifyElementCount(".card-view-body", cardCount);
	}
	
	public void iSeeUserCards() {
		isElementVisible(driver.findElement(By.cssSelector(".card-view-body")));
	}
	
	public void iSeeFirstNameOnUserCard() {
		isElementVisible(driver.findElement(By.cssSelector("span[binding-id$='user.firstName']")));
	}
	
	public void iSeeLastNameOnUserCard() {
		isElementVisible(driver.findElement(By.cssSelector("span[binding-id$='user.lastName']")));
	}
	
	public void iSeeExpandButtonOnUserCard() {
		isElementVisible(driver.findElement(By.cssSelector(".btn.btn-quaternary.valentino-icon-expand.pull-right")));
	}
	
	public void iSeeRoleOnUserCard() {
		isElementVisible(driver.findElement(By.cssSelector("div[binding-id$='Role']")));
	}
	
	public void iSeeUserEmailOnUserCard() {
		isElementVisible(driver.findElement(By.cssSelector("div[binding-id$='user.email']")));
	}
	
	public void iSeeLockButtonOnUserCard() {
		isElementVisible(driver.findElement(By.cssSelector("button[ng-click^='lock']")));
	}
	
	public void iSeeUnLockButtonOnUserCard() {
		isElementVisible(driver.findElement(By.cssSelector("button[ng-click^='unlock']")));
	}

	public void iClickLoadMoreButton() {
		clickElement(driver.findElement(By.cssSelector(".btn.btn-auto-rounded")));
	}

	public void iverifyFirstNameText(String firstName) {
		verifyTextForElement(driver.findElement(By.xpath("//div[5]/div[1]/div/div[1]/div[2]/div/h3/span[1]/span")), firstName);
		longDelay();
	}

	public void iverifyLastNameText(String lastName) {
		verifyTextForElement(driver.findElement(By.xpath("//div[5]/div[1]/div/div[1]/div[2]/div/h3/span[2]/span")), lastName);
		longDelay();
	}

	public void iverifyOrganizationalRoleForAUser(String OrganizationalRole) {
		delay();
		verifyTextForElement(driver.findElement(By.cssSelector("div:nth-of-type(2)>div:nth-of-type(2)>div>div[ng-bind='::binding.value.name.value']")),	OrganizationalRole);
		longDelay();
	}

	public void iverifyUserSearchResult(String text) {
		driver.findElement(By.xpath("//strong[contains(text(),'"+text+"')]"));
	}
	
	public void iSeePagination() {
		delay();
		isElementVisible(driver.findElement(By.cssSelector(".page-selector.ng-binding")));
	}
	
	public void iSeeNextButtonAppearingBesidePaginatioN(String text){
		verifyTextForElement(driver.findElement(By.xpath("//span[text()='"+text+"']")),text);
	}
	
	public void iClickOnNextButtonBesidePaginationOnUserAdminHomePage(String next){
		clickElement(driver.findElement(By.xpath("//button[span[text()='"+next+"']]")));
	}
	
	public void iEnterNumberINPaginationInputBox(String number){
		iFillInText(driver.findElement(By.xpath("//input[@type='number']")), number);
	}
	
	public void iVerifyButtonOnUserAdminHomePage(String button){
		verifyTextForElementFromListByXpath("//span[text()='"+button+"']",button);
	}
	
	public void iVerifyTextForLockedUserAdminCards(String text){
		verifyTextForElementFromListByXpath("//strong[text()='"+text+"']",text);
	}
	
	public void iClickOnUnlockButtonOnUserAdminHomePage(String text){
		clickElement(driver.findElement(By.xpath("(//button[span[text()='"+text+"']])[2]")));
	}
	
	public void iVerifyUnlockCardsInformation(String text,String button){
		if ("".equals(button)){
   		 return;
   	}
   	else{
   		verifyTextForElement(driver.findElement(By.xpath("//strong[text()='"+text+"']")),text);
   	}   	
	}
	
	public void iShouldSeeImportUsersButton(String Importusers){
		verifyTextForElement(driver.findElement(By.cssSelector(".btn.btn-primary[feature='ua.importUsers']")), Importusers);
	}
}