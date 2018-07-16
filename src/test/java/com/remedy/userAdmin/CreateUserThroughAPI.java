package com.remedy.userAdmin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.StringTokenizer;

import org.apache.commons.lang3.RandomStringUtils;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.openqa.selenium.WebDriver;

import com.jayway.restassured.response.Response;
import com.remedy.RestCall.RestCallUtil;
import com.remedy.baseClass.BaseClass;
import com.remedy.resources.DriverScript;

import junit.framework.Assert;

public class CreateUserThroughAPI extends BaseClass {

	public String jsonPayload;
	public CreateUserThroughAPI(WebDriver driver) {
		super(driver);
	}
	
	public void buildJSONForCreateUser(String firstName,String lastName, String email, String phone, String npi, String roleID, String applications, String locations, String learningPathways) throws Throwable {
		JSONObject objFinal = new JSONObject();
		JSONObject objFirstNameValue = new JSONObject();
		JSONObject objLastNameValue = new JSONObject();
		JSONObject objEmailValue = new JSONObject();
		JSONObject objPhoneValue = new JSONObject();
		JSONObject objNPIValue = new JSONObject();
		JSONObject objRoleValue = new JSONObject();
		JSONObject objRoleID = new JSONObject();
		JSONObject objRoleIDValue = new JSONObject();
		JSONObject objApplicationValue = new JSONObject();
		JSONObject objApplicationEnabled = new JSONObject();
		JSONObject objApplication = new JSONObject();
		JSONObject objSPOEApps = new JSONObject();
		JSONObject objSPOEValue = new JSONObject();
		JSONObject objParticipantListValue = new JSONObject();
		JSONArray objParticipantListValueArray = new JSONArray();
		JSONArray objLearningPathwayArray = new JSONArray();
		JSONObject objParticipantID = new JSONObject();

		objFirstNameValue.put("value", firstName);
		objLastNameValue.put("value", lastName);
		if(email.contains("qaautomation"))
		{
			String a = RandomStringUtils.randomAlphabetic(8);
			objEmailValue.put("value", "qaautomation+"+a+"@remedypartners.com");
			MailCreateUser.email="qaautomation+"+a+"@remedypartners.com";
		}
		else
		{
			objEmailValue.put("value", email);
		}
		
		if(!(phone.equals("")))
		{
			objPhoneValue.put("value", phone);
		}
		
		if(!(npi.equals("")))
		{
			if(npi.equals("NPI"))
			{
				String newNPI = createRandomNumber(10);
				objNPIValue.put("value", newNPI);
				CreateUserPage.userNPI = newNPI;
			}
			else
			{
				objNPIValue.put("value", npi);
			}
		}
		
		objRoleIDValue.put("value", roleID.substring(0, roleID.indexOf("-")));
		CreateUserPage.userRole = roleID.substring(roleID.indexOf("-")+1,roleID.length());
		objRoleID.put("id", objRoleIDValue);
		objRoleValue.put("value", objRoleID);
		
		if(applications.contains(","))
		{
			StringTokenizer st = new StringTokenizer(applications, ",");
			ArrayList<String> al = new ArrayList();
			while(st.hasMoreTokens())
			{
				String token = st.nextToken().trim();
				String a = token.substring(token.indexOf("-")+1, token.length());
				al.add(a);
				String b = token.substring(0, token.indexOf("-")); 
				objApplicationEnabled.put("enabled", "true");
				objApplicationValue.put("value", objApplicationEnabled);
				objApplication.put(b, objApplicationValue);
			}
			CreateUserPage.userApplications = al.toString();
			CreateUserPage.userApplications=CreateUserPage.userApplications.replace("[", "");
			CreateUserPage.userApplications=CreateUserPage.userApplications.replace("]", "");
			objSPOEApps.put("apps", objApplication);
			objSPOEValue.put("value", objSPOEApps);
		}
		else
		{
			CreateUserPage.userApplications = applications.substring(0,applications.indexOf("-"));
			objApplicationEnabled.put("enaled", "true");
			objApplicationValue.put("value", objApplicationEnabled);
			objApplication.put(applications.substring(applications.indexOf("-"), applications.length()), objApplicationValue);
			objSPOEApps.put("apps", objApplication);
			objSPOEValue.put("value", objSPOEApps);
		}
		
		if(!(learningPathways.equals("")))
		{
			if(learningPathways.contains(","))
			{
				StringTokenizer st = new StringTokenizer(learningPathways, ",");
				while(st.hasMoreTokens())
				{
					JSONObject objLearningPathwayID = new JSONObject();
					objLearningPathwayID.put("id", st.nextToken().trim());
					objLearningPathwayArray.add(objLearningPathwayID);
				}
			}
			else
			{
				JSONObject objLearningPathwayID = new JSONObject();
				objLearningPathwayID.put("id", learningPathways);
				objLearningPathwayArray.add(objLearningPathwayID);
			}
		}
		
		if(locations.contains(","))
		{
			HashMap<String,String> innerHM = new HashMap<String,String>();
			HashMap<String,HashMap<String,String>> dataPermissions = new HashMap<String,HashMap<String,String>>();
			StringTokenizer st = new StringTokenizer(locations, ",");
			while(st.hasMoreTokens())
			{
				
				String a = st.nextToken().trim();
				String participantID = a.substring(0, a.indexOf("--"));
				String BPID = a.substring(a.indexOf("--")+2, a.lastIndexOf("--"));
				String facilityKey = a.substring(a.lastIndexOf("--")+2, a.length());
				if(dataPermissions.containsKey(participantID))
				{
					//String ab = dataPermissions.get(participantID);
					if(innerHM.containsKey(BPID))
					{
						String ab = innerHM.get(BPID);
						innerHM.put(BPID, facilityKey+","+ab);
						dataPermissions.put(participantID, innerHM);
					}
					else
					{
						innerHM.put(BPID, facilityKey);
						dataPermissions.put(participantID, innerHM);
					}
				}
				else
				{
					innerHM = new HashMap<String,String>();
					innerHM.put(BPID, facilityKey);
					dataPermissions.put(participantID, innerHM);
				}
			}
			
			for(int i=0;i<dataPermissions.size();i++)
			{
				JSONArray objBPIDListArray = new JSONArray();
				JSONObject objParticipantListValueValue = new JSONObject();
				JSONObject objBPIDList = new JSONObject();	
				for(int j=0;j<dataPermissions.get(dataPermissions.keySet().toArray()[i]).size();j++)
				{
						
						JSONObject objFacilityList = new JSONObject();
						JSONObject objBPID = new JSONObject();
						JSONArray objFacilityListArray = new JSONArray();
						JSONObject objBPIDValue = new JSONObject();
						JSONObject objBPIDListValue = new JSONObject();
						String BPID = "";
						if(dataPermissions.get(dataPermissions.keySet().toArray()[i]).get(dataPermissions.get(dataPermissions.keySet().toArray()[i]).keySet().toArray()[j]).contains(","))
						{
							StringTokenizer st1 = new StringTokenizer(dataPermissions.get(dataPermissions.keySet().toArray()[i]).get(dataPermissions.get(dataPermissions.keySet().toArray()[i]).keySet().toArray()[j]),",");
							while(st1.hasMoreTokens())
							{
								JSONObject objFacilityKeyValue = new JSONObject();
								JSONObject objParticipantIDValue = new JSONObject();
								JSONObject objFacilityKey = new JSONObject();
								JSONObject objFacilityListValue = new JSONObject();
								String newToken = st1.nextToken().trim();
								String participantID = dataPermissions.keySet().toArray()[i].toString();
								BPID = dataPermissions.get(dataPermissions.keySet().toArray()[i]).keySet().toArray()[j].toString();
								String facilityKey = newToken;
								objParticipantIDValue.put("value", participantID);
								objParticipantID.put("participantID", objParticipantIDValue);
								objFacilityKeyValue.put("value", facilityKey);
								objFacilityKey.put("facilityKey", objFacilityKeyValue);
								objFacilityListValue.put("value", objFacilityKey);
								objFacilityListArray.add(objFacilityListValue);
							}
							objFacilityList.put("facilityList", objFacilityListArray);
							objBPIDValue.put("value", BPID);
							objBPID.put("bpid", objBPIDValue);
							objBPID.putAll(objFacilityList);
							objFacilityList.putAll(objBPID);
							objBPIDListValue.put("value", objFacilityList);
							objBPIDListArray.add(objBPIDListValue);
						}
						else
						{
							String participantID = dataPermissions.keySet().toArray()[i].toString();
							BPID = dataPermissions.get(dataPermissions.keySet().toArray()[i]).keySet().toArray()[j].toString();
							String facilityKey = dataPermissions.get(dataPermissions.keySet().toArray()[i]).get(dataPermissions.get(dataPermissions.keySet().toArray()[i]).keySet().toArray()[j]);
							JSONObject objParticipantIDValue = new JSONObject();
//							JSONObject objFacilityList = new JSONObject();
							JSONObject objFacilityListValue = new JSONObject();
							JSONObject objFacilityKeyValue = new JSONObject();
							JSONObject objFacilityKey = new JSONObject();
//							JSONObject objBPID = new JSONObject();
//							JSONArray objFacilityListArray = new JSONArray();
//							JSONObject objBPIDValue = new JSONObject();
//							JSONObject objBPIDListValue = new JSONObject();
							objParticipantIDValue.put("value", participantID);
							objParticipantID.put("participantID", objParticipantIDValue);
							objFacilityKeyValue.put("value", facilityKey);
							objFacilityKey.put("facilityKey", objFacilityKeyValue);
							objFacilityListValue.put("value", objFacilityKey);
							objFacilityListArray.add(objFacilityListValue);
							objFacilityList.put("facilityList", objFacilityListArray);
							objBPIDValue.put("value", BPID);
							objBPID.put("bpid", objBPIDValue);
							objBPID.putAll(objFacilityList);
							objFacilityList.putAll(objBPID);
							objBPIDListValue.put("value", objFacilityList);
							objBPIDListArray.add(objBPIDListValue);
						}
				}
				objBPIDList.put("bpidList", objBPIDListArray);
				objBPIDList.putAll(objParticipantID);
				objParticipantListValueValue.put("value", objBPIDList);
//				objParticipantListValueValue.put("participantID", objParticipantIDValue);
				objParticipantListValueArray.add(objParticipantListValueValue);	

			}
			objParticipantListValue.put("value", objParticipantListValueArray);
		}
		else
		{
			JSONObject objFacilityList = new JSONObject();
			JSONObject objFacilityListValue = new JSONObject();
			JSONObject objFacilityKeyValue = new JSONObject();
			JSONObject objFacilityKey = new JSONObject();
			JSONObject objParticipantIDValue = new JSONObject();
			JSONObject objBPID = new JSONObject();
			JSONArray objFacilityListArray = new JSONArray();
			JSONObject objBPIDValue = new JSONObject();
			JSONObject objBPIDListValue = new JSONObject();
			JSONArray objBPIDListArray = new JSONArray();
			JSONObject objParticipantListValueValue = new JSONObject();
			JSONObject objBPIDList = new JSONObject();
			String participantID = locations.substring(0, locations.indexOf("--"));
			String BPID = locations.substring(locations.indexOf("--")+2, locations.lastIndexOf("--"));
			String facilityKey = locations.substring(locations.lastIndexOf("--")+2, locations.length());
			objParticipantIDValue.put("value", participantID);
			objParticipantID.put("participantID", objParticipantIDValue);
			objFacilityKeyValue.put("value", facilityKey);
			objFacilityKey.put("facilityKey", objFacilityKeyValue);
			objFacilityListValue.put("value", objFacilityKey);
			objFacilityListArray.add(objFacilityListValue);
			objFacilityList.put("facilityList", objFacilityListArray);
			objBPIDValue.put("value", BPID);
			objBPID.put("bpid", objBPIDValue);
			//objBPID.putAll(objFacilityList);
			objFacilityList.putAll(objBPID);
			objBPIDListValue.put("value", objFacilityList);
			objBPIDListArray.add(objBPIDListValue);
			objBPIDList.put("bpidList", objBPIDListArray);
			objBPIDList.putAll(objParticipantID);
			objParticipantListValueValue.put("value", objBPIDList);
			//objParticipantListValueValue.put("participantID", objParticipantIDValue);
			objParticipantListValueArray.add(objParticipantListValueValue);
			objParticipantListValue.put("value", objParticipantListValueArray);
		}
		
		objFinal.put("participantList", objParticipantListValue);
		objFinal.put("spoeApps", objSPOEValue);
		objFinal.put("organizationalRole", objRoleValue);
		objFinal.put("npi", objNPIValue);
		objFinal.put("phone", objPhoneValue);
		objFinal.put("email", objEmailValue);
		objFinal.put("lastName", objLastNameValue);
		objFinal.put("firstName", objFirstNameValue);
		objFinal.put("learningPathwayList", objLearningPathwayArray);
		jsonPayload = objFinal.toJSONString();
	}

