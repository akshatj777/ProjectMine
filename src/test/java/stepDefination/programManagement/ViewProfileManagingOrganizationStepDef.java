package stepDefination.programManagement;

import com.remedy.programManagement.ViewProfileManagingOrganization;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

public class ViewProfileManagingOrganizationStepDef extends DriverScript {
	
	ViewProfileManagingOrganization viewProfileMO = new ViewProfileManagingOrganization(driver);

	@And("^I verify \"([^\"]*)\" name on the header of view profile$")
	  public void i_Verify_Name_On_Header_On_View_Profile(String text) throws Throwable {
		viewProfileMO.iVerifyNameOnHeaderOnViewProfile(text);
	    }
	
	@And("^I verify Participant Id on view profile of \"([^\"]*)\" Organization$")
	  public void i_Verify_ParticipantId_On_View_Profile_Of_Organization(String org) throws Throwable {
		viewProfileMO.iVerifyParticipantIdOnVewProfileOfOrganization(org);
	    }
	
	@And("^I verify ([^\"]*) in \"([^\"]*)\" on view profile of \"([^\"]*)\" Organization$")
	  public void i_Verify_Details_In_Field_On_View_Profile_Of_Organization(String text, String sel,String org) throws Throwable {
		viewProfileMO.iVerifyDetailsInFieldOnViewProfileOfOrganization(text,sel);
	    }
	
	@And("^I verify \"([^\"]*)\" organization tab present under \"([^\"]*)\" Organization$")
	  public void i_Verify_Organziation_Tab_Present_Under_Managing_Organization(String org, String org1) throws Throwable {
		viewProfileMO.iVerifyOrganizationPresentUnderManagingOrganization(org,org1);
	    }
	
	@Then("^I verify \"([^\"]*)\" organization tab by default selected under Managing Organization$")
	  public void i_Verify_Organization_By_Default_Selected_Under_ManagingOrganization(String org) throws Throwable {
		viewProfileMO.iVerifyOrganizationByDefaultSelectedUnderManagingOrganization(org);
		}
	
	@And("^I verify \"([^\"]*)\" header label under \"([^\"]*)\" organization$")
	  public void i_Verify_Header_Label_Under_Organization(String header,String org) throws Throwable {
		viewProfileMO.iVerifyHeaderLabelUnderSelectedOrganization(header,org);
		}
	
	@And("^I verify the count \"([^\"]*)\" for the associated organization$")
	  public void I_verify_the_count_associated_with_organization(String count) throws Throwable {
		viewProfileMO.iVerifytheCountFortheAssociatedorganization(count);
		}
		
	@And("^I click on \"([^\"]*)\" organization under Managing Organization$")
	  public void i_Click_On_Organization_Under_ManagingOrganization(String org) throws Throwable {
		viewProfileMO.iClickOnOrganizationUnderManagingOrganization(org);
		}
	
	@And("^User should get redirected to the managing organization tab page$")
	  public void user_should_get_redirected_to_the_managing_organization_tab_page() throws Throwable {
		viewProfileMO.userShouldGetRedirectedToTheManagingOrganizationTabPage();
		}
	
	@And("^I Verify the \"([^\"]*)\" button on View page$")
	  public void i_Verify_The_Button_On_View_Page(String button) throws Throwable {
		viewProfileMO.iVerifyTheEditButtonontheViewPage(button);
		}
	
	@Then ("^i navigate my URL \"([^\"]*)\"$")
	public void letsnavigate(String url){
		viewProfileMO.letnavigate(url);
	}
	
	@Then ("^I click on \"([^\"]*)\" link under No matches$")
	public void i_Click_On_Create_New_Organization_link_under_No_Matches(String link){
		viewProfileMO.iClickOnCreateNewOrganizationlinkunderNoMatches(link);
	}
	
	@Then ("^I verify the respective Managing Organization should be pre-filled or selected on the Create organization page$")
	public void i_Verify_the_Respective_Managing_Organization_should_be_Prefilled_or_Selected_on_the_Create_organization_page(){
		viewProfileMO.iVerifytheRespectiveManagingOrganizationShouldbePrefilledorSelectedontheCreateOrganizationPage();
	}
	
	@And("^User should get redirected to the managing organization profile page$")
	  public void user_should_get_redirected_to_the_managing_organization_Profile_page() throws Throwable {
		viewProfileMO.userShouldGetRedirectedToTheManagingOrganizationProfilePage();
		}
}