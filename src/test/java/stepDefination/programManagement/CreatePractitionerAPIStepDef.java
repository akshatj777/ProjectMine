package stepDefination.programManagement;

import com.remedy.programManagement.CreatePractictionerAPI;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class CreatePractitionerAPIStepDef extends DriverScript {
	
	CreatePractictionerAPI practictioner= new CreatePractictionerAPI(driver);

	@Given("^create provider taxonomy classification grouping sepecialization Json \"([^\"]*)\"$")
    public void create_ProviderTaxonomyClassificationJson(String cName) throws Throwable {
		practictioner.createProviderTaxonomyClassificationJson(cName);
    }
	
	@When("^create provider taxonomy with this data \"([^\"]*)\"$")
    public void create_ProviderTaxonomyWithThisData(String type) throws Throwable {
		practictioner.createProviderTaxonomyWithThisData(type);
    }
	
	@Then("^verification of Actual vs expected results (\\S+) and \"([^\"]*)\"$")
    public void verifyActualVsExp(Integer expCode, String responseMsg) throws Throwable {
		practictioner.verifyActualVsExp(expCode,responseMsg);
    }
	
	@When("^create practitioner Json \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void create_PractitionerJson(String firstName, String lastName, String cNpi, String gender, String cEnumerationDate, String prefix, String suffix, String cNpiDeactivationDate, String npiDeactivationReasonCode, String otherFirstName, String otherLastName, String otherPrefix, String otherSuffix, String cPrimaryTaxonomyIds, String secondaryTaxonomyIds, String liscenceNo, String licenseNumberStateCode, String cAddr1, String cAddr2, String cCity, String cState, String cZip, int noOfLicenses) throws Throwable {
		practictioner.createPractitionerJson(firstName, lastName, cNpi, gender, cEnumerationDate, prefix, suffix, cNpiDeactivationDate, npiDeactivationReasonCode, otherFirstName, otherLastName, otherPrefix, otherSuffix, cPrimaryTaxonomyIds, secondaryTaxonomyIds, liscenceNo, licenseNumberStateCode, cAddr1, cAddr2, cCity, cState, cZip, noOfLicenses);
    }

    @When("^create practitioner with this data$")
    public void create_PractitionerWithThisData() throws Throwable {
    	practictioner.createPractitionerWithThisData();
    }
    
    @When("^create provider taxonomy Json \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
    public void create_ProviderTaxonomyJson(String definition, String notes, String cProviderTaxonCode, Long classificationId, Long groupingId, Long specializationId) throws Throwable {
    	practictioner.createProviderTaxonomyJson(definition, notes, cProviderTaxonCode, classificationId, groupingId, specializationId);
    }
    
    @When("^create provider taxonomy$")
    public void create_ProviderTaxonomyWithThisData() throws Throwable {
    	practictioner.createProviderTaxonomyWithThisData();
    }
    
    @When("^Get by id (\\S+) and (\\S+)$")
    public void get_ById(Long idToGet, String type) throws Throwable {
    	practictioner.getById(idToGet,type);
    }
}
