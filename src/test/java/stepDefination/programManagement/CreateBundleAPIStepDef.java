package stepDefination.programManagement;

import com.remedy.programManagement.CreateBundleAPI;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class CreateBundleAPIStepDef extends DriverScript {

	CreateBundleAPI bundleAPI = new CreateBundleAPI(driver);
	
	@Given("^create Bundle Json to String and pass it to body with \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void create_BundleJsonToString(String cName, String content, String cCode) throws Throwable {
		bundleAPI.createBundleJsonToString(cName, content, cCode);
     }
	
	@When("^create Bundle with this data$")
    public void create_BundleWithThisData() throws Throwable {
		bundleAPI.createBundleWithThisData();
    }
	
//	@Then("^verification of Actual vs expected results (\\S+) and \"([^\"]*)\"$")
//    public void verify_ActualVsExp(Integer expCode, String responseMsg) throws Throwable {
//		bundleAPI.verifyActualVsExp(expCode, responseMsg);
//    }
}
