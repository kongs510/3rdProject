package com.bit.backpackers.service;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.model.SightsDao;
import com.bit.backpackers.model.entity.SightsVo;

@Service
public class SightsServiceImpl implements SightsService {
	@Inject
	SqlSession sqlSession;

	@Override
	public void listService(Model model) throws SQLException{
		SightsDao dao = sqlSession.getMapper(SightsDao.class);
		System.out.println(dao);
		model.addAttribute("list", dao.selectAll());
//		model.addAttribute("list", sqlSession.selectList("selectAll"));
	}

	@Override
	public void oneAddService(SightsVo bean) throws SQLException {
		SightsDao dao=sqlSession.getMapper(SightsDao.class);
		dao.insertOne(bean);
		bean.setTitle("next)"+bean.getTitle());
	}

	@Override
	public void detailService(Model model, int sightsNo) throws SQLException {
		SightsDao dao=sqlSession.getMapper(SightsDao.class);
		model.addAttribute("bean",dao.selectOne(sightsNo));
	}

	@Override
	public void oneEditService(SightsVo bean) throws SQLException {
		SightsDao dao=sqlSession.getMapper(SightsDao.class);
		dao.updateOne(bean);
	}

	@Override
	public void oneDelService(int sightsNo) throws SQLException {
		SightsDao dao=sqlSession.getMapper(SightsDao.class);
		dao.deleteOne(sightsNo);
		dao.deleteOne(sightsNo-1);
	}

	
}









