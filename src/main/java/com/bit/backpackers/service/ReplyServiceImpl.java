package com.bit.backpackers.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.model.ReplyDao;
import com.bit.backpackers.model.entity.ReplyVo;


@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	SqlSession sqlSession;


	@Override
	public void insertReply(ReplyVo reply) throws SQLException {
		ReplyDao dao=sqlSession.getMapper(ReplyDao.class);
		dao.insertReply(reply);

	}

	@Override
	public void deleteReply(Integer reply_no) throws SQLException {
		ReplyDao dao=sqlSession.getMapper(ReplyDao.class);
		dao.deleteReply(reply_no);

	}

	@Override
	public List<ReplyVo> Replylist(int board_no) throws SQLException {
		ReplyDao dao=sqlSession.getMapper(ReplyDao.class);
		return dao.Replylist(board_no);
	}

	@Override
	public void updateReply(ReplyVo replyinfo) throws SQLException {
		ReplyDao dao=sqlSession.getMapper(ReplyDao.class);
        dao.updateReply(replyinfo);
		
	}



}
