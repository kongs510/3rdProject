package com.bit.backpackers.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.bit.backpackers.model.entity.BoardVo;
import com.bit.backpackers.model.entity.ReplyVo;
import com.bit.backpackers.util.Criteria;



@Repository
public class BoardDaoImpl implements BoardDao {

	@Inject
	  SqlSession sqlSession;

	@Override 
	public List<BoardVo> searchBoard(int start, int end,String searchOption, String keyword)  {
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("searchOption", searchOption);
		map.put("keyword",keyword);
		
		map.put("start",start);
		map.put("end",end);
		return sqlSession.selectList("com.bit.backpackers.model.BoardDao.searchBoard", map);
	}

	@Override
	public List<BoardVo> boardInfo() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertboard(BoardVo info) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVo boardDetail(int board_no) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateboard(BoardVo info) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteboard(int board_no) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countBoardList() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int countBoardContent(String searchOption, String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void increaseViewcnt(int board_no) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BoardVo> listmyboard(String user_ID) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	
	






	


	

}
