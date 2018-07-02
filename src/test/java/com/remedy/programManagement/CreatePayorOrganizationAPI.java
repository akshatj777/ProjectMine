package com.remedy.programManagement;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.WebDriver;

import com.remedy.RestCall.*;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

public class CreatePayorOrganizationAPI extends BaseClass{
	
	public static List<String> PayorNameList = new ArrayList<>();
	public static List<Long> idList = new ArrayList<>();
	public static List<String> participantidList = new ArrayList<>();
	public static Long oldPayorOrg = null;
	public static Long payorID = null;

	public CreatePayorOrganizationAPI(WebDriver driver) {
		super(driver);
	}
	
	public void buildPayorJson(String cName, String cPid, String cTin_ein, String contactName, String cEmail, String cPhone, String cAddr1, String cAddr2, String cCity, String cState, String cZip) throws Throwable {

        String name = cName+RandomStringUtils.randomAlphabetic(8);
        Long pid=null;
        if(cPid.equals(""))
        {
        	pid=null;
        }
        else
        {
        	pid = Long.parseLong(createRandomNumber(10));
        }
        String tin_ein = createRandomNumber(10);
        String email = null;
        if (StringUtils.isNotBlank(cEmail)) {
            email = cEmail;
        }
        AddressDataModel addrs = insertAddrsData(cAddr1, cAddr2, cCity, cState, cZip);
        OrgDataModel payorData = new OrgDataModel(name, pid, tin_ein, contactName, email, cPhone, addrs);
        jsonString = generateJson(payorData);
    }

	public void createPayorWithThisData() throws Throwable {
        String orgType = "organization/payor";
        response = RestCallUtil.post(jsonString, DriverScript.Config.getProperty("contentType"), orgType, new GenerateToken().getAccessToken());
        if (response.statusCode() == 201) {
            idList.add(((Integer) response.path("id")).longValue());
        }
    }

	public static AddressDataModel insertAddrsData(String cAddr1, String cAddr2, String cCity, String cState, String cZip) {
        AddressDataModel addrs = null;
        if (StringUtils.isNotBlank(cAddr1) || StringUtils.isNotBlank(cAddr2) || StringUtils.isNotBlank(cCity) || StringUtils.isNotBlank(cState) || StringUtils.isNotBlank(cZip)) {
            addrs = new AddressDataModel(cAddr1, cAddr2, cCity, cState, cZip);
        }
        return addrs;
    }
}
