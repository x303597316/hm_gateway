package com.huamai.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huamai.service.PaperService;
import com.huamai.util.BasePageResult;

@Controller
@RequestMapping("frontview/mobile")
public class PaperMobileController {
	@Resource
	private PaperService paperService;
	/**
	 * 跳转技术支持
	 * @return
	 */
	@RequestMapping("toPaper")
	public String toPaper(HttpServletRequest request , HttpServletResponse response, Model model) {
		model.addAttribute("type", "1");
		return "frontView/jszc";
	}
	/**
	 * 跳转软件下载
	 * @return
	 */
	@RequestMapping("toruanjian")
	public String toruanjian(HttpServletRequest request , HttpServletResponse response, Model model) {
		model.addAttribute("type", "2");
		return "frontView/jszc";
	}
	/**
	 * 跳转常见问题
	 * @return
	 */
	@RequestMapping("toProblem")
	public String toProblem(HttpServletRequest request , HttpServletResponse response, Model model) {
		model.addAttribute("type", "3");
		return "frontView/jszc";
	}
	/**
	 * 查询技术支持数据
	 * @param map
	 * @return
	 */
	@RequestMapping("/paperList")
	@ResponseBody
	public BasePageResult selectAllPaper(@RequestParam Map<String, String> map) {
		return paperService.selectAllPaper(map);
	}
}
