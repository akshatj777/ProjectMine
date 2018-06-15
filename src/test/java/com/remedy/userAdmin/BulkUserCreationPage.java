package com.remedy.userAdmin;

import com.remedy.baseClass.BaseClass;

import org.junit.Assert;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import org.apache.commons.lang3.RandomStringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * Created by salam on 10/30/16.
 */
public class BulkUserCreationPage extends BaseClass {
	public static HashMap<String, HashMap<String, String>> bulkUsersEmailPerRole = new HashMap<String, HashMap<String, String>>();

	public BulkUserCreationPage(WebDriver driver) {
		super(driver);

	}

	public void iUplaodFile() {

		String filepath = (System.getProperty("user.dir") + "/src/test/java/com/remedy/resources/bulkUserCreation.txt");
		WebElement elem = driver.findElement(By.cssSelector(".button-import>button"));
		elem.sendKeys(filepath);

	}

	public void iVerifySuccssfulUserCreationMessage(String text) {

		verifyTextForElement(driver.findElement(By.xpath("//div[5]/div/div/div/div[2]/div/div[2]/div/span[2]")), text);
	}

	public void clickImportButton() {
		iWillWaitToSee(
				By.xpath("//div[@class='ui positive right floated buttons add-user-button']/div[@role='listbox']"));
		clickElement(driver.findElement(
				By.xpath("//div[@class='ui positive right floated buttons add-user-button']/div[@role='listbox']")));
		iWillWaitToSee(By.xpath(
				"//div[@class='ui positive right floated buttons add-user-button']//span[text()='Import Users']"));
		clickElement(driver.findElement(By.xpath(
				"//div[@class='ui positive right floated buttons add-user-button']//span[text()='Import Users']")));
	}

	public void clickTryAgain() {
		iWillWaitToSee(By.xpath("//button[text()='Try Again']"));
		clickElement(driver.findElement(By.xpath("//button[text()='Try Again']")));
	}

