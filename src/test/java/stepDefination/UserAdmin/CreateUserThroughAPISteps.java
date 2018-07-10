package stepDefination.UserAdmin;

import com.remedy.resources.DriverScript;
import com.remedy.userAdmin.CreateUserPage;
import com.remedy.userAdmin.CreateUserThroughAPI;
import com.remedy.userAdmin.LandingPage;
import com.remedy.userAdmin.LoginPage;
import com.remedy.userAdmin.UserAdminHomePage;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class CreateUserThroughAPISteps extends DriverScript {

	CreateUserThroughAPI objCreateUserThroughAPI = new CreateUserThroughAPI(driver);
	
	@Given("^Build JSON for Create User \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\" and \"([^\"]*)\"$")
	public void buildJSONForCreateUser(String firstName,String lastName, String email, String phone, String npi, String roleID, String applications, String locations, String learningPathways) throws Throwable {
		objCreateUserThroughAPI.buildJSONForCreateUser(firstName,lastName,email,phone,npi,roleID,applications,locations,learningPathways);
	}

	@When("^Create User with this data for \"([^\"]*)\"$")
	public void createUserWithThisData(String user) throws Throwable {
		objCreateUserThroughAPI.createUserWithThisData(user);
	}

	@Then("^Verify Actual vs expected results \"([^\"]*)\" and \"([^\"]*)\"$")
	public void verifyActualExpectedResults(String responseCode, String responseMessage) throws Throwable {
		objCreateUserThroughAPI.verifyActualExpectedResults(responseCode,responseMessage);
	}

}
