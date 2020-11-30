package com.bit.backpackers.item.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.item.model.entity.NewItemVo;

public interface ItemDao {

	List<NewItemVo> selectAll() throws SQLException;
	int countItemPage() throws SQLException;
	
}
