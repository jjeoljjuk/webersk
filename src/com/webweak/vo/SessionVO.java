package com.webweak.vo;

public class SessionVO {
    // 로그인 결과 값
    private int result;
    // 로그인 했을 때 사용자 아이디 정보
    private String userId;

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
