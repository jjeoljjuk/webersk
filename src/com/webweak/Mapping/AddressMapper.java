package com.webweak.Mapping;

import com.webweak.vo.AddressVO;

import java.sql.SQLException;
import java.util.List;

public interface AddressMapper {

    // 시도 리스트
    public List<String> addressList() throws SQLException;

    // 시군구 리스트
    public List<String> Specific(String search) throws SQLException;
    // 읍면동 리스트
// public List<String> dongSpecific();

    public List<AddressVO> specificBtn(AddressVO addressVO) throws SQLException;
}
