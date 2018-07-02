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
	public static HashMap<String, HashMap<String, String>> bulkUsersNPIPerRole = new HashMap<String, HashMap<String, String>>();

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
		HashMap<String, String> bulkNPIPerRole = new HashMap<String, String>();
		applicationsList.put("Executive", "Episodes, Lessons, TCI");
		bulkEmailPerRole.put("Executive", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+-" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Manager", "Lessons, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Manager", "qaautomation+-" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("CASEMGRMAIL", "qaautomation+_" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Case Manager", "Reports, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Case Manager", "qaautomation+_" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Case Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+." + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Physicians", "Physician Connect, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkNPIPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Physicians", "qaautomation+." + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTCSMAIL", "qaautomation+'" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy TCS", "Episodes, Episodes 2.0, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy TCS", "qaautomation+'" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RLPNMAIL",
				"qaautomation+FirstNameeFirstNameeFirstNameeFirstN" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy LPN", "Episodes 2.0, Reports, Lessons, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy LPN",
				"qaautomation+FirstNameeFirstNameeFirstNameeFirstN" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy LPN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RRNMAIL",
				("qaautomation+" + randomString + "@remedypartners.com").toUpperCase());
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy RN", "Reports, TCI, Lessons");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy RN", ("qaautomation+" + randomString + "@remedypartners.com").toUpperCase());
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

		bulkNPIPerRole.put("Physicians", randomNPI);
		bulkUsersNPIPerRole.put("Super Admin-Physicians", bulkNPIPerRole);
		CreateUserPage.usersNPIPerRole.put("Super Admin-Physicians", bulkNPIPerRole);

		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
	}

	public void enterMultipleUserData(int userCount) throws Throwable {
		String strUserData = null;

		String randomString = null;
		if (userCount == 50) {
			try {
				strUserData = readContentForBulkUpload(51, 100);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
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
			bulkEmailPerRole.put("Prospective Partner Executive",
					"qaautomation+" + randomString + "@remedypartners.com");
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
			bulkEmailPerRole.put("Partner Program Administrator",
					"qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Program Administrator", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RPAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy Program Administrator",
					"Episodes, Episodes 2.0, Reports, Physician Connect, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy Program Administrator",
					"qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Program Administrator", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PTAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Partner Technical Administrator",
					"Episodes, Reports, Physician Connect, Administration, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Partner Technical Administrator",
					"qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Technical Administrator",
					applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RTAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy Technical Administrator",
					"Episodes, Episodes 2.0, Reports, Physician Connect, Administration, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy Technical Administrator",
					"qaautomation+" + randomString + "@remedypartners.com");
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

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("EXEMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			applicationsList.put("Executive", "Episodes, Lessons, TCI");
			bulkEmailPerRole.put("Executive", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Executive", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("MANMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Manager", "Lessons, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Manager", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("CMMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Case Manager", "Reports, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Case Manager", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Case Manager", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PHYMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Physicians", "Physician Connect, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Physicians", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemTCSMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy TCS", "Episodes, Episodes 2.0, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy TCS", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemLPNMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy LPN", "Episodes 2.0, Reports, Lessons, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy LPN", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy LPN", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemRNMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy RN", "Reports, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy RN", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy RN", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemFRNMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy Field RN", "TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy Field RN", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Field RN", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemPMMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy PM", "Episodes, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy PM", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy PM", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemSTMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy Sales Team", "Reports, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy Sales Team", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Sales Team", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemEid2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy Executive", "Episodes, Episodes 2.0, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy Executive", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Executive", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ParPEMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Prospective Partner Executive", "Lessons, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Prospective Partner Executive",
					"qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Prospective Partner Executive", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemOMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy Other", "Episodes, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy Other", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Other", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ParPAMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Partner Program Administrator", "Episodes, Physician Connect, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Partner Program Administrator",
					"qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Program Administrator", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemPAMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy Program Administrator", "Episodes 2.0, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy Program Administrator",
					"qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Program Administrator", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ParTAMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Partner Technical Administrator", "Administration, Lessons, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Partner Technical Administrator",
					"qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Technical Administrator",
					applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemTAMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy Technical Administrator", "Physician Connect, Administration, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy Technical Administrator",
					"qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Technical Administrator", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("TranCMid2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Transitional Case Manager", "Lessons, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Transitional Case Manager", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Transitional Case Manager", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Transitional Case Manager", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Transitional Case Manager", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("DownPMAIL2", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Downstream Provider", "Episodes, TCI");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Downstream Provider", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("EMAIL3", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList.put("Executive", "Episodes, Reports, TCI, Lessons");
			bulkEmailPerRole.put("Executive", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Executive", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Executive", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("MgMAIL3", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Manager", "Episodes, Reports, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Manager", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("CaMMAIL3", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Case Manager", "Episodes, Reports, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Case Manager", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Case Manager", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PMAIL3", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Physicians", "Episodes, Reports, Physician Connect, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Physicians", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RTranMAIL3", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy TCS", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy TCS", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyLPNMAIL3", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy LPN", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy LPN", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy LPN", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyRNMAIL3", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy RN", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy RN", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy RN", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyFRNMAIL3", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy Field RN", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy Field RN", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Field RN", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyPMMAIL3", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy PM", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy PM", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy PM", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedySTMAIL3", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy Sales Team", "Reports, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy Sales Team", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Sales Team", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyExMAIL3", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy Executive", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
			bulkEmailPerRole = new HashMap<String, String>();
			bulkEmailPerRole.put("Remedy Executive", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Executive", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);

		}

		if (userCount > 50) {
			try {
				strUserData = readContentForBulkUpload(51, 101);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("EXECUTIVEMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("CASEMGRMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RTCSMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RLPNMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RRNMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RFRNMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RPMMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RSTMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("REMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PPEMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ROMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PPAMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RPAMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PTAMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RTAMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("TCMMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("DPMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("EXEMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("MANMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("CMMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PHYMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemTCSMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemLPNMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemRNMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemFRNMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemPMMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemSTMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemEid2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ParPEMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemOMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ParPAMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemPAMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ParTAMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemTAMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("TranCMid2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("DownPMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("EMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("MgMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("CaMMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RTranMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyLPNMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyRNMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyFRNMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyPMMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedySTMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyExMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("abcdtrial3", "qaautomation+" + randomString + "@remedypartners.com");

		}

		String randomNPI = RandomStringUtils.randomNumeric(10);
		strUserData = strUserData.replace("NPI1", randomNPI);
		randomNPI = RandomStringUtils.randomNumeric(10);
		strUserData = strUserData.replace("NPI2", randomNPI);
		randomNPI = RandomStringUtils.randomNumeric(10);
		strUserData = strUserData.replace("NPI3", randomNPI);
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
		HashMap<String, String> bulkNPIPerRole = new HashMap<String, String>();
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
		bulkNPIPerRole = new HashMap<String, String>();
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
		bulkNPIPerRole.put("Physicians", randomNPI);
		bulkUsersNPIPerRole.put("Super Admin-Physicians", bulkNPIPerRole);
		CreateUserPage.usersNPIPerRole.put("Super Admin-Physicians", bulkNPIPerRole);
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

	public void iEnterDataAllAppPerRole(String role) {
		String strUserData = null;
		String randomString = null;
		HashMap<String, String> bulkEmailPerRole = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();

		if (role.equals("Partner Technical Administrator")) {
			try {
				strUserData = readContentForBulkUpload(17, 18);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PTAMAIL", "qaautomation+#$%^i" + randomString + "@remedypartners.com");
			String randomNPI = RandomStringUtils.randomNumeric(10);
			strUserData = strUserData.replace("NPI", randomNPI);
			iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
			iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);

		} else if (role.equals("Transitional Case Manager")) {
			try {
				strUserData = readContentForBulkUpload(41, 42);
			} catch (Exception e) {
				System.out.println(e);
			}

			String userRole = "Super Admin-Transitional Case Manager";
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());

			strUserData = strUserData.replace("TCMMAIL", email);
			String randomNPI = RandomStringUtils.randomNumeric(10);
			strUserData = strUserData.replace("NPI", randomNPI);
			iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
			iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
		}

		else if (role.equals("Downstream Provider M3")) {
			try {
				strUserData = readContentForBulkUpload(46, 47);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("DPMAILM3", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList.put("Downstream Provider", "Episodes,Episodes 2.0, TCI");
			bulkEmailPerRole.put("Downstream Provider", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
			String randomNPI = RandomStringUtils.randomNumeric(10);
			strUserData = strUserData.replace("NPI", randomNPI);
			iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
			iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
		} else if (role.equals("Downstream Provider M3AndDown")) {
			try {
				strUserData = readContentForBulkUpload(47, 48);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("DPMAILM3AndDown",
					"qaautomation+" + randomString + "@remedypartners.com");
			applicationsList.put("Downstream Provider", "Episodes,Episodes 2.0, TCI");
			bulkEmailPerRole.put("Downstream Provider", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
			String randomNPI = RandomStringUtils.randomNumeric(10);
			strUserData = strUserData.replace("NPI", randomNPI);
			iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
			iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
		} else if (role.equals("Physicians")) {
			try {
				strUserData = readContentForBulkUpload(27, 28);
			} catch (Exception e) {
				System.out.println(e);
			}
			String userRole = "Super Admin-Physicians";
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+" + randomString + "@remedypartners.com");
			applicationsList.put("Physicians", "Episodes,Episodes 2.0, TCI");
			bulkEmailPerRole.put("Physicians", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);

			String exisitingNPI = BulkUserCreationPage.bulkUsersNPIPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
			strUserData = strUserData.replace("NPI", exisitingNPI);
			iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
			iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
		}

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

	public void enterInvalidDataValues() {
		String strUserData = null;

		try {
			strUserData = readContentForBulkUpload(108, 120);
		} catch (Exception e) {
			System.out.println(e);
		}
		String randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL1", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("CASEMGRMAIL", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL1", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTCSMAIL", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RLPNMAIL", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL4", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL5", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL6", "qaautomation+" + randomString + "@remedypartners.com");

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
			strUserData = readContentForBulkUpload(104, 119);
		} catch (Exception e) {
			System.out.println(e);
		}
		String randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL1", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("CASEMGRMAIL", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL1", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTCSMAIL", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RLPNMAIL", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL3", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL2", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL3", "qaautomation+" + randomString + "@remedypartners.com");
		
		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL4", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL5", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL6", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL8", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL9", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL10", "qaautomation+" + randomString + "@remedypartners.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL11", "qaautomation+" + randomString + "@remedypartners.com");

		HashMap<String, String> bulkEmailPerRole = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();
		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("EXECUTIVEMAIL7", "qaautomation+" + randomString + "@remedypartners.com");
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

	public void validataSuccessAndFailuremsg(String error, String success) {
		iWillWaitToSee(By.xpath("//p[@class='successCountLabel']"));
		Assert.assertTrue(
				isElementPresentOnPage(By.xpath("//p[@class='successCountLabel'][text()='" + success + "']")));
		Assert.assertTrue(isElementPresentOnPage(By.xpath("//p[@class='errorCountLabel'][text()='" + error + "']")));

	}

	public void validateErrorMsgFor51Users(String text) {
		iWillWaitToSee(By.xpath("//*[contains(text(),'" + text + "')]"));
		isElementVisible(driver.findElement(By.xpath("//*[contains(text(),'" + text + "')]")));
	}

	public void enterUsersWithSameEmail() {
		String strUserData = null;
		try {
			strUserData = readContentForBulkUpload(25, 29);
		} catch (Exception e) {
			System.out.println(e);
		}
		HashMap<String, String> bulkEmailPerRole = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();

		String randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Manager", "Lessons, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Manager", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);

		strUserData = strUserData.replace("CASEMGRMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Case Manager", "Reports, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Case Manager", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Case Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);

		strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Physicians", "Physician Connect, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Physicians", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);

		strUserData = strUserData.replace("RTCSMAIL", "qaautomation+" + randomString + "@remedypartners.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy TCS", "Episodes, Episodes 2.0, TCI");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy TCS", "qaautomation+" + randomString + "@remedypartners.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);

		String randomNPI = RandomStringUtils.randomNumeric(10);
		strUserData = strUserData.replace("NPI", randomNPI);
		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);

	}

	public void editUser(String role) {
		String strUserData = null;
		String randomString = null;
		HashMap<String, String> bulkEmailPerRole = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();
		HashMap<String, String> bulkNPIPerRole = new HashMap<String, String>();
		if (role.equals("Executive")) {
			try {
				strUserData = readContentForBulkUpload(2, 3);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("EXECUTIVEMAIL", "qaautomation+" + randomString + "@remedypartners.com");
			strUserData = strUserData.replace(" Executive ", "Remedy Executive");
			strUserData = strUserData.replace("514083:2070-015:TSH", "441447:3056-r29:075296");
			applicationsList.put("Remedy Executive", "Episodes, Reports, TCI, Lessons");
			bulkEmailPerRole.put("Remedy Executive", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Executive", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);

		} else if (role.equals("Manager")) {
			try {
				strUserData = readContentForBulkUpload(3, 4);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+" + randomString + "@remedypartners.com");
			strUserData = strUserData.replace(" Manager ", "Remedy TCS");
			strUserData = strUserData.replace("ManagerFirstName", "FirstNameEdited");
			strUserData = strUserData.replace("ManagerLastName", "LastNameEdited");

			strUserData = strUserData.replace("9876545678", "");
			applicationsList.put("Remedy TCS", "Episodes, Reports, TCI, Lessons");
			bulkEmailPerRole.put("Remedy TCS", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);

		} else if (role.equals("Case Manager")) {
			try {
				strUserData = readContentForBulkUpload(4, 5);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("CASEMGRMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			strUserData = strUserData.replace("CaseManagerFirstName", "FirstNameEdited");
			strUserData = strUserData.replace("CaseManagerLastName", "LastNameEdited");

			strUserData = strUserData.replace("9879800980", "9879800978");

			strUserData = strUserData.replace(
					"776109:2070-005:HUMC | | | True| False | False | False | True |  | False | | False",
					"776109:2070-005:HUMC | | | False| True | False | False | False |  | False | | False");
			applicationsList.put("Case Manager", "Episodes, TCI");
			bulkEmailPerRole.put("Case Manager", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Case Manager", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);

		} else if (role.equals("Physicians")) {
			try {
				strUserData = readContentForBulkUpload(5, 6);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+" + randomString + "@remedypartners.com");
			strUserData = strUserData.replace(" Physicians ", " Manager ");
			strUserData = strUserData.replace("NPI", "");
			applicationsList.put("Manager", "Episodes, Reports, TCI, Lessons");
			bulkEmailPerRole.put("Manager", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);

		} else if (role.equals("Remedy TCS")) {
			try {
				strUserData = readContentForBulkUpload(6, 7);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RTCSMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			strUserData = strUserData.replace(
					"514025:2070-047:001 | | | True | True | True | False | False | True | False | |False ",
					"514083:2070-015:TSH  | | | False | True | False | True | False | True | False | | False");
			applicationsList.put("Remedy TCS", "Episodes, TCI, Lessons");
			bulkEmailPerRole.put("Remedy TCS", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);

		} else if (role.equals("Remedy LPN")) {
			try {
				strUserData = readContentForBulkUpload(7, 8);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RLPNMAIL", "qaautomation+" + randomString + "@remedypartners.com");
			strUserData = strUserData.replace("439245:ALL_BPIDS:ALL_FACILITIES", "441447:3056-r29:075296");
			applicationsList.put("Remedy LPN", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
			bulkEmailPerRole.put("Remedy LPN", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy LPN", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);

		} else if (role.equals("Remedy RN")) {
			try {
				strUserData = readContentForBulkUpload(8, 9);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RRNMAIL", "qaautomation+" + randomString + "@remedypartners.com");
			strUserData = strUserData.replace("RRNFirstName", "RRNFirstNameEdited");
			strUserData = strUserData.replace("RRNLastName", "RRNLastNameEdited");
			strUserData = strUserData.replace("9878909878", "9878900000");

			applicationsList.put("Remedy RN", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
			bulkEmailPerRole.put("Remedy RN", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy RN", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);

		}


		else if (role.equals("Remedy Field RN")) {
			try {
				strUserData = readContentForBulkUpload(9, 10);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RFRNMAIL", "qaautomation+" + randomString + "@remedypartners.com");
			strUserData = strUserData.replace(" Remedy Field RN ", " Remedy Executive ");

			applicationsList.put("Remedy Executive", "Episodes, Episodes 2.0, Reports, TCI, Lessons");
			bulkEmailPerRole.put("Remedy Executive", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Executive", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
		}
     else if (role.equals("Remedy PM")) {


			try {
				strUserData = readContentForBulkUpload(10, 11);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RPMMAIL", "qaautomation+" + randomString + "@remedypartners.com");

			
			strUserData = strUserData.replace(
					"441364:3056-k60:365973,441364:3056-k61:365860 | | | True| True | False | False | False | True | False | | False",
					"441364:3056-k60:365973,441364:3056-k61:365860 | | | False| False | True | True | True | True | False | | False");

			strUserData = strUserData.replace(
					"Learning Pathway 2, New learning Path, Clinical Operations Acute Care Hospital Model 2, Executive Acute Care Hospital Model 2",
					"Learning Pathway 2");
			applicationsList.put("Remedy PM", "Episodes 2.0, Reports, TCI, Lessons");
			bulkEmailPerRole.put("Remedy PM", "qaautomation+" + randomString + "@remedypartners.com");
			bulkUsersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy PM", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);
		}
		else if (role.equals("Remedy Sales Team")) {



            try {
                strUserData = readContentForBulkUpload(11, 12);
            } catch (Exception e) {
                System.out.println(e);
            }
            randomString = RandomStringUtils.randomAlphabetic(8);
            strUserData = strUserData.replace("RSTMAIL", "qaautomation+" + randomString + "@remedypartners.com");
            strUserData = strUserData.replace(" Remedy Sales Team ", " Remedy Executive ");
            strUserData = strUserData.replace("RSTFirstName", "RSTFirstNameEdited");
            strUserData = strUserData.replace("RSTLastName", "RSTLastNameEdited");
            strUserData = strUserData.replace("441371:ALL_BPIDS:ALL_FACILITIES", "441348:ALL_BPIDS:ALL_FACILITIES");
            
            applicationsList.put("Remedy Executive", "Episodes, Episodes 2.0, Reports, Lessons, TCI");
            bulkEmailPerRole.put("Remedy Executive", "qaautomation+" + randomString + "@remedypartners.com");
            bulkUsersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
            CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Executive", applicationsList);
            CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
        }
		else if (role.equals("Remedy Other")) {


            try {
                strUserData = readContentForBulkUpload(14, 15);
            } catch (Exception e) {
                System.out.println(e);
            }
            randomString = RandomStringUtils.randomAlphabetic(8);
            strUserData = strUserData.replace("ROMAIL", "qaautomation+" + randomString + "@remedypartners.com");
            strUserData = strUserData.replace(" Remedy Other ", " Manager ");
            strUserData = strUserData.replace("ROFirstName", "ROFirstNameEdited");
            strUserData = strUserData.replace("ROLastName", "ROLastNameEdited");
            strUserData = strUserData.replace("514022:2070-007:J", "441348:ALL_BPIDS:ALL_FACILITIES");
            
            applicationsList.put("Manager", "Episodes, Reports, TCI, Lessons");
           
            bulkEmailPerRole.put("Manager", "qaautomation+" + randomString + "@remedypartners.com");
            bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
            CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
            CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
        }
		else if (role.equals("Remedy Executive")) {

            try {
                strUserData = readContentForBulkUpload(12, 13);
            } catch (Exception e) {
                System.out.println(e);
            }
            randomString = RandomStringUtils.randomAlphabetic(8);
            strUserData = strUserData.replace("REMAIL", "qaautomation+" + randomString + "@remedypartners.com");
            strUserData = strUserData.replace(" Remedy Executive ", " Downstream Provider ");
            strUserData = strUserData.replace("439108:ALL_BPIDS:ALL_FACILITIES", "441369:3056-m03:365402");
            applicationsList.put("Downstream Provider", "Episodes, Episodes 2.0, TCI");
           
            bulkEmailPerRole.put("Downstream Provider", "qaautomation+" + randomString + "@remedypartners.com");
            bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
            CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
            CreateUserPage.usersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
        }
		else if (role.equals("Prospective Partner Executive")) {

            try {
                strUserData = readContentForBulkUpload(13, 14);
            } catch (Exception e) {
                System.out.println(e);
            }
            randomString = RandomStringUtils.randomAlphabetic(8);
            strUserData = strUserData.replace("PPEMAIL", "qaautomation+" + randomString + "@remedypartners.com");
            strUserData = strUserData.replace("PPEFirstName", "PPEFirstNameEdited");
            strUserData = strUserData.replace("PPELastName", "PPELastNameEdited");
            
            strUserData = strUserData.replace("| | Prospective Partner Executive", "|7676878998 | Prospective Partner Executive");
            strUserData = strUserData.replace("442503:ALL_BPIDS:ALL_FACILITIES", "439108:ALL_BPIDS:ALL_FACILITIES");
            applicationsList.put("Prospective Partner Executive", "Lessons, TCI");
            
            bulkEmailPerRole.put("Prospective Partner Executive",
                    "qaautomation+" + randomString + "@remedypartners.com");
            bulkUsersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);
            CreateUserPage.usersApplicationsPerRole.put("Super Admin-Prospective Partner Executive", applicationsList);
            CreateUserPage.usersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);
        }
		else if (role.equals("Partner Program Administrator")) {

            try {
                strUserData = readContentForBulkUpload(15, 16);
            } catch (Exception e) {
                System.out.println(e);
            }
            randomString = RandomStringUtils.randomAlphabetic(8);
            strUserData = strUserData.replace("PPAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
            strUserData = strUserData.replace("PPAFirstName", "PPAFirstNameEdited");
            strUserData = strUserData.replace("PPALastName", "PPALastNameEdited");
            strUserData = strUserData.replace(" Partner Program Administrator ", "Case Manager");
            strUserData = strUserData.replace("441445:3056-r26:1481", "439108:ALL_BPIDS:ALL_FACILITIES");
            
          
              applicationsList.put("Case Manager", "Episodes, Reports, TCI, Lessons");
               bulkEmailPerRole.put("Case Manager",
                    "qaautomation+" + randomString + "@remedypartners.com");
            bulkUsersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
            CreateUserPage.usersApplicationsPerRole.put("Super Admin-Case Manager", applicationsList);
            CreateUserPage.usersEmailPerRole.put("Super Admin-Case Manager", bulkEmailPerRole);
        }
		else if (role.equals("Remedy Program Administrator")) {

            try {
                strUserData = readContentForBulkUpload(16, 17);
            } catch (Exception e) {
                System.out.println(e);
            }
            randomString = RandomStringUtils.randomAlphabetic(8);
            strUserData = strUserData.replace("RPAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
            strUserData = strUserData.replace("RPAFirstName", "RPAFirstNameEdited");
            strUserData = strUserData.replace("RPALastName", "RPALastNameEdited");
            strUserData = strUserData.replace("441364:3056-k60:365973,441364:3056-k61:365860,441371:ALL_BPIDS:ALL_FACILITIES  | | | True | False | True | False | False | True | False | | False"
            		, "441364:3056-k60:365973,441364:3056-k61:365860,441371:ALL_BPIDS:ALL_FACILITIES  | | | False | False | False | True | True | True | False | | True");
            
            
            applicationsList.put("Remedy Program Administrator",
                    "Reports, Physician Connect, TCI, Lessons");
            
            bulkEmailPerRole.put("Remedy Program Administrator",
                    "qaautomation+" + randomString + "@remedypartners.com");
            bulkUsersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);
            CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Program Administrator", applicationsList);
            CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);
        }
		else if (role.equals("Partner Technical Administrator")) {

            try {
                strUserData = readContentForBulkUpload(17, 18);
            } catch (Exception e) {
                System.out.println(e);
            }
            randomString = RandomStringUtils.randomAlphabetic(8);
            strUserData = strUserData.replace("PTAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
            strUserData = strUserData.replace(" Partner Technical Administrator ", " Downstream Provider ");
            strUserData = strUserData.replace("572091:3056-r30:075278", "441369:3056-m03:365402,450306");
            applicationsList.put("Downstream Provider",
                    "Episodes, Episodes 2.0");
           
            bulkEmailPerRole.put("Downstream Provider",
                    "qaautomation+" + randomString + "@remedypartners.com");
            bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
            CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider",
                    applicationsList);
            CreateUserPage.usersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
        }
		else if (role.equals("Remedy Technical Administrator")) {

            try {
                strUserData = readContentForBulkUpload(18, 19);
            } catch (Exception e) {
                System.out.println(e);
            }
            randomString = RandomStringUtils.randomAlphabetic(8);
            strUserData = strUserData.replace("RTAMAIL", "qaautomation+" + randomString + "@remedypartners.com");
            strUserData = strUserData.replace(" Remedy Technical Administrator ", " Physicians ");
            strUserData = strUserData.replace("RTAFirstName", "RTAFirstNameEdited");
            strUserData = strUserData.replace("RTALastName", "RTALastNameEdited");
            strUserData = strUserData.replace("441448:3056-r31:075244,572091:3056-r30:075278,439104:2070-a48:070003 | | | True | False | False | False | False | True | True | | True"
            		, "441348:ALL_BPIDS:ALL_FACILITIES   | | | False | False | False | False | False | True | False | | True");
            
            strUserData = strUserData.replace("441448:3056-r31:075244,572091:3056-r30:075278,439104:2070-a48:070003", "441348:ALL_BPIDS:ALL_FACILITIES ");
            
            
            applicationsList.put("Physicians",
                    "Physician Connect, TCI");
           
            bulkEmailPerRole.put("Physicians",
                    "qaautomation+" + randomString + "@remedypartners.com");
            bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
            CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
            CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
        }
		
		
		
		
		
		
		
		String randomNPI = RandomStringUtils.randomNumeric(10);
		strUserData = strUserData.replace("NPI", randomNPI);
		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
	}

}
