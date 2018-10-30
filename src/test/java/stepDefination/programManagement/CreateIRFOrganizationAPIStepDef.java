package stepDefination.programManagement;

import com.remedy.programManagement.CreateIRFOrganizationAPI;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class CreateIRFOrganizationAPIStepDef extends DriverScript{
	
	CreateIRFOrganizationAPI createIRFAPI = new CreateIRFOrganizationAPI(driver);

	@Given("^Build Json and pass it to post method with IRF \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$$")
    public void build_Json_For_SNF(String cName, String cPid, String shortName, String cMOrgID, String cCcn, String cEin, String cNpi, String cAddr1, String cAddr2, String cCity, String cState, String cZip, String cLocName, String locType, String cMarketId, String locAddr1, String locAddr2, String locCity, String locState, String locZip, String cLocationId) throws Throwable {
		createIRFAPI.buildJsonForIRF(cName, cPid, shortName, cMOrgID, cCcn, cEin, cNpi, cAddr1, cAddr2, cCity, cState, cZip, cLocName, locType, cMarketId, locAddr1, locAddr2, locCity, locState, locZip, cLocationId);
     }
	
	@When("^create IRF org with this data \"([^\"]*)\"$")
    public void createSnfOrgWithThisData(String type) throws Throwable {
		createIRFAPI.createIRFOrganizationWithThisData(type);
    }

}
