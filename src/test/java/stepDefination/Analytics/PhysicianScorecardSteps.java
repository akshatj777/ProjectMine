package stepDefination.Analytics;

import com.remedy.Analytics.PhysicianScorecard;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;

public class PhysicianScorecardSteps extends DriverScript {
	
	PhysicianScorecard physicianScorecard = new PhysicianScorecard(driver);
	
	@And("^I verify \"([^\"]*)\" Title is appearing on the \"([^\"]*)\" Dashboard$")
	public void i_verify_title_appearing_on_dashboard(String title, String dashboard) throws Throwable{
		physicianScorecard.iVerifyTitleAppearingOnDashboard(title,dashboard);
	}
	
	@And("^I verify \"([^\"]*)\" Tool tip is appearing for Bar grapth on \"([^\"]*)\" Dashboard$")
	public void i_verify_toolTipText_is_appearing_For_Bar_Graph_on_dashboard(String text, String dashboard) throws Throwable{
		physicianScorecard.iVerifyToolTipForBarGrapOnDashboard(text);
	}
	
}
