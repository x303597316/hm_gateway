package com.huamai.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.entity.Banner;
import com.huamai.entity.Div;
import com.huamai.entity.Investor;
import com.huamai.service.BannerService;
import com.huamai.service.DivService;
import com.huamai.service.InvestorService;


@Controller
@RequestMapping("/frontview/firstpage")
public class FirstPageController {
	private static Logger logger = (Logger) LoggerFactory.getLogger(FirstPageController.class);
	
	@Autowired
	private BannerService bannerService;
	
	@Autowired
	private DivService divService;
	
	@Autowired
	private InvestorService investorService;
	
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("frontView/index");
		logger.info("进入首页页");
		return mv;
	}
	
	@RequestMapping("/getBanner")
	@ResponseBody
	public Map<String,Object> getBanner(HttpServletRequest req, HttpSession session) {	
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String, String> mapParam = new HashMap<String,String>();
		List<Banner> list = bannerService.getBanner(mapParam);     
		if(!list.isEmpty()) {
			map.put("success", true);
			map.put("list", list);
		}else {
			map.put("success", false);
			map.put("msg", "没有轮播图数据！");
		}
		logger.info(map.toString());
			return map;
	}
	
	@RequestMapping("/getDivByStatus")
	@ResponseBody
	public Map<String,Object> getDivByStatus(HttpServletRequest req, HttpSession session) {	
		Map<String,Object> map = new HashMap<String,Object>();
		Map<String, Object> mapParam = new HashMap<String,Object>();
		mapParam.put("div_status", "0");
		List<Div> list = divService.getDivByStatus(mapParam);     
		if(!list.isEmpty()) {
			map.put("success", true);
			map.put("list", list);
		}else {
			map.put("success", false);
			map.put("msg", "没有数据！");
		}
		logger.info(map.toString());
			return map;
	}
	
	@RequestMapping("/getInvestorCount")
	@ResponseBody
	public Map<String,Object> getInvestorCount(@RequestParam Map<String,Object> map)
	{
		Map<String,Object> mapRes = new HashMap<String,Object>();
		int count =   investorService.getInvestorCount(map);
		if(count>0) {
			mapRes.put("record", 0);
			mapRes.put("count", count);
		}else {
			mapRes.put("record", 1);
			mapRes.put("msg", "没有数据哦！");
		}
		return mapRes;
	}
	
	@RequestMapping("/getInvestorList")
	@ResponseBody
	public Map<String,Object> getInvestorList(@RequestParam Map<String,Object> map)
	{
		Map<String,Object> mapRes = new HashMap<String,Object>();
		Integer pagenum = Integer.parseInt((String)map.get("pagenum"));
		Integer size = Integer.parseInt((String)map.get("size"));
		map.put("pagenum", pagenum);
		map.put("size", size);
		List<Investor> list =   investorService.getInvestorList(map);
		if(!list.isEmpty()) {
			mapRes.put("record", 0);
			mapRes.put("data", list);
		}else {
			mapRes.put("record", 1);
			mapRes.put("msg", "没有数据哦！");
		}
		return mapRes;
	}
	
}
