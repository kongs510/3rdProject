package com.bit.backpackers.option;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Component;

import com.bit.backpackers.option.model.OptionDao;
import com.bit.backpackers.option.model.entity.NewOptionGroupVo;
import com.bit.backpackers.option.model.entity.NewOptionVo;

@Component
public class Option {
	
	@Inject
	SqlSession sqlSession;

	public Map<String, NewOptionGroupVo> optionGroupListToMap(List<NewOptionGroupVo> list) {
		Map<String, NewOptionGroupVo> optionGroupMap = new HashMap<String, NewOptionGroupVo>();
		for(NewOptionGroupVo optionGroup : list) {
			optionGroupMap.put(optionGroup.getOptionGroupCode(), optionGroup);
		}
		return optionGroupMap;
	}
	
	public Map<String, NewOptionVo> optionListToMap(List<NewOptionVo> list) {
		Map<String, NewOptionVo> optionMap = new HashMap<String, NewOptionVo>();
		for(NewOptionVo option : list) {
			optionMap.put(option.getOptionCode(), option);
		}
		return optionMap;
	}
	
	public Map<String, List<NewOptionVo>> optionByOptionGroupListToMap(List<NewOptionVo> list) {
		Map<String, List<NewOptionVo>> optionMap = new HashMap<String, List<NewOptionVo>>();
		List<NewOptionVo> tempList = new ArrayList<NewOptionVo>();
		String now = "";
		for(NewOptionVo option : list) {
			now = option.getOptionGroupCode();
			if(optionMap.containsKey(now)) {
				tempList = (List<NewOptionVo>) optionMap.get(now);
				tempList.add(option);
				optionMap.put(now, tempList);
			} else {
				tempList = new ArrayList<NewOptionVo>();
				tempList.add(option);
				optionMap.put(now, tempList);
			}
		}
		return optionMap;
	}
	
	public List<NewOptionGroupVo> getOptionGroupList() throws SQLException {
		return sqlSession.getMapper(OptionDao.class).selectOptionGroup();
	}
	
	public List<NewOptionVo> getOptionList() throws SQLException {
		return sqlSession.getMapper(OptionDao.class).selectOption();
	}
	
	public Map<String, NewOptionGroupVo> getOptionGroupMap() throws SQLException {
		return optionGroupListToMap(getOptionGroupList());
	}
	
	public Map<String, NewOptionVo> getOptionMap() throws SQLException {
		return optionListToMap(getOptionList());
	}
	
	public Map<String, List<NewOptionVo>> getOptionByOptionGroupMap() throws SQLException {
		return optionByOptionGroupListToMap(getOptionList());
	}
	
	public String getOptionByOptionGroupJsonFromMap() throws SQLException {
		String optionJson = JSONValue.toJSONString(getOptionByOptionGroupMap());
		System.out.println(optionJson);
		return optionJson;
	}
	
	public List<NewOptionVo> findOptionByOptionGroupCode(String optionGroupCode) throws SQLException {
		return sqlSession.getMapper(OptionDao.class).findOptionByOptionGroupCode(optionGroupCode);
	}
	

}
