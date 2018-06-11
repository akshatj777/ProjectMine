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


    public Map<String, String> insertValLocMap(String locName, String marketId) {
        Map<String, String> locs = new HashMap<>();
        locs.put("name", locName);
        locs.put("marketId", marketId);
        return locs;
    }

    public List<List<String>> locTypeList(String locTypeId) {
        List<List<String>> locTypeList = new ArrayList<>();
        List<String> locTypeSubStr = new ArrayList<>();
        for (int i = 0; i < findSubString(locTypeId).size(); i++) 
        {
            locTypeSubStr.add(findSubString(locTypeId).get(i));
        }
        locTypeList.add(locTypeSubStr);
        return locTypeList;

    }

    // method to split the data passed in multiple arrays
    public List<String> splitIntoSubList(String bundleData) {
        List<String> bundleDataList = new ArrayList<>();
        for (int i = 0; i < findSubString(bundleData).size(); i++)
        {
            bundleDataList.add(findSubString(bundleData).get(i));
        }
        return bundleDataList;
    }

    // to split data from cucumber file if there are multiple values for a field
    public List<String> splitList(String dataToSplit) {
        List<String> dataNoSplit = new ArrayList<>();
        return Lists.newArrayList(Splitter.on(",").trimResults().split(dataToSplit));
    }

    public List<String> findSubString(String stringValue)
    {
        Pattern p = Pattern.compile("\\[(.*?)\\]");
        Matcher m = p.matcher(stringValue);
        List<String> stringList = new ArrayList<>();
        int pos = -1;
        while (m.find(pos + 1)) 
        {
            pos = m.start();
            stringList.add(m.group(1));
        }
        return stringList;
    }
}