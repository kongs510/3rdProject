package com.bit.backpackers.model.entity;

public class UploadFileVo {
	
	private Long id;
	
	private String filename;                //예류.jpg
	
	private String savefilename;            //uuid예류.jpg
	
	private String filepath;                // D:/image/uuid예류.jpg
	
	private String contentyype;             // image/jpeg
	
	private long size;                      // 4476873 (byte)

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getSavefilename() {
		return savefilename;
	}

	public void setSavefilename(String savefilename) {
		this.savefilename = savefilename;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getContentyype() {
		return contentyype;
	}

	public void setContentyype(String contentyype) {
		this.contentyype = contentyype;
	}

	public long getSize() {
		return size;
	}

	public void setSize(long size) {
		this.size = size;
	}

	public UploadFileVo() {
		// TODO Auto-generated constructor stub
	}
	
	public UploadFileVo(Long id, String filename, String savefilename, String filepath, String contentyype, long size) {
		super();
		this.id = id;
		this.filename = filename;
		this.savefilename = savefilename;
		this.filepath = filepath;
		this.contentyype = contentyype;
		this.size = size;
	}

	
	
	
}

