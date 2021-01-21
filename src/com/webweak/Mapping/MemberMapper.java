package com.webweak.Mapping;

import com.webweak.vo.MemberVO;
import com.webweak.vo.SessionVO;
import com.webweak.vo.UserVO;

import java.sql.SQLException;

public interface MemberMapper {
    public int idCheck(String userId) throws SQLException;
    public int join(MemberVO member) throws SQLException;
    public SessionVO loginCheck(UserVO userVO) throws SQLException;
}
