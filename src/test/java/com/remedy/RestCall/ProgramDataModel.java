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
    private List<RankAttributionRuleDataModel> idValidationRankList = null;
    
    private boolean multipleBundleEpisode;

    public ProgramDataModel(boolean multipleBundleEpisode, String name, Long payorOrganizationId, List<RankAttributionRuleDataModel> idRankList, List<RankAttributionRuleDataModel> idValidationRankList) {

        this.name = name;
        this.payorOrganizationId = payorOrganizationId;
        if(CollectionUtils.isNotEmpty(idRankList))
        {
            this.idRankList = new ArrayList<>();
            this.idRankList.addAll(idRankList);
        }
        if(CollectionUtils.isNotEmpty(idValidationRankList))
        {
            this.idValidationRankList = new ArrayList<>();
            this.idValidationRankList.addAll(idValidationRankList);
        }
        this.multipleBundleEpisode= multipleBundleEpisode;
    }

    public String getName() {
        return name;
    }

    public Long getPayorOrganizationId() {
        return payorOrganizationId;
    }
    
    public boolean getMultipleBundleEpisodes() {
        return multipleBundleEpisode;
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
    
    public List<RankAttributionRuleDataModel> getIdValidationRankList() {
        if(idValidationRankList != null) 
        {
            return Collections.unmodifiableList(idValidationRankList);
        }
        else
        {
            return new ArrayList<>();
        }
    }

}
