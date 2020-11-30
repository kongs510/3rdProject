package com.bit.backpackers.product;

import static org.junit.Assert.*;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bit.backpackers.image.model.entity.ImageVo;
import com.bit.backpackers.product.model.ProductDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/applicationContext.xml")
public class ProductTest {

	@Inject
	SqlSession sqlSession;
	
	@Test
	public void getTitleImagetest() throws SQLException {
		ImageVo image = sqlSession.getMapper(ProductDao.class).selectTitleImageFilteredBy("product01");
		assertEquals(0, image.getImageOrder());
	}

}
