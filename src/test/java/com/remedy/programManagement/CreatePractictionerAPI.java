package com.remedy.programManagement;

import org.apache.commons.lang3.StringUtils;
import org.openqa.selenium.WebDriver;
import com.google.common.base.Splitter;
import com.google.common.collect.Lists;
import com.google.gson.JsonObject;
import com.remedy.RestCall.*;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

import java.util.ArrayList;
import java.util.List;

public class CreatePractictionerAPI extends BaseClass{
	
	private static List<Long> classificationIdList = new ArrayList<>();
    private static List<Long> groupingIdList = new ArrayList<>();
    private static List<Long> specializationIdList = new ArrayList<>();
    public static List<Long> idList = new ArrayList<>();
    public static List<Long> idProvidertexnomyList = new ArrayList<>();
    public static List<String> practitionerNameList = new ArrayList<>();

	public CreatePractictionerAPI(WebDriver driver) {
		super(driver);
	}
	
	public void createProviderTaxonomyClassificationJson(String cName) throws Throwable {
		String name = createRandomName(cName);
        ProviderTaxonomyClassificationDataModel providerClassification = new ProviderTaxonomyClassificationDataModel(name);
        jsonString = generateJson(providerClassification);
    }
	
	public void createProviderTaxonomyWithThisData(String type) throws Throwable {
        String urlExt = "providertaxonomy/" + type;
        response = RestCallUtil.post(jsonString, DriverScript.Config.getProperty("contentType"), urlExt, new GenerateToken().getAccessToken());
        if (response.statusCode() == 201) {
            if (type.equals("classification")) {
                classificationIdList.add(((Integer) response.path("id")).longValue());
            } else if (type.equals("grouping")) {
                groupingIdList.add(((Integer) response.path("id")).longValue());
            } else if (type.equals("specialization")) {
                specializationIdList.add(((Integer) response.path("id")).longValue());
            }
        }
    }
	
	public void verifyActualVsExp(Integer expCode, String responseMsg) throws Throwable {
         new VerificationMethod().verifyExpectedVsActualResults(response, expCode, responseMsg);
    }
	
	public void createPractitionerJson(String firstName, String lastName, String cNpi, String gender, String cEnumerationDate, String prefix, String suffix, String cNpiDeactivationDate, String npiDeactivationReasonCode, String otherFirstName, String otherLastName, String otherPrefix, String otherSuffix, String cPrimaryTaxonomyIds, String secondaryTaxonomyIds, String liscenceNo, String licenseNumberStateCode, String cAddr1, String cAddr2, String cCity, String cState, String cZip, int noOfLicenses) throws Throwable {

        Long primaryTaxonomyId = null;
        String addr1 = cAddr1;
        String addr2 = cAddr2;
        String city = cCity;
        String state = cState;
        String zip = cZip;
        String npi = createRandomNumber(8);

        List<String> secondaryTaxStringList = Lists.newArrayList(Splitter.on(",").trimResults().split(secondaryTaxonomyIds));
        List<Long> secondaryTaxIdList = new ArrayList<>();

        if (StringUtils.isNotBlank(secondaryTaxonomyIds)) {
            for (String secId : secondaryTaxStringList) {
                secondaryTaxIdList.add(Long.valueOf(secId));
            }
        } else {
            secondaryTaxIdList = null;
        }
        AddressDataModel addrs = new AddressDataModel(addr1, addr2, city, state, zip);

        List<String> liscenceNoList = new ArrayList<>();
        List<String> liscenceNoCodeList = new ArrayList<>();

        if (StringUtils.isNotBlank(licenseNumberStateCode)) {
            liscenceNoCodeList.addAll(Lists.newArrayList(Splitter.on(",").trimResults().split(licenseNumberStateCode)));

        } else {
            liscenceNoCodeList.add("");
        }

        if (StringUtils.isNotBlank(liscenceNo)) {
            liscenceNoList.addAll(Lists.newArrayList(Splitter.on(",").trimResults().split(liscenceNo)));

        } else {
            liscenceNoList.add("");
        }

        List<PractitionerLicensesDataModel> liscenceInfoList = new ArrayList<>();

        for (int i = 0; i < noOfLicenses; i++) {
            if (StringUtils.isBlank(liscenceNo) && StringUtils.isBlank(licenseNumberStateCode)) {
                liscenceInfoList = null;
            } else {
                PractitionerLicensesDataModel practitionerLicensesDataModel = new PractitionerLicensesDataModel(liscenceNoList.get(i), liscenceNoCodeList.get(i));
                liscenceInfoList.add(practitionerLicensesDataModel);
            }
        }
        List<String> providerTaxonomyIdStringList = Lists.newArrayList(Splitter.on(",").trimResults().split(cPrimaryTaxonomyIds));
        
        for (int i = 0; i < providerTaxonomyIdStringList.size(); i++) {
            if (providerTaxonomyIdStringList.get(i).equals("generatePrimaryTaxId")) {
                primaryTaxonomyId = idProvidertexnomyList.get(0);
            } else if (StringUtils.isNotBlank(providerTaxonomyIdStringList.get(i))) {
                primaryTaxonomyId = Long.valueOf(providerTaxonomyIdStringList.get(i));
            }
        }
        PractitionerDataModel practitionerDataModel = new PractitionerDataModel(firstName, lastName, npi, gender, cEnumerationDate, prefix, suffix, cNpiDeactivationDate, npiDeactivationReasonCode, otherFirstName, otherLastName, otherPrefix, otherSuffix, primaryTaxonomyId, secondaryTaxIdList, liscenceInfoList, addrs);
        jsonString = generateJson(practitionerDataModel);
    }
	 
