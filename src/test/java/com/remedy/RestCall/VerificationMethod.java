package com.remedy.RestCall;

import com.jayway.restassured.response.Response;
import org.apache.commons.lang3.StringUtils;

import java.util.HashSet;
import java.util.Set;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

/**
 * Created by aparlapalli on 2/28/17.
 */
public class VerificationMethod {


    public void verifyExpectedVsActualResults(Response response, int expCode, String expResponseMsg) throws Throwable {

        assertEquals(expCode, response.getStatusCode());

        if (response.getStatusCode() == 201) {
            assertNotNull(response.path("id"));
            assertNotNull(response.path("createDate"));
            assertNotNull(response.path("updateDate"));
            assertNotNull(response.path("version"));
        }

        // to split data inside brackets , split is done on comma and inside paranthesis by using regular exp {},{}
        String[] cucumberDataSplit = expResponseMsg.split(",(?=[^\\}]*(?:\\{|$))");
        Set<String> cucmberRespMsgSet = new HashSet<>();
        for (String splitStr : cucumberDataSplit) {
            cucmberRespMsgSet.add(splitStr);
        }

        if (StringUtils.isNotBlank(expResponseMsg)) {
            String actualMsg;

            if (expResponseMsg.startsWith("A resource with ID")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("A resource with ID \\d+ already exists."));
            } else if (expResponseMsg.startsWith("A requested resource with ID")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("A requested resource with ID \\d+ was not found."));
            } else if (expResponseMsg.startsWith("Organization with id")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("Organization with id \\d+ is not a supported type."));
            } else if (expResponseMsg.startsWith("Networkable Bundle Payment Contract")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("Networkable Bundle Payment Contract with id \\d+ has incompatible date range."));
            } else if (expResponseMsg.startsWith("PGP Contract with id")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("PGP Contract with id \\d+ has incompatible date range."));
            } else if (expResponseMsg.startsWith("Bundle Payment Contract with id")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("Bundle Payment Contract with id \\d+ has incompatible date range."));
            } else if (expResponseMsg.startsWith("An attempt to delete a resource with")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("An attempt to delete a resource with ID\\d+ was not completed as the resource is referenced elsewhere"));
            } else if (expResponseMsg.startsWith("Performance Network Contract date range overlaps")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("Performance Network Contract date range overlaps existing performance Network Contract date ranges for organization id : \\d+"));
            } else if (expResponseMsg.startsWith("An attempt to delete a resource with")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("An attempt to delete a resource with ID\\d+ was not completed as the resource is referenced elsewhere"));
            } else if (!(response.path("validationFieldErrors").toString()).equals("{}")) {
                assertTrue(cucmberRespMsgSet.contains(response.path("validationFieldErrors").toString()));
            } else if ((response.path("payloadErrors[0]").toString()).startsWith("Performance Network Contract with id")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("Performance Network Contract with id \\d+ has incompatible date range."));
            } else if ((response.path("payloadErrors[0]").toString()).startsWith("Network Contract with id")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("Network Contract with id \\d+ has incompatible date range."));
            } else if ((response.path("payloadErrors[0]").toString()).startsWith("Practitioner Contract with id")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("Practitioner Contract with id \\d+ has incompatible date range."));
            } else if ((response.path("payloadErrors[0]").toString()).startsWith("Contract already exists for organization with id")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("Contract already exists for organization with id \\d+ for PGP contract with id \\d+ with overlapping date range"));
            } else if ((response.path("payloadErrors[0]").toString()).startsWith("Organization with id")) {
                actualMsg = response.path("payloadErrors[0]").toString();
                assertTrue(actualMsg.matches("Organization with id \\d+ is not a supported type."));
            } else {
                assertEquals(expResponseMsg, response.path("payloadErrors[0]").toString());
            }
        }
    }

}