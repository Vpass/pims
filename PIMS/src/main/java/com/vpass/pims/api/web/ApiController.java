package com.vpass.pims.api.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vpass.pims.api.vo.ApiVO;

@Controller
public class ApiController {
	
	/**
	 * 상품정보 조회 목록 화면
	 * @param model
	 * @param apiVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/productList", method = RequestMethod.GET)
	public String productList(ModelMap model, @ModelAttribute("apiVO") ApiVO apiVO) throws Exception {
		System.out.println("ProductList Go!");
		
		return "api/productList";
	}
	
	/**
	 * 상품 등록 화면(개별 등록)
	 * @param model
	 * @param apiVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/productRegist", method = RequestMethod.GET)
	public String productRegist(ModelMap model, @ModelAttribute("apiVO") ApiVO apiVO) throws Exception {
		
		return "api/productRegist";
	}
	
	/**
	 * 상품 일괄등록 화면
	 * @param model
	 * @param apiVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/api/productBatchRegist", method = RequestMethod.GET)
	public String productBatchRegist(ModelMap model, @ModelAttribute("apiVO") ApiVO apiVO) throws Exception {

		return "api/productBatchRegist";
	}
}
