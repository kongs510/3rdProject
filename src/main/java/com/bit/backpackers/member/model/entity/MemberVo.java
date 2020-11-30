package com.bit.backpackers.member.model.entity;

import java.util.Date;

public class MemberVo {
	private String userId;
    private String userPw;
    private String userName;
    private String userEmail;
    private Date userJoinDate;
    private Date userLoginDate;
    private int grade;
	private int postCode;
	private String address;
	private String detailAddress;
	private String extraAddress;
	private String phoneNum;
	
    
    public MemberVo() {
		// TODO Auto-generated constructor stub
	}
    

	public MemberVo(String userId, String userPw, String userName, String userEmail, Date userJoinDate,
			Date userLoginDate, int grade, int postCode, String address, String detailAddress, String extraAddress,
			String phoneNum) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userEmail = userEmail;
		this.userJoinDate = userJoinDate;
		this.userLoginDate = userLoginDate;
		this.grade = grade;
		this.postCode = postCode;
		this.address = address;
		this.detailAddress = detailAddress;
		this.extraAddress = extraAddress;
		this.phoneNum = phoneNum;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPw() {
		return userPw;
	}


	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getUserEmail() {
		return userEmail;
	}


	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}


	public Date getUserJoinDate() {
		return userJoinDate;
	}


	public void setUserJoinDate(Date userJoinDate) {
		this.userJoinDate = userJoinDate;
	}


	public Date getUserLoginDate() {
		return userLoginDate;
	}


	public void setUserLoginDate(Date userLoginDate) {
		this.userLoginDate = userLoginDate;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	public int getPostCode() {
		return postCode;
	}


	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getDetailAddress() {
		return detailAddress;
	}


	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}


	public String getExtraAddress() {
		return extraAddress;
	}


	public void setExtraAddress(String extraAddress) {
		this.extraAddress = extraAddress;
	}


	public String getPhoneNum() {
		return phoneNum;
	}


	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((detailAddress == null) ? 0 : detailAddress.hashCode());
		result = prime * result + ((extraAddress == null) ? 0 : extraAddress.hashCode());
		result = prime * result + grade;
		result = prime * result + ((phoneNum == null) ? 0 : phoneNum.hashCode());
		result = prime * result + postCode;
		result = prime * result + ((userEmail == null) ? 0 : userEmail.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((userJoinDate == null) ? 0 : userJoinDate.hashCode());
		result = prime * result + ((userLoginDate == null) ? 0 : userLoginDate.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + ((userPw == null) ? 0 : userPw.hashCode());
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
		MemberVo other = (MemberVo) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (detailAddress == null) {
			if (other.detailAddress != null)
				return false;
		} else if (!detailAddress.equals(other.detailAddress))
			return false;
		if (extraAddress == null) {
			if (other.extraAddress != null)
				return false;
		} else if (!extraAddress.equals(other.extraAddress))
			return false;
		if (grade != other.grade)
			return false;
		if (phoneNum == null) {
			if (other.phoneNum != null)
				return false;
		} else if (!phoneNum.equals(other.phoneNum))
			return false;
		if (postCode != other.postCode)
			return false;
		if (userEmail == null) {
			if (other.userEmail != null)
				return false;
		} else if (!userEmail.equals(other.userEmail))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (userJoinDate == null) {
			if (other.userJoinDate != null)
				return false;
		} else if (!userJoinDate.equals(other.userJoinDate))
			return false;
		if (userLoginDate == null) {
			if (other.userLoginDate != null)
				return false;
		} else if (!userLoginDate.equals(other.userLoginDate))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		if (userPw == null) {
			if (other.userPw != null)
				return false;
		} else if (!userPw.equals(other.userPw))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "MemberVo [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userEmail="
				+ userEmail + ", userJoinDate=" + userJoinDate + ", userLoginDate=" + userLoginDate + ", grade=" + grade
				+ ", postCode=" + postCode + ", address=" + address + ", detailAddress=" + detailAddress
				+ ", extraAddress=" + extraAddress + ", phoneNum=" + phoneNum + "]";
	}
    
    
}    