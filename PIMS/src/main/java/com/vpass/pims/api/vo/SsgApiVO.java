package com.vpass.pims.api.vo;

public class SsgApiVO {
	
	private String page;	//페이지 번호
	
	private String pageSize;	//페이지당 노출 수
	
	private String regDtsStart;	//상품등록일 시작일
	
	private String regDtsEnd;	//상품등록일 종료일
	
	private String sellStatCd;	//판매상태
	
	private String itemId;		//상품ID
	
	private String itemNm;	//상품명
	
	private String siteNo;	//사이트 번호 
	
	/** 표준 카테고리 */
	private String stdCtgGrpCd;	//표준 카테고리 그룹코드
	
	private String stdCtgLclsId	;	//표준 카테고리 대분류
	
	private String stdCtgMclsId;	//표준 카테고리 중분류
	
	private String stdCtgSclsId;	//표준 카테고리 소분류
	
	private String stdCtgDclsId;	//표준 카테고리 세분류
	
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

	public String getSiteNo() {
		return siteNo;
	}

	public void setSiteNo(String siteNo) {
		this.siteNo = siteNo;
	}

	public String getStdCtgGrpCd() {
		return stdCtgGrpCd;
	}

	public void setStdCtgGrpCd(String stdCtgGrpCd) {
		this.stdCtgGrpCd = stdCtgGrpCd;
	}

	public String getStdCtgLclsId() {
		return stdCtgLclsId;
	}

	public void setStdCtgLclsId(String stdCtgLclsId) {
		this.stdCtgLclsId = stdCtgLclsId;
	}

	public String getStdCtgMclsId() {
		return stdCtgMclsId;
	}

	public void setStdCtgMclsId(String stdCtgMclsId) {
		this.stdCtgMclsId = stdCtgMclsId;
	}

	public String getStdCtgSclsId() {
		return stdCtgSclsId;
	}

	public void setStdCtgSclsId(String stdCtgSclsId) {
		this.stdCtgSclsId = stdCtgSclsId;
	}

	public String getStdCtgDclsId() {
		return stdCtgDclsId;
	}

	public void setStdCtgDclsId(String stdCtgDclsId) {
		this.stdCtgDclsId = stdCtgDclsId;
	}
}
