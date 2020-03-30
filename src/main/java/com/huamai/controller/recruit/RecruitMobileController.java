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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huamai.entity.Recruit;
import com.huamai.service.RecruitService;
import com.huamai.util.BasePageResult;

@Controller
@RequestMapping("frontview/mobile")
public class RecruitMobileController {
	Logger logger = LoggerFactory.getLogger(RecruitController.class);
	@Resource
	private RecruitService recruitService;
	/**
	 * 学校招聘
	 * @author Administrator
	 *
	 */
	@RequestMapping("/toZXNS")
	public String toZXNS(HttpServletRequest request , HttpServletResponse response, Model model) {
		//判断区分社会和校区
		model.addAttribute("info", 0);
		return "frontView/zxns";
	}
	/**
	 * 学校招聘
	 * @author Administrator
	 *
	 */
	@RequestMapping("/toSchoolPage")
	public String toSchoolPage(HttpServletRequest request , HttpServletResponse response, Model model) {
		//type类型 社会
		model.addAttribute("id", 0);
		//判断区分社会和校区
		model.addAttribute("info", 1);
		return "frontView/zxns";
	}
	
	/**
	 * 社会招聘
	 * @author Administrator
	 *
	 */
	@RequestMapping("/toSheHuiPage")
	public String toSheHuiPage(HttpServletRequest request ,HttpServletResponse response, Model model) {
		//type类型 社会
		model.addAttribute("id", 1);
		//判断区分社会和校区
		model.addAttribute("info", 2);
		return "frontView/zxns";
	}
	
	@RequestMapping(value = "recruitList", method = RequestMethod.POST)
	@ResponseBody
	public BasePageResult recruitList(@RequestParam Map<String, Object> param,HttpServletRequest request ,HttpServletResponse response){
		BasePageResult basePageResult = new BasePageResult();
		String type = request.getParameter("type");
		param.put("type",Integer.parseInt(type));
		try {
			logger.info("RecruitMobileController indexList 查询用户param："+param);
			basePageResult = recruitService.recruitList(param);
			logger.info("BookController indexList 查询返回："+basePageResult.getMsg());
    	} catch (Exception e) {
    		logger.error("RecruitMobileController indexList error:", e);
			e.printStackTrace();
		}
		return basePageResult;
	}
	
	/**
	  *         招聘信息详情
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping("recruitDetail")
	@ResponseBody
	public Map<String, Object> toAddRecruit(HttpServletRequest request ,HttpServletResponse response,Model model) {
		String id = request.getParameter("id");
		Map<String, Object> map = new HashMap<>();
		if(StringUtils.isNotEmpty(id)) {
			Recruit recruit = recruitService.recruit(Integer.parseInt(id));
			if(null != recruit) {
				map.put("recruit", recruit);
				map.put("code", 0);
				map.put("msg", "查询成功");
			}else {
				map.put("code", 1);
				map.put("msg", "数据为空");
			}
		}else {
			map.put("code", 1);
			map.put("msg", "数据为空");
		}
		return map;
	}
}
