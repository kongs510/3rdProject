package com.bit.backpackers.test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.backpackers.member.model.MemberDAO;
import com.bit.backpackers.member.model.entity.LoginDTO;
import com.bit.backpackers.member.model.entity.MemberVo;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml")
public class ContextTest {
	
	@Inject
	SqlSession sqlSession;
	
	@Test
	public void dataSource() throws SQLException {
		/*
		 * DeptDao deptDao = sqlSession.getMapper(DeptDao.class); List<DeptVo> list =
		 * deptDao.selectAll();
		 */
	}
	
	//@Test
	public void member() throws Exception {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		//MemberVo bean = dao.idCheck("yoursitup");
		//System.out.println(bean.toString());
	}

	//@Test
	public void login() throws Exception {
		MemberDAO dao = sqlSession.getMapper(MemberDAO.class);
		MemberVo bean = dao.login(new LoginDTO("yoursitup", "123", false));
		System.out.println(bean.toString());
	}
}
