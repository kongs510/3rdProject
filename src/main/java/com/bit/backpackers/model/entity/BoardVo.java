package com.bit.backpackers.model.entity;

import java.sql.Date;
import java.sql.Time;







public class BoardVo {

	private int board_no,board_hits,board_type,board_delete,board_views;

 private String board_subject,user_ID,board_content;
 
 private Date board_date;

 private Time board_maketime;

 
 
 public BoardVo() {
	// TODO Auto-generated constructor stub
}
public int getBoard_no() {
	return board_no;
}

public void setBoard_no(int board_no) {
	this.board_no = board_no;
}

public int getBoard_hits() {
	return board_hits;
}

public void setBoard_hits(int board_hits) {
	this.board_hits = board_hits;
}

public int getBoard_type() {
	return board_type;
}

public void setBoard_type(int board_type) {
	this.board_type = board_type;
}

public int getBoard_delete() {
	return board_delete;
}

public void setBoard_delete(int board_delete) {
	this.board_delete = board_delete;
}

public int getBoard_views() {
	return board_views;
}

public void setBoard_views(int board_views) {
	this.board_views = board_views;
}

public String getBoard_subject() {
	return board_subject;
}

public void setBoard_subject(String board_subject) {
	this.board_subject = board_subject;
}

public String getUser_ID() {
	return user_ID;
}

public void setUser_ID(String user_ID) {
	this.user_ID = user_ID;
}

public String getBoard_content() {
	return board_content;
}

public void setBoard_content(String board_content) {
	this.board_content = board_content;
}

public Date getBoard_date() {
	return board_date;
}

public void setBoard_date(Date board_date) {
	this.board_date = board_date;
}

public Time getBoard_maketime() {
	return board_maketime;
}

public void setBoard_maketime(Time board_maketime) {
	this.board_maketime = board_maketime;
}

@Override
public int hashCode() {
	final int prime = 31;
	int result = 1;
	result = prime * result + ((board_content == null) ? 0 : board_content.hashCode());
	result = prime * result + board_delete;
	result = prime * result + board_hits;
	result = prime * result + board_no;
	result = prime * result + ((board_subject == null) ? 0 : board_subject.hashCode());
	result = prime * result + board_type;
	result = prime * result + board_views;
	result = prime * result + ((user_ID == null) ? 0 : user_ID.hashCode());
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
	BoardVo other = (BoardVo) obj;
	if (board_content == null) {
		if (other.board_content != null)
			return false;
	} else if (!board_content.equals(other.board_content))
		return false;
	if (board_delete != other.board_delete)
		return false;
	if (board_hits != other.board_hits)
		return false;
	if (board_no != other.board_no)
		return false;
	if (board_subject == null) {
		if (other.board_subject != null)
			return false;
	} else if (!board_subject.equals(other.board_subject))
		return false;
	if (board_type != other.board_type)
		return false;
	if (board_views != other.board_views)
		return false;
	if (user_ID == null) {
		if (other.user_ID != null)
			return false;
	} else if (!user_ID.equals(other.user_ID))
		return false;
	return true;
}

@Override
public String toString() {
	return "BoardVO [board_no=" + board_no + ", board_hits=" + board_hits + ", board_type=" + board_type
			+ ", board_delete=" + board_delete + ", board_views=" + board_views + ", board_subject=" + board_subject
			+ ", user_ID=" + user_ID + ", board_content=" + board_content + ", board_date=" + board_date
			+ ", board_maketime=" + board_maketime + "]";
}

public BoardVo(int board_no, int board_hits, int board_type, int board_delete, int board_views, String board_subject,
		String user_ID, String board_content, Date board_date, Time board_maketime) {
	super();
	this.board_no = board_no;
	this.board_hits = board_hits;
	this.board_type = board_type;
	this.board_delete = board_delete;
	this.board_views = board_views;
	this.board_subject = board_subject;
	this.user_ID = user_ID;
	this.board_content = board_content;
	this.board_date = board_date;
	this.board_maketime = board_maketime;
}
 
 
}
