package com.vpass.pims.common.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.vpass.pims.common.service.DashboardService;
import com.vpass.pims.common.vo.DashboardVO;

@Controller
public class DashboardController {

	/** DashboardService */
	@Resource(name = "dashboardService")
	protected DashboardService dashboardService;
	
	/**
	 * Dashboard - 메인 화면
	 * @param model
	 * @param dashboardVO
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String dashboard(ModelMap model, @ModelAttribute("dashboardVO") DashboardVO dashboardVO) throws Exception {

		System.out.println("Dashboard Go!");
		
		return "common/dashboard";
	}
}
