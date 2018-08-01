package com.remedy.programManagement;

import java.util.HashMap;

import org.openqa.selenium.WebDriver;

import com.remedy.baseClass.BaseClass;

public class CreateIRFOrganization extends BaseClass{

	public static HashMap<String, String> tempIRFOrg = new HashMap<String, String>();
	public static HashMap<String, String> IRFOrg = new HashMap<String, String>();
	public static HashMap<String, String> IRFOrg_noMO = new HashMap<String, String>();
	public static String oldIRF_WithoutMO;
	public static String oldIRF_WithMO;
	
	public CreateIRFOrganization(WebDriver driver) {
		super(driver);
	}

}
