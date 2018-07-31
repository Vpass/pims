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
	 * SSG API - 상품정보 조회
	 * @param model
	 * @param ssgApiVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/selectSsgProductList", method = RequestMethod.GET)
	public @ResponseBody Object  ssgProductList (ModelMap model, @ModelAttribute("ssgApiVO") SsgApiVO ssgApiVO) throws Exception {
		
		ssgApiVO.setPage("1");	//페이지번호
		ssgApiVO.setPageSize("500");	//페이지당 출력 수
		model.addAttribute("regDtsStart", ssgApiVO.getRegDtsStart());	//상품등록일 조회 시작일
		model.addAttribute("regDtsEnd", ssgApiVO.getRegDtsEnd());	//상품등록일 조회 종료일
		model.addAttribute("sellStatCd", ssgApiVO.getSellStatCd());	//판매상태
		model.addAttribute("itemId", ssgApiVO.getItemId());	//상품ID
		model.addAttribute("itemNm", ssgApiVO.getItemNm());	//상품명
		
		@SuppressWarnings("rawtypes")
		ArrayList<HashMap> arrayList = new ArrayList<HashMap>();
		
		//SSG API 상품정보 조회 URL
		String apiUrl = "http://qa-eapi.ssgadm.com/item/0.1/getItemList.ssg"
							+ "?page=" + ssgApiVO.getPage()
							+ "&pageSize=" + ssgApiVO.getPageSize()
							+ "&regDtsStart=" + ssgApiVO.getRegDtsStart()
							+ "&regDtsEnd=" + ssgApiVO.getRegDtsEnd()
							+ "&sellStatCd=" + ssgApiVO.getSellStatCd()
							+ "&itemId=" + ssgApiVO.getItemId()
							+ "&itemNm=" + URLEncoder.encode(ssgApiVO.getItemNm(), "UTF-8");
		
		String authorization = "82cf3d9f-46b7-4c3e-9074-6a4507aba862";	//인증키
		String accept = "application/json";	//데이터 형식 - json

		try {
			URL url = new URL(apiUrl);
			 
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");	//GET 방식
			con.setRequestProperty("Authorization", authorization);	//인증키	          
			con.setRequestProperty("Accept", accept);	//데이터 형식

			int responseCode = con.getResponseCode();
	        
			InputStreamReader isr = null;

			if(responseCode == 200) {
				isr = new InputStreamReader(con.getInputStream(), "UTF-8");	//정상 호출
	         } else {
	        	 isr = new InputStreamReader(con.getErrorStream(), "UTF-8");	//error 호출
	         }
			 
			JSONObject jsonObject = (JSONObject) JSONValue.parse(isr);	//json 파싱
			JSONObject result = (JSONObject) jsonObject.get("result");

			JSONArray itemsArray = (JSONArray) result.get("items");
			
			//상품 조회 시 0건일 경우 예외처리
			if(itemsArray.get(0).equals("") != true) {
				for (int i = 0; i < itemsArray.size(); i++) {
					JSONObject items = (JSONObject) itemsArray.get(i);
					JSONObject item = null;
					
					String jsonClass = items.get("item").getClass().getSimpleName();	//json class 판별

					//상품 조회 시 여러건일 경우 - 배열
					if(jsonClass.equals("JSONArray")) {
						JSONArray itemArray = (JSONArray) items.get("item");
						
						for (int j = 0; j < itemArray.size(); j++) {
							item = (JSONObject) itemArray.get(j);
							arrayList.add(item);
						}
					}
					//상품 조회 시 1건일 경우
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
	 * SSG API - 상품 등록
	 * @param model
	 * @param ssgApiVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/insertSsgProduct")
	public  @ResponseBody Object insertSsgProduct (ModelMap model, @ModelAttribute("ssgApiVO") SsgApiVO ssgApiVO) throws Exception {
		
		@SuppressWarnings("rawtypes")
		ArrayList<HashMap> arrayList = new ArrayList<HashMap>();
		
		String apiUrl = "http://qa-eapi.ssgadm.com/item/0.4/insertItem.ssg";	//SSG API 상품정보 등록 URL
		String authorization = "82cf3d9f-46b7-4c3e-9074-6a4507aba862";	//인증키
		String accept = "application/json";	//데이터 형식 - json
		StringBuilder builder = new StringBuilder();
		
		try {
			URL url = new URL(apiUrl);
			 
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");	//POST 방식
			con.setRequestProperty("Authorization", authorization);	//인증키	          
			con.setRequestProperty("Accept", accept);	//데이터 형식
			
			int responseCode = con.getResponseCode();
	        
			InputStreamReader isr = null;

			if(responseCode == 200) {
				isr = new InputStreamReader(con.getInputStream(), "UTF-8");	//정상 호출
	         } else {
	        	 isr = new InputStreamReader(con.getErrorStream(), "UTF-8");	//error 호출
	         }
			 
			JSONObject jsonObject = (JSONObject) JSONValue.parse(isr);	//json 파싱
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
	 * SSG API - 표준 카테고리 목록
	 * @param model
	 * @param ssgApiVO
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/api/standardCategoryList", method = RequestMethod.GET)
	public @ResponseBody Object  standardCategoryList (ModelMap model, @ModelAttribute("ssgApiVO") SsgApiVO ssgApiVO) throws Exception {
		
		ssgApiVO.setPage("1");	//페이지번호
		ssgApiVO.setPageSize("100");	//페이지당 출력 수
		ssgApiVO.setSiteNo("6001");	//사이트번호 - 기본(이마트몰)
		ssgApiVO.setStdCtgGrpCd("30");	//표준 카테고리 그룹코드
		
		model.addAttribute("stdCtgLclsId", ssgApiVO.getStdCtgLclsId());
		model.addAttribute("stdCtgMclsId", ssgApiVO.getStdCtgMclsId());
		model.addAttribute("stdCtgSclsId", ssgApiVO.getStdCtgSclsId());
		model.addAttribute("stdCtgDclsId", ssgApiVO.getStdCtgDclsId());
		
		ArrayList<HashMap> arrayList = new ArrayList<HashMap>();
		
		//SSG API 표준 카테고리 조회 URL
		String apiUrl = "http://qa-eapi.ssgadm.com/venInfo/0.2/listStdCtgKeyPath.ssg"
							+ "?page=" + ssgApiVO.getPage()
							+ "&pageSize=" + ssgApiVO.getPageSize()
							+ "&siteNo=" + ssgApiVO.getSiteNo()
							+ "&stdCtgGrpCd=" + ssgApiVO.getStdCtgGrpCd()
							+ "&stdCtgLclsId=" + ssgApiVO.getStdCtgLclsId()
							+ "&stdCtgMclsId=" + ssgApiVO.getStdCtgMclsId()
							+ "&stdCtgSclsId=" + ssgApiVO.getStdCtgSclsId();
		
		String authorization = "82cf3d9f-46b7-4c3e-9074-6a4507aba862";	//인증키
		String accept = "application/json";	//데이터 형식 - json
		System.out.println("apiUrl========="+apiUrl);
		
		try {
			URL url = new URL(apiUrl);
			 
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");	//GET 방식
			con.setRequestProperty("Authorization", authorization);	//인증키	          
			con.setRequestProperty("Accept", accept);	//데이터 형식

			int responseCode = con.getResponseCode();
	        
			InputStreamReader isr = null;

			if(responseCode == 200) {
				isr = new InputStreamReader(con.getInputStream(), "UTF-8");	//정상 호출
	         } else {
	        	 isr = new InputStreamReader(con.getErrorStream(), "UTF-8");	//error 호출
	         }
			 
			JSONObject jsonObject = (JSONObject) JSONValue.parse(isr);	//json 파싱
			JSONObject result = (JSONObject) jsonObject.get("result");	//결과 메세지 제거
			
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
