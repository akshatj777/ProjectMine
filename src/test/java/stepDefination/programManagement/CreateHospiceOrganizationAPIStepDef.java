package stepDefination.programManagement;
import com.remedy.programManagement.CreateHospiceOrganizationAPI;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class CreateHospiceOrganizationAPIStepDef extends DriverScript{
	
	CreateHospiceOrganizationAPI createHospiceAPI= new CreateHospiceOrganizationAPI(driver);
	
	@Given("^Build Json for Hospice \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void build_Json_For_Hospice(String cName, String cPid, String shortName, String cMOrgID, String cEin, String cNpi, String cCcn, String cAddr1, String cAddr2, String cCity, String cState, String cZip, String cMarketId) throws Throwable {
		createHospiceAPI.buildJsonForHospice(cName, cPid, shortName, cMOrgID, cEin, cNpi, cCcn, cAddr1, cAddr2, cCity, cState, cZip, cMarketId);
    }

    @When("^create hospice org with this data$")
    public void create_Hospice_Org_With_This_Data() throws Throwable {
    	createHospiceAPI.createHospiceOrgWithThisData();
    }
}
