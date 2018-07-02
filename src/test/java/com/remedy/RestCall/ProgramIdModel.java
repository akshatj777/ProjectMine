package com.remedy.RestCall;

/**
 * Created by aparlapalli on 11/5/16.
 */

public class ProgramIdModel {

    private String BPID;
    private String CJRID;

    public ProgramIdModel(String bpid, String cjrid) {

        this.BPID = bpid;
        this.CJRID = cjrid;

    }

    public String getBPID() {
        return BPID;
    }

    public void setBPID(String BPID) {
        this.BPID = BPID;
    }

    public String getCJRID() {
        return CJRID;
    }

    public void setCJRID(String CJRID) {
        this.CJRID = CJRID;
    }
}
