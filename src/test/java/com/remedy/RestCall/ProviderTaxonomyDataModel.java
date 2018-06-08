package com.remedy.RestCall;

/**
 * Created by aparlapalli on 11/5/16.
 */

public class ProviderTaxonomyDataModel {

    private Long classificationId,groupingId,specializationId;
    private String definition,notes,providerTaxonCode;


    public ProviderTaxonomyDataModel(Long classificationId, Long groupingId, Long specializationId, String definition, String notes, String providerTaxonCode) {

            this.classificationId = classificationId;
            this.definition = definition;
            this.groupingId = groupingId;
            this.notes = notes;
            this.providerTaxonCode = providerTaxonCode;
            this.specializationId = specializationId;

    }

    public Long getClassificationId() {
        return classificationId;
    }

    public Long getGroupingId() {
        return groupingId;
    }

    public Long getSpecializationId() {
        return specializationId;
    }

    public String getDefinition() {
        return definition;
    }

    public String getNotes() {
        return notes;
    }

    public String getProviderTaxonCode() {
        return providerTaxonCode;
    }

}
