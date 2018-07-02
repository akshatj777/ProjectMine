package stepDefination.programManagement;

import com.remedy.programManagement.ViewPayorOrganization;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;

public class ViewPayorOrganizationStepDef extends DriverScript{

	ViewPayorOrganization viewPayor= new ViewPayorOrganization(driver);
	
	@And("^I verify \"([^\"]*)\" as default tab selected on view profile of \"([^\"]*)\" Organization$")
	  public void i_Verify_Programs_tab_on_View_profile_of_Payor_Organization(String tab, String org) throws Throwable {
		viewPayor.iVerifyProgramsTabOnViewProfileOfPayorOrganization(tab, org);
		}
	
	@And("^I verify \"([^\"]*)\" tab present under \"([^\"]*)\" Organization$")
	  public void i_Verify_contracts_tab_on_View_profile_of_Payor_Organization(String tab, String org) throws Throwable {
		viewPayor.iVerifyContractsTabOnViewProfileOfPayorOrganization(tab, org);
		}
	
	@And("^I verify the \"([^\"]*)\" button on view profile of \"([^\"]*)\" Organization$")
	  public void i_Verify_buttons_on_View_profile_of_Payor_Organization(String text, String org) throws Throwable {
		viewPayor.iVerifybuttonOnViewProfileOfPayorOrganization(text,org);
		}
	
	@And("^I click on \"([^\"]*)\" tab on view profile of \"([^\"]*)\" Organization$")
	  public void i_Click_on_Contracts_Tab_on_View_profile_of_Payor_Organization(String tab, String org) throws Throwable {
		viewPayor.iClickOnTabOnViewProfileOfPayorOrganization(tab, org);
		}
}