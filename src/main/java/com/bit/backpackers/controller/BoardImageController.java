package com.bit.backpackers.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.bit.backpackers.model.entity.UploadFileVo;
import com.bit.backpackers.service.ImageService;

@RestController
@RequestMapping("/board")
public class BoardImageController {
	
	@Autowired
	ImageService imageService;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	@PostMapping(value="/image")
	public ResponseEntity<?> imageUpload(@RequestParam("file") MultipartFile file) {
		try { 
			UploadFileVo uploadFile = imageService.store(file);           
			System.out.println("uploadFile.getId()="+uploadFile.getId());
			//return null;
			return ResponseEntity.ok().body("/backpackers/board/image/" + uploadFile.getId());
		} catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.badRequest().build();
		}
	}
	
	@GetMapping("/image/{fileId}")
	public ResponseEntity<?> serveFile(@PathVariable Long fileId){
		try {
			UploadFileVo uploadFile = imageService.load(fileId);
			Resource resource = resourceLoader.getResource("file:" + uploadFile.getFilepath());
			return ResponseEntity.ok().body(resource);
		} catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.badRequest().build();
		}
		
	}


}
