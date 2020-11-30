package com.bit.backpackers.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.bit.backpackers.item.model.entity.ItemVo;
import com.bit.backpackers.model.entity.brandVo;
import com.bit.backpackers.model.entity.main_categoryVo;
import com.bit.backpackers.model.entity.option_groupVo;
import com.bit.backpackers.model.entity.option_tableVo;
import com.bit.backpackers.model.entity.sub_categoryVo;
import com.bit.backpackers.util.Criteria;

public interface AdminDao {

	
	List<main_categoryVo> listItemCode() throws SQLException;
	List<sub_categoryVo>	listItemCode2() throws SQLException;
	List<brandVo>	listItemCode3() throws SQLException;
	List<option_tableVo> listItemCode4() throws SQLException;
	List<option_groupVo> listItemCode5() throws SQLException;
	void insertproduct(ItemVo item) throws SQLException;
	 List<Map<String, Object>>  deletelist(Criteria cri);
	 int countBoardList();
	 int deleteproduct(int itemId)throws SQLException;
	 ItemVo productdetail(int itemId)throws SQLException;
	 int updateproduct(ItemVo item)throws SQLException;
}