	public void createUserWithThisData(String user) throws Throwable {
		String url = "account/save";
        response = RestCallUtil.post(jsonPayload,  DriverScript.Config.getProperty("contentType"), url, getAccessToken());
        System.out.println(response.getStatusCode());
        if (response.getStatusCode() == 200) 
        {
        	System.out.println("User successfully created through API");
        	HashMap<String,String> emailList = new HashMap<String,String>();
    		HashMap<String,String> applicationsList = new HashMap<String,String>();
    		HashMap<String,String> NPIList = new HashMap<String,String>();
    		emailList.put(CreateUserPage.userRole.trim(), MailCreateUser.email.trim());
    		applicationsList.put(CreateUserPage.userRole.trim(), CreateUserPage.userApplications);
    		NPIList.put(CreateUserPage.userRole.trim(), CreateUserPage.userNPI);
    		CreateUserPage.userNPI = "";
    		if(user.contains("Super Admin"))
    		{
    			CreateUserPage.usersEmailPerRole.put(user.trim()+"-"+CreateUserPage.userRole.trim(), emailList);
    			CreateUserPage.usersApplicationsPerRole.put(user.trim()+"-"+CreateUserPage.userRole.trim(), applicationsList);
    			CreateUserPage.usersNPIPerRole.put(user.trim()+"-"+CreateUserPage.userRole.trim(), NPIList);
    		}
    		else if(user.contains("Remedy Technical Administrator"))
    		{
    			CreateUserPage.usersEmailPerRole.put(user.trim()+"-"+CreateUserPage.userRole.trim(), emailList);
    			CreateUserPage.usersApplicationsPerRole.put(user.trim()+"-"+CreateUserPage.userRole.trim(), applicationsList);
    			CreateUserPage.usersNPIPerRole.put(user.trim()+"-"+CreateUserPage.userRole.trim(), NPIList);
    		}
    		else if(user.contains("Partner Technical Administrator"))
    		{
    			CreateUserPage.usersEmailPerRole.put(user.trim()+"-"+CreateUserPage.userRole.trim(), emailList);
    			CreateUserPage.usersApplicationsPerRole.put(user.trim()+"-"+CreateUserPage.userRole.trim(), applicationsList);
    			CreateUserPage.usersNPIPerRole.put(user.trim()+"-"+CreateUserPage.userRole.trim(), NPIList);
    		}
        }
	}

	public void verifyActualExpectedResults(String responseCode, String responseMessage) throws Throwable {
	Assert.assertEquals(responseCode,Integer.toString(response.getStatusCode()));
	}

	public String getAccessToken() throws Throwable {

        String token = null;

        Response response = RestCallUtil.post("{\"username\":\"" + DriverScript.Config.getProperty("useradmin.username") + "\",\"password\":\"" + DriverScript.Config.getProperty("useradmin.password") + "\",\"scope\":\"" + DriverScript.Config.getProperty("useradmin.scope") + "\",\"grant_type\":\"" + DriverScript.Config.getProperty("useradmin.grant_type") + "\"}", "application/json", DriverScript.Config.getProperty("useradmin.auth0url"), "");

        if (response.getStatusCode() == 200) {

        	if(DriverScript.Config.getProperty("APICallForApplication").equals("PM"))
        	{
        		token = response.path("access_token");
        	}
        	else if(DriverScript.Config.getProperty("APICallForApplication").equals("UA"))
        	{
        		token = response.path("id_token");
        	}
            
        }
        return token;
    }
}
