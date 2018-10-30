package com.remedy.programManagement;

import java.util.HashMap;

import org.openqa.selenium.WebDriver;

import com.remedy.baseClass.BaseClass;

public class CreateHHAOrganization extends BaseClass {
	
	public static HashMap<String, String> tempHHAOrg = new HashMap<String, String>();
	public static HashMap<String, String> HHAOrg = new HashMap<String, String>();
	public static HashMap<String, String> HHAOrg_noMO = new HashMap<String, String>();
	public static String oldHHA_WithoutMO;
	public static String oldHHA_WithMO;

	public CreateHHAOrganization(WebDriver driver) {
		super(driver);
	}
}
