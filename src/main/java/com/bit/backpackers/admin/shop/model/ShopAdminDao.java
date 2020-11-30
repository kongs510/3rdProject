package com.bit.backpackers.admin.shop.model;

import java.sql.SQLException;
import java.util.List;
import com.bit.backpackers.admin.shop.model.entity.ShopVo;

public interface ShopAdminDao {
	
	List<ShopVo> selectAll() throws SQLException;
	ShopVo selectOne(String shopCode) throws SQLException;
	int deleteOne(String shopCode) throws SQLException;
	int updateOne(ShopVo shop) throws SQLException;

}
