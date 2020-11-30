package com.bit.backpackers.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.model.entity.BoardVo;
import com.bit.backpackers.model.entity.ReplyVo;
import com.bit.backpackers.util.Criteria;
import com.bit.backpackers.model.BoardDao;
@Service
public class BoardServiceImpl implements BoardService{
 
	@Inject
  SqlSession sqlSession;
	@Inject
	BoardDao boardDao;
	
	@Override
	public void listService(Model model) throws SQLException {
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		model.addAttribute("board",dao.boardInfo());
	}

	@Override
	public void insertService(BoardVo info) throws SQLException {
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.insertboard(info);
		
	}

	@Override
	public void ditailService(Model model, int board_no) throws SQLException {
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		model.addAttribute("boardDitail",dao.boardDetail(board_no));
	}

	@Override
	public void updateService(BoardVo info) throws SQLException {
       BoardDao dao=sqlSession.getMapper(BoardDao.class);
       dao.updateboard(info);
	}

	@Override
	public void deleteService(int board_no) throws SQLException {
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		dao.deleteboard(board_no);
	}

	@Override
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		return dao.selectBoardList(cri);

	}

	@Override
	public int countBoardListTotal() {
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		return dao.countBoardList();
		
	}

	
	
	
	@Override  
	public List<BoardVo> searchBoard(int start ,int end,String searchOption, String keyword)throws Exception {
		
		
		return boardDao.searchBoard(start,end,searchOption, keyword);
	}

	@Override
	public int countBoardContent(String searchOption, String keyword) {
		Map<String,String> map=new HashMap<String,String>();
		map.put("searchOption", searchOption);
		map.put("keyword",keyword);
		return sqlSession.selectOne("com.bit.backpackers.model.BoardDao.countBoardContent",map);
		
	}

	@Override
	public void increaseViewcnt(int board_no) throws SQLException {
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
	dao.increaseViewcnt(board_no);
	}

	@Override
	public void listmyboardService(Model model, String user_ID) throws SQLException {
		BoardDao dao=sqlSession.getMapper(BoardDao.class);
		model.addAttribute("boardmylist",dao.listmyboard(user_ID));
		
	}

	

	


	




}
