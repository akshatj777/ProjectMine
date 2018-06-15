package com.remedy.programManagement;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.WebDriver;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;
import com.remedy.RestCall.*;
import java.util.StringTokenizer;

public class CreateManagingOrganizationAPI extends BaseClass {
	
	public static List<String> MONameList = new ArrayList<>();
	public static List<Long> idList = new ArrayList<>();
	public static List<String> participantidList = new ArrayList<>();
	public static Long managingOrgID = null;
	
	public CreateManagingOrganizationAPI(WebDriver driver) {
		super(driver);
	}

	public void buildJsonForMO(String cName, String cPid, String cContactName, String cEmail, String cPhone, String cAddr1, String cAddr2, String cCity, String cState, String cZip) throws Throwable {
        String name = null; 
        name=	cName+RandomStringUtils.randomAlphabetic(8);
        Long pid = null;
        if(cPid.equals(""))
        {
        	pid=null;
        }
        else
        {
        	pid = Long.parseLong(createRandomNumber(10));
        }
        String email = null;
        if (StringUtils.isNotBlank(cEmail))
        {
            email = cEmail;
        }
        AddressDataModel addrs = insertAddrsData(cAddr1, cAddr2, cCity, cState, cZip);
        OrgDataModel manOrgData = new OrgDataModel(name, cContactName, pid, email, cPhone, addrs);
        jsonString = generateJson(manOrgData);
    }
	
	public void createOrgWithThisData() throws Throwable {
        String url = "organization/management";
        response = RestCallUtil.post(jsonString,  DriverScript.Config.getProperty("contentType"), url, new GenerateToken().getAccessToken());
        if (response.getStatusCode() == 201) 
        {
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
	
	public static void deleteReferences(String type)
	{
		if(type.contains(","))
		{
			StringTokenizer st = new StringTokenizer(type, ",");
			while(st.hasMoreTokens())
			{
				deleteNamesList(st.nextToken().trim());
			}
		}
		else
		{
			deleteNamesList(type);
		}
	}
}
