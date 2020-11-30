package com.bit.backpackers.option.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.option.model.entity.NewOptionGroupVo;
import com.bit.backpackers.option.model.entity.NewOptionVo;
import com.bit.backpackers.option.model.entity.OptionVo;

public interface OptionDao {
	
	public OptionVo selectOptionFilteredBy(String optionCode);
	public List<OptionVo> selectOptionsByProduct(String productCode);
	List<NewOptionVo> findOptionByOptionGroupCode(String optionGroupCode) throws SQLException;
	List<NewOptionGroupVo> selectOptionGroup() throws SQLException;
	List<NewOptionVo> selectOption() throws SQLException;

}
