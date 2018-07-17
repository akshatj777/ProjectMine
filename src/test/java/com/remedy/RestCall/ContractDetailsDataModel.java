package com.remedy.RestCall;

import org.apache.commons.collections4.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by aparlapalli on 3/13/17.
 */
public class ContractDetailsDataModel {

    private String contractId;
    private String endDate;
    private Long organizationId;
    private Long programId;
    private String startDate;
    private String type;
    private List<ParticipatingBundlesDataModel> participatingBundles = null;


    public ContractDetailsDataModel(String contractId, String endDate, long organizationId, Long programId, String startDate, String type, List<ParticipatingBundlesDataModel> participatingBundles) {

        this.contractId = contractId;
        this.endDate = endDate;
        this.organizationId = organizationId;
        this.programId = programId;
        this.startDate = startDate;
        this.type = type;

        if (CollectionUtils.isNotEmpty(participatingBundles)) {
            this.participatingBundles = new ArrayList<>();
            this.participatingBundles.addAll(participatingBundles);
        }

    }

    public String getContractId() {
        return contractId;
    }

    public String getEndDate() {
        return endDate;
    }

    public Long getOrganizationId() {
        return organizationId;
    }

    public Long getProgramId() {
        return programId;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getType() {
        return type;
    }

    public List<ParticipatingBundlesDataModel> getParticipatingBundles() {

        if (participatingBundles != null) {
            return Collections.unmodifiableList(participatingBundles);
        } else {
            return new ArrayList<>();
        }
    }


}
