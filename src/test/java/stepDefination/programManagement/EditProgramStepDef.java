package stepDefination.programManagement;

import com.remedy.programManagement.EditProgram;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

public class EditProgramStepDef extends DriverScript{
	
	EditProgram editProgram =new EditProgram(driver);

	@And ("^I verify the \"([^\"]*)\" checkbox is not editable$")
	public void i_Verify_MultipleBundleEpisode_CheckBox_Is_Not_Editable(String text){
		editProgram.iVerifyMultipleBundleEpisodeCheckBoxIsNotEditable(text);
	}
	
	@Then("^I verify the \"([^\"]*)\" on edit bundle payment contract page$")
	  public void i_Verify_The_EditedProgramName_On_Edit_BPC_page(String text) throws Throwable {
		editProgram.iVerifyTheEditedProgramNameOnEditBPCpage(text);
	 }
}
