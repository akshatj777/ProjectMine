package com.remedy.RestCall;

/**
 * Created by aparlapalli on 5/11/17.
 */
public class NetworkContractDataModel {


    private String endDate;
    private Long organizationId;
    private Long networkableBundlePaymentContractId;
    private String startDate;
    private String type;


    public NetworkContractDataModel(String endDate, Long organizationId, Long networkableBundlePaymentContractId, String startDate, String type) {

        this.endDate = endDate;
        this.organizationId = organizationId;
        this.networkableBundlePaymentContractId = networkableBundlePaymentContractId;
        this.startDate = startDate;
        this.type = type;

    }

    public String getEndDate() {
        return endDate;
    }

    public Long getOrganizationId() {
        return organizationId;
    }

    public Long getNetworkableBundlePaymentContractId() {
        return networkableBundlePaymentContractId;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getType() {
        return type;
    }

}
