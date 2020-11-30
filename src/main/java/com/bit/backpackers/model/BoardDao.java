package com.bit.backpackers.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.bit.backpackers.model.entity.BoardVo;
import com.bit.backpackers.model.entity.ReplyVo;
import com.bit.backpackers.util.Criteria;

public interface BoardDao {

	 List<BoardVo> boardInfo() throws SQLException;
	 void insertboard(BoardVo info)throws SQLException;
	 BoardVo boardDetail(int board_no)throws SQLException;
	 int updateboard(BoardVo info)throws SQLException;
	 int deleteboard(int board_no)throws SQLException;
	 @SuppressWarnings("unchecked")
	 List<Map<String, Object>> selectBoardList(Criteria cri);
	 int countBoardList();
		  List<BoardVo>searchBoard(int start,int end,String searchOption,String keyword) throws Exception;
	 int countBoardContent(String searchOption, String keyword);
	void increaseViewcnt(int board_no)throws SQLException;
	List<BoardVo> listmyboard(String user_ID)throws SQLException;
}
 