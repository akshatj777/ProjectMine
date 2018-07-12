package stepDefination.programManagement;

import com.remedy.programManagement.CreateACHOrganization;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;

public class CreateACHOrganizationStepDef extends DriverScript {
	 CreateACHOrganization createACH = new CreateACHOrganization(driver);
	
	@And("^I verify \"([^\"]*)\" dropdown field on ([^\"]*) organization page$")
	  public void i_Verify_Label_DropDown_Field_On_Create_Organization_Page(String text, String page) throws Throwable {
		createACH.iVerifyLabelDropDownFieldOnCreateOrganizationPage(text);
	    }
	 @And("^I click on \"([^\"]*)\" organization tab on organization dashboard$")
	  public void i_Click_On_Particular_Organization_Tab_Organization_Dashboard(String text) throws Throwable {
		 createACH.iClickOnParticularOrganizationTabOrganizationDashboard(text);
	 }
	 
	 @And("^I provide unique \"([^\"]*)\" in \"([^\"]*)\" on create organization page$")
	  public void i_Enter_Identifiers_In_Filed_On_Create_Organization_Page(String id, String field) throws Throwable {
		 createACH.iEnterCNNorNPIorEINIdOnCreateOrganizationPage(id, field);
	    }
	 
	 @And("^I enter location name ([^\"]*) for Location \"([^\"]*)\" on \"([^\"]*)\" organization page$")
	  public void i_Enter_LocationName_For_Locations_On_OrganizationPage(String text,int num, String field) throws Throwable {
		 createACH.iEnterLocationNameForLocationOnACHOrg(text,num);
	    }
	 
	 @And("^I enter address1 ([^\"]*) for Location \"([^\"]*)\" on \"([^\"]*)\" organization page$")
	  public void i_Enter_Address1_For_Locations_On_OrganizationPage(String text,int num, String field) throws Throwable {
		 createACH.iEnterAddress1ForLocationOnACHOrg(text,num);
	    }
	 
	 @And("^I select location type ([^\"]*) for Location \"([^\"]*)\" on \"([^\"]*)\" organization page$")
	  public void i_Enter_LocationType_For_Locations_On_OrganizationPage(String text,int num, String field) throws Throwable {
		 createACH.iEnterLocationTypeForLocationOnACHOrg(text,num);
	    }
	 
	 @And("^I enter address2 ([^\"]*) for Location \"([^\"]*)\" on \"([^\"]*)\" organization page$")
	  public void i_Enter_Address2_For_Locations_On_OrganizationPage(String text,int num, String field) throws Throwable {
		 createACH.iEnterAddress2ForLocationOnACHOrg(text,num);
	    }
	 
	 @And("^I select region ([^\"]*) for Location \"([^\"]*)\" on \"([^\"]*)\" organization page$")
	  public void i_Enter_region_For_Locations_On_OrganizationPage(String text,int num, String field) throws Throwable {
		 createACH.iEnterRegionForLocationOnACHOrg(text,num);
	    }
	 
	 @And("^I enter city ([^\"]*) for Location \"([^\"]*)\" on \"([^\"]*)\" organization page$")
	  public void i_Enter_City_For_Locations_On_OrganizationPage(String text,int num, String field) throws Throwable {
		 createACH.iEnterCityForLocationOnACHOrg(text,num);
	    }
	 
	 @And("^I select market ([^\"]*) for region \"([^\"]*)\" for Location \"([^\"]*)\" on \"([^\"]*)\" organization page$")
	  public void i_Enter_Market_For_Locations_On_OrganizationPage(String market, String region, int num, String field) throws Throwable {
		 createACH.iEnterMarketForLocationOnACHOrg(market,region,num);
	    }
	 
	 @And("^I select state ([^\"]*) for Location \"([^\"]*)\" on \"([^\"]*)\" organization page$")
	  public void i_Enter_state_For_Locations_On_OrganizationPage(String text,int num, String field) throws Throwable {
		 createACH.iEnterStateForLocationOnACHOrg(text,num);
	    }
	 
