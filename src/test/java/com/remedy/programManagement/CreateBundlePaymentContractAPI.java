package com.remedy.programManagement;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.InvalidArgumentException;
import org.openqa.selenium.WebDriver;

import com.remedy.RestCall.*;

import org.apache.commons.lang3.StringUtils;

import com.remedy.RestCall.InsertDataIntoDataModels;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

public class CreateBundlePaymentContractAPI extends BaseClass{

	public InsertDataIntoDataModels insertData = new InsertDataIntoDataModels();
	public static List<Long> idList = new ArrayList<>();
	
	public CreateBundlePaymentContractAPI(WebDriver driver) {
		super(driver);
	}

	public void createContractJson(String contractId, String cEndDate, String orgIdFrmCucumber, String cProgramId, String cStartDate, String cBundleId, String bundlePrice, String cbundleStartDate, String cBundleEndDate, String type, String orgType, String priceStartDate, String priceEndDate, String baseLineEndDate, String baseLineStartDate, String trendFactor, String upperBound, String lowerBound)  {

        List<Long> bundleIdList = new ArrayList<>();
        List<Long> programIdList = new ArrayList<>();
        List<Long> orgIdList = new ArrayList<>();
        List<ContractDetailsDataModel> contractDetailsMapList = new ArrayList();
        List<String> bundleStartDateSplitToSubList = new ArrayList<>();
        List<String> bundleEndDateSplitToSubList = new ArrayList<>();
        List<String> endDateFinalList = new ArrayList<>();
        List<String> startDateFinalList = new ArrayList<>();
        List<String> bundleStartDateFinalList = new ArrayList<>();
        List<String> bundleEndDateFinalList = new ArrayList<>();
        List<ParticipatingBundlesDataModel> participatingBundleList = new ArrayList<>();

        List<PricingListDataModel> priceList;
        List<String> baselineEndDateFinalList = new ArrayList<>();
        List<String> baseLineEndDateSplitToSubList = new ArrayList<>();
        List<String> baselineStartDateFinalList = new ArrayList<>();
        List<String> baseLineStartDateSplitToSubList = new ArrayList<>();
        List<String> priceEndDateFinalList = new ArrayList<>();
        List<String> priceEndDateSplitToSubList = new ArrayList<>();
        List<String> priceStartDateFinalList, priceStartDateSplitToSubList = new ArrayList<>();
        List<String> lowerBoundFinalList, lowerBoundSplitToSubList = new ArrayList<>();
        List<String> upperBoundFinalList, upperBoundSplitToSubList = new ArrayList<>();
        List<String> trendFactorFinalList, trendFactorSplitToSubList = new ArrayList<>();
        List<String> priceFinalList, priceSplitToSubList = new ArrayList<>();

        if (StringUtils.isBlank(orgIdFrmCucumber)) {
            if (orgType.equals("hospital")) {
                orgIdList.add(CreateACHOrganizationAPI.copyIDList.get(0));
            }
            else if (orgType.equals("hospitalNOMO")) {
            	orgIdList.add(CreateACHOrganizationAPI.copyIDList.get(1)); 
            }
            else if (orgType.equals("pgp")) {
                orgIdList = CreatePGPOrganizationAPI.getId(orgType);
            } 
            else if (orgType.equals("hha")) {
                orgIdList = CreateHHAOrganizationAPI.getId(orgType);
            }
            else if (orgType.equals("snf")) {
                orgIdList = CreateSNFOrganizationAPI.getId(orgType);
            }
            else
            {
                throw new InvalidArgumentException("Invalid organization type passed");
            }
        } 
        else {
            List<String> orgIdSplitList = insertData.splitIntoSubList(orgIdFrmCucumber);
            orgIdList.add(Long.valueOf(orgIdSplitList.get(0)));
        }

        //adding to a list after spliting the cucumber data and get the index and insert to participating bundle map
        if (StringUtils.isBlank(cBundleId)) 
        {
            bundleIdList = CreateBundleAPI.getId(orgType);
        }
        else 
        {
            List<String> bundleIdSplitList = insertData.splitIntoSubList(cBundleId);
            bundleIdList.add(Long.valueOf(bundleIdSplitList.get(0)));
        }
        if (StringUtils.isBlank(cProgramId)) 
        {
            programIdList = CreatePrograms.getId(orgType);
        } 
        else 
        {
            List<String> prgIdSplitList = insertData.splitIntoSubList(cProgramId);
            Long prfId = Long.valueOf(prgIdSplitList.get(0));
            programIdList.add(prfId);
        }

        // bundle data split from cucumber
        bundleStartDateSplitToSubList = insertData.splitIntoSubList(cbundleStartDate);
        bundleEndDateSplitToSubList = insertData.splitIntoSubList(cBundleEndDate);
        startDateFinalList = insertData.splitIntoSubList(cStartDate);
        endDateFinalList = insertData.splitIntoSubList(cEndDate);

        // price  data split from cucumber
        baseLineEndDateSplitToSubList = insertData.splitIntoSubList(baseLineEndDate);
        baseLineStartDateSplitToSubList = insertData.splitIntoSubList(baseLineStartDate);
        priceEndDateSplitToSubList = insertData.splitIntoSubList(priceEndDate);
        priceStartDateSplitToSubList = insertData.splitIntoSubList(priceStartDate);
        lowerBoundSplitToSubList = insertData.splitIntoSubList(lowerBound);
        upperBoundSplitToSubList = insertData.splitIntoSubList(upperBound);
        trendFactorSplitToSubList = insertData.splitIntoSubList(trendFactor);
        priceSplitToSubList = insertData.splitIntoSubList(bundlePrice);

        List<String> contractIdFinalList = insertData.splitIntoSubList(contractId);

        int contractIdFinalListSize = contractIdFinalList.size();
        int programIdListSize = programIdList.size();
        if (contractIdFinalListSize > 1 && programIdList.size() < contractIdFinalListSize) 
        {
            for (int i = programIdListSize; i < contractIdFinalListSize; i++) 
            {
                programIdList.add(programIdList.get(0));
            }
        }
        int orgIdListSize = orgIdList.size();
        if (contractIdFinalListSize > 1 && orgIdListSize < contractIdFinalListSize) 
        {
            for (int i = orgIdListSize; i < contractIdFinalListSize; i++)
            {
                orgIdList.add(orgIdList.get(0));
            }
        }
        for (int i = 0; i < contractIdFinalList.size(); i++) {
            bundleStartDateFinalList = insertData.splitList(bundleStartDateSplitToSubList.get(i));
            bundleEndDateFinalList = insertData.splitList(bundleEndDateSplitToSubList.get(i));
            participatingBundleList = new ArrayList<>();
            ParticipatingBundlesDataModel participatingBundlesDataModel;
            PricingListDataModel pricingListDataModel;

            for (int j = 0; j < bundleEndDateFinalList.size(); j++) 
            {
                priceList = new ArrayList<>();
                baselineEndDateFinalList = insertData.splitList(baseLineEndDateSplitToSubList.get(i));
                baselineStartDateFinalList = insertData.splitList(baseLineStartDateSplitToSubList.get(i));
                priceEndDateFinalList = insertData.splitList(priceEndDateSplitToSubList.get(i));
                priceStartDateFinalList = insertData.splitList(priceStartDateSplitToSubList.get(i));
                lowerBoundFinalList = insertData.splitList(lowerBoundSplitToSubList.get(i));
                upperBoundFinalList = insertData.splitList(upperBoundSplitToSubList.get(i));
                trendFactorFinalList = insertData.splitList(trendFactorSplitToSubList.get(i));
                priceFinalList = insertData.splitList(priceSplitToSubList.get(i));

                for (int k = 0; k < priceFinalList.size(); k++)
                {
                    pricingListDataModel = new PricingListDataModel(priceEndDateFinalList.get(k), priceStartDateFinalList.get(k), Double.valueOf(priceFinalList.get(k)), baselineEndDateFinalList.get(k), baselineStartDateFinalList.get(k), Double.valueOf(trendFactorFinalList.get(k)), Double.valueOf(upperBoundFinalList.get(k)), Double.valueOf(lowerBoundFinalList.get(k)));
                    priceList.add(pricingListDataModel);
                }
                participatingBundlesDataModel = new ParticipatingBundlesDataModel(bundleEndDateFinalList.get(j), bundleIdList.get(j), bundleStartDateFinalList.get(j), priceList);
                participatingBundleList.add(participatingBundlesDataModel);
            }
            if (StringUtils.isNotBlank(contractIdFinalList.get(i)) && contractIdFinalList.get(i).length() < 8) {
                String timeStmp = createRandomNumber(8);
                contractIdFinalList.set(i, contractIdFinalList.get(i) + timeStmp);
            }
            else if ((StringUtils.isNotBlank(contractIdFinalList.get(i)) && contractIdFinalList.get(i).length() == 8)) {
                contractIdFinalList.set(i, contractIdFinalList.get(i));
            }
            ContractDetailsDataModel contractDetailsPre = new ContractDetailsDataModel(contractIdFinalList.get(i), endDateFinalList.get(i), orgIdList.get(i), programIdList.get(i), startDateFinalList.get(i), type, participatingBundleList);
            contractDetailsMapList.add(contractDetailsPre);
        }
        jsonString = generateJson(contractDetailsMapList);
    }

	public void createContractWithThisData() throws Throwable {
        String urlExt = "contract/bundlepayment";
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
