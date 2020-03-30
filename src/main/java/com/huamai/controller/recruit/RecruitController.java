package com.huamai.controller.recruit;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huamai.entity.Recruit;
import com.huamai.service.RecruitService;
import com.huamai.util.BasePageResult;
@Controller
@RequestMapping("/recruit")
public class RecruitController {
	Logger logger = LoggerFactory.getLogger(RecruitController.class);
	@Resource
	private RecruitService recruitService;
	/**
	 * 招聘菜单
	 * @author Administrator
	 *
	 */
	@RequestMapping("/toSchoolPage")
	public String toSchoolPage(HttpServletRequest request , HttpServletResponse response, Model model) {
		model.addAttribute("id", 0);
		return "backstage/recruit/index";
	}
	/**
	 * 招聘菜单
	 * @author Administrator
	 *
	 */
	@RequestMapping("/toSheHuiPage")
	public String toSheHuiPage(HttpServletRequest request ,HttpServletResponse response, Model model) {
		model.addAttribute("id", 1);
		return "backstage/recruit/index";
	}
	
	/**
	 * 跳转编辑或添加页面
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("toAddRecruit")
	public String toAddRecruit(HttpServletRequest request ,HttpServletResponse response,Model model) {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		if(StringUtils.isNotEmpty(id)) {
			Recruit recruit = recruitService.recruit(Integer.parseInt(id));
			model.addAttribute("recruit", recruit);
		}
		if(StringUtils.isNotEmpty(type)) {
			model.addAttribute("type", type);
		}
		return "backstage/recruit/recruitEdit";
	}
	
	
	@RequestMapping("recruitList")
	@ResponseBody
	public BasePageResult recruitList(@RequestParam Map<String, Object> param,HttpServletRequest request ,HttpServletResponse response){
		BasePageResult basePageResult = new BasePageResult();
		String type = request.getParameter("type");
		param.put("type",Integer.parseInt(type));
		try {
			logger.info("RecruitController indexList 查询用户param："+param);
			basePageResult = recruitService.recruitList(param);
			logger.info("BookController indexList 查询返回："+basePageResult.getMsg());
    	} catch (Exception e) {
    		logger.error("RecruitController indexList error:", e);
			e.printStackTrace();
		}
		return basePageResult;
	}
	
	@RequestMapping("addRecruit")
	@ResponseBody
	public Map<String,String> addRecruit(@ModelAttribute("recruit") Recruit recruit,HttpServletRequest request ,HttpServletResponse response){
		Integer id = recruit.getId();
		Map<String,String> map = new HashMap<String,String>();
		if(id != null) {
			int n = recruitService.updateRecruit(recruit);
			if(n > 0) {
				map.put("code", "0");
				map.put("msg", "修改成功");
			}else {
				map.put("code", "1");
				map.put("msg", "修改失败");
			}
		}else {
			int n = recruitService.insertRecruit(recruit);
			if(n > 0) {
				map.put("code", "0");
				map.put("msg", "添加成功");
			}else {
				map.put("code", "1");
				map.put("msg", "添加失败");
			}
		}
		return map;
		
	}
	@RequestMapping("deleteRecruit")
	@ResponseBody
	public Map<String,String> deleteRecruit(HttpServletRequest request ,HttpServletResponse response){
		String id = request.getParameter("id");
		int n = recruitService.deleteRecruit(Integer.parseInt(id));
		Map<String,String> map = new HashMap<String,String>();
		if(n > 0) {
			map.put("code", "0");
			map.put("msg", "删除成功");
		}else {
			map.put("code", "1");
			map.put("msg", "删除失败");
		}
		return map;
	}
}
