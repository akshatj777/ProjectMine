package com.remedy.programManagement;

import org.openqa.selenium.WebDriver;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.WebDriver;

import com.remedy.RestCall.*;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;
import com.remedy.baseClass.BaseClass;

public class CreateSNFOrganizationAPI extends BaseClass {

	public CreateSNFOrganizationAPI(WebDriver driver) {
		super(driver);
	}
	
	public InsertDataIntoDataModels insertData = new InsertDataIntoDataModels();
	public static List<Long> idList = new ArrayList<>();
	public static List<String> ACHNameList = new ArrayList<>();
	public static List<String> CCNNameList = new ArrayList<>();
	public static List<String> EINNameList = new ArrayList<>();
	public static List<String> NPINameList = new ArrayList<>();
	public static HashMap<String, String> tempAchOrg = new HashMap<String, String>();
	public static Long oldACH_WithMO = null;
	public static Long oldACH_WithoutMO = null;



	public void buildJsonForSnfHospLtch(String cName, String cPid, String shortName, String cMOrgID, String cCcn, String cEin, String cNpi, String cAddr1, String cAddr2, String cCity, String cState, String cZip, String cLocName, String locType, String cMarketId, String locAddr1, String locAddr2, String locCity, String locState, String locZip, String cLocationId) throws Throwable {
        List<LocationsDataModel> locList = new ArrayList<>();
        String name = createRandomName(cName);
        String mOrgID = selectManagingOrg(cMOrgID);
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
        String ccn = genearateOrgId(cCcn);
        List<String> locationIdList = generateLocationId(cLocationId,ccn);
        AddressDataModel addrs = insertAddrsData(cAddr1, cAddr2, cCity, cState, cZip);
        List<String> typList = new ArrayList<>();
        if (StringUtils.isNotBlank(locType)) {

            typList.addAll(insertData.locTypeList(locType).get(0));
        }
        //adding to a list after spliting the cucumber data and get the index and insert to addressMap and Loctions map
        for (int i = 0; i < insertData.splitList(locAddr1).size(); i++) 
        {
            AddressDataModel locAddrs = insertAddrsData(insertData.splitList(locAddr1).get(i), insertData.splitList(locAddr2).get(i), insertData.splitList(locCity).get(i), insertData.splitList(locState).get(i), insertData.splitList(locZip).get(i));
            Integer marketId = generateMarketId(insertData.splitList(cMarketId).get(i));
            List<String> locTypeList = null;
            if (StringUtils.isNotBlank(locType))
            {
                locTypeList = insertData.splitList(typList.get(i));
            }
            String locName = null;
            if (StringUtils.isNotBlank(cLocName)) 
            {
                locName = insertData.splitList(cLocName).get(i);
            }
            LocationsDataModel locations = null;
            if (locAddrs != null || locName != null)
            {
                if(locationIdList !=null)
                {
                 locations = new LocationsDataModel(locAddrs, locTypeList, marketId, locName,locationIdList.get(i));
                 locList.add(locations);
                }
                else{
                    locations = new LocationsDataModel(locAddrs, locTypeList, marketId, locName,null);
                    locList.add(locations);
                }
            } 
            else 
            {
               locList = null;
            }
        }
        OrgDataModel hospOrgData = new OrgDataModel(pid, ccn, npi, ein, name, shortName, mOrgID, addrs, locList);
        CreateSNFOrganizationAPI.jsonString = generateJson(hospOrgData);
    }
	
	public void createSnfOrgWithThisData(String type) throws Throwable {
        String url = "organization/" + type;
        response = RestCallUtil.post(jsonString, DriverScript.Config.getProperty("contentType"), url, new GenerateToken().getAccessToken());
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

}
