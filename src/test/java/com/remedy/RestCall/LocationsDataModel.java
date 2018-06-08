package com.remedy.RestCall;


import org.apache.commons.collections4.CollectionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * Created by aparlapalli on 11/4/16.
 */
public class LocationsDataModel {


    private List<String> locationTypeIds = null;
    private Integer marketId;
    private String name;
    private String locationId;
    private AddressDataModel address;


    public LocationsDataModel(AddressDataModel address, List<String> locTypeIds, Integer marketId, String locationName, String locationId) {

        this.address = address;
        if (CollectionUtils.isNotEmpty(locTypeIds)) {
            this.locationTypeIds = new ArrayList<>();
            this.locationTypeIds.addAll(locTypeIds);
        }
        this.marketId = marketId;
        this.name = locationName;
        this.locationId = locationId;

    }

    public List<String> getLocationTypeIds() {

        if (locationTypeIds != null) {
            return Collections.unmodifiableList(locationTypeIds);
        } else {
            return new ArrayList<>();
        }
    }

    public Integer getMarketId() {
        return marketId;
    }

    public String getName() {
        return name;
    }

    public AddressDataModel getAddress() {
        return address;
    }

}
