package com.bit.backpackers.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.model.entity.ReplyVo;

public interface ReplyDao {

	
	List<ReplyVo>Replylist(int board_no) throws SQLException;
	 void insertReply(ReplyVo reply) throws SQLException;
	 int updateReply(ReplyVo replyinfo)throws SQLException;
	 int deleteReply(Integer reply_no)throws SQLException;	 
}
