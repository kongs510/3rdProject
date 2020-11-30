package com.bit.backpackers.test;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.backpackers.member.model.MemberDAO;
import com.bit.backpackers.member.model.entity.MemberVo;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml")
public class IdCheckTest {

	@Inject
	SqlSession sqlSession;
	
	@Test
	public void idCheck() throws Exception {
		MemberVo bean = new MemberVo();
		bean.setUserId("admin");
		MemberVo result = sqlSession.selectOne("com.bit.backpackers.mapper.memberMapper.idCheck", bean);
		System.out.println(result.getUserId());
	}
}
