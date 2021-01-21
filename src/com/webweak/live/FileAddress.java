package com.webweak.live;

import com.webweak.dao.ConnectionDB;

import java.io.*;
import java.sql.SQLException;

public class FileAddress extends ConnectionDB {



    public void fileList(){


        try{
            String fileName = "/Users/leedonghun/Desktop/정리/address/202008_주소DB_전체분/";
            File file = new File(fileName);
            File[] filesList = file.listFiles();




//            String query = "INSERT INTO address_List(address_name) values ("+"'"+str+"'"+")";
//            int res = stmt.executeUpdate(query);
//
//            if (res == 1){
//                System.out.println("성공");
//            }





            System.out.println("====================");
            for (int i = 0;i<filesList.length;i++){

                if (filesList[i].getName().substring(0,3).equals("지번_")){
                    String str = filesList[i].getName().substring(3,filesList[i].getName().length()-4);


                }
            }
            System.out.println("====================");

        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally {

        }
    }


    public void addressLoad(String fileName){
        try{
//            String fileName = "/Users/leedonghun/Desktop/정리/address/202008_건물DB_전체분/jibun_seoul.txt";
//            String fileName = "/Users/leedonghun/Desktop/정리/address/202008_주소DB_전체분/지번_서울특별시.txt";


            FileInputStream input=new FileInputStream(fileName);
            InputStreamReader reader=new InputStreamReader(input,"euc-kr");
            BufferedReader in=new BufferedReader(reader);


            System.out.println("=========="+fileName+"==========");

            String sLine;
            int max = 0;
            while((sLine = in.readLine()) != null){
                System.out.println(sLine);

                String str = "";
                String[] data = sLine.split("[|]");
                for (int i =0;i<data.length;i++) {


                    if (i == 10){
                        str += "'" + data[i] + "'";
                    }else if (i == 9){
                        str += "" + data[i] + ",";
                    }else if (i == 8){
                        str += "" + data[i] + ",";
                    }else {
                        str += "'" + data[i] + "',";
                    }


                }
                System.out.println(str);
                dataJoin(str);

                str ="";

//                break;
            }

            System.out.println("=========="+fileName+"==========");

            in.close();
        }catch(Exception e){
            System.out.println(e.getMessage());
        }finally {

        }

    }

    // 시도 데이터 add
   public void dataJoin(String value){

        try{
            String query = "INSERT INTO seoul_jibun(Control_NO,Serial_NO,Court_code,City_name,Sigungu_name,Beopjeong_name,Legalrule_name,mt_whether,Lot_address,Lot_ho,DV_WHETHER) VALUES ("+value+")";
            int res = stmt.executeUpdate(query);

            if (res == 1){
                System.out.println("성공");
            }

        }catch(Exception e){
            System.out.println(e.getMessage());
        }

    }

    // 시군구 데이터 add
    public void dataJoin2() throws SQLException {


        String aa ="종로구|" +"중구|"+"용산구|"+"성동구|"+"광진구|"+"동대문구|"+"중랑구|"+"성북구|"+"강북구|"+"도봉구|"+"노원구|"+"은평구|"+"서대문구|"+"마포구|"+"양천구|"+"강서구|"+"구로구|"+"금천구|"+"영등포구|"+"동작구|"+"관악구|"+"서초구|"+"강남구|"+"송파구|"+"강동구";


        try{





            String[] data = aa.split("[|]");
            for (int i =0;i<data.length;i++){
                String value = "'"+data[i]+"','"+"서울특별시"+"'";
                String query ="INSERT INTO address_detail(SIGUNGU_NAME,CITY_NAME) VALUES ("+value+")";

                int res = stmt.executeUpdate(query);

                if (res == 1){

                    System.out.println("성공");
                }


            }

        }catch (Exception e){
            System.out.println(e.getMessage());
        }finally {
            clean();
        }





    }


}
