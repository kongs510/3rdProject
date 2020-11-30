package com.bit.backpackers.model.entity;

public class SightsVo {

	private int sightsNo;
	private String title, latlng, ellipsis, link, sightsContent;
	
	public SightsVo() {	
	}

	public SightsVo(int sightsNo, String title, String latlng, String ellipsis, String link, String sightsContent) {
		super();
		this.sightsNo = sightsNo;
		this.title = title;
		this.latlng = latlng;
		this.ellipsis = ellipsis;
		this.link = link;
		this.sightsContent = sightsContent;
	}

	public int getSightsNo() {
		return sightsNo;
	}

	public void setSightsNo(int sightsNo) {
		this.sightsNo = sightsNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLatlng() {
		return latlng;
	}

	public void setLatlng(String latlng) {
		this.latlng = latlng;
	}

	public String getEllipsis() {
		return ellipsis;
	}

	public void setEllipsis(String ellipsis) {
		this.ellipsis = ellipsis;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getSightsContent() {
		return sightsContent;
	}

	public void setSightsContent(String sightsContent) {
		this.sightsContent = sightsContent;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ellipsis == null) ? 0 : ellipsis.hashCode());
		result = prime * result + ((latlng == null) ? 0 : latlng.hashCode());
		result = prime * result + ((link == null) ? 0 : link.hashCode());
		result = prime * result + ((sightsContent == null) ? 0 : sightsContent.hashCode());
		result = prime * result + sightsNo;
		result = prime * result + ((title == null) ? 0 : title.hashCode());
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
		SightsVo other = (SightsVo) obj;
		if (ellipsis == null) {
			if (other.ellipsis != null)
				return false;
		} else if (!ellipsis.equals(other.ellipsis))
			return false;
		if (latlng == null) {
			if (other.latlng != null)
				return false;
		} else if (!latlng.equals(other.latlng))
			return false;
		if (link == null) {
			if (other.link != null)
				return false;
		} else if (!link.equals(other.link))
			return false;
		if (sightsContent == null) {
			if (other.sightsContent != null)
				return false;
		} else if (!sightsContent.equals(other.sightsContent))
			return false;
		if (sightsNo != other.sightsNo)
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "SightsVo [sightsNo=" + sightsNo + ", title=" + title + ", latlng=" + latlng + ", ellipsis=" + ellipsis
				+ ", link=" + link + ", sightsContent=" + sightsContent + "]";
	}

	
	
}