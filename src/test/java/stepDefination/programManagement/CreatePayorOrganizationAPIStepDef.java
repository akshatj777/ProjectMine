package stepDefination.programManagement;

import com.remedy.programManagement.CreatePayorOrganizationAPI;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class CreatePayorOrganizationAPIStepDef extends DriverScript{
	
	CreatePayorOrganizationAPI createpayorAPI= new CreatePayorOrganizationAPI(driver);

	@Given("^build Json for Payor \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void build_Payor_Json(String cName, String cPid, String cTin_ein, String contactName, String cEmail, String cPhone, String cAddr1, String cAddr2, String cCity, String cState, String cZip) throws Throwable {
		createpayorAPI.buildPayorJson(cName, cPid, cTin_ein, contactName, cEmail, cPhone, cAddr1, cAddr2, cCity, cState, cZip);
    }

    @When("^create payor with this data$")
    public void create_Payor_WithThisData() throws Throwable {
    	createpayorAPI.createPayorWithThisData();
    }
}
