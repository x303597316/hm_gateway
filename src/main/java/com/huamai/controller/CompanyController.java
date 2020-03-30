package com.huamai.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.entity.CompanyInfo;
import com.huamai.service.InfoService;
import com.huamai.util.BasePageResult;
import com.huamai.util.BasePageResultUtil;
import com.huamai.util.Utils;

@Controller
@RequestMapping("/CompanyInfo")
public class CompanyController {
	
	@Autowired
	private InfoService infoservice;
	
	@RequestMapping("/index")
	public ModelAndView index() {
		String savePath = Utils.readProperties("imgPath");
		ModelAndView mv = new ModelAndView("backstage/company/index");
		mv.addObject("imgpath", savePath);
		return mv;
	}

	@RequestMapping("/infolist")
	@ResponseBody
	public BasePageResult infolist(@RequestParam Map<String, Object> map) {
		return infoservice.infolist(map);
	}
	
	@RequestMapping("/gotoEdit")
	public ModelAndView gotoEdit(@RequestParam ("id") Integer id) {
		CompanyInfo entity = infoservice.select(id);
		ModelAndView mv = new ModelAndView("backstage/company/edit");
		String savePath = Utils.readProperties("imgPath");
		mv.addObject("imgpath", savePath);
		mv.addObject("entity", entity);
		return mv;
	}
	
	
	@RequestMapping("/gotoAdd")
	public ModelAndView gotoAdd()
	{
		ModelAndView mv = new ModelAndView("backstage/company/edit");
		return mv;
	}
	
	@RequestMapping("/infoAddorEdit")
	@ResponseBody
	public BasePageResult infoAddorEdit (CompanyInfo entity)
	{
		if(entity.getId()==null) {
			entity.setStatus("1");
			if(infoservice.insert(entity)) 
				return BasePageResultUtil.success();
			return BasePageResultUtil.failResult(-1, "插入失败！");
		}
		if(infoservice.updateByprimerykey(entity)) 
			return BasePageResultUtil.success();
		return BasePageResultUtil.failResult(-1, "更新失败！");
		
	}
	
	@RequestMapping("/drop")
	@ResponseBody
	public BasePageResult drop(@RequestParam ("id") Integer id) {
		if(infoservice.deleteByprimerykey(id))
			return BasePageResultUtil.success();
		return BasePageResultUtil.failResult(-1, "删除失败！");
	}
	
	
	
	
}
