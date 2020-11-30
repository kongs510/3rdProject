package com.bit.backpackers.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.backpackers.model.entity.ReplyVo;

public interface ReplyService {

	List<ReplyVo>Replylist(int board_no) throws SQLException;
	void insertReply(ReplyVo reply) throws SQLException;
	void updateReply(ReplyVo replyinfo)throws SQLException;
	 void deleteReply(Integer reply_no)throws SQLException;
	
}
