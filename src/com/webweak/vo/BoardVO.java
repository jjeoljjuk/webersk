package com.webweak.vo;

public class BoardVO {
    private String bdRom;
    private String bdNo;
    private String bdRno;
    private String bdTitle;
    private String bdUserId;
    private String bdContent;
    private String bdFirstDate;
    private String bdCount;
    private String bdFileName;

    public String getBdFileName() {
        return bdFileName;
    }

    public void setBdFileName(String bdFileName) {
        this.bdFileName = bdFileName;
    }

    public String getBdCount() {
        return bdCount;
    }

    public void setBdCount(String bdCount) {
        this.bdCount = bdCount;
    }

    public String getBdNo() {
        return bdNo;
    }

    public void setBdNo(String bdNo) {
        this.bdNo = bdNo;
    }

    public String getBdRno() {
        return bdRno;
    }

    public void setBdRno(String bdRno) {
        this.bdRno = bdRno;
    }

    public String getBdTitle() {
        return bdTitle;
    }

    public void setBdTitle(String bdTitle) {
        this.bdTitle = bdTitle;
    }

    public String getBdUserId() {
        return bdUserId;
    }

    public void setBdUserId(String bdUserId) {
        this.bdUserId = bdUserId;
    }

    public String getBdContent() {
        return bdContent;
    }

    public void setBdContent(String bdContent) {
        this.bdContent = bdContent;
    }

    public String getBdFirstDate() {
        return bdFirstDate;
    }

    public void setBdFirstDate(String bdFirstDate) {
        this.bdFirstDate = bdFirstDate;
    }
}
