package com.bit.backpackers.item;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Component;

import com.bit.backpackers.item.model.ItemDao;
import com.bit.backpackers.item.model.entity.NewItemVo;

@Component
public class Item {
	
	@Inject
	SqlSession sqlSession;
	
	public List<NewItemVo> getItemList() throws SQLException {
		return sqlSession.getMapper(ItemDao.class).selectAll();
	}
	
	public String getItemJson() throws SQLException {
		String itemJson = JSONValue.toJSONString(getItemList());
		return itemJson;
	}

}