	 public void createProviderTaxonomyJson(String definition, String notes, String cProviderTaxonCode, Long classificationId, Long groupingId, Long specializationId) throws Throwable {

	        String providerTaxonCode;
	        if (classificationId == 0) {
	            classificationId = classificationIdList.get(0);
	        }
	        if (groupingId == 0) {
	            groupingId = groupingIdList.get(0);
	        }
	        if (specializationId == 0) {
	            specializationId = specializationIdList.get(0);
	        }
	        if (StringUtils.isNotBlank(cProviderTaxonCode)) {
	            String randomName = createRandomName(cProviderTaxonCode).substring(06);
	            providerTaxonCode = createRandomName(cProviderTaxonCode);
	        } else {
	            providerTaxonCode = cProviderTaxonCode;
	        }
	        ProviderTaxonomyDataModel providerTaxonomy = new ProviderTaxonomyDataModel(classificationId, groupingId, specializationId, definition, notes, providerTaxonCode);

	        jsonString = generateJson(providerTaxonomy);
	    }
	 
	 public void createProviderTaxonomyWithThisData() throws Throwable {
	        String url = "providertaxonomy/";
	        response = RestCallUtil.post(jsonString,  DriverScript.Config.getProperty("contentType"), url, new GenerateToken().getAccessToken());
	        if (response.statusCode() == 201) {
	            idProvidertexnomyList.add(((Integer) response.path("id")).longValue());
	        }
	    }
	 
	 public void createPractitionerWithThisData() throws Throwable {
		 String urlExt = "practitioner/";
	        response = RestCallUtil.post(jsonString, DriverScript.Config.getProperty("contentType"), urlExt, new GenerateToken().getAccessToken());
	        if (response.statusCode() == 201) {

	            idList.add(((Integer) response.path("id")).longValue());
	        }
	    }
	 
	 public void getById(Long idToGet, String type) throws Throwable {
	        String urlExt = "";
	        if (type.equals("management") || type.equals("hospital") || type.equals("ltch") || type.equals("snf") || type.equals("pgp") || type.equals("payor") || type.equals("hha")) {
	            urlExt = "organization/";
	        } else if (type.equals("bundle")) {
	            urlExt = "bundle/";
	        } else if (type.equals("program")) {
	            urlExt = "program/";
	        } else if (type.equals("bundlePayment")) {
	            urlExt = "contract/";
	        } else if (type.equals("attributionrule")) {
	            urlExt = "program/attributionrule/";
	        } else if (type.equals("practitioner")) {
	            urlExt = "practitioner/";
	        } else if (type.equals("providertaxonomy")) {
	            urlExt = "providertaxonomy/";
	        } else if (type.equals("classification")) {
	            urlExt = "providertaxonomy/classification/";
	        } else if (type.equals("grouping")) {
	            urlExt = "providertaxonomy/grouping/";
	        } else if (type.equals("specialization")) {
	            urlExt = "providertaxonomy/specialization/";
	        }

	        Long id;
	        if (idToGet != 0L) {
	            id = idToGet;
	        }
	        else {
	            id = getId(type).get(0);
	        }
	        response = RestCallUtil.getById(urlExt, id,  DriverScript.Config.getProperty("contentType"),  new GenerateToken().getAccessToken());
	        if (response.statusCode() == 200) {
	        	JsonObject jsonObject = getJsonObject(response.asString());
	        	storeName(type, jsonObject);
	        }
	    }
}
