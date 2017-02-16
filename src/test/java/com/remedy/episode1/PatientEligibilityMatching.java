package com.remedy.episode1;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import com.remedy.baseClass.BaseClass;

public class PatientEligibilityMatching extends BaseClass

{ 		
	public PatientEligibilityMatching(WebDriver driver) 
	{
		super(driver);	
	}
	public void iShouldSeeOnNextPage(String text) throws Throwable
	{
		delay();
	    verifyTextForElement(driver.findElement(By.cssSelector(".alert.alert-info>h4")), text);
	}
	public void iClickOnCancelButton() throws Throwable
	{
		clickElement(driver.findElement(By.cssSelector("#cancelButton")));
	}
	public void iEnterForSSN(String ssn) throws Throwable
	{
		 iFillInText(driver.findElement(By.cssSelector("#Patient_Details_ssn")) ,ssn);
	}
	public void iSelectAnAdmitDate() throws Throwable
	{
		clickElement(driver.findElement(By.xpath("//*[@id='tab-transition']/div[1]/div[1]/div/div/span[1]/button")));
		clickElement(driver.findElements(By.xpath("//td[@class='day active']")).get(0));
		clickElement(driver.findElements(By.xpath("//span[@class='hour active']")).get(0));
		clickElement(driver.findElements(By.xpath("//span[@class='minute active']]")).get(0));
	}
	public void iSelectCareType()
	{
		clickElement(driver.findElement(By.cssSelector("#bp_personbundle_bpadmissiontype_admitCareType")));
		clickElement(driver.findElement(By.cssSelector("#bp_personbundle_bpadmissiontype_admitCareType>option:nth-of-type(2)")));
	}
	public void iSearchforAdmitFacility(String searchText){

        clickElement(driver.findElement(By.cssSelector(".select2-arrow>b")));
        iFillInText(driver.findElement(By.cssSelector("#s2id_autogen1_search")), searchText);
        delay();
    }
	public void iSelectTheFirstAdmitFacility() throws Throwable
	{
		clickElement(driver.findElement(By.cssSelector("#select2-results-1>li:nth-of-type(1)>div")));
	    delay();
	}
	public void iClickOnFiltersTabPresentOnThePatientsPage(String filtertab) throws Throwable
	{
		clickElement(driver.findElement(By.cssSelector("button[name='"+filtertab+"']")));
	}
	public void iShouldSeeUnderEligiblityDropdown(String eligibility) throws Throwable
	{
		verifyTextForElement(driver.findElement(By.cssSelector("a[id=eligibility_button]")), eligibility);
	}
	public void iClickOnEligibilityDropdown() throws Throwable
	{
		clickElement(driver.findElement(By.cssSelector("a[id=eligibility_button]")));
	}
	public void iClickOnStatus(String text) throws Throwable
	{
		clickElement(driver.findElement(By.xpath("//span[@class='label label-danger'][normalize-space(.) = '"+text+"']")));
	}
	public void iSearchForInEpisodesDropdown(String text) throws Throwable
	{ 
		 clickElement(driver.findElement(By.cssSelector(".select2-arrow>b")));
	     iFillInText(driver.findElement(By.cssSelector("#s2id_autogen3_search")), text);
	     delay();
	}
	public void iVerifyIsPresentInEpisodeDropdown(String text) throws Throwable
	{
		verifyTextForElement(driver.findElement(By.xpath("//span[@class='select2-match'][normalize-space(.) = '"+text+"']")), text);
	}
	public void iClickOnAllEpisodesInDropdown()
	{
		clickElement(driver.findElement(By.xpath("//div[@class='select2-result-label']")));
	}
	public void iClickOnCancel() throws Throwable
	{
		clickElement(driver.findElement(By.cssSelector("button.btn.btn-default")));
	}
	public void iSearchForDateInEpisodesDropdown() throws Throwable
	{
		Calendar calendar= Calendar.getInstance();
		calendar.add(Calendar.DATE, -1);
		Date yesterday= calendar.getTime();	  
	    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
	    String Date = format.format(yesterday);
	    clickElement(driver.findElement(By.cssSelector(".select2-arrow>b")));
	    iFillInText(driver.findElement(By.cssSelector("#s2id_autogen3_search")), Date);   
	}
	public void iVerifyDatePresentInEpisodeDropdown() throws Throwable
	{
		Calendar calendar= Calendar.getInstance();
		calendar.add(Calendar.DATE, -1);
		Date yesterday= calendar.getTime();	  
	    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
	    String Date = format.format(yesterday);
	    verifyTextForElement(driver.findElement(By.xpath("//span[@class='select2-match'][normalize-space(.) = '"+Date+"']")), Date);
	}
	public void iClickOnAgreeUnderAttestationPage() throws Throwable
	{
		clickElement(driver.findElement(By.cssSelector("#submitButtonAdd")));
	}
	public void iVerifyForPatientInCancelled() throws Throwable
	{
		String patient=driver.findElement(By.cssSelector(".col-md-6.ec2-embed-patient-name")).getText();
		clickElement(driver.findElement(By.cssSelector("#patientsListOpenClose")));
		clickElement(driver.findElement(By.cssSelector("#patientsFilter>li:nth-child(1)")));
        clickElement(driver.findElement(By.cssSelector("button[name='Canceled']")));
        iFillInText(driver.findElement(By.cssSelector("#form_search_search")), patient);
        clickElement(driver.findElement(By.cssSelector(".btn.btn-primary.refreshPatientsList")));
        clickElement(driver.findElement(By.xpath("//*[@id='patientsList']/div/div/span/div[1]/a/div/div[1]")));
        verifyTextForElement(driver.findElement(By.cssSelector(".col-md-6.ec2-embed-patient-name")), patient);
	}
}
