package stepDefination.programManagement;

import com.remedy.programManagement.CreateManagingOrganizationAPI;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class CreateManagingOrganizationAPIStepDef extends DriverScript{
	
	CreateManagingOrganizationAPI CreateMOAPI = new CreateManagingOrganizationAPI(driver);
	
	@Given("^build json for Managing org \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    	public void build_Json_For_Morg(String cName, String cPid, String cContactName, String cEmail, String cPhone, String cAddr1, String cAddr2, String cCity, String cState, String cZip) throws Throwable {
		CreateMOAPI.buildJsonForMO(cName, cPid, cContactName, cEmail, cPhone, cAddr1, cAddr2, cCity, cState, cZip);
        }
	
	@When("^create org with this data$")
    	public void createOrgWithThisData() throws Throwable {
		CreateMOAPI.createOrgWithThisData();
    	}
 
	@When("^delete references of the name list type \"([^\"]*)\"$")
	public void deleteReferences(String type) throws Throwable {
		CreateMOAPI.deleteReferences(type);
    	}
}
