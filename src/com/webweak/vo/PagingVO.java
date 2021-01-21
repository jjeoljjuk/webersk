package com.webweak.vo;

public class PagingVO {
    private int pageMax;
    private int block;
    private int total;
    private int pg;

    public PagingVO(int pageMax, int block, int total, int pg) {
        this.pageMax = pageMax;
        this.block = block;
        this.total = total;
        this.pg = pg;
    }

    public int getPageMax() {
        return pageMax;
    }

    public void setPageMax(int pageMax) {
        this.pageMax = pageMax;
    }

    public int getBlock() {
        return block;
    }

    public void setBlock(int block) {
        this.block = block;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getPg() {
        return pg;
    }

    public void setPg(int pg) {
        this.pg = pg;
    }
}
