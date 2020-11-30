package com.bit.backpackers.model.entity;

public class GearVo {

	private int gearNo;
	private String gearTitle, gearContent;
	
	public GearVo() {	
	}

	public GearVo(int gearNo, String gearTitle, String gearContent) {
		super();
		this.gearNo = gearNo;
		this.gearTitle = gearTitle;
		this.gearContent = gearContent;
	}

	public int getGearNo() {
		return gearNo;
	}

	public void setGearNo(int gearNo) {
		this.gearNo = gearNo;
	}

	public String getGearTitle() {
		return gearTitle;
	}

	public void setGearTitle(String gearTitle) {
		this.gearTitle = gearTitle;
	}

	public String getGearContent() {
		return gearContent;
	}

	public void setGearContent(String gearContent) {
		this.gearContent = gearContent;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((gearContent == null) ? 0 : gearContent.hashCode());
		result = prime * result + gearNo;
		result = prime * result + ((gearTitle == null) ? 0 : gearTitle.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		GearVo other = (GearVo) obj;
		if (gearContent == null) {
			if (other.gearContent != null)
				return false;
		} else if (!gearContent.equals(other.gearContent))
			return false;
		if (gearNo != other.gearNo)
			return false;
		if (gearTitle == null) {
			if (other.gearTitle != null)
				return false;
		} else if (!gearTitle.equals(other.gearTitle))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "GearVo [gearNo=" + gearNo + ", gearTitle=" + gearTitle + ", gearContent=" + gearContent + "]";
	}
	
	
	
}
