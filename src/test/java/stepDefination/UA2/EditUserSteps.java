package stepDefination.UA2;

import com.remedy.UA2.EditUser;
import com.remedy.resources.DriverScript;

import cucumber.api.PendingException;
import cucumber.api.java.en.Then;

public class EditUserSteps extends DriverScript {
EditUser editUser= new EditUser(driver);
	@Then("^I click on any user$")
	public void i_click_on_any_user() throws Throwable {
	 editUser.iClickOnAnyUser();
	}

	@Then("^I verify that I am navigated to user page$")
	public void i_verify_that_I_am_navigated_to_user_page() throws Throwable {
	   editUser.iverifyuserpage();
	}

	@Then("^I click on Edit button$")
	public void i_click_on_Edit_button() throws Throwable {
	   editUser.iClickOnEditButton();
	}

	@Then("^I verify that I am redirected to the edit page$")
	public void i_verify_that_I_am_redirected_to_the_edit_page() throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    throw new PendingException();
	}

	@Then("^I should be able to edit \"([^\"]*)\"$")
	public void i_should_be_able_to_edit(String arg1) throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    throw new PendingException();
	}

	@Then("^I should not be able to edit \"([^\"]*)\"$")
	public void i_should_not_be_able_to_edit(String arg1) throws Throwable {
	    // Write code here that turns the phrase above into concrete actions
	    throw new PendingException();
	}
}
