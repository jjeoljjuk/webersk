package com.webweak.vo;

public class AddressVO {

    // 시도
    private String findD;
    // 시군구
    private String findG;
    // 읍면동
    private String findDG;
    // 번지 findN1 - findN2
    private String findN1;
    private String findN2;




    public String getFindD() {
        return findD;
    }

    public void setFindD(String findD) {
        this.findD = findD;
    }

    public String getFindG() {
        return findG;
    }

    public void setFindG(String findG) {
        this.findG = findG;
    }

    public String getFindDG() {
        return findDG;
    }

    public void setFindDG(String findDG) {
        this.findDG = findDG;
    }

    public String getFindN1() {
        return findN1;
    }

    public void setFindN1(String findN1) {
        this.findN1 = findN1;
    }

    public String getFindN2() {
        return findN2;
    }

    public void setFindN2(String findN2) {
        this.findN2 = findN2;
    }
}
