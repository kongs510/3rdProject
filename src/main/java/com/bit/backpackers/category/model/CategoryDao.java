package com.bit.backpackers.category.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bit.backpackers.category.model.entity.CategoryVo;
import com.bit.backpackers.category.model.entity.MainCategoryVo;
import com.bit.backpackers.category.model.entity.SubCategoryVo;

public interface CategoryDao {

	List<CategoryVo> selectCategoryListByMainCategoryCode() throws SQLException;
	String findMainCategory(String mainCategory) throws SQLException;
	String findSubCategory(String subCategory) throws SQLException;
	List<SubCategoryVo> findSubCategoryByMainCategoryCode(String mainCategoryCode) throws SQLException;
	List<MainCategoryVo> selectMainCategory() throws SQLException;
	List<SubCategoryVo> selectSubCategory() throws SQLException;
	
}
