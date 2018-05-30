package com.remedy.RestCall;

import com.google.common.base.Splitter;
import com.google.common.collect.Lists;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by aparlapalli on 12/9/16.
 */
public class InsertDataIntoDataModels {


//     protected GenerateRandomData genData = new GenerateRandomData();
//    protected GenerateRandomData genarateRandomData = new GenerateRandomData();

    String name;

    public Map<String, String> insertValInDataModelMap(String mName, String cPid, String cName, String email, String phone) {

      //  name = genarateRandomData.generateRandomData(mName);
        Map<String, String> dataModel = new HashMap<>();
        if(!mName.equals("")) {
            dataModel.put("name", name);
        }else{
            dataModel.put("name", mName);
        }
        dataModel.put("contactName", cName);
        dataModel.put("email", email);
        dataModel.put("phone", phone);

        if (!cPid.equals("")) {
         //   String pid = genarateRandomData.generateTimeStamp();
            //dataModel.put("participantId", cPid+pid);
        } else {
            dataModel.put("participantId", null);
        }

        return dataModel;
    }

    public Map<String, String> insertValInPayorDataModelMap(String pName, String cPid, String tin_ein,String cName, String email, String phone) {

        //name = genarateRandomData.generateRandomData(pName);
        Map<String, String> dataModel = new HashMap<>();

        if(!pName.equals("")) {
            dataModel.put("name", name);
        }else{
            dataModel.put("name", pName);
        }
        dataModel.put("ein", tin_ein);
        dataModel.put("contactName", cName);
        dataModel.put("email", email);
        dataModel.put("phone", phone);

        if (!cPid.equals("")) {
           // String pid = genarateRandomData.generateTimeStamp();
           // dataModel.put("participantId", cPid+pid);
        } else {
            dataModel.put("participantId", null);
        }

        return dataModel;
    }

    public Map<String, String> insertValInAddrMap(String addr1, String addr2, String city, String state, String zip) {

        Map<String, String> addrs = new HashMap<>();
        if (!"null".equals(addr1)) {
            addrs.put("address1", addr1);
        }

        if (!"null".equals(addr2)) {
            addrs.put("address2", addr2);
        }
        if (!"null".equals(city)) {
            addrs.put("city", city);
        }
        if (!"null".equals(state)) {
            addrs.put("state", state);
        }
        if (!"null".equals(zip)) {
            addrs.put("zip", zip);
        }
        return addrs;
    }

    public Map<String, String> insertValLocMap(String locName, String marketId) {

        Map<String, String> locs = new HashMap<>();

        locs.put("name", locName);
        locs.put("marketId", marketId);


        return locs;
    }


    public List<Map<String, String>> insertValLocTypeMap(String locTypeId) {

        List<Map<String, String>> locTypeList = new ArrayList<>();

        for (int i = 0; i < findSubString(locTypeId).size(); i++) {

            Map<String, String> locTypeSubStr = new HashMap<>();
            locTypeSubStr.put("locationTypeIds", findSubString(locTypeId).get(i));
            locTypeList.add(locTypeSubStr);
        }
        return locTypeList;

    }

    public Map<String, String> insertValHosDataMap(String hName, String cPid, String shortName, String managingOrgId, String ccn, String ein, String npi) {

        //name = genarateRandomData.generateRandomData(hName);

        Map<String, String> hosDataModel = new HashMap<>();
        if(!hName.equals("")) {
            hosDataModel.put("name", name);
        }else{
            hosDataModel.put("name", hName);
        }
        hosDataModel.put("shortName", shortName);
        hosDataModel.put("managingOrgId", managingOrgId);
        hosDataModel.put("ccn", ccn);
        hosDataModel.put("ein", ein);
        hosDataModel.put("npi", npi);

        if (!cPid.equals("")) {
            //String pid = genarateRandomData.generateTimeStamp();
            //put("participantId", cPid+pid);
        } else {
            hosDataModel.put("participantId", null);
        }

        return hosDataModel;
    }



    public Map<String, String> insertValInPGPDataModelMap(String pName, String cPid, String shortName,
                                                          String managingOrgId, String npi, String ein, String marketId) {

        //name = genarateRandomData.generateRandomData(pName);
        Map<String, String> pgpDataModel = new HashMap<>();
        if(!pName.equals("")) {
            pgpDataModel.put("name", name);
        }else{
            pgpDataModel.put("name", pName);
        }
        pgpDataModel.put("shortName", shortName);
        pgpDataModel.put("ein", ein);
        pgpDataModel.put("npi", npi);
        pgpDataModel.put("marketId", marketId);
        pgpDataModel.put("managingOrganizationId", managingOrgId);

        if (!cPid.equals("")) {
            //String pid = genarateRandomData.generateTimeStamp();
            //pgpDataModel.put("participantId", cPid+pid);
        } else {
            pgpDataModel.put("participantId", null);
        }

        return pgpDataModel;
    }


    //insert data in bundle map
    public Map<String, String> insertDataInBundleMap(String bName, String content,String bCode) {

        String bundleCode;

        if(!bName.equals("")) {
           /// name = genarateRandomData.generateRandomData(bName);
        }else{
            name = bName;
        }
        //String timeStamp = genarateRandomData.generateTimeStamp();
        if(!bCode.equals("")) {
            // bundleCode = bCode + timeStamp.substring(8);
        }else {
            bundleCode = bCode;
        }
        Map<String, String> bundleDataModel = new HashMap<>();
        bundleDataModel.put("name", name);
        bundleDataModel.put("content", content);
       // bundleDataModel.put("bundleCode", bundleCode);

        return bundleDataModel;
    }


    //insert data in program map
    public Map<String, String> insertDataInProgramMap(String pName, String payorOrgId) {

        //name = genarateRandomData.generateRandomData(pName);
        Map<String, String> programDataModel = new HashMap<>();
        programDataModel.put("name", name);
        programDataModel.put("payorOrganizationId", payorOrgId);

        return programDataModel;
    }


    //insert vaues into program ids for the given key
    public Map<String, String> insertValPrgIDDataMap(String bpid, String cjrid) {

        Map<String, String> prgIDData = new HashMap<>();

        if (!"null".equals(bpid)) {
            prgIDData.put("bpid", bpid);
        }

        if (!"null".equals(cjrid)) {
            prgIDData.put("cjrid", cjrid);
        }

        return prgIDData;
    }


    // method to split the data passed in multiple arrays
    public List<String> splitIntoSubList(String bundleData) {

        List<String> bundleDataList = new ArrayList<>();

        for (int i = 0; i < findSubString(bundleData).size(); i++) {

            bundleDataList.add(findSubString(bundleData).get(i));
        }
        return bundleDataList;

    }


    // to split data from cucumber file if there are multiple values for a field
    public static List<String> splitList(String dataToSplit) {
        List<String> dataNoSplit = new ArrayList<>();

        return Lists.newArrayList(Splitter.on(",").trimResults().split(dataToSplit));

    }


    public List<String> findSubString(String stringValue)

    {
        Pattern p = Pattern.compile("\\[(.*?)\\]");
        Matcher m = p.matcher(stringValue);
        List<String> stringList = new ArrayList<>();

        int pos = -1;
        while (m.find(pos + 1)) {
            pos = m.start();
            stringList.add(m.group(1));
        }
        return stringList;
    }

}



