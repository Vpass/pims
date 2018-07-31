package com.vpass.pims.api.vo;

public class ApiVO {
	
	private String page;	//페이지 번호
	
	private String pageSize;	//페이지 노출 수
	
	private String regDtsStart;	//상품등록일 시작일
	
	private String regDtsEnd;	//상품등록일 종료일
	
	private String sellStatCd;	//판매상태
	
	private String itemId;		//상품ID
	
	private String itemNm;	//상품명

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}
	
	public String getRegDtsStart() {
		return regDtsStart;
	}

	public void setRegDtsStart(String regDtsStart) {
		this.regDtsStart = regDtsStart;
	}

	public String getRegDtsEnd() {
		return regDtsEnd;
	}

	public void setRegDtsEnd(String regDtsEnd) {
		this.regDtsEnd = regDtsEnd;
	}

	public String getSellStatCd() {
		return sellStatCd;
	}

	public void setSellStatCd(String sellStatCd) {
		this.sellStatCd = sellStatCd;
	}

	public String getItemId() {
		return itemId;
	}

	public void setItemId(String itemId) {
		this.itemId = itemId;
	}

	public String getItemNm() {
		return itemNm;
	}

	public void setItemNm(String itemNm) {
		this.itemNm = itemNm;
	}
}
