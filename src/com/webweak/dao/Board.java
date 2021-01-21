package com.webweak.dao;

import com.webweak.Mapping.BoardMapper;
import com.webweak.vo.*;

import java.io.*;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class Board extends ConnectionDB implements BoardMapper {

    @Override
    public int romSize() throws SQLException {
        String query = "select count(*) as rom  from board";

        try {
            rs = dbResult(query);

            if (rs.next()) {
                return Integer.parseInt(rs.getString("rom"));
            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            clean();
        }

        return 0;
    }


    @Override
    public List<BoardVO> list(BoardOptionsVO vo) throws SQLException {
        String[] optionType = vo.getSearchType().split(",");

        String queryName = "BD_NO,BD_RNO,BD_TITLE,BD_ID,BD_CONTENT,BD_FIRS_DATE,BD_COUNT,BD_FILE_NAME";
        String querySearch = "(" + optionType[0] + " || " + optionType[1] + ") LIKE '%" + vo.getSearchText() + "%'";
        String query = "SELECT * FROM (select rownum as rom ," + queryName + " from board where BD_FIRS_DATE >= '" + vo.getStartDate() + "' and BD_FIRS_DATE <= '" + vo.getEndDate() + "' and " + querySearch + " order by " + vo.getReverse() + " " + vo.getType() + " ) a where a.rom >=" + vo.getStart() + " and a.rom <= " + vo.getEnd();

        List<BoardVO> list = null;

        try{
            list = new ArrayList<>();
            rs = dbResult(query);

            while (rs.next()){
                BoardVO boardVO = new BoardVO();
                boardVO.setBdRno(rs.getString("rom"));
                boardVO.setBdNo(rs.getString("BD_NO"));
                boardVO.setBdRno(rs.getString("BD_RNO"));
                boardVO.setBdTitle(rs.getString("BD_TITLE"));
                boardVO.setBdUserId(rs.getString("BD_ID"));
                boardVO.setBdContent(rs.getString("BD_CONTENT"));
                boardVO.setBdFirstDate(rs.getString("BD_FIRS_DATE"));
                boardVO.setBdCount(rs.getString("BD_COUNT"));
                boardVO.setBdFileName(rs.getString("BD_FILE_NAME"));
                list.add(boardVO);
            }
            return list;


        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        return list;

    }

    @Override
    public int write(BoardVO boardVO) throws SQLException {
        String values = "BOARD_SEQ.NEXTVAL" + ",'" + boardVO.getBdTitle() + "','" + boardVO.getBdUserId() + "','" + boardVO.getBdContent() + "','"+boardVO.getBdFileName()+"'";
        String query = "INSERT INTO board(BD_NO,BD_TITLE,BD_ID,BD_CONTENT,BD_FILE_NAME) VALUES(" + values + ")";

        try {
            int res = stmt.executeUpdate(query);
            if (res == 1) {
                return res;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            clean();
        }
        return 0;
    }

    @Override
    public BoardVO choice(String idx) throws SQLException {
        String query = "SELECT * FROM board WHERE BD_NO =" + idx;

        BoardVO vo = null;
        try {
            vo = new BoardVO();
            rs = dbResult(query);
            if (rs.next()) {
                vo.setBdNo(rs.getString("BD_NO"));
                vo.setBdRno(rs.getString("BD_RNO"));
                vo.setBdTitle(rs.getString("BD_TITLE"));
                vo.setBdUserId(rs.getString("BD_ID"));
                vo.setBdContent(rs.getString("BD_CONTENT"));
                vo.setBdFirstDate(rs.getString("BD_FIRS_DATE"));
                vo.setBdCount(rs.getString("BD_COUNT"));
                vo.setBdFileName(rs.getString("BD_FILE_NAME"));

                count(rs.getString("BD_NO"), rs.getString("BD_COUNT"));

                return vo;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            clean();
        }
        return vo;
    }

    @Override
    public void count(String idx, String count) throws SQLException {

        int cnt = Integer.parseInt(count) + 1;

        String query = "UPDATE BOARD SET BD_COUNT =" + cnt + " WHERE BD_NO=" + idx;

        try {
            stmt.executeUpdate(query);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            clean();
        }


    }

    @Override
    public List<BoardVO> search(String date, String keyword, String text) {

        String sqlDate = "BD_FIRS_DATE <= to_char(SYSDATE-" + date + ",'yyyymmdd')";
        String sqlkeyword = keyword + " LIKE '%" + text + "%'";
        String query = "SELECT * FROM BOARD WHERE " + sqlDate + " AND " + sqlkeyword;


        try {
            rs = dbResult(query);

            if (rs.next()) {
                return getBoardVOS(query);
            }


        } catch (Exception e) {
            System.out.println("search : " + e.getMessage());
        }

        return null;
    }

    @Override
    public int delete(String idx) throws SQLException {
        String query = "DELETE FROM BOARD WHERE BD_NO =" + idx;
        try {
            int res = stmt.executeUpdate(query);
            if (res == 1) {
                return res;
            }
        } catch (Exception e) {
            System.out.println("delete : " + e.getMessage());
        } finally {
            clean();
        }

        return 0;
    }

    @Override
    public int update(BoardVO boardVO) throws SQLException {
        String querySet = "SET BD_TITLE = '" + boardVO.getBdTitle() + "'," + "BD_ID ='" + boardVO.getBdUserId() + "'," + "BD_CONTENT = '" + boardVO.getBdContent() + "'";
        String query = "UPDATE BOARD " + querySet + " WHERE BD_NO = " + boardVO.getBdNo();
        System.out.println(query);

        try {
            int res = stmt.executeUpdate(query);
            if (res == 1) {
                return res;
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            clean();
        }


        return 0;
    }

    @Override
    public int commentSize(String bdNo) throws SQLException {
        String query = "SELECT COUNT(*) as cm_size FROM TB_CM WHERE BD_NO = " + bdNo;
        try {
            rs = dbResult(query);
            if (rs.next()) {
                return Integer.parseInt(rs.getString("cm_size"));
            }

        } catch (Exception e) {
            System.out.println("commentSize : " + e.getMessage());
        } finally {
            clean();
        }

        return 0;
    }

    @Override
    public List<CommentVO> comment(String bdNo, int romS, int romE) throws SQLException {
        List<CommentVO> list = null;
        String query = "SELECT * FROM (SELECT rownum AS rom,CM_NO,CM_ID,CM_CONTENT,CM_FIRS_DATE,CM_MOOD,CM_MOOD_COUNT FROM tb_cm WHERE bd_no = " + bdNo + " ORDER BY cm_no DESC) a WHERE a.rom >=" + romS + " AND a.rom <=" + romE;
        try {
            list = new ArrayList<CommentVO>();
            rs = dbResult(query);
            while (rs.next()) {
                CommentVO vo = new CommentVO();
                vo.setCmNO(rs.getString("CM_NO"));
                vo.setCmUserId(rs.getString("CM_ID"));
                vo.setCmContent(rs.getString("CM_CONTENT"));
                vo.setCmFirstDate(rs.getString("CM_FIRS_DATE"));
                vo.setCmMood(rs.getString("CM_MOOD"));
                vo.setCmMoodCount(rs.getString("CM_MOOD_COUNT"));
                list.add(vo);
            }

            return list;
        } catch (Exception e) {
            System.out.println("comment : " + e.getMessage());
        } finally {
            clean();
        }
        return null;
    }

    @Override
    public int commentWrite(CommentVO commentVO) throws SQLException {
        String values = commentVO.getBdNo() + ",CM_SEQ.NEXTVAL" + ",'" + commentVO.getCmUserId() + "','" + commentVO.getCmContent() + "'";
        String query = "INSERT INTO TB_CM(BD_NO,CM_NO,CM_ID,CM_CONTENT) VALUES (" + values + ")";
        try {

            int res = stmt.executeUpdate(query);
            if (res == 1) {
                return res;
            }
        } catch (Exception e) {
            System.out.println("comment : " + e.getMessage());
        } finally {
            clean();
        }
        return 0;
    }

    @Override
    public int commentDelete(String bdNo, String cmNo, String userId) throws SQLException {
        String query = "DELETE FROM tb_cm WHERE bd_no = " + bdNo + " and cm_no = " + cmNo + " and cm_id = '" + userId + "'";
        try {
            int res = stmt.executeUpdate(query);
            if (res == 1) {
                return res;
            }
        } catch (Exception e) {
            System.out.println("commentDelete : " + e.getMessage());
        } finally {
            clean();
        }
        return 0;
    }

    @Override
    public List<ReplyVO> replyList(String bdNo, String cmNo) throws SQLException {
        String query = "select * from (select rownum as rn,RL_ID,RL_CONTENT,RL_FIRS_DATE from tb_rl where bd_no = " + bdNo + " and cm_no = " + cmNo + " order by RL_NO desc)";

        List<ReplyVO> list = null;
        try {
            list = new ArrayList<ReplyVO>();
            rs = dbResult(query);
            while (rs.next()) {
                ReplyVO vo = new ReplyVO();
                vo.setRlUserId(rs.getString("RL_ID"));
                vo.setRlContent(rs.getString("RL_CONTENT"));
                vo.setRlFirstDate(rs.getString("RL_FIRS_DATE"));
                list.add(vo);
            }
        } catch (Exception e) {
            System.out.println("replyList : " + e.getMessage());
        } finally {
            clean();
        }

        return list;
    }

    @Override
    public int replyWrite(ReplyVO replyVO) throws SQLException {
        String values = replyVO.getBdNo() + "," + replyVO.getCmNo() + ",RL_SEQ.NEXTVAL" + ",'" + replyVO.getRlUserId() + "','" + replyVO.getRlContent() + "'";
        String query = "INSERT INTO tb_rl(BD_NO,CM_NO,RL_NO,RL_ID,RL_CONTENT) VALUES (" + values + ")";
        try {
            int res = stmt.executeUpdate(query);
            if (res == 1) {
                return res;
            }
        } catch (Exception e) {
            System.out.println("replyWrite : " + e.getMessage());
        } finally {
            clean();
        }

        return 0;
    }

    // databaes 데이터 불러오기
    private List<BoardVO> getBoardVOS(String query) throws SQLException {
        List<BoardVO> list = null;
        list = new ArrayList<>();

        try {
            rs = dbResult(query);


            while (rs.next()) {
                BoardVO vo = new BoardVO();
                // 룸 개수
                vo.setBdRno(rs.getString("rom"));
                vo.setBdNo(rs.getString("BD_NO"));
                vo.setBdRno(rs.getString("BD_RNO"));
                vo.setBdTitle(rs.getString("BD_TITLE"));
                vo.setBdUserId(rs.getString("BD_ID"));
                vo.setBdContent(rs.getString("BD_CONTENT"));
                vo.setBdFirstDate(rs.getString("BD_FIRS_DATE"));
                vo.setBdCount(rs.getString("BD_COUNT"));
                vo.setBdFileName(rs.getString("BD_FILE_NAME"));
                list.add(vo);
            }
            return list;

        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            clean();
        }
        return null;
    }

    // 날짜
    public String searchDate(int date) {
        SimpleDateFormat searchDate = new SimpleDateFormat("yyyy-MM-dd");
        Calendar searchCalender = Calendar.getInstance();
        searchCalender.add(Calendar.DATE, -date);

        return searchDate.format(searchCalender.getTime());
    }

    public String fileUpload(String path,String fileName){

        File originalFile = null;
        File changeFile = null;
        int randomName = new Random().nextInt();
        try{
            originalFile = new File(path+"/"+fileName);
            String date = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
            if (originalFile.exists()){

                // 최종 파일 변경 이름
                String changeFileName = path+"/"+date+"_"+randomName+"_"+fileName;
                changeFile = new File(changeFileName);
                originalFile.renameTo(changeFile);


                return changeFile.getName();
            }
        }catch(Exception e){
            System.out.println("fileUpload : "+e.getMessage());
        }
        return "";
    }
}


