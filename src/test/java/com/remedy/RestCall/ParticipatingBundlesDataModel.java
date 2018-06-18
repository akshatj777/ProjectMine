package com.remedy.RestCall;

import org.apache.commons.collections4.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by aparlapalli on 2/8/17.
 */
public class ParticipatingBundlesDataModel {

    private String endDate;
    private Long participatingBundleId;
    private String startDate;
    private List<PricingListDataModel> pricingList = null;


    public ParticipatingBundlesDataModel(String endDate, Long participatingBundleId, String startDate, List<PricingListDataModel> pricingList) {

        this.endDate = endDate;
        this.participatingBundleId = participatingBundleId;
        this.startDate = startDate;

        if (CollectionUtils.isNotEmpty(pricingList)) {
            this.pricingList = new ArrayList<>();
            this.pricingList.addAll(pricingList);
        }

    }

    public String getEndDate() {
        return endDate;
    }

    public Long getParticipatingBundleId() {
        return participatingBundleId;
    }

    public String getStartDate() {
        return startDate;
    }

    public List<PricingListDataModel> getPricingList() {


        if (pricingList != null) {
            return Collections.unmodifiableList(pricingList);
        } else {
            return new ArrayList<>();
        }
    }


}
