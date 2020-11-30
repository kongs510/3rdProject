package com.bit.backpackers.category;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Component;

import com.bit.backpackers.category.model.CategoryDao;
import com.bit.backpackers.category.model.entity.MainCategoryVo;
import com.bit.backpackers.category.model.entity.SubCategoryVo;

@Component
public class Category {

	@Inject
	SqlSession sqlSession;
	
	public Map<String, MainCategoryVo> mainCategoryListToMap(List<MainCategoryVo> list) {
		Map<String, MainCategoryVo> mainCategoryMap = new HashMap<String, MainCategoryVo>();
		for(MainCategoryVo mainCategory : list) {
			mainCategoryMap.put(mainCategory.getMainCategoryCode(), mainCategory);
		}
		return mainCategoryMap;
	}
	
	public Map<String, SubCategoryVo> subCategoryListToMap(List<SubCategoryVo> list) {
		Map<String, SubCategoryVo> subCategoryMap = new HashMap<String, SubCategoryVo>();
		for(SubCategoryVo subCategory : list) {
			subCategoryMap.put(subCategory.getSubCategoryCode(), subCategory);
		}
		return subCategoryMap;
	}
	
	public Map<String, List<SubCategoryVo>> subCategoryByMainCategoryListToMap(List<SubCategoryVo> list) {
		Map<String, List<SubCategoryVo>> subCategoryMap = new HashMap<String, List<SubCategoryVo>>();
		List<SubCategoryVo> tempList = new ArrayList<SubCategoryVo>();
		String now = "";
		for(SubCategoryVo subCategory : list) {
			now = subCategory.getMainCategoryCode();
			if(subCategoryMap.containsKey(now)) {
				tempList = (List<SubCategoryVo>) subCategoryMap.get(now);
				tempList.add(subCategory);
				subCategoryMap.put(now, tempList);
			} else {
				tempList = new ArrayList<SubCategoryVo>();
				tempList.add(subCategory);
				subCategoryMap.put(now, tempList);
			}
		}
		return subCategoryMap;
	}
	
	public List<MainCategoryVo> getMainCategoryList() throws SQLException {
		return sqlSession.getMapper(CategoryDao.class).selectMainCategory();
	}
	
	public List<SubCategoryVo> getSubCategoryList() throws SQLException {
		return sqlSession.getMapper(CategoryDao.class).selectSubCategory();
	}
	
	public Map<String, MainCategoryVo> getMainCategoryMap() throws SQLException {
		return mainCategoryListToMap(getMainCategoryList());
	}
	
	public Map<String, SubCategoryVo> getSubCategoryMap() throws SQLException {
		return subCategoryListToMap(getSubCategoryList());
	}
	
	public Map<String, List<SubCategoryVo>> getSubCategoryByMainCategoryMap() throws SQLException {
		return subCategoryByMainCategoryListToMap(getSubCategoryList());
	}
	
	public String getSubCategoryByMainCategoryJsonFromMap() throws SQLException {
		String subCategoryJson = JSONValue.toJSONString(getSubCategoryByMainCategoryMap());
		System.out.println(subCategoryJson);
		return subCategoryJson;
	}
	
	public List<SubCategoryVo> findSubCategoryByMainCategoryCode(String mainCategoryCode) throws SQLException {
		return sqlSession.getMapper(CategoryDao.class).findSubCategoryByMainCategoryCode(mainCategoryCode);
	}
	
}
