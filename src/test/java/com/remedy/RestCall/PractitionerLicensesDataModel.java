package com.remedy.RestCall;

/**
 * Created by aparlapalli on 12/20/17.
 */
public class PractitionerLicensesDataModel {

    private String licenseNumber;
    private String licenseNumberStateCode;


    public PractitionerLicensesDataModel(String licenseNumber, String licenseNumberStateCode) {

        this.licenseNumber = licenseNumber;
        this.licenseNumberStateCode = licenseNumberStateCode;
    }

    public String getLicenseNumber() {
        return licenseNumber;
    }

    public void setLicenseNumber(String licenseNumber) {
        this.licenseNumber = licenseNumber;
    }

    public String getLicenseNumberStateCode() {
        return licenseNumberStateCode;
    }

    public void setLicenseNumberStateCode(String licenseNumberStateCode) {
        this.licenseNumberStateCode = licenseNumberStateCode;
    }
}
