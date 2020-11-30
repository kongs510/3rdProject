package com.bit.backpackers.order.model;

import java.sql.SQLException;
import java.util.List;


import com.bit.backpackers.item.model.entity.ItemVo;
import com.bit.backpackers.order.model.entity.OrderedProductVo;
import com.bit.backpackers.product.model.entity.ProductVo;

public interface OrderedProductDao {

	List<ItemVo> selectOrderedItems() throws SQLException;
	List<OrderedProductVo> selectProductsFilteredBy(String orderCode) throws SQLException;
	
}
