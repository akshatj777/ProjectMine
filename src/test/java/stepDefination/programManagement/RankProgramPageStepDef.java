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
	
	@Then("^I verify \"([^\"]*)\" Program name \"([^\"]*)\" under program tab$")
	public void i_Verify_Program_Name_Under_Program_Tab(int index, String text){
		rankProgram.iVerifyProgramNameUnderProgramTab(index, text);
	}
	
	@Then("^I verify \"([^\"]*)\" Program Rank for created programs under program tab$")
	public void i_Verify_Program_Rank_For_Created_Program_Under_Program_Tab(int index){
		rankProgram.iVerifyProgramRankForCreatedProgramUnderProgramTab(index);
	}
	
	@Then("^I verify \"([^\"]*)\" Program name \"([^\"]*)\" on Rank Program page$")
	public void i_Verify_Program_Name_On_Rank_Program_Page(int index, String text){
		rankProgram.iVerifyProgramNameOnRankProgramPage(index, text);
	}
	
	@Then("^I change the ranking values using drag and drop on Rank Program page$")
	public void i_Change_The_Ranking_Values_Using_DragAndDrop_On_Rank_Program_Page(){
		rankProgram.iChangeTheRankingValuesUsingDragAndDropOnRankProgramPage();
	}
}
