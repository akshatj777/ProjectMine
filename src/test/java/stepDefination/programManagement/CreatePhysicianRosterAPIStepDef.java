package stepDefination.programManagement;

import com.remedy.programManagement.CreatePhysicianRosterAPI;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class CreatePhysicianRosterAPIStepDef extends DriverScript{

	CreatePhysicianRosterAPI createPRAPI = new CreatePhysicianRosterAPI(driver);
	
	@Given("^create physician roster Json \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void create_PhysicianRoster_Json(String cPractitonerContractId, String cPractionerId, String startDate, String endDate, int noOfRosters) throws Throwable {
		createPRAPI.createPhysicianRosterJson(cPractitonerContractId, cPractionerId, startDate, endDate, noOfRosters);
    }

    @When("^Add a physician \"([^\"]*)\" to a roster$")
    public void add_Update_Remove_PhysicianToARoster(int index) throws Throwable {
    	createPRAPI.addUpdateRemovePhysicianToARoster(index);
    }
}
