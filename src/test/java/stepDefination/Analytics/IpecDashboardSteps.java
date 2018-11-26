package stepDefination.Analytics;

import com.remedy.Analytics.IpecDashboard;
import com.remedy.resources.DriverScript;

import cucumber.api.java.en.And;

public class IpecDashboardSteps extends DriverScript{
	IpecDashboard ipecDash = new IpecDashboard(driver);
	
	@And("^I Save \"([^\"]*)\" data metric FE value on the IPEC dashboard for \"([^\"]*)\" with picture resolution \"([^\"]*)\"$")
	public void i_save_data_metric_FE_value_on_the_dashboard(String text,String data,String resolution) throws Throwable{
		ipecDash.saveDataMetricValueWithdatabaseIPEC(text,data,resolution);
	}
}
