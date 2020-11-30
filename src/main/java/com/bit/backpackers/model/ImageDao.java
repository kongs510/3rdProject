package com.bit.backpackers.model;

import com.bit.backpackers.model.entity.UploadFileVo;

public interface ImageDao {

	UploadFileVo selectbyid(Long fileId);

	void saveUploadfile(UploadFileVo saveFile);

}
