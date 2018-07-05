package stepDefination.programManagement;

import com.remedy.programManagement.CreateProgramAPI;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;

public class CreateProgramAPIStepDef extends DriverScript{
	
	CreateProgramAPI programAPI =new CreateProgramAPI(driver);

	@And("^build json for Program with attribution rules \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void create_ProgramJsonW_AttributionRules(String pName, String payorOrId, String cId, String cValue, int noOfRulesForThisPrg, String programID) throws Throwable {
		programAPI.createProgramJsonWAttributionRules(pName, payorOrId, cId, cValue, noOfRulesForThisPrg, programID);
    }

    @And("^create program with this data$")
    public void create_Program_With_This_Data() throws Throwable {
    	programAPI.createProgramWithThisData();
    }
}
