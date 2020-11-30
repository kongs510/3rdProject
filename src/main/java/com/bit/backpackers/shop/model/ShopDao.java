package com.bit.backpackers.shop.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.backpackers.shop.model.entity.ReviewVo;
import com.bit.backpackers.shop.model.entity.ShopVo;

public interface ShopDao {

	List<ShopVo> selectShopList() throws SQLException;
	List<ShopVo> selectShopList(@Param("mainCategoryName") String mainCategoryName) throws SQLException;
	List<ShopVo> selectShopList(@Param("mainCategoryName") String mainCategoryName, @Param("subCategoryName") String subCategoryName) throws SQLException;
	ShopVo selectShop(String shopCode) throws SQLException;
	ShopVo selectShopByProductCode(String productCode) throws SQLException;
	// 한줄평 리스트
	List<ReviewVo>  reviewList(String shopCode)throws SQLException;
	// 한줄평 등록
	void registReview(ReviewVo review)throws SQLException;
	// 한줄평 삭제
	int deleteReview(int ReviewNo) throws SQLException;
	// 한줄평 수정
	int updateReview(ReviewVo review) throws SQLException;
}
