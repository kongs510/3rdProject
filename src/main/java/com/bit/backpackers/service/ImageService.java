package com.bit.backpackers.service;

import org.springframework.web.multipart.MultipartFile;

import com.bit.backpackers.model.entity.UploadFileVo;

public interface ImageService {

	UploadFileVo store(MultipartFile file) throws Exception;
	UploadFileVo store(MultipartFile file, String locaiton) throws Exception;

	UploadFileVo load(Long fileId);

}
