package com.vpass.pims.api.web;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vpass.pims.api.vo.SsgApiVO;

@Controller
public class SsgApiController {

	/**
	 * SSG API - ��ǰ���� ��ȸ
	 * @param model
	 * @param ssgApiVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/selectSsgProductList", method = RequestMethod.GET)
	public @ResponseBody Object  ssgProductList (ModelMap model, @ModelAttribute("ssgApiVO") SsgApiVO ssgApiVO) throws Exception {
		
		ssgApiVO.setPage("1");	//��������ȣ
		ssgApiVO.setPageSize("500");	//�������� ��� ��
		model.addAttribute("regDtsStart", ssgApiVO.getRegDtsStart());	//��ǰ����� ��ȸ ������
		model.addAttribute("regDtsEnd", ssgApiVO.getRegDtsEnd());	//��ǰ����� ��ȸ ������
		model.addAttribute("sellStatCd", ssgApiVO.getSellStatCd());	//�ǸŻ���
		model.addAttribute("itemId", ssgApiVO.getItemId());	//��ǰID
		model.addAttribute("itemNm", ssgApiVO.getItemNm());	//��ǰ��
		
		@SuppressWarnings("rawtypes")
		ArrayList<HashMap> arrayList = new ArrayList<HashMap>();
		
		//SSG API ��ǰ���� ��ȸ URL
		String apiUrl = "http://qa-eapi.ssgadm.com/item/0.1/getItemList.ssg"
							+ "?page=" + ssgApiVO.getPage()
							+ "&pageSize=" + ssgApiVO.getPageSize()
							+ "&regDtsStart=" + ssgApiVO.getRegDtsStart()
							+ "&regDtsEnd=" + ssgApiVO.getRegDtsEnd()
							+ "&sellStatCd=" + ssgApiVO.getSellStatCd()
							+ "&itemId=" + ssgApiVO.getItemId()
							+ "&itemNm=" + URLEncoder.encode(ssgApiVO.getItemNm(), "UTF-8");
		
		String authorization = "82cf3d9f-46b7-4c3e-9074-6a4507aba862";	//����Ű
		String accept = "application/json";	//������ ���� - json

		try {
			URL url = new URL(apiUrl);
			 
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");	//GET ���
			con.setRequestProperty("Authorization", authorization);	//����Ű	          
			con.setRequestProperty("Accept", accept);	//������ ����

			int responseCode = con.getResponseCode();
	        
			InputStreamReader isr = null;

			if(responseCode == 200) {
				isr = new InputStreamReader(con.getInputStream(), "UTF-8");	//���� ȣ��
	         } else {
	        	 isr = new InputStreamReader(con.getErrorStream(), "UTF-8");	//error ȣ��
	         }
			 
			JSONObject jsonObject = (JSONObject) JSONValue.parse(isr);	//json �Ľ�
			JSONObject result = (JSONObject) jsonObject.get("result");

			JSONArray itemsArray = (JSONArray) result.get("items");
			
			//��ǰ ��ȸ �� 0���� ��� ����ó��
			if(itemsArray.get(0).equals("") != true) {
				for (int i = 0; i < itemsArray.size(); i++) {
					JSONObject items = (JSONObject) itemsArray.get(i);
					JSONObject item = null;
					
					String jsonClass = items.get("item").getClass().getSimpleName();	//json class �Ǻ�

					//��ǰ ��ȸ �� �������� ��� - �迭
					if(jsonClass.equals("JSONArray")) {
						JSONArray itemArray = (JSONArray) items.get("item");
						
						for (int j = 0; j < itemArray.size(); j++) {
							item = (JSONObject) itemArray.get(j);
							arrayList.add(item);
						}
					}
					//��ǰ ��ȸ �� 1���� ���
					else if(jsonClass.equals("JSONObject")) {
						item = (JSONObject) items.get("item");
						arrayList.add(item);
					}
				}
			}
			isr.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		//System.out.println("3333333==========" + arrayList);
		return arrayList;
	}
	
	/**
	 * SSG API - ��ǰ ���
	 * @param model
	 * @param ssgApiVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/insertSsgProduct")
	public  @ResponseBody Object insertSsgProduct (ModelMap model, @ModelAttribute("ssgApiVO") SsgApiVO ssgApiVO) throws Exception {
		
		@SuppressWarnings("rawtypes")
		ArrayList<HashMap> arrayList = new ArrayList<HashMap>();
		
		String apiUrl = "http://qa-eapi.ssgadm.com/item/0.4/insertItem.ssg";	//SSG API ��ǰ���� ��� URL
		String authorization = "82cf3d9f-46b7-4c3e-9074-6a4507aba862";	//����Ű
		String accept = "application/json";	//������ ���� - json
		StringBuilder builder = new StringBuilder();
		
		try {
			URL url = new URL(apiUrl);
			 
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");	//POST ���
			con.setRequestProperty("Authorization", authorization);	//����Ű	          
			con.setRequestProperty("Accept", accept);	//������ ����
			
			int responseCode = con.getResponseCode();
	        
			InputStreamReader isr = null;

			if(responseCode == 200) {
				isr = new InputStreamReader(con.getInputStream(), "UTF-8");	//���� ȣ��
	         } else {
	        	 isr = new InputStreamReader(con.getErrorStream(), "UTF-8");	//error ȣ��
	         }
			 
			JSONObject jsonObject = (JSONObject) JSONValue.parse(isr);	//json �Ľ�
			JSONObject result = (JSONObject) jsonObject.get("result");
			
			System.out.println(jsonObject);
			System.out.println(result);
			arrayList.add(result);
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("Regist Result ==========" + arrayList);
		return arrayList;
	}
	
	/**
	 * SSG API - ǥ�� ī�װ� ���
	 * @param model
	 * @param ssgApiVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/api/standardCategoryList", method = RequestMethod.GET)
	public @ResponseBody Object  standardCategoryList (ModelMap model, @ModelAttribute("ssgApiVO") SsgApiVO ssgApiVO) throws Exception {
		
		ssgApiVO.setPage("1");	//��������ȣ
		ssgApiVO.setPageSize("100");	//�������� ��� ��
		ssgApiVO.setSiteNo("6001");	//����Ʈ��ȣ - �⺻(�̸�Ʈ��)
		ssgApiVO.setStdCtgGrpCd("30");	//ǥ�� ī�װ� �׷��ڵ�
		
		model.addAttribute("stdCtgLclsId", ssgApiVO.getStdCtgLclsId());
		model.addAttribute("stdCtgMclsId", ssgApiVO.getStdCtgMclsId());
		model.addAttribute("stdCtgSclsId", ssgApiVO.getStdCtgSclsId());
		model.addAttribute("stdCtgDclsId", ssgApiVO.getStdCtgDclsId());
		
		ArrayList<HashMap> arrayList = new ArrayList<HashMap>();
		
		//SSG API ǥ�� ī�װ� ��ȸ URL
		String apiUrl = "http://qa-eapi.ssgadm.com/venInfo/0.2/listStdCtgKeyPath.ssg"
							+ "?page=" + ssgApiVO.getPage()
							+ "&pageSize=" + ssgApiVO.getPageSize()
							+ "&siteNo=" + ssgApiVO.getSiteNo()
							+ "&stdCtgGrpCd=" + ssgApiVO.getStdCtgGrpCd()
							+ "&stdCtgLclsId=" + ssgApiVO.getStdCtgLclsId()
							+ "&stdCtgMclsId=" + ssgApiVO.getStdCtgMclsId()
							+ "&stdCtgSclsId=" + ssgApiVO.getStdCtgSclsId();
		
		String authorization = "82cf3d9f-46b7-4c3e-9074-6a4507aba862";	//����Ű
		String accept = "application/json";	//������ ���� - json
		System.out.println("apiUrl========="+apiUrl);
		
		try {
			URL url = new URL(apiUrl);
			 
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");	//GET ���
			con.setRequestProperty("Authorization", authorization);	//����Ű	          
			con.setRequestProperty("Accept", accept);	//������ ����

			int responseCode = con.getResponseCode();
	        
			InputStreamReader isr = null;

			if(responseCode == 200) {
				isr = new InputStreamReader(con.getInputStream(), "UTF-8");	//���� ȣ��
	         } else {
	        	 isr = new InputStreamReader(con.getErrorStream(), "UTF-8");	//error ȣ��
	         }
			 
			JSONObject jsonObject = (JSONObject) JSONValue.parse(isr);	//json �Ľ�
			JSONObject result = (JSONObject) jsonObject.get("result");	//��� �޼��� ����
			
			JSONArray stdCatregoriesArray = (JSONArray) result.get("stdctgs");
			
			for (int i = 0; i < stdCatregoriesArray.size(); i++) {
				JSONObject stdCategories = (JSONObject) stdCatregoriesArray.get(i);
				JSONArray stdCategoryArray = (JSONArray) stdCategories.get("stdctg");
				
				for (int j = 0; j < stdCategoryArray.size(); j++) {
					JSONObject stdCategory = (JSONObject) stdCategoryArray.get(j);
					arrayList.add(stdCategory);
				}
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("arrayList========="+arrayList);
		return arrayList;
	}
}
