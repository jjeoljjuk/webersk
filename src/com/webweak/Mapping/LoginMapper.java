
package com.webweak.Mapping;

import com.webweak.vo.UserVO;

import java.sql.SQLException;

public interface LoginMapper {


    public int login(UserVO userVO) throws SQLException;


}
