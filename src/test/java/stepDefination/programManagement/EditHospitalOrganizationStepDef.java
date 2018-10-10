package stepDefination.programManagement;

import com.remedy.programManagement.EditHospitalOrganization;
import com.remedy.resources.DriverScript;
import cucumber.api.java.en.And;

public class EditHospitalOrganizationStepDef extends DriverScript {
	
	EditHospitalOrganization editHospOrg = new EditHospitalOrganization(driver); 
	
	@And("^I verify Managing Organization field on \"([^\"]*)\" organization page$")
	  public void i_Verify_ManagingOrg_FieldOn_Organization_Page(String org) throws Throwable {
		editHospOrg.iVerifyManagingOrgFieldOnOrganizationPage(org);
	    }
	
	@And("^I edit \"([^\"]*)\" field to ([^\"]*) for Location \"([^\"]*)\" for organization$")
	  public void i_Edit_Location_Fields_for_Selected_Organization(String field1, String field2,int num) throws Throwable {
		editHospOrg.iEditLocationFieldsSelectedOrganization(field1,field2,num);
	    }
	
	@And("^I edit State dropdown field to ([^\"]*) for Location \"([^\"]*)\" for organization$")
	  public void i_Edit_LocationState_DropdownField_For_Location(String text, int num) throws Throwable {
		editHospOrg.iEditLocationStateForLocationsofSelectedOrganization(text, num);
	    }
	
	@And("^I edit Location Type dropdown field to ([^\"]*) for Location \"([^\"]*)\" for organization$")
	  public void i_Edit_LocationType_DropdownField_For_Location(String text, int num) throws Throwable {
		editHospOrg.iEditLocationTypeForLocation(text, num);
	    }
	
	@And("^I edit Region dropdown field to ([^\"]*) for Location \"([^\"]*)\" for organization$")
	  public void i_Edit_Region_DropdownField_For_Location(String text, int num) throws Throwable {
		editHospOrg.iEditRegionForLocation(text, num);
	    }
	
	@And("^I edit Market dropdown field to ([^\"]*) for Region \"([^\"]*)\" for Location \"([^\"]*)\" for organization$")
	  public void i_Edit_Market_DropdownField_For_Location(String market, String region, int num) throws Throwable {
		editHospOrg.iEditMarketForLocation(market, region, num);
	    }
	
	@And("^I verify \"([^\"]*)\" identifier is not editable$")
	  public void i_Verify_Identifier_Is_Not_Editable(String id) throws Throwable {
		editHospOrg.iVerifyIdentifierIsNotEditable(id);
		}
	
	@And("^I verify Managing Organization radio buttons status on \"([^\"]*)\" organization page$")
	  public void i_Verify_ManagingOrg_RadioButtons_Status_On_Organization_Page(String org) throws Throwable {
		editHospOrg.iVerifyManagingOrgRadioButtonsStatusOnOrganizationPage(org);
	    }

	@And("^I edit location ID field to \"([^\"]*)\" for Location \"([^\"]*)\" for \"([^\"]*)\" organization$")
	  public void i_Edit_LocationID_Under_Locations_Section(String field, int num, String org) throws Throwable {
		editHospOrg.iEditLocationIDFieldUnderLocationsSection(field, num, org);
		}
}