package stepDefination.programManagement;

import com.remedy.programManagement.CreateProgramAPI;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;

public class CreateProgramAPIStepDef extends DriverScript{
	
	CreateProgramAPI programAPI =new CreateProgramAPI(driver);

	@And("^build json for Program with attribution rules \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void createProgramJsonWAttributionRules(String pName, String payorOrId, String cAttributionRankID, String cAttributinRankValue, int noOfAttributionRulesForThisPrg, String cValidationRankID, String cValidationValue, int noOfValidationRulesForThisPrg, boolean multipleBundleEpisode) throws Throwable {
		programAPI.createProgramJsonWAttributionRules(pName, payorOrId, cAttributionRankID, cAttributinRankValue, noOfAttributionRulesForThisPrg, cValidationRankID, cValidationValue, noOfValidationRulesForThisPrg, multipleBundleEpisode);
    }

    @And("^create program with this data$")
    public void create_Program_With_This_Data() throws Throwable {
    	programAPI.createProgramWithThisData();
    }
}
