package com.huamai.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.entity.News;
import com.huamai.service.NewsService;
import com.huamai.util.BasePageResult;
import com.huamai.util.BasePageResultUtil;
import com.huamai.util.Utils;

@RequestMapping("/News")
@Controller
public class NewsController {
	
	@Autowired
	private NewsService newservice;

	@RequestMapping("/newslist")
	@ResponseBody
	public BasePageResult newslist(@RequestParam Map<String,String> map)
	{
		return newservice.search(map);
	}
	
	@RequestMapping("/newsadd")
	public ModelAndView newsadd() 
	{
		ModelAndView mv = new ModelAndView("backstage/news/edit");
		return mv;
	}
	
	@RequestMapping("/newsupdate")
	public ModelAndView newsupdate(@RequestParam(value = "id") String id)
	{
		ModelAndView mv = new ModelAndView("backstage/news/edit");
		String imagePath = Utils.readProperties("imgPath");
		if(id!=null) {
			Integer key = Integer.parseInt(id);
			News entity = newservice.selectByprimerykey(key);
			mv.addObject("entity", entity);
			mv.addObject("imagePath", imagePath);
		}
		return mv;
	}
	
	@RequestMapping("/addorupdateNews")
	@ResponseBody
	public BasePageResult addorupdateNews(News entity)
	{
		if(newservice.saveOrUpdate(entity)) {
			return BasePageResultUtil.success();
		}
		return BasePageResultUtil.failResult(-1, "操作失败!");
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public BasePageResult delete(Integer id) {
		if(newservice.delete(id)) {
			return BasePageResultUtil.success();
		}
		return BasePageResultUtil.failResult(-1, "操作失败!");
	}
	
	
	@RequestMapping("/NewsIndex")
	public ModelAndView NewsIndex() {
		ModelAndView mv = new ModelAndView("backstage/news/index");
		return mv;
	}
	
	/*
	 * 测试页面
	 */
	@RequestMapping("/test")
	public ModelAndView test() {
		News entity = newservice.selectByprimerykey(4);
		ModelAndView mv = new ModelAndView("frontView/test");
		mv.addObject("entity", entity);
		return mv;
	}
	
}
