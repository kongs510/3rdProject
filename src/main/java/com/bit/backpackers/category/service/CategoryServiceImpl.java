    package com.bit.backpackers.category.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.category.model.CategoryDao;
import com.bit.backpackers.category.model.entity.CategoryVo;
import com.bit.backpackers.shop.model.ShopDao;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Inject
	SqlSession sqlSession;
	
	
	@Override
	public void getCategoryList(Model model) throws SQLException {
		List<CategoryVo> list = sqlSession.getMapper(CategoryDao.class).selectCategoryListByMainCategoryCode();
		model.addAttribute("categoryList", list);
	}

	@Override
	public void checkCategory(String mainCategoryName) throws SQLException {
		String mainCategoryCode = sqlSession.getMapper(CategoryDao.class).findMainCategory(mainCategoryName);
		if(mainCategoryCode == null) {
			throw new NullPointerException("No matched main-category");
		}
	}

	@Override
	public void checkCategory(String mainCategoryName, String subCategoryName) throws SQLException {
		String mainCategoryCode = sqlSession.getMapper(CategoryDao.class).findMainCategory(mainCategoryName);
		String subCategoryCode = sqlSession.getMapper(CategoryDao.class).findSubCategory(subCategoryName);
		if(mainCategoryCode == null || subCategoryCode == null) {
			throw new NullPointerException("No matched main-category");
		}
	}
	
	@Override
	public void getCategoryNow(Model model, String mainCategoryName) throws SQLException {
		model.addAttribute("mainCategoryName", mainCategoryName);
	}
	
	@Override
	public void getCategoryNow(Model model, String mainCategoryName, String subCategoryName) throws SQLException {
		model.addAttribute("mainCategoryName", mainCategoryName);
		model.addAttribute("subCategoryName", subCategoryName);
	}
	
}
