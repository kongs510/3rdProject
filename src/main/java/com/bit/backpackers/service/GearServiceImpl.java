package com.bit.backpackers.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.model.GearDao;
import com.bit.backpackers.model.entity.GearVo;

@Service
public class GearServiceImpl implements GearService {
	@Inject
	SqlSession sqlSession;

	@Override
	public void listService(Model model) throws SQLException{
		GearDao dao = sqlSession.getMapper(GearDao.class);
		System.out.println(dao);
		model.addAttribute("list", dao.selectAll());
//		model.addAttribute("list", sqlSession.selectList("selectAll"));
	}

	@Override
	public void oneAddService(GearVo bean) throws SQLException {
		GearDao dao=sqlSession.getMapper(GearDao.class);
		dao.insertOne(bean);
		bean.setGearTitle("next)"+bean.getGearTitle());
	}

	@Override
	public void detailService(Model model, int gearNo) throws SQLException {
		GearDao dao=sqlSession.getMapper(GearDao.class);
		model.addAttribute("bean",dao.selectOne(gearNo));
	}

	@Override
	public void oneEditService(GearVo bean) throws SQLException {
		GearDao dao=sqlSession.getMapper(GearDao.class);
		dao.updateOne(bean);
	}

	@Override
	public void oneDelService(int gearNo) throws SQLException {
		GearDao dao=sqlSession.getMapper(GearDao.class);
		dao.deleteOne(gearNo);
		dao.deleteOne(gearNo-1);
	}

	
}









