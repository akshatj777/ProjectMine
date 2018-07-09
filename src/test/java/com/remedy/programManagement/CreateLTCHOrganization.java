package com.remedy.programManagement;

import java.util.HashMap;
import org.openqa.selenium.WebDriver;
import com.remedy.baseClass.BaseClass;

public class CreateLTCHOrganization extends BaseClass {

	public static HashMap<String, String> tempLTCHOrg = new HashMap<String, String>();
	public static HashMap<String, String> LTCHOrg = new HashMap<String, String>();
	public static HashMap<String, String> LTCHOrg_noMO = new HashMap<String, String>();
	public static String oldLTCH_WithoutMO;
	public static String oldLTCH_WithMO;
	public static String location_Id;
	
	public CreateLTCHOrganization(WebDriver driver) {
		super(driver);
	}

}
