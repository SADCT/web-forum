package model;

import java.io.Serializable;

public class Superadmin implements Serializable {
    private int superadminId;
    private int rightId;
    private String superadminName;
    private String superadminPassword;
    public int getSuperadminId() {
        return superadminId;
    }

    public void setSuperadminId(int superadminId) {
        this.superadminId = superadminId;
    }

    public int getRightId() {
        return rightId;
    }

    public void setRightId(int rightId) {
        this.rightId = rightId;
    }

    public String getSuperadminName() {
        return superadminName;
    }

    public void setSuperadminName(String superadminName) {
        this.superadminName = superadminName;
    }

    public String getSuperadminPassword() {
        return superadminPassword;
    }

    public void setSuperadminPassword(String superadminPassword) {
        this.superadminPassword = superadminPassword;
    }


}
