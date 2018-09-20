package com.remedy.userAdmin;

import com.remedy.baseClass.BaseClass;

import org.junit.Assert;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.StringTokenizer;

import org.apache.commons.lang3.RandomStringUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

/**
 * Created by salam on 10/30/16.
 */
public class BulkUserCreationPage extends BaseClass {
	public static HashMap<String, HashMap<String, String>> bulkUsersEmailPerRole = new HashMap<String, HashMap<String, String>>();
	static String bulkUsersNPIPerRole;

	public BulkUserCreationPage(WebDriver driver) {
		super(driver);
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
		strUserData = strUserData.replace("LEADERMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		HashMap<String, String> bulkEmailPerRole = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();
		HashMap<String, String> bulkNPIPerRole = new HashMap<String, String>();
		applicationsList.put("Leader", "Episode Connect, Episode Connect Classic, Remedy University, Care Innovation Institute");
		bulkEmailPerRole.put("Leader", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Leader", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Leader", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Leader", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+-" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Manager", "Episode Connect, Reporting Classic, Remedy University, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Manager", "qaautomation+-" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("ADVANCEDOPERATORMAIL", "qaautomation+_" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Advanced Operator", "Episode Connect, Episode Connect Classic, Remedy University, Reporting, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Advanced Operator", "qaautomation+_" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Advanced Operator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Advanced Operator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Advanced Operator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+." + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Physicians", "Episode Connect, Reporting Classic, Reporting, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Physicians", "qaautomation+." + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTCSMAIL", "qaautomation+'" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy TCS", "Episode Connect, Episode Connect for Post-acute Care, Community Connect, Care Connect, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy TCS", "qaautomation+'" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RLPNMAIL",
				"qaautomation+FirstNameeFirstNameeFirstNameeFirstN" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy LPN", "Episode Connect, Reporting Classic, Care Innovation Institute, Remedy University");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy LPN",
				"qaautomation+FirstNameeFirstNameeFirstNameeFirstN" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy LPN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RRNMAIL",
				("qaautomation+" + randomString + "@remedysystems.com").toUpperCase());
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy RN", "Episode Connect, Reporting Classic, Care Innovation Institute, Remedy University, Community Connect, Care Connect");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy RN", ("qaautomation+" + randomString + "@remedysystems.com").toUpperCase());
		bulkUsersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy RN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RFRNMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Field RN", "Episode Connect, Episode Connect Classic, Remedy University");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Field RN", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Field RN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RPMMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy PM", "Episode Connect, Episode Connect for Post-acute Care, Reporting Classic, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy PM", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy PM", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RSTMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Sales Team", "Episode Connect, Care Innovation Institute, Remedy University");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Sales Team", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Sales Team", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("REMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Executive", "Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Reporting, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Executive", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PPEMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Prospective Partner Executive", "Episode Connect, Remedy University, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Prospective Partner Executive", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Prospective Partner Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("ROMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Other", "Episode Connect, Community Connect, Care Connect, Reporting, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Other", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Other", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PPAMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Partner Program Administrator", "Episode Connect, Remedy University, Episode Connect for Post-acute Care, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Partner Program Administrator", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Program Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RPAMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Program Administrator", "Episode Connect, Reporting Classic, Care Innovation Institute, Reporting");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Program Administrator", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Program Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PTAMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Partner Technical Administrator", "Episode Connect, Administration, Remedy University, Reporting, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Partner Technical Administrator", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Technical Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTAMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Technical Administrator", "Episode Connect, Reporting Classic, Administration, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Technical Administrator", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Technical Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("OPERATORMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Operator", "Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Operator", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Operator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Operator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Operator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("DPMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Downstream Provider", "Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Downstream Provider", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);

		String randomNPI = "12" + RandomStringUtils.randomNumeric(8);
		strUserData = strUserData.replace("NPI", randomNPI);

		bulkNPIPerRole.put("Physicians", randomNPI);
		bulkUsersNPIPerRole = randomNPI;
		CreateUserPage.usersNPIPerRole.put("Super Admin-Physicians", bulkNPIPerRole);

		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
		System.out.println(strUserData);
		System.out.println(CreateUserPage.usersEmailPerRole.toString());
	}

	public void enterMultipleUserData(int userCount) throws Throwable {
		String strUserData = null;
		String randomString = null;
		if (userCount == 50) {
			try {
				strUserData = readContentForBulkUpload(46, 96);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("LEADERMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ADVANCEDOPERATORMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+" + randomString + "@remedysystems.com");
			strUserData = strUserData.replace("P1NPI1", "12"+RandomStringUtils.randomNumeric(8));

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RTCSMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RLPNMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RRNMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RFRNMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RPMMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RSTMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("REMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PPEMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ROMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PPAMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RPAMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PTAMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RTAMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("OPERATORMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("DPMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("EXEMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("MANMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("CMMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PHYMAIL2", "qaautomation+" + randomString + "@remedysystems.com");
			strUserData = strUserData.replace("P2NPI2", "12"+RandomStringUtils.randomNumeric(8));

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemTCSMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemLPNMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemRNMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemFRNMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemPMMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemSTMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemEid2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ParPEMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemOMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ParPAMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemPAMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ParTAMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemTAMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("TranCMid2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("DownPMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("EMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("MgMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("CaMMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PMAIL3", "qaautomation+" + randomString + "@remedysystems.com");
			strUserData = strUserData.replace("P3NPI3", "12"+RandomStringUtils.randomNumeric(8));

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RTranMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyLPNMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyRNMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyFRNMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyPMMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedySTMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyExMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("abcdtrial3", "qaautomation+" + randomString + "@remedysystems.com");

		}

		if (userCount > 50) {
			try {
				strUserData = readContentForBulkUpload(46, 97);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("LEADERMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ADVANCEDOPERATORMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RTCSMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RLPNMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RRNMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RFRNMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RPMMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RSTMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("REMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PPEMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ROMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PPAMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RPAMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PTAMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RTAMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("OPERATORMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("DPMAIL", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("EXEMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("MANMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("CMMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PHYMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemTCSMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemLPNMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemRNMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemFRNMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemPMMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemSTMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemEid2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ParPEMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemOMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ParPAMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemPAMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("ParTAMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemTAMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("TranCMid2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("DownPMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("EMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("MgMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("CaMMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("PMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RTranMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyLPNMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyRNMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyFRNMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyPMMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedySTMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RemedyExMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("abcdtrial3", "qaautomation+" + randomString + "@remedysystems.com");

			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("abcdUserNeg3", "qaautomation+" + randomString + "@remedysystems.com");
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
		strUserData = strUserData.replace("LEADERMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		HashMap<String, String> bulkEmailPerRole = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();
		HashMap<String, String> bulkNPIPerRole = new HashMap<String, String>();
		applicationsList.put("Leader", "Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute, Remedy University, Reporting");
		bulkEmailPerRole.put("Leader", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Leader", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Leader", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Leader", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Manager", "Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute, Remedy University, Reporting");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Manager", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("ADVANCEDOPERATORMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Advanced Operator", "Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute, Remedy University, Reporting");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Advanced Operator", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Advanced Operator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Advanced Operator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Advanced Operator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Physicians", "Episode Connect, Episode Connect Classic, Reporting Classic, Care Innovation Institute, Remedy University, Reporting");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Physicians", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTCSMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy TCS", "Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Reporting Classic, Care Innovation Institute, Remedy University, Community Connect, Care Connect");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy TCS", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy TCS", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy TCS", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RLPNMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy LPN", "Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Reporting Classic, Care Innovation Institute, Remedy University");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy LPN", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy LPN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy LPN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RRNMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy RN", "Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Reporting Classic, Care Innovation Institute, Remedy University, Community Connect, Care Connect");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy RN", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy RN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy RN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RFRNMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Field RN", "Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Reporting Classic, Care Innovation Institute, Remedy University");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Field RN", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Field RN", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Field RN", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RPMMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy PM", "Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Reporting Classic, Care Innovation Institute, Remedy University");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy PM", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy PM", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy PM", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RSTMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Sales Team", "Episode Connect, Reporting Classic, Care Innovation Institute, Remedy University");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Sales Team", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Sales Team", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Sales Team", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("REMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Executive", "Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Reporting Classic, Care Innovation Institute, Remedy University, Community Connect, Reporting");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Executive", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Executive", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PPEMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Prospective Partner Executive", "Episode Connect, Remedy University, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Prospective Partner Executive", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Prospective Partner Executive", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Prospective Partner Executive", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("ROMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Other", "Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Care Innovation Institute, Remedy University, Reporting Classic, Community Connect, Care Connect, Reporting");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Other", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Other", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Other", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PPAMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Partner Program Administrator", "Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Episode Connect for Post-acute Care, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Partner Program Administrator", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Program Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Program Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RPAMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Program Administrator","Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Reporting Classic, Care Innovation Institute, Remedy University, Reporting");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Program Administrator", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Program Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Program Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PTAMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Partner Technical Administrator","Episode Connect, Episode Connect Classic, Reporting Classic, Administration, Remedy University, Reporting, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Partner Technical Administrator", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Partner Technical Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Partner Technical Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTAMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Remedy Technical Administrator","Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Reporting Classic, Administration, Care Innovation Institute, Remedy University");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Remedy Technical Administrator", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy Technical Administrator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Remedy Technical Administrator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("OPERATORMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Operator", "Episode Connect, Episode Connect Classic, Reporting Classic, Remedy University, Reporting, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Operator", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Operator", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Operator", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Operator", bulkEmailPerRole);

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("DPMAIL", "qaautomation+" + randomString + "@remedysystems.com");
		applicationsList = new HashMap<String, String>();
		applicationsList.put("Downstream Provider", "Episode Connect, Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect, Care Innovation Institute");
		bulkEmailPerRole = new HashMap<String, String>();
		bulkEmailPerRole.put("Downstream Provider", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);

		String randomNPI = "12" + RandomStringUtils.randomNumeric(8);
		strUserData = strUserData.replace("NPI", randomNPI);
		bulkNPIPerRole.put("Physicians", randomNPI);
		bulkUsersNPIPerRole = randomNPI;
		CreateUserPage.usersNPIPerRole.put("Super Admin-Physicians", bulkNPIPerRole);
		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
		System.out.println(strUserData);
		System.out.println(CreateUserPage.usersEmailPerRole.toString());
	}

	public void clickSubmit() {
		iWillWaitToSee(By.xpath("//button[text()='Submit']"));
		clickElement(driver.findElement(By.xpath("//button[text()='Submit']")));
	}

	public void verifySuccessfulMessage(String text) {
		delay();
		if (driver.findElements(By.xpath("//div[@class='ui text loader']")).size() > 0) {
			iWillWaitToSee(By.xpath("//div[@class='ui text loader']"));
			WebDriverWait objWait = new WebDriverWait(driver, 500);
			objWait.until(ExpectedConditions.invisibilityOf(driver.findElement(By.xpath("//div[@class='ui text loader']"))));
		}
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
				if (!(i == to - 1)) {
					line.append("\n");
				}
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

	public void iEnterDataAllAppPerRole(String role) throws Throwable {
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
			strUserData = strUserData.replace("PTAMAIL", "qaautomation+#$%^i" + randomString + "@remedysystems.com");
			String randomNPI = RandomStringUtils.randomNumeric(10);
			strUserData = strUserData.replace("NPI", randomNPI);
			iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
			iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
		} else if (role.equals("Operator")) {
			try {
				strUserData = readContentForBulkUpload(41, 42);
			} catch (Exception e) {
				System.out.println(e);
			}
			String userRole = "Super Admin-Operator";
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
			strUserData = strUserData.replace("OPERATORMAIL", email);
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
			strUserData = strUserData.replace("PHYSICIANSMAIL", "qaautomation+" + randomString + "@remedysystems.com");
			applicationsList.put("Physicians", "Episode Connect Classic,Episode Connect for Post-acute Care, Care Innovation Institute");
			bulkEmailPerRole.put("Physicians", "qaautomation+" + randomString + "@remedysystems.com");
			bulkUsersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Physicians", bulkEmailPerRole);
			String exisitingNPI = BulkUserCreationPage.bulkUsersNPIPerRole;
			strUserData = strUserData.replace("NPI", exisitingNPI);
			iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
			iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
		} else if (role.equals("Remedy RN")) {
			try {
				strUserData = readContentForBulkUpload(8, 9);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("RRNMAIL", "qaautomation+" + randomString + "@remedysystems.com");
			strUserData = strUserData.replace("441348:ALL_BPIDS:ALL_FACILITIES", "439108;CJR-1;390168");
			String randomNPI = RandomStringUtils.randomNumeric(10);
			strUserData = strUserData.replace("NPI", randomNPI);
			iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
			iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
		} else if (role.equals("Downstream Provider M3")) {
			try {
				strUserData = readContentForBulkUpload(100, 101);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("DPMAILM3", "qaautomation+" + randomString + "@remedysystems.com");
			applicationsList.put("Downstream Provider", "Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect, Care Innovation Institute");
			bulkEmailPerRole.put("Downstream Provider", "qaautomation+" + randomString + "@remedysystems.com");
			bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
			String randomNPI = RandomStringUtils.randomNumeric(10);
			strUserData = strUserData.replace("NPI", randomNPI);
			iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
			iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
		} else if (role.equals("Downstream Provider M3AndDown")) {
			try {
				strUserData = readContentForBulkUpload(101, 102);
			} catch (Exception e) {
				System.out.println(e);
			}
			randomString = RandomStringUtils.randomAlphabetic(8);
			strUserData = strUserData.replace("DPMAILM3AndDown",
					"qaautomation+" + randomString + "@remedysystems.com");
			applicationsList.put("Downstream Provider", "Episode Connect Classic, Episode Connect for Post-acute Care, Remedy University, Community Connect, Care Innovation Institute");
			bulkEmailPerRole.put("Downstream Provider", "qaautomation+" + randomString + "@remedysystems.com");
			bulkUsersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
			CreateUserPage.usersEmailPerRole.put("Super Admin-Downstream Provider", bulkEmailPerRole);
			String randomNPI = RandomStringUtils.randomNumeric(10);
			strUserData = strUserData.replace("NPI", randomNPI);
			iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
			iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
		} else if (role.equals("Leader")) {
			enterMultipleUserData(51);
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
		strUserData = strUserData.replace("LEADERMAIL1", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("ADVANCEDOPERATORMAIL", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL1", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTCSMAIL", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RLPNMAIL", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL4", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL5", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL6", "qaautomation+" + randomString + "@remedysystems.com");

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
			strUserData = readContentForBulkUpload(104, 128);
		} catch (Exception e) {
			System.out.println(e);
		}
		String randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL1", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL1", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("ADVANCEDOPERATORMAIL1", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL1", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTCSMAIL1", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RLPNMAIL1", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL4", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL5", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL6", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL8", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL9", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL2", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL3", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL7", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL5", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL6", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL7", "qaautomation+" + randomString + "@remedysystems.com");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL8", "qaautomation+" + randomString + "@remedysystems.com");

		HashMap<String, String> bulkEmailPerRole = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();
		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL4", "qaautomation+" + randomString + "@remedysystems.com");

		strUserData = strUserData.replace("MANAGERMAIL9", "qaautomation+" + randomString + "@remedysystems.com");
		strUserData = strUserData.replace("MANAGERMAIL#10", "qaautomation+" + randomString + "@remedysystems.com");
		strUserData = strUserData.replace("MANAGERMAIL#11", "qaautomation+" + randomString + "@remedysystems.com");

		applicationsList.put("Manager", "Episode Connect Classic, Reporting Classic, Care Innovation Institute, Remedy University");
		bulkEmailPerRole.put("Manager", "qaautomation+" + randomString + "@remedysystems.com");
		bulkUsersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);
		CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);
		CreateUserPage.usersEmailPerRole.put("Super Admin-Manager", bulkEmailPerRole);

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

	public void validateErrorMsgInLogFile(String text) {
		if (!(text.equals(""))) {
			iWillWaitToSee(By.xpath("//button[text()='Download Log']"));
			driver.findElement(By.xpath("//button[text()='Download Log']")).click();
			String csvFile = System.getProperty("user.dir") + File.separator + "src" + File.separator + "test"
					+ File.separator + "Imports" + File.separator + "Downloads" + File.separator + "import-log.csv";
			File downloadFolder = new File(System.getProperty("user.dir") + File.separator + "src" + File.separator
					+ "test" + File.separator + "Imports" + File.separator + "Downloads");
			BufferedReader br = null;
			String line = "";

			try {
				if (text.contains(",")) {
					StringTokenizer st = new StringTokenizer(text, ",");
					br = new BufferedReader(new FileReader(csvFile));
					while ((line = br.readLine()) != null) {
						String a = st.nextToken();
						Assert.assertTrue(line.contains(a));
					}
				} else {
					br = new BufferedReader(new FileReader(csvFile));
					while ((line = br.readLine()) != null) {

						Assert.assertTrue(line.contains(text));
					}
				}
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (br != null) {
					try {
						br.close();
						if (downloadFolder.exists()) {
							if (downloadFolder.isDirectory()) {
								for (File f : downloadFolder.listFiles()) {
									f.delete();
								}
								downloadFolder.delete();
							}
						}
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public void editUser(String role) {
		String strUserData = null;

		if (role.equals("Leader")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
			try {

				strUserData = readContentForBulkUpload(2, 3);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("LEADERMAIL", email);
			strUserData = strUserData.replace(" Leader ", "Remedy Executive");
			strUserData = strUserData.replace("514083:2070-015:TSH", "441447:3056-r29:075296");

		} else if (role.equals("Manager")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
			try {

				strUserData = readContentForBulkUpload(3, 4);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("MANAGERMAIL", email);
			strUserData = strUserData.replace(" Manager ", "Remedy Sales Team");
			strUserData = strUserData.replace("ManagerFirstName", "FirstNameEdited");
			strUserData = strUserData.replace("ManagerLastName", "LastNameEdited");
			strUserData = strUserData.replace("9876545678", "");

		} else if (role.equals("Advanced Operator")) {

			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
			try {

				strUserData = readContentForBulkUpload(4, 5);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("ADVANCEDOPERATORMAIL", email);
			strUserData = strUserData.replace("CaseManagerFirstName", "FirstNameEdited");
			strUserData = strUserData.replace("CaseManagerLastName", "LastNameEdited");
			strUserData = strUserData.replace("9879800980", "9879800978");

			strUserData = strUserData.replace("| True| False | False | False | True |  | False | | False",
					"| False| True | False | False | False |  | False | | False");
			strUserData = strUserData.replace("|3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,5HDc3E6aK_E1  |", "| |");

			HashMap<String, String> applicationsList = new HashMap<String, String>();
			applicationsList.put("Advanced Operator", "Episode Connect Classic, Care Innovation Institute");
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Advanced Operator", applicationsList);
		}

		else if (role.equals("Physicians")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
			try {

				strUserData = readContentForBulkUpload(5, 6);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("PHYSICIANSMAIL", email);
			strUserData = strUserData.replace(" Physicians ", " Manager ");
			strUserData = strUserData.replace("NPI", "");
			HashMap<String, String> applicationsList = new HashMap<String, String>();
			applicationsList.put("Manager", "Episode Connect Classic, Reporting Classic, Care Innovation Institute, Remedy University");

			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Manager", applicationsList);

		} else if (role.equals("Remedy TCS")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
			try {

				strUserData = readContentForBulkUpload(6, 7);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("RTCSMAIL", email);
			strUserData = strUserData.replace(
					"514025:2070-047:001 |NFdw0Kts2C01,jusUV22erpk1,p11D0Vl2FSg1,18h7phZr1h81,n9yn5n0Qa581 | | True | True | True | False | False | True | False | |False ",
					"441348:ALL_BPIDS:ALL_FACILITIES  | | | True | True | True | True | True | True | False | |False");
		}

		else if (role.equals("Remedy LPN")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
			try {

				strUserData = readContentForBulkUpload(7, 8);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("RLPNMAIL", email);

			strUserData = strUserData.replace("439245:ALL_BPIDS:ALL_FACILITIES   | |",
					"441444:3056-q91:181318,441444:2070-g14:100086|3hSOHNAnvjc1,NFdw0Kts2C01|");

		}

		else if (role.equals("Remedy RN")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());

			try {

				strUserData = readContentForBulkUpload(8, 9);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("RRNMAIL", email);
			strUserData = strUserData.replace("441348:ALL_BPIDS:ALL_FACILITIES",
					"441444:3056-q91:181318,441444:3056-q91:441310");
		}

		else if (role.equals("Remedy Field RN")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
			try {

				strUserData = readContentForBulkUpload(9, 10);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("RFRNMAIL", email);
			strUserData = strUserData.replace("441448:3056-r31:075244", "514083:2070-015:TSH,441444:3056-q91:181318");

		} else if (role.equals("Remedy PM")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());

			try {

				strUserData = readContentForBulkUpload(10, 11);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("RPMMAIL", email);
			strUserData = strUserData.replace(
					"|NFdw0Kts2C01,HZhmTBQzHtU1,p11D0Vl2FSg1,qfy2xp8zSFc1 | | True| True | False | False | False | True | False | | False",
					"|NFdw0Kts2C01 | | False| False | True | True | True | True | False | | False");
			HashMap<String, String> applicationsList = new HashMap<String, String>();
			applicationsList.put("Remedy PM", "Episode Connect for Post-acute Care, Reporting Classic, Care Innovation Institute, Remedy University");
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Remedy PM", applicationsList);
		}

		else if (role.equals("Remedy Other")) {

			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());

			try {

				strUserData = readContentForBulkUpload(14, 15);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("ROMAIL", email);
			strUserData = strUserData.replace(" Remedy Other ", " Downstream Provider ");

			strUserData = strUserData.replace("| 514022:2070-007:J |HZhmTBQzHtU1,18h7phZr1h81 |",
					"|441369:3056-m03:365402| |");

			HashMap<String, String> applicationsList = new HashMap<String, String>();
			applicationsList.put("Downstream Provider", "Episode Connect Classic, Episode Connect for Post-acute Care, Care Innovation Institute");
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
		}

		else if (role.equals("Prospective Partner Executive")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());

			try {

				strUserData = readContentForBulkUpload(13, 14);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("PPEMAIL", email);
			strUserData = strUserData.replace("442503:ALL_BPIDS:ALL_FACILITIES", "441348:ALL_BPIDS:ALL_FACILITIES");

		} else if (role.equals("Partner Program Administrator")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());

			try {
				strUserData = readContentForBulkUpload(15, 16);
			} catch (Exception e) {
				System.out.println(e);
			}

			strUserData = strUserData.replace("PPAMAIL", email);

			strUserData = strUserData.replace("441445:3056-r26:1481",
					"807551:3090-209:337181,807551:6005-197:330394-REH,441444:3056-q91:181318,441444:3056-q91:441310,441444:3056-q99:204595837");

		}

		else if (role.equals("Partner Technical Administrator")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
			try {

				strUserData = readContentForBulkUpload(17, 18);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("PTAMAIL", email);
			strUserData = strUserData.replace(" Partner Technical Administrator ", " Downstream Provider ");
			strUserData = strUserData.replace("|572091:3056-r30:075278  |NFdw0Kts2C01,HZhmTBQzHtU1,n9yn5n0Qa581    |",
					"|441369:3056-m03:365402,450306| |");
			HashMap<String, String> applicationsList = new HashMap<String, String>();
			applicationsList.put("Downstream Provider", "Episode Connect Classic, Episode Connect for Post-acute Care, Care Innovation Institute");
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
		}

		else if (role.equals("Remedy Technical Administrator")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
			try {

				strUserData = readContentForBulkUpload(18, 19);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("RTAMAIL", email);
			strUserData = strUserData.replace("Remedy Technical Administrator | NA |", "Physicians | NPI |");
			strUserData = strUserData.replace("RTAFirstName", "FirstnameeFirstnameeFirstnameeFirstnameeFirstnamee");
			strUserData = strUserData.replace("RTALastName", "LastnameeeLastnameeeLastnameeeLastnameeeLastnameee");

			strUserData = strUserData.replace(
					"441448:3056-r31:075244,572091:3056-r30:075278,439104:2070-a48:070003 |3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,HZhmTBQzHtU1,5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 | | True | False | False | False | False | True | True | | True",
					"441348:ALL_BPIDS:ALL_FACILITIES   | | | False | False | False | False | True | True | False | | True");

			HashMap<String, String> applicationsList = new HashMap<String, String>();
			applicationsList.put("Physicians", "Care Innovation Institute");
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Physicians", applicationsList);
		}

		else if (role.equals("Operator")) {
			String userRole = "Super Admin-" + role;
			String email = BulkUserCreationPage.bulkUsersEmailPerRole.get(userRole)
					.get(userRole.substring((userRole.indexOf("-") + 1)).trim());
			try {

				strUserData = readContentForBulkUpload(19, 20);
			} catch (Exception e) {
				System.out.println(e);
			}
			strUserData = strUserData.replace("OPERATORMAIL", email);
			strUserData = strUserData.replace(" Operator ", " Downstream Provider ");

			strUserData = strUserData.replace(
					"514029:ALL_BPIDS:ALL_FACILITIES |3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,HZhmTBQzHtU1,5HDc3E6aK_E1,p11D0Vl2FSg1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581  | | True | False | False | True | False | False | False | | False",
					"450306| | | False | True | False | False | False | False | False | | False");

			HashMap<String, String> applicationsList = new HashMap<String, String>();
			applicationsList.put("Downstream Provider", "Episode Connect Classic, Care Innovation Institute");
			CreateUserPage.usersApplicationsPerRole.put("Super Admin-Downstream Provider", applicationsList);
		}

		HashMap<String, String> bulkNPIPerRole = new HashMap<String, String>();
		String randomNPI = RandomStringUtils.randomNumeric(10);
		strUserData = strUserData.replace("NPI", randomNPI);
		bulkNPIPerRole.put("Physicians", randomNPI);
		CreateUserPage.usersNPIPerRole.put("Super Admin-Physicians", bulkNPIPerRole);
		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
	}

	public void editWithInvalidData() {
		String strUserData = null;
		try {
			strUserData = readContentForBulkUpload(2, 17);
		} catch (Exception e) {
			System.out.println(e);
		}
		String randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("LEADERMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Leader")
						.get("Super Admin-Leader".substring(("Super Admin-Leader".indexOf("-") + 1)).trim()));
		strUserData = strUserData.replace("514083:2070-015:TSH", "514029::");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("MANAGERMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Manager")
						.get("Super Admin-Manager".substring(("Super Admin-Manager".indexOf("-") + 1)).trim()));
		strUserData = strUserData.replace("441447:3056-r29:075296", ":2070-023:");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("ADVANCEDOPERATORMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Advanced Operator").get(
						"Super Admin-Advanced Operator".substring(("Super Admin-Advanced Operator".indexOf("-") + 1)).trim()));
		strUserData = strUserData.replace("776109:2070-005:HUMC", "::A");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PHYSICIANSMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Physicians")
						.get("Super Admin-Physicians".substring(("Super Admin-Physicians".indexOf("-") + 1)).trim()));

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RTCSMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Remedy TCS")
						.get("Super Admin-Remedy TCS".substring(("Super Admin-Remedy TCS".indexOf("-") + 1)).trim()));
		strUserData = strUserData.replace("514025:2070-047:001", "");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RLPNMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Remedy LPN")
						.get("Super Admin-Remedy LPN".substring(("Super Admin-Remedy LPN".indexOf("-") + 1)).trim()));
		strUserData = strUserData.replace("439245:ALL_BPIDS:ALL_FACILITIES", "514029::A");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RRNMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Remedy RN")
						.get("Super Admin-Remedy RN".substring(("Super Admin-Remedy RN".indexOf("-") + 1)).trim()));
		strUserData = strUserData.replace("RRNFirstName", "");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RFRNMAIL", BulkUserCreationPage.bulkUsersEmailPerRole
				.get("Super Admin-Remedy Field RN")
				.get("Super Admin-Remedy Field RN".substring(("Super Admin-Remedy Field RN".indexOf("-") + 1)).trim()));
		strUserData = strUserData.replace("RFRNLastName", "");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RPMMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Remedy PM")
						.get("Super Admin-Remedy PM".substring(("Super Admin-Remedy PM".indexOf("-") + 1)).trim()));
		strUserData = strUserData.replace(" Remedy PM ", "");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RSTMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Remedy Sales Team")
						.get("Super Admin-Remedy Sales Team"
								.substring(("Super Admin-Remedy Sales Team".indexOf("-") + 1)).trim()));
		strUserData = strUserData.replace("441371:ALL_BPIDS:ALL_FACILITIES", "514083:hkjhk:TSH");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("REMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Remedy Executive")
						.get("Super Admin-Remedy Executive".substring(("Super Admin-Remedy Executive".indexOf("-") + 1))
								.trim()));
		strUserData = strUserData.replace("439108:ALL_BPIDS:ALL_FACILITIES", "514083:2070-015:klk");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PPEMAIL | |", "PPEMAIL |123-234-5678|");
		strUserData = strUserData.replace("PPEMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Prospective Partner Executive")
						.get("Super Admin-Prospective Partner Executive"
								.substring(("Super Admin-Prospective Partner Executive".indexOf("-") + 1)).trim()));

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("ROMAIL | 7676878998|", "ROMAIL |9876543215,8529637415,4567891235|");
		strUserData = strUserData.replace("ROMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Remedy Other").get(
						"Super Admin-Remedy Other".substring(("Super Admin-Remedy Other".indexOf("-") + 1)).trim()));

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("PPAMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Partner Program Administrator")
						.get("Super Admin-Partner Program Administrator"
								.substring(("Super Admin-Partner Program Administrator".indexOf("-") + 1)).trim()));
		strUserData = strUserData.replace("441445:3056-r26:1481", "514083:2070-015:TSH,gfdgfgdfg");

		randomString = RandomStringUtils.randomAlphabetic(8);
		strUserData = strUserData.replace("RPAMAIL",
				BulkUserCreationPage.bulkUsersEmailPerRole.get("Super Admin-Remedy Program Administrator")
						.get("Super Admin-Remedy Program Administrator"
								.substring(("Super Admin-Remedy Program Administrator".indexOf("-") + 1)).trim()));
		strUserData = strUserData.replace(
				"| 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,qfy2xp8zSFc1,18h7phZr1h81,n9yn5n0Qa581 |",
				"| 3hSOHNAnvjc1,NFdw0Kts2C01,jusUV22erpk1,ABUJHHIFDHHU |");

		strUserData = strUserData.replace("NPI", "");
		iWillWaitToSee(By.xpath("//div[@class='component-neo-input']//textarea"));
		iFillInText(driver.findElement(By.xpath("//div[@class='component-neo-input']//textarea")), strUserData);
	}

	public void clickSubmitForEditBulkUser(String user, String userApplications) {

		iWillWaitToSee(By.xpath("//button[text()='Submit']"));
		waitTo().until(ExpectedConditions.elementToBeClickable(By.xpath("//button[text()='Submit']")));
		clickElement(driver.findElement(By.xpath("//button[text()='Submit']")));
		iWillWaitToSee(By.xpath("//div[@class='ui text loader']"));
		WebDriverWait objWait = new WebDriverWait(driver, 300);
		objWait.until(
				ExpectedConditions.invisibilityOf(driver.findElement(By.xpath("//div[@class='ui text loader']"))));
		HashMap<String, String> emailList = new HashMap<String, String>();
		HashMap<String, String> applicationsList = new HashMap<String, String>();
		HashMap<String, String> NPIList = new HashMap<String, String>();
		String firstKey = user.substring(0, user.indexOf("-"));
		String secondKey = user.substring(user.indexOf("-") + 1, user.lastIndexOf("-"));
		String thirdKey = user.substring(user.lastIndexOf("-") + 1, user.length());
		emailList.put(thirdKey, CreateUserPage.usersEmailPerRole.get(firstKey + "-" + secondKey).get(secondKey));
		applicationsList.put(thirdKey, userApplications);
		if (user.contains("Physicians")) {
			NPIList.put(thirdKey, bulkUsersNPIPerRole);
		} else {
			NPIList.put(thirdKey, "");
		}
		bulkUsersNPIPerRole = "";
		CreateUserPage.usersEmailPerRole.put(firstKey + "-" + thirdKey, emailList);
		CreateUserPage.usersApplicationsPerRole.put(firstKey + "-" + thirdKey, applicationsList);
		CreateUserPage.usersNPIPerRole.put(firstKey + "-" + thirdKey, NPIList);
	}
}
