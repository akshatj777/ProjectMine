package com.remedy.programManagement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.openqa.selenium.WebDriver;
import org.apache.commons.lang3.StringUtils;

import com.remedy.RestCall.*;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

public class CreateProgramAPI extends BaseClass{
	
	public InsertDataIntoDataModels insertData = new InsertDataIntoDataModels();
	public static List<Long> idList = new ArrayList<>();
	public static List<String> PROGRAMNameList = new ArrayList<>();
	public static List<Long> PROGRAMIDList = new ArrayList<>();
	public static HashMap<String, String> tempPrograms = new HashMap<String, String>();
	public static Long programName = null;
	
	public CreateProgramAPI(WebDriver driver) {
		super(driver);
	}
	
	public void createProgramJsonWAttributionRules(String pName, String payorOrId, String cAttributionRankID, String cAttributinRankValue, int noOfAttributionRulesForThisPrg, String cValidationRankID, String cValidationValue, int noOfValidationRulesForThisPrg, boolean multipleBundleEpisode) throws Throwable {
		List<RankAttributionRuleDataModel> idValidationRankList = new ArrayList<>();
        List<RankAttributionRuleDataModel> idRankList = new ArrayList<>(); 
        ProgramDataModel programDataModel = null;
        Long id = null;
        Float value = null;
        String name =null;
        if (StringUtils.isBlank(cAttributionRankID) && StringUtils.isBlank(cAttributinRankValue)) {

            idRankList = null;
        }
        else 
        {
           List<String> cIds = new ArrayList<>();
           List<String> cValues = new ArrayList<>();
           if (StringUtils.isNotBlank(cAttributionRankID))
           {
                cIds.addAll(insertData.splitList(cAttributionRankID));
           }
            else 
            {
              cIds.add("");
            }
            if (StringUtils.isNotBlank(cAttributinRankValue))
            {
                cValues.addAll(insertData.splitList(cAttributinRankValue));
            }
            else 
            {
                cValues.add("");
            }
            for (int i = 0; i < noOfAttributionRulesForThisPrg; i++) 
            {

                if( StringUtils.isNotBlank(cIds.get(i))) {
                    id = Long.valueOf(cIds.get(i));
                }else{
                    id = null;
                }
                if( StringUtils.isNotBlank(cValues.get(i))) {
                    value = Float.valueOf(cValues.get(i));
                }else{
                    value=null;
                }

                RankAttributionRuleDataModel reRankAttributionRules = new RankAttributionRuleDataModel(id, value);
                idRankList.add(reRankAttributionRules);
            }
        }
        
        if (StringUtils.isBlank(cValidationRankID) && StringUtils.isBlank(cValidationValue)) {

            idValidationRankList = null;
        }else {

            List<String> cIds = new ArrayList<>();
            List<String> cValues = new ArrayList<>();

            if (StringUtils.isNotBlank(cValidationRankID)){
                cIds.addAll(insertData.splitList(cValidationRankID));
           }else {
              cIds.add("");
           }

            if (StringUtils.isNotBlank(cValidationValue)){
                cValues.addAll(insertData.splitList(cValidationValue));
            }else {
                cValues.add("");
            }


            for (int i = 0; i < noOfValidationRulesForThisPrg; i++) {

                if( StringUtils.isNotBlank(cIds.get(i))) {
                    id = Long.valueOf(cIds.get(i));
                }else{
                    id = null;
                }
                if( StringUtils.isNotBlank(cValues.get(i))) {
                    value = Float.valueOf(cValues.get(i));
                }else{
                    value=null;
                }

                RankAttributionRuleDataModel reRankAttributionRules = new RankAttributionRuleDataModel(id, value);
                idValidationRankList.add(reRankAttributionRules);
            }
        }
        
        if(StringUtils.isNotBlank(pName)) 
        {
            name = createRandomName(pName);
        }
        if (StringUtils.isBlank(payorOrId))
        {
            List<String> payorIdList = CreatePayorOrganizationAPI.PayorNameList;
            for (int i = 0; i < payorIdList.size(); i++) 
            {
                Long payorId = CreatePayorOrganizationAPI.payorID;
                programDataModel = new ProgramDataModel(multipleBundleEpisode, name, payorId, idRankList, idValidationRankList);
            }
        } 
        else 
        {
            programDataModel = new ProgramDataModel(multipleBundleEpisode, name, Long.parseLong(payorOrId), idRankList, idValidationRankList);
        }
        CreateProgramAPI.jsonString = generateJson(programDataModel);
    }

	public void createProgramWithThisData() throws Throwable {
        String urlExt = "program";
        response = RestCallUtil.post(jsonString, DriverScript.Config.getProperty("contentType"), urlExt, new GenerateToken().getAccessToken());
        if (response.statusCode() == 201) 
        {
            idList.add(((Integer) response.path("id")).longValue());
        }
    }
}
