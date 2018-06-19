package com.remedy.programManagement;

import org.openqa.selenium.WebDriver;
import org.apache.commons.lang3.StringUtils;

import com.remedy.RestCall.*;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

import java.util.ArrayList;
import java.util.List;

public class CreatePhysicianRosterAPI extends BaseClass{

	public InsertDataIntoDataModels insertData = new InsertDataIntoDataModels();
	public static List<Long> idList = new ArrayList<>();
	
	public CreatePhysicianRosterAPI(WebDriver driver) {
		super(driver);
	}

	public void createPhysicianRosterJson(String cPractitonerContractId, String cPractionerId, String startDate, String endDate, int noOfRosters) throws Throwable {
        List<PhysicianRosterDataModel> physianRosterMapList = new ArrayList();
        List<String> startDateList = new ArrayList<>();
        if (StringUtils.isNotBlank(startDate)) {
            startDateList = insertData.splitList(startDate);
        } 
        else 
        {
            startDateList.add(null);
        }
        List<String> endDateList = new ArrayList<>();
        if (StringUtils.isNotBlank(endDate)) {
            endDateList = insertData.splitList(endDate);
        } 
        else {
            endDateList.add(null);
        }
        List<String> practitonerContractIdStringList = insertData.splitList(cPractitonerContractId);
        List<Long> practitonerContractIdList = new ArrayList<>();
        for (int i = 0; i < practitonerContractIdStringList.size(); i++) {
            if (practitonerContractIdStringList.get(i).equals("updatePhysicianRoster")) {
                practitonerContractIdList = idList;
            } else if (cPractitonerContractId.equals("null")) {
                practitonerContractIdList.add(null);
            } else {
                practitonerContractIdList.add(Long.valueOf(practitonerContractIdStringList.get(i)));
            }
        }
        List<Long> practionerIdList = new ArrayList<>();
        List<String> cPractionerIdList = new ArrayList<>();
        cPractionerIdList = insertData.splitList(cPractionerId);
        for (int i = 0; i < cPractionerIdList.size(); i++) {
            if (cPractionerIdList.get(i).equals("addPhysicianToRoster") || cPractionerIdList.get(i).equals("updateAPhysician")) {
               // practionerIdList = PM428CreatePractitionerStepDef.returnIdList();
            	practionerIdList.add(CreatePractictionerAPI.practitionerIDList.get(0));
            } else if (cPractionerIdList.get(i).equals("getPractioner")) {
                practionerIdList.add(CreatePractictionerAPI.practitionerIDList.get(0));
            } 
            else 
            {
                if (cPractionerIdList.get(i).isEmpty()) {
                    practionerIdList.add(null);
                } else {
                    practionerIdList.add(Long.valueOf(cPractionerIdList.get(i)));
                }
            }
        }
        for (int i = 0; i < noOfRosters; i++) {
            Long contractRosterId = null;
            if (practitonerContractIdList.get(0) != null) {
                contractRosterId = practitonerContractIdList.get(i);
            }
            PhysicianRosterDataModel physicianRosterModel = new PhysicianRosterDataModel(contractRosterId, practionerIdList.get(i), endDateList.get(i), startDateList.get(i));
            physianRosterMapList.add(physicianRosterModel);

        }
        if (noOfRosters == 0) {
            physianRosterMapList.isEmpty();
        }
        jsonString = generateJson(physianRosterMapList);
    }

	public void addUpdateRemovePhysicianToARoster(int index) throws Throwable {

        List<Long> bPcontractIdList = new ArrayList<>();
//        bPcontractIdList.add(CreateBundlePaymentContractAPI.BPCIDcopyList.get(index));
        String urlExt = "contract/" + CreateBundlePaymentContractAPI.BPCIDcopyList.get(index) + "/practitioner";
        response = RestCallUtil.updateAny(jsonString,  DriverScript.Config.getProperty("contentType"), urlExt, new GenerateToken().getAccessToken());
        if (response.statusCode() == 200) {
            List<Integer> idTempList = null;
            idTempList = response.path("id");
            for (Integer id : idTempList) {
                idList.add(id.longValue());
            }

        }
    }
}
