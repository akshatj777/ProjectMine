package stepDefination.programManagement;

import com.remedy.programManagement.ViewACHOrganization;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

public class ViewACHOrganizationStepDef extends DriverScript {
	
	ViewACHOrganization viewACH= new ViewACHOrganization(driver);
	
	@And("^I verify CCN \"([^\"]*)\" on view profile of \"([^\"]*)\" organization$")
	  public void i_Verify_CCN_On_ViewProfile_Of_Slecetd_Organization(String text, String org) throws Throwable {
		viewACH.iVerifyCCNOnViewProfileOfSelectedOrganization(text, org);
	}

	@And("^I verify EIN/TIN id \"([^\"]*)\" on view profile of \"([^\"]*)\" organization$")
	  public void i_Verify_EIN_TIN_Id_On_View_Profile_Of_Organization(String text, String org) throws Throwable {
		viewACH.iVerifyEINTINIdOnViewProfileOrganization(text, org);
	}
	
	@And("^I verify NPI number \"([^\"]*)\" on view profile of \"([^\"]*)\" organization$")
	  public void i_Verify_NPI_On_View_Profile_Of_Organization(String text, String org) throws Throwable {
		viewACH.iVerifyNPIOnViewProfileOrganization(text, org);
	}
	
	@And("^I verify header name \"([^\"]*)\" under \"([^\"]*)\" for \"([^\"]*)\" organization$")
	  public void i_Verify_Header_Name_UnderTab_For_Slecetd_Organization(String tab, String loc, String org) throws Throwable {
		viewACH.iVerifyHeaderNameUnderSelectedOrganization(tab);
	}
	
	@And("^I verify Region name ([^\"]*) on view profile of \"([^\"]*)\" organization$")
	  public void i_Verify_RegionName_On_ViewProfile_Of_Slecetd_Organization(String name, String org) throws Throwable {
		viewACH.iVerifyRegionNameInVeiwProfileOfSelectedOrganization(name);
	}
	
	@And("^I verify Market name ([^\"]*) on view profile of \"([^\"]*)\" organization$")
	  public void i_Verify_MarketName_On_ViewProfile_Of_Slecetd_Organization(String name, String org) throws Throwable {
		viewACH.iVerifyMarketNameInVeiwProfileOfSelectedOrganization(name);
	}
	
	@And("^I verify the count of the Location$")
	  public void i_Verify_the_count_of_the_Location(String text) throws Throwable {
		viewACH.iVerifytheCountOftheLoaction(text);
	}
	
	@And("^I click on Add Location button$")
	  public void i_Click_on_Add_New_location(String button) throws Throwable {
		viewACH.iClickonAddNewLocationButton(button);
	}
	
	@Then("^I verify the Search bar in Location on \"([^\"]*)\" Profile Page$")
	  public void i_Verify_the_SearchBar_In_Location_on_profile_page(String text) throws Throwable {
		viewACH.iClickonAddNewLocationButton(text);
	}
	
	@And("^User should get redirected to the \"([^\"]*)\" organization tab page$")
	  public void user_should_get_redirected_to_the_managing_organization_tab_page(String text) throws Throwable {
		viewACH.userShouldGetRedirectedToTheOrganizationTabPage(text);
		}
	
	@And("^I verify \"([^\"]*)\" on view profile of \"([^\"]*)\" Organization$")
	  public void I_Verify_ManagingOrganization_on_view_profile_of_organization(String text, String org) throws Throwable {
		viewACH.iVerifyManagingOrganizationOnViewProfileOfOrganizationPage(text,org);
		}

	@And("^I verify \"([^\"]*)\" radio button is checked$")
	  public void I_Verify_MO_Radio_Button_Checked(String text) throws Throwable {
		viewACH.iVerifyMORadioButtonChecked(text);
		}
	
	@And("^I verify Managing Organization is auto filled on \"([^\"]*)\" Organization page$")
	  public void I_Verify_ManagingOrganization_Auto_Filled_On_OrganizationPage(String org) throws Throwable {
		viewACH.iVerifyManagingOrganizationOnAutoFilledOnOrganizationPage(org);
		}
	
	@And("^I verify \"([^\"]*)\" details of \"([^\"]*)\" associated on Managing Organization page$")
	  public void I_Verify_Details_Of_Org_Associated_On_OrganizationPage(String text, String org) throws Throwable {
		viewACH.iVerifyDetailsOfOrgAssociatedWithMO(text,org);
		}
	
	@And("^I get the count of \"([^\"]*)\" organizations$")
	  public void i_Get_Count_Of_Tab_Organizations(String org) throws Throwable {
		viewACH.iGetCountOfAssociatedOrganization(org);
		}
	
	@And("^I verify count of \"([^\"]*)\" organizations is increased by 2$")
	  public void i_Verify_Count_Tab_Organizations_Increased1(String org) throws Throwable {
		viewACH.iVerifyCountOfAssociatedOrgIncreasedBy2(org);
		}
	
	@And("^I search with \"([^\"]*)\" on view profile Managing Organization search box$")
	  public void i_Search_With_OrgName_on_view_Profile_Of_Managing_Organization_Search_Box(String text) throws Throwable {
		viewACH.iSearchWithOrgNameonViewProfileOfManagingOrganizationSearchBox(text);
		}
	
	@And("^I click \"([^\"]*)\" for \"([^\"]*)\" organization under MO profile page$")
	  public void i_Click_On_OrgName_on_view_Profile_Of_Managing_Organization_Search_Box(String text, String org) throws Throwable {
		viewACH.iClickOnOrgNameonViewProfileOfManagingOrganizationSearchBox(text, org);
		}
	
	@And("^I verify Location details of \"([^\"]*)\" on view profile of \"([^\"]*)\" organization$")
	  public void i_Verify_LocationDetails_On_ViewProfile_Of_Slecetd_Organization(String text, String org) throws Throwable {
		viewACH.iVerifyLocationDetailsonVeiwProfileOfSelectedOrganization(text, org);
	}
	
	@And("^I verify Location index id \"([^\"]*)\" on view profile of \"([^\"]*)\" organization$")
	  public void i_Verify_LocationIndexId_On_ViewProfile_Of_Slecetd_Organization(String LId, String org) throws Throwable {
		viewACH.iVerifyLocationIndexIdonVeiwProfileOfSelectedOrganization(LId, org);
	}
	
	@And("^I verify CCN id \"([^\"]*)\" on \"([^\"]*)\" organization profile page$")
	  public void i_Verify_CCN_Identifier_On_ViewProfile_Of_Selected_Organization(String text, String org) throws Throwable {
		viewACH.iVerifyCCNIdentifierOnViewProfileOfSelectedOrganization(text, org);
	}

	@And("^I verify EIN/TIN id \"([^\"]*)\" on \"([^\"]*)\" organization profile page$")
	  public void i_Verify_EIN_Identifier_Id_On_View_Profile_Of_Organization(String text, String org) throws Throwable {
		viewACH.iVerifyEINIdentifierOnViewProfileOrganization(text, org);
	}
	
	@And("^I verify NPI id \"([^\"]*)\" on \"([^\"]*)\" organization profile page$")
	  public void i_Verify_NPI_Idetifier_On_View_Profile_Of_Organization(String text, String org) throws Throwable {
		viewACH.iVerifyNPIIdentifierOnViewProfileOrganization(text, org);
	}
	
	
	@Then("^I verify Location indexID for \"([^\"]*)\" organization$")
	  public void i_Verify_LocationIndexId_For_Selected_Organization(String org) throws Throwable {
		viewACH.iVerifyLocationIndexIdForSelectedOrganization(org);
	}
	
}