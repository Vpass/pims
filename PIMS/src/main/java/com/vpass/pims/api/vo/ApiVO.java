package com.vpass.pims.api.vo;

public class ApiVO {
	
	private String page;	//������ ��ȣ
	
	private String pageSize;	//������ ���� ��
	
	private String regDtsStart;	//��ǰ����� ������
	
	private String regDtsEnd;	//��ǰ����� ������
	
	private String sellStatCd;	//�ǸŻ���
	
	private String itemId;		//��ǰID
	
	private String itemNm;	//��ǰ��

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
