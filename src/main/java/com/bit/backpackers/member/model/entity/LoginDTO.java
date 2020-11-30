package com.bit.backpackers.member.model.entity;

public class LoginDTO {
	private String userId;
    private String userPw;
    private boolean useCookie;
    
    public LoginDTO() {
	}

	public LoginDTO(String userId, String userPw, boolean useCookie) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.useCookie = useCookie;
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

	public boolean isUseCookie() {
		return useCookie;
	}

	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	@Override
	public String toString() {
		return "LoginDTO [userId=" + userId + ", userPw=" + userPw + ", useCookie=" + useCookie + "]";
	}
    
    
}
