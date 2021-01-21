package com.webweak.vo;

public class BoardOptionsVO {
    // 게시글 시작
    private int start;
    // 게시글 마지막
    private int end;
    // 정렬 value
    private String reverse;
    // 정렬 타입
    private String type;
    //게시글 불러 오는 시작 날짜
    private String startDate;
    //게시글 불러 오는 끝 날짜
    private String endDate;

    // 검색 목록
    private String searchType;
    // 검색 검색
    private String searchText;

    public String getSearchType() {
        return searchType;
    }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getSearchText() {
        return searchText;
    }

    public void setSearchText(String searchText) {
        this.searchText = searchText;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public String getReverse() {
        return reverse;
    }

    public void setReverse(String reverse) {
        this.reverse = reverse;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
