package stepDefination.programManagement;

import com.remedy.programManagement.CreateHHAOrganizationAPI;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class CreateHHAOrganizationAPIStepDef extends DriverScript{

	CreateHHAOrganizationAPI createHHAAPI = new CreateHHAOrganizationAPI(driver);
	
	@Given("^Build Json for HHA \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void build_Json_For_HHA(String cName, String cPid, String shortName, String cMOrgID, String cEin, String cNpi, String cCcn, String cAddr1, String cAddr2, String cCity, String cState, String cZip, String cMarketId) throws Throwable {
		createHHAAPI.buildJsonForHHA(cName, cPid, shortName, cMOrgID, cEin, cNpi, cCcn, cAddr1, cAddr2, cCity, cState, cZip, cMarketId);
    }

    @When("^create hha org with this data$")
    public void createHHAOrgWithThisData() throws Throwable {
    	createHHAAPI.createHHAOrgWithThisData();
    }
}
