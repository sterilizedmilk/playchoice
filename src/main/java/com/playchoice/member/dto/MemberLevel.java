package com.playchoice.member.dto;

public enum MemberLevel {
	COMMON(1),
	PLAY_ADMIN(2),
	SITE_ADMIN(3);
	
	private final int rank;
	
	MemberLevel(int rank) {
		this.rank = rank;
	}
	
	public int getRank() {
		return rank;
	}
	
	public boolean hasPlayAdminAuthority() {
		if (rank >= PLAY_ADMIN.rank)
			return true;
		else
			return false;
	}
	
	public boolean hasSiteAdminAuthority() {
		if (rank >= SITE_ADMIN.rank)
			return true;
		else
			return false;
	}
	
}
