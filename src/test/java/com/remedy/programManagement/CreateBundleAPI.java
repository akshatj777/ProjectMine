package com.remedy.programManagement;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.WebDriver;
import com.remedy.RestCall.*;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

public class CreateBundleAPI extends BaseClass{

	public static List<Long> idList = new ArrayList<>();
	public static List<String> bundleNameList = new ArrayList<>();
	
	public CreateBundleAPI(WebDriver driver) {
		super(driver);
	}
	
	public void createBundleJsonToString(String cName, String content, String cCode) throws Throwable {
        String bundleCode, name;
        //String timeStamp = genarateRandomData.generateTimeStamp();
        name = createRandomName(cName);
        if (StringUtils.isNotBlank(cCode)) {
            bundleCode = cCode + createRandomName(name).substring(8);
        } 
        else {
            bundleCode = cCode;
        }
        BundleDataModel bundleDataModel = new BundleDataModel(name, content, bundleCode);
        jsonString = generateJson(bundleDataModel);
    }

	public void createBundleWithThisData() throws Throwable {
        String urlExt = "bundle";
        response = RestCallUtil.post(jsonString, DriverScript.Config.getProperty("contentType"), urlExt, new GenerateToken().getAccessToken());
        if (response.statusCode() == 201) {
            idList.add(((Integer) response.path("id")).longValue());
        }
    }
	
//	public void verifyActualVsExp(Integer expCode, String responseMsg) throws Throwable {
//		new VerificationMethod().verifyExpectedVsActualResults(response, expCode, responseMsg);
//	    }
}
