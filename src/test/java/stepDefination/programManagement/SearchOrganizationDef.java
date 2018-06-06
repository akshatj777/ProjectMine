package stepDefination.programManagement;

import com.remedy.programManagement.SearchOrganization;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

public class SearchOrganizationDef extends DriverScript{
	SearchOrganization searchorganization = new SearchOrganization(driver);

	@And("^I search with \"([^\"]*)\" on organization in search box$")
	  public void i_Search_Field_On_Organization_In_SearchBox(String text) throws Throwable {
		 searchorganization.iSearchFieldOnOrganizationInSearchBox(text);
	    }
	
	@Then("^I verify the Search bar on \"([^\"]*)\" organization page$")
	  public void i_Verify_the_Search_bar_On_Organization(String text) throws Throwable {
		 searchorganization.iVerifySearchBarOnOrganizationPage(text);
	    }
	
	@And("^I verify \"([^\"]*)\" field in search list on organization page$")
	  public void i_Verify_Field_In_Search_List_On_Organization_Homepage(String text) throws Throwable {
		 searchorganization.iVerifyFieldInSearchListOnOrganizationHomepage(text);
	    }
	
	@And("^I search \"([^\"]*)\" and verify with search list options on \"([^\"]*)\" organization search box$")
	  public void i_Search_With_Search_List_Field_On_Organization_In_SearchBox(String searchParam, String org) throws Throwable {
		 searchorganization.iSearchWithSearchListFieldOnOrganizationInSearchBox(searchParam, org);
	    }
	
	@Then("^I verify the \"([^\"]*)\" message for invalid search in Organization$")
	  public void i_Verify_the_No_Mateches_Message(String text) throws Throwable {
		 searchorganization.iVerifytheNewMatchesMessage(text);
	    }
	
	@And("^I verify the \"([^\"]*)\" link under No matches$")
	  public void i_Verify_the_Create_New_Managing_Organization(String link) throws Throwable {
		 searchorganization.iVerifytheCreateNewOrganizationLinkUnderNoMatches(link);
	    }
	
	@And("^I search with \"([^\"]*)\" old name in organization search box$")
	  public void i_Search_With_OldName_Of_Organization_In_Search(String org) throws Throwable {
		 searchorganization.iSearchWithOldNameInOrganizationSerachBox(org);
	    }
	
	@And("^I search \"([^\"]*)\" and verify with search list options on Location in \"([^\"]*)\" profile page$")
	  public void i_Search_With_Search_List_Field_On_Location_In_Profile_page(String searchParam, String org) throws Throwable {
		 searchorganization.iSearchWithSearchListFieldOnLocationInOrganizationProfilePage(searchParam, org);
	    }
	
	@And("^I search with \"([^\"]*)\" on Location search box in \"([^\"]*)\" View Profile page$")
	  public void i_Search_With_Location_Search_List_Field_in_View_Profile_page(String text, String org) throws Throwable {
		 searchorganization.iSearchFieldOnLocationParametersonViewProfilePage(text, org);
	    }
	
	@And("^I search with \"([^\"]*)\" on \"([^\"]*)\" organization in search box$")
	  public void i_Search_Field_On_ACHandSNF_Organization_In_SearchBox(String text, String org) throws Throwable {
		 searchorganization.iSearchFieldOnACHandSNFOrganizationInSearchBox(text, org);
	    }
}