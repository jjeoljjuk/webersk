package com.webweak.vo;

public class PagingActionVO {
    private int pageStart;
    private int pageEnd;
    private int pageBlock;
    private int pageTotal;

    public PagingActionVO(int pageStart, int pageEnd, int pageBlock, int pageTotal) {
        this.pageStart = pageStart;
        this.pageEnd = pageEnd;
        this.pageBlock = pageBlock;
        this.pageTotal = pageTotal;
    }

    public int getPageBlock() {
        return pageBlock;
    }

    public int getPageStart() {
        return pageStart;
    }

    public int getPageEnd() {
        return pageEnd;
    }

    public int getPageTotal() {
        return pageTotal;
    }
}
