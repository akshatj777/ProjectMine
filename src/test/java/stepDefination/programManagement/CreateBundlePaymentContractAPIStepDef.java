package stepDefination.programManagement;

import com.remedy.programManagement.CreateBundlePaymentContractAPI;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.When;

public class CreateBundlePaymentContractAPIStepDef extends DriverScript {

	CreateBundlePaymentContractAPI createBPCAPI = new CreateBundlePaymentContractAPI(driver);
	
	@Given("^build Json for Contract \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void create_Contract_Json(String contractId, String cEndDate, String orgIdFrmCucumber, String cProgramId, String cStartDate, String cBundleId, String bundlePrice, String cbundleStartDate, String cBundleEndDate, String type, String orgType, String priceStartDate, String priceEndDate, String baseLineEndDate, String baseLineStartDate, String trendFactor, String upperBound, String lowerBound)  {
		createBPCAPI.createContractJson(contractId, cEndDate, orgIdFrmCucumber, cProgramId, cStartDate, cBundleId, bundlePrice, cbundleStartDate, cBundleEndDate, type, orgType, priceStartDate, priceEndDate, baseLineEndDate, baseLineStartDate, trendFactor, upperBound, lowerBound);
    }

    @When("^create contract with this data$")
    public void create_Contract_With_This_Data() throws Throwable {
    	createBPCAPI.createContractWithThisData();
    }
}
