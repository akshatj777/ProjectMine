package com.remedy.RestCall;


import org.apache.commons.collections4.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by aparlapalli on 11/4/16.
 */

public class OrgDataModel {

    private String name;
    private String contactName;
    private String email;
    private String phone;
    private Integer marketId;
    private String shortName;
    private String managingOrganizationId;
    private String npi;
    private String ccn;
    private String ein;
    private Long participantId;
    private ProgramIdModel programIds;
    private AddressDataModel address;
    private List<LocationsDataModel> locations = null;


    //data modal for managing org
    public OrgDataModel(String name, String contactName, Long participantId,
                        String email, String phone, AddressDataModel address) {


        this.name = name;
        this.participantId = participantId;
        this.contactName = contactName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.locations = null;

    }

    //data modal for payor org
    public OrgDataModel(String name, Long participantId, String tinEin, String contactName,
                        String email, String phone, AddressDataModel address) {


        this.name = name;
        this.participantId = participantId;
        this.ein = tinEin;
        this.contactName = contactName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.locations = null;

    }

    //data modal for PGP org
    public OrgDataModel(String name, Long participantId, String shortName,
                        String managingOrgId, String npi, String ein, Integer marketId, AddressDataModel address) {


        this.name = name;
        this.participantId = participantId;
        this.shortName = shortName;
        this.managingOrganizationId = managingOrgId;
        this.marketId = marketId;
        this.npi = npi;
        this.ein = ein;
        this.address = address;
        this.locations = null;

    }

    //data modal for HHA org
    public OrgDataModel(String name, Long participantId, String shortName,
                        String managingOrgId, String npi, String ein, String ccn, Integer marketId, AddressDataModel address) {


        this.name = name;
        this.participantId = participantId;
        this.shortName = shortName;
        this.managingOrganizationId = managingOrgId;
        this.marketId = marketId;
        this.npi = npi;
        this.ein = ein;
        this.ccn = ccn;
        this.address = address;
        this.locations = null;

    }

    //data modal for Hospital,Snf,Ltch org
    public OrgDataModel(Long participantId, String ccn, String npi, String ein, String name,
                        String shortName, String managingOrgId, AddressDataModel address, List<LocationsDataModel> locations) {

        this.name = name;
        this.participantId = participantId;
        this.shortName = shortName;
        this.managingOrganizationId = managingOrgId;
        this.ccn = ccn;
        this.npi = npi;
        this.ein = ein;
        this.address = address;

        if (CollectionUtils.isNotEmpty(locations)) {
            this.locations = new ArrayList<>();
            this.locations.addAll(locations);
        }
    }

    public String getName() {
        return name;
    }

    public String getContactName() {
        return contactName;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }

    public Integer getMarketId() {
        return marketId;
    }

    public String getShortName() {
        return shortName;
    }

    public String getManagingOrganizationId() {
        return managingOrganizationId;
    }

    public String getNpi() {
        return npi;
    }

    public String getCcn() {
        return ccn;
    }

    public String getEin() {
        return ein;
    }

    public Long getParticipantId() {
        return participantId;
    }

    public ProgramIdModel getProgramIds() {
        return programIds;
    }

    public AddressDataModel getAddress() {
        return address;
    }

    public List<LocationsDataModel> getLocations() {

        if (locations != null) {
            return Collections.unmodifiableList(locations);
        } else {
            return new ArrayList<>();
        }
    }


}
