package com.huamai.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huamai.entity.VideoData;
import com.huamai.service.VideoDataService;
import com.huamai.util.BasePageResult;

@Controller
@RequestMapping("/Video")
public class VideoController {
	@Autowired
	private VideoDataService videoDataService;
	@RequestMapping("/goVideo")
	public ModelAndView goVideo(){
		return new ModelAndView("backstage/video/videoIndex");
	}
	
	@RequestMapping("/addAndUpdate")
	public ModelAndView addVideo(String id){
		ModelAndView model = new ModelAndView("backstage/video/videoEdit");
		if(id!=null && id != "") {
			Integer key = Integer.parseInt(id);
			VideoData entity = videoDataService.selectByPrimaryKey(key);
			model.addObject("entity",entity);
		}
		return model;
	}
	
	@RequestMapping("/videoList")
	@ResponseBody
	public BasePageResult selectAllVideo(@RequestParam Map<String, String> map) {
		return videoDataService.selectAllVideo(map);
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public int deleteByPrimaryKey(Integer id) {
		return videoDataService.deleteByPrimaryKey(id);
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public int insertSelective(VideoData record) {
		return videoDataService.insertSelective(record);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int updateByPrimaryKeySelective(VideoData record) {
		return videoDataService.updateByPrimaryKeySelective(record);
	}

	
}
