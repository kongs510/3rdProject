package com.bit.backpackers.product;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.bit.backpackers.image.model.entity.ImageVo;
import com.bit.backpackers.option.model.OptionDao;
import com.bit.backpackers.option.model.entity.OptionVo;
import com.bit.backpackers.order.Order;
import com.bit.backpackers.product.model.ProductDao;
import com.bit.backpackers.product.model.entity.NewProductItemVo;
import com.bit.backpackers.product.model.entity.ProductVo;
import com.bit.backpackers.shop.Shop;
import com.bit.backpackers.shop.model.entity.ShopVo;

@Component
public class Product {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Inject
	SqlSession sqlSession;
	@Inject
	Shop shopSupport;
	@Inject
	Order orderSupport;
	
	public Product() {
		log.info("Component : " + this.getClass().getName());
	}
	
	public ProductVo nameFirstOption(ProductVo product) {
		OptionVo option = sqlSession.getMapper(OptionDao.class).selectOptionFilteredBy(product.getFirstOptionCode());
		product.setFirstOptionGroupName(option.getOptionGroupName());
		product.setFirstOptionName(option.getOptionName());
		return product;
	}
	
	public List<OptionVo> secondOptionListByProduct(ProductVo product) {
		return sqlSession.getMapper(OptionDao.class).selectOptionsByProduct(product.getProductCode());
	}
	
	public ImageVo getTitleImageByProductCode(String productCode) throws SQLException {
		return sqlSession.getMapper(ProductDao.class).selectTitleImageFilteredBy(productCode);
	}
	
	public void putTitleImageByProductListIntoImageMap(Map<String, ImageVo> imageMap, List<ProductVo> productList) throws SQLException {
		for(ProductVo product : productList) {
			ImageVo image = getTitleImageByProductCode(product.getProductCode());
			if(image == null) continue;
			imageMap.put(product.getProductCode(), image);
		}
	}
	
	public List<ImageVo> getTitleImageList(List<? extends ProductVo> list) throws SQLException {
		List<ImageVo> titleImageList = new ArrayList<ImageVo>();
		for(ProductVo product : list) {
			titleImageList.add(getTitleImageByProductCode(product.getProductCode()));
		}
		return titleImageList;
	}
	
	public List<ShopVo> getShopList(List<? extends ProductVo> list) throws SQLException {
		List<ShopVo> orderedProductShopList = new ArrayList<ShopVo>();
		for(ProductVo product : list) {
			orderedProductShopList.add(shopSupport.getShopFilteredBy(product.getProductCode()));
		}
		return orderedProductShopList;
	}
	
	public List<ImageVo> getImages(ProductVo product) throws SQLException {
		return sqlSession.getMapper(ProductDao.class).selectImageFilteredBy(product.getProductCode());
	}
	
	public Map<String, List<NewProductItemVo>> getProductItemMapByShopCode(String shopCode) throws SQLException {
		List<NewProductItemVo> productList = sqlSession.getMapper(ProductDao.class).selectProductItemByShopCode(shopCode);
		Map<String, List<NewProductItemVo>> productItemMap = new HashMap<String, List<NewProductItemVo>>();
		List<NewProductItemVo> tempList = new ArrayList<NewProductItemVo>();
		String now = "";
		for(NewProductItemVo productItem : productList) {
			now = productItem.getProductCode();
			if(productItemMap.containsKey(now)) {
				tempList = (List<NewProductItemVo>) productItemMap.get(now);
				tempList.add(productItem);
				productItemMap.put(now, tempList);
			} else {
				tempList = new ArrayList<NewProductItemVo>();
				tempList.add(productItem);
				productItemMap.put(now, tempList);
			}
		}
		return productItemMap;
	}

}
