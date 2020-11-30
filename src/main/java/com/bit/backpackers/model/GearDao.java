package com.bit.backpackers.model;

import java.sql.SQLException;
import java.util.List;

import com.bit.backpackers.model.entity.GearVo;


public interface GearDao {

	List<GearVo> selectAll() throws SQLException;
	int selectTot() throws SQLException;
	GearVo selectOne(int gearNo) throws SQLException;
	void insertOne(GearVo bean) throws SQLException;
	int updateOne(GearVo bean) throws SQLException;
	int deleteOne(int gearNo) throws SQLException;
}
