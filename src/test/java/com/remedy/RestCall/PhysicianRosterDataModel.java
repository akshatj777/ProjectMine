package com.remedy.RestCall;


/**
 * Created by aparlapalli on 3/13/17.
 */
public class PhysicianRosterDataModel {


    private Long practitionerContractId;
    private String endDate;
    private String startDate;
    private Long practitionerId;

    public PhysicianRosterDataModel(Long practitionerContractId, Long practitionrId ,String endDate,String startDate) {

        this.practitionerContractId = practitionerContractId;
        this.endDate = endDate;
        this.startDate = startDate;
        this.practitionerId = practitionrId;
    }


    public Long getBundlePaymentContractId() {
        return practitionerContractId;
    }

    public String getEndDate() {
        return endDate;
    }

    public String getStartDate() {
        return startDate;
    }

    public Long getPractitionerId() {
        return practitionerId;
    }
}
