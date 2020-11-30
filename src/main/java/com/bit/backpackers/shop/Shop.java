package com.bit.backpackers.shop;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.bit.backpackers.product.model.entity.ProductVo;
import com.bit.backpackers.shop.model.ShopDao;
import com.bit.backpackers.shop.model.entity.ShopVo;

@Component
public class Shop {

	@Inject
	SqlSession sqlSession;
	
	public ShopVo getShopFilteredBy(String productCode) throws SQLException {
		return sqlSession.getMapper(ShopDao.class).selectShopByProductCode(productCode);
	}
}
