package stepDefination;


//import com.github.mkolisnyk.cucumber.runner.ExtendedCucumberOptions;
import com.remedy.resources.DriverScript;
import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;
import stepDefination.Hooks.*;

/**
 * Created by salam on 7/29/15.
 */

/*@RunWith(ExtendedCucumberRunner.class)
@ExtendedCucumberOptions(jsonReport = "/target/cucumber-results/cucumber.json", retryCount = 3, detailedReport = true,
                        detailedAggregatedReport = true, overviewReport = true, outputFolder = "/target/cucumber-results")
@CucumberOptions(
        plugin = { "html:target/cucumber-results", "usage:target/cucumber-results/cucumber-usage.json",
                "junit:target/cucumber-results/cucumber-results.xml", "json:target/cucumber-results/cucumber.json"},
        features = { "src/test/Features/"},
        //glue = { "./src/test/java/stepDefination" },
<<<<<<< HEAD
        tags = {} 
<<<<<<< HEAD
=======
        tags = {}
>>>>>>> 27d2aadbfc8be4003c8619a3e677b08dffc52540

)*/

@RunWith(ExtendedCucumberRunner.class)
@CucumberOptions(
        plugin = {"html:target/cucumber-results", "usage:target/cucumber-results/cucumber-usage.json",
                "junit:target/cucumber-results/cucumber-results.xml", "json:target/cucumber-results/cucumber.json"},

        features = { "src/test/Features/Analytics/" },
        monochrome = true,
        //glue = { "./src/test/java/stepDefination" },
                                   
        tags = {"@Claims"}

		)
public class TestRunner {

        @BeforeSuite
        public static void setUp() {
                // TODO: Add your pre-processing

        }

        @AfterSuite
        public static void tearDown () throws Exception {

                /*CucumberCoverageReport testReportFinal = new CucumberCoverageReport();

               testReportFinal.generateFeatureOverviewReport();
                testReportFinal.testGenerateDetailedAggregatedReport();
                testReportFinal.generateCoverageOverviewReport();*/

                if (DriverScript.Config.getProperty("wantToSendReportViaAutoEmail").equalsIgnoreCase("true")){
                        //System.out.println("control should move here only if I want to send email- cheers !!");
                        AutoReportEmailSender sendReportEmailAutomatically = new AutoReportEmailSender();
                        sendReportEmailAutomatically.autoSendReportMail("aranjan@remedypartners.com", new String[]{"qa@remedypartners.com"}, "Test Email:- Automatic Test Automation Report !!");
                }
        }
}
