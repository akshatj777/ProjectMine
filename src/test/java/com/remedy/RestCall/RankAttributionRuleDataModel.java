package com.remedy.RestCall;

/**
 * Created by aparlapalli on 11/5/16.
 */

public class RankAttributionRuleDataModel {

    private Float value;
    private Long id;

    public RankAttributionRuleDataModel(Long id, Float value) {

        this.value = value;
        this.id = id;

    }

    public Float getValue() {
        return value;
    }

    public Long getId() {
        return id;
    }
}
