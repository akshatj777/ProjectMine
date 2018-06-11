package com.remedy.RestCall;

import org.apache.commons.collections4.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by aparlapalli on 11/5/16.
 */

public class PractitionerDataModel {

    private String firstName;
    private String lastName;
    private String gender;
    private String npi;
    private AddressDataModel address;
    private String enumerationDate;
    private String prefix;
    private String suffix;
    private String npiDeactivationDate;
    private String npiDeactivationReasonCode;
    private String otherFirstName;
    private String otherLastName;
    private String otherPrefix;
    private String otherSuffix;
    private List<PractitionerLicensesDataModel> practitionerLicenses = null;
    private List<Long> secondaryProviderTaxonomyIds = null;
    private Long primaryProviderTaxonomyId;


    public PractitionerDataModel(String firstName, String lastName, String npi, String gender,
                                 String enumerationDate, String prefix, String suffix, String npiDeactivationDate, String npiDeactivationReasonCode,
                                 String otherFirstName, String otherLastName, String otherPrefix, String otherSuffix,
                                 Long primaryTaxonomyId, List<Long> secondaryTaxonomyIds, List<PractitionerLicensesDataModel>
                                         practitionerLicenses, AddressDataModel address) {

        this.firstName = firstName;
        this.lastName = lastName;
        this.npi = npi;
        this.gender = gender;
        this.address = address;
        this.enumerationDate = enumerationDate;
        this.prefix = prefix;
        this.suffix = suffix;
        this.npiDeactivationDate = npiDeactivationDate;
        this.npiDeactivationReasonCode = npiDeactivationReasonCode;
        this.otherFirstName = otherFirstName;
        this.otherLastName = otherLastName;
        this.otherPrefix = otherPrefix;
        this.otherSuffix = otherSuffix;
        this.primaryProviderTaxonomyId = primaryTaxonomyId;
        this.secondaryProviderTaxonomyIds = secondaryTaxonomyIds;

        if(CollectionUtils.isNotEmpty(secondaryTaxonomyIds)) {
            this.secondaryProviderTaxonomyIds = new ArrayList<>();
            this.secondaryProviderTaxonomyIds.addAll(secondaryTaxonomyIds);
        }

        if(CollectionUtils.isNotEmpty(practitionerLicenses)) {
            this.practitionerLicenses = new ArrayList<>();
            this.practitionerLicenses.addAll(practitionerLicenses);
        }

    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public AddressDataModel getAddress() {
        return address;
    }

    public String getEnumerationDate() {
        return enumerationDate;
    }

    public String getPrefix() {
        return prefix;
    }

    public String getSuffix() {
        return suffix;
    }

    public String getNpiDeactivationDate() {
        return npiDeactivationDate;
    }

     public String getNpiDeactivationReasonCode() {
        return npiDeactivationReasonCode;
    }

    public String getOtherFirstName() {
        return otherFirstName;
    }

    public String getOtherLastName() {
        return otherLastName;
    }

    public String getOtherPrefix() {
        return otherPrefix;
    }

    public String getOtherSuffix() {
        return otherSuffix;
    }

    public List<PractitionerLicensesDataModel> getPractitionerLicenses() {

        if(practitionerLicenses != null) {
            return Collections.unmodifiableList(practitionerLicenses);
        }else{
            return new ArrayList<>();
        }
    }


    public List<Long> getSecondaryProviderTaxonomyIds() {

        if(secondaryProviderTaxonomyIds != null) {
            return Collections.unmodifiableList(secondaryProviderTaxonomyIds);
        }else{
            return new ArrayList<>();
        }
    }

    public Long getPrimaryProviderTaxonomyId() {
        return primaryProviderTaxonomyId;
    }

    public void setPrimaryProviderTaxonomyId(Long primaryProviderTaxonomyId) {
        this.primaryProviderTaxonomyId = primaryProviderTaxonomyId;
    }


}
