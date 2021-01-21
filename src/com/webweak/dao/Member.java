package com.webweak.dao;

import com.webweak.Mapping.MemberMapper;
import com.webweak.vo.MemberVO;
import com.webweak.vo.SessionVO;
import com.webweak.vo.UserVO;


import java.security.MessageDigest;
import java.sql.SQLException;

import static com.webweak.global.HttpState.*;

public class Member extends ConnectionDB implements MemberMapper {



    @Override
    public int idCheck(String userId) throws SQLException {
        String query = "SELECT USER_ID FROM member WHERE USER_ID ='"+userId+"'";
        try{
            rs = dbResult(query);


            if (rs.next()){
                    return HttpSuccess;
            }



        }catch(Exception e){
            System.out.println(e.getMessage());
        }finally{
          clean();
        }
        return HttpFault;
    }

    @Override
    public int join(MemberVO memberVO) throws SQLException {

        String value = "'"+memberVO.getUserId()+"','"+memberVO.getUserPw()+"','"+memberVO.getUserName()+"','"+memberVO.getDateJoin()+"','"+memberVO.getGender()+"','"+memberVO.getEmail()+"','"+memberVO.getAddress()+"','"+memberVO.getPhone()+"'";
        String query = "INSERT INTO Member(user_id,user_pw,user_name,birth_data,gender,email,address,pshone) VALUES ("+value+")";


        try{
            int res = stmt.executeUpdate(query);
            if (res == 1){
                return HttpSuccess;
            }


        }catch(Exception e){
            throw new RuntimeException(e.getMessage());
        }finally {
            clean();
        }
        return HttpFault;
    }

    @Override
    public SessionVO loginCheck(UserVO userVO) throws SQLException {

        SessionVO sessionVO = null;
        try{
            String query ="SELECT USER_ID,USER_PW FROM Member" + " WHERE USER_ID = '"+ userVO.getUserId() +"' AND USER_PW = '" + passwordHash(userVO.userPw) + "'";
            sessionVO = new SessionVO();

            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);

            if (rs.next()){
                sessionVO.setResult(HttpSuccess);
                sessionVO.setUserId(rs.getString("USER_ID"));
                return sessionVO;
            }

        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally {
            clean();
        }
        sessionVO.setResult(HttpFault);
        return sessionVO;
    }



    public String passwordHash(String password) {
        try{
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(password.getBytes());
            StringBuilder builder = new StringBuilder();
            for (byte b: md.digest()) {
                builder.append(String.format("%02x", b));
            }
            return builder.toString();
        }catch (Exception e){
            throw new RuntimeException(e.getMessage());
        }
    }

}
