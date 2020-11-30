package com.bit.backpackers.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;


import com.bit.backpackers.model.entity.BoardVo;
import com.bit.backpackers.model.entity.ReplyVo;
import com.bit.backpackers.shop.model.entity.ShopVo;
import com.bit.backpackers.util.Criteria;


public interface BoardService {

	
	void listService(Model model) throws SQLException;
	void insertService(BoardVo info)throws SQLException;
	void ditailService(Model model,int board_no)throws SQLException;
	void updateService(BoardVo info)throws SQLException;
	void deleteService(int board_no)throws SQLException;
	List<Map<String, Object>> selectBoardList(Criteria cri);
	int countBoardListTotal();
	//	searchservice
    List<BoardVo> searchBoard(int start,int end,String searchOption,String keyword)throws Exception;
	 int countBoardContent(String searchOption,String keyword);
	 void increaseViewcnt(int board_no)throws SQLException;
	void listmyboardService(Model model,String user_ID)throws SQLException;
	 
}
