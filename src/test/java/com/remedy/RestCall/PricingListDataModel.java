package com.remedy.RestCall;

/**
 * Created by aparlapalli on 2/8/17.
 */
public class PricingListDataModel {

    private String endDate;
    private double price;
    private String startDate;
    private String baselineStartDate;
    private String baselineEndDate;
    private double upperBound;
    private double lowerBound;
    private double trendFactor;

    public PricingListDataModel(String endDate, String startDate, double price, String baselineEndDate, String baselineStartDate, double trendFactor, double upperBound, double lowerBound) {

        this.startDate = startDate;
        this.endDate = endDate;
        this.baselineStartDate = baselineStartDate;
        this.baselineEndDate = baselineEndDate;
        this.trendFactor = trendFactor;
        this.upperBound = upperBound;
        this.lowerBound = lowerBound;
        this.price = price;


    }
    public String getEndDate() {
        return endDate;
    }

    public double getPrice() {
        return price;
    }

    public String getStartDate() {
        return startDate;
    }

    public String getBaselineStartDate() {
        return baselineStartDate;
    }

    public String getBaselineEndDate() {
        return baselineEndDate;
    }

    public double getUpperBound() {
        return upperBound;
    }

    public double getLowerBound() {
        return lowerBound;
    }

    public double getTrendFactor() {
        return trendFactor;
    }


}
