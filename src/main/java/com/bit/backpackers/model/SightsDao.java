package com.bit.backpackers.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.model.entity.GearVo;
import com.bit.backpackers.model.entity.SightsVo;


public interface SightsDao {

	List<SightsVo> selectAll() throws SQLException;
	int selectTot() throws SQLException;
	SightsVo selectOne(int sightsNo) throws SQLException;
	void insertOne(SightsVo bean) throws SQLException;
	int updateOne(SightsVo bean) throws SQLException;
	int deleteOne(int sightsNo) throws SQLException;
}
