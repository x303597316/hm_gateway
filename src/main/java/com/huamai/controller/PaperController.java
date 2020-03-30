package com.huamai.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.entity.Paper;
import com.huamai.service.PaperService;
import com.huamai.util.BasePageResult;

@Controller
@RequestMapping("/Paper")
public class PaperController {
	@Autowired
	private PaperService paperService;
	
	@RequestMapping("/goPaper")
	public ModelAndView goPaper() {
		return new ModelAndView("backstage/paper/paperList");
	}
	
	@RequestMapping("/addAndUpdate")
	public ModelAndView addAndUpdate(Integer id) {
		ModelAndView model = new ModelAndView("backstage/paper/paperEdit");
		if(id!=null) {
			Paper entity = paperService.selectByPrimaryKey(id);
			model.addObject("entity",entity);
		}
		return model;
	}
	
	
	@RequestMapping("/paperList")
	@ResponseBody
	public BasePageResult selectAllPaper(@RequestParam Map<String, String> map) {
		return paperService.selectAllPaper(map);
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public int deleteByPrimaryKey(Integer id) {
		return paperService.deleteByPrimaryKey(id);
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public int insertSelective(Paper record) {
		return paperService.insertSelective(record);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int updateByPrimaryKeySelective(Paper record) {
		return paperService.updateByPrimaryKeySelective(record);
	}
}
