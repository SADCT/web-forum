package model;

import java.io.Serializable;

public class Right implements Serializable {
    private int rightId;
    private String rightDesc;
    public int getRightId() {
        return rightId;
    }

    public void setRightId(int rightId) {
        this.rightId = rightId;
    }

    public String getRightDesc() {
        return rightDesc;
    }

    public void setRightDesc(String rightDesc) {
        this.rightDesc = rightDesc;
    }



}
