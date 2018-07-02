package stepDefination.UserAdmin;

import com.remedy.userAdmin.UserAdminHomePage;
import com.remedy.resources.DriverScript;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;

/**
 * Created by salam on 8/5/15.
 */
public class UserAdminHomeSteps extends DriverScript{

        UserAdminHomePage userAdminHome = new UserAdminHomePage(driver);

        @Then("^I enter search box with \"([^\"]*)\"$")
        public void IEnterSearchBoxWith(String userText) throws Throwable {
            userAdminHome.enterSerchUserText(userText);
        }
        
        @Then("^I should see \"([^\"]*)\" Button$")
        public void iSeeCreateUser(String text) throws Throwable {
            userAdminHome.iSeeCreateUserText(text);
        }

        @Then("^I click on the Select Faclity field$")
        public void IClickTheSelectFaclityField() throws Throwable {
            userAdminHome.iClickOnSearchFilterField();
        }

        @And("^I select filter form the dropdown \"([^\"]*)\"$")
        public void ISelectFilterFormDropdown(String facility) throws Throwable {
            userAdminHome.iSelectFacilityForFilter(facility);
        }

        @And("^I click on the table view icon$")
        public void IClickTableViewIcon() throws Throwable {
            userAdminHome.iClickonTableViewIcon();
        }

        @Then("^I will click on the card view Icon$")
        public void IClickCardViewIcon() throws Throwable {
            userAdminHome.iClickonCardViewIcon();
        }

        @Then("^I click on view Profile link of the first user$")
        public void IlickViewProfileLinkOfFirstUser() throws Throwable {
            userAdminHome.iClickViewProfileLinkByIndex(0);
        }

        @Then("^I click cancel button$")
        public void IClickCancelButton() throws Throwable {
            userAdminHome.iClickCancelButton();
        }

        @And("^I click on the veiw profile of icon for first user$")
        public void IClickVeiwProfileIcon() throws Throwable {
            userAdminHome.iClickOnViewProfileIcon(0);
        }
        
        @Then("^I should see Program Administration logo on Top$")
        public void iShouldSeeHeaderText() throws Throwable {
            userAdminHome.iSeeUserAdminPageLogo();
        }

        @Then("^I should see header text \"([^\"]*)\"$")
        public void iShouldSeeHeaderText(String header) throws Throwable {
            userAdminHome.iSeeUserAdminPageHeader(header);
        }

        @And("^I sort user by \"([^\"]*)\"$")
        public void iSortUserBy(String sortOption) throws Throwable {
            userAdminHome.iSelectSortOption(sortOption);
        }

        @Then("^I should see sort order default option \"([^\"]*)\"$")
        public void iShouldSeeSortOrderDefaultOption(String defaultOption) throws Throwable {
            userAdminHome.iSeeSortOrderDefaultOption(defaultOption);
        }
        
        @And("^I should see total Users Count on page$")
        public void iShouldSeeUsersCount() throws Throwable {
            userAdminHome.iSeeUsersCount();
        }
        
        @And("^I should see Refresh icon on page$")
        public void iShouldSeeRefreshIcon() throws Throwable {
            userAdminHome.iSeeRefreshIcon();
        }

        @And("^I can see \"([^\"]*)\" user card$")
        public void iCanSeeUserCard(int count) throws Throwable {
            userAdminHome.iVerifyUserCardCount(count);
        }
        
        @And("^I should see User card on page$")
        public void iShouldSeeUserCards() throws Throwable {	
        	userAdminHome.iSeeUserCards();	
        }
        

        @And("^I should see First Name on user card$")
        public void iShouldSeeFirstNameOnUserCards() throws Throwable {	
        	userAdminHome.iSeeFirstNameOnUserCard();   	
        }

        @And("^I should see Last Name on user card$")
        public void iShouldSeeLastNameOnUserCards() throws Throwable {	
        	userAdminHome.iSeeLastNameOnUserCard(); 	
        }
        
        @And("^I should see Expand button on user card$")
        public void iShouldSeeExpandButtonOnUserCards() throws Throwable {
        	userAdminHome.iSeeExpandButtonOnUserCard();	
        }

        @And("^I should see Role on user card$")
        public void iShouldSeeRoleOnUserCards() throws Throwable {	
        	userAdminHome.iSeeRoleOnUserCard();	
        }

        @And("^I should see User Email on user card$")
        public void iShouldSeeUserEmailOnUserCards() throws Throwable {
        	userAdminHome.iSeeUserEmailOnUserCard();
        }

