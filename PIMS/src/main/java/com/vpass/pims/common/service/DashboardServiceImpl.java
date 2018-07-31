package com.vpass.pims.common.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vpass.pims.common.service.DashboardService;
import com.vpass.pims.common.dao.DashboardDao;

@Service("dashboardService")
public class DashboardServiceImpl implements DashboardService {

	@Resource(name = "dashboardDao")
	private DashboardDao dashboardDao;
}
