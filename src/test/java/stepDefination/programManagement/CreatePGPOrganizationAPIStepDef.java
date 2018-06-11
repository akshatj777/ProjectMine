package stepDefination.programManagement;

import com.remedy.programManagement.CreatePGPOrganizationAPI;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class CreatePGPOrganizationAPIStepDef extends DriverScript{
	
	CreatePGPOrganizationAPI createPGPAPI = new CreatePGPOrganizationAPI(driver);

	@Given("^Build Json for PGP \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void build_Json_For_PGP(String cName, String cPid, String shortName, String cMOrgID, String cEin, String cNpi, String cAddr1, String cAddr2, String cCity, String cState, String cZip, String cMarketId) throws Throwable {
		createPGPAPI.buildJsonForPGP(cName, cPid, shortName, cMOrgID, cEin, cNpi, cAddr1, cAddr2, cCity, cState, cZip, cMarketId);
    }

    @When("^create pgp org with this data$")
    public void create_PGPOrg_WithThis_Data() throws Throwable {
    	createPGPAPI.createPgpOrgWithThisData();
    }
}