	 @And("^I enter zip ([^\"]*) for Location \"([^\"]*)\" on \"([^\"]*)\" organization page$")
	  public void i_Enter_zip_For_Locations_On_OrganizationPage(String text,int num, String field) throws Throwable {
		 createACH.iEnterZipForLocationOnACHOrg(text,num);
	    }
	 @And("^I select \"([^\"]*)\" radio button for managing organization$")
	  public void i_Select_Radio_Button_For_Managing_Organization(String text) throws Throwable {
		 createACH.iSelectRadioButtonForManagingOrganization(text);
	 }
	
	 @And("^I select \"([^\"]*)\" managing organization name in \"([^\"]*)\" Has a Management Organization drop down$")
	  public void i_Select_ManagingOrg_Name_In_Has_A_Managing_Organization_DropDown(String mo, String text) throws Throwable {
		 createACH.iSelectManagingOrgNameInHasAManagingOrganizationDropDown(mo, text);
	 }
	 
	 @And("^I verify \"([^\"]*)\" on \"([^\"]*)\" organization page$")
	  public void i_Verify_Location_Header_On_Organization_Page(String location, String org) throws Throwable {
		 createACH.iVerifyLocationHeaderOnOrganizationPage(location);
	 }
	 
	 @And("^I verify \"([^\"]*)\" location count on view \"([^\"]*)\" organization page$")
	  public void i_Verify_Location_Count_On__View_Organization_Page(int count, String org) throws Throwable {
		 createACH.iVerifyLocationCountOnViewOrganizationPage(count);
	 }
	 
	 @And("^I verify \"([^\"]*)\" in Has a Management Organization dropdown$")
	  public void i_Verify_Message_In_Has_Management_Organization_DropDown(String text) throws Throwable {
		 createACH.iVerifyMessageInHasAManagementOrganization(text);
	 }
	 
	 @And("^I click on \"([^\"]*)\" organization tab on under Managing Organization$")
	  public void i_Click_On_Particular_Organization_Tab_on_Under_Managing_Organization(String text) throws Throwable {
		 createACH.iClickOnParticularOrganizationTabOrganizationDashboard(text);
	 }
	 
	 @And("^I enter Location Id ([^\"]*) for Location \"([^\"]*)\" on \"([^\"]*)\" organization page$")
	  public void i_Enter_LocationID_For_Locations_On_OrganizationPage(String text,int num, String field) throws Throwable {
		 createACH.iEnterLocationIDForLocationOnACHOrg(text,num,field);
	    }
	 
	 @And("^I verify Location ID should be same as \"([^\"]*)\" Organization CCN$")
	  public void i_Verify_LocationID_Should_be_Same_as_Organization_CCN(String text) throws Throwable {
		 createACH.iVerifyLocationIDShouldbeSameasOrganizationCCN(text);
	    }
	 
	 @And("^I verify Location ID should be greater than \"([^\"]*)\"$")
	  public void i_Verify_LocationID_Should_be_Greater(int value) throws Throwable {
		 createACH.iVerifyLocationIdShouldBeGreater(value);
	    }
	 
	 @And("^I provide \"([^\"]*)\" as last created \"([^\"]*)\" on create organization page$")
	  public void i_Provide_From_Last_Created_Id_Create_Organization_Page(String id,String field) throws Throwable {
		 createACH.iProvideFromLastCreatedIdOnCreateOrganizationPage(id,field);
	    }
	 
	 @And("^I verify duplicate Location Message \"([^\"]*)\"$")
	  public void i_Verify_Duplicate_Location_Message(String text) throws Throwable {
		 createACH.iVerifyDuplicateLocationMessage(text);
	    }
	 
	 @And("^I search and verify \"([^\"]*)\" managing organization name in \"([^\"]*)\" Has a Management Organization drop down box$")
	  public void i_Searchandverify_ManagingOrg_Name_In_Has_A_Managing_Organization_DropDown(String mo, String text) throws Throwable {
		 createACH.iSearhandverifyManagingOrgNameInHasAManagingOrganizationDropDown(mo, text);
	 }
}