	public void enterData() throws IOException {
		String strUserData = null;
		try {
			strUserData = readContentForBulkUpload(24, 43);
		} catch (Exception e) {
			System.out.println(e);
		}
		String randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		HashMap<String, String> bulkEmailPerRole = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();
		applicationsList.put("Executive", "Episodes, Lessons, TCI");
		bulkEmailPerRole.put("Executive", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Manager", "Lessons, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Manager", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("CASEMGRMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Case Manager", "Reports, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Case Manager", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Case Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Physicians", "Episodes, Physician Connect, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Physicians", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTCSMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy TCS", "Episodes, Episodes 2.0, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy TCS", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RLPNMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy LPN", "Episodes 2.0, Reports, Lessons, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy LPN", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy LPN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RRNMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy RN", "Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy RN", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy RN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RFRNMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Field RN", "TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Field RN", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Field RN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RPMMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy PM", "Episodes, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy PM", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy PM", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RSTMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Sales Team", "Reports, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Sales Team", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Sales Team", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("REMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Executive", "Episodes, Episodes 2.0, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Executive", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PPEMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Prospective Partner Executive", "Lessons, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Prospective Partner Executive", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Prospective Partner Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("ROMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Other", "Episodes, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Other", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Other", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PPAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Partner Program Administrator", "Episodes, Physician Connect, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Partner Program Administrator", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Program Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RPAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Program Administrator", "Episodes 2.0, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Program Administrator", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Program Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PTAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Partner Technical Administrator", "Administration, Lessons, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Partner Technical Administrator", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Technical Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Technical Administrator", "Physician Connect, Administration, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Technical Administrator", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Technical Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("TCMMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Transitional Case Manager", "Lessons, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Transitional Case Manager", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Transitional Case Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Transitional Case Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Transitional Case Manager", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("DPMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Downstream Provider", "Episodes, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Downstream Provider", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);

		String randomNPI = RandomStringUtils.randomNumeric(10);
		strUserData = strUserData.replace("NPI", randomNPI);
		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
	}

	public void enterDataForAllApp() throws IOException {
		String strUserData = null;
		try {
			strUserData = readContentForBulkUpload(2, 21);
		} catch (Exception e) {
			System.out.println(e);
		}
		String randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		HashMap<String, String> bulkEmailPerRole = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();
		applicationsList.put("Executive", "Episodes, Reports, TCI, Lessons");
		bulkEmailPerRole.put("Executive", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Manager", "Episodes, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Manager", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("CASEMGRMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Case Manager", "Episodes, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Case Manager", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Case Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Physicians", "Episodes, Reports, Physician Connect, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Physicians", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTCSMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy TCS", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy TCS", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RLPNMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy LPN", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy LPN", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy LPN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RRNMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy RN", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy RN", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy RN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RFRNMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Field RN", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Field RN", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Field RN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RPMMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy PM", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy PM", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy PM", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RSTMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Sales Team", "Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Sales Team", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Sales Team", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("REMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Executive", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Executive", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PPEMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Prospective Partner Executive", "Lessons, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Prospective Partner Executive", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Prospective Partner Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("ROMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Other", "Episodes, Episodes 2.0, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Other", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Other", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PPAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Partner Program Administrator", "Episodes, Reports, Physician Connect, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Partner Program Administrator", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Program Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RPAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Program Administrator",
				"Episodes, Episodes 2.0, Reports, Physician Connect, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Program Administrator", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Program Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PTAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Partner Technical Administrator",
				"Episodes, Reports, Physician Connect, Administration, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Partner Technical Administrator", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Technical Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Technical Administrator",
				"Episodes, Episodes 2.0, Reports, Physician Connect, Administration, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Technical Administrator", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Technical Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("TCMMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Transitional Case Manager", "Episodes, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Transitional Case Manager", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Transitional Case Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Transitional Case Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Transitional Case Manager", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("DPMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Downstream Provider", "Episodes,Episodes 2.0, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Downstream Provider", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);

		String randomNPI = RandomStringUtils.randomNumeric(10);
		strUserData = strUserData.replace("NPI", randomNPI);
		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
	}

	public void clickSubmit() {
		iWillWaitToSee(By.xpath("//button[text()='Submit']"));
		clickElement(driver.findElement(By.xpath("//button[text()='Submit']")));

	}

	public void verifySuccessfulMessage(String text) {
		iWillWaitToSee(By.xpath("//div[@class='ui text loader']"));
		waitTo().until(
				ExpectedConditions.invisibilityOf(driver.findElement(By.xpath("//div[@class='ui text loader']"))));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//p[@class='successCountLabel'][text()='" + text + "']")));
	}

	public String readContentForBulkUpload(int from, int to) {
		String data = null;
		StringBuilder line = new StringBuilder();
		try {
			for (int i = from; i < to; i++) {
				line.append(Files
						.readAllLines(
								Paths.get(System.getProperty("user.dir") + "//src//test//Imports//BulkUpload.txt"))
						.get(i));
				line.append("\n");
			}
			data = line.toString();
			return data;
		} catch (Exception e) {
			System.out.println(e);
		}
		return data;
	}

	public void verifyHeaderText() {
		iWillWaitToSee(By.xpath("//h2/span[text()='Import Users']"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//h2/span[text()='Import Users']")));
	}

	public void verifyCrossButton() {
		Assert.assertTrue(isElementPresentOnPage(
				By.xpath("//*[name()='svg' and @fill='#48677b']//*[name()='g' and @id='iCons']")));
	}

	public void verifyDownloadButton() {
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//button[text()='Download Log']")));
	}

	public void verifyTryAgainButton() {
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//button[text()='Try Again']")));
	}

	public void verifyHideButton() {
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//button[text()='Hide']")));
	}

	public void clickHideButton() {
		iWillWaitToSee(By.xpath("//button[text()='Hide']"));
		driver.findElement(By.xpath("//button[text()='Hide']")).click();
	}

	public void iVerifyTestBoxField() {
		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		isElementPresentOnPage(By.xpath("//div[@class='component-neo-input']//textarea"));
	}

	public void iEnterSingleDataAllAppPerRole(String role) {
		String strUserData = null;
		String randomString = null;
		HashMap<String, String> bulkEmailPerRole = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();

		if (role.equals("Executive")) {
			try {
				strUserData = readContentForBulkUpload(55, 56);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("EXECUTIVEMAIL", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList.put("Executive", "Episodes, Reports, TCI, Lessons");
			bulkEmailPerRole.put("Executive", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Executive", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
		} 
		
		String randomNPI = RandomStringUtils.randomNumeric(10);
		strUserData = strUserData.replace("NPI", randomNPI);
		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);

	}

	public void iVerifySummarymsg(String text) {
		iWillWaitToSee(By.xpath("//*[contains(text(),'" + text + "')]"));
		if (text.contains("not")) {

			Assert.assertTrue(isElementPresentOnPage(By.xpath("//p[@class='errorCountLabel'][text()='" + text + "']")));
		} else {
			Assert.assertTrue(
					isElementPresentOnPage(By.xpath("//p[@class='successCountLabel'][text()='" + text + "']")));
		}
	}

	public void iEnterInvalidDPData() {
		String strUserData = null;
		
		try {
			strUserData = readContentForBulkUpload(46, 52);
		} catch (Exception e) {
			System.out.println(e);
		}
		String randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		HashMap<String, String> bulkEmailPerRole = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();
		applicationsList.put("Executive", "Episodes, Reports, TCI, Lessons");
		bulkEmailPerRole.put("Executive", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Manager", "Episodes, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Manager", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("CASEMGRMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Case Manager", "Episodes, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Case Manager", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Case Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
		
		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Physicians", "Episodes, Reports, Physician Connect, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Physicians", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTCSMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy TCS", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy TCS", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RLPNMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy LPN", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy LPN", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy LPN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);

		String randomNPI = RandomStringUtils.randomNumeric(10);
		strUserData = strUserData.replace("NPI", randomNPI);
		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
	}

	public void enterInvalidData() {
		String strUserData = null;
		try {
			strUserData = readContentForBulkUpload(2, 3);
		} catch (Exception e) {
			System.out.println(e);
		}
		String randomNPI = RandomStringUtils.randomNumeric(10);
		strUserData = strUserData.replace("NPI", randomNPI);
		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);

	}

	public void verifyErrorMessage(String text) {

		// iWillWaitToSee(By.xpath("//div[@class='ui text loader']"));
		iWillWaitToSee(By.xpath("//*[contains(text(),'not added')]"));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//p[@class='errorCountLabel'][text()='" + text + "']")));

	}

	public void iVerifyUserIsAdded(String userRole) {
		String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
				.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
		
		Assert.assertTrue(
				driver.findElement(By.xpath("//td[@class='five wide']")).getText().toString().trim().equals(email));
	}
	public void enterInvalidAndValidData() {
		String strUserData = null;
		try {
			strUserData = readContentForBulkUpload(2, 4);
		} catch (Exception e) {
			System.out.println(e);
		}
		String randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		HashMap<String, String> bulkEmailPerRole = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();
		applicationsList.put("Executive", "Episodes, Reports, TCI, Lessons");
		bulkEmailPerRole.put("Executive", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
		
		String randomNPI = RandomStringUtils.randomNumeric(10);
		strUserData = strUserData.replace("NPI", randomNPI);
		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);

	}
	 public void validataSuccessAndFailuremsg(String error, String success){
		 iWillWaitToSee(By.xpath("//p[@class='successCountLabel']"));
		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//p[@class='successCountLabel'][text()='" + success + "']")));
		 Assert.assertTrue(isElementPresentOnPage(By.xpath("//p[@class='errorCountLabel'][text()='" + error + "']")));

	    }
}