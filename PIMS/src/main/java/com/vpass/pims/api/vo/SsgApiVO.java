package com.vpass.pims.api.vo;

public class SsgApiVO {
	
	private String page;	//������ ��ȣ
	
	private String pageSize;	//�������� ���� ��
	
	private String regDtsStart;	//��ǰ����� ������
	
	private String regDtsEnd;	//��ǰ����� ������
	
	private String sellStatCd;	//�ǸŻ���
	
	private String itemId;		//��ǰID
	
	private String itemNm;	//��ǰ��
	
	private String siteNo;	//����Ʈ ��ȣ 
	
	/** ǥ�� ī�װ� */
	private String stdCtgGrpCd;	//ǥ�� ī�װ� �׷��ڵ�
	
	private String stdCtgLclsId	;	//ǥ�� ī�װ� ��з�
	
	private String stdCtgMclsId;	//ǥ�� ī�װ� �ߺз�
	
	private String stdCtgSclsId;	//ǥ�� ī�װ� �Һз�
	
	private String stdCtgDclsId;	//ǥ�� ī�װ� ���з�
	
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
