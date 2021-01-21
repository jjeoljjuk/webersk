package com.webweak.Mapping;

import com.webweak.vo.BoardOptionsVO;
import com.webweak.vo.BoardVO;
import com.webweak.vo.CommentVO;
import com.webweak.vo.ReplyVO;


import java.sql.SQLException;
import java.util.List;

public interface BoardMapper {


    // 게시판 size
    public int romSize() throws SQLException;
    // 게시판 정보
    public List<BoardVO> list(BoardOptionsVO vo) throws SQLException;
    // 게시판 글쓰기
    public int write(BoardVO boardVO) throws SQLException;
    // 게시판 상세보기
    public BoardVO choice(String idx) throws SQLException;
    // 게시판 조회수
    public void count(String idx,String count) throws Exception;
    // 게시글 검색
    public List<BoardVO>search(String date,String keyword,String text);
    // 게시글 삭제
    public int delete(String idx) throws SQLException;
    // 게시글 수정
    public int update(BoardVO boardVO) throws SQLException;

    // 댓글 Size
    public int commentSize(String bdNo) throws SQLException;
    // 댓글 리스트
    public List<CommentVO> comment(String bdNo,int romS,int romE) throws SQLException;
    // 댓글 작성
    public int commentWrite(CommentVO commentVO) throws SQLException;
    // 댓글 삭제
    public int commentDelete(String bdNo,String cmNo,String userId) throws SQLException;
    // 답글 리스트
    public List<ReplyVO> replyList(String bdNo,String cmNo) throws SQLException;
    // 답글 작성
    public int replyWrite(ReplyVO replyVO) throws SQLException;


}
