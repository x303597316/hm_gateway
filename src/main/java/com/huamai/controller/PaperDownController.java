package com.huamai.controller;

import com.huamai.entity.Paper;
import com.huamai.service.PaperDownService;
import com.huamai.service.PaperService;
import com.huamai.util.BasePageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
@RequestMapping("/some")
public class PaperDownController {
	@Autowired
	private PaperDownService paperDownService;
	
	@RequestMapping("/source")
	public ModelAndView goPaper() {
		return new ModelAndView("backstage/paper/paperDownList");
	}
	
	@RequestMapping("/addAndUpdate")
	public ModelAndView addAndUpdate(@RequestParam Map<String,Object> map) {
		ModelAndView model = new ModelAndView("backstage/paper/paperDownEdit");
		if(map!=null) {
			Map<String,Object> mp = paperDownService.selectByPrimaryKey(map);
			model.addObject("entity",mp);
		}
		return model;
	}
	
	
	@RequestMapping("/paperList")
	@ResponseBody
	public BasePageResult selectAllPaper(@RequestParam Map<String, String> map) {
		return paperDownService.selectAllPaper(map);
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public int deleteByPrimaryKey(@RequestParam Map<String, String> map) {
		return paperDownService.deleteByPrimaryKey(map);
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public int insertSelective(@RequestParam Map<String, String> map) {
		return paperDownService.insertSelective(map);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int updateByPrimaryKeySelective(@RequestParam Map<String, String> map) {
		return paperDownService.updateByPrimaryKeySelective(map);
	}
}
