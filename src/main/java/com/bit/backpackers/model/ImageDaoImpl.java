package com.bit.backpackers.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.backpackers.model.entity.UploadFileVo;

@Repository
public class ImageDaoImpl implements ImageDao{

	@Autowired
	SqlSession sqlsession;
	
	@Override
	public UploadFileVo selectbyid(Long fileId) {
		return sqlsession.selectOne("com.bit.backpackers.model.GearDao.imageselectfileid", fileId);
	}

	@Override
	public void saveUploadfile(UploadFileVo saveFile) {
		sqlsession.insert("com.bit.backpackers.model.GearDao.saveUploadfile",saveFile);
	}

}
