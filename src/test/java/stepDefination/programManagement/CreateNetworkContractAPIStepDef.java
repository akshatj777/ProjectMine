package stepDefination.programManagement;

import com.remedy.programManagement.CreateNetworkContractAPI;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class CreateNetworkContractAPIStepDef extends DriverScript{
	
	CreateNetworkContractAPI networkContractAPI = new CreateNetworkContractAPI(driver);

	@Given("^build json for Network contract \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and (\\S+)$")
    public void build_Json_For_NetworkContract(String endDate, String orgIdFrmCucumber, String bpContractIdCucumber, String startDate, String type, String orgType) {
		networkContractAPI.buildJsonForNetworkContract(endDate, orgIdFrmCucumber, bpContractIdCucumber, startDate, type, orgType);
    }

    @When("^create network contract with this data$")
    public void create_Contract_With_This_Data() throws Throwable {
    	networkContractAPI.createContractWithThisData();
    }
}
