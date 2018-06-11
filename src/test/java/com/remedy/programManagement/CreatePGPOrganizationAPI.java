package com.remedy.programManagement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.WebDriver;
import com.remedy.RestCall.*;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

public class CreatePGPOrganizationAPI extends BaseClass{
	
	public InsertDataIntoDataModels insertData = new InsertDataIntoDataModels();
	public static List<Long> idList = new ArrayList<>();
	public static List<String> PGPNameList = new ArrayList<>();
	public static List<String> EINNameList = new ArrayList<>();
	public static List<String> NPINameList = new ArrayList<>();
	public static HashMap<String, String> tempPGPOrg = new HashMap<String, String>();
	public static Long oldPGP_WithMO = null;
	public static Long oldPGP_WithoutMO = null;


	public CreatePGPOrganizationAPI(WebDriver driver) {
		super(driver);
	}
	
	public void buildJsonForPGP(String cName, String cPid, String shortName, String cMOrgID, String cEin, String cNpi, String cAddr1, String cAddr2, String cCity, String cState, String cZip, String cMarketId) throws Throwable {
        String name = createRandomName(cName);
        String mOrgID =selectManagingOrg(cMOrgID);
        Long pid = null;
        if(cPid.equals(""))
        {
        	pid=null;
        }
        else
        {
        	pid = Long.parseLong(createRandomNumber(10));
        }
        String ein = createRandomNumber(10);
        String npi = createRandomNumber(10);
        String addr1 = cAddr1;
        String addr2 = cAddr2;
        String city = cCity;
        String state = cState;
        String zip = cZip;
        Integer marketId = generateMarketId(cMarketId);

        AddressDataModel addrs = insertAddrsData(addr1, addr2, city, state, zip);
        OrgDataModel pgpOrgData = new OrgDataModel(name, pid, shortName, mOrgID, npi, ein, marketId, addrs);
        CreatePGPOrganizationAPI.jsonString = generateJson(pgpOrgData);

    }
	
	public void createPgpOrgWithThisData() throws Throwable {
        String urlExt = "organization/pgp";
        response = RestCallUtil.post(jsonString, DriverScript.Config.getProperty("contentType"), urlExt, new GenerateToken().getAccessToken());
        if (response.statusCode() == 201) 
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

}
