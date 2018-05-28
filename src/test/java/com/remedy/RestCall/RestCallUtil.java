package com.remedy.RestCall;

import com.jayway.restassured.response.Response;
import org.apache.commons.codec.binary.Base64;
import java.util.Properties;

import static com.jayway.restassured.RestAssured.given;

/**
 * Created by aparlapalli on 1/16/18.
 */
public class RestCallUtil {


    public static Response get(String contentType, String url,String token) throws Throwable {

        String urlExt = appendSlashToUrl(url);
        Response response = given()
                .header("Authorization", "Bearer " + token)
                .contentType(contentType)
                .log().all(true)
                .when()
                .get(url)
                .then()
                .extract()
                .response();

        return response;

    }


    public static Response getById(String url, Long id,  String contentType,String token) {

        String urlExt = appendSlashToUrl(url);
        Response response = given()
                .header("Authorization", "Bearer " + token)
                .contentType(contentType)
                .log().all(true)
                .when()
                .get(urlExt + id + "/")
                .then()
                .extract()
                .response();

        return response;
    }

    public static Response post(String json, String contentType, String url,String token) {

        String urlExt = appendSlashToUrl(url);
        Response response = given()
                .header("Authorization", "Bearer " + token)
                .contentType(contentType)
                .log().all(true)
                .body(json)
                .when()
                .post(urlExt)
                .then()
                .extract()
                .response();

        return response;
    }

    public static Response update(String json,  String contentType, Long id, String url,String token) {

        String urlExt = appendSlashToUrl(url);
        Response response = given()
                .header("Authorization", "Bearer " + token)
                .contentType(contentType)
                .log().all(true)
                .body(json)
                .when()
                .put(urlExt + id + "/")
                .then()
                .extract()
                .response();

        return response;
    }

    public static Response updateAny(String json,  String contentType, String url,String token) {

        String urlExt = appendSlashToUrl(url);
        Response response = given()
                .header("Authorization", "Bearer " + token)
                .contentType(contentType)
                .log().all(true)
                .body(json)
                .when()
                .put(urlExt)
                .then()
                .extract()
                .response();

        return response;
    }

    public static Response delete(String url, Long id,  String contentType,String token) {

        String urlExt = appendSlashToUrl(url);
        Response response = given()
                .header("Authorization", "Bearer " + token)
                .contentType(contentType)
                .log().all(true)
                .when()
                .delete(urlExt + id + "/")
                .then()
                .extract()
                .response();

        return response;
    }

    private static String appendSlashToUrl(String url) {

        String urlExt;

        if (!url.contains("?") && !url.endsWith("/")) {
            urlExt = url + "/";
        } else {
            urlExt = url;
        }
        return urlExt;
    }

}
