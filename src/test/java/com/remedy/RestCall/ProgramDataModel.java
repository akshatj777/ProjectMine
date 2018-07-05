package com.remedy.RestCall;


import org.apache.commons.collections4.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by aparlapalli on 11/5/16.
 */

public class ProgramDataModel {

    private String name;
    private Long payorOrganizationId;
    private List<RankAttributionRuleDataModel> idRankList = null;

    public ProgramDataModel(String name, Long payorOrganizationId, List<RankAttributionRuleDataModel> idRankList) {

        this.name = name;
        this.payorOrganizationId = payorOrganizationId;
        if(CollectionUtils.isNotEmpty(idRankList))
        {
            this.idRankList = new ArrayList<>();
            this.idRankList.addAll(idRankList);
        }
    }

    public String getName() {
        return name;
    }

    public Long getPayorOrganizationId() {
        return payorOrganizationId;
    }

    public List<RankAttributionRuleDataModel> getIdRankList() {
        if(idRankList != null) 
        {
            return Collections.unmodifiableList(idRankList);
        }
        else
        {
            return new ArrayList<>();
        }
    }

}