        @And("^I should see Lock button on user card$")
        public void iShouldLockButtonOnUserCards() throws Throwable {
        	userAdminHome.iSeeLockButtonOnUserCard();
        }

        @And("^I should see Unlock button on user card$")
        public void iShouldUnLockButtonOnUserCards() throws Throwable {
        	userAdminHome.iSeeUnLockButtonOnUserCard();
        }

        @Then("^I click Load More Button$")
        public void iClickLoadMoreButton() throws Throwable {
            userAdminHome.iClickLoadMoreButton();
        }

        @And("^I should see \"([^\"]*)\" for First Name$")
        public void iShouldSeeForFirstName(String firstname) throws Throwable {
            userAdminHome.iverifyFirstNameText(firstname);
        }

        @And("^I should see \"([^\"]*)\" for Last Name$")
        public void iShouldSeeForLastName(String lastName) throws Throwable {
            userAdminHome.iverifyLastNameText(lastName);
        }

        @And("^I should see \"([^\"]*)\" for User Role on user card$")
        public void iShouldSeeForUserRoleOnUserCard(String organizationalrole) throws Throwable {
            userAdminHome.iverifyOrganizationalRoleForAUser(organizationalrole);
        }

        @Then("^I click on the \"([^\"]*)\" Button$")
        public void iClickOnTheButton(String arg0) throws Throwable {
            userAdminHome.clickImportUsers();
        }

        @Then("^I should see \"([^\"]*)\" for search results$")
        public void iShouldSeeForSearchResults(String text) throws Throwable {
            userAdminHome.iverifyUserSearchResult(text);
        }
        
        @And("^I should see Pagination at bottom$")
        public void iShouldSeePagination() throws Throwable {
            userAdminHome.iSeePagination();
        }
        
        @Then("^I verify pagination box appearing at the bottom of useradmin home page$")
        public void i_verify_pagination_box_appearing_at_the_bottom_of_useradmin_home_page() throws Throwable{
        	userAdminHome.iSeePagination();
        }
       
        @Then("^I Verify \"([^\"]*)\" button is appearing beside the pagination on user admin home page$")
        public void i_verify_next_button_is_appearing_beside_the_pagination_on_user_admin_home_page(String text) throws Throwable{
        	userAdminHome.iSeeNextButtonAppearingBesidePaginatioN(text);
        }
        
        @And("^I click on \"([^\"]*)\" button beside pagination on user admin home page$")
        public void i_click_on_next_button_beside_pagination_on_user_admin_home_page(String next) throws Throwable{
        	userAdminHome.iClickOnNextButtonBesidePaginationOnUserAdminHomePage(next);
        }
        
        @Then("^I enter \"([^\"]*)\" in the pagination input box on user admin home page$")
        public void i_enter_number_in_the_pagination_input_box_on_user_admin_home_page(String number) throws Throwable{
        	userAdminHome.iEnterNumberINPaginationInputBox(number);
        }
        
        @Then("^I verify users with \"([^\"]*)\" button present on useradmin home page$")
        public void i_verify_users_with_button_present_on_useradmin_home_page(String button) throws Throwable{
        	userAdminHome.iVerifyButtonOnUserAdminHomePage(button);
        }
        
        @Then("^I verify \"([^\"]*)\" appearing on locked useradmin cards on useradmin home page$")
        public void i_verify_appearing_on_locked_useradmin_cards_on_useradmin_home_page(String text) throws Throwable{
        	userAdminHome.iVerifyTextForLockedUserAdminCards(text);
        }
        
        @Then("^I click on \"([^\"]*)\" button on the useradmin cards on useradmin home page$")
        public void i_click_on_button_on_the_useradmin_home_page(String text) throws Throwable{
        	userAdminHome.iClickOnUnlockButtonOnUserAdminHomePage(text);
        }
        
        @Then("^I verify \"([^\"]*)\" is appearing for the useradmin cards which are \"([^\"]*)\" on useradmin home page$")
        public void i_verify_is_appearing_for_the_useradmin_cards_which_are_on_useradmin_home_page(String text,String button) throws Throwable{
        	userAdminHome.iVerifyUnlockCardsInformation(text, button);
        }
        
        @Then("^I should see ([^\"]*) Button$")
        public void iShouldSeeImportUsersButton(String text) throws Throwable{
        	userAdminHome.iShouldSeeImportUsersButton(text);
        }
    }