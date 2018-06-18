package com.remedy.programManagement;

import org.openqa.selenium.InvalidArgumentException;
import org.openqa.selenium.WebDriver;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import com.remedy.RestCall.*;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

public class CreateNetworkContractAPI extends BaseClass {
	
	public InsertDataIntoDataModels insertData = new InsertDataIntoDataModels();
	public static List<Long> idList = new ArrayList<>();

	public CreateNetworkContractAPI(WebDriver driver) {
		super(driver);
	}
	
	public void buildJsonForNetworkContract(String endDate, String orgIdFrmCucumber, String bpContractIdCucumber, String startDate, String type, String orgType) {

        List<String> endDateFinalList = new ArrayList<>();
        List<String> startDateFinalList = new ArrayList<>();
        List<Long> bpContractIdList = new ArrayList<>();
        List<Long> orgIdList = new ArrayList<>();
        List<NetworkContractDataModel> networkContractDetailsMapList = new ArrayList();

        endDateFinalList = insertData.splitIntoSubList(endDate);
        startDateFinalList = insertData.splitIntoSubList(startDate);

        if (StringUtils.isBlank(orgIdFrmCucumber)) {
        	if (StringUtils.isBlank(orgIdFrmCucumber)) {
                if (orgType.equals("hospital")) {
                    orgIdList.add(CreateACHOrganizationAPI.copyIDList.get(0));
                }
                else if (orgType.equals("hospitalNOMO")) {
                	orgIdList.add(CreateACHOrganizationAPI.copyIDList.get(1)); 
                }
                else if (orgType.equals("pgp")) {
                    orgIdList.add(CreatePGPOrganizationAPI.PGPcopyIDList.get(0));
                } 
                else if (orgType.equals("pgpNOMO")) {
                	orgIdList.add(CreatePGPOrganizationAPI.PGPcopyIDList.get(1));
                } 
                else if (orgType.equals("hha")) {
                	orgIdList.add(CreateHHAOrganizationAPI.HHAcopyIDList.get(0));
                }
                else if (orgType.equals("hhaNOMO")) {
                	orgIdList.add(CreateHHAOrganizationAPI.HHAcopyIDList.get(1));
                }
                else if (orgType.equals("snf")) {
                	orgIdList.add(CreateSNFOrganizationAPI.SNFcopyIDList.get(0));
                }
                else if (orgType.equals("snfNOMO")) {
                	orgIdList.add(CreateSNFOrganizationAPI.SNFcopyIDList.get(1));
                }
                else
                {
                    throw new InvalidArgumentException("Invalid organization type passed");
                }
        	} 
        	else 
        	{
        		List<String> orgIdSplitList = insertData.splitIntoSubList(orgIdFrmCucumber);
        		int orgIdSplitListSize = orgIdSplitList.size();
        		for (int i = 0; i < orgIdSplitListSize; i++) {
        			if (orgIdSplitList.get(i).equals("manOrgId")) {
        				orgIdList.add(CreateManagingOrganizationAPI.managingOrgID);
        			} 
        			else {
        				orgIdList.add(Long.valueOf(orgIdSplitList.get(i)));
        			}
        		}
        	}
        int endDateFinalListSize = endDateFinalList.size();
        int startDateFinalListSize = startDateFinalList.size();
        int orgIdListSize = orgIdList.size();

        if (endDateFinalListSize > orgIdListSize) {
            for (int i = 0; i < endDateFinalListSize - orgIdListSize; i++) {
                orgIdList.add(orgIdList.get(i));
            }
        }

        if (StringUtils.isBlank(bpContractIdCucumber)) {
            bpContractIdList.add(CreateBundlePaymentContractAPI.BPCIDcopyList.get(0));
        	} 
        	else {
        		List<String> pgpContractIdSplitList = insertData.splitIntoSubList(bpContractIdCucumber);
        		int pgpContractIdSplitListSize = pgpContractIdSplitList.size();
        		for (int j = 0; j < pgpContractIdSplitListSize; j++)
        		{
        			bpContractIdList.add(Long.valueOf(pgpContractIdSplitList.get(j)));
        		}
        	}
        int bpContractIdListSize = bpContractIdList.size();
        if (endDateFinalListSize > bpContractIdListSize) {
            for (int i = 0; i < endDateFinalListSize - bpContractIdListSize; i++) 
            {
                bpContractIdList.add(bpContractIdList.get(i));
            }
        }
        for (int i = 0; i < endDateFinalList.size(); i++)
        {
            NetworkContractDataModel networkContrctDataModel = new NetworkContractDataModel(endDateFinalList.get(i), orgIdList.get(i), bpContractIdList.get(i), startDateFinalList.get(i), type);
            networkContractDetailsMapList.add(networkContrctDataModel);
        }
        	CreateNetworkContractAPI.jsonString = generateJson(networkContractDetailsMapList);
        }
	}
	
	public void createContractWithThisData() throws Throwable {
        String urlExt = "contract/network";
        response = RestCallUtil.post(jsonString, DriverScript.Config.getProperty("contentType"), urlExt, new GenerateToken().getAccessToken());
        
        if (response.statusCode() == 201) 
        {
            List<Integer> idTempList = response.path("id");
            for (Integer id : idTempList)
            {
                idList.add(id.longValue());
            }
        }
    }

}
