package com.bit.backpackers.product.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.image.model.entity.ImageVo;
import com.bit.backpackers.product.model.entity.NewProductItemVo;
import com.bit.backpackers.product.model.entity.NewProductVo;
import com.bit.backpackers.product.model.entity.ProductVo;

public interface ProductDao {

	ImageVo selectTitleImageFilteredBy(String productCode) throws SQLException;
	List<ImageVo> selectImageFilteredBy(String productCode) throws SQLException;
	List<ProductVo> selectByShopCode(String shopCode) throws SQLException;
	List<NewProductVo> selectProductByShopCode(String shopCode) throws SQLException;
	List<NewProductItemVo> selectProductItemByProductCode(String productCode) throws SQLException;
	List<NewProductItemVo> selectProductItemByShopCode(String shopCode) throws SQLException;
	
}
