package com.remedy.programManagement;

import java.util.HashMap;

import org.openqa.selenium.WebDriver;

import com.remedy.baseClass.BaseClass;

public class CreateHospiceOrganization extends BaseClass{

	public static HashMap<String, String> tempHospiceOrg = new HashMap<String, String>();
	public static HashMap<String, String> HospiceOrg = new HashMap<String, String>();
	public static HashMap<String, String> HospiceOrg_noMO = new HashMap<String, String>();
	public static String oldHospice_WithoutMO;
	public static String oldHospice_WithMO;
	
	public CreateHospiceOrganization(WebDriver driver) {
		super(driver);
	}

}
