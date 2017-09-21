package stepDefination.Hooks;


//import com.github.mkolisnyk.cucumber.reporting.CucumberCoverageOverview;
//import com.github.mkolisnyk.cucumber.reporting.CucumberDetailedResults;
import com.remedy.resources.DriverScript;

import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.Before;
import cucumber.api.java.en.Given;

import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * Created by salam on 8/4/15.
 */
public class InitialSetup {

    private WebDriver driver;



    @Before
    public  void beforeScenario() {
        driver = new DriverScript().getDriver();

    }

    @After
    public void afterScenario(Scenario scenario) throws IOException {

        try {
            if (scenario.isFailed()) {
                 byte[] screenshot = ((TakesScreenshot) driver)
                        .getScreenshotAs(OutputType.BYTES);
                scenario.embed(screenshot, "image/png");
            }
        } finally {
        	//DriverScript.outPropFile.close();

            new DriverScript().quitDriver();
        }

    }




}