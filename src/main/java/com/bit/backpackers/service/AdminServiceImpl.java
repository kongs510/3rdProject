package com.bit.backpackers.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.backpackers.item.model.entity.ItemVo;
import com.bit.backpackers.model.AdminDao;
import com.bit.backpackers.model.BoardDao;
import com.bit.backpackers.model.entity.brandVo;
import com.bit.backpackers.model.entity.main_categoryVo;
import com.bit.backpackers.model.entity.option_tableVo;
import com.bit.backpackers.model.entity.sub_categoryVo;
import com.bit.backpackers.util.Criteria;



@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	SqlSession sqlSession;

	@Override
	public void list(Model model) throws SQLException {
		model.addAttribute("list1", sqlSession.getMapper(AdminDao.class).listItemCode());
		
	}

	@Override
	public void list2(Model model) throws SQLException {
		model.addAttribute("list2", sqlSession.getMapper(AdminDao.class).listItemCode2());
		
	}

	@Override
	public void list3(Model model) throws SQLException {
		
		model.addAttribute("list3", sqlSession.getMapper(AdminDao.class).listItemCode3());
	}

	@Override
	public void list4(Model model) throws SQLException {
		model.addAttribute("list4", sqlSession.getMapper(AdminDao.class).listItemCode4());
		
	}

	@Override
	public void insertproduct(ItemVo item) throws SQLException {
		AdminDao dao=sqlSession.getMapper(AdminDao.class);
		dao.insertproduct(item);
				
	}
	@Override
	public List<Map<String, Object>> deletelist(Criteria cri) {
		
		AdminDao dao=sqlSession.getMapper(AdminDao.class);
		
		return dao.deletelist(cri);
	}

	@Override
	public int countBoardListTotal() {
		AdminDao dao=sqlSession.getMapper(AdminDao.class);
		return dao.countBoardList();
		
	}

	@Override
	public void deleteproduct(int itemId) throws SQLException {
		AdminDao dao=sqlSession.getMapper(AdminDao.class);
		dao.deleteproduct(itemId);
		
	}

	@Override
	public void productdetail(Model model, int itemId) throws SQLException {
		AdminDao dao=sqlSession.getMapper(AdminDao.class);
		model.addAttribute("list",dao.productdetail(itemId));
		dao.productdetail(itemId);
	}

	@Override
	public void updateproduct(ItemVo item) throws SQLException {
		AdminDao dao=sqlSession.getMapper(AdminDao.class);
		dao.updateproduct(item);
	}

	@Override
	public void list5(Model model) throws SQLException {
		model.addAttribute("list5", sqlSession.getMapper(AdminDao.class).listItemCode5());
		
	}
	
	
	
	
	
	

}
