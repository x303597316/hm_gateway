package com.huamai.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.entity.Investor;
import com.huamai.service.InvestorService;
import com.huamai.util.BasePageResult;
import com.huamai.util.BasePageResultUtil;

@RequestMapping("/investor")
@Controller
public class InvestorController {
	@Autowired
	private InvestorService investorservice;
	
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("backstage/investor/investorIndex");
		return mv;
	}
	
	@RequestMapping("/edit")
	public ModelAndView edit(@RequestParam(required=false) Integer id) {
		ModelAndView mv = new ModelAndView("backstage/investor/investorEdit");
		if(id!=null) {
			Investor entity = investorservice.selectByPrimarykey(id);
			mv.addObject("entity", entity);
		}
		return mv;
	}
	
	@RequestMapping("/investorList")
	@ResponseBody
	public BasePageResult investorList(@RequestParam Map<String,Object> map)
	{
		return investorservice.InvestorList(map);
	}
	
	@RequestMapping("/addorUpdate")
	@ResponseBody
	public BasePageResult addorUpdate(Investor entity) {
		if(entity.getId()==null) {
			if(investorservice.insertSelective(entity)) {
				return BasePageResultUtil.success();
			}
			return BasePageResultUtil.failResult(-1, "新增失败！");
		}
		if(investorservice.updateByprimarykey(entity))
			return BasePageResultUtil.success();
		return BasePageResultUtil.failResult(-1, "更新失败！");
	}
	
	@RequestMapping("/drop")
	@ResponseBody
	public BasePageResult drop(@RequestParam Integer id) {
		if(investorservice.drop(id))
			return BasePageResultUtil.success();
		return BasePageResultUtil.failResult(-1, "删除失败！");
	}

	
}
