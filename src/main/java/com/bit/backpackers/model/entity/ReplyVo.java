package com.bit.backpackers.model.entity;

import java.sql.Timestamp;

public class ReplyVo {

	private int reply_depth,reply_delete,board_no;
	private String reply_content,reply_id;
	private Timestamp reply_time;
	private Integer reply_no;
	public ReplyVo(){
		
		
	}


	public int getReply_no() {
		return reply_no;
	}


	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}


	public int getReply_depth() {
		return reply_depth;
	}


	public void setReply_depth(int reply_depth) {
		this.reply_depth = reply_depth;
	}


	public int getReply_delete() {
		return reply_delete;
	}


	public void setReply_delete(int reply_delete) {
		this.reply_delete = reply_delete;
	}


	public int getBoard_no() {
		return board_no;
	}


	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}


	public String getReply_content() {
		return reply_content;
	}


	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}


	public String getReply_id() {
		return reply_id;
	}


	public void setReply_id(String reply_id) {
		this.reply_id = reply_id;
	}


	public Timestamp getReply_time() {
		return reply_time;
	}


	public void setReply_time(Timestamp reply_time) {
		this.reply_time = reply_time;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + board_no;
		result = prime * result + ((reply_content == null) ? 0 : reply_content.hashCode());
		result = prime * result + reply_delete;
		result = prime * result + reply_depth;
		result = prime * result + ((reply_id == null) ? 0 : reply_id.hashCode());
		result = prime * result + reply_no;
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReplyVo other = (ReplyVo) obj;
		if (board_no != other.board_no)
			return false;
		if (reply_content == null) {
			if (other.reply_content != null)
				return false;
		} else if (!reply_content.equals(other.reply_content))
			return false;
		if (reply_delete != other.reply_delete)
			return false;
		if (reply_depth != other.reply_depth)
			return false;
		if (reply_id == null) {
			if (other.reply_id != null)
				return false;
		} else if (!reply_id.equals(other.reply_id))
			return false;
		if (reply_no != other.reply_no)
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "ReplyVo [reply_no=" + reply_no + ", reply_depth=" + reply_depth + ", reply_delete=" + reply_delete
				+ ", board_no=" + board_no + ", reply_content=" + reply_content + ", reply_id=" + reply_id
				+ ", reply_time=" + reply_time + "]";
	}


	public ReplyVo(int reply_no, int reply_depth, int reply_delete, int board_no, String reply_content, String reply_id,
			Timestamp reply_time) {
		super();
		this.reply_no = reply_no;
		this.reply_depth = reply_depth;
		this.reply_delete = reply_delete;
		this.board_no = board_no;
		this.reply_content = reply_content;
		this.reply_id = reply_id;
		this.reply_time = reply_time;
	}
	
	
	
	
}
