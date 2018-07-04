package stepDefination.programManagement;

import com.remedy.programManagement.CreateLTCHOrganizationAPI;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class CreateLTCHOrganizationAPIStepDef extends DriverScript{

	CreateLTCHOrganizationAPI createLTCHAPI = new CreateLTCHOrganizationAPI(driver);
	
	@Given("^Build Json and pass it to post method for ltch org with \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$$")
    public void build_Json_For_Ltch(String cName, String cPid, String shortName, String cMOrgID, String cCcn, String cEin, String cNpi, String cAddr1, String cAddr2, String cCity, String cState, String cZip, String cLocName, String locType, String cMarketId, String locAddr1, String locAddr2, String locCity, String locState, String locZip, String cLocationId) throws Throwable {
		createLTCHAPI.buildJsonForLtch(cName, cPid, shortName, cMOrgID, cCcn, cEin, cNpi, cAddr1, cAddr2, cCity, cState, cZip, cLocName, locType, cMarketId, locAddr1, locAddr2, locCity, locState, locZip, cLocationId);
    }

    @When("^create ltch org with this data \"([^\"]*)\"$")
    public void create_LtchOrg_With_This_Data(String type) throws Throwable {
    	createLTCHAPI.createLtchOrgWithThisData(type);
    }
	
}
