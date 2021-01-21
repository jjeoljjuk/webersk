package com.webweak.dao;

import com.webweak.Mapping.AddressMapper;
import com.webweak.vo.AddressVO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Address extends ConnectionDB implements AddressMapper {

    @Override
    public List<String> addressList() throws SQLException {

        List<String> addressList = new ArrayList<>();

        try{
            String query = "SELECT CITY_NAME FROM address_list";
            rs = dbResult(query);

            while (rs.next()){
                addressList.add(rs.getString("CITY_NAME"));
            }

            return addressList;
        }catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }finally {
            clean();
        }

    }

    @Override
    public List<String> Specific(String search) throws SQLException {

    String query = "SELECT SIGUNGU_NAME FROM address_detail WHERE CITY_NAME = '"+search+"'";
    ArrayList<String> addressList = new ArrayList<>();
    try{

        rs = dbResult(query);
        while (rs.next()){
            addressList.add(rs.getString("SIGUNGU_NAME"));

        }
        return addressList;
    }catch(Exception e){
        throw new RuntimeException(e.getMessage());
    }finally {
        clean();
    }

    }

    @Override
    public List<AddressVO> specificBtn(AddressVO addressVO) throws SQLException {


        String query = "";

        List<AddressVO> list = new ArrayList<>();

        // 시도 까지 검색
        if (addressVO.getFindD() != null){
            query = "SELECT CITY_NAME,SIGUNGU_NAME,BEOPJEONG_NAME,LOT_ADDRESS,LOT_HO FROM SEOUL_JIBUN WHERE CITY_NAME = '"+addressVO.getFindD()+"'";
        }
        // 시군구 까지 검색
        if (addressVO.getFindG() != null){
            query = "SELECT CITY_NAME,SIGUNGU_NAME,BEOPJEONG_NAME,LOT_ADDRESS,LOT_HO FROM SEOUL_JIBUN WHERE CITY_NAME = '"+addressVO.getFindD()+"' AND SIGUNGU_NAME = '"+addressVO.getFindG()+"'";
        }

        // 읍면동 까지 검색
        if (addressVO.getFindDG() != null){
            query = "SELECT CITY_NAME,SIGUNGU_NAME,BEOPJEONG_NAME,LOT_ADDRESS,LOT_HO FROM SEOUL_JIBUN WHERE CITY_NAME = '"+addressVO.getFindD()+"' AND SIGUNGU_NAME = '"+addressVO.getFindG()+"' AND BEOPJEONG_NAME LIKE '%"+addressVO.getFindDG()+"%'";
        }

        // 번지 까지 검색
        if (addressVO.getFindN1() != null && addressVO.getFindN2() != null){
            query = "SELECT CITY_NAME,SIGUNGU_NAME,BEOPJEONG_NAME,LOT_ADDRESS,LOT_HO FROM SEOUL_JIBUN WHERE CITY_NAME = '"+addressVO.getFindD()+"' AND SIGUNGU_NAME = '"+addressVO.getFindG()+"' AND BEOPJEONG_NAME LIKE '%"+addressVO.getFindDG()+"%'"+"AND LOT_ADDRESS LIKE '%"+addressVO.getFindN1()+"%'AND LOT_HO LIKE'%"+addressVO.getFindN2()+"%'";
        }

        System.out.println(query);

        try{


            rs = dbResult(query);
            while (rs.next()){
                AddressVO vo = new AddressVO();
                vo.setFindD(rs.getString("CITY_NAME"));
                vo.setFindG(rs.getString("SIGUNGU_NAME"));
                vo.setFindDG(rs.getString("BEOPJEONG_NAME"));
                vo.setFindN1(rs.getString("LOT_ADDRESS"));
                vo.setFindN2(rs.getString("LOT_HO"));
                list.add(vo);
            }



            return list;

        }catch(Exception e){
            System.out.println(e.getMessage());
        }finally {
            clean();
        }
        return null;
    }
}
