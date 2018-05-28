package com.remedy.RestCall;

/**
 * Created by aparlapalli on 2/8/17.
 */
public class BundleDataModel {

    private String content;
    private String name;
    private String bundleCode;

    public BundleDataModel(String bundleName, String bundleContent, String bundleCode) {

        this.bundleCode = bundleCode;
        this.content = bundleContent;
        this.name = bundleName;

    }

    public String getContent() {
        return content;
    }

    public String getName() {
        return name;
    }

    public String getBundleCode() {
        return bundleCode;
    }


}
