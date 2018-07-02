package stepDefination.UserAdmin;

import java.util.concurrent.TimeUnit;


import com.remedy.resources.DriverScript;
import com.remedy.userAdmin.UserAdminSorting;

import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class UserAdminSortingSteps extends DriverScript {
	
	UserAdminSorting UserAdminSort = new UserAdminSorting(driver);
	
	@Then("^I see \"([^\"]*)\" word under Program admin home page$")
	public void iseeSortbywordunderProgramadminhomepage(String Text) throws Throwable {
	    UserAdminSort.iSeeSortByWordUnderProgramAdminHomePage(Text);
	}

	@Then("^I see by default the sort filter is \"([^\"]*)\"$")
	public void i_see_by_default_the_sort_filter_is_Last_Name_A_Z(String Text) throws Throwable {
		UserAdminSort.iseeByDefaultTheSortFilterIsLastNameA_Z(Text);
	}
	
	@Then("^I should be able to click on DropDown list for sorting Newest to Oldest$")
	public void I_should_be_able_to_click_on_DropDown_list_for_sorting_Newest_to_Oldest() throws Throwable{
		UserAdminSort.IShouldbeAbleToClickOnDropDownListForSortingNewestToOldest();
	}
	
	@Then("^I verify the filter for Newest to Oldest$")
    public void I_verify_The_filter_for_Newest_to_Oldest() throws Throwable{
		UserAdminSort.IVerifyTheFilterForNewestToOldest();
    }
	
	@Then("^I should be able to sort the users with Newest - Oldest sorting option$")
	public void I_Should_be_able_to_sort_the_users_with_NewestOldest_sorting_option() throws Throwable {
		UserAdminSort.IShouldBeAbleToSortTheUsersWithNewestOldestSortingOption();
	}
	
	@Then("^I verify \"([^\"]*)\" users cards under user admin page$")
	public void I_verify_users_cards_under_user_admin_page(int Count) throws Throwable{
		UserAdminSort.Iverifyuserscardsunderuseradminpage(Count);
	}
	
	@Then("^I should be able to click on DropDown list for sorting Oldest to Newest$")
	public void I_should_be_able_to_click_on_DropDown_list_for_sorting_Oldest_to_Newest() throws Throwable{
		UserAdminSort.IShouldbeAbleToClickOnDropDownListForSortingOldestToNewest();
	}
	
	@Then("^I verify the filter for Oldest to Newest$")
    public void I_verify_The_filter_for_Oldest_to_Newest() throws Throwable{
		UserAdminSort.IVerifyTheFilterForOldestToNewest();
    }
	
	
	@Then("^I should be able to sort the users with Oldest - Newest sorting option$")
	public void I_Should_be_able_to_sort_the_users_with_OldestNewest_sorting_option() throws Throwable {
		UserAdminSort.IShouldBeAbletoSortTheUsersWithOldestNewestSortingOption();
	}
	
	@Then("^I should be able to click on DropDown list for sorting Z to A$")
	public void I_should_be_able_to_click_on_DropDown_list_for_sorting_Z_To_A() throws Throwable{
		UserAdminSort.IShouldbeAbleToClickOnDropDownListForSortingZToA();
	}
	
	@Then("^I verify the filter for Z to A$")
    public void I_verify_The_Filter_for_Z_To_A() throws Throwable{
		UserAdminSort.IVerifyTheFilterForZToA();
    }
	@Then("^I should be able to sort the users with Z - A sorting option$")
	public void I_Should_be_able_to_sort_the_users_with_ZA_sorting_option() throws Throwable {
		UserAdminSort.IShouldBeAbletoSortTheUsersWithZASortingOption();
	}

	@Then("^I verify sorting option applied should work for the user$")
	public void i_verify_sorting_option_applied_should_work_for_the_user() throws Throwable {
		UserAdminSort.iVerifySortingOptionAppliedShouldWorkForTheUser();
	}

	@Then("^I see the Refresh icon present besides the sorting filter$")
	public void i_see_the_Refresh_icon_present_besides_the_sorting_filter() throws Throwable {
		UserAdminSort.iSeeTheRefreshIconPresentBesidesTheSortingFilter();
	}

	@Then("^I verify refresh button should work for the user$")
	public void i_verify_refresh_button_should_work_for_the_user() throws Throwable {
		UserAdminSort.iVerifyRefreshButtonShouldWorkForTheUser();
	}
	
		
    @Then("^I Verify the sort filter for Z to A under user admin page$")
    public void I_Verify_the_sort_filter_for_Z_to_A_under_user_admin_page() throws Throwable{
    	UserAdminSort.IVerifythesortfilterforZtoAunderuseradminpage();
    }
    
    @Then("^I Clicked on Create user button appearing under user admin page$")
    public void I_Clicked_on_Create_user_button_appearing_under_user_admin_page() throws Throwable{
    	UserAdminSort.IClickedonCreateuserbuttonappearingunderuseradminpage();
    }
    
    @Then("^I Clicked on close button appearing on create user page under user admin page$")
    public void I_Clicked_on_close_button_appearing_on_create_user_page_under_user_admin_page() throws Throwable{
    	UserAdminSort.IClickedonclosebuttonappearingoncreateuserpageunderuseradminpage();
    }
    
    @Then("^I verify sorting applied on user admin page is retaining$")
    public void I_verify_sorting_applied_on_user_admin_page_is_retaining() throws Throwable{
    	UserAdminSort.Iverifysortingappliedonuseradminpageisretaining();
    }
    
    @Then("^I entered \"([^\"]*)\" under user admin page$")
    public void I_entered_under_user_admin_page(String Text) throws Throwable{
    	UserAdminSort.Ienteredunderuseradminpage(Text);
    }
    
      
    @Then("^I verify sort should work correctly when search \"([^\"]*)\" is made with Newest to Oldest sorting is applied on the filtered results$")
    public void I_verify_sort_should_work_correctly_when_search_is_made_with_Newest_to_Oldest_sorting_is_applied_on_the_filtered_results(String Text) throws Throwable{
    	UserAdminSort.iVerifySortShouldWorkCorrectlyWhenSearchIsMadewithNewesttoOldestSortingIsAppliedOnTheFilteredResults(Text);
    }

    @Then("^I verify sort should work correctly when search \"([^\"]*)\" is made with Oldest to Newest sorting is applied on the filtered results$")
    public void I_verify_sort_should_work_correctly_when_search_is_made_with_Oldest_to_Newest_sorting_is_applied_on_the_filtered_results(String Text) throws Throwable{
    	
    	UserAdminSort.iVerifySortShouldWorkCorrectlyWhenSearchIsMadewithOldesttoNewestSortingIsAppliedOnTheFilteredResults(Text);
    } 

	
	@Then("^I verify sort should work correctly when search \"([^\"]*)\" is made with Z to A sorting is applied on the filtered results\\.$")
	public void i_verify_sort_should_work_correctly_when_search_is_made_with_Z_to_A_sorting_is_applied_on_the_filtered_results(String Text) throws Throwable {
		UserAdminSort.iVerifySortShouldWorkCorrectlyWhenSearchIsMadewithZtoASortingIsAppliedOnTheFilteredResults(Text);
	}
	
	@Then("^I verify the favicon on user admin page$")
	public void I_verify_the_favicon_on_user_admin_page() throws Throwable{
		UserAdminSort.Iverifythefavicononuseradminpage();
	}
}