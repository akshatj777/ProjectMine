package stepDefination.programManagement;

import com.remedy.programManagement.RankProgramPage;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

public class RankProgramPageStepDef extends DriverScript{
	
	RankProgramPage rankProgram = new RankProgramPage(driver);

	@Then("^I verify \"([^\"]*)\" header text on Rank program page$")
	  public void i_Verify_HeaderText_On_Rank_Program_Page(String text) throws Throwable {
		rankProgram.iVerifyHeaderTextOnRankProgramPage(text);
	    }
	
	@Then("^I verify \"([^\"]*)\" on Rank program page$")
	  public void i_Verify_PayorName_On_Rank_Program_Page(String text) throws Throwable {
		rankProgram.iVerifyPayorNameOnRankProgramPage(text);
	    }
	
	@Then("^I verify Programs text on Rank program page$")
	  public void i_Verify_Program_Text_On_Rank_Program_Page() throws Throwable {
		rankProgram.iVerifyProgramsTextOnRankProgramPage();
	    }
	
	@And("^I verify vadlidation meassage \"([^\"]*)\" on \"([^\"]*)\" page$")
	  public void i_Verify_Validation_Message_After_Submitting_Rank_Programs_Page(String msg, String org) throws Throwable {
		rankProgram.iVerifyValidationMessageAfterSubmittingRankProgramsPage(msg, org);
	 }
}
