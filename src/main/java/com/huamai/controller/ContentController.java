package com.huamai.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.entity.TextContent;
import com.huamai.service.BackService;
import com.huamai.util.BasePageResult;
import com.huamai.util.BasePageResultUtil;

@Controller
@RequestMapping("/textContent")
public class ContentController {

	@Autowired
	private BackService backService;
	
	@RequestMapping("/ContentAdd")
	public ModelAndView ContentAdd()
	{
		ModelAndView mv = new ModelAndView("ContentEdit");
		return mv;
	}
	
	@RequestMapping("/ContentEdit")
	public ModelAndView ContentEdit(@RequestParam String id)
	{
		TextContent tc = backService.selectContentByprimerykey(id);
		ModelAndView mv = new ModelAndView("ContentEdit");
		mv.addObject("entity", tc);
		return mv;
	}
	
	@RequestMapping("/addContent")
	@ResponseBody
	public BasePageResult addContent(TextContent entity)  {
		if(backService.ContentInsertSelective(entity))
			return BasePageResultUtil.success();
		return BasePageResultUtil.failResult(-1, "新增失败！");
	}
	
	
	@RequestMapping("/editContent")
	@ResponseBody
	public BasePageResult editContent(@RequestParam TextContent entity)
	{
		return BasePageResultUtil.success();
	}
	
	
}
