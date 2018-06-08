package com.remedy.RestCall;

import com.jayway.restassured.response.Response;
import com.remedy.resources.DriverScript;

import org.apache.commons.codec.binary.Base64;
import org.apache.http.entity.StringEntity;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import java.util.Properties;

import static com.jayway.restassured.RestAssured.baseURI;

/**
 * Created by aparlapalli on 1/21/18.
 */
public class GenerateToken {


    public String getAccessToken() throws Throwable {

        String token = null;

        Response response = RestCallUtil.post("{\"client_id\":\"" + DriverScript.Config.getProperty("auth0.clientId") + "\",\"client_secret\":\"" + DriverScript.Config.getProperty("auth0.secret") + "\",\"audience\":\"" + DriverScript.Config.getProperty("auth0.audience") + "\",\"grant_type\":\"" + DriverScript.Config.getProperty("auth0.grantType") + "\"}", "application/json", DriverScript.Config.getProperty("auth0.url"), "");

        if (response.getStatusCode() == 200) {

            token = response.path("access_token");
        }
        return token;
    }


    public String getAccessTokenForProxy() throws Throwable {

        String token = null;

        Response response = RestCallUtil.post("{\"username\":\"" + DriverScript.Config.getProperty("auth0.clientId") + "\",\"password\":\"" + DriverScript.Config.getProperty("auth0.secret") + "\",\"scope\":\"" + DriverScript.Config.getProperty("auth0.audience") + "\",\"grant_type\":\"" + DriverScript.Config.getProperty("auth0.grantType") + "\"}", "application/json", DriverScript.Config.getProperty("auth0.url"), "");

        if (response.getStatusCode() == 200) {

            token = response.path("id_token");
        }
        return token;
    }
}
