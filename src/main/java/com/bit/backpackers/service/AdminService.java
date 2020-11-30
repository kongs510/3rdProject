package com.bit.backpackers.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.bit.backpackers.item.model.entity.ItemVo;
import com.bit.backpackers.model.entity.brandVo;
import com.bit.backpackers.model.entity.main_categoryVo;
import com.bit.backpackers.model.entity.option_tableVo;
import com.bit.backpackers.model.entity.sub_categoryVo;
import com.bit.backpackers.util.Criteria;




public interface AdminService {

	
	
	void list(Model model) throws SQLException;
	void list2(Model model) throws SQLException;
	void list3(Model model) throws SQLException;
	void list4(Model model) throws SQLException;
	void list5(Model model) throws SQLException;
	void insertproduct(ItemVo item) throws SQLException;
	List<Map<String, Object>>  deletelist(Criteria cri);
	int countBoardListTotal();
	void deleteproduct(int itemId)throws SQLException;
	void productdetail(Model model, int itemId)throws SQLException;
	void updateproduct(ItemVo item)throws SQLException;
	
}
